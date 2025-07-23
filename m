Return-Path: <linux-arm-msm+bounces-66224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B32B0EF86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEB833A1397
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A39428B4FE;
	Wed, 23 Jul 2025 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PKPBIZ63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC40277815;
	Wed, 23 Jul 2025 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753265693; cv=none; b=AJEgub7Rpv7Py4J+VJiTnUbVV+MvFXYP0y+NNsAy8Ihne8nBgfESKsEqcLCKJ06kIqGPwX71ONQbduXhU4QjQktHx85RmDUpmut9gqhMNtEcaV48zLOZeU0xPEc57HLWJaGbLGfVRGylx4Lsg66eLeSLfunyf+049cMjpNi1T7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753265693; c=relaxed/simple;
	bh=9y+NewdU8JDjXe6g81MDeJ4g+IzKp6FoMp0FOu06SE4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=e/rJrG/0yT/gzs3pxtpGG3JpFc55dpgabKsno8cqlAfsi/5m8I0aoi7fOwAvW9B5nJ/AhP+DJ7e2M1f+eFX50cZy4riHKWyNezdwRDN7+3dyRAmhBtF3UHmX/3hdVLCnLy45eGQMMjVtPzk/SCF+kdb3uBrZ36dh595XnKbzCtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PKPBIZ63; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9Ad5J005070;
	Wed, 23 Jul 2025 10:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	87N+K9KDP8evMWZm5EOpf0kZrjjMVuiFxQXS76c3gPw=; b=PKPBIZ63W1pAmu8s
	YwLyi5Rhzele9NVC/M9P/BEZNY6gj8IOKwT9EPLuaGiq0z57V82siWG9CTx1jYah
	XP8KF/18+Te+e6+2mQh6Lkl26kf1KIS1JN9RDDuqD1+0QCmX9/YPrA19wk5SB7ro
	eKbwmm7JuWf9wlqxlLNqDLNfqA8h+/Um8HMkozQ4yyh7ErUAfLLzBLv9Hga9XKfL
	6EMqI1BtlBOqViJnDbtK6N5nkvB34wT9LhMXXbjRBEjj7MgJwJQaN5wk1yiPnv+b
	mNkoo2Kgf5ePveRzFVRjYkxQHbr81BsThbv6WAQcWPbFor6dyOI1pahztyP4/vP0
	4SLi6A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w5w2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 10:14:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56NAEkcH018654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 10:14:46 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Jul
 2025 03:14:40 -0700
Message-ID: <d0af754d-8deb-041f-8e34-1c1214fccb09@quicinc.com>
Date: Wed, 23 Jul 2025 15:44:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Subject: Re: [PATCH V3 3/4] mmc: sdhci-msm: Add Device tree parsing logic for
 DLL settings
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
 <c6ca33b2-f8c5-66e7-bb3b-dd595ed040c5@quicinc.com>
Content-Language: en-US
In-Reply-To: <c6ca33b2-f8c5-66e7-bb3b-dd595ed040c5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=6880b617 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=JqPsJo7-EimBCnq-3ZEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NiBTYWx0ZWRfX/ijKF+FquM8r
 0OE7Lk6jkh0Ut7Hp129m3Un6x8WM4x+CyAx/60GxlHSS8br8MDrYIwI7hKEXfZStBScpgpAxyyL
 2YeGGIZM8TV+2WrQ88fKlishgllwEUFDoYNqDOrQDx41KKE5zxDoj1VDZ/vw1NpyL1phmH/OTPd
 XSox4V5wX9y6qEDpt6A7H2bDXU2U5VvQmwSg7lM5d5xWeiY1S7BfC4KCgrqSRu+6NvfetHh+FEb
 vKtgmZbr8D1ML2CVnapeV4bw5LcecK4VUfjEQ04ssaxmnIgRfp6QyYdeZv/HD9Hf3sksx+GUJvH
 t+vg6HvLDQJG/aIfw0eTm8dAUeoyHs8uE9vLKQIypDjJTpTY1lIj1b9fiD2NouxUd0S2tINuq1+
 xuABeQECCrG6zKqfpoXt4gwZ3f84PSi5cPL1wGXFnf9SFcC2gnF/e279IHsu2G1cxLwTUtQ9
X-Proofpoint-ORIG-GUID: bzxLKbzPhIuYGiZp3mKBMhq90WxeytPS
X-Proofpoint-GUID: bzxLKbzPhIuYGiZp3mKBMhq90WxeytPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230086


On 6/10/2025 5:47 PM, Ram Prakash Gupta wrote:
> Hi Dmitry,
>
> As updated in [PATCH V3 2/2] of this series, I have started now to continue
> this work. Will address your comment next.
>
> Thanks,
> Ram
>
> On 1/22/2025 3:27 PM, Dmitry Baryshkov wrote:
>> On Wed, Jan 22, 2025 at 03:17:06PM +0530, Sachin Gupta wrote:
>>> This update introduces the capability to configure HS200
>>> and HS400 DLL settings via the device tree and parsing it.
>>>
>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>> ---
>>>  drivers/mmc/host/sdhci-msm.c | 86 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 86 insertions(+)
>>>
>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>> index 2a5e588779fc..cc7756a59c55 100644
>>> --- a/drivers/mmc/host/sdhci-msm.c
>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>> @@ -256,6 +256,19 @@ struct sdhci_msm_variant_info {
>>>  	const struct sdhci_msm_offset *offset;
>>>  };
>>>  
>>> +/*
>>> + * DLL registers which needs be programmed with HSR settings.
>>> + * Add any new register only at the end and don't change the
>>> + * sequence.
>>> + */
>>> +struct sdhci_msm_dll {
>>> +	u32 dll_config[2];
>>> +	u32 dll_config_2[2];
>>> +	u32 dll_config_3[2];
>>> +	u32 dll_usr_ctl[2];
>>> +	u32 ddr_config[2];
>>> +};
>>> +
>>>  struct sdhci_msm_host {
>>>  	struct platform_device *pdev;
>>>  	void __iomem *core_mem;	/* MSM SDCC mapped address */
>>> @@ -264,6 +277,7 @@ struct sdhci_msm_host {
>>>  	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
>>>  	/* core, iface, cal and sleep clocks */
>>>  	struct clk_bulk_data bulk_clks[4];
>>> +	struct sdhci_msm_dll dll;
>>>  #ifdef CONFIG_MMC_CRYPTO
>>>  	struct qcom_ice *ice;
>>>  #endif
>>> @@ -292,6 +306,7 @@ struct sdhci_msm_host {
>>>  	u32 dll_config;
>>>  	u32 ddr_config;
>>>  	bool vqmmc_enabled;
>>> +	bool artanis_dll;
>>>  };
>>>  
>>>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>>> @@ -2400,6 +2415,74 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>>>  	return ret;
>>>  }
>>>  
>>> +static int sdhci_msm_dt_get_array(struct device *dev, const char *prop_name,
>>> +				  u32 **bw_vecs, int *len)
>> It just reads an array from the DT, please rename the bw_vecs param
>> which is inaccurate in this case.

I will rename this to "dll_table".

>>> +{
>>> +	struct device_node *np = dev->of_node;
>>> +	u32 *arr = NULL;
>>> +	int ret = 0;
>>> +	int sz;
>>> +
>>> +	if (!np)
>>> +		return -ENODEV;
>>> +
>>> +	if (!of_get_property(np, prop_name, &sz))
>>> +		return -EINVAL;
>>> +
>>> +	sz = sz / sizeof(*arr);
>>> +	if (sz <= 0)
>>> +		return -EINVAL;
>>> +
>>> +	arr = devm_kzalloc(dev, sz * sizeof(*arr), GFP_KERNEL);
>>> +	if (!arr)
>>> +		return -ENOMEM;
>>> +
>>> +	ret = of_property_read_u32_array(np, prop_name, arr, sz);
>>> +	if (ret) {
>>> +		dev_err(dev, "%s failed reading array %d\n", prop_name, ret);
>>> +		*len = 0;
>>> +		return ret;
>>> +	}
>>> +
>>> +	*bw_vecs = arr;
>>> +	*len = sz;
>>> +	ret = 0;
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
>>> +{
>>> +	int dll_table_len, dll_reg_count;
>>> +	u32 *dll_table = NULL;
>>> +	int i;
>>> +
>>> +	msm_host->artanis_dll = false;
>>> +
>>> +	if (sdhci_msm_dt_get_array(dev, "qcom,dll-hsr-list",
>>> +				   &dll_table, &dll_table_len))
>>> +		return -EINVAL;
>>> +
>>> +	dll_reg_count = sizeof(struct sdhci_msm_dll) / sizeof(u32);
>>> +
>>> +	if (dll_table_len != dll_reg_count) {
>>> +		dev_err(dev, "Number of HSR entries are not matching\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	for (i = 0; i < 2; i++) {
>>> +		msm_host->dll.dll_config[i] = dll_table[i];
>>> +		msm_host->dll.dll_config_2[i] = dll_table[i + 1];
>>> +		msm_host->dll.dll_config_3[i] = dll_table[i + 2];
>>> +		msm_host->dll.dll_usr_ctl[i] = dll_table[i + 3];
>>> +		msm_host->dll.ddr_config[i] = dll_table[i + 4];
>>> +	}
>>> +
>>> +	msm_host->artanis_dll = true;
>> And the pointer to dll_table is lost, lingering for the driver lifetime.
>> Please drop the devm_ part and kfree() it once it is not used anymore.

ok, I ll allocate memory using kzalloc in function  sdhci_msm_dt_get_array
 and kfree() after copying data in this function.

Also the logic to copy the data in msm_host->dll.dll_config[x] is not
correct above, had to fix it as I was observing DLL related issues,
when testing different eMMC modes. Below is the correct code to copy
data correctly from dll_table.

"for (i = 0, j = 0; j < 2; i=i+5, j++) {
         msm_host->dll.dll_config[j] = dll_table[i];
         msm_host->dll.dll_config_2[j] = dll_table[i + 1];
         msm_host->dll.dll_config_3[j] = dll_table[i + 2];
         msm_host->dll.dll_usr_ctl[j] = dll_table[i + 3];
         msm_host->dll.ddr_config[j] = dll_table[i + 4];
}"

since the parsing itself was not correct, had to go through whole code
again and test all the modes of eMMC and SDCard.

All registers values of DLL are now matching with expected values passed
in dt, in all modes of eMMC and SDCard post required modes tuning.

eMMC tested modes are HS400ES/HS400/HS200/HS50/DDR52.
SDCard tested modes are SDR104/SDR50.

Thanks,
Ram

>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static int sdhci_msm_probe(struct platform_device *pdev)
>>>  {
>>>  	struct sdhci_host *host;
>>> @@ -2446,6 +2529,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>>  
>>>  	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
>>>  
>>> +	if (sdhci_msm_dt_parse_dll_info(&pdev->dev, msm_host))
>>> +		goto pltfm_free;
>>> +
>>>  	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
>>>  	if (ret)
>>>  		goto pltfm_free;
>>> -- 
>>> 2.17.1
>>>

