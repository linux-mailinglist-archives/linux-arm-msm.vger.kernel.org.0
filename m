Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6024574DEA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 21:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjGJT5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 15:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjGJT5B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 15:57:01 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6168E13E
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 12:57:00 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-560b7ac3cbfso3524992eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 12:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689019019; x=1691611019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iikfxmrPyK8zYECgHI5xlrIBNbvbHcMxTIQLKu2GxTU=;
        b=fBTTDWmSgPG6fMHg0I64Y8r8B2c5fs/SHuPs0GMeS6eMhAS3I/glekfoFQOKsZBEJk
         0Yyw2voO7p7sr0fAvvK/1HYYy7/NAVyMXClUKMiLqJQkokR1R4oVXtik/31Fep2ly8zF
         NVnoY/P3r/PT8QCkjQfiQHR+E8BNOCNU6uAsq65V61W0dQfVRjMNv+hnF5Ht+KU4K5w6
         qEOn7LkJhWSeyriQdoN4MXFoMt5j8z4NISZy8ZwCe5lGvjOv3sz79jUrfYqh/PNVdcvz
         g51Fy3QaWaQinKGCk+vgG6LSVipfqIyAPgQ0FONKdo4JYzPrRHUxVo5vzOLUWS1roMgR
         mzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689019019; x=1691611019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iikfxmrPyK8zYECgHI5xlrIBNbvbHcMxTIQLKu2GxTU=;
        b=jrftvzbb7F2KBy3WkOlscx9ccew224X5zxJt4+QyWu7odyQePCgxLbJsWlJxycQECj
         3WXKvtI78JOUz017ve3mRONp0AGmLZp+LYqlbquA0GgM+K7+3kdlDcpzekUiL/38u7Li
         F5itEtZia7+E7ORIdRdihRE36BXEXtl9v+RgXOHID9N/wJiNuIXHt4MCfNnh7FiEyY4E
         bA5BP981Hxj51oOxZGGWr1dnvW5WP/O70s+eewvemVsTl+3XaHvrYx+mUmPPoDy3IqIh
         tUauMpLeVnYJ4wU9b6MLHm9vkywSEG82cBEUGz8RFjHqsQUcqtv1BAn1dFWNRzWyxiNL
         Ki9g==
X-Gm-Message-State: ABy/qLYEgRTwF5dBgr9dWDULBEZJZP4bLc0i5lT5X/FZpZM2U/+k1qhf
        dNSOknMHHJu2orsCsu0Sw0vsfeR6kk+a3u71/wI=
X-Google-Smtp-Source: APBJJlFHWEUeJy/zzH64FDJVPzVde6cIE42n90d9VETmo+st2no9IWC5WKJLn4n6IYo/sJwbOVRaUnUrgcTyTqHBnxk=
X-Received: by 2002:a4a:4915:0:b0:566:66bb:940a with SMTP id
 z21-20020a4a4915000000b0056666bb940amr9649254ooa.9.1689019019573; Mon, 10 Jul
 2023 12:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com> <20230706211045.204925-8-robdclark@gmail.com>
 <fa8f72dd-8d74-e941-1b4e-2464a9034424@linaro.org>
In-Reply-To: <fa8f72dd-8d74-e941-1b4e-2464a9034424@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 10 Jul 2023 12:56:48 -0700
Message-ID: <CAF6AEGv2K9Ar8=96H2_=BJc=hqFNnh2M5fvbG5p5gjoAEfR=-A@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 07/12] drm/msm/adreno: Move speedbin mapping
 to device table
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 6, 2023 at 7:54=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 07/07/2023 00:10, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This simplifies the code.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 171 ++------------------=
-
> >   drivers/gpu/drm/msm/adreno/adreno_device.c |  51 ++++++
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  25 +++
> >   3 files changed, 92 insertions(+), 155 deletions(-)
>
>
> Interesting hack, I'd say.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Minor nit below.
>
> >
>
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index d5335b99c64c..994ac26ce731 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -72,8 +72,33 @@ struct adreno_info {
> >       u32 inactive_period;
> >       const struct adreno_reglist *hwcg;
> >       u64 address_space_size;
> > +     /**
> > +      * @speedbins: Optional table of fuse to speedbin mappings
> > +      *
> > +      * Consists of pairs of fuse, index mappings, terminated with
> > +      * UINT_MAX sentinal.
> > +      */
> > +     uint32_t *speedbins;
>
> Would it be better to explicitly list this as pairs of uint32_t? And
> then use braces in ADRENO_SPEEDBIN initialisation.

It would mean the sentinel would take 8 bytes instead of 4.. maybe
that is over-thinking it, but it was the reason I just stuck with a
flat table

BR,
-R

> >   };
> >
> > +/*
> > + * Helper to build a speedbin table, ie. the table:
> > + *      fuse | speedbin
> > + *      -----+---------
> > + *        0  |   0
> > + *       169 |   1
> > + *       174 |   2
> > + *
> > + * would be declared as:
> > + *
> > + *     .speedbins =3D ADRENO_SPEEDBINS(
> > + *                      0,   0,
> > + *                      169, 1,
> > + *                      174, 2
> > + *                  ),
> > + */
> > +#define ADRENO_SPEEDBINS(tbl...) (uint32_t[]) { tbl, UINT_MAX }
> > +
> >   const struct adreno_info *adreno_info(struct adreno_rev rev);
> >
> >   struct adreno_gpu {
>
> --
> With best wishes
> Dmitry
>
