Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 323E3764134
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 23:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjGZVdR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 17:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjGZVdQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 17:33:16 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28AB310F3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 14:33:15 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d0e009433c4so236534276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 14:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690407194; x=1691011994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CFNQJOAD0fO9fjODgv9Vgz/m4W/3GjQnJ0WkDekZYbo=;
        b=Hco0ofCImpyA8iT5sXSj8CMf3yH3596t+DYzL3By4zXYzvZna9PKQMiOPw0mrRWpsN
         deJ4HHoaZllAusSDSnvG8hKPqGWboZYijVhF6n3z23ojF5BRwn5tJ5s4/VrSo/H/Dojr
         xB3JVP94osbcugaAl67f+mNWdExytgiMzDXP6Vap5PVOCZvU8bt1QVHwISezBEm5GvxT
         GIHi+qTdKX5PynASC9qks9McsQHIFXgfkhCu8MM+Hs7Kg6DJjjCHOJr3YFx0MKLNmpPz
         31sxr5f5dHxZdCgl65TJR7g2Dx4WczB7JjvHcIaeWUKzEbUnSgZoFPuClshcvFBpW/ty
         gOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690407194; x=1691011994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFNQJOAD0fO9fjODgv9Vgz/m4W/3GjQnJ0WkDekZYbo=;
        b=HE4ksR0me/WmufFfNHDoAZt629c/cZnmYVDYR5yeca+QU8/z7HJKNjpkZ4z5mKWIgV
         +bzvl/ZqooMhRn5Tutg19FI7ofMLqtMwef0MYDO0/dro0gZ4er78cykfUnMh3hrYyBUW
         HEqqKAMlpwXU7J6JxojXTqKRe5bT68Ha8GXiCB7hroV7KcJO9iO7GDCtXfdJhJvTc7Jq
         O0DNlDGL8/n7P1YhcgHQl1Flm7zBFjDl1rrNQ2v4r4SJbtKis2zlwwx3b8ioEOSQVTsf
         ANvRwblGHjmknKQtxKAXGWFnZhQ4qvCNaJsezwuI7eeIKQe3SYzBzqjuNqQBXzs0BgPQ
         6HNQ==
X-Gm-Message-State: ABy/qLY8hSGt/YqnPVB+TPYaFAh2TbzSe5X9yPkoN8LnM+AV5hxKHW48
        c/M7bnLuwvPmTRyjG/vUUbucm2Z70Cwm/qWqvsMExA==
X-Google-Smtp-Source: APBJJlGXCjGO5xZaDzUx5cqSF6j27WCBpolM7Ziry3yh8CuILT8K/BWuLDciZXYpnM0MusKUmuadhMGz0Ix7z+n+R94=
X-Received: by 2002:a25:b29e:0:b0:d07:f1ed:51f6 with SMTP id
 k30-20020a25b29e000000b00d07f1ed51f6mr2959956ybj.2.1690407193694; Wed, 26 Jul
 2023 14:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-4-dmitry.baryshkov@linaro.org> <05f4708d-5db7-37ff-2d79-b4a9483606f9@quicinc.com>
In-Reply-To: <05f4708d-5db7-37ff-2d79-b4a9483606f9@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 27 Jul 2023 00:32:52 +0300
Message-ID: <CAA8EJpqc69tUwt4345wQ-S4yP9-WhwdqV8760ESmxJZ1w26WQw@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/mdss: export UBWC data
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 27 Jul 2023 at 00:21, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
> > DPU programming requires knowledge of some of UBWC parameters. This
> > results in duplication of UBWC data between MDSS and DPU drivers. Export
> > the required data from MDSS driver.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/msm_mdss.c | 30 +++++++++++++-----------------
> >   drivers/gpu/drm/msm/msm_mdss.h | 27 +++++++++++++++++++++++++++
> >   2 files changed, 40 insertions(+), 17 deletions(-)
> >   create mode 100644 drivers/gpu/drm/msm/msm_mdss.h
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index d1e57099b517..ed836c659688 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -13,7 +13,7 @@
> >   #include <linux/pm_runtime.h>
> >   #include <linux/reset.h>
> >
> > -#include "msm_drv.h"
> > +#include "msm_mdss.h"
> >   #include "msm_kms.h"
> >
> >   #define HW_REV                              0x0
> > @@ -26,16 +26,6 @@
> >
> >   #define MIN_IB_BW   400000000UL /* Min ib vote 400MB */
> >
> > -struct msm_mdss_data {
> > -     u32 ubwc_enc_version;
> > -     /* can be read from register 0x58 */
> > -     u32 ubwc_dec_version;
> > -     u32 ubwc_swizzle;
> > -     u32 ubwc_static;
> > -     u32 highest_bank_bit;
> > -     u32 macrotile_mode;
> > -};
> > -
> >   struct msm_mdss {
> >       struct device *dev;
> >
> > @@ -185,12 +175,6 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
> >       return 0;
> >   }
> >
> > -#define UBWC_1_0 0x10000000
> > -#define UBWC_2_0 0x20000000
> > -#define UBWC_3_0 0x30000000
> > -#define UBWC_4_0 0x40000000
> > -#define UBWC_4_3 0x40030000
> > -
> >   static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
> >   {
> >       const struct msm_mdss_data *data = msm_mdss->mdss_data;
> > @@ -236,6 +220,18 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
> >       }
> >   }
> >
> > +const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
> > +{
> > +     struct msm_mdss *mdss;
> > +
> > +     if (!dev)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     mdss = dev_get_drvdata(dev);
> > +
> > +     return mdss->mdss_data;
> > +}
> > +
> >   static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >   {
> >       int ret;
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
> > new file mode 100644
> > index 000000000000..02bbab42adbc
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/msm_mdss.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2018, The Linux Foundation
> > + */
>
> Fix the copyright year .

No, the copyright year is correct. The data was moved from the c file
(which has this copyright) and there are no copyrightable additions.

>
> Apart from that,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry
