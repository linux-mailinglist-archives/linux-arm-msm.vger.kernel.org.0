Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED22314DA75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 13:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbgA3MMj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 07:12:39 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:40136 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbgA3MMj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 07:12:39 -0500
Received: by mail-vs1-f66.google.com with SMTP id g23so1885041vsr.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 04:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2oMFpwjVb7wHknI2AwAM6qt6edMX0VsMEB2cb5KoudE=;
        b=uAP5UuS4nIhlNl+uJgWtgeb+MNtWmxGmJMOxQsRCl4Q9yMSxy60q9sCVp/DRW8tQMa
         Y+2hLuAKNhZQnwTfrPNBSXYztdD/VLz9pvr8tN2OJsf2ru4JJ6m2Amolz5Kdovm7Uby5
         XlL7EAljqelhyzvHARieiDGh+zy7mQe95Fe1EjaUd02aoY3UztDQQt9IzZjMB71prQzc
         uKrpjECcLv/idYjwYFmKes1cNBP1EcpZxzrtRyV850R8AVN92NKMDWO/0YV8ipY3vfaX
         IWXSfPpq4y6bB8KjyYMuJMAwLnOnT+Rr/Sg2Wx4xc78rtJsGVABh0pe6WdnShctT2M8L
         FP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2oMFpwjVb7wHknI2AwAM6qt6edMX0VsMEB2cb5KoudE=;
        b=S/S0TALNgdymQHTtfT3HuF0sGvMZTeBKGf0rCIBt/2pkc2IOWPPqO/OeuyXU2mPqhD
         BYME7742Mjiw8Gslq26lsnJ8RGt7wyt5ls92MVgQADvAwqK80GYtIj4t8rzMsSioOlRz
         Jl7aPo87GEmJQFnZbFVSnV19g7FEdfltLSc8rgoa3YVr7FenuiULeaGqiMkGUa7tbQBN
         84tM+cBhLpGHGaIqzKpJesE200m+Oo7BSz7vIWF5G6xHexuZw1oBW8KA0gxW8txrWmFv
         HhNNlA3AKWrArPPRIUV5XgZ2WfCy7yACzs8VBlMQNCncXrrFmNl9E8lb79KWtKl3gP0m
         c3lg==
X-Gm-Message-State: APjAAAVghHmSTmLXVm0WoyyAaRJl6ucmkoeBMwF8tvI8BaoN9WgoaVH/
        7moFLg3kWfEmEWtKpJWWJG1ZEUzznktqj8Fqj31Qvg==
X-Google-Smtp-Source: APXvYqzIJN47kZl0erjghOvF7Xbi6btHuqe0G5exgzJNifWuD2wfvuXxX58uiGX8x9Y0uShbRP2pDgMMbmlbadc2sXo=
X-Received: by 2002:a05:6102:535:: with SMTP id m21mr2631714vsa.95.1580386356212;
 Thu, 30 Jan 2020 04:12:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577976221.git.amit.kucheria@linaro.org>
 <a63edff9a3c02a542d36fdd28fe774a5c3bf3b8d.1577976221.git.amit.kucheria@linaro.org>
 <20200102195537.GE988120@minitux>
In-Reply-To: <20200102195537.GE988120@minitux>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 30 Jan 2020 17:42:25 +0530
Message-ID: <CAHLCerMk=cHjOTkZo34oeoT-BA_YBz=uZS4MK3b9Z8KKzpnnkQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] drivers: thermal: tsens: Add watchdog support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 3, 2020 at 1:25 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 02 Jan 06:54 PST 2020, Amit Kucheria wrote:
> [..]
> > diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> > index 4cf550766cf6..ecbc722eb348 100644
> > --- a/drivers/thermal/qcom/tsens-common.c
> > +++ b/drivers/thermal/qcom/tsens-common.c
> > @@ -377,6 +377,24 @@ irqreturn_t tsens_critical_irq_thread(int irq, void *data)
> >       struct tsens_irq_data d;
> >       unsigned long flags;
> >       int temp, ret, i;
> > +     u32 wdog_status, wdog_count;
> > +
> > +     if (priv->feat->has_watchdog) {
> > +             /* Watchdog is present only on v2.3+ */
>
> Please omit this comment, you're carrying the motivation for this
> decision when you set has_watchdog already.

Will fix.

>
> > +             ret = regmap_field_read(priv->rf[WDOG_BARK_STATUS], &wdog_status);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* Clear WDOG interrupt */
> > +             regmap_field_write(priv->rf[WDOG_BARK_CLEAR], 1);
> > +             regmap_field_write(priv->rf[WDOG_BARK_CLEAR], 0);
>
> Are you sure you need to zero the clear register?

Yes, the corresponding downstream code is as follows:
                       /*
                         * Clear watchdog interrupt and
                         * increment global wd count
                         */
                        writel_relaxed(wd_mask | TSENS_TM_CRITICAL_WD_BARK,
                                (TSENS_TM_CRITICAL_INT_CLEAR
                                (tm->tsens_tm_addr)));
                        writel_relaxed(wd_mask & ~(TSENS_TM_CRITICAL_WD_BARK),
                                (TSENS_TM_CRITICAL_INT_CLEAR
                                (tm->tsens_tm_addr)));


> > +
> > +             ret = regmap_field_read(priv->rf[WDOG_BARK_COUNT], &wdog_count);
> > +             if (ret)
> > +                     return ret;
> > +             if (wdog_count)
> > +                     dev_dbg(priv->dev, "%s: watchdog count: %d\n", __func__, wdog_count);
> > +     }
> >
> [..]
> > @@ -793,6 +815,22 @@ int __init init_common(struct tsens_priv *priv)
> >               }
> >       }
> >
> > +     if (tsens_version(priv) > VER_1_X &&  ver_minor > 2) {
> > +             /* Watchdog is present only on v2.3+ */
> > +             priv->feat->has_watchdog = 1;
> > +             for (i = WDOG_BARK_STATUS; i <= CC_MON_MASK; i++) {
> > +                     priv->rf[i] = devm_regmap_field_alloc(dev, priv->tm_map,
> > +                                                           priv->fields[i]);
> > +                     if (IS_ERR(priv->rf[i])) {
> > +                             ret = PTR_ERR(priv->rf[i]);
> > +                             goto err_put_device;
> > +                     }
> > +             }
> > +             /* Enable WDOG and disable cycle completion monitoring */
>
> Commit message says you're not enabling it. Should this say "WDOG is
> already configured, unmask the bark" or something along those lines?

Will reword

>
> > +             regmap_field_write(priv->rf[WDOG_BARK_MASK], 0);
> > +             regmap_field_write(priv->rf[CC_MON_MASK], 1);
> > +     }
> > +
> >       spin_lock_init(&priv->ul_lock);
> >       tsens_enable_irq(priv);
> >       tsens_debug_init(op);
>
> Regards,
> Bjorn

Thanks for the review.
