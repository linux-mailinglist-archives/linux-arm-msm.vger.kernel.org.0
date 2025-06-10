Return-Path: <linux-arm-msm+bounces-60771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8667EAD35E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE2693B752E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4ADE28FA90;
	Tue, 10 Jun 2025 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QU6Z1+oY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F75128F505;
	Tue, 10 Jun 2025 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557858; cv=none; b=CEDYJh1rQfFXm5gtolQDQ7C6+56jWFVHxhRrQNpOWWgK4o+OTb98S0+rs4ICU7nzZp/OQ4OKV0RqaD95A0+W9gUYzVKL88Fof+jb+icFoiVHV+Gf+Wculx/yhotZRqtMPJgeaCEcwltg/zddN1t5lg7QYhqwXzkWUR1qN7GAJ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557858; c=relaxed/simple;
	bh=y6NYdJrX44qvxVkq5LKTymKx31DAXj/dmGnEpDpOC/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uyiqY1I4AEWhSBGVj/kbswEagNtYAsYzxqCTUqn7vs84iEjKc+25GwPIw3gyVmlHcrGNduwUWh5Y38A4tckFiHIzFifU0+qAkCzqV+iKb6huJMz+wjnO9CfT++BUIyQ72e5LXyCsUeaPc5HdWVFWo9sGLzEanyIpoyUS2qz3yzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QU6Z1+oY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8plaZ017883;
	Tue, 10 Jun 2025 12:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FxdBY5xBqTprJrGJQ+fwA8QclTkI3VTDaGBoTkVJ/YE=; b=QU6Z1+oYx+QPMRLm
	iGWDq8/sxX4squM7iQ2KTaRGa1ERm7i45tjwwk+BjoEYev083/z16X822KOX3TeA
	HyRxiBAnVUGzEFyavwa6jN8eL4+LlWnfg57mCEqV3OHi00xU109QDELlTABpdblh
	o6WRVk2Ax5xfdSnCYYdOIrmP4dXXquRu8BvcSmDWhCOWw+eHmd8oI07SK+bHWwMe
	qhjXP6aKrokuNyZyPHR1Ts5rCZGSzD5za/bmwMIt3ecSKnjBbS6WHjUev13dP2/X
	NhT3Y5YrtKn5g1jGlgwgAK9Fwnl5fyWsyxuiAcwv0DpNHR2bLjcT9PG7lhZKBl2K
	BXgyBg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcj497-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 12:17:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55ACHUK5018491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 12:17:30 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Jun
 2025 05:17:25 -0700
Message-ID: <c6ca33b2-f8c5-66e7-bb3b-dd595ed040c5@quicinc.com>
Date: Tue, 10 Jun 2025 17:47:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 3/4] mmc: sdhci-msm: Add Device tree parsing logic for
 DLL settings
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
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sartgarg@quicinc.com>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-4-quic_sachgupt@quicinc.com>
 <6xvsnmbnnvpmlgvmi42pt4d3ugkrxhrgrkp56szqhgh2foxe72@z4ildfxufq7j>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <6xvsnmbnnvpmlgvmi42pt4d3ugkrxhrgrkp56szqhgh2foxe72@z4ildfxufq7j>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6848225b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=Tov6CRWxun8MKIioD9AA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tQtwuj93SowY7wk3mNMyxZ1-kI8zgTbM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5NSBTYWx0ZWRfX7AZf1wyV+Z5+
 57N4kNPGkaFJTNcpWN6811WLXbi4KSLUbsJiTmmMb91CsF5KdHpsI5hhwJ5XOjiznuzH37eVYD9
 3POuUw4XX/HGBuknosE1mllM1+q66uXQ5m6vQQtZhcIRs2tqPfLTKWkKTV5HXC7IVYbYU/pgJHg
 UltEnsUXoTDC/JzNKz/817Aw4Gp9zsUIJwuVElbSrf/3IQdmLbuo9EU/IWdngnlvzA+pSAT6shy
 a0ZgZdGjZ0WMEn/f2n/+QoULMEqSzoh/WB4FHTFoYcILZ5dIjK7Oknq9+w7AObRWPgeGExqgUP7
 QDe5flpp0QQZhHiAmn7xg73Xdv9jzPjfywymf4EBn+cusbr29shXu1H+zJdDStF5ecp03MuK0JV
 yVV4R5NidwK3RHnW3ZV9e94kNK2IXQw8ab+hQDJCs7zpX4aNoOyQYkL+HOThKj6RbVM6V5vs
X-Proofpoint-GUID: tQtwuj93SowY7wk3mNMyxZ1-kI8zgTbM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100095

Hi Dmitry,

As updated in [PATCH V3 2/2] of this series, I have started now to continue
this work. Will address your comment next.

Thanks,
Ram

On 1/22/2025 3:27 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 22, 2025 at 03:17:06PM +0530, Sachin Gupta wrote:
>> This update introduces the capability to configure HS200
>> and HS400 DLL settings via the device tree and parsing it.
>>
>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 86 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 86 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 2a5e588779fc..cc7756a59c55 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -256,6 +256,19 @@ struct sdhci_msm_variant_info {
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
>> @@ -264,6 +277,7 @@ struct sdhci_msm_host {
>>  	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
>>  	/* core, iface, cal and sleep clocks */
>>  	struct clk_bulk_data bulk_clks[4];
>> +	struct sdhci_msm_dll dll;
>>  #ifdef CONFIG_MMC_CRYPTO
>>  	struct qcom_ice *ice;
>>  #endif
>> @@ -292,6 +306,7 @@ struct sdhci_msm_host {
>>  	u32 dll_config;
>>  	u32 ddr_config;
>>  	bool vqmmc_enabled;
>> +	bool artanis_dll;
>>  };
>>  
>>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>> @@ -2400,6 +2415,74 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>>  	return ret;
>>  }
>>  
>> +static int sdhci_msm_dt_get_array(struct device *dev, const char *prop_name,
>> +				  u32 **bw_vecs, int *len)
> It just reads an array from the DT, please rename the bw_vecs param
> which is inaccurate in this case.
>
>> +{
>> +	struct device_node *np = dev->of_node;
>> +	u32 *arr = NULL;
>> +	int ret = 0;
>> +	int sz;
>> +
>> +	if (!np)
>> +		return -ENODEV;
>> +
>> +	if (!of_get_property(np, prop_name, &sz))
>> +		return -EINVAL;
>> +
>> +	sz = sz / sizeof(*arr);
>> +	if (sz <= 0)
>> +		return -EINVAL;
>> +
>> +	arr = devm_kzalloc(dev, sz * sizeof(*arr), GFP_KERNEL);
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
>> +	*bw_vecs = arr;
>> +	*len = sz;
>> +	ret = 0;
>> +
>> +	return ret;
>> +}
>> +
>> +static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
>> +{
>> +	int dll_table_len, dll_reg_count;
>> +	u32 *dll_table = NULL;
>> +	int i;
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
>> +	for (i = 0; i < 2; i++) {
>> +		msm_host->dll.dll_config[i] = dll_table[i];
>> +		msm_host->dll.dll_config_2[i] = dll_table[i + 1];
>> +		msm_host->dll.dll_config_3[i] = dll_table[i + 2];
>> +		msm_host->dll.dll_usr_ctl[i] = dll_table[i + 3];
>> +		msm_host->dll.ddr_config[i] = dll_table[i + 4];
>> +	}
>> +
>> +	msm_host->artanis_dll = true;
> And the pointer to dll_table is lost, lingering for the driver lifetime.
> Please drop the devm_ part and kfree() it once it is not used anymore.
>
>> +
>> +	return 0;
>> +}
>> +
>>  static int sdhci_msm_probe(struct platform_device *pdev)
>>  {
>>  	struct sdhci_host *host;
>> @@ -2446,6 +2529,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>  
>>  	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
>>  
>> +	if (sdhci_msm_dt_parse_dll_info(&pdev->dev, msm_host))
>> +		goto pltfm_free;
>> +
>>  	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
>>  	if (ret)
>>  		goto pltfm_free;
>> -- 
>> 2.17.1
>>

