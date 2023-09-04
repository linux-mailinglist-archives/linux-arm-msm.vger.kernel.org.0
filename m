Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A75179133C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 10:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351419AbjIDIWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Sep 2023 04:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjIDIWv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Sep 2023 04:22:51 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AF87CD8;
        Mon,  4 Sep 2023 01:22:47 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FDEA11FB;
        Mon,  4 Sep 2023 01:23:25 -0700 (PDT)
Received: from [10.57.92.217] (unknown [10.57.92.217])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D4543F8A4;
        Mon,  4 Sep 2023 01:22:43 -0700 (PDT)
Message-ID: <89ff07ec-d0b4-a984-3269-7d5647a6b007@arm.com>
Date:   Mon, 4 Sep 2023 09:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/6] drm/panfrost: Add fdinfo support GPU load metrics
Content-Language: en-GB
To:     =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, robh@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        healych@amazon.com, kernel@collabora.com
References: <20230824013604.466224-1-adrian.larumbe@collabora.com>
 <20230824013604.466224-3-adrian.larumbe@collabora.com>
 <23f38307-3246-28a9-f396-5660acb21a18@arm.com>
 <enzglusbu4anwaqyalsyan3bfzecbpxttnq5v2o65hun4foj7s@ql5byzj6krk2>
From:   Steven Price <steven.price@arm.com>
In-Reply-To: <enzglusbu4anwaqyalsyan3bfzecbpxttnq5v2o65hun4foj7s@ql5byzj6krk2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/08/2023 22:34, Adrián Larumbe wrote:
> On 31.08.2023 16:54, Steven Price wrote:
>> On 24/08/2023 02:34, Adrián Larumbe wrote:
>>> The drm-stats fdinfo tags made available to user space are drm-engine,
>>> drm-cycles, drm-max-freq and drm-curfreq, one per job slot.
>>>
>>> This deviates from standard practice in other DRM drivers, where a single
>>> set of key:value pairs is provided for the whole render engine. However,
>>> Panfrost has separate queues for fragment and vertex/tiler jobs, so a
>>> decision was made to calculate bus cycles and workload times separately.
>>>
>>> Maximum operating frequency is calculated at devfreq initialisation time.
>>> Current frequency is made available to user space because nvtop uses it
>>> when performing engine usage calculations.
>>>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> ---
>>>  drivers/gpu/drm/panfrost/panfrost_devfreq.c |  8 ++++
>>>  drivers/gpu/drm/panfrost/panfrost_devfreq.h |  3 ++
>>>  drivers/gpu/drm/panfrost/panfrost_device.h  | 13 ++++++
>>>  drivers/gpu/drm/panfrost/panfrost_drv.c     | 45 ++++++++++++++++++++-
>>>  drivers/gpu/drm/panfrost/panfrost_job.c     | 30 ++++++++++++++
>>>  drivers/gpu/drm/panfrost/panfrost_job.h     |  4 ++
>>>  6 files changed, 102 insertions(+), 1 deletion(-)
>>>
>>
>> [...]
>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> index a2ab99698ca8..3fd372301019 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> @@ -267,6 +267,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>>>  	job->requirements = args->requirements;
>>>  	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
>>>  	job->mmu = file_priv->mmu;
>>> +	job->priv = file_priv;
>>>  
>>>  	slot = panfrost_job_get_slot(job);
>>>  
>>> @@ -483,6 +484,14 @@ panfrost_open(struct drm_device *dev, struct drm_file *file)
>>>  		goto err_free;
>>>  	}
>>>  
>>> +	snprintf(panfrost_priv->fdinfo.engines[0].name, MAX_SLOT_NAME_LEN, "frg");
>>> +	snprintf(panfrost_priv->fdinfo.engines[1].name, MAX_SLOT_NAME_LEN, "vtx");
>>> +#if 0
>>> +	/* Add compute engine in the future */
>>> +	snprintf(panfrost_priv->fdinfo.engines[2].name, MAX_SLOT_NAME_LEN, "cmp");
>>> +#endif
>>
>> I'm not sure what names are best, but slot 2 isn't actually a compute slot.
>>
>> Slot 0 is fragment, that name is fine.
>>
>> Slot 1 and 2 are actually the same (from a hardware perspective) but the
>> core affinity of the two slots cannot overlap which means you need to
>> divide the GPU in two to usefully use both slots. The only GPU that this
>> actually makes sense for is the T628[1] as it has two (non-coherent)
>> core groups.
>>
>> The upshot is that slot 1 is used for all of vertex, tiling and compute.
>> Slot 2 is currently never used, but kbase will use it only for compute
>> (and only on the two core group GPUs).
> 
> I think I might've be rushed to draw inspiration for this from a comment in panfrost_job.c:
> 
> int panfrost_job_get_slot(struct panfrost_job *job)
> {
> 	/* JS0: fragment jobs.
> 	 * JS1: vertex/tiler jobs
> 	 * JS2: compute jobs
> 	 */
>          [...]
> }
> 
> Maybe I could rename the engine names to "fragment", "vertex-tiler" and "compute-only"?
> There's no reason why I would skimp on engine name length, and anything more
> descriptive would be just as good.

Yeah, those names are probably the best we're going to get. And I
certainly prefer the longer names.

>> Personally I'd be tempted to call them "slot 0", "slot 1" and "slot 2" -
>> but I appreciate that's not very helpful to people who aren't intimately
>> familiar with the hardware ;)
> 
> The downside of this is that both IGT's fdinfo library and nvtop will use the
> engime name for display, and like you said these numbers might mean nothing to
> someone who isn't acquainted with the hardware.

Indeed - I've spent way too much time with the hardware and there are
many subtleties so I tent to try to avoid calling them anything other
than "slot x" (especially when talking to hardware engineers). For
example a test that submits NULL jobs can submit them to any slot.
However, when you get beyond artificial tests then it is quite
consistent that slot 0=fragment, slot 1=vertex-tiler (and compute), slot
2=never used (except for compute on dual core groups).

Steve

>> Steve
>>
>> [1] And technically the T608 but that's even rarer and the T60x isn't
>> (yet) supported by Panfrost.

