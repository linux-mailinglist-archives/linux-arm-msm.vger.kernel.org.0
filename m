Return-Path: <linux-arm-msm+bounces-34230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7955399BDCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 04:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12DD41F21DB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 02:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549DA3D97A;
	Mon, 14 Oct 2024 02:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LfNjL/iK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AB82D047;
	Mon, 14 Oct 2024 02:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728873460; cv=none; b=LBSLxI6kVHQqbHWa+kIU/vtYNx+zqGYY/g9YYqFA0g7eeFgngk+t+Ivo2tocg9Zfu+c/tO6r6ojodjZx93gJVVAxb3+I+HM9FEqnW7tD7txTDE4M3uR3FYpwroo3Gth+FFfwvvb00TRWJNgQy8UCME2P72nw+R7GhNdJ0W9HknM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728873460; c=relaxed/simple;
	bh=XLRTE3U7nubzU4CD5qzrO4xBAIypZc1gjzx+jFwlTzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AiLkucbF74b8Xjvb3Br2o+nZ1hTXI0I+l/9WBE2jbvaFToz0uVPlFexRT3vqm/RC5WmxzIGyZdPlpts+zZZXX5hY8FQoF/wfKd6/DGSjdafKQOEZzQ4wI/enXPspI6ACpKU1K+H1BJSi9AYNlkWq+DIXDKkA6mA22k4kzrqyc+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LfNjL/iK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DMDnqL002442;
	Mon, 14 Oct 2024 02:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f1H0TnejxVh6i6GpOuV0FVQkBI1xjimoU9D5YX/ySkA=; b=LfNjL/iKmU0TnW8s
	o4bxiY5bM7pYtehKCPjTZzf79f75dF1zPLLKQuXIZEQRu1ZxlGL+MNXaJRm+jpkm
	xMyowFGniZp3duZpu7arQQTbBqCTaygcVSkfOdLtdcX3P7mEAjOWGmu7PjWbV8uA
	ckQrzb9/WklnuYSgb154Vv8ereRw3XTyWqrEQ8s44BG7aMSp7TiQIlPlJSaA8LRy
	SXXrglcR3cNQJZtOQodXyFYib3Nx3dNqNtrV8Be5YDVPkvj56kD+KIkzPxSCZdB1
	6dOGOsua3ci/t4++ZrykzN/JjEL3G9fLnSwsEO3ZY84CtEtYyQ0O00C/P1FaHdVC
	pGMZJQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427efnb8a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 02:37:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E2bNbO009474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 02:37:23 GMT
Received: from [10.110.109.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 13 Oct
 2024 19:37:22 -0700
Message-ID: <0ca707a4-bd5f-4a31-a424-f466afa08e0d@quicinc.com>
Date: Sun, 13 Oct 2024 19:37:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: don't always activate merge_3d block
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jessica Zhang
	<quic_jesszhan@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241011-merge3d-fix-v2-1-2082470f573c@quicinc.com>
 <kah73euzauizsxvcrgmfsatshfe4pytgb7xe5iprtajg7abhsv@l7jdcxza5gd2>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <kah73euzauizsxvcrgmfsatshfe4pytgb7xe5iprtajg7abhsv@l7jdcxza5gd2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DOw1EfYM3TfLltUrxDkJqjoVFw-0Yvjr
X-Proofpoint-ORIG-GUID: DOw1EfYM3TfLltUrxDkJqjoVFw-0Yvjr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140017

Hi Dmitry

On 10/13/2024 5:20 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 11, 2024 at 10:25:13AM -0700, Jessica Zhang wrote:
>> Only enable the merge_3d block for the video phys encoder when the 3d
>> blend mode is not *_NONE since there is no need to activate the merge_3d
>> block for cases where merge_3d is not needed.
>>
>> Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
>> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>> Changes in v2:
>> - Added more detailed commit message
>> - Link to v1: https://lore.kernel.org/r/20241009-merge3d-fix-v1-1-0d0b6f5c244e@quicinc.com
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> LGTM now. Please clarify, is there any dependency between this patch and
> [1]
> 

No dependency as such. Both are tackling similar issues though. One for 
video mode and the other for writeback thats all. Namely:

1) We should not be enabling merge_3d block if two LMs are not being 
used as that block needs to be enabled only to merge two streams. If its 
always enabled, its incorrect programming because as per the docs its 
mentioned "if required". Even if thats not causing issues, I would 
prefer not to enable it always due to the "if required" clause and also 
we dont need to enable a hardware sub-block unnecessarily.

2) We should be flushing the merge_3d only if its active like Jessica 
wrote in the commit message of [1]. Otherwise, the flush bit will never 
be taken by hardware leading to the false timeout errors.

It has been sent as two patches as one is for video mode and the other 
for writeback and for writeback it includes both (1) and (2) together in 
the same patch.

I thought this separation is fine, if we need to squash it, let me know.

Thanks

Abhinav

> [1] https://lore.kernel.org/dri-devel/20241009-mode3d-fix-v1-1-c0258354fadc@quicinc.com/
> 
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> index ba8878d21cf0e1945a393cca806cb64f03b16640..c5e27eeaff0423a69fad98122ffef7e041fbc68e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> @@ -302,7 +302,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>>   	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>   	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>> -	if (phys_enc->hw_pp->merge_3d)
>> +	if (intf_cfg.mode_3d && phys_enc->hw_pp->merge_3d)
>>   		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>>   
>>   	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>>
>> ---
>> base-commit: a20a91fb1bfac5d05ec5bcf9afe0c9363f6c8c93
>> change-id: 20240828-merge3d-fix-1a8d005e3277
>>
>> Best regards,
>> -- 
>> Jessica Zhang <quic_jesszhan@quicinc.com>
>>
> 

