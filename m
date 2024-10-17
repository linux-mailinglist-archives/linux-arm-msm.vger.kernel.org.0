Return-Path: <linux-arm-msm+bounces-34813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE7C9A2DB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 21:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0F921C236D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 19:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B77227B81;
	Thu, 17 Oct 2024 19:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJVqyaZT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD8921D2AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 19:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729192921; cv=none; b=iEZywdm3hHadpin/hJEfsCSEy1443KTOlojQc3mGlQeQdUO4egrP2iQvZMKWjmRMyCWF5+RhvpacM4R7YLEiaA1jz3rBtZL9npCjQueNaAoyixye2WEKPjSC0GSwttRCxzsW/EvVs+Q2angPxeQRU+WDtw6DRawHhiFDnt9FJCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729192921; c=relaxed/simple;
	bh=4L7ZmfnqHQ4inB9Z+gpgPm0EocNmPhoPmdAappwqQLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0GKU+K5H33TVLow8wkV00lACtebQABEzdTptt9H1HBfS/4FZqR2TZsh/sj8CckXfBWD+YlO4gFTZF4wIe017inL8P1kAT4oX9610Uw37GiXnH7roxYiR6Wh20eA5IanAAqkfJ2xLSYq1t48fqACfxtwN5uiTtU4mGTBGveQtYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJVqyaZT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HAM1iE018286
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 19:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9nKRF51A7sYkC6yHPM9M+rXSCUKjxjSo4paW2jb4gpg=; b=pJVqyaZT04BALCfK
	P0i6usbi1PTwbBgmGJO3eC49KBUjh2aQmLTpP3p5pfEJi7M+V+IVkTxly93ByOve
	CVKIyCocg54yWdaOCYGDXMRrr3IvPQihqUNsVFpPiflKreFL9y9MHelmWOvxaJNB
	8qpSD9PuB8JToqOPgN9nELT11AFP0K1Ggznc1CEqflh4SKEEZNdwSazzN66kMxVR
	ZRjj4ET/+ZEK65jFP6rh5lrEYx4ktkW7j8eeXbvzm0jFTZqVxw6gy+x6StLlT7QX
	F4f6UFlv8IM+LFPx8TiA/rFLGLttpcKT84Ic0LQWPcJ4T6UnQKEXcQRXOrJ0i5bI
	meLLQw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b0rx1k26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 19:21:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbf4770c18so3428386d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 12:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729192913; x=1729797713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nKRF51A7sYkC6yHPM9M+rXSCUKjxjSo4paW2jb4gpg=;
        b=PYUXI/N4nTq6crcCeTGiiEpu2gZG81Uz8xbq7BQG3vMhYyS0ouk1eftFhFbzzcQix2
         DlNpeg29znkHgJSWzw9SdlDPqwUBi+kHyLoR8SRMVHV3HwwaHyoutI3regcf0209nQVE
         OpCn1VMTD28xIcH5pN+xFRwW1cpkVRwOPuX9HltudSe6ceruJQf12ELyEPpV9TsQq0VI
         LBmzL1CztltUzG7xLdA8FOLPgFjPyf+XPwXOPXcjnoPqbUB5TJSoFZp904C45U9NCcl0
         mIVpEZQYTUaMMipRpnJjNUqrVjX4FqtVZa4JNZkFdXqGokImzoLEuZZtH5ZUHvg8WfJc
         0Dvw==
X-Gm-Message-State: AOJu0YzHr5Em3o2oo5KCqNhLkIzNRgYF5yhVuJ0VxZFQqkYOr1Qbmsbq
	OuQ2WzRJ7jV+s16Bf0B+MXmHfVJRiPr1UnO7+A65/ix0Q/KOmmdj8iO/uBxqBFhTvdW8BaVVhxE
	sH0fVLgEg43tiKX2ejx7xBbkCkW25TrMOtgCU/K+XclxHs5w1joaI8/cwdQTiGpbl
X-Received: by 2002:ad4:5743:0:b0:6c5:3338:2503 with SMTP id 6a1803df08f44-6cc91b8acacmr3543326d6.11.1729192913143;
        Thu, 17 Oct 2024 12:21:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHKkijEbj51hUF0cpr/kUmjSFIVMk5Zw0M37NQQx5G9I5J8ivHoYin+f2I9l4ksy2bbLsDqA==
X-Received: by 2002:ad4:5743:0:b0:6c5:3338:2503 with SMTP id 6a1803df08f44-6cc91b8acacmr3543216d6.11.1729192912692;
        Thu, 17 Oct 2024 12:21:52 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68bf621csm1709966b.165.2024.10.17.12.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 12:21:52 -0700 (PDT)
Message-ID: <24b13e3c-5c05-4697-9a66-636a8ef46aab@oss.qualcomm.com>
Date: Thu, 17 Oct 2024 21:21:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] clk: qcom: add SAR2130P GPU Clock Controller
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-14-f75e740f0a8d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241017-sar2130p-clocks-v1-14-f75e740f0a8d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NvWVUhs9qbCyZk3C8HYpfjy2bjYOZ-Y6
X-Proofpoint-ORIG-GUID: NvWVUhs9qbCyZk3C8HYpfjy2bjYOZ-Y6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170130

On 17.10.2024 6:57 PM, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add support for the GPU Clock Controller as used on the SAR2130P and
> SAR1130P platforms.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +
> +static int gpu_cc_sar2130p_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap = qcom_cc_map(pdev, &gpu_cc_sar2130p_desc);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Couldn't map GPU_CC\n");
> +
> +	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
> +	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
> +
> +	/* Keep some clocks always-on */
> +	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
> +
> +	ret = qcom_cc_really_probe(dev, &gpu_cc_sar2130p_desc, regmap);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register GPU_CC\n");
> +
> +	return ret;

return qcom_cc_really_probe without printing

Konrad

