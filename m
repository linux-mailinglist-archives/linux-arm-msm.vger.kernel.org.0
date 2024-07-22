Return-Path: <linux-arm-msm+bounces-26736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD7A938B71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83D13280DBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 08:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2335B1667F6;
	Mon, 22 Jul 2024 08:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWTeTs4p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510F21662EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721637784; cv=none; b=CHp3an3l3MQDAoTuiOUecTFoLMGnClfMAUuGE6u/DiiU9JMXJi72PyI35Hr6DvhFlkm+hOMeQ5fWZUosJWyG5NYRJsbAdestJ8V6XeftaN8f6g98WfXsOp1Cir9uNoneX6QMtr7DcPv2+BvUHQqxZrzrsCi59oLQgQrk0+s6JJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721637784; c=relaxed/simple;
	bh=mZ2ZAr8/8AQLW0UxQVEkzfi7S7q+mzom0U/sJs8IMfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oV7QCv1lxGdJm67IRn5dkSEGR5PtK/vTkgMbxMvfLCKO2cpdg1jGVUOhoW9vwL6u21ggg0bHPDH7soRfSYPcUOXd8oi2TG+rihEnsaB4qFSrdkRrcr0tNxXrROBgHGv4kO3I7v1hN9f9xgquIUbRVduHG17wGyyzNa/L0hUL1TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eWTeTs4p; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso58329871fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 01:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721637780; x=1722242580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HyUaXhZy7w+rjNltMSOBdyRI/n7iZnDzkC1zUe6T1R0=;
        b=eWTeTs4p77OGpuv+PtiXi0hJXDDkfc4Z5/gDeXdlbNcxUB98pcz4FqBb3OPt63TXFU
         Vb9oWITVFAeA2CGeTSxXFDSjv2rBpjdHGQF9ps+JUXBIB2C3BgKZxDBPOQUK2Wl4vWGt
         byI1J6vXh/j+L73LQuUAJt3rmpt86Tzr5iLQxS0RChOwU6AvCsKljE3raVyPcG7zw3Hv
         ugqi/98dmhVKe/HhcbYoZKUiFlsJesfvb7UtxRyoK6PCKoChTkWVN2q3u8EumrLnzPc3
         yirqG1KtkfgxYchjOGpLqxhclQaMIkZEKV6LXC1DfylaNXA5+GZCBmcu4fXitVuoyltE
         ARRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721637780; x=1722242580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyUaXhZy7w+rjNltMSOBdyRI/n7iZnDzkC1zUe6T1R0=;
        b=B+UaJhtgc5w+0MIal28zu36+b73kCxCXz7PSR+fPlVb3bb0oPnYSlnrGDIgBYQhMTA
         n1XrhrxunDLF2rJ0s2ie9ojM7xXR2vDnYiePdr/o+uy0YmQQDHS1hDgRMmPfIWP3j+ay
         yniKHU2jvXUWsJU61OLfSxEpw0hrH9P1YKFmuC1/2glBEqjmFuCyX3OovPQMJazcLGGH
         7DezjDgamofeAAHQUz3xOuXpU93AXnpP/Ljzaj087Gx6ST+hzFPjzsr1YiCT+5bKuUoK
         NsoV88HHd/TtPXiGaTGrJDRZshp3QdchhHGKZPkXlo8rZ0Bzv1Jm1OXZrW17zFRUz2hg
         WxnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+l2qpEaOvSZN1yktF8qgtmlNvEN5xczuwAQ1GGigGK5PUPfBs900Vj2MUYYIFF7+tEsP0QJYAj1HCCFixXTrPycyNnsaWU7DHdWPZOQ==
X-Gm-Message-State: AOJu0Yx/qdwA+f8xKtZ23zBkpa29ZVpsCyWNEwN1ytd639hWAHVGquUQ
	cwyqUjh+Pard+8IpBKeetvRo8GpM/yH2BJgpI/iuMdxkj9wYNUt6Ct2nAs6eEhg=
X-Google-Smtp-Source: AGHT+IHnnQrBpEx4mKKZT6curmy2n5diSz0Y+cPDCOViZgapxBUutKjBWnf/d6QMEX7xqF6BduPUgQ==
X-Received: by 2002:a05:651c:2224:b0:2ef:26dc:efb3 with SMTP id 38308e7fff4ca-2ef26dcf107mr38663731fa.2.1721637780134;
        Mon, 22 Jul 2024 01:43:00 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a745917f82sm1989940a12.85.2024.07.22.01.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 01:42:59 -0700 (PDT)
Message-ID: <824edc08-f67f-4b2f-b4aa-da5df69b9df4@linaro.org>
Date: Mon, 22 Jul 2024 10:42:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
 <20240719-topic-t14s_upstream-v1-3-d7d97fdebb28@linaro.org>
 <Zp055OR+OzSgiHhX@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <Zp055OR+OzSgiHhX@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.07.2024 6:40 PM, Abel Vesa wrote:
> On 24-07-19 22:16:38, Konrad Dybcio wrote:
>> Add support for the aforementioned laptop. That includes:
>>
>> - input methods, incl. lid switch (keyboard needs the pdc
>>   wakeup-parent removal hack..)
>> - NVMe, WiFi
>> - USB-C ports
>> - GPU, display
>> - DSPs
>>
>> Notably, the USB-A ports on the side are depenedent on the USB
>> multiport controller making it upstream.
>>
>> At least one of the eDP panels used (non-touchscreen) identifies as
>> BOE 0x0b66.
>>
>> See below for the hardware description from the OEM.
>>
>> Link: https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/lenovo-thinkpad-t14s-gen-6-(14-inch-snapdragon)/len101t0099
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Few comments below. Otherwise, LGTM.
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> 
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 792 +++++++++++++++++++++
>>  2 files changed, 793 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 0e5c810304fb..734a05e04c4a 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -261,6 +261,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> 
> So what happens for SKUs of this model wil have x1e80100 ?
> 
> Maybe we should stick to x1e80100 ?

This one only ships with 78100

[...]

>> +	vreg_edp_3p3: regulator-edp-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_EDP_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&edp_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-always-on;
> 
> Drop this.

Oops!

[...]

>> +
>> +	edp_reg_en: edp-reg-en-state {
>> +		pins = "gpio70";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		bias-pull-up;
> 
> bias-disable, maybe ?

Yeah, probably

Konrad


