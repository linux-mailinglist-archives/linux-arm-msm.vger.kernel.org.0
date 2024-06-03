Return-Path: <linux-arm-msm+bounces-21488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A3A8D83EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 15:29:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3320B1C20290
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 13:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59B212D755;
	Mon,  3 Jun 2024 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bVefv8t5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F5684D10
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421380; cv=none; b=nK0v0jXohQOOXrqd3djuFpXBp9/TmITALJUQ7ivsAzGGZ3mu2sRROudnKqh6jkvLNlIcyDkuQyWFCec7oFLnVSD3Pjeb4bbTZZYyHNNsJ7rAnw15aD2a0l/Q9xGuHasWvnX4pH8A2HQBH1XrdQio4WcEF627d1B4gV5jCC3RXYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421380; c=relaxed/simple;
	bh=NBGSCYBMV9iIF5oAKDfaLNnrj7JuZ/8wZC6L8Inm5xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRHp88CpfRhTXetwfTSanu7a2hpZGAvfJgpcunYh/mpY2YLdX5jGXGMkYaFmkL/6nUlt++Wa9Hxy5INXsdLmzVvA9XWSfnOPDjyIcbRLYa5gL2bsYRgw2ocROkG7+Xeh3VLe+rhcqFxzdNf5kEW9RbZWXIRb7T9j8a7//jJcY4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bVefv8t5; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-62a2424ecdaso42737667b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717421378; x=1718026178; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=shwwrgVk2wnJX380zTlbvE5aDDJwJWFoPBL56dtEcH0=;
        b=bVefv8t5mYP8oaVN80ihnz7bZnERBGgIUvUIDqdwOo/ZdWgTtMbaq7ueMUfmZbWqbO
         S6lKkZZExJepJdjib4PjMz+At4lyHefsH9MCp6Lr+96xxUQzHQjPChF4ksZEmLO8evX7
         3pnf4kRqPz/Wq/kE8QEGDIuh1B0wHqte1ErNkhHL8ls7jA4Q6pM5KgYZr4gR+/rT4nVT
         8h9Ko2FT34l1kkgWzIP0zB3pa7cOW9eRK688UVRt8GElAcRhz7rfMbnZLPInRk56Qcwl
         F0FQj4kYOd8VmtdY0/v3uomBYobCXWNmiFbxiXmhsfkNQcprOovrZjBEELCFHbVU0AYn
         0gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421378; x=1718026178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shwwrgVk2wnJX380zTlbvE5aDDJwJWFoPBL56dtEcH0=;
        b=VVIH7cWxvJ8BybJAzlecJ+SsrRX6LH1BqNFLI47Da7yCmNnca0MWKaFIqx/n4hyIia
         b3sHZbXrA7Kp+Lsot/KVuz/KDvdbw23xYww2hgBX7ltTcLxYV4pe4nrJoroFtRfzUJ1t
         8BTXI5x4ysvwE4iGPT5GT7nq5+JSRRRt/0NuGodK+HXy5wcAFpDgy0vKtb3VKvZXeLX5
         IWn3Xp8pVYnHVuRFqw9dlZoUVg9huy/AkKcLEHuOz0scJR4JFafKcbgZ8UjSztEZ2n55
         M2AR6TAIb+v8pLXSkUjrxxj9/VkKGbBYxMXWSISTv4wXRbybrtTQdL5wC5S1tE6xaq29
         2Bgw==
X-Forwarded-Encrypted: i=1; AJvYcCVunUvMtf04WTMhB4r7j4URlfpuC34iQXix87QvG+zxCjFG/YpYjqKXtkFiJwZMuzI9BVtfMoLW1Nso58zsjH91scb3iQOnMC+WXgDorA==
X-Gm-Message-State: AOJu0YxGvjaszV5+rQ1B2rn8ZeutZjrJ1hFefHp4cgbNuhjNDF5rxmgG
	aHkXKAAWaTuyYvak0+6rmn4wEW52TXP9c5uIeFmgrN6Ux6HEos0Q8n9qJ3chyllVb1O/jW5LYQA
	luCoylNNKztUk5/vsEmxcI5BFgqkWRWkGKxLmEA==
X-Google-Smtp-Source: AGHT+IGUdFNi1p2X/JwE1+cT9GaQW9D49kInmN0Kv2aRvXVfJkkzsHYsyO4RJq3us25b69v+HIzUCFg3P5PyEkJe9aA=
X-Received: by 2002:a25:6906:0:b0:df4:eacb:a1c2 with SMTP id
 3f1490d57ef6-dfa73dbb7bcmr8653523276.41.1717421377968; Mon, 03 Jun 2024
 06:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8cc61db5-2920-4dd1-8132-5af434fb05b1@freebox.fr>
 <o6wwzb4qblelfpfsrmqhoovjnyvymf42p2ilv4bzn4le3nklbv@kj3qklez7izy>
 <40903165-c965-4c6c-a3bf-104b1088730b@freebox.fr> <CAA8EJppg9ftnQVrZhEO9Ro2Ji6whCgQLaJrr0yCzV-2hF2HEtQ@mail.gmail.com>
 <8475b07d-8d44-4969-9c15-2926a6397b1c@freebox.fr> <CAA8EJprA4R5pkLTocpCWVn-HkUYeFSas7UBrU0rvt55KJ=d56g@mail.gmail.com>
 <395ded49-ae21-4316-870f-a0fd9e3cecd1@freebox.fr>
In-Reply-To: <395ded49-ae21-4316-870f-a0fd9e3cecd1@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 3 Jun 2024 16:29:26 +0300
Message-ID: <CAA8EJpoCKfha572J=Wbzw1a2dKJHJk-bYYqXvBcVsHg=jgaYfQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: add HDMI GPIOs
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>, 
	Bryan O Donoghue <bryan.odonoghue@linaro.org>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Arnaud Vrac <avrac@freebox.fr>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Jun 2024 at 16:06, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 30/05/2024 18:50, Dmitry Baryshkov wrote:
>
> > Ok, you have dropped several clocks, which I think might be required
> > for the device to function. For example, msm8996 doesn't have
> > MNOC_AHB_CLK, while msm8998 has it. It might be that we should be
> > enabling the clock via the interconnect driver instead (or maybe it is
> > handled by RPM?).
> >
> > Let's hope that we can sort the clocks. I have no other issues remaining.
>
> For quick reference:
>
> msm8996-sde.dtsi (VENDOR)
>
>         sde_hdmi_tx: qcom,hdmi_tx_8996@9a0000 {
>                 compatible = "qcom,hdmi-tx-8996";
>
>                 reg =   <0x009a0000 0x50c>,
>                         <0x00070000 0x6158>,
>                         <0x009e0000 0xfff>;
>                 reg-names = "core_physical",
>                         "qfprom_physical",
>                         "hdcp_physical";
>                 clocks = <&clock_mmss clk_mdss_mdp_vote_clk>,
>                          <&clock_mmss clk_mdss_ahb_clk>,
>                          <&clock_mmss clk_mdss_hdmi_clk>,
>                          <&clock_mmss clk_mdss_hdmi_ahb_clk>,
>                          <&clock_mmss clk_mdss_extpclk_clk>;
>                 clock-names =
>                         "mdp_core_clk",
>                         "iface_clk",
>                         "core_clk",
>                         "alt_iface_clk",
>                         "extp_clk";
>                 interrupt-parent = <&sde_kms>;
>                 interrupts = <8 0>;
>                 hpd-gdsc-supply = <&gdsc_mdss>;
>                 qcom,hdmi-tx-hpd-gpio = <&pm8994_mpps 4 0>;
>                 pinctrl-names = "default", "sleep";
>                 pinctrl-0 = <&mdss_hdmi_hpd_active
>                              &mdss_hdmi_ddc_active
>                              &mdss_hdmi_cec_active>;
>                 pinctrl-1 = <&mdss_hdmi_hpd_suspend
>                              &mdss_hdmi_ddc_suspend
>                              &mdss_hdmi_cec_suspend>;
>
>                 sde_hdmi_audio: qcom,sde-hdmi-audio-rx {
>                         compatible = "qcom,msm-hdmi-audio-codec-rx";
>                 };
>         };
>
>
>
> msm8996.dtsi (MAINLINE)
>
>                         mdss_hdmi: hdmi-tx@9a0000 {
>                                 compatible = "qcom,hdmi-tx-8996";
>                                 reg = <0x009a0000 0x50c>,
>                                       <0x00070000 0x6158>,
>                                       <0x009e0000 0xfff>;
>                                 reg-names = "core_physical",
>                                             "qfprom_physical",
>                                             "hdcp_physical";
>
>                                 interrupt-parent = <&mdss>;
>                                 interrupts = <8>;
>
>                                 clocks = <&mmcc MDSS_MDP_CLK>,
>                                          <&mmcc MDSS_AHB_CLK>,
>                                          <&mmcc MDSS_HDMI_CLK>,
>                                          <&mmcc MDSS_HDMI_AHB_CLK>,
>                                          <&mmcc MDSS_EXTPCLK_CLK>;
>                                 clock-names =
>                                         "mdp_core",
>                                         "iface",
>                                         "core",
>                                         "alt_iface",
>                                         "extp";
>
>                                 phys = <&mdss_hdmi_phy>;
>                                 #sound-dai-cells = <1>;
>
>                                 status = "disabled";
>
>                                 ports {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
>
>                                         port@0 {
>                                                 reg = <0>;
>                                                 mdss_hdmi_in: endpoint {
>                                                         remote-endpoint = <&mdp5_intf3_out>;
>                                                 };
>                                         };
>                                 };
>                         };
>
>
>
> msm8998-sde.dtsi (VENDOR)
>
>         sde_hdmi_tx: qcom,hdmi_tx_8998@c9a0000 {
>                 cell-index = <0>;
>                 compatible = "qcom,hdmi-tx-8998";
>                 reg =   <0xc9a0000 0x50c>,
>                         <0x780000 0x621c>,
>                         <0xc9e0000 0x28>;
>                 reg-names = "core_physical", "qfprom_physical", "hdcp_physical";
>                 interrupt-parent = <&sde_kms>;
>                 interrupts = <8 0>;
>                 interrupt-controller;
>                 #interrupt-cells = <1>;
>                 qcom,hdmi-tx-ddc-clk-gpio = <&tlmm 32 0>;
>                 qcom,hdmi-tx-ddc-data-gpio = <&tlmm 33 0>;
>                 qcom,hdmi-tx-hpd-gpio = <&tlmm 34 0>;
>                 qcom,hdmi-tx-hpd5v-gpio = <&tlmm 133 0>;
>                 pinctrl-names = "default", "sleep";
>                 pinctrl-0 = <&mdss_hdmi_hpd_active
>                         &mdss_hdmi_ddc_active
>                         &mdss_hdmi_5v_active>;
>                 pinctrl-1 = <&mdss_hdmi_hpd_suspend
>                         &mdss_hdmi_ddc_suspend
>                         &mdss_hdmi_5v_suspend>;
>                 hpd-gdsc-supply = <&gdsc_mdss>;
>                 qcom,supply-names = "hpd-gdsc";
>                 qcom,min-voltage-level = <0>;
>                 qcom,max-voltage-level = <0>;
>                 qcom,enable-load = <0>;
>                 qcom,disable-load = <0>;
>
>                 clocks = <&clock_mmss clk_mmss_mnoc_ahb_clk>,
>                          <&clock_mmss clk_mmss_mdss_ahb_clk>,
>                          <&clock_mmss clk_mmss_mdss_hdmi_clk>,
>                          <&clock_mmss clk_mmss_mdss_mdp_clk>,
>                          <&clock_mmss clk_mmss_mdss_hdmi_dp_ahb_clk>,
>                          <&clock_mmss clk_mmss_mdss_extpclk_clk>,
>                          <&clock_mmss clk_mmss_mnoc_ahb_clk>,
>                          <&clock_mmss clk_mmss_misc_ahb_clk>,
>                          <&clock_mmss clk_mmss_mdss_axi_clk>;
>                 clock-names = "hpd_mnoc_clk", "hpd_iface_clk",
>                                 "hpd_core_clk", "hpd_mdp_core_clk",
>                                 "hpd_alt_iface_clk", "core_extp_clk",
>                                 "mnoc_clk","hpd_misc_ahb_clk",
>                                 "hpd_bus_clk";
>
>                 /*qcom,mdss-fb-map = <&mdss_fb2>;*/
>                 qcom,pluggable;
>         };
>
>
>
> IIUC the discussion on IRC, the additional clocks are required,
> so the binding should be more like this:
>
> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> @@ -19,14 +19,15 @@ properties:
>        - qcom,hdmi-tx-8974
>        - qcom,hdmi-tx-8994
>        - qcom,hdmi-tx-8996
> +      - qcom,hdmi-tx-8998
>
>    clocks:
>      minItems: 1
> -    maxItems: 5
> +    maxItems: 8
>
>    clock-names:
>      minItems: 1
> -    maxItems: 5
> +    maxItems: 8
>
>    reg:
>      minItems: 1
> @@ -151,6 +152,27 @@ allOf:
>              - const: extp
>          hdmi-mux-supplies: false
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,hdmi-tx-8998
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 8
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: mnoc
> +            - const: iface
> +            - const: bus
> +            - const: iface_mmss
> +            - const: core
> +            - const: alt_iface
> +            - const: extp
>
>
>
> So this is good?

Yes

>
>                                 clocks = <&mmcc MDSS_MDP_CLK>,
>                                          <&mmcc MNOC_AHB_CLK>,
>                                          <&mmcc MDSS_AHB_CLK>,
>                                          <&mmcc MDSS_AXI_CLK>,
>                                          <&mmcc MISC_AHB_CLK>,
>                                          <&mmcc MDSS_HDMI_CLK>,
>                                          <&mmcc MDSS_HDMI_DP_AHB_CLK>,
>                                          <&mmcc MDSS_EXTPCLK_CLK>;
>                                 clock-names =
>                                         "mdp_core",
>                                         "mnoc",
>                                         "iface",
>                                         "bus",
>                                         "iface_mmss",
>                                         "core",
>                                         "alt_iface",
>                                         "extp";
>


-- 
With best wishes
Dmitry

