Return-Path: <linux-arm-msm+bounces-73334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBD9B54D8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A722F179DB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84002475CB;
	Fri, 12 Sep 2025 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWL+0u1X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9AF285CBB
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757679866; cv=none; b=dQHUx0BAwfXXKpqwhcHJNWj6+BhKW7z9KGXkSawJr48tHpB1+w62UkEewMv/iucl2zmZz4gZVNn5/vo0eDD8gQsUaEzqDFSrtt886duPn5joMM5LA9tYTuyUzcXLoPEmuiz3wXBHTg+KSxBWcEJAU/F3fCTLu0/UiWK09joQxNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757679866; c=relaxed/simple;
	bh=L/Kp0ZpCQjnQzViZ58decDE1KZjP+nvqlfKbSHwyGL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5MpUDyVcglG+jK6NuYymPhEaqt/WQTlnMIj4I21+IBoTX27TNrVulNmzNc5GBxxV+Mn6HXSVOQ2WeK6mEe5pcGhRRbz6e1S9feSK2ruqcu5QXzsp//NIAnoZ90k3SS6LmBdLG8V+9yGG5A0C5KKpqV+7Se28G0JJDVbvMA/w+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWL+0u1X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDqW017418
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/00Zp88Pc7XaLrl9L+7J4tNKaqmsJpoZiLQwxfLj78=; b=ZWL+0u1X+U9Y+wc3
	gAIxqphUxtjWT3NeaoMeTueozCEAzTrgRpIkBv+lmfURRgF5vGKgqY59/fV+JWM0
	PkOiH0pnQfe5ol4XaVf6fFGHX8LT2NTOYNnCZgbhyjwlEjYYL6v9mRNN3rsbtNKh
	rz+pzRvRDKpNkmcIerqOgm/TLfWAO07tcmWkqu1lMBGuw0yTERFbIx1lHAHwT8Tj
	7WTM6c/C40RMQPv1PR51EHo48erMM28JCbNP7xhiH1zEy888yeIs9K1DeU/yFPKR
	zWStsn37NS8/Y3qYcUGYx/WabDSqKef32mb8s6bibgOvFNdY/ehd3BWfF1zkn7l5
	19pi2A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8upef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:24:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b600d0a59bso6348311cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 05:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679863; x=1758284663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/00Zp88Pc7XaLrl9L+7J4tNKaqmsJpoZiLQwxfLj78=;
        b=LsVUnWXB7ntHTWDr5eoJqoQT4m5qUtC09KDRFbNUUmI0vguh3suT3q59pqx/cYSDDN
         hbXZDjlABsGtBwlr91BPMEQZxdjfkUy7QCnszeZCd+DQgQj2trIxX05riYb6FKjBRXMq
         w+ZbZLzImDJHM3g1wJO6UsmJ1f2EX/u5qp0na63bHELIu/6LJHn/wYOxlBCStpPX7wUt
         OAaffw61bdIq1rfmqMjP3mTurxdjOIonwPzXgWAcGfDcX+1MMuBcm0DS79jR5tXHgW3M
         jjhuon1JNh/ZVFYzO0AhyNBjqhdzy1l9DPf0Oanf/xx5J6R6gPHOkqJ468LrmovBlZOP
         3Trg==
X-Gm-Message-State: AOJu0YwfpJqB44kTFYa0RB31IRiyPMTcnaxf3ueujEu8n+RLkn749PST
	v7tRmpKpR46esoB0N2Bo5nUODArY0RirXgLbGKqON0li4m1fwhukvrLHkZY50uOzsw2aGEWqxXG
	lr3ToCfBRHPse+jiivC8YgGz6N+YgIKJVFs7DNO+TRwuLCI+4hruKxtiaHF8MiT+2YmL+
X-Gm-Gg: ASbGncv2kEs96f/hWL91FrdmdgD9hmfCasRu5ROIPfvPlkSkr5dzf8wHW8j6+hcHgqe
	KFgol6eAMwrgXoATd7WjHNncODzpAm+i0/gp7mgZWvqCQCuIf4QrxR1UY8h+5GiUnP81IcIsA6/
	tSfYUplhpLnESy+HW8xu3LmxHyTsF3pn34s14PVDNLl6GxkaNFaiGF7vQuoPXD19goPfhcHlLLT
	mTVAciJ+aHLexqtO21NCvw4QJwB+kclLP9CWT56HJRy30Rn5o8Wk7o/qS2i9QMb//8KpI6F+DX/
	aLYeEBieIunXTOuDayk9AFtvHQt+xGzRzDtbMSMR7pGYAEegFdGI+PjvsYAhQZEXl97ECzI5v8n
	Sr60xS6+TjkyknNaapcl3aQ==
X-Received: by 2002:a05:622a:247:b0:4b5:d5d7:ffc7 with SMTP id d75a77b69052e-4b77d070bc6mr23459551cf.13.1757679862719;
        Fri, 12 Sep 2025 05:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLglj50v0H8yUFfCJsItJZI1D/YYI2k2rFfxjbH7ntfNZM9kwa4/Tn1xpP4EMHdoniu7v9QQ==
X-Received: by 2002:a05:622a:247:b0:4b5:d5d7:ffc7 with SMTP id d75a77b69052e-4b77d070bc6mr23459161cf.13.1757679862090;
        Fri, 12 Sep 2025 05:24:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e016b5cbcsm64664835e9.11.2025.09.12.05.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 05:24:21 -0700 (PDT)
Message-ID: <f00cb00d-1e0b-4968-9f5a-df3ce0d8c8db@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 14:24:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-starqltechn: add slpi
 support
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250911-starqltechn_slpi-v1-0-93ebf951a932@gmail.com>
 <20250911-starqltechn_slpi-v1-2-93ebf951a932@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911-starqltechn_slpi-v1-2-93ebf951a932@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX+dW5DMZXSGp2
 R9Qtqq/Vv7Ux4tHvV1q/aIZDLsddA9NCcHTDDI4gqYb5ml0DKC1uvAgEOjfMEHoUNqcPp9n+Aa8
 +G0m3xBle6ipu62hKEyjMGUYyYVerx22Ut623GgVCJFzHVDSS2RB8m9I5TvmCGluicPuFcI3oFQ
 ruFanTDj/8w4SviciZihtjLW3byPhrdZxv7t9l9ZTphVRrWgrnbfYhOUE4CFpL3I4+f1WP7Qkz6
 WMJKfeUvvTCwVZZy/9MU9C18fDSIT289kJpjkD/SfIGID8qFibIrPbMVTUPokUkN16CDEp/d/KD
 uW2qxnwbgDZOMAkBURouH82HNU36yORReAohThrWcRBtCqRx5Mh9w7msfZB6EY4OcgwJYR5ipUY
 DIe9KT+s
X-Proofpoint-ORIG-GUID: O4JaLGLWlKZ5JqcLHACpS2DXLT_LSqpj
X-Proofpoint-GUID: O4JaLGLWlKZ5JqcLHACpS2DXLT_LSqpj
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c410f7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=ixb8Hu8vVRuwzE1ANvwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On 9/11/25 10:56 PM, Dzmitry Sankouski wrote:
> Add support for Qualcomm sensor low power island.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index 32ce666fc57e..2c1157ee7b2d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -902,6 +902,14 @@ &ipa {
>  	status = "okay";
>  };
>  
> +&slpi_pas {
> +	firmware-name = "qcom/sdm845/starqltechn/slpi.mbn";
> +	pinctrl-0 = <&slpi_ldo_active_state>;
> +	pinctrl-1 = <&slpi_ldo_sleep_state>;

It would perhaps make sense to model it as a GPIO regulator..

I found a downstream kernel for this device and it seems like
this is indeed a Samsung addition

The vendor kernel gates the regulator when the SLPI is shut
off, but I think it would be reasonable to keep it always-on
given you don't really want that to happen, and if you need
to restart the subsystem, not pulsing the regulator should
also likely work
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";

a newline before status is customary

> +};
> +
>  &usb_1 {
>  	status = "okay";
>  };
> @@ -1028,6 +1036,22 @@ sd_card_det_n_state: sd-card-det-n-state {
>  		bias-pull-up;
>  	};
>  
> +	slpi_ldo_active_state: slpi-ldo-active-state {
> +		pins = "gpio8";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

Modeling the gpio-regulator will let you get rid of output-
properties here, which are discouraged in favor of gpiod_ APIs
in drivers

Konrad

> +	};
> +
> +	slpi_ldo_sleep_state: slpi-ldo-sleep-state {
> +		pins = "gpio8";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};
> +
>  	touch_irq_state: touch-irq-state {
>  		pins = "gpio120";
>  		function = "gpio";
> 

