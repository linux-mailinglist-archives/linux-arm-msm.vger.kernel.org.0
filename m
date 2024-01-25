Return-Path: <linux-arm-msm+bounces-8353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F6A83CF60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A528D1F2239D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541C013BE85;
	Thu, 25 Jan 2024 22:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eTFidCax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C83A13B7B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 22:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706221795; cv=none; b=WqbwCr8lIU9iLF1GnuzGtEMA0LhSSX7/Svm9W0888S4N+pHA3+Zng/FsOt/QpPEF7PeLI30zNWcvBBwfX4GuFZdHDT4FCvQNwsG18u1Le98PNWfNsveslUnFgG+7m1S6beqUdJRiWjg7jMqO2YCfKxdxioWgJ0OG5lGSVccG9m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706221795; c=relaxed/simple;
	bh=pdmqitTeaF84l4GLBECsFls/XdMw2AE1xh/qLajhugI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ccBFtO/lcILEH0Zdx+v0EMq0Tqu11r47AM/MtTmfQDMgduH/yik0U7ZJEKCC3w8WAQD3mskM3GVuj4IRC4XJHuSCLcd6RrNmHVUGUUk5GlnppfgHqrcGyI7NOIJJLy8Ht9DJtKx9kyqD1txAgYkT0kaDiXFyRh1q+zK/8U7v7Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eTFidCax; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc35fd0df02so4119249276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 14:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706221791; x=1706826591; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0qj1aarYcNCRPMpfcILtapIIFfoDQsiP4fM6MW/nqV0=;
        b=eTFidCaxsOw3f3pz74qAqEMl3M5gbAgocD6v2alejncgRQTq+gXP7C/vfJsyQDhQcz
         VOw1GiSIOUSaEuZ3WTYfOIyCuNeKnEPyMkCQBsGk37WUCS89KWQFEwR1+h6Y0vI/1TG3
         YcBBxYRca1SQAy9KxFafty2au49wZi9XpgMKZzQ0OaedagalbQ3KbBY0ccwY+RagfAo0
         UMFWS0ZZ71TR3UmJYqgs4X4fASpPNPCnxjtBcF+MXJDNBpuOn3fMzJ4HY7ZijHhwAayz
         a2Ax7LpiZSCfgivTJaITOY1taRRLwG1ADiPH5P8BJPt3rvWy/Srm0+TNwmJdr4UjxaSv
         55aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706221791; x=1706826591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qj1aarYcNCRPMpfcILtapIIFfoDQsiP4fM6MW/nqV0=;
        b=Sql/AKqbYdtuxaTJo2TSTVho2GQKlQDkTtyknx3ZYiOiIN8nB8QQisXFgkdPYGrvee
         HnyaoVWE7/xyr/Sm2DmxUb8Ogr70GVfj7g/fmDmLHO2wxb6w/eIVov1AZeRvDRDVMUCG
         SrLZAPUwcDmPYldVQeHeYqjNds2WID2ujgOUcAlcAG1Obq4rxKP8fnywWRy8dBwcFA0P
         MolZhW257brPxW3hCQoYZgm2eB/7SNrbkEkraBgBfZXaJx9meS4/siBFMGffOE57ReLM
         8qeX4FzX0izjHC+RrRzk2BbIAAiPr7PinHoIPC6jwb/f6jcUHd7RY26Kk9yCRMhYBkdg
         5X/A==
X-Gm-Message-State: AOJu0Yzq91NVggNWrkHbvsAh6eKqolOapfnyQw47Ak4a9ZzUOSjtqnfZ
	4ROJSKv5ng3WSMCrHS57WBQ7wYZk7/zdgeKs8QnD7glir6wEL0WvT3zKph/U5AwQa4ZU5l72jPE
	4Pr1aNLauAsdJhJSMCJRWvAR6clGeWxa7cuRSwQ==
X-Google-Smtp-Source: AGHT+IEIrXiJz/BJm8XfspLPa6VXYTY6QIWf67Zf9KppnCLv1hYViKn5F1vUW8HIv7famATu3qJ7JAubWNKmRV2MlZo=
X-Received: by 2002:a25:ab34:0:b0:dc2:1fa9:5329 with SMTP id
 u49-20020a25ab34000000b00dc21fa95329mr496445ybi.29.1706221791148; Thu, 25 Jan
 2024 14:29:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125-sa8295p-gpu-v4-0-7011c2a63037@quicinc.com> <20240125-sa8295p-gpu-v4-6-7011c2a63037@quicinc.com>
In-Reply-To: <20240125-sa8295p-gpu-v4-6-7011c2a63037@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 00:29:40 +0200
Message-ID: <CAA8EJprR74VGm4djFdZvVA8xtqHvbFypwacmxqcMZhOLUo6XSQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] arm64: dts: qcom: sa8295p-adp: add max20411
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 23:06, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> From: Bjorn Andersson <andersson@kernel.org>
>
> The SA8295P ADP has a MAX20411 LDO regulator on I2C 12, supplying the
> VDD_GFX pads. Enable the bus and add the maxim,max20411 device on the
> bus.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

This doesn't match the From header.

> ---
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 39 ++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> index fd253942e5e5..bd0962f39fc5 100644
> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> @@ -266,6 +266,26 @@ &dispcc1 {
>         status = "okay";
>  };
>
> +&i2c12 {
> +       pinctrl-0 = <&qup1_i2c4_state>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +
> +       vdd_gfx: regulator@39 {
> +               compatible = "maxim,max20411";
> +               reg = <0x39>;
> +
> +               regulator-min-microvolt = <800000>;
> +               regulator-max-microvolt = <800000>;
> +
> +               enable-gpios = <&pmm8540a_gpios 2 GPIO_ACTIVE_HIGH>;
> +
> +               pinctrl-0 = <&max20411_en>;
> +               pinctrl-names = "default";
> +       };
> +};
> +
>  &mdss0 {
>         status = "okay";
>  };
> @@ -476,6 +496,10 @@ &pcie4_phy {
>         status = "okay";
>  };
>
> +&qup1 {
> +       status = "okay";
> +};
> +
>  &qup2 {
>         status = "okay";
>  };
> @@ -636,6 +660,14 @@ &xo_board_clk {
>
>  /* PINCTRL */
>
> +&pmm8540a_gpios {
> +       max20411_en: max20411-en-state {
> +               pins = "gpio2";
> +               function = "normal";
> +               output-enable;
> +       };
> +};
> +
>  &tlmm {
>         pcie2a_default: pcie2a-default-state {
>                 clkreq-n-pins {
> @@ -728,4 +760,11 @@ wake-n-pins {
>                         bias-pull-up;
>                 };
>         };
> +
> +       qup1_i2c4_state: qup1-i2c4-state {
> +               pins = "gpio0", "gpio1";
> +               function = "qup12";
> +               drive-strength = <2>;
> +               bias-pull-up;
> +       };
>  };
>
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

