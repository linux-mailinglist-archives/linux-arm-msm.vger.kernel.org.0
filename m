Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF73B4C370D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 21:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbiBXUtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 15:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiBXUtz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 15:49:55 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5B81C8855
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:49:24 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id n11so642928qtk.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VyQBdQeq30UmUiqwlI0GZfDYUe6OZQF6NDdZxu0b9es=;
        b=DlQD2EHGRUBoc/E0dh0hZrxOrEYga+JU0zzMecSmJFvU0l7vdl8Dyb4jMjY6eFRNMl
         jpPefec6vhJo9beapyUy3Aq7D7X87670T0fKNglEM6m+c5LvcI5uNDAUg5VwaWz1sGHA
         Sqc666ajb+V85fYRTiKz3z9vlHx2JXXdw3SHoOaqtNWr/I8spOb4wDL+lP/G+IuqaVU8
         YQuEJJry+vthMfycKkveSyxrc2PZw0HvB8wgNQbQ4eKw8XHyww6T4x3//csh9pHGQPbt
         WkfOqSsIKgiUAkku0lMm8DgVePmfkU/dDwNCEWbVsNSDtQKSl0M8j1Y2qWeQYPfkROoW
         YocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VyQBdQeq30UmUiqwlI0GZfDYUe6OZQF6NDdZxu0b9es=;
        b=BGryXpv50zq6cPqyuJSoJWPi4ZL4vRK36avTVP16oOw8zDOfevcWwtipxd6gNxN0I2
         9h364mQbhd60u5Res0J8tWky+opwCcGf0kXCbEkak5XorUmPmQl9oCLrgO/cwnkzoazZ
         3ZecHTNOWbzIQad/UFGjjRLZp+i1h9/BU0Iyy6FoJTvjkooLnx4OOGEdv0vtmannnoPk
         CEDXd0Ljj2MZeBA0zlLIQpbmUnUu4n+FYpnlock5kSl2Pwqo9qEJesgrYFNLDJhu45Y/
         irXtZOSkU7SvKzYmOyes2vuE20eEDRdfR2f83mTQpXMdHK4shv4VcZmSTOsKWcIxLhOc
         q5Vg==
X-Gm-Message-State: AOAM532FiC9eD8Pmla65SdAHBJ8I/cQutnjq2ZJb85PfACQUrzj0Tf+J
        FVsPpSDv5r5jsVVvYuXaYZhp3RACnDCl4UnQopXEDw==
X-Google-Smtp-Source: ABdhPJx1lIYR/oq8NfFLg2T+0jojl7BBRYD0j2U/Ua/gdPrYCKluwQ1CgEY8WNy/xq/flALhgfmObgBmrbZt8GF/CAo=
X-Received: by 2002:ac8:5713:0:b0:2de:4e16:5b25 with SMTP id
 19-20020ac85713000000b002de4e165b25mr4077178qtw.682.1645735764109; Thu, 24
 Feb 2022 12:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-4-dmitry.baryshkov@linaro.org> <9348028b-a898-428e-a855-9df18e577328@quicinc.com>
In-Reply-To: <9348028b-a898-428e-a855-9df18e577328@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 24 Feb 2022 23:49:13 +0300
Message-ID: <CAA8EJpo0C1vtiZAeBDU0G0rg5CEHwc5fmdkeKRiEyOvfPxNm-Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] drm/msm/dp: support finding next bridge even
 for DP interfaces
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Thu, 24 Feb 2022 at 23:13, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
> > It is possible to supply display-connector (bridge) to the DP interface,
> > add support for parsing it too.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_parser.c | 19 ++++++++++++-------
> >   1 file changed, 12 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> > index 901d7967370f..1056b8d5755b 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> > @@ -301,17 +301,22 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
> >               return rc;
> >
> >       /*
> > -      * Currently we support external bridges only for eDP connectors.
> > +      * External bridges are mandatory for eDP interfaces: one has to
> > +      * provide at least an eDP panel (which gets wrapped into panel-bridge).
> >        *
> > -      * No external bridges are expected for the DisplayPort connector,
> > -      * it is physically present in a form of a DP or USB-C connector.
> > +      * For DisplayPort interfaces external bridges are optional, so
> > +      * silently ignore an error if one is not present (-ENODEV).
> >        */
> > -     if (connector_type == DRM_MODE_CONNECTOR_eDP) {
> > -             rc = dp_parser_find_next_bridge(parser);
> > -             if (rc) {
> > -                     DRM_ERROR("DP: failed to find next bridge\n");
> > +     rc = dp_parser_find_next_bridge(parser);
> > +     if (rc == -ENODEV) {
> > +             if (connector_type == DRM_MODE_CONNECTOR_eDP) {
> > +                     DRM_ERROR("eDP: next bridge is not present\n");
> >                       return rc;
> >               }
> > +     } else if (rc) {
> > +             if (rc != -EPROBE_DEFER)
> > +                     DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
> > +             return rc;
> >       }
>
> How is this silently ignoring?
>
> static int dp_display_bind(struct device *dev, struct device *master,
>                 void *data)
> {
>      int rc = 0;
>      struct dp_display_private *dp = dev_get_dp_display_private(dev);
>      struct msm_drm_private *priv = dev_get_drvdata(master);
>      struct drm_device *drm = priv->dev;
>
>      dp->dp_display.drm_dev = drm;
>      priv->dp[dp->id] = &dp->dp_display;
>
>      rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
>      if (rc) {
>          DRM_ERROR("device tree parsing failed\n");
>          goto end;
>      }
>
> dp_display_bind will still fail if a bridge is not found.
>
> If supplying a bridge is optional even this should succeed right?

It will succeed as dp_parser_parse() will not return -ENODEV if the
connector is not eDP.
To rephrase the comment:
For the dp_parser_find_next_bridge() result:
- for eDP the driver passes all errors to the calling function.
- for DP the driver ignores -ENODEV (no external bridge is supplied),
but passes all other errors (which can mean e.g. that the bridge is
not properly declared or that it did hasn't been probed yet).

-- 
With best wishes
Dmitry
