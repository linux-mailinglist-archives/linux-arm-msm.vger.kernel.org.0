Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB885505B7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 17:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbiFRP0Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Jun 2022 11:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235157AbiFRP0X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Jun 2022 11:26:23 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3BE6244
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jun 2022 08:26:22 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id t16so5399444qvh.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jun 2022 08:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7yl+xWcwVFLnyuaROrrKb0oLsBtG84Oe2zSLgvQZ6no=;
        b=KqY7UVBX2vSSEpwujLQYovb9gYVHEq3Pi80wL996MKdr6yBXPfcsRJfobcBKcQOyhA
         ul2gc27bawxU+xiOUW6Rhj9/3hTqGJsWnoaB2hqov4VIhdwB6X98r9eY0eepbJmRjbUN
         LcWQizgGEnmxWHUZcETlaNwzJ27PiK0Qqg9MrZakcRn748XrGKCeLSTLIVrsYBULvDD7
         JeNQthnoJ3C9XRLzZLnqSHHeN/pVhfqUSVQh0t8DaO5sKVpdnnevLDDUnRFBp4xJqbwq
         SAyEqPKbCP6eqattCeBk8jxTMCX4R4mc8QMofIJ3yesDF6ijarEQci+9jbd/XxDDEXi5
         XF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7yl+xWcwVFLnyuaROrrKb0oLsBtG84Oe2zSLgvQZ6no=;
        b=oe6Wcl9syJyBqStDo3cZKVaVrI7cJcd9hSNu5fCaOks7rWtMsWQB5APawCVjxyvfLf
         qbQSz2nCV0CLFW5AwCEIWFXY3Zh3zxymR5yAVNtCLxL1MWuU4LDcE7pv2j3VFgBrGwzw
         YsU6P63rkgwQot5w3NfScnX5FNzG6MglQQ627JAeJZRgzq2XeVlvSAj990IDEuJJmTJa
         cN3W+4K+1z1diyAhXc2gVQHCa7cBJ83agjNJaZiEMEvr2cXur3BD/tVvUQZavHjCOkG6
         adN2yOpWz0eJmsk1S9OayJak7dYRzpvCiE1GkqizCT8/i0UuweOaX9e3KZILThdYoTpZ
         9d7Q==
X-Gm-Message-State: AJIora/2U3Zq+bh80eZdQbwxa4DkXVFoAR+wQovUplyBIZfHcfQNxNEO
        YLtKC3hqS5SWr5gNN+0q1Q+shYNAQSbrVc6YjdTX+A==
X-Google-Smtp-Source: AGRyM1sR581qRv4JouVElVM2DI+MmhpNUnbQNeyw6yIKDKnyO1veVGBuLoVpJyWMQ0AVIq/eZxUCftWNW75DgwalseY=
X-Received: by 2002:a05:622a:487:b0:304:fbfc:9933 with SMTP id
 p7-20020a05622a048700b00304fbfc9933mr13291540qtx.682.1655565981300; Sat, 18
 Jun 2022 08:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
 <20220615135935.87381-2-dmitry.baryshkov@linaro.org> <11998546.O9o76ZdvQC@g550jk>
In-Reply-To: <11998546.O9o76ZdvQC@g550jk>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 18 Jun 2022 18:26:10 +0300
Message-ID: <CAA8EJppqpZzF2o-jQGKvFnf62kAdv-2QTsYmXMfw2k7KccNzBg@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/msm/mdss: enable optional core clock for MDP5 MDSS
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org
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

On Sat, 18 Jun 2022 at 17:24, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Hi Dmitry,
>
> On Mittwoch, 15. Juni 2022 15:59:32 CEST Dmitry Baryshkov wrote:
> > Enable (optional) core (MDP_CLK) clock that allows accessing HW_REV
> > registers during the platform init.
> >
>
> I believe you also need to update Documentation/devicetree/bindings/display/
> msm/mdp5.txt with the new clock.

I'm working on converting it to the yaml format.

>
> Regards
> Luca
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index b41848bfff91..f7b4628986b8 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -288,7 +288,7 @@ static int msm_mdss_reset(struct device *dev)
> >  /*
> >   * MDP5 MDSS uses at most three specified clocks.
> >   */
> > -#define MDP5_MDSS_NUM_CLOCKS 3
> > +#define MDP5_MDSS_NUM_CLOCKS 4
> >  static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct
> > clk_bulk_data **clocks) {
> >       struct clk_bulk_data *bulk;
> > @@ -305,6 +305,7 @@ static int mdp5_mdss_parse_clock(struct platform_device
> > *pdev, struct clk_bulk_d bulk[num_clocks++].id = "iface";
> >       bulk[num_clocks++].id = "bus";
> >       bulk[num_clocks++].id = "vsync";
> > +     bulk[num_clocks++].id = "core"; /* for hw_rev access */
> >
> >       ret = devm_clk_bulk_get_optional(&pdev->dev, num_clocks, bulk);
> >       if (ret)
>
>
>
>


-- 
With best wishes
Dmitry
