Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 868C8794617
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 00:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239266AbjIFWS6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 18:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235282AbjIFWS5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 18:18:57 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3112E19AF
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 15:18:54 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d7eccc1b8c6so333928276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 15:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694038733; x=1694643533; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEcTm+XzAutmtIHBz/dQY7Dk0HGJ+IZm2yIDEFBU9hs=;
        b=VhMzvXtWfEHxUyqWPrTIEp+m3V2Zrk6lE9yroNGfOmVZ5AsTm4ArXlAvIWOrkKME7b
         8pYATs3hhP91LdgFEkRKgavAFYNSfO9XCVp71+anh6bpAsDraH4UDNGCfg4UxNZAbaVC
         EkRrZXBA1pL8ka5fpmLQ+e6SVnibXbuPeaMiAq/JBcqufon8AXnirj3e4e6l2ZXbD58u
         hFO2dSJPULDCTdR9YzFy9f3bdZKsgx9BJ7eWrBYoWo54Tm6nOrO0vBZXVCfDyVVEUGra
         IstEl2lI2QBWk6JE1C96AdA8Nkg20Na8i+vbJRWflpc0ybGDIPfBMEaAspw/+8V4+rNb
         d0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694038733; x=1694643533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEcTm+XzAutmtIHBz/dQY7Dk0HGJ+IZm2yIDEFBU9hs=;
        b=X+Wa8ueMw/JDGM/25X51guHlzkmgbCh08oeFyJyssLYnvuOF138/cPLo2jumrb3Op1
         TP4T+1HEdMFTVkl+mNjckxESB7fPXPrMlULtK6C/cOsHWsUAxNkKzA+HTM1i96owGbB1
         MLTfNH5U0NgwPfaEv3M2q3sK+w1HSIvP5b9g9gWPEYLmXvOs99XxAkr3gUOzB37WSsdk
         ubfReLe/yCCC+Ei2EVuJb7W8w4vckpt4VHQgj06FugXppFEFGWGK0/WWzDPKHStfLriW
         N5YPtgnaIM3AnhQadnmqpgLt+8UJNX3sjhz3LL2aFbclxf46VH2Ko2XCX4lX8EXMe9Wd
         qYpA==
X-Gm-Message-State: AOJu0Yw1bvZ8M8y/5M8k5h+81+eK6SLkGHEjDyL59PiDe9GAq7mI03Gx
        4q1AP8XSeNwIaYaiOKWHztT8j0wKAB677jRaZ/AaLg==
X-Google-Smtp-Source: AGHT+IFbQ1dhqzJXEeGW73jpwvBotnPBYOgj+Q3yJ4ybSLAVHnNCHtXVhevoeZrBqNfl+r3ytMkYJmcUNUWUETNKu1s=
X-Received: by 2002:a25:c0d7:0:b0:d7f:2cb6:7d8b with SMTP id
 c206-20020a25c0d7000000b00d7f2cb67d8bmr10275064ybf.63.1694038733402; Wed, 06
 Sep 2023 15:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
 <20230905174353.3118648-3-dmitry.baryshkov@linaro.org> <CAE-0n51oha3TmMHRX7pedDzO1iOxXhbYS9nT8rdamki0LyAbqQ@mail.gmail.com>
In-Reply-To: <CAE-0n51oha3TmMHRX7pedDzO1iOxXhbYS9nT8rdamki0LyAbqQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 7 Sep 2023 01:18:42 +0300
Message-ID: <CAA8EJpq2i2+pyb4SQo-U3ZpVOgXec1s8mg3w-9u4onrYiQnVyw@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/msm/mdss: generate MDSS data for MDP5 platforms
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Sept 2023 at 01:10, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2023-09-05 10:43:49)
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 348c66b14683..fb6ee93b5abc 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -222,6 +222,36 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
> >         }
> >  }
> >
> > +static struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_mdss *mdss)
>
> const mdss?

Ack

>
> > +{
> > +       struct msm_mdss_data *data;
> > +       u32 hw_rev;
> > +
> > +       data = devm_kzalloc(mdss->dev, sizeof(*data), GFP_KERNEL);
> > +       if (!data)
> > +               return NULL;
> > +
> > +       hw_rev = readl_relaxed(mdss->mmio + HW_REV) >> 16;
>
> Or like this
>
>         hw_rev = upper_16_bits(readl_relaxed(...))

Ugh. That looks ugly, I'd say. >> 16 is more common.

>
> > +
> > +       if (hw_rev == 0x1007 || /* msm8996 */
> > +           hw_rev == 0x100e || /* msm8937 */
> > +           hw_rev == 0x1010 || /* msm8953 */
> > +           hw_rev == 0x3000 || /* msm8998 */
> > +           hw_rev == 0x3002 || /* sdm660 */
> > +           hw_rev == 0x3003) { /* sdm630 */
>
> Can we have #defines for hw_revs and drop the comments?
>
> > +               data->ubwc_dec_version = UBWC_1_0;
> > +               data->ubwc_enc_version = UBWC_1_0;
> > +       }
> > +
> > +       if (hw_rev == 0x1007 || /* msm8996 */
> > +           hw_rev == 0x3000) /* msm8998 */
>
> Then we don't have to worry about these two having typos.

Ack

>
> > +               data->highest_bank_bit = 2;
> > +       else
> > +               data->highest_bank_bit = 1;
> >



-- 
With best wishes
Dmitry
