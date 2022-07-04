Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 332A75657B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 15:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234481AbiGDNrH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 09:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234169AbiGDNqw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 09:46:52 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB0076164
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 06:46:39 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-10be1122de0so6376078fac.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 06:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uw7afw8tR6bUOC0CUKqaxNcH5iBflTgpCB+SFda4iLw=;
        b=TRT3CfyfApuGy6aVQLflRuFqTdT1iBKPaD/C9rIZuWrXShGAf1yKpB3V/qRFTtGxza
         GhjVKpe0HpaTBWajYeyssfPTQnvOGvVXZ+tlcWS0QgQsHxQUxTwK/+Ye8BKJwUH6OTD1
         sgi++XDjAatPkkGEqRIhZzyYnfNPhBgB9gCYFi60muYA7Ptc6C2K6LTI8918B7DkJ2zp
         KGlfBrNFqFGYRc9IbgjfIkaqjoDc5gPVDRQ3H36lGFFLLPfxdw73a3wVUhrHxKCs/Ntm
         FXSQf40U+XULXoKx9SWcW+ekp26F7uHU+HUwmeYl8aqiSfmqvlNPUdnl76UeGh45mvT8
         2YeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uw7afw8tR6bUOC0CUKqaxNcH5iBflTgpCB+SFda4iLw=;
        b=0LyRKTG5qdwFYUrKTjx4gSPoLDntI5apSc77D9lQyrMouz1Og8J7KAOI7tj5CGkVbV
         B76IL35Qq8NjOvqLIrVOS/zdZ1rF+9LjE6IZK7Ru9Jd0sBR/LP8YBaM5li2KpkYKipUB
         Er1wdUrOjOQqct5khK2VzBaJFMH+Za2y1Ma/YM/TtPl/qYaMjH/fPUD4PIphCk1FsU4w
         eNHIvFlK5gMVT9wEwRgoDZ7UArUn0njM3jjMeGJe0D3e52Y14yC1x35jHoJGSd8/6Lgp
         Da5DilVgC82XelQYDvaNzqYoWUL58uj7ycyAXULT3BLDRGEYTPg1lDaNwA01nU8VUzhO
         crjA==
X-Gm-Message-State: AJIora8SbR++cUKYBr5xjnyF+zoVbiGQJBeCfIrMcrD5Hh29poHjxKSN
        Jj2t7u+3bnXUAJbjZJ4JQUujylDVQGWAJh62YyHVmA==
X-Google-Smtp-Source: AGRyM1vll+7rb/D13uFGBQfQQRC4PxFD0rjiWMlK4VSNvyImZDVWxMdBsLd4pA1YqsiQQ/UOEbFCxUE1z+z7awlPhs4=
X-Received: by 2002:a05:6870:65a4:b0:10b:f0a4:17d2 with SMTP id
 fp36-20020a05687065a400b0010bf0a417d2mr4530145oab.241.1656942398697; Mon, 04
 Jul 2022 06:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220704105712.469657-1-vladimir.zapolskiy@linaro.org> <355eda8c-ccc1-3197-257e-c018d66dd98c@linaro.org>
In-Reply-To: <355eda8c-ccc1-3197-257e-c018d66dd98c@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 4 Jul 2022 15:46:27 +0200
Message-ID: <CAG3jFysFoV87hoFE1N_wmP5iHpZ6UgTgGY5EVeZ+OoeCPYqaVQ@mail.gmail.com>
Subject: Re: [PATCH] media: camss: Do not attach an already attached power
 domain on MSM8916 platform
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
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

On Mon, 4 Jul 2022 at 13:08, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On 7/4/22 13:57, Vladimir Zapolskiy wrote:
> > The change to dynamically allocated power domains neglected a case of
> > CAMSS on MSM8916 platform, where a single VFE power domain is neither
> > attached, linked or managed in runtime in any way explicitly.
> >
> > This is a special case and it shall be kept as is, because the power
> > domain management is done outside of the driver, and it's very different
> > in comparison to all other platforms supported by CAMSS.
> >
> > Fixes: 929684b7ef4d ("media: camss: Allocate power domain resources dynamically")
>
> Fixes: 6b1814e26989 ("media: camss: Allocate power domain resources dynamically")

6b1814e26989 is the correct commit id to use.

>
> is the correct commit id found on media/master, please let me know, if anyone
> wishes me to resend the fix.
>
> > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > ---
> >   drivers/media/platform/qcom/camss/camss.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> > index bf716b171c02..9e2899a0cdf4 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -1684,6 +1684,14 @@ static int camss_configure_pd(struct camss *camss)
> >               return camss->genpd_num;
> >       }
> >
> > +     /*
> > +      * If a platform device has just one power domain, then it is attached
> > +      * at platform_probe() level, thus there shall be no need and even no
> > +      * option to attach it again, this is the case for CAMSS on MSM8916.
> > +      */
> > +     if (camss->genpd_num == 1)
> > +             return 0;
> > +
> >       camss->genpd = devm_kmalloc_array(dev, camss->genpd_num,
> >                                         sizeof(*camss->genpd), GFP_KERNEL);
> >       if (!camss->genpd)
> > @@ -1923,6 +1931,9 @@ void camss_delete(struct camss *camss)
> >
> >       pm_runtime_disable(camss->dev);
> >
> > +     if (camss->genpd_num == 1)
> > +             return;
> > +
> >       for (i = 0; i < camss->genpd_num; i++) {
> >               device_link_del(camss->genpd_link[i]);
> >               dev_pm_domain_detach(camss->genpd[i], true);
>
> --

With the commit id fixed, please add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
