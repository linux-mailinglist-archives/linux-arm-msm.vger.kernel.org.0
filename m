Return-Path: <linux-arm-msm+bounces-46277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B3A1D957
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 16:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7DAE3A7ADD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 15:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B520F84A35;
	Mon, 27 Jan 2025 15:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRybVIDH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5265FDA7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 15:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737990999; cv=none; b=TrMNNvZPmyQf/0QzNl7TzoIBB0NtofbooKxiMB8c/ifOKPycgEuFs4gIqM100WdzKRocTi2SWWhqjWqOtzLsVHeBgAvKgIS1kn4Has27zTH0Zf9t+DrjVS4z720e7OZ3D08gMQ+UcYvXfdIVSLW72zZL4Rp5sQG2mp5IZNOgyq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737990999; c=relaxed/simple;
	bh=XXWwenXnSMIfC4eeFgueYgwPm2Um/6LbxvB2XdF7djg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DlKL7xMw4EHGRdnLM40HOpBIl0KdYcHYLhAWduKbRqWT0PWuo4YpPBcxMocFmduI43j53MY7YJaVP4/mg/C6U8VjmXEaJs8M3qQZr7R3DKTWk4hSRkJbEgEjNNZe2iMmH0NpdVra5BNlHe+2DS7PcI3uVfRCVI3E3HvQRIYT2C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRybVIDH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RCTZ4E021040
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 15:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eiOVlvy8O2sljdqhnTACcFcT/c+BYziyN9TVv9igCSg=; b=lRybVIDH/erv8Rke
	Huf178CITEZwh89jtxljjRNIzq6MtfNnY4DVt2h63q73kCiKDAD/gTfsXj+FB+Uj
	pRbtnxm1o92a6I+EFD3TM09Vl7nAXJuH6mKMZ5PGytMUDTvq+2CAZuF1SYuMOHAJ
	3CXyD920lvofbQB5GAEUzG5ZirwLhTgj/puBfkJ78x47kTAiGvsiitML7n/CuW3c
	MFnJ9bhqy8rx+Z5eo4VWGUIKTRuBQZE3Di5UNlz41238pNf3f9R1k3OZGYZUw3ZT
	sjp7NRj0cfSNM5IKTMushd+UqASJL0axMZz1mxgfknjiaetChpWnxHoIKfIDhw6L
	b/jS6g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ea6s0acb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 15:16:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6e43ed084so90807885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 07:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737990996; x=1738595796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiOVlvy8O2sljdqhnTACcFcT/c+BYziyN9TVv9igCSg=;
        b=vuv1+ECHCD2lJFbEl7S7qzHTDQRbCcZ8H4dV+venLVuHCmI7XuMXeYx/3UgbCPzcTT
         6aVq37vfjbtAbeTR40/0TUzveagB1nj1gx6GA3iY1lr/7GJc55zww/2F/rgytWJHiPit
         w1etbh0q1J/RTiFCpb/YnJb6WDjVB8MWuWT8Vluv7c11ufNkR/E8WwwCHktoQeiVTdDv
         8NEsddqxQ1M10/C/X0pen9eOftFWovUTnN4AIO0EcD0s2JA+LFjwVkqCrABpdzvLOm3M
         b6gp9I+q3RYup6m+qLNQTrPloOiByFXKVywhSS4BhDRhjsQD1TQzw90lJsm2sDyVg38c
         4yrw==
X-Forwarded-Encrypted: i=1; AJvYcCWgZ5kcDp7wy5kv4d1D+eqS7CHexsPx6ieaO+BV/dTXhIu0RS8ei1R6Um4cNNpfATzRkOSa44frb6jY1T3A@vger.kernel.org
X-Gm-Message-State: AOJu0YwQbzjuNiEKxuGo49JKfrBQBapCIcHX90/M18OU1XAw65G6W7lX
	X4fmlH4QJkfata1dmsAPWDLMtqlK9OGdmpOB4wb2paJVpD5s2bPGJYUWRlpJIh5glJgQKEoewjk
	YWc49s6vo7TsYkM+wbuWy8qUiSsUuJMA1e4C6wnsgOmf4zvyGli/WuBOgk9BA6IK4
X-Gm-Gg: ASbGncscX0cAY93+lA0BPPP37w2CrVtWfrN2iXoWrp64FTtxPCmuXCk4MWA1lDzD6Mr
	oFDeCVlmytkEyMjiEIAgLoZ6MsqSsmExzKPIY03kxGCa1wn/DT6UAhCCjahQCOzRqwhrjEoyukV
	tB63ugt3p6u5p7AbaCi0n+SUD+5dZRpi9w71K/M2V25Rr5uyViVkX0EanAeqXMgP3o67L2BcnDM
	NpKGjwCwOcW83L4nKjOccD7OyqTXreX6qSZCiy26AC1SCccOPL1k2RS5aRGlP6wXCuJfHRswrqC
	7ufrNttFPkLxb6Z5tD/5gia49k7ht+ajONrVsSMa6aAuxTocGiOXV9XU3O0=
X-Received: by 2002:a05:622a:1a23:b0:467:85f9:2a67 with SMTP id d75a77b69052e-46e12a940b8mr232903671cf.8.1737990995894;
        Mon, 27 Jan 2025 07:16:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHbQBaClGLDjf47vJiIgHk5bysqAnHMsfctaPHSAVkHPdBSwDmwLdwjqjUQMvLgQ8TfbrmWw==
X-Received: by 2002:a05:622a:1a23:b0:467:85f9:2a67 with SMTP id d75a77b69052e-46e12a940b8mr232903471cf.8.1737990995484;
        Mon, 27 Jan 2025 07:16:35 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186b37b6sm5388019a12.56.2025.01.27.07.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 07:16:35 -0800 (PST)
Message-ID: <60d02c55-0d18-4704-9126-8b8ffef5bd68@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 16:16:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] phy: qcom: Introduce PCIe UNIPHY 28LP driver
To: Varadarajan Narayanan <quic_varada@quicinc.com>, lpieralisi@kernel.org,
        kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
        bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, p.zabel@pengutronix.de,
        dmitry.baryshkov@linaro.org, quic_nsekar@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250127072850.3777975-1-quic_varada@quicinc.com>
 <20250127072850.3777975-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250127072850.3777975-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fDpvh6b8BgGGC-gnUvgSEDymXO-XzVHq
X-Proofpoint-ORIG-GUID: fDpvh6b8BgGGC-gnUvgSEDymXO-XzVHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_07,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 suspectscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501270122

On 27.01.2025 8:28 AM, Varadarajan Narayanan wrote:
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Add Qualcomm PCIe UNIPHY 28LP driver support present
> in Qualcomm IPQ5332 SoC and the phy init sequence.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

[...]

> +	usleep_range(CLK_EN_DELAY_MIN_US, CLK_EN_DELAY_MAX_US);
> +
> +	qcom_uniphy_pcie_init(phy);
> +	return 0;

Please add a newline before the return statement

[...]

> +static int qcom_uniphy_pcie_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct qcom_uniphy_pcie *phy;
> +	struct phy *generic_phy;
> +	int ret;
> +
> +	phy = devm_kzalloc(&pdev->dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, phy);
> +	phy->dev = &pdev->dev;
> +
> +	phy->data = of_device_get_match_data(dev);
> +	if (!phy->data)
> +		return -EINVAL;
> +
> +	phy->lanes = 1;
> +	if (of_property_read_u32(dev_of_node(dev), "num-lanes", &phy->lanes))
> +		dev_info(dev, "Not able to get num-lanes. Assuming 1\n");

return dev_err_probe(dev, ret, "Couldn't read num-lanes\n");

And please make num-lanes required in bindings there

We don't want silent fallbacks in such cases, as it's easy to miss those and
e.g. ship a product which would then run the PCIe link at half the speed

Konrad

