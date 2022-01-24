Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBA3498BB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jan 2022 20:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343851AbiAXTPr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 14:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345126AbiAXTNI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 14:13:08 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B6DC0604E6
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 11:04:17 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id a12so20772664iod.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 11:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RTiZ8sEgSQ0Acx4U7fIroiVQ52FJWGRyWnzr9lBr6vQ=;
        b=CvVf5UuSzlaRr1Tb9GU6821HGAi6l+KgJh8pOw5NzySgkQvHkKUof1RPVkUPF4Ku6e
         h4zo/zJbL/yHrCIdvs4HylasfPtsJKAo4HNZUI4zJsZpVBZ1Uw/B6A7JJNTgvtv4/jIz
         XBMk3jk6NfkDYa0C38hFQ8obLn58ciZ6gJkZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RTiZ8sEgSQ0Acx4U7fIroiVQ52FJWGRyWnzr9lBr6vQ=;
        b=P/xzp2qFm6/W6odRIxEuqaREpNcOZoIoLUHQC8bVX79C5jOiVzadv0T/vknnIQY8Nr
         05fRRo3MJsTFChfWrXjJaSuX2O/BJJ5Qlqza+HBrl52vVTg5RwXJUkGUVaEvMV/0Ds3L
         SqfdLfNoje33T1//mo6vBApZSsuegteHsWFwIiLJAtyLx7amjhR8i5mIM24UxzMxRnKL
         ECwN0CXM5Wsr4bV7SP0BblVHcZoMF/9HSuKtBVGkTWiRVy0D1S5Q0F+DdaHmXyxC5Ufg
         /4bD/5AsGIT74ULGmrqu25ECQrWduSOPKTutdK9sx3fKi/Xu/bZyOFfz5mw0RA0XbCmO
         o5Ww==
X-Gm-Message-State: AOAM533GnrngbsJh9bPOpZqKRhEEQ1A6G0/QWurKEmdq4CkKJXbHU6/W
        f6QtaM4+r3Oj+tnQh/Cwa3k0uIdjd7UvSg==
X-Google-Smtp-Source: ABdhPJyEtaUgbhfnegQHGQJ5/BblBk/T0imNg5tymIlbLlR5xyDRJMWq4yQV93swIxMO9dis1uR4FQ==
X-Received: by 2002:a05:6602:15c6:: with SMTP id f6mr8984833iow.170.1643051056903;
        Mon, 24 Jan 2022 11:04:16 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id k1sm6548909iov.6.2022.01.24.11.04.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 11:04:15 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id h7so2829835iof.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 11:04:15 -0800 (PST)
X-Received: by 2002:a5e:9b07:: with SMTP id j7mr8634583iok.136.1643051055347;
 Mon, 24 Jan 2022 11:04:15 -0800 (PST)
MIME-Version: 1.0
References: <1643048114-2996-1-git-send-email-quic_sbillaka@quicinc.com> <1643048114-2996-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1643048114-2996-2-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 24 Jan 2022 11:04:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WjnDCh6dLV8pxgYepMDtf5oMSTb9v+Z8dwyMARL7TYaQ@mail.gmail.com>
Message-ID: <CAD=FV=WjnDCh6dLV8pxgYepMDtf5oMSTb9v+Z8dwyMARL7TYaQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ARM64: dts: qcom: enable eDP panel support for sc7280
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, quic_kalyant@quicinc.com,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        quic_mkrishn@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jan 24, 2022 at 10:15 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Enable the eDP display panel support with backlight on sc7280 platform.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-crd.dts | 127 ++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> index cd2755c..fde6f75 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> @@ -64,6 +64,47 @@ ap_ts_pen_1v8: &i2c13 {
>         };
>  };
>
> +&mdss {
> +       status = "okay";
> +};
> +
> +&mdss_mdp {
> +       status = "okay";
> +};

"mdss_mdp" sorts after "mdss_edp",


> +&mdss_edp {
> +       status = "okay";
> +
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> +
> +       ports {
> +               port@1 {
> +                       reg = <1>;
> +                       edp_out: endpoint {
> +                               remote-endpoint = <&edp_panel_in>;
> +                       };
> +               };
> +       };

I think part of the above should be in sc7280.dtsi. Basically in
sc7820.dtsi I think you should have:

ports {
  #address-cells = <1>;
  #size-cells = <0>;
  port@0 {
    reg = <0>;
    edp_in: endpoint {
      remote-endpoint = <&dpu_intf5_out>;
    };
  };
  port@1 {
    reg = <1>;
    edp_out: endpoint {
    };
  };
};

...and then the crd dts file just needs:

&edp_out {
  remote-endpoint = <&edp_panel_in>;
};

Right?


> +};
> +
> +&mdss_edp_phy {
> +       status = "okay";
> +
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l10c_0p8>;
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
>  &nvme_3v3_regulator {
>         gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>  };
> @@ -72,7 +113,93 @@ ap_ts_pen_1v8: &i2c13 {
>         pins = "gpio51";
>  };
>
> +&pm8350c_pwm{

nit: space after "pwm" and before "{"


> +       status = "okay";

Don't you need:

pinctrl-names = "default";
pinctrl-0 = <&backlight_pwm_default>;


> +};
> +
> +&pm8350c_gpios {
> +       backlight_pwm_default: backlight_pwm_default {

nit: node name should have dashes, not underscores. Also, don't
include the word "default".


> +               pinconf {
> +                       pins = "gpio8";
> +                       function = "func1";
> +                       output-low;
> +                       bias-disable;
> +                       power-source = <0>;
> +                       qcom,drive-strength = <3>;


Instead of 3, should be PMIC_GPIO_STRENGTH_LOW

> +               };

Don't need the "pinconf" subnode.


> +       };
> +};
> +
> +&soc {

Don't need to put the regulators under &soc. They can be top level, right?


> +       backlight_power: backlight_power {

nit: node names should have "-", not "_"


> +               compatible = "regulator-fixed";
> +               regulator-name = "backlight_power";
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
> +
> +       edp_power: edp_power {

nit: node names should have "-", not "_"


> +               compatible = "regulator-fixed";
> +               regulator-name = "edp_power";
> +
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&edp_panel_power_default>;
> +       };
> +
> +       edp_backlight: edp_backlight {

nit: node names should have a "-", not an "_".


> +               compatible = "pwm-backlight";
> +
> +               pwms = <&pm8350c_pwm 3 65535>;
> +               power-supply = <&backlight_power>;
> +               enable-gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;

So wait. Why do you have a "bogus" backlight_power regulator and then
a separate enable-gpio? Why

> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&backlight_pwm_default>;

This pinctrl belongs as part of the PWM, not as part of the backlight.

...but where's the pinctrl for pm8350c_gpios #7? That _should_ be here
since that's the backlight enable.


> +       };
> +
> +       edp_panel: edp_panel {
> +               compatible = "sharp_lq140m1jw46";

Device tree compatible strings separate the manufacturer from the
model with ",", not "_".


> +               pinctrl-names = "default";
> +               pinctrl-0 = <&edp_hot_plug_det>;

I think for eDP we probably want the pinctrl to be in the sc7280.dtsi
file. It seems highly likely that people will hook up the eDP HPD pin
to the standard place. If they don't then boards can override it.


> +               power-supply = <&edp_power>;
> +               backlight = <&edp_backlight>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       port@0 {
> +                               reg = <0>;
> +                               edp_panel_in: endpoint {
> +                                       remote-endpoint = <&edp_out>;
> +                               };
> +                       };

Like for DP, much of this "ports" stuff should be in sc7280.dtsi.


> +               };
> +       };
> +};
> +
>  &tlmm {
> +       edp_hot_plug_det: edp-hot-plug-det {
> +               pins = "gpio60";
> +               function = "edp_hot";

The "pins" and "function" belong in sc7280.dtsi.


> +               bias-pull-down;

This part belongs in the CRD file.


> +               input-enable;

You don't need "input-enable".


> +       };


> +       edp_panel_power_default: edp_panel_power_default {

Nit: node name shouldn't have underscores.
...and remove the word "default".
