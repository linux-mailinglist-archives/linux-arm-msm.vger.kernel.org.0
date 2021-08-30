Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4552A3FAF7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 03:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236135AbhH3BTo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 21:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235813AbhH3BTn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 21:19:43 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C7FC06175F
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 18:18:51 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id a10so13938008qka.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 18:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1hhV9nDZ+cplYuMpzE5vj+vUQnOUXDSLgbJtDYIw5iU=;
        b=l48UbSq5y96b7Dk1nHFjQBTnvGbk1gL0McaWJMIJWZqfj+kqRt+GQGwJJd5YNqTf+F
         icQUbgnMufMLqa/YYBuvxQ1JyTzyx3mAo+679rU4RFgiFJ4+mhaiEbBAJBuWw7IZ78lu
         8+aPx0JPVRVEJ5p/6qpHfjlSz7y0fWj//LkFtLptH+njEkcJodvFRNLEWNF5xcc6jaG8
         fHLWb9sF4yb98dATKbxQnOPhDziP9JstHOfN5Lk3mRvS5qxdNmhFwK9MywC3bFF6y1HW
         d2QY775IlmnUvQlOI1hlg/8/v3yEPNWURgW69mrpTZ6ej+ZyyNqR/QhbVUKkUe4Dqqz5
         VzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1hhV9nDZ+cplYuMpzE5vj+vUQnOUXDSLgbJtDYIw5iU=;
        b=fse3X3p2LMNiBkvF9BtXpj7qvmOi++UrjPu3N3tsw/D3LrYoloefQbC+ix1P4diKXS
         c3zfjwlvE0lMvy47KVAkhycJ6GFvWcproBdQyOitt4+n+Rau6zDkUpWTag5cr9YVBWfZ
         oR859nHmKIIjUCirHzVORuXlJarv6Z3SF/oflvEZ1iWOpQbmqdO9n4jasTovcD8SiQCU
         HmqrYKMc5Yr6To7V4E6bGpMamV+7b05gom8kNKqm3TvQGPbGxM2M7O4TsxJ1SxGRR3Dp
         rC4f77Zo24IHkY3QXhSF/ZWEeaGyPMqL2xRBaR5drojx52AZ+CvvQvedbpam6G/vfVmL
         ExJg==
X-Gm-Message-State: AOAM530FsAzwDtihusmn3GM2PeIf3B3fq3VZzAvgoQ4NeZ1GG+Ugd1so
        rqVZuKdHo/U1H3ANhID1tAYKvoDazMGeiNOeV6Nqbg==
X-Google-Smtp-Source: ABdhPJzjQAbOyw7RF7SMSFWbofpQGeDuRMHg8J+xdDznT8ceulgiTq42PR9MZKBMAweOZyfYw2CriKpOgNi3EXgRtdQ=
X-Received: by 2002:a05:620a:1082:: with SMTP id g2mr20776166qkk.138.1630286330330;
 Sun, 29 Aug 2021 18:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210829203027.276143-1-marijn.suijten@somainline.org> <20210829203027.276143-2-marijn.suijten@somainline.org>
In-Reply-To: <20210829203027.276143-2-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 30 Aug 2021 04:18:39 +0300
Message-ID: <CAA8EJprQ03ipZzO+1vgt9W7jFbLXgsYR0n-oJxVB-142x8dgRA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm: dts: qcom: apq8064: Use 27MHz PXO clock as DSI
 PLL reference
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 29 Aug 2021 at 23:30, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> The 28NM DSI PLL driver for msm8960 calculates with a 27MHz reference
> clock and should hence use PXO, not CXO which runs at 19.2MHz.
>
> Note that none of the DSI PHY/PLL drivers currently use this "ref"
> clock; they all rely on (sometimes inexistant) global clock names and
> usually function normally without a parent clock.  This discrepancy will
> be corrected in a future patch, for which this change needs to be in
> place first.
>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Checked the downstream driver, it always uses 27 MHz clock in calculations.

> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 2687c4e890ba..77659b783759 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -198,7 +198,7 @@ cxo_board: cxo_board {
>                         clock-frequency = <19200000>;
>                 };
>
> -               pxo_board {
> +               pxo_board: pxo_board {
>                         compatible = "fixed-clock";
>                         #clock-cells = <0>;
>                         clock-frequency = <27000000>;
> @@ -1306,7 +1306,7 @@ dsi0_phy: dsi-phy@4700200 {
>                         reg-names = "dsi_pll", "dsi_phy", "dsi_phy_regulator";
>                         clock-names = "iface_clk", "ref";
>                         clocks = <&mmcc DSI_M_AHB_CLK>,
> -                                <&cxo_board>;
> +                                <&pxo_board>;
>                 };
>
>
> --
> 2.33.0
>


-- 
With best wishes
Dmitry
