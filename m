Return-Path: <linux-arm-msm+bounces-39554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1CE9DC1C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 10:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3798280A67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 09:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FB0187844;
	Fri, 29 Nov 2024 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GYiZsStW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB0A185920;
	Fri, 29 Nov 2024 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732874178; cv=none; b=qxdk3thMZr39afYECOm+Y63xy2INelYvS4EmX28NiJUSqoNrw4Xyu7DbVxAk2K+q+0930+ZmuqkzCBQRIA+PEPf0RJILHXSUUuO4Fj34CQjjKcLcl7+ztunc5Ij6LBvq6DjSIazYQzjlwU+cbx/irB1h3jom0iE+owxWuZDsS3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732874178; c=relaxed/simple;
	bh=P02ni/rru9fj/6y3EeERYLHGEPXUvFJQBcszmPDVgDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RB7duc970UleF696LrF/Kz9oC7PwCkUDESNEbzPfMPq5vJnBuCwIiUMBwXomk7DYcffHrcChlKctr6yqblXHNETi4boJg7qwHa93WKm/NdCrdqRsDdDFV3dB0h4OzzKBjX/QQFJ78iXMtus9RONeTBIWK9/Bj2G7nAZqRyZvnPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GYiZsStW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASNbiTk029780;
	Fri, 29 Nov 2024 09:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wzpKw6mHEq1jlBCAbrkFm+p8emD1Wsk/7ZXFz/Ace88=; b=GYiZsStWrL2vZwAF
	KJ04D5PGh1PDl20BfBse5aSg6K0ZaxF0143RlTrM0O8OB3h04xKzXs72qryZ3cLm
	Kr5bgn5RzTnbNJZa+wTuOLVXrjN7Ovt73zZb0PlVmlS6PjWRY/yXqRqqCsAjGeSs
	/BXFo4071leXzUgFGLwG6dsNfyz+kk5KHJxWdstfs0zuNukEDeHCla9jWUR2XDlW
	46gL4UL2MyFRDbzzsVATcYZRzpBximRQ+G0kmEm+YOw+yLEqB6srhiEkvaQMUHXi
	GkvYLqxDqx7r14CUNCg2qu1b9XU9GJ85ZQIhdB9v9zjeXba3zjfCvdIqHTzI6esE
	t/ZMXQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366y051x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 09:55:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT9twRR003175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 09:55:58 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 01:55:51 -0800
Message-ID: <4b4a7609-0d9e-4b52-9193-a79583419902@quicinc.com>
Date: Fri, 29 Nov 2024 17:55:48 +0800
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
 <nllulh3vskl3hm3hvjux4khxtanqj7cpoytodwkzphwn4ajmo7@g46rgnhp637b>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <nllulh3vskl3hm3hvjux4khxtanqj7cpoytodwkzphwn4ajmo7@g46rgnhp637b>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2RDeD0lqI0DOTLdIK1pgT5hdFL1hoJ_t
X-Proofpoint-GUID: 2RDeD0lqI0DOTLdIK1pgT5hdFL1hoJ_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290080



On 2024/11/27 21:46, Dmitry Baryshkov wrote:
> On Wed, Nov 27, 2024 at 03:05:03PM +0800, Yongxing Mou wrote:
>> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
> 
> Please mention, why do you need it at all. I see that the UBWC swizzle
> and HBB settings are different. Is this really the case? Is it because
> of the different memory being used on those platforms?
> 
Thanks, will modify the comment to add more information .QCS8300 UBWC 
setting is quite different with SA8775P,it use different memory,so their 
recommended configurations are not quite the same.this is really setting.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
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


