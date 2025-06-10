Return-Path: <linux-arm-msm+bounces-60773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BEBAD360A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 613453A6CD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E82290BBA;
	Tue, 10 Jun 2025 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HPILu5HQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECB828FFF6;
	Tue, 10 Jun 2025 12:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558136; cv=none; b=Sd+un3qkGG9dVaUNFcgzgcrEH/vD8cTOto7fXwyMNVwMny5919OcDuJ1I7j/dbD6XSonR3MYWrFyQ97we2pzKZd46afQzLgogGzY7xWQDCkQPbE2e37u5xzSFBERD4l5FttHeJU3A7+ASwi0nOMDJhjkHEteVMC8A2aVcgR1TKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558136; c=relaxed/simple;
	bh=1GTnyJiPlySUW+sdF/eciLUoDRF+5HxLCmh9o8qNeeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LAByMx/d5FGQlLA3JuZEs0Su3Yx3B2nNXXAhUbZWux8nh3NzO7ghbBb0rYBnhLYg7Uh1fgNYSQUlXgScNaiiIm55HB2rNX4RRL4/vQKdpOayl0ugiwn0n2prRClf09h7I64lbey8a8QkXcuF6PwIbjlcc86p7GhJyK0VmQgGgRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HPILu5HQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8N3gp016705;
	Tue, 10 Jun 2025 12:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1zz2jZewslSYuANbkXE0TqNW0wgq3c4JFUBtPEF3as=; b=HPILu5HQowy2cKIf
	+GY6VGuX8gJ8DAP3zjZHJ8cikklM0TJqOgHwubq4jo8RavQrel0rrpDBtB0Li60A
	htkKtfIMf8MxezOvsd+M7aAaMcuySaTofE1oJuiPHqnPxACoCRXUew6A73Px23LL
	0y82fwkXC96ZomR8v5947mMN36oBXrM+GAYXUBSQ0f0+cSMZoHlnTEB/mBrl+dZb
	O4wc115htKHHBU4QX4bfiUh2lXkFqCnFFzh9MjnEzUgXCBPfscR3TEDyUEVIQPYP
	rK3i0pHD1rlCde+WZXOmL80VSkuRIo+wut5fauLxhLuHnaSypo/oKjMgk0/utDV2
	OcPklQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn69ac7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 12:22:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55ACMAe6028955
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 12:22:10 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Jun
 2025 05:22:04 -0700
Message-ID: <94f3e5e0-f04f-ca4a-6133-513223919c72@quicinc.com>
Date: Tue, 10 Jun 2025 17:52:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 4/4] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sachin Gupta
	<quic_sachgupt@quicinc.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_sartgarg@quicinc.com>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-5-quic_sachgupt@quicinc.com>
 <nmsm6bb5biptmzruggs4f3mweq7d7hcmwqjdidf6bi7gyoliw2@x4yitguzz6zx>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <nmsm6bb5biptmzruggs4f3mweq7d7hcmwqjdidf6bi7gyoliw2@x4yitguzz6zx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5NiBTYWx0ZWRfXzkCYqt+57Sn0
 kVzvRFZnIMIZDC46bz5xNmr13PHZwM+shkcpft3LzLejPu29TX10Cgmu6u1I3l63PfX/+deZp2c
 WTvYSysySllGWVY8AVBZH60hHPZAgkqO19dVYTd6469mzjXyTCGWdAc0Z2pPnvXOeSEe6SepTB6
 Gs9ftJi6eWaEUkW2y0pvgUBXwFKVwP8kD5Mr1WIsEuWGafJC3Zc0QN1iXwWxhQSPBxV5fssw+bw
 exL9P27CyzczWQiW5Nf3z2o4xD3FypHVfCu8yt0IN4HO3xjvX9cBKfNIf5PS6ItIn+DUqwUfKR1
 G/KdeCBUQJqGTIAe0nk/bS/KCKWWARAa3WmC5bwCg3PTDZOj44Ztrkr/tYLEHuU52suwUEyIDaB
 kS/zq63JvneAdAM1qBl1zb217GD46dAXsY2ujVa6gUZ5VmCiWsPW3trPQJPvvhfUskOeNB+f
X-Proofpoint-GUID: _FV2bPgd6m-l5RTim6UL3YkGWEMKA-08
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68482372 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=R1gvGUbQ5fRmNe7AyYsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _FV2bPgd6m-l5RTim6UL3YkGWEMKA-08
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100096

Hi Dmitry,

I will start on this with addressing your comments in previous version as
suggested.

Thanks,
Ram

On 1/22/2025 3:30 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 22, 2025 at 03:17:07PM +0530, Sachin Gupta wrote:
>> With the current DLL sequence stability issues for data
>> transfer seen in HS400 and HS200 modes.
>>
>> "mmc0: cqhci: error IRQ status: 0x00000000 cmd error -84
>> data error 0"
>>
>> Rectify the DLL programming sequence as per latest hardware
>> programming guide
>>
>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 270 ++++++++++++++++++++++++++++++++---
>>  1 file changed, 252 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index cc7756a59c55..17f17a635d83 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -28,6 +28,7 @@
>>  #define CORE_VERSION_MAJOR_SHIFT	28
>>  #define CORE_VERSION_MAJOR_MASK		(0xf << CORE_VERSION_MAJOR_SHIFT)
>>  #define CORE_VERSION_MINOR_MASK		0xff
>> +#define SDHCI_MSM_MIN_V_7FF		0x6e
>>  
>>  #define CORE_MCI_GENERICS		0x70
>>  #define SWITCHABLE_SIGNALING_VOLTAGE	BIT(29)
>> @@ -118,7 +119,8 @@
>>  #define CORE_PWRSAVE_DLL	BIT(3)
>>  
>>  #define DDR_CONFIG_POR_VAL	0x80040873
>> -
>> +#define DLL_CONFIG_3_POR_VAL	0x10
>> +#define TCXO_FREQ               19200000
>>  
>>  #define INVALID_TUNING_PHASE	-1
>>  #define SDHCI_MSM_MIN_CLOCK	400000
>> @@ -309,6 +311,16 @@ struct sdhci_msm_host {
>>  	bool artanis_dll;
>>  };
>>  
>> +enum dll_init_context {
>> +	DLL_INIT_NORMAL,
>> +	DLL_INIT_FROM_CX_COLLAPSE_EXIT,
>> +};
>> +
>> +enum mode {
>> +	HS400, // equivalent to SDR104 mode for DLL.
>> +	HS200, // equivalent to SDR50 mode for DLL.
>> +};
>> +
>>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>>  {
>>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> @@ -793,6 +805,211 @@ static int msm_init_cm_dll(struct sdhci_host *host)
>>  	return 0;
>>  }
>>  
>> +static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
>> +{
>> +	return SDHCI_MSM_MIN_CLOCK;
>> +}
>> +
>> +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
>> +{
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct clk *core_clk = msm_host->bulk_clks[0].clk;
>> +	unsigned int sup_clk;
>> +
>> +	if (req_clk < sdhci_msm_get_min_clock(host))
>> +		return sdhci_msm_get_min_clock(host);
>> +
>> +	sup_clk = clk_get_rate(core_clk);
>> +
>> +	if (host->clock != msm_host->clk_rate)
>> +		sup_clk = sup_clk / 2;
> Please resolve previous discussions before sending new versions. Just
> sending a response and then sending next iteration of the patchset is
> not a proper way to communicate.
>
> NAK until the discussion is resolved in the previous thread.
>
>> +
>> +	return sup_clk;
>> +}
>> +

