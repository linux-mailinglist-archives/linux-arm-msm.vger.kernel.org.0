Return-Path: <linux-arm-msm+bounces-21140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0348E8D5026
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 18:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADCF72846A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D003B1A1;
	Thu, 30 May 2024 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KT114ktS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9398836AF8
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717087870; cv=none; b=nO8/YDo6UXWLwMPOr46r8GJk2h9gQOMK7SLK2imuW0c9bTLXOGLJyyFayeu0VAScOjKP73ZHOdqz38fsFW05+ZyHIoY0d3iVxCOqdZaBKipYSpCUhVNU5fUboJe9lX3e3Ni0NNmvrgv6MRuGT+9toB0aa0THbDvA2GKWVwm0ibM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717087870; c=relaxed/simple;
	bh=so41Lub8ThE33Ip0KxnSvZTX2i7sQPgod5c1Skc8Wbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRn3i2+QWI45ce2RPfi7Fj3GBBW3bjtMCs9Zdxdf/lRHtddM4rpbCvVbHP5W3z9A1qfzmoOBpo8NHDqEyLJE9+7X2MUmkA0PTWHjWLO+J77/kXpwgiRs+frH5cDFyTAnDUBKM7MjTZSOm1R+r09syEAhIgJ2/TL6mQUCuOZ0jjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KT114ktS; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-62a2424ecdaso11307907b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 09:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717087867; x=1717692667; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aqi+Bly9+fI8LTSCHofvqlMYXb/ts7Xr0psf1+hii0g=;
        b=KT114ktSQbQSeL1Jbw1MbWTn56YA0fQ39eLnfqjo9GN8Uj6APhcs6GH6nMTmyvtVQp
         SEouU+eOTrzmdYmJ0p8B4JOHnfmdbOQGQIwDZNkaZlXpiIIUyUFGfLxVDcBO1sbJp0zX
         7yCKPhrN4IcXzZqRKL8rrHzIBY7TiFPo7e8iDz3vD2IgLfoX2tIXS6zJ1ZxiixTcDNxa
         8l0mNuzOZGDmE26SZQ2KQoCvVY65AWG3GB46IkkaHjAbM94MPUBux9iABSY9uLAnLlT9
         /P1ji8y1z4R+PIakQUmYYu4GOs67AcduQE58AHz063WS5h1DANqdUQKg7WAWu3RJZk9R
         y6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717087867; x=1717692667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aqi+Bly9+fI8LTSCHofvqlMYXb/ts7Xr0psf1+hii0g=;
        b=uVquxqODyeR3opIU3Nshm2f66awf1Ni+/jcQn+GzVFHrl3uqfBSooqkgOdZnkoy4d6
         3B+BhgLSzdRQhv8p7t1KBZJYOPHFbMPdQuOOKXxS5Iz4NZD40eksDqjw0aQgyxWq7f7X
         mP2X8KHwx3QucWJinhrvciFnK8GcjbSfoqOCb5Y15peLSp67vvsNgqTZo/kJQ3DW5Cwe
         omHnQNNhe1p2hyZtX5fBvIUft57TGhdClSRb0MkOWaIw8lO7C8UZXno4kh3+EQZIQld2
         +f0st/I7Z61FIMVSWyGUIMUd7MWaZUwQknSN3gcQp0SfzQOXo2Dn7dyZn/aYriokhHm5
         yjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw0RToJI0vZNgqPYclQXV65Gprb8D7ZZE+iFOqsjGWiv+kURAkh6zhAxHuF33b6hc7yR5l/b5d4NAr1nLA2UT1Im8wMsTpih4LsIpIIw==
X-Gm-Message-State: AOJu0YzcEdILzOLgU5H+81GNIo/D4DNnqzwoRpnHlmJ/a9OjLSi9D1vP
	/0XgJp1AAE5yofXNQnHzDoQvUNASdfHePo3OO2qO4NLNP4HK4FRbvl8w0hRdMhR3xD4prxg6The
	Km8rbpC0LW1BiLg8EBzlaBj238eFu4iklxPXZbw==
X-Google-Smtp-Source: AGHT+IEuen8OmFxtuj4ZTgSRHBzI1g5POIAvSBNhxH9SD/FeOP3UDyFdtxweAcS82F8ez2dxE61/qfptaa8jH8eMSzo=
X-Received: by 2002:a5b:dce:0:b0:dee:6323:e8f2 with SMTP id
 3f1490d57ef6-dfa5a693338mr2769319276.47.1717087867294; Thu, 30 May 2024
 09:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8cc61db5-2920-4dd1-8132-5af434fb05b1@freebox.fr>
 <o6wwzb4qblelfpfsrmqhoovjnyvymf42p2ilv4bzn4le3nklbv@kj3qklez7izy>
 <40903165-c965-4c6c-a3bf-104b1088730b@freebox.fr> <CAA8EJppg9ftnQVrZhEO9Ro2Ji6whCgQLaJrr0yCzV-2hF2HEtQ@mail.gmail.com>
 <8475b07d-8d44-4969-9c15-2926a6397b1c@freebox.fr>
In-Reply-To: <8475b07d-8d44-4969-9c15-2926a6397b1c@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 19:50:55 +0300
Message-ID: <CAA8EJprA4R5pkLTocpCWVn-HkUYeFSas7UBrU0rvt55KJ=d56g@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: add HDMI GPIOs
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>, 
	DT <devicetree@vger.kernel.org>, Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 May 2024 at 19:45, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 30/05/2024 15:06, Dmitry Baryshkov wrote:
>
> > This device was neither validated nor described properly in the DT
> > schema. There are several other issues here.
>
> Do you mean dtbs_check or dt_binding_check or something else?

dtbs_check

>
> I think I changed everything you pointed out.
> (I tried to remain as close as possible to msm8996.)

Yes, this is better now.

>
> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> index 47e97669821c3..9fc49ae9ee387 100644
> --- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> @@ -19,6 +19,7 @@ properties:
>        - qcom,hdmi-tx-8974
>        - qcom,hdmi-tx-8994
>        - qcom,hdmi-tx-8996
> +      - qcom,hdmi-tx-8998

If you scroll the file down, you'll see that this is not enough.

>
>    clocks:
>      minItems: 1
> diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> index 83fe4b39b56f4..78607ee3e2e84 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,hdmi-phy-8996
> +      - qcom,hdmi-phy-8998
>
>    reg:
>      maxItems: 6
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index e5f051f5a92de..268bb83efccce 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -1434,6 +1434,34 @@ blsp2_spi6_default: blsp2-spi6-default-state {
>                                 drive-strength = <6>;
>                                 bias-disable;
>                         };
> +
> +                       hdmi_cec_default: hdmi-cec-default-state {
> +                               pins = "gpio31";
> +                               function = "hdmi_cec";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       hdmi_ddc_default: hdmi-ddc-default-state {
> +                               pins = "gpio32", "gpio33";
> +                               function = "hdmi_ddc";
> +                               drive-strength = <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       hdmi_hpd_default: hdmi-hpd-default-state {
> +                               pins = "gpio34";
> +                               function = "hdmi_hot";
> +                               drive-strength = <16>;
> +                               bias-pull-down;
> +                       };
> +
> +                       hdmi_hpd_sleep: hdmi-hpd-sleep-state {
> +                               pins = "gpio34";
> +                               function = "hdmi_hot";
> +                               drive-strength = <2>;
> +                               bias-pull-down;
> +                       };
>                 };
>
>                 remoteproc_mss: remoteproc@4080000 {
> @@ -2757,7 +2785,7 @@ mmcc: clock-controller@c8c0000 {
>                                  <&mdss_dsi0_phy 0>,
>                                  <&mdss_dsi1_phy 1>,
>                                  <&mdss_dsi1_phy 0>,
> -                                <0>,
> +                                <&hdmi_phy 0>,
>                                  <0>,
>                                  <0>,
>                                  <&gcc GCC_MMSS_GPLL0_DIV_CLK>;
> @@ -2862,6 +2890,14 @@ dpu_intf2_out: endpoint {
>                                                         remote-endpoint = <&mdss_dsi1_in>;
>                                                 };
>                                         };
> +
> +                                       port@2 {
> +                                               reg = <2>;
> +
> +                                               dpu_intf3_out: endpoint {
> +                                                       remote-endpoint = <&hdmi_in>;
> +                                               };
> +                                       };
>                                 };
>                         };
>
> @@ -3017,6 +3053,90 @@ mdss_dsi1_phy: phy@c996400 {
>
>                                 status = "disabled";
>                         };
> +
> +                       hdmi: hdmi-tx@c9a0000 {
> +                               compatible = "qcom,hdmi-tx-8998";
> +                               reg =   <0x0c9a0000 0x50c>,
> +                                       <0x00780000 0x6220>,
> +                                       <0x0c9e0000 0x2c>;
> +                               reg-names = "core_physical",
> +                                           "qfprom_physical",
> +                                           "hdcp_physical";
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <8>;
> +
> +                               clocks = <&mmcc MDSS_MDP_CLK>,
> +                                        <&mmcc MDSS_AHB_CLK>,
> +                                        <&mmcc MDSS_HDMI_CLK>,
> +                                        <&mmcc MDSS_HDMI_DP_AHB_CLK>,
> +                                        <&mmcc MDSS_EXTPCLK_CLK>;
> +                               clock-names =
> +                                       "mdp_core",
> +                                       "iface",
> +                                       "core",
> +                                       "alt_iface",
> +                                       "extp";

Ok, you have dropped several clocks, which I think might be required
for the device to function. For example, msm8996 doesn't have
MNOC_AHB_CLK, while msm8998 has it. It might be that we should be
enabling the clock via the interconnect driver instead (or maybe it is
handled by RPM?).

Let's hope that we can sort the clocks. I have no other issues remaining.

> +
> +                               phys = <&hdmi_phy>;
> +                               #sound-dai-cells = <1>;
> +
> +                               pinctrl-names = "default", "sleep";
> +                               pinctrl-0 = <&hdmi_hpd_default
> +                                            &hdmi_ddc_default
> +                                            &hdmi_cec_default>;
> +                               pinctrl-1 = <&hdmi_hpd_sleep
> +                                            &hdmi_ddc_default
> +                                            &hdmi_cec_default>;
> +
> +                               status = "disabled";
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               hdmi_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf3_out>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               hdmi_out: endpoint {
> +                                               };
> +                                       };
> +                               };
> +                       };
> +
> +                       hdmi_phy: hdmi-phy@c9a0600 {
> +                               compatible = "qcom,hdmi-phy-8998";
> +                               reg = <0x0c9a0600 0x18b>,
> +                                     <0x0c9a0a00 0x38>,
> +                                     <0x0c9a0c00 0x38>,
> +                                     <0x0c9a0e00 0x38>,
> +                                     <0x0c9a1000 0x38>,
> +                                     <0x0c9a1200 0x0e8>;
> +                               reg-names = "hdmi_pll",
> +                                           "hdmi_tx_l0",
> +                                           "hdmi_tx_l1",
> +                                           "hdmi_tx_l2",
> +                                           "hdmi_tx_l3",
> +                                           "hdmi_phy";
> +
> +                               #clock-cells = <0>;
> +                               #phy-cells = <0>;
> +
> +                               clocks = <&mmcc MDSS_AHB_CLK>,
> +                                        <&gcc GCC_HDMI_CLKREF_CLK>,
> +                                        <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +                               clock-names = "iface",
> +                                             "ref",
> +                                             "xo";
> +
> +                               status = "disabled";
> +                       };
>                 };
>
>                 venus: video-codec@cc00000 {
>
>
> I get /dev/tty1 on the TV.
>
> And the following command displays test patterns as expected:
> # modetest -Mmsm -a -s 33:#0 -P 34@82:1920x1080+0+0@XR24 -P 40@82:200x200+35+300@AR24 -P 46@82:200x200+310+300@AR24
> setting mode 1920x1080-60.00Hz on connectors 33, crtc 82
> testing 1920x1080@XR24 on plane 34, crtc 82
> testing 200x200@AR24 on plane 40, crtc 82
> testing 200x200@AR24 on plane 46, crtc 82
>
>
> Regards
>


-- 
With best wishes
Dmitry

