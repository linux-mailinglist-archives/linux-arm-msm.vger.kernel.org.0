Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238C941D215
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 06:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347691AbhI3EDq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 00:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235452AbhI3EDq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 00:03:46 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB0FC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 21:02:04 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so5650902ota.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 21:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=R9mpe6GAMYXYmN7BguKYQDj8CISG/3Bymg9UCpNDaUA=;
        b=J1qc7TcOvA4WBtz50QMiHU+6+Y6nKOwAj1EeOPUDYv1YfmcQDMwNqd5LBX0wXJGeJW
         xHsaIfix1bx/ylxq2pHjsLdsSJqDmCyWPuMuglPj71U0lIH6NUJLEyNzGnxZrid/Jox0
         XPDRS4LTLj6ngvyAncNHXNb6J/kSFpgihTZFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=R9mpe6GAMYXYmN7BguKYQDj8CISG/3Bymg9UCpNDaUA=;
        b=VRytmR7U/xmW6TgasIZS1wojrQcc4JocHP2SpVu6RnUtImUfyZIAtSHwUDf7Dtho2q
         GCV53cT5BuEPYV6bD8aA2T02SAkokiyvxjv+V/R4Os0xFHOJE5PjyKy3MsiQbYo0XIY1
         wr6sM6enTUhtcybAhY6IfZoi3qDWrD9bY3g1S0e0BKwo0RVpI5FOr+t7QL5EMp9TnCR/
         vYSeb7QQVhtZJcDlC5aU/VVcde7jTrHJt/qMtoT5pitLNE4zAAigbt2rwZyzgkz4Bc4E
         iRUyb9U40jzSJF3PV+CmOjr9lVr+URT6pBFn80rrj0Suy/yXofQ+nvlMuoby035GAX6z
         drNQ==
X-Gm-Message-State: AOAM5327/m+GvEF2dzhwWfuRSXrAyYwa0ejEd3pHrQtNFIlXquVrsVh8
        M+tPf19rPAwq0B+QGOnC3Z/aH7Dfl/FIJHFnNiUI+A==
X-Google-Smtp-Source: ABdhPJwUQZCYg9IJwPdZYKtFyaHgpiUNp09whvzhPcppd0uJKfX6l+9+wj2paO+gdV0uO/hrjjLXT0RolLDi5J2H+kE=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr3329286otn.126.1632974523505;
 Wed, 29 Sep 2021 21:02:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Sep 2021 21:02:03 -0700
MIME-Version: 1.0
In-Reply-To: <20210929173343.v2.3.I630340a51130f4582dbe14e42f673b74e0531a2b@changeid>
References: <20210929173343.v2.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
 <20210929173343.v2.3.I630340a51130f4582dbe14e42f673b74e0531a2b@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 29 Sep 2021 21:02:03 -0700
Message-ID: <CAE-0n53EBvKv-RdMwiiOsUkb+LOKAKwrpP7cDavx4meA2vbvcA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: sc7180: Support Parade ps8640 edp bridge
To:     LKML <linux-kernel@vger.kernel.org>,
        Philip Chen <philipchen@chromium.org>
Cc:     dianders@chromium.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Philip Chen (2021-09-29 17:34:58)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
> new file mode 100644
> index 000000000000..c274ab41bd67
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Trogdor dts fragment for the boards with Parade ps8640 edp bridge
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +/ {
> +       pp3300_brij_ps8640: pp3300-brij-ps8640 {
> +               compatible = "regulator-fixed";
> +               status = "okay";
> +               regulator-name = "pp3300_brij_ps8640";
> +
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&tlmm 32 GPIO_ACTIVE_HIGH>;

Doesn't this need

		enable-active-high;

?

> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&en_pp3300_edp_brij_ps8640>;
> +
> +               vin-supply = <&pp3300_a>;
> +       };
> +};
> +
> +&dsi0_out {
> +       remote-endpoint = <&ps8640_in>;

Should this also have data-lanes to be "complete"?

> +};
> +
> +edp_brij_i2c: &i2c2 {
> +       status = "okay";
> +       clock-frequency = <400000>;
> +
> +       ps8640_bridge: edp-bridge@8 {

Just bridge@8 to match ti bridge? Also, is the label used? If not
please drop it.

> +               compatible = "parade,ps8640";
> +               reg = <0x8>;
> +
> +               powerdown-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
> +               reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&edp_brij_en>, <&edp_brij_ps8640_rst>;
> +
> +               vdd12-supply = <&pp1200_brij>;
> +               vdd33-supply = <&pp3300_brij_ps8640>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               ps8640_in: endpoint {
> +                                       remote-endpoint = <&dsi0_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               ps8640_out: endpoint {
> +                                       remote-endpoint = <&panel_in_edp>;
> +                               };
> +                       };
> +               };
> +
> +               aux_bus: aux-bus {

Is this label used either?

> +                       panel: panel {
> +                               /* Compatible will be filled in per-board */
> +                               power-supply = <&pp3300_dx_edp>;
> +                               backlight = <&backlight>;
> +
> +                               port {
> +                                       panel_in_edp: endpoint {
> +                                               remote-endpoint = <&ps8640_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
