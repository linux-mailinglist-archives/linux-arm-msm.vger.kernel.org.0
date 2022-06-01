Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40FAA53AE05
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jun 2022 22:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbiFAUq6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 16:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbiFAUp5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 16:45:57 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A707C1EE6ED
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 13:36:38 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id x7so2071225qta.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jun 2022 13:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wYNuNXNSLm4a9YDMTwQ6NWLpMiqlsZjvS3Cd6WOktXY=;
        b=mtcA3/0EQbykbUI+YRUuulVYVoSWIysxzKASBul1+Et0Qy6DxVRsVU98YEIbna/Hox
         AAEj9In3Gswn7r7reNthepdjYhn5nybjuzKooCuNZhckSL5H4JS6/l2f2kiZF9phZ39Z
         biASHY1FcFlEm6IIAblAC7ljvDSfM4e68GAqxmAb5G9jdK44GAgQsxuvWlALj9aAbd83
         qL8SNvwF1SOda3/QrksFJMApaE1U5iSG2FqPLYV2ZRTqO7RAKpiUMD+eLIlzalLZCPbx
         uSgpSP7PyiyfJzC7OJjyP3HsqrFxPYLsMv6irhlTbMJDcIYCNEacttmLwd66SkJ5/CDF
         Svwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wYNuNXNSLm4a9YDMTwQ6NWLpMiqlsZjvS3Cd6WOktXY=;
        b=NyUfT+r8rHMPW11edBqUZF4dDheowBDlZt4hFtwvIjnNVoRYfO8bKc8EyMqdK4PPQB
         TAhE6sG8Hk5WKwo/AJYyNeXrrDAq+V6RvsJtbuqK7N09od5Lc2O4O8lpYXGFu+0ymqnR
         mqC9aWXKeJAudJALyrRm4pQCa57qCAFe2xgomeRmDlMryrx53DA5ZI3iMjHf/c+7he/G
         TmzmhLiFHSa5uJqWjuD8vq+ank0OJAx+ggqt01wX1AnbxkWqGgmhXepRCYFzJCBq5B8I
         iK8mbMzrDvgwgRWM70wmrCXAhYFh/ggGIBx1bNhIzj0DCt2c+mEY19VEMYHSfjA+2tTZ
         Ffdw==
X-Gm-Message-State: AOAM530P7/dOgjyNsMycAZbW4JyUk2yOlCMzb8z2/KwwiLgPct2C/gKM
        W75GTVDTuBKESLZxLgH6js/K9JHBGJhtpmDyaeldvhgq5m4=
X-Google-Smtp-Source: ABdhPJwXrDV7EE2w8rCYSP/IuwLbchfMJP881o5RFwBO7GJw15zyzsvrLxiMcU6oacEs2fUpE+EikPKRth5gVR8eSIM=
X-Received: by 2002:a05:620a:2a06:b0:6a5:b090:65c0 with SMTP id
 o6-20020a05620a2a0600b006a5b09065c0mr908330qkp.593.1654113870552; Wed, 01 Jun
 2022 13:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220531121825.1126204-1-dmitry.baryshkov@linaro.org>
 <d7084452-ea90-3a8b-d39a-b09d9f45f839@quicinc.com> <CAA8EJprW7xnYJaeqh4vozSTx04DcQ20MMRrzLaEJPJTC3dV30w@mail.gmail.com>
 <80c1da0f-0006-6602-ec86-ebdf71c3037a@quicinc.com>
In-Reply-To: <80c1da0f-0006-6602-ec86-ebdf71c3037a@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 1 Jun 2022 23:04:19 +0300
Message-ID: <CAA8EJppfWfP-bZLOYF8QBe6kW6gBBw5eXpzzDA6GFo8U7g=jRQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: less magic numbers in msm_mdss_enable
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 1 Jun 2022 at 20:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/1/2022 2:46 AM, Dmitry Baryshkov wrote:
> > On Wed, 1 Jun 2022 at 01:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >> On 5/31/2022 5:18 AM, Dmitry Baryshkov wrote:
> >>> Replace magic register writes in msm_mdss_enable() with version that
> >>> contains less magic and more variable names that can be traced back to
> >>> the dpu_hw_catalog or the downstream dtsi files.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/msm_mdss.c | 79 ++++++++++++++++++++++++++++++----
> >>>    1 file changed, 71 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> >>> index 0454a571adf7..2a48263cd1b5 100644
> >>> --- a/drivers/gpu/drm/msm/msm_mdss.c
> >>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> >>> @@ -21,6 +21,7 @@
> >>>    #define HW_REV                              0x0
> >>>    #define HW_INTR_STATUS                      0x0010
> >>>
> >>> +#define UBWC_DEC_HW_VERSION          0x58
> >>>    #define UBWC_STATIC                 0x144
> >>>    #define UBWC_CTRL_2                 0x150
> >>>    #define UBWC_PREDICTION_MODE                0x154
> >>> @@ -132,9 +133,63 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
> >>>        return 0;
> >>>    }
> >>>
> >>> +#define UBWC_1_0 0x10000000
> >>> +#define UBWC_2_0 0x20000000
> >>> +#define UBWC_3_0 0x30000000
> >>> +#define UBWC_4_0 0x40000000
> >>> +
> >>> +static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
> >>> +                                    u32 ubwc_static)
> >>> +{
> >>> +     writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
> >>> +}
> >>> +
> >>> +static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
> >>> +                                    unsigned int ubwc_version,
> >>> +                                    u32 ubwc_swizzle,
> >>> +                                    u32 highest_bank_bit,
> >>> +                                    u32 macrotile_mode)
> >>> +{
> >>> +     u32 value = (ubwc_swizzle & 0x1) |
> >>> +                 (highest_bank_bit & 0x3) << 4 |
> >>> +                 (macrotile_mode & 0x1) << 12;
> >>> +
> >>> +     if (ubwc_version == UBWC_3_0)
> >>> +             value |= BIT(10);
> >>> +
> >>> +     if (ubwc_version == UBWC_1_0)
> >>> +             value |= BIT(8);
> >>> +
> >>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
> >>> +}
> >>> +
> >>> +static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
> >>> +                                    unsigned int ubwc_version,
> >>> +                                    u32 ubwc_swizzle,
> >>> +                                    u32 ubwc_static,
> >>> +                                    u32 highest_bank_bit,
> >>> +                                    u32 macrotile_mode)
> >>> +{
> >>> +     u32 value = (ubwc_swizzle & 0x7) |
> >>> +                 (ubwc_static & 0x1) << 3 |
> >>> +                 (highest_bank_bit & 0x7) << 4 |
> >>> +                 (macrotile_mode & 0x1) << 12;
> >>> +
> >>> +     writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
> >>> +
> >>> +     if (ubwc_version == UBWC_3_0) {
> >>> +             writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
> >>> +             writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
> >>> +     } else {
> >>> +             writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
> >>> +             writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
> >>> +     }
> >>> +}
> >>> +
> >>
> >> Is it possible to unify the above functions by having the internal
> >> ubwc_version checks?
> >
> > Note, it's not the ubwc_version, it is the ubwc_dec_hw_version. And
> > also different functions take different sets of arguments.
> >
> >> It seems like msm_mdss_setup_ubwc_dec_xxx can keep growing.
> >>
> >> I have not looked into each bit programming but from the top level so
> >> feel free to correct if wrong but it seems both do write UBWC_STATIC
> >> (different values based on different UBWC versions) and write some extra
> >> registers based on version
> >
> > This is what both the current code and the downstream do. See
> > https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/zeus-s-oss/techpack/display-drivers/msm/sde/sde_hw_top.c#L312
> >
>
> Thanks for pointing to the downstream method for this,
>
> This is exactly what i was also suggesting to do when I mentioned
> unifying the above functions.
>
> So instead of having a separate function for each version why not handle
> all the versions in the same function like what the link you have shown
> does.

I wouldn't like that. The downstream uses hw_catalog to pass all
possible parameters. We do not, so we'd have a whole set of artificial
values.

>
> >>
> >>>    static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >>>    {
> >>>        int ret;
> >>> +     u32 hw_rev;
> >>>
> >>>        ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
> >>>        if (ret) {
> >>> @@ -149,26 +204,34 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >>>        if (msm_mdss->is_mdp5)
> >>>                return 0;
> >>>
> >>> +     hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
> >>> +     dev_info(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
> >>> +     dev_info(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
> >>> +             readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
> >>
> >> we are already printing the HW version here
> >>
> >> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c#L1096
> >>
> >> Do you want to remove that print then? May be. Let me take a look.
> >
> > [skipped]
> >



-- 
With best wishes
Dmitry
