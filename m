Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37C628EA9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 03:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388639AbgJOB7u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 21:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388688AbgJOB7j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 21:59:39 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D122C0613A8
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 14:14:04 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id p25so268556vsq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 14:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RC25HY5NnJ5FNFugLVlYGqgrjVBJgiwdGnqPIb+Pkec=;
        b=Eudd9Igdl/h4VlLzh+aptHOEYif6JqCGyjeEgznhJwQJ1ttBoPa1uqULYPz9oPlCXy
         c7SM6xDD18LjK/c5U+87y0gfMTersHROiToiRFTAD/yQO1OsuN7uOr2MLccaOEP05GV5
         mbjFG5TewOySMnmNVW5yP7KHxfDdQZEsCE11w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RC25HY5NnJ5FNFugLVlYGqgrjVBJgiwdGnqPIb+Pkec=;
        b=H/60uOQFjUQJmoPyhVXIPyQzRU9kcIi0jmtK4JLhTAChLoQ9FDhYlJmZr8ci7ZkBrm
         chAQN4wuwAyM7j5hfiE2BydKEsnGf99AFjHKfwbo+hFXo+9ojmF0lDdwYE562yPcdkwA
         6mqIB71I3Smeslvv4kaxgwX1tNO9Sa+Cfe69kb+pYULWUcnMgCyphdzf8yxWkD8XB/81
         cJ36i8uRYpov6crPmkVjyivYbTN+lPVXeJgEE46Uadlz5RTJvqwDxQM8N7I0uh6dW5rl
         y6+ApCanwoDX8WJhJpOVLAkHqUnkk2CUnhwR5cE1keE24JcX5RxpzvEV8ViXoL5y91/r
         pM2Q==
X-Gm-Message-State: AOAM532c5/TjkjGV39EYZHjJ32+auCdkt8lJnVae63P684cO8N7d2X5a
        mwnHRosr+C3tmdLVSREAD3vQ6t75LEEEMg==
X-Google-Smtp-Source: ABdhPJycNnHHgquP3M08GDln73JN7oPOwbK5gvQgPN1nINeR+ja5pe3Wau3yZW5Gfdkh5IhHR55fbw==
X-Received: by 2002:a05:6102:3013:: with SMTP id s19mr869955vsa.2.1602710043136;
        Wed, 14 Oct 2020 14:14:03 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id d83sm85331vsc.21.2020.10.14.14.14.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 14:14:02 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id u7so245706vsq.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 14:14:02 -0700 (PDT)
X-Received: by 2002:a67:b405:: with SMTP id x5mr993311vsl.4.1602710041706;
 Wed, 14 Oct 2020 14:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201014085758.v2.1.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid>
 <160269519265.884498.6320532206038624483@swboyd.mtv.corp.google.com>
In-Reply-To: <160269519265.884498.6320532206038624483@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 14:13:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcH0DKhiKp4X8j0mxUUCm-yZmJp1boXqVOhCWeySydiQ@mail.gmail.com>
Message-ID: <CAD=FV=WcH0DKhiKp4X8j0mxUUCm-yZmJp1boXqVOhCWeySydiQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: qcom: lpasscc: Re-configure the PLL in case lost
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Oct 14, 2020 at 10:06 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Douglas Anderson (2020-10-14 08:58:24)
> > diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > index 228d08f5d26f..ee23eb5b9bf2 100644
> > --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> > +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > @@ -356,6 +356,25 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
> >         .num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
> >  };
> >
> > +static int lpass_core_cc_pm_clk_resume(struct device *dev)
> > +{
> > +       struct regmap *regmap = dev_get_drvdata(dev);
>
> Can we use dev_get_remap(dev, NULL) instead?

Good idea.  ...but as far as I can tell there are two regmaps.  I'll use

dev_get_regmap(dev, "lpass_core_cc");


> > +       unsigned int l_val;
> > +       int ret;
> > +
> > +       ret = pm_clk_resume(dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Read PLL_L_VAL */
>
> Please drop this useless comment. Replace it with something like this
> (if at all):
>
>         /* Reconfigure PLL if PLL was reset across suspend */

We reconfigure more than just the PLL.  I believe that the PLL being
zero is just a clue that we use to know we should re-init the whole
thing.  I've tried to convey this in a comment in the next version.
