Return-Path: <linux-arm-msm+bounces-39009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A7F9D7A19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 03:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3AEC162B30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 02:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CEF3207;
	Mon, 25 Nov 2024 02:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l3NYg1xz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B874F7FD;
	Mon, 25 Nov 2024 02:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732501930; cv=none; b=LTXLHFhGQzMYcHPawNF7Dp2rIijfA3vTcDDAIg9Rm5szJNxdNMnMeYcYeC5JsfCeSrn0DKwQokbmjiS48UcNpURPeRct0TAOtCq1837Pg+X9cm3J8EIIfEWcjK/WJzr4YK5SFcZ56nyJpvpTcjxsyg8qxizyHfjPW5Xh2I9bk+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732501930; c=relaxed/simple;
	bh=kX4Nesd6xVPhRpwKl8nWtQWshcFbVkieoQXojs+nxa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P/obdepggLf3F3k8+eHDZJ+IjQeXdqOijSXiRs7e0fv8TwnpmeHUKugvBu+U1hjUClkARXGKa+XPEf+937RaFrWqXe3NWRdH1kawVZDaNlTgwowiGqW7r50Ha7MycXI6jTalY9hJ5Xp508NcodciDV7sNP0JmNqekKoyvyiBZHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l3NYg1xz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOMeuZC008874;
	Mon, 25 Nov 2024 02:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VjGyhC4vknpIdxofDNGuSvHUqW+VNRhmm9LwW16zx+Y=; b=l3NYg1xzD4WGIZE+
	kElVNDDj29GGiZsQpASyLeWe4Mw5oV7v7wsNQeEq5vY/BPALb1Qw3nfRaCtmHiF9
	QZE2Jq5xNlJOihlE4YYexKOcCE4q93dhTKiMGBnyb347Ax0DkAoeS80hXxs0Q62l
	AvIGb8hV4IHcrwed9brSFYtf2YZyN+6PyNbHY00AokjPoTOcBtExzbSPzSpzlMmF
	OAUUu9dxgFNInevfgE5BTaMgOrst1FTQSCpG87PLSqZBwYNr1exGCfLVGCPR9df7
	H+3PAAcyklnjo5g9z+TbMGMau4WT3z37gMy3pmSpAZqIkRUbz8sz5qBC6MKer5Jz
	YLgW4A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 433626b7b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 02:31:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP2VnCS000887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 02:31:49 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 24 Nov
 2024 18:31:43 -0800
Message-ID: <bfc87132-a63e-4f3f-99b7-1a1bd7eb60ce@quicinc.com>
Date: Mon, 25 Nov 2024 10:31:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] drm/msm/dsi: Add support for SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Krishna
 Manikandan" <quic_mkrishn@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Li Liu
	<quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-7-35252e3a51fe@quicinc.com>
 <mcvhfkh3ycrx2ganumsxlc7lx53ed55yk4syh5qev3jqqgkeqj@h5vnfpgjwtj5>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <mcvhfkh3ycrx2ganumsxlc7lx53ed55yk4syh5qev3jqqgkeqj@h5vnfpgjwtj5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eXnJPPWRCeP9YaHrlQwUnXbriAG3mtf0
X-Proofpoint-ORIG-GUID: eXnJPPWRCeP9YaHrlQwUnXbriAG3mtf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=966
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250021



On 2024/11/22 18:10, Dmitry Baryshkov wrote:
> On Fri, Nov 22, 2024 at 05:56:50PM +0800, Fange Zhang wrote:
>> From: Li Liu <quic_lliu6@quicinc.com>
>>
>> Add support for DSI 2.3.1 (block used on SM6150).
>>
>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 +++-
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> index 10ba7d153d1cfc9015f527c911c4658558f6e29e..fe02724bddf69c2e8d6816589f4ea410fa666e5b 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> @@ -171,7 +171,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>>   	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>>   	.io_start = {
>>   		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 */
>> -		{ 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6375 */
>> +		{ 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6150 / SM6375 */
> 
> Not true
Should I remove it or add it behind the SDM670?
> 
>>   	},
>>   };
>>   
>> @@ -286,6 +286,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>>   		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_0,
>>   		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_1,
>> +		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
>>   		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> index 4c9b4b37681b066dbbc34876c38d99deee24fc82..120cb65164c1ba1deb9acb513e5f073bd560c496 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> @@ -23,6 +23,7 @@
>>   #define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
>>   #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
>>   #define MSM_DSI_6G_VER_MINOR_V2_3_0	0x20030000
>> +#define MSM_DSI_6G_VER_MINOR_V2_3_1	0x20030001
>>   #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
>>   #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
>>   #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
>>
>> -- 
>> 2.34.1
>>
> 


