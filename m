Return-Path: <linux-arm-msm+bounces-23677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B2391317F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 04:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FA691C2189A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 02:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3B63D62;
	Sat, 22 Jun 2024 02:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d8F2+kw8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF6F15D1;
	Sat, 22 Jun 2024 02:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719021944; cv=none; b=VN7KzrB6uuIVd2d03WAPskdNqPyCcNLzm5mX1LolQURddf95EWWbrduUAu7qdE29NJ+mPZlE7IP1ugYtFeIZ7ZB5b4pzCeMuU6b1iByiEj7w2h4L7HL2AhKzcGgNZ1l5ErlkzZUBI1Rzuga/gT0KiAazY1F8hfidQ1vyx4cZ9uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719021944; c=relaxed/simple;
	bh=VLTF8oV8XrJF1SeegP0iGyaZAYAkFWrU43LnxFH43EE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=X4ctbfO6YhgohhFcuTHz/7uPDB4rO0T0boitNL19vnsZ/uakN8MjKGCofRG1dKu9MGvP7QSVzM91zutZK0A5lTDUCOCnOhvi+ouvJYG5SxUHjJ/bm3ByohqpTdVFBK/saSP5SV5drk7DFwXrnQb1/utSLMGruzh4QplkHfJ4vfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d8F2+kw8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45M1vnoj001615;
	Sat, 22 Jun 2024 02:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pG+x1Wr6JnwzdCj6ztjFT4CXiDADDvi6QjuVov91j7U=; b=d8F2+kw885/x4OqF
	DlhgCav8EzBduzd8KrCMqUDRsm7qiC0HSzIePHuQxDgJ0wZH321zfqDZI/le1jjh
	iEGjiXaIeLHSxsBMKCxCCo9TRfRJxrPPaRGZ+cWNkNi7B3NVyn/N0AKKnQHORbKp
	TXcuE3dl9lzTHBHK+EVi1VKk10zAPFMTKVbwrKtg7CbJIl0HdK21OcM8ZYqx6+2X
	MbpjEam9cxkZ3j6h2Ezkevd4ruqC/Ub+eZ56EfJUjS/t7GltSn5y7WaAK8wKzJzX
	uHOPXZACB/HrhXSnOdejONK5mqtEilHeku+nmRrLVYrzloIiQ5xClDyOT4GBpb7z
	BNmeHw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yw97uhf3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Jun 2024 02:05:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45M25MQ4024292
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Jun 2024 02:05:22 GMT
Received: from [10.110.82.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 19:05:16 -0700
Message-ID: <87c8d5cb-d5b5-ab6c-00d9-bae7f972d777@quicinc.com>
Date: Fri, 21 Jun 2024 19:05:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 1/4] drm/msm: register a fault handler for display mmu
 faults
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dianders@chromium.org>,
        <quic_jesszhan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
 <20240517233801.4071868-2-quic_abhinavk@quicinc.com>
 <uywsmpko7ttzqxtlw6i4n5y7zvny5xgdoxc66azbts7cx6vi5d@myrilzxtu7le>
 <355e5bee-a31b-6879-06ea-cf04ba2e179f@quicinc.com>
In-Reply-To: <355e5bee-a31b-6879-06ea-cf04ba2e179f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 74v68FNFQe1upmBy6tTgZMPpaVYh_G-N
X-Proofpoint-ORIG-GUID: 74v68FNFQe1upmBy6tTgZMPpaVYh_G-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_12,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406220011



On 6/21/2024 4:35 PM, Abhinav Kumar wrote:
> 
> 
> On 5/19/2024 1:38 AM, Dmitry Baryshkov wrote:
>> On Fri, May 17, 2024 at 04:37:56PM -0700, Abhinav Kumar wrote:
>>> In preparation to register a iommu fault handler for display
>>> related modules, register a fault handler for the backing
>>> mmu object of msm_kms.
>>>
>>> Currently, the fault handler only captures the display snapshot
>>> but we can expand this later if more information needs to be
>>> added to debug display mmu faults.
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/msm_kms.c | 25 +++++++++++++++++++++++++
>>>   1 file changed, 25 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_kms.c 
>>> b/drivers/gpu/drm/msm/msm_kms.c
>>> index af6a6fcb1173..62c8e6163e81 100644
>>> --- a/drivers/gpu/drm/msm/msm_kms.c
>>> +++ b/drivers/gpu/drm/msm/msm_kms.c
>>> @@ -200,6 +200,28 @@ struct msm_gem_address_space 
>>> *msm_kms_init_aspace(struct drm_device *dev)
>>>       return aspace;
>>>   }
>>> +static int msm_kms_fault_handler(void *arg, unsigned long iova, int 
>>> flags, void *data)
>>> +{
>>> +    struct msm_kms *kms = arg;
>>> +    struct msm_disp_state *state;
>>> +    int ret;
>>> +
>>> +    ret = mutex_lock_interruptible(&kms->dump_mutex);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    state = msm_disp_snapshot_state_sync(kms);
>>> +
>>> +    mutex_unlock(&kms->dump_mutex);
>>> +
>>> +    if (IS_ERR(state)) {
>>> +        DRM_DEV_ERROR(kms->dev->dev, "failed to capture snapshot\n");
>>> +        return PTR_ERR(state);
>>> +    }
>>> +
>>> +    return 0;
>>
>> Hmm, after reading the rest of the code, this means that we won't get
>> the error on the console. Could you please change this to -ENOSYS?
>>
> 
> I am perhaps missing something here. Are you referring to this 
> documentation?
> 
>   * Specifically, -ENOSYS is returned if a fault handler isn't installed
>   * (though fault handlers can also return -ENOSYS, in case they want to
>   * elicit the default behavior of the IOMMU drivers).
>   */
> int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
>                         unsigned long iova, int flags)
> 
> Doesnt this mean ENOSYS is when fault handler is not installed?
> 
> Because the console print will come if we return 0?
> 
>          if (!report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {
>                  dev_err_ratelimited(ctx->dev,
>                                      "Unhandled context fault: fsr=0x%x, "
>                                      "iova=0x%016llx, fsynr=0x%x, cb=%d\n",
>                                      fsr, iova, fsynr, ctx->asid);
>          }
> 

I was checking the wrong place, you are correct.

I will return ENOSYS here.

Thanks.

>>> +}
>>> +
>>>   void msm_drm_kms_uninit(struct device *dev)
>>>   {
>>>       struct platform_device *pdev = to_platform_device(dev);
>>> @@ -261,6 +283,9 @@ int msm_drm_kms_init(struct device *dev, const 
>>> struct drm_driver *drv)
>>>           goto err_msm_uninit;
>>>       }
>>> +    if (kms->aspace)
>>> +        msm_mmu_set_fault_handler(kms->aspace->mmu, kms, 
>>> msm_kms_fault_handler);
>>> +
>>>       drm_helper_move_panel_connectors_to_head(ddev);
>>>       drm_for_each_crtc(crtc, ddev) {
>>> -- 
>>> 2.44.0
>>>
>>

