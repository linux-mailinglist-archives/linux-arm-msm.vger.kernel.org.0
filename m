Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4465946BE1F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 15:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238228AbhLGOvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 09:51:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238233AbhLGOvm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 09:51:42 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60207C061746
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 06:48:11 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 71so14067196pgb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 06:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5PTVELFYfrYibQbwYt+W7hpL1huUC9UBcLmp1F+X+PI=;
        b=KzLke8CdzTDq9L30h5l+MsCBEyCXKO5nKA6UF9IxgUPvsHWHN9n71+NT06Yh9TzH0P
         w+TQ8U/lEx1wm36WR3OdlHtGhyaxqUjG1YUaxRDrsGy++0mNfsNEFx0TyJir4uM9jDsa
         eNPZgw6VKKM4Sj9UtvFEezPb8/lByhVvX8U6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5PTVELFYfrYibQbwYt+W7hpL1huUC9UBcLmp1F+X+PI=;
        b=oaE9/Vckwe6uPBBFegczS5q/EYDx6XFJ2HNCGWMYrC8OgQJHk70mYdSOEft2QgsvYz
         +TYE/KsHk0OD6llhfAv1zU32FCbNnpf9EjKFUHIUHIQjh+JsYh3G2EwaeYZ9vep6kfeU
         5GyiAnmEPu7dfzL3wxzTnT6lOZUc3C3rUb+kR4YcPIqX1ihAyDa0rwS4v6GAc5N1/6Y1
         erZfGsr706sDwAgpycvuEmcjqNAEsxQLlDNKL9Ke4jZoBYNq9Gs+vW5zZuezi5DawHGW
         PBf4CvUJ4VvWWfOKy7OxN1uOMiPvTvUrfIEG3rDA1cX4J0A2I0G27NuAIfdUvxkw7uj/
         3zwA==
X-Gm-Message-State: AOAM533wykKLumZEHH5awtGoa/9PfV0h8bVm6nW8jK1r+HTbUxAPjHV1
        EBcKJeXoJLdWPNjy7vabaOnwxA==
X-Google-Smtp-Source: ABdhPJxGxvHqwen1gh1s8L+K3o/lM+kc/49X1TtjIVXAFbQhSZpktC4LOBpspSz+2D4LxUxOxz3NRg==
X-Received: by 2002:a63:c154:: with SMTP id p20mr24057056pgi.132.1638888490849;
        Tue, 07 Dec 2021 06:48:10 -0800 (PST)
Received: from localhost ([2620:15c:202:201:ab1b:c09c:ed69:5925])
        by smtp.gmail.com with UTF8SMTPSA id o22sm16857217pfu.45.2021.12.07.06.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 06:48:10 -0800 (PST)
Date:   Tue, 7 Dec 2021 06:48:09 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org,
        mcchou@chromium.org, saluvala@codeaurora.org,
        Balakrishna Godavarthi <bgodavar@codeauroa.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Add bluetooth node on SC7280
Message-ID: <Ya90KTLlwFlaIWRE@google.com>
References: <1638857623-32379-1-git-send-email-bgodavar@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1638857623-32379-1-git-send-email-bgodavar@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 07, 2021 at 11:43:43AM +0530, Balakrishna Godavarthi wrote:

> Subject: arm64: dts: qcom: sc7280: Add bluetooth node on SC7280

nit: the node is added to the IDP boards, not sc7280 in general

> From: Balakrishna Godavarthi <bgodavar@codeauroa.org>
> 
> Add bluetooth SoC WCN6750 node for SC7280 IDP boards.
> 
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> ---
> v3:
>   * Addressed reviewers comments

that's not overly useful, instead you should describe what changed

>   * Added pin config for sw_ctrl line.
> v2:
>   * merged two patches into one
>   * Removed unused comments
>   * Removed pinmux & pin conf.
>   * Addressed reviewers comments
> 
> v1: initial patch
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts  |  4 ++++
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 37 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280-idp2.dts |  4 ++++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 9b991ba..19bd228 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -56,6 +56,10 @@
>  	};
>  };
>  
> +&bluetooth {
> +	vddio-supply = <&vreg_l19b_1p8>;
> +};
> +
>  &ipa {
>  	status = "okay";
>  	modem-init;
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index d623d71..b8b00dc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -14,6 +14,11 @@
>  #include "pmk8350.dtsi"
>  
>  / {
> +	aliases {
> +		bluetooth0 = &bluetooth;
> +		serial1 = &uart7;
> +	};
> +
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  		label = "gpio-keys";
> @@ -422,6 +427,23 @@
>  				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
> +
> +	bluetooth: bluetooth {
> +		compatible = "qcom,wcn6750-bt";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_en>, <&swctrl_gpio>;
> +		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
> +		vddaon-supply = <&vreg_s7b_0p9>;
> +		vddbtcxmx-supply = <&vreg_s7b_0p9>;
> +		vddrfacmn-supply = <&vreg_s7b_0p9>;
> +		vddrfa0p8-supply = <&vreg_s7b_0p9>;
> +		vddrfa1p7-supply = <&vreg_s1b_1p8>;
> +		vddrfa1p2-supply = <&vreg_s8b_1p2>;
> +		vddrfa2p2-supply = <&vreg_s1c_2p2>;
> +		vddasd-supply = <&vreg_l11c_2p8>;
> +		max-speed = <3200000>;
> +	};
>  };
>  
>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
> @@ -491,6 +513,14 @@
>  };
>  
>  &tlmm {
> +	bt_en: bt-en {
> +		pins = "gpio85";
> +		function = "gpio";
> +		drive-strength = <2>;

is it really necessary to specify the drive strength?

Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml:

  drive-strength:
    enum: [2, 4, 6, 8, 10, 12, 14, 16]
    default: 2

The default is 2, so it shouldn't be needed.

> +		output-low;
> +		bias-disable;
> +	};
> +
>  	nvme_pwren: nvme-pwren {
>  		function = "gpio";
>  	};
> @@ -554,6 +584,13 @@
>  		 */
>  		bias-pull-up;
>  	};
> +
> +	swctrl_gpio: swctrl-gpio {

The 'gpio' suffix isn't really useful.

I suggest to use the signal name from the schematics "mos-sw-ctrl" or
call it "bt-sw-ctrl". If you use the schematic name then this should
be also done for the enable pin.
