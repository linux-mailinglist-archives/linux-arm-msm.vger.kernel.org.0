Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAE034B8DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 19:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhC0SYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Mar 2021 14:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbhC0SYP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Mar 2021 14:24:15 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46640C0613B1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 11:24:15 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id t18so4087261pjs.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Mar 2021 11:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=+HkyJ4r/cUeRZEJEAyr+q64APIM8DDyM52+WtIHA4MI=;
        b=WbIwqBuYODjCUQgGQAO2Xh1gnLeRIQCrfeZKPcOO0wgFv3UV7eZsidDHy9ar5By5Ss
         y3dZ58si+/v7dsNKQ5ImkdLDWDympIV8h+vOI1SOs7ATEqiIUDyDArApg8aOywDcPTav
         Efx+HA117Ppy4J9Aoy4RBDzWHOA80OzTDHBrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=+HkyJ4r/cUeRZEJEAyr+q64APIM8DDyM52+WtIHA4MI=;
        b=uf18YijtrsQSD8aVGYpTNQegndVt7NcDwxM3bAF2JZ/6oRHoV0H4Cq25Dxpwdv33sb
         91ea3glDK1D/DLk+lneiSEedYxLer1pXma8eDFFItY5sLpXnQn+LSG5punWHhxKw7/qj
         NYFK9D/pYaryHpfbQCK/SEJ7NOpUg4pkQomSJhHsjehefX4VlqOcI83NojDSp9/To/rb
         Raf3VsnUCrZeYiFZ8+ZTriLoIqxpkVK08fxSJz259i5uO2Z3Je3bbqrKA6CAo+hfkEMC
         byBYtLezmb6o1hAF29GfxGTy35pzBE1hccMpHj1AhsQE0pxQEDbzf1aPsFz9PLcK3cFl
         xu3w==
X-Gm-Message-State: AOAM5332bbJhTGtpKgPgG71wclMslTOgvXf8t3OjatfAJEtmLAYk4Z6q
        7xJ+kTJ6a6h71bnIFLEQlGdpSQ==
X-Google-Smtp-Source: ABdhPJynjwgI5oUqqbImRqE58g/QNNY5vcK4P5zwSWlbMqaRky2qrTiDnElsesEFPy9IeeNOynIoBQ==
X-Received: by 2002:a17:902:9b8a:b029:e6:17bb:eff0 with SMTP id y10-20020a1709029b8ab02900e617bbeff0mr21494324plp.54.1616869454655;
        Sat, 27 Mar 2021 11:24:14 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4836:2ec9:9c88:3812])
        by smtp.gmail.com with ESMTPSA id cp22sm11382811pjb.15.2021.03.27.11.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 11:24:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210326175809.2923789-2-dmitry.baryshkov@linaro.org>
References: <20210326175809.2923789-1-dmitry.baryshkov@linaro.org> <20210326175809.2923789-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: phy: qcom,qmp-usb3-dp-phy: move usb3 compatibles back to qcom,qmp-phy.yaml
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Date:   Sat, 27 Mar 2021 11:24:12 -0700
Message-ID: <161686945245.3012082.10570047641858984855@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-03-26 10:58:03)
> The commit 724fabf5df13 ("dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy
> information") has support for DP part of USB3+DP combo PHYs. However
> this change is not backwards compatible, placing additional requirements
> onto qcom,sc7180-qmp-usb3-phy and qcom,sdm845-qmp-usb3-phy device nodes
> (to include separate DP part, etc). However the aforementioned nodes do
> not inclue DP part, they strictly follow the schema defined in the
> qcom,qmp-phy.yaml file. Move those compatibles, leaving
> qcom,qmp-usb3-dp-phy.yaml to describe only real "combo" USB3+DP device no=
des.
>=20
> Fixes: 724fabf5df13 ("dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy info=
rmation")
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml         | 2 ++
>  Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Do=
cumentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> index 626447fee092..0f42b36b0ac5 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -25,11 +25,13 @@ properties:
>        - qcom,msm8998-qmp-pcie-phy
>        - qcom,msm8998-qmp-ufs-phy
>        - qcom,msm8998-qmp-usb3-phy
> +      - qcom,sc7180x-qmp-usb3-phy

Drop the x on sc7180?

>        - qcom,sc8180x-qmp-ufs-phy
>        - qcom,sc8180x-qmp-usb3-phy
>        - qcom,sdm845-qhp-pcie-phy
>        - qcom,sdm845-qmp-pcie-phy
>        - qcom,sdm845-qmp-ufs-phy
> +      - qcom,sdm845-qmp-usb3-phy
>        - qcom,sdm845-qmp-usb3-uni-phy
>        - qcom,sm8150-qmp-ufs-phy
>        - qcom,sm8150-qmp-usb3-phy

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
