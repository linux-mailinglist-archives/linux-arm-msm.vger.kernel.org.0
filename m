Return-Path: <linux-arm-msm+bounces-5707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A9081AF20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 08:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 933991C21ECD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 07:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B23C2C6;
	Thu, 21 Dec 2023 07:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PY7vT8jZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D12FC148
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 07:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5d226f51f71so5361297b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 23:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703142483; x=1703747283; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x3mqWSg4PAag/N8HBMk+GPM7NiqUuxDSinfcR+EyoZg=;
        b=PY7vT8jZP3nkYNsSaZr+1CtHZHTrAPvNAr8kHQKXpZLxFWykaWFxaCKscuXveJmzMV
         KpziNfR0yUSvW7CK4Z2r/y36JDiiWVIrs55BRK6Q+3ezQBM/LOb50mU0PGkbqm7jTS6p
         7MYG1KI+jb7bKv/0IMCKD8Kid2pzBMK4EzrlSAmrX0HyAK2RRHGFYvBRoZCNSLI3cQsI
         fx0gpJ0/5u2hAr4IxGWS2/AiSGUaWB22RGtztsYZvnObgc41o0C3XR9ra9ydKdkgGCg8
         5Fo9TrSVp8DCE6M4IXAzsFMNX6wbZM9C/aezuMy+ilIad444lFzy/x9f19spYMmz+6ly
         hiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703142483; x=1703747283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3mqWSg4PAag/N8HBMk+GPM7NiqUuxDSinfcR+EyoZg=;
        b=wMS6bk/GyKKTrfM3vlhzqWhqbLoTvBGhPM9Gv89RLbrlby/cU5nPBSNt940YHHphE1
         1PGs13NvxA65xVYnrui9kZT8EtWkN2LGcWxN5D+Uv/uctEcvmv0bvYinKo5DO9HmWSU7
         oI7w2grPZ1EmzdDVze61jqfZ5/b9mYGYJnyYe7t4J5H9U2lVy1w5xvRRsvpHs6wbidYv
         gMakUy/OFcnipQLUmbPa9SFiMIDLSluF776q3DLq/CJ6d41KnGEkqE9BfxkTWBOe8Vg2
         nrdF9wXOTYlfor+Ya3cfi87K08bPKE0RI1G4lMtBvyGQHy6tA5lWyx/nl8wV/g8QaYu7
         QpKw==
X-Gm-Message-State: AOJu0Yw74AzUVHGXYFJKNPFv94HPHsTFiY4LxwER7V5Ak9TgdFjKH98y
	arq7E2zZZ4962tebXAf/eiybjXlMN9o/2+uv6qLnOw==
X-Google-Smtp-Source: AGHT+IEy0v0j3VMzWFJEqCyweVJbc+4811KR4XpQHk1zdeDXZP1XX8jNHrM0RyvmA9HQo1q0RhUDGFVGgq/WrXEKAH4=
X-Received: by 2002:a81:9215:0:b0:5d7:1940:dd71 with SMTP id
 j21-20020a819215000000b005d71940dd71mr851157ywg.71.1703142483496; Wed, 20 Dec
 2023 23:08:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220-sa8295p-gpu-v1-0-d8cdf2257f97@quicinc.com> <20231220-sa8295p-gpu-v1-6-d8cdf2257f97@quicinc.com>
In-Reply-To: <20231220-sa8295p-gpu-v1-6-d8cdf2257f97@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Dec 2023 09:07:52 +0200
Message-ID: <CAA8EJprUobs=EJWTMK5=U-=5rU_L0RWRgjFjBZZX1mQWMiW4_w@mail.gmail.com>
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sa8295p-adp: add max20411
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Dec 2023 at 05:52, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> From: Bjorn Andersson <andersson@kernel.org>
>
> The SA8295P ADP has a MAX20411 LDO regulator on I2C 12, supplying the
> VDD_GFX pads. Enable the bus and add the maxim,max20411 device on the
> bus.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 40 ++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> index fd253942e5e5..e16406c9c19d 100644
> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> @@ -266,6 +266,26 @@ &dispcc1 {
>         status = "okay";
>  };
>
> +&i2c12 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&qup1_i2c4_state>;
> +
> +       status = "okay";
> +
> +       vdd_gfx: regulator@39 {
> +               compatible = "maxim,max20411";
> +               reg = <0x39>;
> +
> +               regulator-min-microvolt = <800000>;
> +               regulator-max-microvolt = <968750>;
> +
> +               enable-gpios = <&pmm8540a_gpios 2 GPIO_ACTIVE_HIGH>;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&max20411_en>;
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
> @@ -728,4 +752,20 @@ wake-n-pins {
>                         bias-pull-up;
>                 };
>         };
> +
> +       qup1_i2c4_state: qup1-i2c4-state {
> +               pins = "gpio0", "gpio1";
> +               function = "qup12";
> +
> +               drive-strength = <2>;
> +               bias-pull-up;
> +       };
> +};
> +
> +&pmm8540a_gpios {

I think pmm8540a_gpios comes before tlmm in the dictionary order.
Other than that LGTM

> +       max20411_en: max20411-en-state {
> +               pins = "gpio2";
> +               function = "normal";
> +               output-enable;
> +       };
>  };



-- 
With best wishes
Dmitry

