Return-Path: <linux-arm-msm+bounces-76193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E85BC1177
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 13:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 22CBF34D805
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 11:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4055A2561D1;
	Tue,  7 Oct 2025 11:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lz3rYTGZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D641165F16;
	Tue,  7 Oct 2025 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835349; cv=none; b=SCDVF84YVa0zaccc2rVg1SsN33qzSGSIfMn/pmXY9vIX3+7zbi0Ecfmbal247DnY0JZeMJ5qitQIdd/vxxmrMb/qrgaQGaX8f3syxkWDhaiUA8ztp2NcUcZOiU2kLjSEvic4+FN8S/5ks8/M42ZzSSIq5sf6BYo+QiKbAapzn9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835349; c=relaxed/simple;
	bh=fhfzUMJL1SqNlzcr8LHjp5X1IhdG41Jx/unl4fKpMOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fu+QwFQk1OOqukboB0bp5M8Kk/9/43Sueqq/shf/zG3fdc22zFv1z3KM1fxFd2mQILNGur2+866lZ7b/mn18GMLTGFARmvHN9X70K6HP7IsZAPhlNo1Tj93tcRhOSmfLgmOOBCHdBJCmz5oSvaAK80m4EePhKlTONLUImIIRBIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lz3rYTGZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5974V5hJ016331;
	Tue, 7 Oct 2025 11:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNHvoTHoC6STGB5T7hO09OD+Iq9U/5MnfxHSDGuLxJE=; b=Lz3rYTGZFxNhLvtT
	nwhT1v5/0482g2bpkGi5agV/S5QdTPy+/+2nPMl+jsZDuZWKn/6DoMH44hE2iBX4
	vGigWiHiQNehFybgCnK1TxDc0tNgnczNGhHdRjMbEG5wnzrrkKGIRLuF/wY+nMhW
	us9lNv+51MC06P5h9d1fW6XJs/GYU0TzXDD5/mk4ZHNRsCj1pt8Izz9Uyy4ZzCA2
	kQe0G2OVBd7tUn75b4wwuwqf7MkS7aTgCx/3sTmllLK4cJaw72Y7tvdU/nqA8G1S
	7c/iWTpoV4P5yOTF2fRIduU/oOt59ckMDErLFNb/8t7iRzmaM0mvHIgUiml2XAfK
	bHleVQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6y246-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 11:08:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 597B8wtM003451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Oct 2025 11:08:58 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 7 Oct
 2025 04:08:53 -0700
Message-ID: <5fc715ac-1e24-ee59-db24-cc0a5797c43e@quicinc.com>
Date: Tue, 7 Oct 2025 16:38:50 +0530
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
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <quic_pragalla@quicinc.com>, <quic_sayalil@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <kernel@oss.qualcomm.com>, Sachin Gupta <quic_sachgupt@quicinc.com>
References: <20250929113515.26752-1-quic_rampraka@quicinc.com>
 <20250929113515.26752-4-quic_rampraka@quicinc.com>
 <20251006214432.GA625548-robh@kernel.org>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <20251006214432.GA625548-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX+SLHdyeCR9lL
 TeLrh53DZj7gcM4urDYryl9TJOls2u2pz9CjOg7leQxE+nCXkEKxFBNdUMeeZxetS4Lqe7ccRE+
 afOQDUB3b8ncHeCXxu0yc15xftXwEoyEPCQAiGQs6H6/b7Ti6ZzKylReSxXNFT7R17jZmxBV7TN
 hRUhcVw9zKNg8ayO66rb1OzP8fxIvmMvC8U5QhKXJXmejw6g2JEmpD0QsX33eOCy7aeByLETg2L
 XB3ajtIm2zI1SVcq2VV+MHVHFk7ur6O7JAastHAWVKj+idxXQBjtV60f5E+6KQ5Gqp7FzrcR0Hb
 0fEOfFflzqhekalzyUhW/191apfjiL4IToR8KOQAjQXY9njS3OumnriJFnHItHw5zDHRNIeQU4f
 I8kgkAWc68v10tM4KNTPKG02jBADXA==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e4f4cc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8
 a=RsA-RdRemkjXYStCCQ0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: z8PmnhSOZPyxjv8C6nyjDL9CkS_mti8y
X-Proofpoint-ORIG-GUID: z8PmnhSOZPyxjv8C6nyjDL9CkS_mti8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On 10/7/2025 3:14 AM, Rob Herring wrote:
> On Mon, Sep 29, 2025 at 05:05:14PM +0530, Ram Prakash Gupta wrote:
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
> Don't add new users of of_get_property which adds untracked pointers to 
> raw DT data.

Adrian also checked and provided some suggestion, and with those I could
get rid of this function, so it is no longer needed.

>
>> +		return -EINVAL;
>> +
>> +	sz = sz / sizeof(*arr);
>> +	if (sz <= 0)
>> +		return -EINVAL;
>> +
>> +	arr = kcalloc(sz,  sizeof(*arr), GFP_KERNEL);
> Why do you need to count the length first when only 5 entries is valid?

This line also would not be needed in needed in next patchset.

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
> You just leaked memory. devm_* functions are your friend.

These changes would also be removed in next patchset, after addressing
Adrian comment.

>
>> +	}
>> +
>> +	for (i = 0, j = 0; j < 2; i = i + 5, j++) {
>> +		msm_host->dll.dll_config[j] = dll_table[i];
>> +		msm_host->dll.dll_config_2[j] = dll_table[i + 1];
>> +		msm_host->dll.dll_config_3[j] = dll_table[i + 2];
>> +		msm_host->dll.dll_usr_ctl[j] = dll_table[i + 3];
>> +		msm_host->dll.ddr_config[j] = dll_table[i + 4];
>> +	}
>> +
>> +	msm_host->artanis_dll = true;
>> +
>> +	kfree(dll_table);
>> +
>> +	return 0;
>> +}

