Return-Path: <linux-arm-msm+bounces-40557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC0F9E5B98
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3957D289F0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB892221458;
	Thu,  5 Dec 2024 16:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ix/GHlMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D24A8F54
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733416823; cv=none; b=QWTXUztAA3tk+yJsoXBnyt7NyRtSpYd8cbi83R6BIaydhcvS9f9Vrcv9T8LvoQFgmUnWF9px9Rz6tzFHm8Kp2HS4o78kVVzK1U5az4qPtAzd4faltw2NtvST4WbAUqNQuzlg2WYovJJAtiivAWWuNx4DyP2TK9ujddYsxTZptOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733416823; c=relaxed/simple;
	bh=O/rZrRQu475vd7ZMflZJoDlOQhu1aGuLBhIqoLYN0sI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BASXNL93G0jMaOhhNVfBniJJXmD3SqGNZUXDbj41KMRkXxKdexmIDlSyVWgZ8Lszuw42u2ZymmLzpyM8qnNEn57/QDp5ZPavcrvjbO+mvdZrLJV9ym80gS1wlYcx4FSpBE6ynzLz3CV/zEA1Oyg5dgl3mKHD0Eu9FWvIokM2/x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ix/GHlMD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5EW3tK015930
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 16:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aLw29Pi7z7qUWfxhLPSPGB8n/z1YvzoWA9mAxcNsR00=; b=Ix/GHlMDJO3GphmL
	0kssS+ysRF1FXwcUqysgaOG59L1dsLB+SnhVEesECmxDmsngOXD/aqlEcjpo9h8J
	608+KDEiyX0yqmbUi7mjbEgLN/WOAJJy+Q8LfRXnE5h1iGTMqsVQ4rFpmmZnXtB6
	n/wKN4wWpiG1offZU8IaAKTTN+oJ5I6NGSpppjUq6c/B8/J8HsU6+eW2JQV45yZ0
	AF8RWTPw0bOEc6sI2kev7EeteMfL0j8cwtwekdYc1tj3Gta0fQvYhCYy0TV/uh7M
	wJumsAvk+3VTA01InyV6dk8XUWzm5IdRmzzgUTFV8pxz0VuDQczWrZHUUFiWYYjt
	e2gWJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be170c7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:40:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d3b1d1d8c1so2621786d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416820; x=1734021620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLw29Pi7z7qUWfxhLPSPGB8n/z1YvzoWA9mAxcNsR00=;
        b=VWnQIbsTSKGNPscMaNZEVJ+rU0r/lCUUus/taUjZA+475rQ3DcxlBbCCEYdYamJ/WC
         3zynFpfvMdtmWRM+d8SR6JFol5BZNbO+P2VEMqAtEDyFBjlYP5iK2mhZPsW5Fmsrd3Gf
         Vf61wKV9jEqI/1FlIhKrYtaRFN4ThLak/Bw5Y19nOXaEtawXNmVjK1FL9Ush4JQaBx6p
         06q9Jg6wPwidlo54a7js4RdXv7yyvNsIuUtT3Lrnue8YApNsviwN12buBhkRy7p39Nvs
         ho/sOw77FMzy6tTLUtj1JIvqvkEnLMDoX2Bz81CWwhgqM8r/VccsXJjDotELbUODrxe6
         vstw==
X-Forwarded-Encrypted: i=1; AJvYcCVhzsTOZMcKYgsDVPEY07axCVBzpnH2cHKlrW2JoSaBj7I6stjgcQNloFzPYSXrkQ7W2caLPJtNOailtElH@vger.kernel.org
X-Gm-Message-State: AOJu0YxWohTvzH7rBF+Z1K8XBUqgTLlPb4PlT7vBUWdHmPiOEBcqlQZg
	unzn7yISSxR+EJFjXAPfB7QuRkb1ienSVHnzUJWnGg2GAtDY2Us3c+dumvGTouzXAmAtW+7h4uA
	unMHCnjaTBJ5yTvg4c19j0j/YZRB9RcQH3Ple4BlOQRgwgyq1jRk2J+GY+bQZWlPZ
X-Gm-Gg: ASbGnctV7RWxbutVHeO9vooOnThr+PwSTvNub4RnNDxmnjfQ8tIP3CDhNtedN18uv5w
	LJL5T/Z3UZfp6Ol5hspFhFSr+9GPu2w3QPvMwH2B1tRfrJbehoGpLqiu079wRReyOz2Ca+Whh4D
	w+4tgP0Iq6555PsFH+sy/Eiv5oqmGXbvLDZ5ZjZbjaU5N13swv8+Kl3Ye796aLMY3beefvCG72+
	9JZqir5tsBzFcouw008y7XrvhV9KKGrQ3p9vWo5LT/AxNQRCUa69Y993RpXzWQUbKNQD+v1Ys1C
	MnJjR8yi4iTqgrYBw/Y6SX6BPmpuXY4=
X-Received: by 2002:ad4:576c:0:b0:6d8:a67e:b2ff with SMTP id 6a1803df08f44-6d8bb81ffdamr62000526d6.8.1733416819955;
        Thu, 05 Dec 2024 08:40:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQx8n0UgIEsXZ8s+AlTdnCo2VrzHdMoxFqa+DhiPMk0FP4LFAb01Hav3JtSk0XoXhGnAOfHA==
X-Received: by 2002:ad4:576c:0:b0:6d8:a67e:b2ff with SMTP id 6a1803df08f44-6d8bb81ffdamr62000196d6.8.1733416819528;
        Thu, 05 Dec 2024 08:40:19 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4db6csm114422066b.39.2024.12.05.08.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:40:18 -0800 (PST)
Message-ID: <710aa948-d27f-49f6-a4a8-73f6208502c3@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:40:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] phy: qcom: Introduce PCIe UNIPHY 28LP driver
To: Varadarajan Narayanan <quic_varada@quicinc.com>, lpieralisi@kernel.org,
        kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
        bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, p.zabel@pengutronix.de,
        quic_nsekar@quicinc.com, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20241204113329.3195627-1-quic_varada@quicinc.com>
 <20241204113329.3195627-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204113329.3195627-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x-cyfjTQ9SBT31UW3UvAl1b6bW1DAmkc
X-Proofpoint-ORIG-GUID: x-cyfjTQ9SBT31UW3UvAl1b6bW1DAmkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050121

On 4.12.2024 12:33 PM, Varadarajan Narayanan wrote:
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Add Qualcomm PCIe UNIPHY 28LP driver support present
> in Qualcomm IPQ5332 SoC and the phy init sequence.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

[...]

> +struct qcom_uniphy_pcie_regs {
> +	unsigned int offset;
> +	unsigned int val;

u32

> +};
> +
> +struct qcom_uniphy_pcie_data {
> +	int lanes;
> +	/* 2nd lane offset */
> +	int lane_offset;

'lanes', 'lane_offset' and '2nd lane' together imply one of:

- there can be more lines, all at an equal offset
- there can only ever be two lines

Please specify which one is the case

> +	unsigned int phy_type;
> +	const struct qcom_uniphy_pcie_regs *init_seq;
> +	unsigned int init_seq_num;
> +	unsigned int pipe_clk_rate;
> +};
> +
> +struct qcom_uniphy_pcie {
> +	struct phy phy;
> +	struct device *dev;
> +	const struct qcom_uniphy_pcie_data *data;
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +	struct reset_control *resets;
> +	void __iomem *base;
> +};
> +
> +#define	phy_to_dw_phy(x)	container_of((x), struct qca_uni_pcie_phy, phy)

A space after #define, please

> +
> +static const struct qcom_uniphy_pcie_regs ipq5332_regs[] = {
> +	{
> +		.offset = PHY_CFG_PLLCFG,
> +		.val = 0x30,
> +	}, {
> +		.offset = PHY_CFG_EIOS_DTCT_REG,
> +		.val = 0x53ef,
> +	}, {
> +		.offset = PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME,
> +		.val = 0xCf,

mixed case hex.. please make it lowercase

> +	},
> +};
> +
> +static const struct qcom_uniphy_pcie_data ipq5332_x1_data = {
> +	.lanes		= 1,
> +	.phy_type	= PHY_TYPE_PCIE_GEN3,
> +	.init_seq	= ipq5332_regs,
> +	.init_seq_num	= ARRAY_SIZE(ipq5332_regs),
> +	.pipe_clk_rate	= 250000000,
> +};
> +
> +static const struct qcom_uniphy_pcie_data ipq5332_x2_data = {
> +	.lanes		= 2,
> +	.lane_offset	= 0x800,
> +	.phy_type	= PHY_TYPE_PCIE_GEN3,
> +	.init_seq	= ipq5332_regs,
> +	.init_seq_num	= ARRAY_SIZE(ipq5332_regs),
> +	.pipe_clk_rate	= 250000000,
> +};

Are there going to be more UNIPHY-equipped SoCs?


> +
> +static void qcom_uniphy_pcie_init(struct qcom_uniphy_pcie *phy)
> +{
> +	const struct qcom_uniphy_pcie_data *data = phy->data;
> +	const struct qcom_uniphy_pcie_regs *init_seq;
> +	void __iomem *base = phy->base;
> +	int lane, i;
> +
> +	for (lane = 0; lane != data->lanes; lane++) {

while effectively the same, < would be less eyebrow-raising

> +		init_seq = data->init_seq;
> +
> +		for (i = 0; i < data->init_seq_num; i++, init_seq++)
> +			writel(init_seq->val, base + init_seq->offset);

writel(init_seq[i].val, ...)

> +
> +		base += data->lane_offset;
> +	}
> +}
> +
> +static int qcom_uniphy_pcie_power_off(struct phy *x)
> +{
> +	struct qcom_uniphy_pcie *phy = phy_get_drvdata(x);
> +
> +	clk_bulk_disable_unprepare(phy->num_clks, phy->clks);
> +
> +	reset_control_assert(phy->resets);

This can fail, return it instead of zero

[...]

> +MODULE_LICENSE("Dual BSD/GPL");

I think this is too vague, there are many BSD variants

Konrad

