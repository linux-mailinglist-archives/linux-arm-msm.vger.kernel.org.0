Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 572A14AE4EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 23:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233085AbiBHWuL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 17:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243318AbiBHWs1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 17:48:27 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7358BC04A51C
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 14:36:17 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id a19so416941qvm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 14:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4N/VNg4Z4S2yqwqo7lo1EjNg6APRg3vzTZff0H8mfjg=;
        b=talymFDqCzEUp4aHHWidFmuLQAjI7ib4UgEt38u23rP/AK6rIrytCEjeQZQh3RU080
         LPJe8b6QR0MHHR+TGcPrW08xNorYwQdYxPrj5gIqRh/Fn+ts37j7rrgcDpyMSXHpVyIq
         UA3ZMQ+8R9NiO946F3uG01eWoF61WgKLRkQ9lMD4DkAsJ89tfB0gq7BrXjuLwA8VSoFg
         VIohx2OoJk7bOWu8UnVAcyGyzXeY96nI3KsFWqDL7cMtm80M9gfVx4IiYcAVy3aWv0Qf
         K4YOmtSq+AXmcw2M/DN1ye6a8nuh0FdRmgMZ2DqlIS5jJ9pem5fnbtyU0+CAyQjSxfWF
         lQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4N/VNg4Z4S2yqwqo7lo1EjNg6APRg3vzTZff0H8mfjg=;
        b=ZHPZt6ffE9jylDhcMhVz/XgVsZDL85HTfKc68nkdwZP7qFnNTqeVjuTxaWC3+OZBHl
         eqETZ5GQqkfQBQyK/pEZuSI+IyG2SShVPqsUmo59P5K+J9ABnXRlS7WK7xXGf63lRrvo
         4ri0t0GyNJrOdBvtc61vC5mpvoyntErxtIr1zOVeU17Sfuk6kcfepoBF315Ig3gEpW5N
         UczGoZ+oA0xVAQ63euXNBLpPqTnF1t8qMrCHpxRjOk5XsE8UP68ztismMlvWNTiG2Cq1
         24tWN9otmA++R66EuXoB4clmSfVdCpdpiarQXLOhOlbZ7jEpj3GktMe0kWrjQ8bPVjp1
         zAVQ==
X-Gm-Message-State: AOAM533s2Y+wj4xgp3fQx/0/nJOHhVMx4Q/aHw3HZA3MOwqG8THaLWX7
        l+kJcZrHci0z0J/oWApJ119KTAK+jND06kOCDOr53jqfyc0=
X-Google-Smtp-Source: ABdhPJyF46u8KAMmRWmD7rrzZKsobdyPRpM8YW1eiuvtHbLOEyo4TZh7sHhOrBLHCinn/AeeEBBrZcDWnwWA1wUxHI0=
X-Received: by 2002:a05:6214:2aa2:: with SMTP id js2mr4831360qvb.55.1644359775256;
 Tue, 08 Feb 2022 14:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20211228045934.1524865-1-bjorn.andersson@linaro.org>
 <176fb0bc-2f09-df3b-86be-ef69b8e6cea8@linaro.org> <YgLff2ZFjEN3I3M2@ripper>
In-Reply-To: <YgLff2ZFjEN3I3M2@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 9 Feb 2022 01:36:04 +0300
Message-ID: <CAA8EJpqtb90V6oN_d7_MYXvTNyt2NhLudJ-iJAbPb-ymX6JLQw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Add DisplayPort controller for SM8350
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 9 Feb 2022 at 00:21, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Wed 19 Jan 15:14 PST 2022, Dmitry Baryshkov wrote:
>
> > On 28/12/2021 07:59, Bjorn Andersson wrote:
> > > The Qualcomm SM8350 platform comes with a single DisplayPort controller,
> > > add support for this in the DisplayPort driver.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
>
> I don't see this in linux-next, would it be possible to pick it up now
> that we're past the merge window etc?

I'll work on my staging tree (and send it to Rob) before the EoW.

>
> Regards,
> Bjorn
>
> > > ---
> > >   .../devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
> > >   drivers/gpu/drm/msm/dp/dp_display.c                       | 8 ++++++++
> > >   2 files changed, 9 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > index 5457612ab136..cd05cfd76536 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > @@ -21,6 +21,7 @@ properties:
> > >         - qcom,sc7280-edp
> > >         - qcom,sc8180x-dp
> > >         - qcom,sc8180x-edp
> > > +      - qcom,sm8350-dp
> > >     reg:
> > >       items:
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 8d9c19dbf33e..fd0fd03f8fed 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -143,10 +143,18 @@ static const struct msm_dp_config sc7280_dp_cfg = {
> > >     .num_descs = 2,
> > >   };
> > > +static const struct msm_dp_config sm8350_dp_cfg = {
> > > +   .descs = (const struct msm_dp_desc[]) {
> > > +           [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > > +   },
> > > +   .num_descs = 1,
> > > +};
> > > +
> > >   static const struct of_device_id dp_dt_match[] = {
> > >     { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> > >     { .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
> > >     { .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
> > > +   { .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_cfg },
> > >     {}
> > >   };
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
