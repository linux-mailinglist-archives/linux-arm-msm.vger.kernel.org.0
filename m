Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C2C41DED9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 18:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350209AbhI3QYH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 12:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350157AbhI3QYG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 12:24:06 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C093C06176C
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 09:22:24 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id q6so7522819ilm.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 09:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mkiQmIwLuFMRcDD9Yeq1X9DcESJBsP3wYBYEi8uC+4k=;
        b=Ca6rOa24h1INBKG+hc0h+ZaX4+6n7C/dHIFg3nINR2DPSIJyTbY58t5FBd0hgg38S8
         i2uLx6NUeVvyf2txdx92dJ3p4CLxfLMD051AhXEoQnx+fbW+mTMSK+Hdy6Pb9CRdmO6c
         70IUn49vHNygI3jyehX64U/Je/IqwZ5q1CB0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mkiQmIwLuFMRcDD9Yeq1X9DcESJBsP3wYBYEi8uC+4k=;
        b=T7E1tmd0YqzOri+lby58J5c4MHmkv0S+vpELxqnCvlsykgm07h4lOTc1dshEThLD6a
         xN90XKEGnSY6uwkSRtjG07P2Rzxz0wrBIvWbYDEBFGzBT3Hdu+uy0MooTuk27EfIAqTY
         w4g4AOINfVL42VxIkNUjP6+97m2icpbsNZ4VamBKtcWO5WDZuqYNXtn4/pykrN+AcPIq
         n7+PZQBfLhD3/y+7JelI8e+GfdhhMkrR31adWsj85sujvYEGrsDnFGkBTHR/Wv/wchuP
         HF9rW7Isc0CYBJMl9+PHTxiln1uWdtrrsck5s0rSt6ONe0KZ03ap/MTcWO9vauKQo8+h
         0rYw==
X-Gm-Message-State: AOAM5328+fdbsV9Tcl23dxdr3PAZmcExNM00d1YtN2INppCrBMP0a7XP
        OqWKt2gb6QWR+Uo4Wcs2P6a/YnyYLNRf1g==
X-Google-Smtp-Source: ABdhPJw/LDcTqdi6WlpN1qUc4ishjS67XN5sTkyRTYy8QJumG0/44vTnY00M+4DEw60pyLKc/4vT4A==
X-Received: by 2002:a05:6e02:c11:: with SMTP id d17mr5081849ile.25.1633018943345;
        Thu, 30 Sep 2021 09:22:23 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id t16sm1959317ilm.68.2021.09.30.09.22.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 09:22:21 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id h129so8362354iof.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 09:22:21 -0700 (PDT)
X-Received: by 2002:a6b:f915:: with SMTP id j21mr4613178iog.98.1633018940941;
 Thu, 30 Sep 2021 09:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210929173343.v2.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
In-Reply-To: <20210929173343.v2.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 30 Sep 2021 09:22:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XP+mJCEG+=meCXDb06bmfPwze2SP9FaMuKZkSh25JCSg@mail.gmail.com>
Message-ID: <CAD=FV=XP+mJCEG+=meCXDb06bmfPwze2SP9FaMuKZkSh25JCSg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: sc7180: Factor out ti-sn65dsi86 support
To:     Philip Chen <philipchen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Sep 29, 2021 at 5:35 PM Philip Chen <philipchen@chromium.org> wrote:
>
> Factor out ti-sn65dsi86 edp bridge as a separate dts fragment.
> This helps us introduce the second source edp bridge later.
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
>
> Changes in v2:
> - Move edp_brij_i2c completely out of sc7180-trogdor.dtsi to the
>   bridge dts fragment, so that we can cleanly assign different
>   edp bridge in every board rev.
>
>  .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  1 +
>  .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  1 +
>  .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  1 +
>  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  1 +
>  .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi | 90 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 86 ------------------
>  6 files changed, 94 insertions(+), 86 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> index a758e4d22612..1d13fba3bd2f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> @@ -11,6 +11,7 @@
>  ap_h1_spi: &spi0 {};
>
>  #include "sc7180-trogdor.dtsi"
> +#include "sc7180-trogdor-ti-sn65dsi86.dtsi"

It looks like you're missing homestar, aren't you? I'd expect that
after applying your change that:

git grep -A1 include.*sc7180-trogdor.dtsi

...should show your new include right after all includes of
sc7180-trogdor.dtsi, but I don't see it for homestar.

Other than that this looks good to me. Feel free to add my Reviewed-by.
