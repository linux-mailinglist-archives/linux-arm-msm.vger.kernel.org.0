Return-Path: <linux-arm-msm+bounces-58610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAC0ABD001
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31E4D3BE157
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02751259C80;
	Tue, 20 May 2025 07:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c/K02XIc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E8420E6;
	Tue, 20 May 2025 07:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747724473; cv=none; b=Jv9ukZUpAtIX/UNrfbRczstoYnONSQcO6AJtoPjqVuutxzIWbRCYmcvfzJEJQsU3cbBk5WEtiDMFcJbhc0TKHEPusfP0Ts55QAHAOQnAOz3xc+HfT8ezPAOt7zG/Ey0wceyy7TDtpv7Wn2BuRVPqvUn7w3ryWrucD4zYUE1EwR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747724473; c=relaxed/simple;
	bh=a/SfpzBwYB7MErbeYtg9cL5pgsnu/DA6Ti0CGB09MTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eN9EU8EkCcdf4YmxOQWAO/Aay7ZB0/Kpv2pG08I80zTLyRfpP1cHQwZkvBfqJSyKV8qhHOJNtgpa0xNyNOUmXZ0q5DkwIKqrG9J4sElAKmZ5TSqumOJlc7rOOwOUoaI9bNcXQoe73G/9bemeAw0gYVyENRnHWmDzek4RSsDkvZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c/K02XIc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JKaRD9027386;
	Tue, 20 May 2025 07:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9fWlnVTfRyW4RCCDFTAJQbk5AZguUtzmzGG/w1VqTP0=; b=c/K02XIcnqkiSFGf
	5K2PrlI0ZyPWTfVCuqWOMMVlU+1grP77td27u6qgbZKxhj6wHpg1tyuJeButnGuO
	byHchohv2w/ACxtC6j1A6MtGAzP/q2w+2nUFj3A8rmL9AjiZQz9WSjZBBplQLjNZ
	MPkVG7U1DWJh58KeQfJVdytb1aKCDU5u9PooK43MHO62NMqkZ1+opvqV7qSImvV7
	r4DRYA/NFnRz2VuP+xtyzWZS3C+p+kWqG9ua8WMO5ZNuMYEnFUPP/WdoBDUWjImW
	LSaoMUIjZTmoD/5o/t/XBRH/VUpU9Yd0qtBdNjFCxcb71h3VMdjo7wfQQwlPLUfA
	FMTkhQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsxr0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:01:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K713FD020573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:01:04 GMT
Received: from [10.218.0.120] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 May
 2025 00:00:51 -0700
Message-ID: <3d867490-0738-4baf-9fd0-e522aa8d2677@quicinc.com>
Date: Tue, 20 May 2025 12:30:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/3] mmc: sdhci-msm: Enable tuning for SDR50 mode for
 SD card
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
 <20241107080505.29244-3-quic_sartgarg@quicinc.com>
 <4e4870b5-4491-4f65-9a41-1a5e9e1bdf68@intel.com>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <4e4870b5-4491-4f65-9a41-1a5e9e1bdf68@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 37qx-J20nTHUsPh0m709gGf2T0dyfiIX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA1NiBTYWx0ZWRfX0U/EKY/m/vMB
 vVj87rvMt2ZQ6+2PtlY7/HF+JxmAn/8z0hDIVQ2VtbRsHddmW/HJM2SrmM6VNTNLTWtqz927Fk7
 OoUbvEuQ+Nl3FZ1j3629KJloYvy/rxw+NIX7r4d1cxx2ny2ikFXxPOtwraHbffTVgdbGHghinIV
 ctOlGxPZr2bV5S+n6lAkLBVTgWGTw+1oTs1GZam+E5XoPFMXefT59ikD5t59wIePFXkdFhCzf+7
 DP+PROMhVUcQuKyIlLgikERYgp7VLSS7JiLXTnb0axprMC+dRbiQ48uTaUymEBGR0DTs8DW6eTD
 EwojAV9TWPxGD2y66dhsJnnVMqY3RVbtZoq7Lu9ENqAfRhJ5BNeGqEorzpfA38UHm+MrciKElzN
 es++NoDH1iBOtpLm/1+YrkAMJDdNKAB7RUZD7SiV3wFIZBs1CVNmziD/2saQB2DCCJ83IfU8
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682c28b1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=05cVhv9CEcOWwgLMNlEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 37qx-J20nTHUsPh0m709gGf2T0dyfiIX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200056



On 11/11/2024 2:21 PM, Adrian Hunter wrote:
> On 7/11/24 10:05, Sarthak Garg wrote:
>> For Qualcomm SoCs which needs level shifter for SD card, extra delay is
>> seen on receiver data path.
>>
>> To compensate this delay enable tuning for SDR50 mode for targets which
>> has level shifter.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index e00208535bd1..16325c21de52 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -81,6 +81,7 @@
>>   #define CORE_IO_PAD_PWR_SWITCH_EN	BIT(15)
>>   #define CORE_IO_PAD_PWR_SWITCH	BIT(16)
>>   #define CORE_HC_SELECT_IN_EN	BIT(18)
>> +#define CORE_HC_SELECT_IN_SDR50	(4 << 19)
>>   #define CORE_HC_SELECT_IN_HS400	(6 << 19)
>>   #define CORE_HC_SELECT_IN_MASK	(7 << 19)
>>   
>> @@ -1124,6 +1125,10 @@ static bool sdhci_msm_is_tuning_needed(struct sdhci_host *host)
>>   {
>>   	struct mmc_ios *ios = &host->mmc->ios;
>>   
>> +	if (ios->timing == MMC_TIMING_UHS_SDR50 &&
>> +			host->flags & SDHCI_SDR50_NEEDS_TUNING)
> 
> Please do line up code as suggested by checkpatch:
> 
> CHECK: Alignment should match open parenthesis
> #35: FILE: drivers/mmc/host/sdhci-msm.c:1129:
> +       if (ios->timing == MMC_TIMING_UHS_SDR50 &&
> +                       host->flags & SDHCI_SDR50_NEEDS_TUNING)
> 
> CHECK: Alignment should match open parenthesis
> #55: FILE: drivers/mmc/host/sdhci-msm.c:1219:
> +       if (ios.timing == MMC_TIMING_UHS_SDR50 &&
> +                       host->flags & SDHCI_SDR50_NEEDS_TUNING) {
> 
> total: 0 errors, 0 warnings, 2 checks, 40 lines checked
> 
> 

Sure will update in V2.

>> +		return true;
>> +
>>   	/*
>>   	 * Tuning is required for SDR104, HS200 and HS400 cards and
>>   	 * if clock frequency is greater than 100MHz in these modes.
>> @@ -1192,6 +1197,8 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>>   	struct mmc_ios ios = host->mmc->ios;
>>   	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>>   	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
>> +	u32 config;
>>   
>>   	if (!sdhci_msm_is_tuning_needed(host)) {
>>   		msm_host->use_cdr = false;
>> @@ -1208,6 +1215,15 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>>   	 */
>>   	msm_host->tuning_done = 0;
>>   
>> +	if (ios.timing == MMC_TIMING_UHS_SDR50 &&
>> +			host->flags & SDHCI_SDR50_NEEDS_TUNING) {
> 
> Ditto alignment
> 

Sure will update in V2.

>> +		config = readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec);
>> +		config |= CORE_HC_SELECT_IN_EN;
>> +		config &= ~CORE_HC_SELECT_IN_MASK;
>> +		config |= CORE_HC_SELECT_IN_SDR50;
> 
> Perhaps clear bits first, then set bits e.g.
> 
> 		config &= ~CORE_HC_SELECT_IN_MASK;
> 		config |= CORE_HC_SELECT_IN_EN | CORE_HC_SELECT_IN_SDR50;
> 

Sure will update in V2.

>> +		writel_relaxed(config, host->ioaddr + msm_offset->core_vendor_spec);
>> +	}
>> +
>>   	/*
>>   	 * For HS400 tuning in HS200 timing requires:
>>   	 * - select MCLK/2 in VENDOR_SPEC
> 

