Return-Path: <linux-arm-msm+bounces-76192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB09BC1132
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 13:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8E1904E8C3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 11:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3992D73B3;
	Tue,  7 Oct 2025 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WH01E+TB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246E1A2398;
	Tue,  7 Oct 2025 11:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835078; cv=none; b=Gua0uc3SEZ04YHgy2cjgVkqLIlGx4pGgPSAmTJQ1LG9f5+/Y8B5wTC3TGpwgNxDcThQwabHEAntSraIzNPPuSeoDwYLffITTsVYutz8Bn1Di2fUnIt3tmn7FdSQNWCVGcI68huDfXuX2rhWKy+NlEAPC+lHugJwt1+aPIh72WxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835078; c=relaxed/simple;
	bh=ktXqCRUkyTMvb5MhE8h2ZXyL7kGpzg1s95Xkm9J5r1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t2z7SLLnNyFsPTB6kRjODDvFueJd0HN+nPMno619Hnmbn2PdB1ySSj9sxS/b8I+s/9ut4G5fKwePdhzXucl+Uu779DaFiG2QP6Pzh7gfGG7cQX2jB5dxxvNdDL5agdHIlsnHcrurxdyhUIIVT/FlC4Us38K7fqANqwfd8SXFoe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WH01E+TB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5974H0FG026717;
	Tue, 7 Oct 2025 11:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LpImfTOuAGEzNTlbBmu9w5WQT4rT1ixjE60+Kg5sxk=; b=WH01E+TB3T68Lbq9
	iem9c5UzYSTsx19TmwHMAyHZdxESjuHfW43UfAQnLwkcl7vr8LT69RLtF094yRDe
	1rvl80R/kidoFn8xr9B4bH8yNj/Sb6DUeKb6uMYJnRH1BlIEgMVeSuwTaSYd4bym
	fIbOlRPPmHsOQDD6EFZcDODCeiDtX0bX2udrAJtcEt/pZGZQgO9JBX7RVu3DZz/W
	AzcQrthMk06Jyo1FAa/d9i/gehD5w4qlOqyy2ax+lafq1FUsp85S/1hXsuAWmWvV
	kwCe134+3l35zdgzYtXsxModgTRh6in0/HTrgdej+OTcJFj5Er170m78/ktuDHYS
	KCerlw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0jq5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 11:04:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 597B4TYj019502
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Oct 2025 11:04:29 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 7 Oct
 2025 04:04:24 -0700
Message-ID: <e1b61851-85e6-3897-196c-1f432e7e8432@quicinc.com>
Date: Tue, 7 Oct 2025 16:34:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 3/4] mmc: sdhci-msm: Add Device tree parsing logic for
 DLL settings
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>,
        Sachin Gupta
	<quic_sachgupt@quicinc.com>
References: <20250929113515.26752-1-quic_rampraka@quicinc.com>
 <20250929113515.26752-4-quic_rampraka@quicinc.com>
 <59375a10-2a5b-45ed-9a4c-76884c0fe3c6@intel.com>
Content-Language: en-US
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <59375a10-2a5b-45ed-9a4c-76884c0fe3c6@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: avY7EvLy1Qswn0T74railrVGiMrB_k7a
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e4f3be cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8
 a=0haHiXGQmjiPyxnxpDQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: avY7EvLy1Qswn0T74railrVGiMrB_k7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX0oZXWacLnl3j
 hRExjCOuJv16jZe615KYZ1U3xgJ2O4X0z69k1DAO7SMMb2pCCDn33ySIX7nFU/LYqHPPTGhnrd2
 Yh/+1hER0Fn2U21uMLf5tkGOQQBFAhwJ9QS+hM9EDRSsKddROgoyBJeVfmpilosQIGKzOZCSRa9
 HI/SyHcc2rzG6OeC0V4rJEHkmDf7BgkCkn0yI77cafyrjeSnxxTy/9MhhvbqKvMGou6UrL90ESC
 AmQxn3ZINIbcgctZquyX4+83XxSnKg3BbZnx+pIzuIbjqx2/xq2HasZaWVDnNcBm/LP2LsOOtRh
 By1RiBobUUSo+nJDPXWqe8FuKyfyysQ2ZShgmwDw7UV9y8CDSpOyGc/zDS9VAve505bC7KvKUk5
 tFi7BUEEbMcwAOhmQpTom/7r0R8Rsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123


On 9/29/2025 9:42 PM, Adrian Hunter wrote:
> On 29/09/2025 14:35, Ram Prakash Gupta wrote:
>> From: Sachin Gupta <quic_sachgupt@quicinc.com>
>>
>> This update introduces the capability to configure HS200
>> and HS400 DLL settings via the device tree and parsing it.
>>
>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 91 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 91 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 36700735aa3e..d07f0105b733 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -265,6 +265,19 @@ struct sdhci_msm_variant_info {
>>  	const struct sdhci_msm_offset *offset;
>>  };
>>  
>> +/*
>> + * DLL registers which needs be programmed with HSR settings.
>> + * Add any new register only at the end and don't change the
>> + * sequence.
>> + */
>> +struct sdhci_msm_dll {
>> +	u32 dll_config[2];
>> +	u32 dll_config_2[2];
>> +	u32 dll_config_3[2];
>> +	u32 dll_usr_ctl[2];
>> +	u32 ddr_config[2];
>> +};
>> +
>>  struct sdhci_msm_host {
>>  	struct platform_device *pdev;
>>  	void __iomem *core_mem;	/* MSM SDCC mapped address */
>> @@ -273,6 +286,7 @@ struct sdhci_msm_host {
>>  	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
>>  	/* core, iface, cal and sleep clocks */
>>  	struct clk_bulk_data bulk_clks[4];
>> +	struct sdhci_msm_dll dll;
>>  #ifdef CONFIG_MMC_CRYPTO
>>  	struct qcom_ice *ice;
>>  #endif
>> @@ -301,6 +315,7 @@ struct sdhci_msm_host {
>>  	u32 dll_config;
>>  	u32 ddr_config;
>>  	bool vqmmc_enabled;
>> +	bool artanis_dll;
>>  };
>>  
>>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>> @@ -2516,6 +2531,73 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>>  	return ret;
>>  }
>>  
>> +static int sdhci_msm_dt_get_array(struct device *dev, const char *prop_name,
>> +				  u32 **dll_table, int *len)
>> +{
>> +	struct device_node *np = dev->of_node;
>> +	u32 *arr = NULL;
>> +	int ret = 0, sz = 0;
>> +
>> +	if (!np)
>> +		return -ENODEV;
>> +	if (!of_get_property(np, prop_name, &sz))
>> +		return -EINVAL;
>> +
>> +	sz = sz / sizeof(*arr);
>> +	if (sz <= 0)
>> +		return -EINVAL;
>> +
>> +	arr = kcalloc(sz,  sizeof(*arr), GFP_KERNEL);
>> +	if (!arr)
>> +		return -ENOMEM;
>> +
>> +	ret = of_property_read_u32_array(np, prop_name, arr, sz);
>> +	if (ret) {
>> +		dev_err(dev, "%s failed reading array %d\n", prop_name, ret);
>> +		*len = 0;
>> +		return ret;
>> +	}
>> +
>> +	*dll_table = arr;
>> +	*len = sz;
>> +
>> +	return ret;
>> +}
>> +
>> +static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
>> +{
>> +	int dll_table_len, dll_reg_count;
>> +	u32 *dll_table = NULL;
>> +	int i, j;
>> +
>> +	msm_host->artanis_dll = false;
>> +
>> +	if (sdhci_msm_dt_get_array(dev, "qcom,dll-hsr-list",
>> +				   &dll_table, &dll_table_len))
>> +		return -EINVAL;
>> +
>> +	dll_reg_count = sizeof(struct sdhci_msm_dll) / sizeof(u32);
>> +
>> +	if (dll_table_len != dll_reg_count) {
>> +		dev_err(dev, "Number of HSR entries are not matching\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	for (i = 0, j = 0; j < 2; i = i + 5, j++) {
>> +		msm_host->dll.dll_config[j] = dll_table[i];
>> +		msm_host->dll.dll_config_2[j] = dll_table[i + 1];
>> +		msm_host->dll.dll_config_3[j] = dll_table[i + 2];
>> +		msm_host->dll.dll_usr_ctl[j] = dll_table[i + 3];
>> +		msm_host->dll.ddr_config[j] = dll_table[i + 4];
>> +	}
> Kind of begs the question, why the driver and the DT have to be in
> a different order.
>
> It might be simpler to have:
>
> 	struct sdhci_msm_dll {
> 		u32 dll_config;
> 		u32 dll_config_2;
> 		u32 dll_config_3;
> 		u32 dll_usr_ctl;
> 		u32 ddr_config;
> 	};
>
> And:
> 	struct sdhci_msm_dll dll[2];
>
> And then dereference like:
>
> 	msm_host->dll[index].dll_config_3
>
> Also then you could perhaps use something like:
>
> 	of_property_read_variable_u32_array(np, "qcom,dll-hsr-list", msm_host->dll, 10, 10)
>
> instead of most of sdhci_msm_dt_get_array()

Thanks Adrian for your suggestion, I could get rid of most of the lines of code
of this patch with this approach. Accordingly I had to make some changes in
patch #4 of this version.

please let me know if I can push next patchset version.

>> +
>> +	msm_host->artanis_dll = true;
>> +
>> +	kfree(dll_table);
>> +
>> +	return 0;
>> +}
>> +
>>  static int sdhci_msm_probe(struct platform_device *pdev)
>>  {
>>  	struct sdhci_host *host;
>> @@ -2562,6 +2644,15 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>  
>>  	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
>>  
>> +	/*
>> +	 * Parse HSR dll only when property is present in DT.
>> +	 */
>> +	if (of_find_property(node, "qcom,dll-hsr-list", NULL)) {
>> +		ret = sdhci_msm_dt_parse_dll_info(&pdev->dev, msm_host);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>  	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
>>  	if (ret)
>>  		return ret;

