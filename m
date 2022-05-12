Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE0F524E45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 15:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242326AbiELN2Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 09:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345932AbiELN2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 09:28:23 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CCA606E5;
        Thu, 12 May 2022 06:28:21 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tomeu)
        with ESMTPSA id F379F1F4556A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1652362099;
        bh=P6KXXhLWhwwDciwvFbZefB7qc8KqyBrUxi0cxEsXUEw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=YezVes2VhgBEsQVdrqfBV5205Bd5u8APQWwe/hTBljiCuNKVZcLaQXnZhg7EY/jC/
         cL7aLOZRMLwEeUy4/MRLPYa7ngAl00V7mnY9lh72DyPSRT/4YkQbMGl5HnSLALgqKX
         n6H/xCIuu19ihP+ijGa+yJarJ2U7D4rg16cBxxl2JpwvloeYd+xWh4sjtZp8XvHWCz
         WUC3rNj7pU4woyO3B+xCedDhGHb1G/Rj/VR8OwKzpO8s9fcsRvfctr+zWeKcr/VAPT
         OeTwdCk7DMYhi2rMsvqH3Fs3Fz5cOn2Q9Wsiav2CpwUW3iFhCeLFNDvjWSW8EfjLvD
         223EZVGkQDCuw==
Subject: Re: [Freedreno] [RFC v2] drm/msm: Add initial ci/ subdirectory
To:     Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <e4e03cd8-3ebc-e5e1-e7d0-6bdc038049b5@quicinc.com>
 <CAF6AEGueadnRMiatO3MoHS+NTQ1o1sgcV0cVjJM3iu-6JUNmNw@mail.gmail.com>
 <CAKMK7uGRuCZwF6m02tcxxrgQGaijsYaNkowjxR+cw0JM3UpDkQ@mail.gmail.com>
 <CAF6AEGthpxPLxyt_i-aUFgW485hA5qw+xXcJ3gKQUJ+fM=ZBhg@mail.gmail.com>
From:   Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <79d79110-9fbc-0e96-d17e-68a1f8f2c224@collabora.com>
Date:   Thu, 12 May 2022 15:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGthpxPLxyt_i-aUFgW485hA5qw+xXcJ3gKQUJ+fM=ZBhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/11/22 7:46 PM, Rob Clark wrote:
> On Wed, May 11, 2022 at 10:12 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Tue, 10 May 2022 at 22:26, Rob Clark <robdclark@gmail.com> wrote:
>>>
>>> On Tue, May 10, 2022 at 12:39 PM Jessica Zhang
>>> <quic_jesszhan@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 5/10/2022 7:13 AM, Tomeu Vizoso wrote:
>>>>> And use it to store expectations about what the drm/msm driver is
>>>>> supposed to pass in the IGT test suite.
>>>>>
>>>>> Also include a configuration file that points to the out-of-tree CI
>>>>> scripts.
>>>>>
>>>>> By storing the test expectations along the code we can make sure both
>>>>> stay in sync with each other, and so we can know when a code change
>>>>> breaks those expectations.
>>>>>
>>>>> This will allow all contributors to drm/msm to reuse the infrastructure
>>>>> already in gitlab.freedesktop.org to test the driver on several
>>>>> generations of the hardware.
>>>>>
>>>>> v2:
>>>>>     - Fix names of result expectation files to match SoC
>>>>>     - Don't execute tests that are going to skip on all boards
>>>>>
>>>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>>>> ---
>>>>>    Documentation/gpu/msm_automated_testing.rst   |  70 +++++++++
>>>>>    drivers/gpu/drm/msm/ci/gitlab-ci.yml          |  11 ++
>>>>>    drivers/gpu/drm/msm/ci/msm.testlist           | 148 ++++++++++++++++++
>>>>>    .../gpu/drm/msm/ci/msm_apq8016_results.txt    | 140 +++++++++++++++++
>>>>>    .../gpu/drm/msm/ci/msm_apq8096_results.txt    | 140 +++++++++++++++++
>>>>>    drivers/gpu/drm/msm/ci/msm_sc7180_results.txt | 141 +++++++++++++++++
>>>>>    drivers/gpu/drm/msm/ci/msm_sdm845_results.txt | 141 +++++++++++++++++
>>>>>    7 files changed, 791 insertions(+)
>>>>>    create mode 100644 Documentation/gpu/msm_automated_testing.rst
>>>>>    create mode 100644 drivers/gpu/drm/msm/ci/gitlab-ci.yml
>>>>>    create mode 100644 drivers/gpu/drm/msm/ci/msm.testlist
>>>>>    create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8016_results.txt
>>>>>    create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8096_results.txt
>>>>>    create mode 100644 drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
>>>>>    create mode 100644 drivers/gpu/drm/msm/ci/msm_sdm845_results.txt
>>>>>
> 
> [snip]
> 
>>>>> diff --git a/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt b/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
>>>>> new file mode 100644
>>>>> index 000000000000..01f7b4b399b5
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
>>>>> @@ -0,0 +1,141 @@
>>>>> +igt@core_auth@getclient-simple,dmesg-warn
>>>>> +igt@core_auth@getclient-master-drop,pass
>>>>> +igt@core_auth@basic-auth,pass
>>>>> +igt@core_auth@many-magics,pass
>>>>> +igt@core_getclient,pass
>>>>> +igt@core_getstats,pass
>>>>> +igt@core_getversion,pass
>>>>> +igt@core_setmaster_vs_auth,pass
>>>>> +igt@drm_read@invalid-buffer,pass
>>>>> +igt@drm_read@fault-buffer,pass
>>>>> +igt@drm_read@empty-block,pass
>>>>> +igt@drm_read@empty-nonblock,pass
>>>>> +igt@drm_read@short-buffer-block,pass
>>>>> +igt@drm_read@short-buffer-nonblock,pass
>>>>> +igt@drm_read@short-buffer-wakeup,pass
>>>>> +igt@kms_addfb_basic@unused-handle,pass
>>>>> +igt@kms_addfb_basic@unused-pitches,pass
>>>>> +igt@kms_addfb_basic@unused-offsets,pass
>>>>> +igt@kms_addfb_basic@unused-modifier,pass
>>>>> +igt@kms_addfb_basic@legacy-format,dmesg-warn
>>>>> +igt@kms_addfb_basic@no-handle,pass
>>>>> +igt@kms_addfb_basic@basic,pass
>>>>> +igt@kms_addfb_basic@bad-pitch-0,pass
>>>>> +igt@kms_addfb_basic@bad-pitch-32,pass
>>>>> +igt@kms_addfb_basic@bad-pitch-63,pass
>>>>> +igt@kms_addfb_basic@bad-pitch-128,pass
>>>>> +igt@kms_addfb_basic@bad-pitch-256,pass
>>>>> +igt@kms_addfb_basic@bad-pitch-1024,pass
>>>>> +igt@kms_addfb_basic@bad-pitch-999,pass
>>>>> +igt@kms_addfb_basic@bad-pitch-65536,pass
>>>>> +igt@kms_addfb_basic@size-max,pass
>>>>> +igt@kms_addfb_basic@too-wide,pass
>>>>> +igt@kms_addfb_basic@too-high,dmesg-warn
>>>>
>>>> For test results on Trogdor, is is possible to have them be
>>>> success/fail/skip only?
>>>>
>>>> Results such as dmesg-warn/dmesg-fail are igt_runner specific and
>>>> because there isn't support for igt_runner on ChromeOS, they will be
>>>> difficult to replicate and debug.
>>>
>>> Actually, I wonder if it would be better to just treat
>>> dmesg-warn/dmesg-fail as pass/fail?  I'd noticed some flakes on
>>> rockchip which looked just like unrelated dmesg msg which just
>>> happened to show up while the test was running.
>>
>> This is kinda the reason behind standardizing on drm dmesg logging, so
>> that we have some chances at filtering stuff out. Not sure that's a
>> good idea, since when your entire box splats and lockdep is dead, then
>> continuing to run drm tests is still fairly pointless.
> 
> I'm not sure if we are using it yet for drm-ci, but for mesa-ci we
> monitor dmesg (over serial port, from the controller) for splats, so
> we already have the tech for restarting or aborting the CI run.  We
> don't need igt-runner to tell us.

Yep, these scripts are currently being used as-is from Mesa, so we got 
that functionality for free.

>> I think this is another reason why trying at least to standardize this
>> stuff over drivers would be pretty good idea.
>>
>>> Additionally, some of the tests, like msm_recovery, are *expected* to
>>> generate some dmesg spam since they are intentionally triggering GPU
>>> hangs to test the recovery mechanism.
>>
>> Uh I don't like that. It just allows userspace to spam dmesg, which
>> doesn't seem like a great idea. That's at least why i915 dumps these
>> at a lower level, and in the past had a special "I'm going to whack
>> the gpu real hard expect hangs" knob in debugfs.
>>
>> Having tests which intentionally spam dmesg above info level isn't
>> really good since then you need endless amounts of test-specific
>> encoding of what is considered a success and what not. Like when a
>> backmerge breaks a testcases which is already at dmesg-fail, is that
>> bad or not? Probably bad, but was the situation before that really
>> good or already kinda on fire?
> 
> I guess I could add some debugfs knobs to squelch the dmesg msgs on
> gpu hangs.  In the normal case, I'd prefer that gpu hangs are not
> silent.. since that is something we get in feedback reports if a user
> (or dogfooder) reports a bug.
> 
> The rockchip case I mentioned was some unrelated dmesg about
> linktraining failing.. presumably because there was no display
> attached?  IDK, I didn't look too closely.  But my point is we could
> be getting unrelated and asynchronous dmesg spam, even from other
> kernel subsystems.  Letting that be part of the test results just
> sounds like asking for flakes.

I think some drivers are currently a bit too buggy to behave reliably 
under CI unless one reduces coverage (rockchip on rk3399, for example). 
And some other drivers (in other subsystems as well) could do with a 
review of what they print to the console. I guess these are things we 
could and probably should fix?

Cheers,

Tomeu

> BR,
> -R
> 
>> -Daniel
>>
>>> BR,
>>> -R
>>>
