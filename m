Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D5D424419
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 19:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238130AbhJFR2o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 13:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237826AbhJFR2n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 13:28:43 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A9CC061755
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 10:26:50 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id ls14-20020a17090b350e00b001a00e2251c8so2902233pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 10:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sqLlaNKEqm+ZaZ2LpC7pTVMRjKSj866cBde1zhwsrc8=;
        b=L+m7bOJXYDagzEMZMZkAbBAUxAG85edgM/ThRb3FqDHqXUbdg5j5bl25wq8XWfVGLS
         c6cLTS1VU7uI50OX7QaBiRYgdEbA2pBoM5YfcF6nSMDlVDR9bzQHBdkcwxxjUINOM/q4
         D8in3PNdHmcPD3B57uZ9nUGIqkEnyYK2Vd4bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sqLlaNKEqm+ZaZ2LpC7pTVMRjKSj866cBde1zhwsrc8=;
        b=K2Y8YGynHwJe1QCMOJfyR8XPoCQtpAjpZGUmjB7EG9rdyqR8Nm41Reoxs8uB0WVfds
         OUt6I65btLXJgT1gNnZGGtWGYYXiseRtn/Si2kNlSjIO1DRdQPpFj2/h48Xa/rY4Qolf
         mJVRwxeD9UJhojSeZQlx0AgpG+DlggBxpPlPTWuF+fhkbYQwslAa9Os8V/6LfdihonkN
         9yQY/0uYXYoj6Fyrkqy0yUjpUIrdlrC4+tWl5+6XNsdIoTP1WiqeVq6B804U/b3p1FFj
         PwfkwBAYiS7Dq8QlIVxMpuA2KjC2N1DLSIsa1jsUT9O8stQsyAbQ3/zsjJcdPFbj5OFI
         eC2w==
X-Gm-Message-State: AOAM530v374pL0VpVTLBnlX7xqFS/bAFw5aNwxDG1ITjYoj+mJDJa2W4
        IoDQitrWKB9NwCcHA+qkU1dwoFdBSFFBEg==
X-Google-Smtp-Source: ABdhPJwgaHkRHDL6O0EIejciabO58pF3AjAOBXmYCssuQCdYIo5SWfJHNGO6RTWTopp5Dpn3rcLaYg==
X-Received: by 2002:a17:90a:5ac2:: with SMTP id n60mr12214033pji.184.1633541210450;
        Wed, 06 Oct 2021 10:26:50 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:a463:ae21:d1fc:ddfd])
        by smtp.gmail.com with UTF8SMTPSA id fz20sm5440964pjb.31.2021.10.06.10.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 10:26:49 -0700 (PDT)
Date:   Wed, 6 Oct 2021 10:26:47 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     marcel@holtmann.org, bjorn.andersson@linaro.org,
        johan.hedberg@gmail.com, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, rjliao@codeaurora.org,
        pharish@codeaurora.org, abhishekpandit@chromium.org
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: sc7280: Add bluetooth node on
 SC7280 IDP board
Message-ID: <YV3cVzI4aVeCjMt2@google.com>
References: <1633523403-32264-1-git-send-email-bgodavar@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1633523403-32264-1-git-send-email-bgodavar@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 06, 2021 at 06:00:02PM +0530, Balakrishna Godavarthi wrote:
> Add bluetooth SoC WCN6750 node for SC7280 IDP board.
> 
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts  |  2 ++
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 64fc22a..d3f5393 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -17,6 +17,8 @@
>  
>  	aliases {
>  		serial0 = &uart5;
> +		bluetooth0 = &bluetooth;
> +		hsuart0 = &uart7;

Sort aliases alphabetically.

Also 'hsuart' should not be used, as Dmitry already pointed out on
patch 2/2. I suppose it should be 'serial1', as in 'second serial
port of the board'.

>  	};
>  
>  	chosen {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 272d5ca..05aa729 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -393,6 +393,24 @@
>  				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
> +
> +	bluetooth: wcn6750-bt {
> +		compatible = "qcom,wcn6750-bt";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_en_default>;

Do we also need a pinctrl entry for 'swctrl' ?

> +		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>; /* BT_EN */
> +		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>; /* SW_CTRL */

The comments aren't useful, the property names say the same.

> +		vddio-supply = <&vreg_l19b_1p8>;
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
> @@ -504,6 +522,19 @@
>  		 */
>  		bias-pull-up;
>  	};
> +
> +	bt_en_default: bt_en_default {

	bt_en: bt-en {

> +		pinmux {
> +			pins = "gpio85";
> +			function = "gpio";
> +		};
> +		pinconf {
> +			pins = "gpio85";
> +			drive-strength = <2>;
> +			output-low;
> +			bias-pull-down;
> +		};

No pinmux & pinconf nodes, see configuration for other pins.
