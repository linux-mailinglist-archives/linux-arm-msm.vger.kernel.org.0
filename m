Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D95623AA2F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Aug 2020 18:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbgHCQFk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 12:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgHCQFk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 12:05:40 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF65FC06174A;
        Mon,  3 Aug 2020 09:05:39 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id jp10so12634287ejb.0;
        Mon, 03 Aug 2020 09:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ah4YH4xbs7o/4fq+m4lwGvpsZR2W5DSohgKfYKy8nDY=;
        b=RRT3NoZzMjb6Id7P0RK+UDCMsf5oZdEydsvBjoMiJcskzKRpOUEsQzx6qIvuoQlmDT
         u8vRodRqxLsPWN5Dbj2lA2PviILlK5OwWWUFTbYWQTvS9W6fhhBrOsCEbN5MkJ3IG9HW
         eIgu3QAEawQBR3Cv2vkjl2bXrYrf8zIgZ3UWAZ6DMQY0sW+2ac/IuRcOKVyhVykmSWRX
         Y74nTh4lPAbGDNg+C2zB/FD976THLzC5hXy9pS2ljImHkaOpf7cXMGodgJMan0Toee4N
         qte5ce3imkSfVSwKVxqNEM4LVNSKw9WHeyqYDiqh+Vos87hWhPJkMXhyevGdBlz6A9UA
         aKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ah4YH4xbs7o/4fq+m4lwGvpsZR2W5DSohgKfYKy8nDY=;
        b=mk3vXgVfkDFtTCRmBPDNVNiLZfEGaUGJuykFO0dDOtb/wQnhes7pXTy4yllx9rb3mY
         ppfLwH+7Syc0vtF9buGZ1hQymlpI43vy1LYdKj9CHWx7gvXFs5my+l6xR8JDiqQVnOWW
         q/SC/3lWFZN1bSTtKDUiIvVu3mTVqR1fTMUvbDCLTt1VnHJ/WwPqUGw3IWuG+sDRp/0l
         fARV2OA2NDzmV1vMkTm9l5QIMVHLTurqZmEkUksS3onOygTiCNvPCEsnA8zhM1oZEi5T
         WeSwQAI35gAWIlI/IilSwY5uW3AEcagfIA4QNKoMHWqbRqySyGpUO9cKzHCMYvjLSb2q
         dS2Q==
X-Gm-Message-State: AOAM531Nr9VV/kBwvHcrO8A8cj428Z/NVqWPMaBLwTLs4saXg5GLUC9T
        OQpigdy3JAwB3xxD1Ox44U45rgrnr23CevrkygY=
X-Google-Smtp-Source: ABdhPJxIp3nRKzPD7aLMKkOD0USdNBngKLF1wq5jJex6eDWi4SWxesozUtiIOxBttUwOihyMdPPdYfhg8CuqAY8V+Gs=
X-Received: by 2002:a17:906:3449:: with SMTP id d9mr17737671ejb.460.1596470738295;
 Mon, 03 Aug 2020 09:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200726111215.22361-1-konradybcio@gmail.com> <20200726111215.22361-5-konradybcio@gmail.com>
 <20200803110016.GL12965@vkoul-mobl>
In-Reply-To: <20200803110016.GL12965@vkoul-mobl>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 3 Aug 2020 09:06:22 -0700
Message-ID: <CAF6AEGtW29BtJPq1xDEtvtkPHFVWEd_QJk5FpJEQPbmofnS64Q@mail.gmail.com>
Subject: Re: [PATCH 4/9] drm/msm/dsi: Add phy configuration for SDM630/636/660
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        martin.botka1@gmail.com, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 3, 2020 at 4:00 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 26-07-20, 13:12, Konrad Dybcio wrote:
> > These SoCs make use of the 14nm phy, but at different
> > addresses than other 14nm units.
> >
> > Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> > ---
> >  .../devicetree/bindings/display/msm/dsi.txt    |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c          |  2 ++
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c     | 18 ++++++++++++++++++
>
> Is there a reason why dsi phy needs to be here and not in phy subsystem
> drivers/phy/ ?

*maybe* it would be possible to split out all of the dsi (and hdmi)
phy to drivers/phy.  But splitting out just the new ones wouldn't be
practical (it would duplicate a lot of code, and make the rest of the
dsi code have to deal with both cases).  And unlike dp/usb-c I'm not
really sure I see an advantage to justify the churn.

BR,
-R

>
> >  4 files changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> > index af95586c898f..7884fd7a85c1 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> > @@ -87,6 +87,7 @@ Required properties:
> >    * "qcom,dsi-phy-20nm"
> >    * "qcom,dsi-phy-28nm-8960"
> >    * "qcom,dsi-phy-14nm"
> > +  * "qcom,dsi-phy-14nm-660"
> >    * "qcom,dsi-phy-10nm"
> >    * "qcom,dsi-phy-10nm-8998"
> >  - reg: Physical base address and length of the registers of PLL, PHY. Some
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > index f509ebd77500..009f5b843dd1 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -499,6 +499,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
> >  #ifdef CONFIG_DRM_MSM_DSI_14NM_PHY
> >       { .compatible = "qcom,dsi-phy-14nm",
> >         .data = &dsi_phy_14nm_cfgs },
> > +     { .compatible = "qcom,dsi-phy-14nm-660",
> > +       .data = &dsi_phy_14nm_660_cfgs },
> >  #endif
> >  #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
> >       { .compatible = "qcom,dsi-phy-10nm",
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > index 24b294ed3059..ef8672d7b123 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > @@ -45,6 +45,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
> > +extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > index 1594f1422372..519400501bcd 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > @@ -161,3 +161,21 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
> >       .io_start = { 0x994400, 0x996400 },
> >       .num_dsi_phy = 2,
> >  };
> > +
> > +const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
> > +     .type = MSM_DSI_PHY_14NM,
> > +     .src_pll_truthtable = { {false, false}, {true, false} },
> > +     .reg_cfg = {
> > +             .num = 1,
> > +             .regs = {
> > +                     {"vcca", 17000, 32},
> > +             },
> > +     },
> > +     .ops = {
> > +             .enable = dsi_14nm_phy_enable,
> > +             .disable = dsi_14nm_phy_disable,
> > +             .init = dsi_14nm_phy_init,
> > +     },
> > +     .io_start = { 0xc994400, 0xc996000 },
> > +     .num_dsi_phy = 2,
> > +};
> > --
> > 2.27.0
>
> --
> ~Vinod
