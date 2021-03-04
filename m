Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB6B32C905
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 02:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238690AbhCDBBQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 20:01:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392370AbhCDAOe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 19:14:34 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C31C0613DC
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 16:12:15 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id l7so13299368pfd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 16:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=zrZaRySN+9uvnnWf26Ar1YrONmr8qtTnIcY5RCO/cMw=;
        b=AFbG0vNF10pAZ+e9ePDz/jZ+K2PhqZIKN0imVriWbB//y+kS5qAaLe5oNaVfbLvJOQ
         T3pzSHyGp3wWwnGKn211iWlN1nChhHj3tL59KvZ6s0RQAYDcqgJbqxsCTD4S23eMlXHf
         ItteAgk3+sC14VDZ0g9+Z81t451nCxJBZsA9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=zrZaRySN+9uvnnWf26Ar1YrONmr8qtTnIcY5RCO/cMw=;
        b=IRifhto6G72m0fYlE/IownbLuRREJ9XaE8MKPPVCwqq3tUN6eC9yq/gQt07sT5tdpF
         ajpBFNvlvEEWH5n/naWMgQ1tHDDEs/T2djrz3E7SqwLKiZRtrxUbCCYFAJRD1Cd1Ls6w
         AnAmZ2XPxkiq+8EiS4XCaXKuukryckOnbRJ97f+rPTDLqzVE0yvgGMx2AvSXynEaCHV3
         bz33bFki8s9ZeBcriv/e8hJJjsT7BccF5kYt8k7S2F0fkpPchKXsOO//N7rqj9XgG47b
         qeEaZpIXQ2Dp4m+HcK9vv1Zps3wkRiXCnH02Pt6Otmb1EyP8/QpD8XbXtwbD5N1eL8RR
         d+og==
X-Gm-Message-State: AOAM532lLrUBwkF3tddt+GgrT7bXLuSzBIFV0Fd9r9rk0vDb+bWZOSbF
        YJgUgEuQ/JjRsxiRAmCixofWjucn4oekWA==
X-Google-Smtp-Source: ABdhPJzPaqYplfJzoHe2p00Q429Svrwvd0rrUs/LcKn5Qok0Uf0FqCrAMwhWaI4VItI1BmUuFtyAKw==
X-Received: by 2002:a05:6a00:15cc:b029:1ba:5282:3ab8 with SMTP id o12-20020a056a0015ccb02901ba52823ab8mr1268929pfu.77.1614816734882;
        Wed, 03 Mar 2021 16:12:14 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id o4sm25339685pfg.107.2021.03.03.16.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 16:12:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1614773878-8058-13-git-send-email-rnayak@codeaurora.org>
References: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org> <1614773878-8058-13-git-send-email-rnayak@codeaurora.org>
Subject: Re: [PATCH v2 12/14] arm64: dts: qcom: sc7280: Add SPMI PMIC arbiter device for SC7280
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, satya priya <skakit@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Wed, 03 Mar 2021 16:12:12 -0800
Message-ID: <161481673286.1478170.13034581527644587648@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-03-03 04:17:56)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/q=
com/sc7280.dtsi
> index fe4fdb9..aa6f847 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -239,6 +239,25 @@
>                         interrupt-controller;
>                 };
> =20
> +               spmi_bus: spmi@c440000 {
> +                       compatible =3D "qcom,spmi-pmic-arb";
> +                       reg =3D <0 0x0c440000 0 0x1100>,
> +                             <0 0x0c600000 0 0x2000000>,
> +                             <0 0x0e600000 0 0x100000>,
> +                             <0 0x0e700000 0 0xa0000>,
> +                             <0 0x0c40a000 0 0x26000>;
> +                       reg-names =3D "core", "chnls", "obsrvr", "intr", =
"cnfg";
> +                       interrupt-names =3D "periph_irq";
> +                       interrupts-extended =3D <&pdc 1 IRQ_TYPE_LEVEL_HI=
GH>;
> +                       qcom,ee =3D <0>;
> +                       qcom,channel =3D <0>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;

I see the binding says these should be 2 instead of 1 but I suspect that
is incorrect.

> +                       interrupt-controller;
> +                       #interrupt-cells =3D <4>;
> +                       cell-index =3D <0>;

Is cell-index used? Please remove as I don't see it used anywhere and
not in the binding.

> +               };
> +
>                 tlmm: pinctrl@f100000 {
>                         compatible =3D "qcom,sc7280-pinctrl";
>                         reg =3D <0 0x0f100000 0 0x1000000>;
