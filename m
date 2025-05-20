Return-Path: <linux-arm-msm+bounces-58611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38434ABD006
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9C138A065B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960DD25A34B;
	Tue, 20 May 2025 07:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LmBq0jDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54051D5CEA;
	Tue, 20 May 2025 07:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747724560; cv=none; b=H9uCFh67/DYHNKL2HEdhjqkNhwhRgznAt733EQ+5nBdyKRPLvwuO85JehWuiZPP9JPKyDoiHOV4tH3qfEi8xMm/0wIOXv3WzR+8wX3zod6z2rUa7CdBDmrLtMPJ8hjNVYeXpi5ChXdF78SBPiy0lpfkVEUjPaTg0C0/MXXH9dFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747724560; c=relaxed/simple;
	bh=GjF/1qi/aA+qb8e+Gm4togAvh4CMeT/zQwBPU0nkros=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ewm4KPlcMbrh8t+YaQGN7oJ9qdAUosjd/h01xkX14N2F3GcnkMPurJXIjPxrXq4AQxRKVt8PnFPx3HWmxJXPE3d+BnM4GezGMLALJcYuGhBhARzVgR0aR/qX4FTSivGO17PqHQgGNCoFsoX+meGKZ3ND5kWKFJJakFohVdkGua4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LmBq0jDS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K70Fdi003036;
	Tue, 20 May 2025 07:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5m5D9RAHx8tqb+LmoKZpi+P0zGli3IPIo/DZsFZCeE4=; b=LmBq0jDSY4UpAAwK
	I6cnL9+dr91RlO/ufx+c2ERANdQKRk0QZzf6NytGH0s9dY2fXZSkMJncFhYtRSSC
	ZttZpJxThOIGnsUq0nSVU4+sKzLVARiV7nX9LnLwTM7UyQ4JoyMS+7X+UO56A7Wl
	eg6baC4mAbSNUMSZuxa/dnbMbXMzUQsBVJln0K8c2bqYQP3G+82cMTLU7evC/Zk6
	ASoLsLTp9k995bUrLQU43gDW51xd8cUSpVhXshZc9AtAGwJ9VsCh6s3pcpg60Ih2
	oWuh+ClTRmcD1CbXzUsMTSDFQy7Fsbu6NiB0BZirHu9RZU3W6C+gvwuD0vYsQqtW
	uHGmYg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atk522-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:02:33 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K72WO6013585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:02:32 GMT
Received: from [10.218.0.120] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 May
 2025 00:02:24 -0700
Message-ID: <09b3f318-0599-445b-8587-ee8ab9d42cbd@quicinc.com>
Date: Tue, 20 May 2025 12:32:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/3] mmc: sdhci-msm: Limit HS mode frequency to 37.5MHz
Content-Language: en-US
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_narepall@quicinc.com>, <kernel@quicinc.com>
References: <20241107080505.29244-1-quic_sartgarg@quicinc.com>
 <20241107080505.29244-4-quic_sartgarg@quicinc.com>
 <8b415442-283a-4fc8-ad0d-fbd8892d2ba2@intel.com>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <8b415442-283a-4fc8-ad0d-fbd8892d2ba2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682c2909 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=qYZ75QzxO1GUA97RLtUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HFMMDUcySGRzdloWm-j4NAEsXPrFh1p2
X-Proofpoint-GUID: HFMMDUcySGRzdloWm-j4NAEsXPrFh1p2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA1NiBTYWx0ZWRfX0miuvcUe9rBw
 07+sQzWMSflWb41Kk7t2P01KN9gXOlBpMGrZxKaW+u4xmt2mL82dxhl5jVkPLxDZ9JIpe5XDZ6D
 06xYHrfeZy+VedTM9MU/uNjoU1HuFUzNWrdDwDQEej/ab4+1T8ibtsn5V37oBxW4Ah9vWuvsO0H
 6WTpNK2rzMDtgg0oYuNbbX3+IO7LUAMzS2X5zjMXKdu1ml9TtZA/okQfvlih8r/hb6aeW98e13y
 0SkFYoyuUJuJsbaam+uHj7KLfJ3zCiV0KlDpZGP8wyUXveFiGbWLkxlbSDxTXkexx4EbZoNzaV0
 WxFI7K1Mc2ndwr9iGm9EsbIuf8Kt3ej0ymmQeCszTzJIwqrRlo4zYJoFs7+Ir7U5RmL9ZG8/s5F
 prFSVx770VUEdiWhznrhWzlbpg+X9lovUXOzoPTOnBQoiHhakdhS/M5iMSLzdEL9rDbz5Egj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200056



On 11/11/2024 2:28 PM, Adrian Hunter wrote:
> On 7/11/24 10:05, Sarthak Garg wrote:
>> For Qualcomm SoCs with level shifter delays are seen on receivers data
>> path due to latency added by level shifter.
>>
>> To bring these delays in normal range and avoid CMD CRC errors
>> reduce frequency for HS mode SD cards to 37.5MHz for targets which has
>> level shifter.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 16325c21de52..5e1dc06c4707 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -138,6 +138,8 @@
>>   /* Max load for eMMC Vdd-io supply */
>>   #define MMC_VQMMC_MAX_LOAD_UA	325000
>>   
>> +#define LEVEL_SHIFTER_HIGH_SPEED_FREQ	37500000
>> +
>>   #define msm_host_readl(msm_host, host, offset) \
>>   	msm_host->var_ops->msm_readl_relaxed(host, offset)
>>   
>> @@ -287,6 +289,7 @@ struct sdhci_msm_host {
>>   	bool use_cdr;
>>   	u32 transfer_mode;
>>   	bool updated_ddr_cfg;
>> +	bool uses_level_shifter;
>>   	bool uses_tassadar_dll;
>>   	u32 dll_config;
>>   	u32 ddr_config;
>> @@ -366,6 +369,11 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>>   
>>   	mult = msm_get_clock_mult_for_bus_mode(host);
>>   	desired_rate = clock * mult;
>> +
>> +	if (curr_ios.timing == MMC_TIMING_SD_HS && desired_rate == 50000000
> 
> Wouldn't desired_rate > LEVEL_SHIFTER_HIGH_SPEED_FREQ make more sense?
> 

Sure will update in V2.

>> +		&& msm_host->uses_level_shifter)
>> +		desired_rate = LEVEL_SHIFTER_HIGH_SPEED_FREQ;
> 
> As checkpatch says:
> 
> CHECK: Logical continuations should be on the previous line
> #46: FILE: drivers/mmc/host/sdhci-msm.c:374:
> +       if (curr_ios.timing == MMC_TIMING_SD_HS && desired_rate == 50000000
> +               && msm_host->uses_level_shifter)
> 
> total: 0 errors, 0 warnings, 1 checks, 34 lines checked
> 
> 

Sure will fix this in V2.

>> +
>>   	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), desired_rate);
>>   	if (rc) {
>>   		pr_err("%s: Failed to set clock at rate %u at timing %d\n",
>> @@ -2372,6 +2380,8 @@ static inline void sdhci_msm_get_of_property(struct platform_device *pdev,
>>   
>>   	of_property_read_u32(node, "qcom,dll-config", &msm_host->dll_config);
>>   
>> +	msm_host->uses_level_shifter = of_property_read_bool(node, "qcom,use-level-shifter");
>> +
>>   	if (of_device_is_compatible(node, "qcom,msm8916-sdhci"))
>>   		host->quirks2 |= SDHCI_QUIRK2_BROKEN_64_BIT_DMA;
>>   }
> 

