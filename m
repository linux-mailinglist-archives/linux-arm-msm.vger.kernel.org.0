Return-Path: <linux-arm-msm+bounces-36612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D8C9B844F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE02B281AF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7241CBEB4;
	Thu, 31 Oct 2024 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHez54Mu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E8D1CB51C
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730406365; cv=none; b=RbqNZ5VLM/zfPrRHMnrwnhfgB3hqMrA61Gn1qvPlNLB8/G9fkXgLMYqsamzLK/GsvNifIfio+17cZCVzIuvHCjI/0wgRL28PR/s25HH5n8QYQltLbTYwgmMuTh7m/Ism67vYftUmQ6S7f1ggaCgK3OJfEnVx1HeMuHJkogMsycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730406365; c=relaxed/simple;
	bh=VnQY7chdabpp2UuXBku1gHWVi4hfJe2jZk0NeS2f6Gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQo4quKHDkZ3vCqnVbOz2zr/YZQ4uiMwOuymjxYAOacdbnnQwCnoDDf7CYyt88gABiSoK1B2aqdlsS+Y9HvhQdr9FjVFGnj1km3oYZz3cj+0/OLKe1k6GTtupkecs4Xfnt8fNvJG0dcvAJOPTgVUDF0fxeJOFDJXLv6p52V7tC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHez54Mu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V8waYk012693
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HsntP3C2GJI1EZuB1B2CgIDf2X97b82f6C7hdl6Yr+k=; b=lHez54Mut6sd5vtH
	CBW8vYha99KN3hnlEpIWc4HUR5xPQ4GVNGu31M/KGKZm58W78S4ZrGr6Wj5o6b00
	bbKs7z+aGZzFv2PU/SEwiY0l83Zrfuwlajy7EbkBRsLMOzp8hUtckuCUhVrTXwIg
	x+s0bC7Uz35HQ/slLhFZN2B5QMM52GxEO7XTYGBCDEdMKrCI/P3SaFysIlp4eH2x
	DFOhkmiuJ/NIiGJkd23sLlcj2WBVaCPOaSEfGuic8f+KgIwBrr019ODm32QtF4Mm
	O714+OKbejPUR29BpFe2YIZfpSjo6CapEaNkPUPGkH+IK+XUntgBAyEnoFzsHGRn
	SkMSGw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k6rpq47j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:26:02 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5ebad1e2d40so153592eaf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 13:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730406362; x=1731011162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HsntP3C2GJI1EZuB1B2CgIDf2X97b82f6C7hdl6Yr+k=;
        b=FiVf02YmyUenGSOddAJWKJJW/7h56HcssOJXTfDXTPemIWvSPQtlWJq0Pt2MJvq+5y
         ActxHVs0LsMquc0eWwq8IKFX6rIu71i26pjRDfTduYxBBYLDv+G8PTF0isswAK6ZN68c
         zeRnyQsdb2/xijPJ4l+VbOD5G8XGve62Y8FAisPo/DZV3GhVBMbTapHayoc7wnGHDmkF
         +Zan5cmX6agV4Bos5YYeLhybGWrgrVPNS8JvEywGHC8IxolqTSg/3X/F8PpM439UF55n
         qambq738OTosL79dBzpanPYXyTxKVAaAibBXcpGNGOZGgmGiVKPZsS5geb7k/M0T5J6q
         HrPw==
X-Gm-Message-State: AOJu0Yx68uufRJ+ItmAbis9hLgvBt3jQDGS3LCln1oOuo0YkeUXJt++D
	er28QoSR27QvEPZiuG3zt0IjpEIFguqkZhLDZ8ebbQLchxOT0S5J6AleFMPk4L8oDU2m6br63yk
	J9Z/mfAC39gizo2VsCLwbRRgPx0I31xX+adH8AgtVdlQ6uOTA/iyW7j+H9KF8dmN3
X-Received: by 2002:a05:6871:593:b0:269:1020:a8a0 with SMTP id 586e51a60fabf-29051b4d694mr5456340fac.4.1730406361934;
        Thu, 31 Oct 2024 13:26:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWoGAeaCy5azeIH/5FqRyk7J5FBFP8MQZw2ucFj8VqfTTkWtFqd9+U9IWzWpD4RmcROOR3qQ==
X-Received: by 2002:a05:6871:593:b0:269:1020:a8a0 with SMTP id 586e51a60fabf-29051b4d694mr5456324fac.4.1730406361650;
        Thu, 31 Oct 2024 13:26:01 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565f9b63sm100100266b.110.2024.10.31.13.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:26:01 -0700 (PDT)
Message-ID: <796b470f-7646-41d8-817e-03d93a90a1fa@oss.qualcomm.com>
Date: Thu, 31 Oct 2024 21:25:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] arm64: dts: qcom: Add Xiaomi Redmi 5A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, iommu@lists.linux.dev
References: <20241031-msm8917-v2-0-8a075faa89b1@mainlining.org>
 <20241031-msm8917-v2-15-8a075faa89b1@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241031-msm8917-v2-15-8a075faa89b1@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5AHOQ5csRqKRZxSmT_x8LRrEK2DPugg7
X-Proofpoint-GUID: 5AHOQ5csRqKRZxSmT_x8LRrEK2DPugg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=647 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410310155

On 31.10.2024 2:19 AM, Barnabás Czémán wrote:
> Add initial support for Xiaomi Redmi 5A (riva).
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +	reserved-memory {
> +		/delete-node/ reserved@85b00000;

Deleting nodes is preferred via a &label (like in sm8550-samsung-q5q.dts)

> +		qseecom_mem: reserved@84a00000 {
> +			reg = <0x0 0x84a00000 0x0 0x1900000>;
> +			no-map;
> +		};
> +
> +		framebuffer_mem: memory@90001000 {
> +			reg = <0x0 0x90001000 0x0 (720 * 1280 * 3)>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&blsp_i2c3 {
> +	status = "okay";
> +
> +	touchscreen@38 {
> +		compatible = "edt,edt-ft5306";
> +		reg = <0x38>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <65 0x2008>;

interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;

[...]

> +&sdhc_1 {
> +	vmmc-supply = <&pm8937_l8>;
> +	vqmmc-supply = <&pm8937_l5>;
> +	status = "okay";

A newline before 'status' would be welcome

Looks nice otherwise!

Konrad

