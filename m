Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4253A5F4577
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 16:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiJDO3s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 10:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiJDO3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 10:29:46 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42A26379
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Oct 2022 07:29:43 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id k3so15190493ybk.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Oct 2022 07:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ijglwwuz/cduqjD9lRpSbWUxZDMZnR6XyBHWqgTpWi0=;
        b=sgOv57fbnzKWTJ3Gj/s54GaCwDd1UqTCdivZvQD+c8GhR4b9Nab75SuhTmz6F87Ljr
         6CrbkuI6PBHC/i93xQbDbvJha0RrHnIfPykhn0SlbYTwTNiW3/bggwCbCroyCzciS36p
         XuSu17T4meV0BJ6hsTEmhP/KuHx7gEuqPIyAij9yiClvri8W/QJasZzZqeDM5WYq7e0Q
         p1AUVAwcuShxycjS2Qq/p6tQrwUUSGfSKQactRn7gCrUi+tcbzLeqF5QCFLG0/ZbbU/W
         pNBN3wWbF5Uqg+d+RA1KXglMunSla72isdHYcfS/Kn2kk8pvCZf+AQQRzUgAX4iidL5f
         S19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ijglwwuz/cduqjD9lRpSbWUxZDMZnR6XyBHWqgTpWi0=;
        b=K0svrV9++pMxP07D+E2hnU0pt/RjNvaqciJPyt9ULBOs/3CgtVAC/yGSk2q4PU7vsh
         PsgyqGGP7Vo21r2YJ1ZwgwL4BFF0ALNRFMbaHZdshA70pGpjAo7tWTEItqj1GNfTJe6M
         n0xLAylou5K5ZAbAR7wxbB7BWT9RQk+1LusYYyzryXuYQ0L8ZSkQChiqpCsTc7XFLOhe
         rEPz6Qjx+WHSTVlA8H+9HbxYfq28tYR1OVQDigP/XZAFudF14ivqDSlaaQ+gsxBzobWR
         KFSUVa/Ee5vXfIjPt8A2HyYL5leFd8uxN3FPyfl4iQ5bvxCp8qmV5SsqtIkEkv1xW9Qs
         uHIw==
X-Gm-Message-State: ACrzQf0QRe/6iBb+ZTQJnQ2NN88jEz4YEwIelXz2hTAk+VRftZjExRKx
        KiKzzRpN4rx447lblQYIECDB/n3WRjOb7Hk0LC0IeQ==
X-Google-Smtp-Source: AMsMyM4fqrZVe/Y7fdfMeViSnsoegXnhSVJy2m+9q19ABJo2r3IrBSo1oIn+G4VDuqMN22gPmfDNipyrLxMAqjI1EJI=
X-Received: by 2002:a25:a502:0:b0:6bc:2835:a88a with SMTP id
 h2-20020a25a502000000b006bc2835a88amr25146371ybi.15.1664893783081; Tue, 04
 Oct 2022 07:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
 <20220924121900.222711-3-dmitry.baryshkov@linaro.org> <20221001160054.gmrlnjvdwyn5ttzw@SoMainline.org>
In-Reply-To: <20221001160054.gmrlnjvdwyn5ttzw@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Oct 2022 17:29:32 +0300
Message-ID: <CAA8EJpqX0PVkx9TWYHAHT-Rvne_9nzVnV-xcsHWYB0VTs6oRbA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/msm/dsi: Add phy configuration for QCM2290
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Loic Poulain <loic.poulain@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 1 Oct 2022 at 19:00, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2022-09-24 15:19:00, Dmitry Baryshkov wrote:
> > From: Loic Poulain <loic.poulain@linaro.org>
> >
> > The QCM2290 SoC a the 14nm (V2.0) single DSI phy. The platform is not
> > fully compatible with the standard 14nm PHY, so it requires a separate
> > compatible and config entry.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > [DB: rebased and updated commit msg]
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 17 +++++++++++++++++
> >  3 files changed, 20 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > index 7fc0975cb869..ee6051367679 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -549,6 +549,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
> >  #ifdef CONFIG_DRM_MSM_DSI_14NM_PHY
> >       { .compatible = "qcom,dsi-phy-14nm",
> >         .data = &dsi_phy_14nm_cfgs },
> > +     { .compatible = "qcom,dsi-phy-14nm-2290",
> > +       .data = &dsi_phy_14nm_2290_cfgs },
> >       { .compatible = "qcom,dsi-phy-14nm-660",
> >         .data = &dsi_phy_14nm_660_cfgs },
> >       { .compatible = "qcom,dsi-phy-14nm-8953",
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > index 60a99c6525b2..1096afedd616 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > @@ -50,6 +50,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
> > +extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
>
> following alphabetical sorting (same as the other locations in this
> series), this should be above 660?

Ack

>
> >  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > index 0f8f4ca46429..9f488adea7f5 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > @@ -1081,3 +1081,20 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
> >       .io_start = { 0x1a94400, 0x1a96400 },
> >       .num_dsi_phy = 2,
> >  };
> > +
> > +const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs = {
> > +     .has_phy_lane = true,
> > +     .regulator_data = dsi_phy_14nm_17mA_regulators,
> > +     .num_regulators = ARRAY_SIZE(dsi_phy_14nm_17mA_regulators),
> > +     .ops = {
> > +             .enable = dsi_14nm_phy_enable,
> > +             .disable = dsi_14nm_phy_disable,
> > +             .pll_init = dsi_pll_14nm_init,
> > +             .save_pll_state = dsi_14nm_pll_save_state,
> > +             .restore_pll_state = dsi_14nm_pll_restore_state,
> > +     },
> > +     .min_pll_rate = VCO_MIN_RATE,
> > +     .max_pll_rate = VCO_MAX_RATE,
> > +     .io_start = { 0x5e94400 },
>
> For sm6125 we also need this exact io_start (and a single PHY), do you
> think it makes sense to add a compatible that reuses the same struct (I
> can do that in a folloup patch) and/or generalize this struct (name)?
>
> However, our regulator setup appears to be different.  I recall not
> finding any `vcca` supply in my downstream sources, and had this in my
> notes for a similar dsi_phy_14nm.c patch:
>
>     sm6125 uses an RPM regulator
>
> https://github.com/sonyxperiadev/kernel/blob/f956fbd9a234033bd18234d456a2c32c126b38f3/arch/arm64/boot/dts/qcom/trinket-sde.dtsi#L388

I'd prefer a separate config for sm6125. This way you would be able to
add voting on the MX domain if required.


-- 
With best wishes
Dmitry
