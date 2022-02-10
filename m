Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3054B01FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 02:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbiBJBW4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 20:22:56 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:42582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbiBJBWz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 20:22:55 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41DF767E
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 17:22:57 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id u47-20020a4a9732000000b00316d0257de0so4598819ooi.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 17:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=eEcY0jIVJ2FZN3p48D7MwNjcdlBILBxWpdQKujjHv4Y=;
        b=gc4jh1TdvPUm9DniH+6ruKyjuA0469iUnwjtdL63Kb/eX3hbsGZDWHCOETMCYrr5wX
         eWbF5t4Re8fvLymy92Lu06ClAgFBTzLBRQfIXxnM1yAqobBRjTSziAWwjrEyoKHvsxPM
         CNLP8XqqrX0uCpjdWfy6Fzb3oQ4LntZUHCcpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=eEcY0jIVJ2FZN3p48D7MwNjcdlBILBxWpdQKujjHv4Y=;
        b=Fy1jn4TrDEAklDPCdmU2WWqJ7fZRF6qEww8FSG0Kc6s/kO7ZpQRi+fYloFcYaHFne5
         otr71Ni+dJVZPcHe8H81U9z6hQ0Tnn0X63qvmUYngxDL7C5z2EtEcHSd+nFNpvmrjzhw
         7o+8ZPpzDj2ikjqgUO65XhilHL3kbm/Wuu31W00SON3Xr3lnYfsi2FDffOim3hF4UfQj
         NPnDuVIQOFcUe0tbM982BC08qMbfWFSpMWPNjrGiUhAd9PHdGSKUm+T7F41k5fcEIk29
         w1sJkfjKmuH3FG5V3Bw8Gmbem2fBuZEeBcOMEPKUJ4NfPFHldjzugtqFIiG2LonT4MMo
         GjEw==
X-Gm-Message-State: AOAM531Nwj9j/OSLTcirAIaJmUppH6uCy/3G8H6zsEUTS4Vh5c/jUq3s
        oyqx8ApVfx9tBVQ/MZfr/gUDfXsf62fmc3Wmdh48Pf10kwQ=
X-Google-Smtp-Source: ABdhPJxUbJDE1ITWIOPoJ+PyC2BINa96V6D7KopkUeDSzUtFAIAdXa6h3caphf6qob5RB7AGuragu1Gd6okEtDqTYLs=
X-Received: by 2002:a05:6870:d413:: with SMTP id i19mr45015oag.54.1644455697628;
 Wed, 09 Feb 2022 17:14:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Feb 2022 17:14:57 -0800
MIME-Version: 1.0
In-Reply-To: <1644396932-17932-3-git-send-email-quic_sbillaka@quicinc.com>
References: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com> <1644396932-17932-3-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 9 Feb 2022 17:14:56 -0800
Message-ID: <CAE-0n53OxjWD7ybT-AhseO4h3BBG+aFiJZxar5TZYsYgC0ci1w@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        agross@kernel.org, airlied@linux.ie, bjorn.andersson@linaro.org,
        daniel@ffwll.ch, devicetree@vger.kernel.org, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        krzysztof.kozlowski@canonical.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        robh+dt@kernel.org, sam@ravnborg.org, seanpaul@chromium.org,
        thierry.reding@gmail.com
Cc:     quic_kalyant@quicinc.com, quic_abhinavk@quicinc.com,
        quic_khsieh@quicinc.com, quic_mkrishn@quicinc.com,
        quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2022-02-09 00:55:30)
> Enable the eDP display panel support without HPD on sc7280 platform.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>
> Changes in v3:
>   - Sort the nodes alphabetically
>   - Use - instead of _ as node names
>   - Place the backlight and panel nodes under root
>   - Change the name of edp_out to mdss_edp_out
>   - Change the names of regulator nodes
>   - Delete unused properties in the board file
>
>
> Changes in v2:
>   - Sort node references alphabetically
>   - Improve readability
>   - Move the pwm pinctrl to pwm node
>   - Move the regulators to root
>   - Define backlight power
>   - Remove dummy regulator node
>   - Cleanup pinctrl definitions
>
>  arch/arm64/boot/dts/qcom/sc7280-crd.dts | 122 ++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    |   2 +-
>  2 files changed, 123 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> index e2efbdd..2a490a0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> @@ -21,6 +21,59 @@
>         chosen {
>                 stdout-path = "serial0:115200n8";
>         };
> +
> +       backlight_3v3_regulator: backlight-3v3-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "backlight_3v3_regulator";
> +
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&edp_bl_power>;
> +       };
> +
> +       edp_3v3_regulator: edp-3v3-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "edp_3v3_regulator";
> +
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&edp_panel_power>;
> +       };
> +
> +       edp_backlight: edp-backlight {
> +               compatible = "pwm-backlight";
> +
> +               power-supply = <&backlight_3v3_regulator>;
> +               pwms = <&pm8350c_pwm 3 65535>;
> +       };
> +
> +       edp_panel: edp-panel {
> +               compatible = "sharp,lq140m1jw46";
> +
> +               power-supply = <&edp_3v3_regulator>;
> +               backlight = <&edp_backlight>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       port@0 {
> +                               reg = <0>;
> +                               edp_panel_in: endpoint {
> +                                       remote-endpoint = <&edp_out>;

Where is edp_out now?

> +                               };
> +                       };
> +               };
> +       };
>  };
>
>  &apps_rsc {
> @@ -76,6 +129,44 @@ ap_ts_pen_1v8: &i2c13 {
>         };
>  };
>
> +&mdss {
> +       status = "okay";
> +};
> +
> +&mdss_dp {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&dp_hot_plug_det>;
> +       data-lanes = <0 1>;
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l1b_0p8>;
> +};
> +
> +&mdss_edp {
> +       status = "okay";
> +
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> +       /delete-property/ pinctrl-names;
> +       /delete-property/ pinctrl-0;
> +};
> +
> +&mdss_edp_out {
> +       remote-endpoint = <&edp_panel_in>;
> +};
> +
> +&mdss_edp_phy {
> +       status = "okay";
> +
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> +};
> +
> +&mdss_mdp {
> +       status = "okay";
> +};
> +
>  &nvme_3v3_regulator {
>         gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>  };
> @@ -84,7 +175,38 @@ ap_ts_pen_1v8: &i2c13 {
>         pins = "gpio51";
>  };
>
> +&pm8350c_gpios {
> +       edp_bl_power: edp-bl-power {
> +               pins = "gpio7";
> +               function = "normal";
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +               bias-disable;
> +               output-low;

Is the 'output-low' necessary?

> +       };
> +
> +       edp_bl_pwm: edp-bl-pwm {
> +               pins = "gpio8";
> +               function = "func1";
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +               bias-disable;
> +               output-low;

Same question.

> +       };
> +};
> +
> +&pm8350c_pwm {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&edp_bl_pwm>;
> +};
> +
>  &tlmm {
> +       edp_panel_power: edp-panel-power {
> +               pins = "gpio80";
> +               function = "gpio";
> +               bias-pull-down;
> +       };
> +
>         tp_int_odl: tp-int-odl {
>                 pins = "gpio7";
>                 function = "gpio";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3572399..eca403a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3066,7 +3066,7 @@
>
>                                         port@1 {
>                                                 reg = <1>;
> -                                               edp_out: endpoint { };
> +                                               mdss_edp_out: endpoint { };
>                                         };

It feels like this should be a different patch for this phandle rename.
