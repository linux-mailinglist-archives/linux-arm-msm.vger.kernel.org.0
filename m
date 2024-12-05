Return-Path: <linux-arm-msm+bounces-40430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E529E4C73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 03:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40F77283712
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 02:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E188618E35D;
	Thu,  5 Dec 2024 02:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FxkOAYvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BEF189B94;
	Thu,  5 Dec 2024 02:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733366827; cv=none; b=E/khEAk9ZFwibdJ+X4P7FyGieCdU653qjgjoqGSBt8svzwOaPW45qSqbv404eOpMfs6Ft+mjzo1QHyZM7XaJEJc73YbQH5bMa/wDZqnHvImeUyjRNW0AU18KNuuKbHntrAfdEAm4VUXxdEZbtCVRPD/cpXWUszU5ph5zOehwot8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733366827; c=relaxed/simple;
	bh=8GCDE4kV/N13ubARQ3HeGM2pIZ44/Dc8/l+YPPB8KNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PpN0J9TK0bWQ87CFXf+sdqTJMZ3FfbShSfLQDvy/u24hjoz3+WzY4mzB1gZUpsKDi9IZFfZUM7BEg6X3g86zo6uMZmKnmx/1r8jrgOJllAeWeE71026a9fYgq/zjaEi4hZtYbCBDlL2IqTeLQj1xXw1qbNFI0Psfm5M/8ILF77I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FxkOAYvH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4FYiOK010188;
	Thu, 5 Dec 2024 02:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uf7kfTAk0QPk/J1ykbjhJ4K9c+4Go26O2FgRuYAVa80=; b=FxkOAYvHg9D/8XAE
	nFLhRlW6jW3z/XuQAfGAi12wy0A+VX/ZJe79EOuuKAzsiG23gaZpP2Vf6/os08FE
	7PqXf1ldtu0ImqBE7w2OB8AAQfjDC17PD9E7Ji8O10gVTIKOSvPD00EZA1Qktt+X
	GE0mERxjL0zmJVOo41DejX1lJ+YNQ5oVtsEzczQc/+X/vn/ItBp7bU1NzAvedMyY
	ZEwxT7P9YHshFgGOdT2ZbfXyJgeUCq3REE6vCKgeY0bDJbAHbg64NNTCIqmbNOaY
	/+NFfdfZG5mFsve506k0x7uY5iDGekwXpQ/bE8tY1zOs5kStOz4pbzUmAZeOGGE3
	90PxEg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a4by4thy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 02:46:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B52kpN7025242
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 02:46:51 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Dec 2024
 18:46:44 -0800
Message-ID: <b6603724-d9bc-44fd-8474-1dd181b47433@quicinc.com>
Date: Thu, 5 Dec 2024 10:46:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add QCS8300 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-3-29b2c3ee95b8@quicinc.com>
 <wbw7ftf7ogcylxbeav3vegyfgz32sc2h5plneo2w7djsy2kaeo@enkcbukosern>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <wbw7ftf7ogcylxbeav3vegyfgz32sc2h5plneo2w7djsy2kaeo@enkcbukosern>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 49rVFHB5gW7yqsCsh6uNj0fUPHnmKPmV
X-Proofpoint-ORIG-GUID: 49rVFHB5gW7yqsCsh6uNj0fUPHnmKPmV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050022



On 2024/11/30 2:55, Dmitry Baryshkov wrote:
> On Wed, Nov 27, 2024 at 03:05:03PM +0800, Yongxing Mou wrote:
>> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
> 
> Once rebased on top of [1]:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [1] https://lore.kernel.org/dri-devel/20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/
> 
got it,thanks
>>
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>> index b7bd899ead44bf86998e7295bccb31a334fa6811..90d8fe469d3134ec73f386153509ac257d75930a 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -568,6 +568,16 @@ static const struct msm_mdss_data qcm2290_data = {
>>   	.reg_bus_bw = 76800,
>>   };
>>   
>> +static const struct msm_mdss_data qcs8300_data = {
>> +	.ubwc_enc_version = UBWC_4_0,
>> +	.ubwc_dec_version = UBWC_4_0,
>> +	.ubwc_swizzle = 6,
>> +	.ubwc_static = 1,
>> +	.highest_bank_bit = 3,
>> +	.macrotile_mode = 1,
>> +	.reg_bus_bw = 74000,
>> +};
>> +
>>   static const struct msm_mdss_data sa8775p_data = {
>>   	.ubwc_enc_version = UBWC_4_0,
>>   	.ubwc_dec_version = UBWC_4_0,
>> @@ -715,6 +725,7 @@ static const struct of_device_id mdss_dt_match[] = {
>>   	{ .compatible = "qcom,mdss" },
>>   	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
>>   	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
>> +	{ .compatible = "qcom,qcs8300-mdss", .data = &qcs8300_data },
>>   	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
>>   	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
>>   	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
>>
>> -- 
>> 2.34.1
>>
> 


