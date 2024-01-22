Return-Path: <linux-arm-msm+bounces-7766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B421E836015
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 11:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A56D5B24E86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 10:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4562E3A28B;
	Mon, 22 Jan 2024 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QIxaTDia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD2D3A1DB
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 10:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705920661; cv=none; b=pbG9eLocFoXdeUl51s2f/Jt5YV/DueuFkouNMEQYzYi8eq5OGRMw7iYpSAOYjHqazmYtmURIrQkY+ELidTSBIrHd2WCVXSk39IyuR+bsi1yvBZ7qag2do4XQoAFdvjPDMicga6nw2L+Mk2Bm5c7eUq4T2F+W2gkkuNcyut91KK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705920661; c=relaxed/simple;
	bh=dFQKRV53d41l5dL/sSIuuPKf5MGyxVfeQ8gHMWfsGu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awTHlSmo7ftkly6e2C1w3FszSdJZrG841rBoqUEE1ohDuMakFuOPAtOtXCGSzQX71xJ3Ss42+hMXNj4gTFIQohUUXOKZ0rLl2Icc/QZdyYtB2caVs8q7QcxnvynEy/+QTlZCBVe8gKTIBPd3b4cNzA9QeKu2EyyxfE0roPd6gdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QIxaTDia; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a28b0207c1dso214082066b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 02:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705920657; x=1706525457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M8yvXevL9licw83jHDt/PBzBsdwg08SwRbA4+7IDl1s=;
        b=QIxaTDia3CjFJDjmzdwZ/4ziRpu6wYW3A0CJFqw/NlTrwGSxFv7jgpjigEid9ASMP2
         6VXqvnAZ7EXhz7tHQQyUk9hDbTKt81f4Lyb+q6kf1ew5ZYqW3Nny65MRxVXBfVE1BjLD
         kddNwbAoTj1iH9aboXI3qdpKr6IHQRdstl+uJuQ49e3+v3ToJxU/GTbw7L0Ri4XGbHKf
         qvArg1OdXqJ0Gilcr37MdGsepbg7e9s8kA4txeJcc329C5MTfX8swYvKxMg7VeA9J6tQ
         9P/Lwr7NsOLHx7DRJ9hDILBTnK2DPd572CHP6/8jPrcPuSh3kb6LQWt3oyeB2tE8knFS
         Katg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705920657; x=1706525457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8yvXevL9licw83jHDt/PBzBsdwg08SwRbA4+7IDl1s=;
        b=EBFvSwHAtIiUYDCjhUljjxE+OgVQ5WoOs5/u3MkDvvTKArz4d9SgZKK6S0ReabR7XH
         ZbG8jBTfbIuUIc/9HYiuoiqW1mS2fUVCKQsnWLYC9jGuD9A3qAJrvMzQhXxJSgbf9PjD
         j5sdVCIllOdqy610f6j707v2Q/wO/oW+BS4e4eOSLji2ckfSd656UIDZ/oudWl7K78gC
         XYHDURXDyncQhHioNMS7zI+Xc6lAL7cf6B0GbxMYQLxRN3EMVzfld2D+8IDxur8MitAl
         rjgVA8WN52StQhrUeAYh968fnGgaoHZdh7ueZojI4hpwFG4WsVg2TAt4/0TNUMTsa28y
         Sz7Q==
X-Gm-Message-State: AOJu0YzxtsS6PDleULrP2Jla5OvRGUi3oEWeGn8V+ZyRyAJW/2viokWW
	pRfHt3z42ZtCRuuUUNUL2W/NPTM9dFIh599Q6lW9SrH4sJH++wqojhMSxla23Rc=
X-Google-Smtp-Source: AGHT+IGm2Ud+3TjJVbH3MlgByCMSKS5V1U79UJiHNFQrN71oS9MCtY8unE+1Rpl4Rlkh4BPFhMPOOQ==
X-Received: by 2002:a17:906:268e:b0:a2c:6bea:58a8 with SMTP id t14-20020a170906268e00b00a2c6bea58a8mr2086541ejc.37.1705920657106;
        Mon, 22 Jan 2024 02:50:57 -0800 (PST)
Received: from [192.168.231.132] (178235179218.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.218])
        by smtp.gmail.com with ESMTPSA id qa18-20020a170907869200b00a2f168ca475sm5177494ejc.140.2024.01.22.02.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 02:50:56 -0800 (PST)
Message-ID: <1635b0e5-df47-4918-be83-edc27c59d8cf@linaro.org>
Date: Mon, 22 Jan 2024 11:50:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974: Add device tree for Samsung
 Galaxy S5 China
To: Rong Zhang <i@rong.moe>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
References: <20240121154010.168440-1-i@rong.moe>
 <20240121154010.168440-5-i@rong.moe>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240121154010.168440-5-i@rong.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.01.2024 16:39, Rong Zhang wrote:
> This device has little difference compared to Samsung Galaxy S5 (klte),
> so the device tree is based on qcom-msm8974pro-samsung-klte.dts. The
> only difference is the gpio pins of i2c_led_gpio. With pins corrected,
> the LEDs and WiFi are able to work properly.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---

Looks like you didn't change the brcm,board-type though?

[...]

> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include "qcom-msm8974pro-samsung-klte.dts"

It's customary not to include .dts files, instead split the common parts
into e.g. qcom-msm8974pro-samsung-klte-common.dtsi and include this in
both the existing and the new one.

Konrad

