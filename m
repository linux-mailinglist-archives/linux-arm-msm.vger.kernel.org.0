Return-Path: <linux-arm-msm+bounces-46014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB45A1AC01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 22:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C0D916B636
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 21:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E321C5F22;
	Thu, 23 Jan 2025 21:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AXV9eC0e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC1616EC19;
	Thu, 23 Jan 2025 21:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737668486; cv=none; b=iyVPviX5yuo+Ds/rn/drFod2am5c5woJ5/e5fDUb41Qt5m1c/Tmv5A81isf42Wqrsip2OI/2TbBAOa1AXjYVX+jOFjrAe2pjyY9Wn9au9qzoc8yvd+pch8hBcUM6dIppvSjvY8K9j0k//tejB5Gqj9IciNc0kDzE/+LuvhmqmG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737668486; c=relaxed/simple;
	bh=nHcgf5TMRzAF4SEUWczmuyJErwzZ0hZRuJitvSbRx5k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=VnacN8ftfKBhI91IQRX7cwws5CFmd6uok4eGIl77yoQOAAEHusXLaNZBVMWXGbgQ8rDWRFfgK0/eZqDWCrFB8MacQiE326Oyt9uMLLWskeoU2fN4qVznXaI7slKuJJGuumATHVVsU8Pt+4VAm81lrzSrbObPz5PK+1OSsTejMg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AXV9eC0e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NFTiMK007879;
	Thu, 23 Jan 2025 21:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMaJ2fMkCXuJ6Wx7Q3YI0C1Ppt4qT8eiHcHyCRKa52o=; b=AXV9eC0eVzl54iuL
	faDoP2LyWYQm+Ip1Aexekzl4Spkk6mouFSak43uNoOZinYGt4mCQ1vekpdpEmY94
	lz17RoVtET54ys3lsECHkf/NbyrhtNcKTa6L82RPJTqcg37rKFGVXBsm0/JXI/Wu
	WEMckQlOdt57hMwtPVk4yXX1L9i0i6uoVNprfIlcpcmKZ9wpktiTdNGtF2rd2x7e
	MnPo2QrsmcAOmTD6lhO5BCfHfwN9oOtXofVpsb4oYNAdLqpOGgFlT1/H8CXTp1/M
	SNZErIsgxzTK1ykp6Uy7QZzpZtiH+08WiiVXNdHvoQAF1niG9IZKlVtYPaGqYiVZ
	pnCFwQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44brf50t88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 21:41:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NLfFWD011619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 21:41:15 GMT
Received: from [10.110.95.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 13:41:14 -0800
Message-ID: <c3c70f9a-7a1c-4575-af93-b519117d0084@quicinc.com>
Date: Thu, 23 Jan 2025 13:41:14 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/35] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-18-988f0662cb7e@linaro.org>
 <1b429f3f-2fff-45bb-86dd-48b1d164ccc8@quicinc.com>
Content-Language: en-US
In-Reply-To: <1b429f3f-2fff-45bb-86dd-48b1d164ccc8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hO0edgcZhui8Fgc89mx_t92Fk3VXsJu8
X-Proofpoint-GUID: hO0edgcZhui8Fgc89mx_t92Fk3VXsJu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_09,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230155



On 1/23/2025 1:32 PM, Abhinav Kumar wrote:
> 
> 
> On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
>> Continue migration to the MDSS-revision based checks and replace
>> DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 --
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 -
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 --
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  6 ++----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 10 
>> ++--------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
>>   7 files changed, 5 insertions(+), 20 deletions(-)
>>
> 
> <snip>
> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> index 
>> 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> @@ -319,7 +319,7 @@ struct dpu_hw_pingpong 
>> *dpu_hw_pingpong_init(struct drm_device *dev,
>>           c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
>>       }
>> -    if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
>> +    if (mdss_rev->core_major_ver < 7) {
>>           c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>>           c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>>           c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>>
> 
> So far in this series, we replaced the feature bits with >= checks of 
> core_revisions. That kind of works as usually feature bits get added 
> after a specific version.
> 
> With this patch and later, whenever we use < checks it gets a bit tricky 
> as we might also need an upper bound. Feature bits gave individual 
> control of chipsets but generalizing that all chipsets < 7 have PP DSC 
> is also not correct. I have to really cross-check but there could be 
> some old chipsets which do not have DSC at all.

This raises another question as well.

what if some register was introduced >= X version but was then dropped 
in a newer chipset.

Is it not difficult for the user to go back to the files of each of the 
sub-blocks and alter these checks rather than just fixing up the catalog.

