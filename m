Return-Path: <linux-arm-msm+bounces-47446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03702A2F355
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 17:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 338531881169
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 16:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184272580DF;
	Mon, 10 Feb 2025 16:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AaSGZWVQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEEE2580E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204663; cv=none; b=rHs4vbHQf9cCwdE8Ga/HkKMC8emRjkZFBEnoRrMmilmn5CIx2md5ut1PduLvQYxiowX6surfXoqm9v+ZifyT9mLMaewFkETivXuKC18YH09m4866mylLz5dzL+Bm/uyXkUSyc80MsD1Un+k0faB5dY03BhBb2WtfasIq/bX+9M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204663; c=relaxed/simple;
	bh=p9GU2HZFYQRC26x82m2zYIxg+L6koIe5ealUvvav5+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgpuDljejRC+we2+P0VsNUFFT9uA/S9H62hYWgtkiFrcwvJan6UmtrgcCwn/oQljzapzNQeoBOEfOp5D7ACFgj3cMj/UJ7cVDiHmjZa6RlrnkToMZX6GNhXdxgZ4k6lOqe22pb1RJIZa39Gw8uSIoO8fctqN/zdpVoe9uS/hP/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AaSGZWVQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AEWZw1010162
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 16:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yzK+XafR1dLKkE9l58nuGRPb/TFcp6XZmfgiKBEVSbU=; b=AaSGZWVQ1FXIKoGr
	yTN8HYK5MwMx/nhz0ienVcZ/5YdZBkFKP1XeAEmvjKwzNC30miquduvOc/AG9fDI
	XoXDAl6liD9x+oUOuYn5ZJ+kZhX16Z3hfFv0N55MNS7jIGMLxt3QIKw8d1XIKQCU
	JpnqfSTlam3QUDTkrh3dd3UuXdIYSMDlmky5z9odztqQTaxLhioSq0zl/jlI/jlG
	dQa0CO0PUhtFbv3eMx3ZZGiv0tcen60n5s3vC0xZBhOxutZ/pIax+OYvD/HWO89u
	wGv2SITZRh/z6350q/Ud4M9lxQifpVr5PdW080qZdmK1+voiJ/0xsmrmz4uZjfrp
	N4V9rA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs59h8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 16:24:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47181a14d8bso7329201cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 08:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204659; x=1739809459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzK+XafR1dLKkE9l58nuGRPb/TFcp6XZmfgiKBEVSbU=;
        b=fBq0lY/QZ3UQTMSjh0nMWLwAIM5tF2qgPU2/6i866cK81M/cSXBp3fb5oL7IubwO/S
         DXGeSzkLa/drgbumNlD0Ac+cTjJvew1Es3zZj+VuL6a0QSkXZ3jWFeRQoLD5NezeGhCR
         KbVJBkDRqouSOEd175YGbM3uxhpKkhZbPOQDfaPLctWCQzn+I5Yf9fHvznMKqiUlsctV
         2bGvtPiudR0MuDzVr0vjlKltQ3Vtbn3vmBOhkdSSWY3Wy8elRBVcuoYyu10p71UiVhMC
         hVv6pNO3/weAPZVEZ8aFZzvWESJlKASv1WQvcC78Jy+PjRFzWXGb1ni3Lf0UhUFS+UmJ
         TIjg==
X-Gm-Message-State: AOJu0YzOyNv4iJFfdC9Gq3OxBR2xhm+RqBZPQLz5Ry6niFfAZoBuk/kh
	NoQ9KRJl+HiOWIC+FNq7iiFFiICGd0A4PdWxCglmFN80+yJiLm5ms/AFHtp+Ba0AjnQ6P+CxW3A
	0g7hqwvCRWLkIdUOilckfQEbV2PMWnzUb0CIHFTRYx2muhz7b3Jqs8bIUyA6/8d3G
X-Gm-Gg: ASbGnctT+8p4Rr41Lyarbt9SIIZgDXozScSDagBd0cO7jmcT9QAAnmfhncXQerIhlqK
	xWwUCIh0bL/wMVmVrfFeLT4K4HnrWmiNWOpMq/dA41hAwF8XguHNJRM37/ZYZY4a3X2I6dne9K1
	+RQKLmieV7+ihe2gM5+gpiO2Mql02Zv1u1JS8Gkzjdjl4qZTnhumPPThctC1p95zCmCb9e4u6YI
	NqGKN+iJNKJIibc4C31e+JPuqF/5VFGJKvtVHG94XZpuFE1+kqhnhwp+fwSMu0MeRqkFg2QIZGu
	LIpTAqNYiUomS26V08nNio+QBQVVqmZgfQf1CwHYcSTV5QGAkdQwOjSAZag=
X-Received: by 2002:a05:622a:4d4a:b0:471:89e5:5154 with SMTP id d75a77b69052e-47189e55396mr34786471cf.12.1739204659298;
        Mon, 10 Feb 2025 08:24:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkgtHBUXIyvQdHCarC2oJoyIonRZjZKrb1nkE9BmMXrJqor6thbYPPKTvG7KOFoDedrCs9Nw==
X-Received: by 2002:a05:622a:4d4a:b0:471:89e5:5154 with SMTP id d75a77b69052e-47189e55396mr34786361cf.12.1739204658973;
        Mon, 10 Feb 2025 08:24:18 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f491c6sm906879866b.15.2025.02.10.08.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:24:18 -0800 (PST)
Message-ID: <0e061750-7640-496f-9cd1-1ff044192fd7@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:24:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Stone Zhang <quic_stonez@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_miaoqing@quicinc.com,
        quic_zhichen@quicinc.com, quic_yuzha@quicinc.com
References: <20250210062910.3618336-1-quic_stonez@quicinc.com>
 <20250210062910.3618336-3-quic_stonez@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210062910.3618336-3-quic_stonez@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 40C0m4_u6k9aK67RLoj8DCSCKiDwiab6
X-Proofpoint-GUID: 40C0m4_u6k9aK67RLoj8DCSCKiDwiab6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100135

On 10.02.2025 7:29 AM, Stone Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 96 +++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index c4c0db6f8b31..84c9e74ea4c9 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -22,6 +22,76 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	vreg_conn_1p8: vreg_conn_1p8 {

DTS coding style forbids underscores in node names, use hyphens instead.

Please see similar changes for e.g. sm8650 boards.
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p8";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;

It would be good to provide the voltage numbers here via
regulator-min/max-microvolt

> +	};
> +
> +	vreg_conn_pa: vreg_conn_pa {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_pa";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pmm8650au_1_gpios 6 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en_state>;

property-n
property-names

please

> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio54";
> +		function = "normal";
> +		output-low;
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart7 {

