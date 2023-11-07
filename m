Return-Path: <linux-arm-msm+bounces-30-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A95A87E3600
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 08:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A9A9B20BD6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 07:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17CCCA5C;
	Tue,  7 Nov 2023 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpbngZQo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBE1947A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 07:40:32 +0000 (UTC)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 520CAFD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 23:40:30 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-da2e786743aso5498681276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 23:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699342829; x=1699947629; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fmjk2S1gx+Mc5+ahgQ713WeG4CHwIeelidOIJhG+yrU=;
        b=gpbngZQoHZASwVRGuasiLGM2AJsGXd8wIwBhG3LDz013w6XGvRpn3XyuHQa6XKlvEL
         gt8itovHaqH3V0PDyvhQB3Z1SI2f3Z/FQBKKTNqddgydE5KNiwOoOpJTlliKqZnBKGOu
         30KX4mJbzoWSq5e4F5cnaErudG8FHVd1iN1V8QKljHU+Ss7DruYxEtQY9K5qBfCZnQtw
         KrbIJUwx23E4CHOxNvdKM3Y3kcXJ1FQ7sDlk0ShFeQN6A7Km4pnJAJ6pZa9ClynnTYHO
         qcDEd2iP3SCojjOpxjyGKhqa/IbvHOs6hM5xaHzS1vFv0e/uY5dP8rz8r6NBLeKQ0efu
         IfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699342829; x=1699947629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmjk2S1gx+Mc5+ahgQ713WeG4CHwIeelidOIJhG+yrU=;
        b=EzFs/pYdk/CjTt4lU3EOXJT1le/ywKDmj0890aliDYpAsbFXRVVnGUMDJofnXGPaug
         SaSDj7LVMDviKidxRgG5kQ6CoLBl6pP+RIReHsHo64qZYg3GIekIMs2JAOmwNU2E0Bek
         2sY8yfioUbg+mxsEudL51Z3Nec6s4NwTdyXxOglidK4PseJ7JyzIbOfFh5hOY9Wfrj3M
         WWxdD7fjnYkLwQwABb2CNlCkZFMLjXeGyHE9OV+sxhmc58Hg8VQCOt7H1Zgxj/fbscxq
         LCEnDZVvj37mPdSRD3HOOkCZxzSyJ8Q/Zqd9ILpwlDVeiXtFVfulKXKFI/WmLWgUjOxK
         fCSg==
X-Gm-Message-State: AOJu0YyfeRsv/KsjvhSm0F7RPQQbHFwmlI1mfnyNPv2it0//ucPPNtG6
	ZaBrBK7LZbxXqe5bkmVbb2RLWuwaIiDHkSYQags+o/CzJrkH8BeI
X-Google-Smtp-Source: AGHT+IEkezaO3xn+bZBw5zU5yiH9kZRM2ERBEPQaE0eEGpN1fDLHKGTNDxCLoAWK+RBxtSNwmsD3XxAQ4jHLyeMD6ow=
X-Received: by 2002:a25:25cd:0:b0:d9a:f949:45d1 with SMTP id
 l196-20020a2525cd000000b00d9af94945d1mr29426309ybl.13.1699342829481; Mon, 06
 Nov 2023 23:40:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
 <20231106144335.v2.6.I909b7c4453d7b7fb0db4b6e49aa21666279d827d@changeid>
In-Reply-To: <20231106144335.v2.6.I909b7c4453d7b7fb0db4b6e49aa21666279d827d@changeid>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 7 Nov 2023 08:40:18 +0100
Message-ID: <CACMJSeupvs4zkz9GiBwL5r+fN9qiqdpbcRgnifsBrZrQiFEaQg@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: sa8775p: Make watchdog bark
 interrupt edge triggered
To: Douglas Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, swboyd@chromium.org, 
	linux-watchdog@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Nov 2023 at 23:44, Douglas Anderson <dianders@chromium.org> wrote:
>
> As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
> bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
> interrupt should be configured as edge triggered. Make the change.
>
> Fixes: 09b701b89a76 ("arm64: dts: qcom: sa8775p: add the watchdog node")
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 13dd44dd9ed1..6b92f9083104 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -2235,7 +2235,7 @@ watchdog@17c10000 {
>                         compatible = "qcom,apss-wdt-sa8775p", "qcom,kpss-wdt";
>                         reg = <0x0 0x17c10000 0x0 0x1000>;
>                         clocks = <&sleep_clk>;
> -                       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>                 };
>
>                 memtimer: timer@17c20000 {
> --
> 2.42.0.869.gea05f2083d-goog
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

