Return-Path: <linux-arm-msm+bounces-50920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F69A5BB54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2F777A6426
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 08:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3532A23237C;
	Tue, 11 Mar 2025 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hkxErCkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A764422B59D;
	Tue, 11 Mar 2025 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683418; cv=none; b=hdOCiZEdQ0vJcDnPzhHb185m0pTZPONpMBU3DeJDX20HMgyAGaukSpf+c+Vfaw+3Ao2i/4xCdAwxDbVlKLxBOxQxtgmS/FtJbHqWeahu3gGYKqOiS67Uv1KrHg/kZ2oyLknvN9/PdRgqVf4gsDVdtJwYAi9HFu/6rCtZcykbCQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683418; c=relaxed/simple;
	bh=Jo9gV2WeqEIzH0koZkOqg/dgypAdrFw4uW3AeHXDdQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b9UUhj7cntnLj8s/NV3hIZkVf0dVncA8NgLnmjjpo1f+2pjQ6cBym4jteD2ZUNZeUIUAwzyV8WE1H9sSFw5n25DRuVGW3Gkf3Q85RqSbs3977fZnryPx8FtDhbvpxVw1TM0Am0bHq+puN5LCvGIDE5fdfbuDWyDIU2YCBVrNpSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hkxErCkd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B8ixTS013127;
	Tue, 11 Mar 2025 08:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hVWsZ53cfg6ylOMg435wKEaqSOis9OxShBeuIA+hITk=; b=hkxErCkdIkFi0B5v
	ADWsZPpNEXwRGmvyLMXrPhZ9ccqKlGe1oxBPQQAt4VqOFHF9EPuVYYVfrglH38aU
	rsZH4c8XKPmZoM52nGkpNjBubFrcFeb9fAAlyGK8ZxFS/Oumj3N9HcSZHrdJv2dO
	JeAGvbV3zY0AHgGYaQ8GLlyOIn2BuEVkxnOkFIY0chVzcQ3ZYur7dG2A+EmUfnfw
	jhDQdzi2Wz2iY2Eyit093FDPsayvZD5tqRvVpAgmDXIL442meF24otaVP4rGO4KO
	4qNkii9krWighGk1QeQ7nFD3lolIuxnuwXMbNWu1zTZOJoYxO+NzsEkw8tduTEju
	K+eP3g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0w7tc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:56:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52B8uqae022171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:56:52 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 01:56:46 -0700
Message-ID: <6a73a0d3-f5fb-46cf-b55b-9f8b4af9df4c@quicinc.com>
Date: Tue, 11 Mar 2025 14:26:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] clk: qcom: common: Add support to configure PLL
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <20250306-videocc-pll-multi-pd-voting-v2-2-0cd00612bc0e@quicinc.com>
 <91561f37-5309-45f1-a1d7-20228ba68c2e@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <91561f37-5309-45f1-a1d7-20228ba68c2e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hCqw_xvsas3181S8OkjThrqxvZO0LcqR
X-Proofpoint-GUID: hCqw_xvsas3181S8OkjThrqxvZO0LcqR
X-Authority-Analysis: v=2.4 cv=MICamNZl c=1 sm=1 tr=0 ts=67cffad4 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKJ9gdNFWaWt-nm7_UYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=820 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110060



On 3/6/2025 5:52 PM, Konrad Dybcio wrote:
> On 6.03.2025 9:55 AM, Jagadeesh Kona wrote:
>> From: Taniya Das <quic_tdas@quicinc.com>
>>
>> Integrate PLL configuration into clk_alpha_pll structure and add support
>> for qcom_cc_clk_alpha_pll_configure() function which can be used to
>> configure the clock controller PLLs from common core code.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
> 
> [...]
> 
>> +static void qcom_cc_clk_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap)
>> +{
>> +	if (!pll->config || !pll->regs)
>> +		return;
> 
> This should probably throw some sort of a warning
> 

Yes, will add a warning here and for default case in next series.

Thanks,
Jagadeesh

>> +
>> +	switch (GET_PLL_TYPE(pll)) {
>> +	case CLK_ALPHA_PLL_TYPE_LUCID_OLE:
>> +		clk_lucid_ole_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_LUCID_EVO:
>> +		clk_lucid_evo_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_TAYCAN_ELU:
>> +		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
>> +		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_TRION:
>> +		clk_trion_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_2290:
>> +		clk_huayra_2290_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_FABIA:
>> +		clk_fabia_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_AGERA:
>> +		clk_agera_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_PONGO_ELU:
>> +		clk_pongo_elu_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_ZONDA:
>> +	case CLK_ALPHA_PLL_TYPE_ZONDA_OLE:
>> +		clk_zonda_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_STROMER:
>> +	case CLK_ALPHA_PLL_TYPE_STROMER_PLUS:
>> +		clk_stromer_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_DEFAULT:
>> +	case CLK_ALPHA_PLL_TYPE_DEFAULT_EVO:
>> +	case CLK_ALPHA_PLL_TYPE_HUAYRA:
>> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_APSS:
>> +	case CLK_ALPHA_PLL_TYPE_BRAMMO:
>> +	case CLK_ALPHA_PLL_TYPE_BRAMMO_EVO:
>> +		clk_alpha_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	default:
>> +		break;
> 
> And so should the 'default' case
> 
> Konrad

