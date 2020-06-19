Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F1A1FFF93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 03:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730037AbgFSBMu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 21:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729997AbgFSBMu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 21:12:50 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E9E6C0613EE
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 18:12:50 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a127so3643307pfa.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 18:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=C2dez5Y5nxFP07QRNZ0OnRkJ8X7zqlBAGXKDCAlVfhY=;
        b=oLZbVHf8BIG6+THknBsryI8MvBmceKvdaIGFcE3E8GegV/CVRGi6iE+Kwgyq9mrL17
         XRSoTGChHFP9fypFoBBia72WZxyDSkB0DKPHBdJZDUNsFAhLAEFRLc/D+ClLJBVEUj5u
         8TfIW2yPdC0tRHqgM6ZlMpL1HE2kF0GK5OWBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=C2dez5Y5nxFP07QRNZ0OnRkJ8X7zqlBAGXKDCAlVfhY=;
        b=ppw6/Za2DjZv5URtVeh3FYGW4VtC82ZOmDNtyy7WNOd59kVM2js/Fv287UzIROvJEG
         cuxPYQGGjxBu83u73gKK/h6VUrFt3N403e4xqLu8YHgN/AN60eFywderAwrWLO+BDscW
         y1QRO6TwD4NM08fgEFHPSRyRAU/VzJ9lfhCjjNlWxNDJPPSktplrSKTgKOIqxymU45Me
         LKpUryPhADziQ/xfEs2dST8cnt2IDk66eRLbnOfRt0Kt0gArZTkRLIZtW8IJCPUK6ghS
         cXlUBANTTAPQod3URoh05wFmSgr/qNynkstuMDydpzrpiXnUWQnZ7YFxphH01v5ZLeLr
         tjkg==
X-Gm-Message-State: AOAM530rgW+WT5ewu2X+wiAilxH7Qb3V4tTo25vDuv+83PUb6yrXuiGB
        Izc29cK/hrYsAfI7Yyhv19EBvw==
X-Google-Smtp-Source: ABdhPJzpkIA9xRXSKhL1HR6SniZnYA3qMlfoJJoj709qP03uEsU3yPapKSC/mT40nipGsCn4VwPPgg==
X-Received: by 2002:a65:614b:: with SMTP id o11mr995414pgv.443.1592529169747;
        Thu, 18 Jun 2020 18:12:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id n1sm3622207pjn.24.2020.06.18.18.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 18:12:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200618232113.22687-1-tanmay@codeaurora.org>
References: <20200618232113.22687-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add Display Port dt node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, seanpaul@chromium.org,
        robdclark@gmail.com, dianders@chromium.org,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        bjorn.andersson@linaro.org, Tanmay Shah <tanmay@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>, agross@kernel.org
Date:   Thu, 18 Jun 2020 18:12:47 -0700
Message-ID: <159252916745.62212.16228625951632835694@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Tanmay Shah (2020-06-18 16:21:13)
> Enable DP driver for sc7180.

Add DP device node on sc7180? This isn't a driver.

>=20
> This change depends-on following series:
> https://patchwork.freedesktop.org/series/78583/
> and https://patchwork.freedesktop.org/patch/351990/
>=20
> Changes in v2:
>=20
> - Add assigned-clocks and assigned-clock-parents
> - Remove cell-index and pixel_rcg
> - Change compatible to qcom,sc7180-dp
>=20
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 57 ++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 916401f7e87c..26fe623e3b0f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2216,10 +2216,19 @@ ports {
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
> =20
> +                                       port@1 {
> +                                               reg =3D <1>;
> +                                               dpu_intf1_out: endpoint {
> +                                                       remote-endpoint =
=3D
> +                                                                <&dsi0_i=
n>;
> +                                               };
> +                                       };
> +
>                                         port@0 {
>                                                 reg =3D <0>;
> -                                               dpu_intf1_out: endpoint {
> -                                                       remote-endpoint =
=3D <&dsi0_in>;
> +                                               dpu_intf0_out: endpoint {
> +                                                       remote-endpoint =
=3D
> +                                                                <&dp_in>;
>                                                 };
>                                         };
>                                 };

I thought this wasn't supposed to change? At least according to the
binding it shouldn't be needed.

> @@ -2293,6 +2302,46 @@ dsi_phy: dsi-phy@ae94400 {
>                         };
>                 };
> =20
> +               msm_dp: displayport-controller@ae90000{
> +                       status =3D "ok";

Please use status =3D "disabled";

> +                       compatible =3D "qcom,sc7180-dp";
> +
> +                       reg =3D <0 0xae90000 0 0x1400>;
> +                       reg-names =3D "dp_controller";
> +
> +                       interrupt-parent =3D <&mdss>;

Any reason why this isn't under the mdss node like the other display
device nodes?

> +                       interrupts =3D <12 0>;
> +
> +                       clocks =3D <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                                <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                                <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                                <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +                       clock-names =3D "core_aux", "ctrl_link",
> +                                     "ctrl_link_iface", "stream_pixel";
> +                       #clock-cells =3D <1>;
> +                       assigned-clocks =3D <&dispcc DISP_CC_MDSS_DP_PIXE=
L_CLK_SRC>;
> +                       assigned-clock-parents =3D <&msm_dp 1>;
> +
> +                       data-lanes =3D <0 1>;

This can and should be left to the board files. At the SoC level my
understanding is that there are four lanes possible, so no need to
artificially limit it here.

> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       dp_in: endpoint {
> +                                               remote-endpoint =3D
> +                                                        <&dpu_intf0_out>;

I'd prefer these were on one line, regardless of the 80 character line
limit/suggestion.

> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       dp_out: endpoint { };
> +                               };
> +                       };
> +               };
> +
>                 dispcc: clock-controller@af00000 {
>                         compatible =3D "qcom,sc7180-dispcc";
>                         reg =3D <0 0x0af00000 0 0x200000>;
