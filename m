Return-Path: <linux-arm-msm+bounces-78889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA083C0D783
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02C85189EB1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6341F285CAD;
	Mon, 27 Oct 2025 12:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4x+Ee6H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62DE2F7AC2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761567448; cv=none; b=uX4PMVTpJJCLOkLACWOkk7H339HP6Tbhpy/AZnj769LEMHgxQro6NdFldevsz+zKLE8faEQtVuvfgsFw+JDmjcvN/iqzdj0K2Q0EBV8Qzu3XMJKqQoSNCS7D0vSXlDsewnES0Ya9YZ9pIDi3z54HIFpR34OBNwEIcvuWDuzUpVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761567448; c=relaxed/simple;
	bh=7vlnI0TZ5Bag1tUeBU15VJaSZYQAFkM9+UW4jGEHfj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmxTXRO3ong9cKeHR442Q1GxnoIsZ9TbCw/+0IDG0fO7w/2dOJLLTf9MP1eeB8wUElSwcwl7u/tcvlAKsKTWKd+/APGKZouotD8fUdAPtthwL0TamyctFQcTwpHr62w9GW1ELSrPlglnE5DH4PD+ZQxzLkY6jz6gMH4pdZhwVJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4x+Ee6H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8imdO932267
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJvMEwqlichb9fnTMHjp29i2LRX7Vih/4tQCp22heU8=; b=U4x+Ee6HZZ/Mcfe9
	wyeE1KG7IGu+HYQSWlt2rfioW9Ubzn0/30tmVjKllCNTMGR4YfsZnktSLxT+lF0e
	RUtLVCkoNhvxA/J7Aai7k/2StMGw9ZI586ve8XFp3hzRKjwH6Q0r1am8dVAZEEay
	XcoSrDjuCikB8S2/zHLn7gMw1VVCM8l+v8gz+NksmD0RaBq7QI0LogtKRvATYEWV
	5uVVtgMzmuS5THvQAJGgbOqjqAvVUQcfuOKQUPjOEgXgyJNuKl3Tj2NMuLpvc9in
	hYW3I3LwdWw8dpPgIn0iSGmnVLfE6vH9kitN03D7idoHV4OCUQPruSBCFdF3wh+3
	aKM87Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1ud1swbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:17:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ecf8fad13dso2698191cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761567445; x=1762172245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJvMEwqlichb9fnTMHjp29i2LRX7Vih/4tQCp22heU8=;
        b=gvsdnRPrA/YKNAEuF87AqM/UZB2FVlFbv2KTCI99QREbKbGutsGHrZiIkoy90KWQVl
         0GQxwC31GKczRkwHUSRLUOFl3WZ/Auy+sjDFxXTRw+Ko0t4O4DEEx654EEsjh30myGB1
         qtkgEEJhuGDWkA1rBNTc1y70gBCjxl4leOVlGGTdsKiTrHYIQJ7Lg7vJZpWQJWfeQcxL
         kVsc8RC6/DaGevmK/PCpynKlQR5NEpf/bCH6eyZVYNm57ik8m2YH+cTigqn/OndhprSs
         Ywn8QFWaGHoY/uXp19YkWk/mldOBzpg9C1NdF3KNd9HY4+eYTrLbMt/drexQW3pLVB8C
         SsYw==
X-Gm-Message-State: AOJu0YyzlOYQAPaKSyjoiY7Cx95IN4ysmEmUshCKaoEvbgFSh2smLgQx
	VE1sRuX68hsPWenH4YQAlHaHo/DkCESCvSQZLUaFk3W7wNSDlVgaViLu36lJ/yqTPHEJVQwgrMA
	Xr9DZdjzSKnR0im+Us3PW4l8jzjHpOAO3wXJkKUYJVlb2wY6H3DtTrnt4RtbWrWGXhgXY
X-Gm-Gg: ASbGncuT6/WVbRCzf4TVuHzsGAcER07ddrr44HRAkY5L9ZkTh+MhdPxmfnsc4ZZdncq
	oMisw2yNHO04dO3TvxpwrBSams7Dx+W7eBqaBwlkJ3RQW1DK1qv07uuiWAWZOpx10kHuSxHOf/J
	bGi6uyLnVnmVFjd6E+nYcAt4Jw8D0HHy2KboeMU1XrPmkOm1aoV6CNHs2Zi+0yGqW11Hoxv5PGf
	n1+ZwCFAFfoIL6OCj6WfeoMAq+ueYbK1FEejOjQTcK9sDiH2V2L7NieEY3n1dwUJLROm6itlOdN
	UTY1ODfqplwnl0BWth9zLWfJqUaOXduoE4r2DitjlRcCSF/a5n2WuC2Rup/jVZwUqBLRbkxBnPO
	NRmTUrCCgc28SnO9MLDe1h2Iz5CJt0UbSqTdZ3gvhhQ6Y6me2tG/BfLe9
X-Received: by 2002:a05:622a:148b:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4ea11710be3mr199776211cf.7.1761567444543;
        Mon, 27 Oct 2025 05:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/9nzepqcV3rOG2J5du1tIjffmHU4HFXiE9u0kz+PomNxTiOJlIcR4pib/NCaufzkxJVJVOg==
X-Received: by 2002:a05:622a:148b:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4ea11710be3mr199775901cf.7.1761567444041;
        Mon, 27 Oct 2025 05:17:24 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8536968csm756291566b.29.2025.10.27.05.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 05:17:23 -0700 (PDT)
Message-ID: <35ae8415-9308-4cbc-b14e-c3cdc0a2318a@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 13:17:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com
References: <20251024-pmic_arb_v8-v3-0-cad8d6a2cbc0@oss.qualcomm.com>
 <20251024-pmic_arb_v8-v3-3-cad8d6a2cbc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024-pmic_arb_v8-v3-3-cad8d6a2cbc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNCBTYWx0ZWRfX7Hfp7+c/7DZT
 Aux8DW3yCpBvHzMMtb+yWhsdlWmkkLvjE/ZdJ8xOsjB+bpDFtit/TJMOE4Gt8YS1PN+3t+3+dHX
 /Ufhz4rJdB022Qx6sBnsW/v98Wfs5OeEAzDAhQOfsc2R+YEgfpMRsp5TdCTNt6VC40ssPni2vP8
 jMViK/8JbFSuUU2nvy/MP+9xr7pR0j1ANgaHiZUeF4WjrqXDsG8f49QzTsRCG+mxXkaFbov+Mc1
 MryvEmbsIBOZhCbtnN3PuugwXNxnHyix9qXcNGZJjVBbe1h4UO3HlFVG0feyXpBjYYHI0MX8nbt
 Lvh1TYDGswfQfhm4rC8yfoSGVHlwdlAtpBiUol56S+y6e71SJON10oa6cqQoL2CQTYiekj8Ckm0
 P2Db4k5uJ8XFI3TCTXk5YxYqTUCdIA==
X-Proofpoint-GUID: CcllfQ8R07SnSjVo5-8I5ZV5PxBHTGWS
X-Proofpoint-ORIG-GUID: CcllfQ8R07SnSjVo5-8I5ZV5PxBHTGWS
X-Authority-Analysis: v=2.4 cv=UqNu9uwB c=1 sm=1 tr=0 ts=68ff62d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=09qoSp1JXfaB3g97fQAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270114

On 10/24/25 11:33 AM, Jishnu Prakash wrote:
> From: David Collins <david.collins@oss.qualcomm.com>
> 
> PMIC arbiter v8 supports up to 4 SPMI buses and up to 8192 PMIC
> peripherals.  Its register map differs from v7 as several fields
> increased in size. Add support for PMIC arbiter version 8.
> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  drivers/spmi/spmi-pmic-arb.c | 324 +++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 294 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 91581974ef84..612736973e4b 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2012-2015, 2017, 2021, The Linux Foundation. All rights reserved.
>   */
>  #include <linux/bitmap.h>
> +#include <linux/bitfield.h>

bit'f'ield < bit'm'ap

[...]

>  #define spec_to_hwirq(slave_id, periph_id, irq_id, apid) \
> -	((((slave_id) & 0xF)   << 28) | \
> -	(((periph_id) & 0xFF)  << 20) | \
> -	(((irq_id)    & 0x7)   << 16) | \
> -	(((apid)      & 0x3FF) << 0))
> +	(FIELD_PREP(GENMASK(28, 24), (slave_id))  | \
> +	FIELD_PREP(GENMASK(23, 16), (periph_id)) | \
> +	FIELD_PREP(GENMASK(15, 13), (irq_id))    | \
> +	FIELD_PREP(GENMASK(12, 0),  (apid)))

I think this could be further improved by:

#define SOMETHING_SLAVE_ID_SOMETHING	GENMASK(28, 24)

and then below:

[...]

> -	if (intspec[0] > 0xF || intspec[1] > 0xFF || intspec[2] > 0x7)
> +	if (intspec[0] > 0x1F || intspec[1] > 0xFF || intspec[2] > 0x7)
>  		return -EINVAL;

we can use FIELD_MAX(SOMETHING...)

[...]

> +static int pmic_arb_get_core_resources_v8(struct platform_device *pdev,
> +					  void __iomem *core)
> +{
> +	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> +
> +	pmic_arb->apid_map = devm_platform_ioremap_resource_byname(pdev,
> +								   "chnl_map");

Feel free to unwrap this line

> +	if (IS_ERR(pmic_arb->apid_map))
> +		return PTR_ERR(pmic_arb->apid_map);
> +
> +	pmic_arb->core = core;
> +
> +	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS_V8;
> +
> +	return pmic_arb_get_obsrvr_chnls_v2(pdev);
> +}
> +
> +static int pmic_arb_get_bus_resources_v8(struct platform_device *pdev,
> +					 struct device_node *node,
> +					 struct spmi_pmic_arb_bus *bus)
> +{
> +	int index;
> +
> +	index = of_property_match_string(node, "reg-names", "chnl_owner");
> +	if (index < 0) {
> +		dev_err(&pdev->dev, "chnl_owner reg region missing\n");
> +		return -EINVAL;
> +	}
> +
> +	bus->apid_owner = devm_of_iomap(&pdev->dev, node, index, NULL);
> +
> +	return PTR_ERR_OR_ZERO(bus->apid_owner);

Is this any different chan using devm_platform_ioremap_resource_byname()
like you did above?


> +}
> +
> +static int pmic_arb_read_apid_map_v8(struct spmi_pmic_arb_bus *bus)
> +{
> +	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
> +	struct apid_data *apidd;
> +	struct apid_data *prev_apidd;
> +	u16 i, apid, ppid, apid_max;
> +	bool valid, is_irq_ee;
> +	u32 regval, offset;
> +
> +	/*
> +	 * In order to allow multiple EEs to write to a single PPID in arbiter
> +	 * version 8, there can be more than one APID mapped to each PPID.  The
> +	 * owner field for each of these mappings specifies the EE which is
> +	 * allowed to write to the APID.  The owner of the last (highest) APID
> +	 * which has the IRQ owner bit set for a given PPID will receive
> +	 * interrupts from the PPID.
> +	 *
> +	 * In arbiter version 8, the APID numbering space is divided between
> +	 * the SPMI buses according to this mapping:
> +	 * APID = 0     to N-1       --> bus 0
> +	 * APID = N     to N+M-1     --> bus 1
> +	 * APID = N+M   to N+M+P-1   --> bus 2
> +	 * APID = N+M+P to N+M+P+Q-1 --> bus 3
> +	 * where N = number of APIDs supported by bus 0
> +	 *       M = number of APIDs supported by bus 1
> +	 *       P = number of APIDs supported by bus 2
> +	 *       Q = number of APIDs supported by bus 3
> +	 */
> +	apidd = &bus->apid_data[bus->base_apid];
> +	apid_max = bus->base_apid + bus->apid_count;
> +	for (i = bus->base_apid; i < apid_max; i++, apidd++) {
> +		offset = pmic_arb->ver_ops->apid_map_offset(i);
> +		regval = readl_relaxed(pmic_arb->apid_map + offset);
> +		if (!regval)
> +			continue;
> +		ppid = regval & PMIC_ARB_V8_PPID_MASK;
> +		is_irq_ee = PMIC_ARB_V8_CHAN_IS_IRQ_OWNER(regval);

[...]


If you parametrize the masks, the diff against pmic_arb_read_apid_map_v5
is 3 lines of code instead


> +
> +	return 0;
> +}
> +
> +static int pmic_arb_init_apid_v8(struct spmi_pmic_arb_bus *bus, int index)
> +{
> +	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
> +	int ret, i;
> +
> +	if (index < 0 || index >= PMIC_ARB_MAX_BUSES_V8) {
> +		dev_err(&bus->spmic->dev, "Unsupported bus index %d detected\n",
> +			index);
> +		return -EINVAL;
> +	}
> +
> +	bus->base_apid = 0;
> +	bus->apid_count = 0;
> +	for (i = 0; i <= index; i++) {
> +		bus->base_apid += bus->apid_count;
> +		bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES + i * 4) &
> +						PMIC_ARB_FEATURES_V8_PERIPH_MASK;

You can almost replace pmic_arb_init_apid_v7 with this impl

[...]

> +static void __iomem *
> +pmic_arb_apid_owner_v8(struct spmi_pmic_arb_bus *bus, u16 n)
> +{
> +	return bus->apid_owner + 0x4 * (n - bus->base_apid);
> +}

This is identical to pmic_arb_apid_owner_v7

Konrad

