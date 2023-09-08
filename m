Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC2C79817C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Sep 2023 07:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233205AbjIHFSZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Sep 2023 01:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231911AbjIHFSZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Sep 2023 01:18:25 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA78E19AB
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 22:18:20 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3884j9IM023936;
        Fri, 8 Sep 2023 05:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3jmW1Gsudk5DFVRtx5UHj3kcbCASFchgPm9EOthqwxk=;
 b=h8XjzBXY0MBFM/6OhmHkSseM6fWNqR8Iv/nRypfSlWOy8TLxQJND3sm6CIors3x/z7Vs
 biK15MpdfcaVx3Ee7znQnP3QDeQ42ENYumrxDfcyOLaaaqBTQXY0djGgiZPUjBYJd4uN
 VocsN2WlS/L3/s3wod/LTi9IjV8VMm4o9u3QxdB5NE7lfNKo8uk2yEWYHji1FiRQMMI2
 cRPWy88Sf3roVLoed+chnj08FWtGGOqYbSIOGj5PCkZQXThHPP1VVUdsKfEdR4rSQYWC
 lAej9mygeRLKD0DbrwEK7b7QMi3GtTWWOGHtAAEAnpVyb2jPkqot/XTJnbSSKGDwJpJw 3w== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3syf5c1tk5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Sep 2023 05:17:56 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3885HtTj002049
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 8 Sep 2023 05:17:55 GMT
Received: from [10.110.23.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 7 Sep
 2023 22:17:53 -0700
Message-ID: <ead35ae9-b9cf-4f3f-e967-7d66a88fb8d5@quicinc.com>
Date:   Thu, 7 Sep 2023 22:17:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] iommu/arm-smmu-qcom: NULL pointer check for driver data
To:     Rob Clark <robdclark@chromium.org>
CC:     <will@kernel.org>, <joro@8bytes.org>, <robin.murphy@arm.com>,
        <dmitry.baryshkov@linaro.org>, <quic_bjorande@quicinc.com>,
        <konrad.dybcio@linaro.org>, <quic_eberman@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_rvishwak@quicinc.com>,
        <quic_saipraka@quicinc.com>, <quic_molvera@quicinc.com>,
        <marijn.suijten@somainline.org>, <mani@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
References: <20230816225509.11070-1-quic_aprasann@quicinc.com>
 <CAJs_Fx7132o3iHDH0ZR7L9G69o2YV2-jC0v15shQcEhH6=-6RA@mail.gmail.com>
 <c06a31fd-e3b5-1f58-9e4f-7fafd8aa3f28@quicinc.com>
 <CAJs_Fx464vFbfLaaWWs2Y0pTmhXrJS=AWFTwEyQjifJoU72rCQ@mail.gmail.com>
Content-Language: en-US
From:   Aravind Vijayakumar <quic_aprasann@quicinc.com>
In-Reply-To: <CAJs_Fx464vFbfLaaWWs2Y0pTmhXrJS=AWFTwEyQjifJoU72rCQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Qs_Dz-2A2LuwnlonNnB4AnFMwmwh0JGn
X-Proofpoint-ORIG-GUID: Qs_Dz-2A2LuwnlonNnB4AnFMwmwh0JGn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_02,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080046
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/29/2023 7:30 AM, Rob Clark wrote:
> On Mon, Aug 28, 2023 at 2:35 PM Aravind Vijayakumar
> <quic_aprasann@quicinc.com> wrote:
>>
>> On 8/16/2023 6:01 PM, Rob Clark wrote:
>>> On Wed, Aug 16, 2023 at 3:55 PM Aravind Vijayakumar
>>> <quic_aprasann@quicinc.com> wrote:
>>>> The driver_data is NULL when qcom_adreno_smmu_init_context()
>>>> is called before the dev_set_drvdata() from the client driver
>>>> and is resulting in kernel crash.
>>>>
>>>> So add a null pointer check to handle the scenario
>>>> where the client driver for the GPU SMMU device would
>>>> be setting the driver data after the smmu client device
>>>> probe is done and not necessarily before that. The function
>>>> qcom_adreno_smmu_init_context() assumes that the client
>>>> driver always set the driver data using dev_set_drvdata()
>>>> before the smmu client device probe, but this assumption
>>>> is not always true.
>>>>
>>>> Signed-off-by: Aravind Vijayakumar <quic_aprasann@quicinc.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> index c71afda79d64..5323f82264ca 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> @@ -231,6 +231,9 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>>            */
>>>>
>>>>           priv = dev_get_drvdata(dev);
>>>> +       if (!priv)
>>>> +               return 0;
>>> could this -EPROBE_DEFER instead, or something like that?  I think you
>>> patch as proposed would result in per-process gpu pgtables silently
>>> failing
>>>
>>> BR,
>>> -R
>> Thanks for the review comments. Returning -EPROBE_DEFER wont work
>> because the probe of the client driver (which sets the driver data) will
>> never get triggered. However, the probe of the client driver succeeds if
>> we return -ENODATA. would that be acceptable?
> I _think_ so.. I need to page back in the sequence of how this works,
> but I do have some warn_on's in drm/msm to complain loudly if we don't
> get per-process pgtables.  I'd be interested to see the callstack
> where you hit this issue.  From what I remember the sequence should
> be:
>
> 1) before the client dev probes, arm-smmu probes and attaches the
> dma-api managed iommu_domain (which IIRC should be an identity domain,
> and is otherwise unused).. at this point drvdata is NULL
> 2) the drm/msm can probe
> 3) at some point later when GPU fw is avail the GPU is loaded, drvdata
> is set, and we start creating and attaching the iommu_domain's that
> are actually used (one for kernel context and one each for userspace
> processes using the GPU
>
> I guess maybe if you are hitting this case of NULL drvdata, then you
> aren't getting an identity context for the dma-api managed
> iommu_domain?
>
> BR,
> -R
>
Yes, there are some warn_ons in io-pgtable.c, which have helped a lot 
during debugging. The following is the call stack when we are hitting 
the issue:

   qcom_adreno_smmu_init_context+0x28/0x100
   arm_smmu_init_domain_context+0x1fc/0x4cc
   arm_smmu_attach_dev+0x7c/0x410
   __iommu_attach_device+0x28/0x110
   iommu_probe_device+0x98/0x144
   of_iommu_configure+0x1f0/0x278
   of_dma_configure_id+0x15c/0x320
   platform_dma_configure+0x24/0x90
   really_probe+0x138/0x39c
   __driver_probe_device+0x114/0x190
   device_driver_attach+0x4c/0xac
   bind_store+0xb8/0x110

This is the call stack during platform_driver_register() , if there is 
no NULL check then the initial probe crashes, if there is NULL check, 
instead of crashing, the really_probe returns and we can call 
of_dma_configure again from the driver probe after setting the driver 
data. Please let me know if there is any concerns?

Regards,

Aravind

>> Regards,
>>
>> Aravind
>>
>>>> +
>>>>           priv->cookie = smmu_domain;
>>>>           priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>>>>           priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
>>>> --
>>>> 2.40.1
>>>>
