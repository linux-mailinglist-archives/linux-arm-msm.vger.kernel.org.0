Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A2E209813
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 03:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388862AbgFYBHV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 21:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388789AbgFYBHU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 21:07:20 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA45C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 18:07:20 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id b92so2246120pjc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 18:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=DQNqb/XiJnv5S5KAYc7VnMgjA/JQZWT3OBZtTbZloYs=;
        b=H0UbnxIw9yihnQXV7n5Vs/S+wHPE+4oI5wiVf1L0FkydepByp7tukHVSsmBjKzLtYX
         yAcpeRrcRzj/Azf+tWW5QrIcwBLUlca1JeCMlp5VQ7O8QXhFKfAz6YcmO5rVSxdRxFr1
         wb59f68RnJCNYPRZVH9RkF3A//MIGZ1RhhQZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=DQNqb/XiJnv5S5KAYc7VnMgjA/JQZWT3OBZtTbZloYs=;
        b=DF6kXq/h7fFr7iUqI/b0hpP9GC1DRNzf5y9kl1Ii2Us93FL0Kh1Zzf5LYrp6A/9um4
         FYT07EektZMQwul4yDFXxWl6jUhqdyOfuD/VxT2c3QCgbgPq81KdRacXbh5iED2P0eoe
         BDIrw0FaN0icFrdACoyprAkoObvU+lyHsb/y2G4hC3tqWPm/eXBW9YsXF4jVwNg7JpT7
         Mw0J0DhMJockbPXOgiWMwdlayoMFJHLGO5T+qPyEXEzOsHr7rTQeAyqPUMul2wv9Lgqf
         TTMhwN0FK4R/WZVpKCPlFgeiNtnJdcqvbqfynfEKCG5HBIJWqIRH2yoD8CP9greH69Eu
         Pucg==
X-Gm-Message-State: AOAM531+Gt36t7C/nYD4PPmRx2PAdgzoaXi6gkjljAL2s1yPuK7fcjnQ
        nMVkxLrWqM8YdjkSL+d+R9u+mVPgUzg=
X-Google-Smtp-Source: ABdhPJwwcQxMpk75imsoh0sM8lNh+D5onW70er8+RgLQLUV8Zlj+nifCh0lPXsEWgtHbcZypSU21dQ==
X-Received: by 2002:a17:90a:22ab:: with SMTP id s40mr501452pjc.27.1593047240035;
        Wed, 24 Jun 2020 18:07:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u8sm20760732pfh.215.2020.06.24.18.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 18:07:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200217085842.28333-1-harigovi@codeaurora.org>
References: <20200217085842.28333-1-harigovi@codeaurora.org>
Subject: Re: [v3] arm64: dts: sc7180: add nodes for idp display
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
To:     Harigovindan P <harigovi@codeaurora.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Date:   Wed, 24 Jun 2020 18:07:18 -0700
Message-ID: <159304723830.62212.5069780400830519255@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Harigovindan P (2020-02-17 00:58:42)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dt=
s/qcom/sc7180-idp.dts
> index 388f50ad4fde..349db8fe78a5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -232,6 +233,57 @@ vreg_bob: bob {
>         };
>  };
> =20
> +&dsi0 {
> +       status =3D "okay";
> +
> +       vdda-supply =3D <&vreg_l3c_1p2>;
> +
> +       panel@0 {
> +               compatible =3D "visionox,rm69299-1080p-display";
> +               reg =3D <0>;
> +
> +               vdda-supply =3D <&vreg_l8c_1p8>;
> +               vdd3p3-supply =3D <&vreg_l18a_2p8>;
> +
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&disp_pins>;
> +
> +               reset-gpios =3D <&pm6150l_gpio 3 GPIO_ACTIVE_HIGH>;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       port@0 {
> +                               reg =3D <0>;
> +                               panel0_in: endpoint {
> +                                       remote-endpoint =3D <&dsi0_out>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       ports {
> +               port@1 {
> +                       endpoint {
> +                               remote-endpoint =3D <&panel0_in>;
> +                               data-lanes =3D <0 1 2 3>;

Is this property needed? If it's the default assumption it would be nice
to omit it so that we don't have to think about it.

> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_phy {
> +       status =3D "okay";
> +};
> +
> +&mdp {
> +       status =3D "okay";
> +};
> +
> +&mdss {
> +       status =3D "okay";
> +};
> +
>  &qspi {
>         status =3D "okay";
>         pinctrl-names =3D "default";
> @@ -289,6 +341,17 @@ &usb_1_qmpphy {
> =20
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
> =20
> +&pm6150l_gpio {
> +       disp_pins: disp-pins {

Curious how this works. It looks like PMIC GPIOS are expecting the node
to look like:

	disp_pins: disp-pins {
		pinconf {
			pins =3D "gpio3";
			function =3D PMIC_GPIO_FUNC_FUNC1;
			qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_MED>;
			power-source =3D <PM6150_GPIO_VPH>;
			bias-disable;
			output-low;
		};

but this doesn't use the macros or the subnode for pinconf. Why? Also,
the PM6150_GPIO_VPH macro doesn't exist.

> +               pins =3D "gpio3";
> +               function =3D "func1";
> +               qcom,drive-strength =3D <2>;
> +               power-source =3D <0>;
> +               bias-disable;
> +               output-low;
> +       };
> +};
> +
