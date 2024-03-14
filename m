Return-Path: <linux-arm-msm+bounces-14126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0149F87BBF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 12:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA2EB287188
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 11:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3AE6F086;
	Thu, 14 Mar 2024 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zqvo8d6T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3E36F076
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710415827; cv=none; b=osiSTGjWHWm+uBY0TN5/wdHRHty+YKzXkKOPR+t/GW8NzYcuthyO3LD+kTFtaUlEOXjewiY3kIbWKa4tayXwFuXIPB3pD2eorFwHuVt5+o1fFTq78v9nynWStGpSoYWSt8iDShdN1wxo5wXepHGu4V6BTSc4nTFzs6x0bdxI2So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710415827; c=relaxed/simple;
	bh=geeaJ9XrpY7EnV7LvgPDmm4ZknarR6+u6ViCbG57IHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/ZfB86qBVasQsrkY/gRVfZk+9bFZIiio/P39N/KjILNdLqiajX2Cr2kgNjc8xhmmRo0BhSGxcFoDgi3gE2X4J9kHJMB8X3pKmmfizth0bw+sNw4p2t3eFyxL59AFZzTu9wpyaFRSeleaVlpbdREzp6OEQpR+hE+V61BDLsXETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zqvo8d6T; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-474cb4bcd3dso344125137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 04:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710415824; x=1711020624; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x5jf2VCmw1aXglJHB8Z5PT6x/rVvoN43ugLsRz/juHg=;
        b=Zqvo8d6T6ZhmEjaO7NR8uOBnDYGDgRNPL/0q3d06zP8MPUdvC+4Vxc4kV9DmgFpzuf
         F6B1emzu2b2eYYKBduXi9RRLcqwaRx5pBT18an7gdR3gZiNaMbTXseYHUOmAmpdopVuJ
         QQhUmAKT/vLr9qQCYIJJVhgVp9aVhpmAwrLikVvnzIC5KCgpsGzE6j/3jW417oThqAHp
         3yW+LykqC4Feq7nBudHwR/PYfcdUYGPIjXSRGeFtBhg/Ni+vQ0Siw/hC3ld/M4SM4UXN
         HZ0Z5DGHx5KT2Q9Hj8y8IZOjGRC5UpfwN2C4qOFDAvUtKkULJXpxQRqNubRfLMOZFt2k
         Kf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710415824; x=1711020624;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5jf2VCmw1aXglJHB8Z5PT6x/rVvoN43ugLsRz/juHg=;
        b=KdRLRIyTC78E4blONmpyZkFtv0OXyIKPmTBk6fThNr0qh6/PXwq2y5uXjvkIE/HWuV
         J7dVgBYW+58Ev7Xoiod3YM0OCHJ90MrkrAygDK6jsoAzf+N/8M34nq/AHiFslWxIwCgU
         0au3CxApYPDsLw4izYRriEGvkPb5syEDXHEiFr65Q6hR7xjsCclRy9YZtJMU9swA+CQL
         Q1BcxLcxSpcV06uUHJEH2yq/rMr/9P9YMWWn9JUr7ir1uT9GpM00UXRhdSxNWyLcKxmr
         UIPWaob9uT+2zPobeR18OtxhOm6WokMAfa7Qs2ZQ20tHEIe9rqsWOohPJVeMX1ZXusAW
         xfMA==
X-Forwarded-Encrypted: i=1; AJvYcCXux3DgBM33OJq0pmxoKZf7+Ciytu12hwuxDV/z4zyZ6mvrlRIoHh65cK210pdf5CtYyrKYc9IiYdxWoJvOBeYKmmGeY6VVvDoqInsfqA==
X-Gm-Message-State: AOJu0Yzlr32FQLi1P5L4wLu+SQfnR6Ma+w7TBdXansNYqJIZqJ4PIl+b
	3/Tt9yPQuinR1FX8i+UW1yDafcb8IxXv+iw76q/3iBW2O8TKP5m1SHb2A0D8IcWYsXjbWiP51/b
	bPwmbVMAgwA1VsXWznCoeir2SnfWWwjaQkOodMA==
X-Google-Smtp-Source: AGHT+IGvFGm119bVeOJF9Po12RVbWwG8w/gEM+FJSAHy8Fb4qExKYZgUjo6xPF5jADyADX/A5QLEpty/WiIvgrxrNKw=
X-Received: by 2002:a05:6102:2259:b0:473:213e:d4af with SMTP id
 e25-20020a056102225900b00473213ed4afmr1401196vsb.21.1710415824429; Thu, 14
 Mar 2024 04:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314112657.167006-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240314112657.167006-1-krzysztof.kozlowski@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 14 Mar 2024 17:00:12 +0530
Message-ID: <CAFA6WYOV2Mn_1==67Yxacjp9RR2LC7dQUU4Y5Q3b=yo5yhNVyg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: apq8016-sbc: correct GPIO LEDs node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 16:57, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Individual LEDs in a GPIO LEDs device node are not addressable, thus
> unit address is not correct.
>
> dtc is also not happy:
>
>   Warning (unit_address_vs_reg): /leds/led@5: node has a unit name, but no reg or ranges property
>
> Reported-by: Sumit Garg <sumit.garg@linaro.org>
> Closes: https://lore.kernel.org/all/CAFA6WYNRwF7GqhBk2B7i-deT3aLxNQckhnOasjip2TYm4HZgAw@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> index 9ffad7d1f2b6..aba08424aa38 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> @@ -91,7 +91,7 @@ leds {
>
>                 compatible = "gpio-leds";
>
> -               led@1 {
> +               led-1 {
>                         label = "apq8016-sbc:green:user1";
>                         function = LED_FUNCTION_HEARTBEAT;
>                         color = <LED_COLOR_ID_GREEN>;
> @@ -100,7 +100,7 @@ led@1 {
>                         default-state = "off";
>                 };
>
> -               led@2 {
> +               led-2 {
>                         label = "apq8016-sbc:green:user2";
>                         function = LED_FUNCTION_DISK_ACTIVITY;
>                         color = <LED_COLOR_ID_GREEN>;
> @@ -109,7 +109,7 @@ led@2 {
>                         default-state = "off";
>                 };
>
> -               led@3 {
> +               led-3 {
>                         label = "apq8016-sbc:green:user3";
>                         function = LED_FUNCTION_DISK_ACTIVITY;
>                         color = <LED_COLOR_ID_GREEN>;
> @@ -118,7 +118,7 @@ led@3 {
>                         default-state = "off";
>                 };
>
> -               led@4 {
> +               led-4 {
>                         label = "apq8016-sbc:green:user4";
>                         color = <LED_COLOR_ID_GREEN>;
>                         gpios = <&pm8916_gpios 2 GPIO_ACTIVE_HIGH>;
> @@ -127,7 +127,7 @@ led@4 {
>                         default-state = "off";
>                 };
>
> -               led@5 {
> +               led-5 {
>                         label = "apq8016-sbc:yellow:wlan";
>                         function = LED_FUNCTION_WLAN;
>                         color = <LED_COLOR_ID_YELLOW>;
> @@ -136,7 +136,7 @@ led@5 {
>                         default-state = "off";
>                 };
>
> -               led@6 {
> +               led-6 {
>                         label = "apq8016-sbc:blue:bt";
>                         function = LED_FUNCTION_BLUETOOTH;
>                         color = <LED_COLOR_ID_BLUE>;
> --
> 2.34.1
>

