Return-Path: <linux-arm-msm+bounces-27523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFDB942CB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 13:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4260C286FEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 11:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C7A1AC43E;
	Wed, 31 Jul 2024 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CMUQ0ECW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D974C1AD3E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722423949; cv=none; b=E8VfvY8dBf3BpczXobqvVU/R14/rZha0qS1Umrl5cjLmCBOOvIsCvYmWRPKzKTlmIeKben8znSQynqL9LRG/H+mf2jXwsT9YdVnnY//1EXDMtWgkOmLJt+aS8AbwYGSy1Ovz1yyo2pMwwmEF+4Zvtk3Na8VN8AYV9G2Uj/8Iqak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722423949; c=relaxed/simple;
	bh=//GSB42wgXP39sk35xIC+sgfbAdG/9SwGHKDomDs7yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bTOmeilGJIuZkghRvA/fnk2lNB4F/FRAPMSXfPbY4DisP1pSFo4fqG65HToVim/Al4MF6gQApU2IiQ/wL0zVCABR0pBGBhEqTwsvwOc7YLF278pEtndV4lG2edluGsomigUimOchqwlA6ZgcyjMO4oZHAeLN4gWYasLzZMjHOrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CMUQ0ECW; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7a8a4f21aeso736203366b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 04:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722423946; x=1723028746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zHZhqSVXf2HkABk+DZ8Q5SgQKd9H1rooCMpNtitq44=;
        b=CMUQ0ECW1O6OxMwq4nCRki/FnGv8hBkHXp07aXvuiPbggwu1TMFwar8YOdMvRlwJTp
         PAORXItAzrRn9n9Z3Bop4P63AFepqndYfXVAItolmrPmnQw+d/IDOz25LrTSZgYqU0Gz
         I/f2ac6S8FuxrVUcLQFO8j0W+Rpiszj1Mf50Uj9C0kIvtePvYzDg5u5i0lElFi3EaCV0
         rs5yEjlXKvWxRKuVggj6Ge9QXwg7tpAYKdPbap5JGLeM8WMM7OXV2nREnXuG65mIlIG8
         +VyyVIPMR5t4WifqOZ+rayuFajMwyDi6UZ66VBnvFHdjsGmIuYk8kiXYdwL0vhecxsFQ
         bihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722423946; x=1723028746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zHZhqSVXf2HkABk+DZ8Q5SgQKd9H1rooCMpNtitq44=;
        b=OXW8j7I0w/274G8bK39D9Psz/upm+8uAy5OvYMULNWWPdU9aYwHW/D3I3lPrMEDY+n
         u4VsBB50ZSww4I5LNceeaVBXrHL2uPlevbFBlsHiuDXdAe+sk7cvKq6vXF/AWFBbdn3I
         X991M19yfWvFlVyqsTiCeqJhyidLRoUu3Hmo49tIKZG0wrCLcPU4F5DqnfzroqUri+6j
         kDjKx5zj/+T4acTNNpEtYi8OsK+bqstzZ2OPM0a+TkkbNYgKshxFcvaN84gboCpp+jzh
         ecaLh53vOs9Mvr3ftkNzGAe9MP4511UH+CwmUDrgwpnUPe6lksipchl6bdVnJfx92HTb
         5iUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOOZ+uAnFx0A53cvFcKZoc7R9r+ns1tvGKnj9PoyGa1WooQGkYTRnqHSsbqKuYhGEuyQ/82VmUKHki/ZgMsl6/NRsdtmXrw/6lDsCCkw==
X-Gm-Message-State: AOJu0YyA1YUyWftTT5cK33nyLPrVpCtEDP4gWL0LC1MBe/HeUD0Ok/sr
	B/bgycfaaNs/Adcb4Zq8AUnGPhUHu/N0PKlt0yJvr3YPybhR57TVgIBTkx2YTy0=
X-Google-Smtp-Source: AGHT+IH2oR+s73uziggKv8cXJAHk7fi6jbzfjUJQS6p5k3kcmFCpvXvLtedygEiSA5RzC1zNwUhFgA==
X-Received: by 2002:a17:907:2da3:b0:a7a:8378:625e with SMTP id a640c23a62f3a-a7d4000978fmr1114222266b.26.1722423945989;
        Wed, 31 Jul 2024 04:05:45 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::7424? ([2a02:8109:aa0d:be00::7424])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acac60f14sm748502766b.91.2024.07.31.04.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 04:05:45 -0700 (PDT)
Message-ID: <ca130fd6-b885-4bbb-9f08-676af8697b8d@linaro.org>
Date: Wed, 31 Jul 2024 13:05:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] arm64: dts: qcom: sm6115-pro1x: Add PCA9534 IO
 Expander
To: Dang Huynh <danct12@riseup.net>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
 <20240731-qx1050-feature-expansion-v3-2-b945527fa5d2@riseup.net>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240731-qx1050-feature-expansion-v3-2-b945527fa5d2@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/07/2024 08:18, Dang Huynh wrote:
> F(x)tec Pro1X comes with PCA9534 IO Expander, it is used for enabling
> touch screen VDD/VDDIO and keyboard's caps lock LED.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
> index 70f479a63f2e..47e446249af6 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
> @@ -70,6 +70,23 @@ &dispcc {
>   	status = "disabled";
>   };
>   
> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	/* Clock frequency was not specified downstream, let's park it to 100 KHz */

This is the default, so you can drop this comment.

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> +	clock-frequency = <100000>;
> +
> +	pca9534: gpio@21 {
> +		compatible = "nxp,pca9534";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +};
> +
>   &pm6125_gpios {
>   	vol_up_n: vol-up-n-state {
>   		pins = "gpio5";
> @@ -89,6 +106,10 @@ &pon_resin {
>   	status = "okay";
>   };
>   
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
>   &rpm_requests {
>   	regulators-0 {
>   		compatible = "qcom,rpm-pm6125-regulators";
> 

-- 
// Caleb (they/them)

