Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA427986F4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Sep 2023 14:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjIHMV7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Sep 2023 08:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjIHMV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Sep 2023 08:21:59 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3E6DF1BC5
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Sep 2023 05:21:52 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB6EBD75;
        Fri,  8 Sep 2023 05:22:29 -0700 (PDT)
Received: from [10.57.5.180] (unknown [10.57.5.180])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AB3D3F67D;
        Fri,  8 Sep 2023 05:21:49 -0700 (PDT)
Message-ID: <8c5035d7-1a65-774c-5490-87cdbcb25542@arm.com>
Date:   Fri, 8 Sep 2023 13:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] iommu/arm-smmu-qcom: NULL pointer check for driver data
Content-Language: en-GB
To:     Aravind Vijayakumar <quic_aprasann@quicinc.com>,
        Rob Clark <robdclark@chromium.org>
Cc:     will@kernel.org, joro@8bytes.org, dmitry.baryshkov@linaro.org,
        quic_bjorande@quicinc.com, konrad.dybcio@linaro.org,
        quic_eberman@quicinc.com, quic_psodagud@quicinc.com,
        quic_rvishwak@quicinc.com, quic_saipraka@quicinc.com,
        quic_molvera@quicinc.com, marijn.suijten@somainline.org,
        mani@kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
References: <20230816225509.11070-1-quic_aprasann@quicinc.com>
 <CAJs_Fx7132o3iHDH0ZR7L9G69o2YV2-jC0v15shQcEhH6=-6RA@mail.gmail.com>
 <c06a31fd-e3b5-1f58-9e4f-7fafd8aa3f28@quicinc.com>
 <CAJs_Fx464vFbfLaaWWs2Y0pTmhXrJS=AWFTwEyQjifJoU72rCQ@mail.gmail.com>
 <ead35ae9-b9cf-4f3f-e967-7d66a88fb8d5@quicinc.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <ead35ae9-b9cf-4f3f-e967-7d66a88fb8d5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-09-08 06:17, Aravind Vijayakumar wrote:
> 
> On 8/29/2023 7:30 AM, Rob Clark wrote:
>> On Mon, Aug 28, 2023 at 2:35 PM Aravind Vijayakumar
>> <quic_aprasann@quicinc.com> wrote:
>>>
>>> On 8/16/2023 6:01 PM, Rob Clark wrote:
>>>> On Wed, Aug 16, 2023 at 3:55 PM Aravind Vijayakumar
>>>> <quic_aprasann@quicinc.com> wrote:
>>>>> The driver_data is NULL when qcom_adreno_smmu_init_context()
>>>>> is called before the dev_set_drvdata() from the client driver
>>>>> and is resulting in kernel crash.
>>>>>
>>>>> So add a null pointer check to handle the scenario
>>>>> where the client driver for the GPU SMMU device would
>>>>> be setting the driver data after the smmu client device
>>>>> probe is done and not necessarily before that. The function
>>>>> qcom_adreno_smmu_init_context() assumes that the client
>>>>> driver always set the driver data using dev_set_drvdata()
>>>>> before the smmu client device probe, but this assumption
>>>>> is not always true.
>>>>>
>>>>> Signed-off-by: Aravind Vijayakumar <quic_aprasann@quicinc.com>
>>>>> ---
>>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
>>>>>    1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c 
>>>>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> index c71afda79d64..5323f82264ca 100644
>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>> @@ -231,6 +231,9 @@ static int qcom_adreno_smmu_init_context(struct 
>>>>> arm_smmu_domain *smmu_domain,
>>>>>            */
>>>>>
>>>>>           priv = dev_get_drvdata(dev);
>>>>> +       if (!priv)
>>>>> +               return 0;
>>>> could this -EPROBE_DEFER instead, or something like that?  I think you
>>>> patch as proposed would result in per-process gpu pgtables silently
>>>> failing
>>>>
>>>> BR,
>>>> -R
>>> Thanks for the review comments. Returning -EPROBE_DEFER wont work
>>> because the probe of the client driver (which sets the driver data) will
>>> never get triggered. However, the probe of the client driver succeeds if
>>> we return -ENODATA. would that be acceptable?
>> I _think_ so.. I need to page back in the sequence of how this works,
>> but I do have some warn_on's in drm/msm to complain loudly if we don't
>> get per-process pgtables.  I'd be interested to see the callstack
>> where you hit this issue.  From what I remember the sequence should
>> be:
>>
>> 1) before the client dev probes, arm-smmu probes and attaches the
>> dma-api managed iommu_domain (which IIRC should be an identity domain,
>> and is otherwise unused).. at this point drvdata is NULL
>> 2) the drm/msm can probe
>> 3) at some point later when GPU fw is avail the GPU is loaded, drvdata
>> is set, and we start creating and attaching the iommu_domain's that
>> are actually used (one for kernel context and one each for userspace
>> processes using the GPU
>>
>> I guess maybe if you are hitting this case of NULL drvdata, then you
>> aren't getting an identity context for the dma-api managed
>> iommu_domain?
>>
>> BR,
>> -R
>>
> Yes, there are some warn_ons in io-pgtable.c, which have helped a lot 
> during debugging. The following is the call stack when we are hitting 
> the issue:
> 
>    qcom_adreno_smmu_init_context+0x28/0x100
>    arm_smmu_init_domain_context+0x1fc/0x4cc
>    arm_smmu_attach_dev+0x7c/0x410
>    __iommu_attach_device+0x28/0x110
>    iommu_probe_device+0x98/0x144
>    of_iommu_configure+0x1f0/0x278
>    of_dma_configure_id+0x15c/0x320
>    platform_dma_configure+0x24/0x90
>    really_probe+0x138/0x39c
>    __driver_probe_device+0x114/0x190
>    device_driver_attach+0x4c/0xac
>    bind_store+0xb8/0x110

OK, so it looks like you are indeed getting a non-identity default 
domain as Rob suspected. I guess that means qcom_smmu_client_of_match 
needs updating for this platform? (In which case, maybe a WARN() here to 
point in that direction might be handy as well?)

Thanks,
Robin.

> 
> This is the call stack during platform_driver_register() , if there is 
> no NULL check then the initial probe crashes, if there is NULL check, 
> instead of crashing, the really_probe returns and we can call 
> of_dma_configure again from the driver probe after setting the driver 
> data. Please let me know if there is any concerns?
> 
> Regards,
> 
> Aravind
> 
>>> Regards,
>>>
>>> Aravind
>>>
>>>>> +
>>>>>           priv->cookie = smmu_domain;
>>>>>           priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>>>>>           priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
>>>>> -- 
>>>>> 2.40.1
>>>>>
