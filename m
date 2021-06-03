Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9270B39A941
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 19:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhFCReZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 13:34:25 -0400
Received: from mail-qt1-f174.google.com ([209.85.160.174]:44581 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbhFCReZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 13:34:25 -0400
Received: by mail-qt1-f174.google.com with SMTP id t17so4925828qta.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 10:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EmyX0XyWEIneeDYfbBG4ObIuDu7DXUhUCt5AQSkJlag=;
        b=n6E+ChRbvpZMpLyiN6668dyKckxes03IVA8NNi42tJcaWWUDIlporID7j9wH8rN6P5
         lDaXi4omE+fI8G5EYtzEAt70d6smtPw5lbRx9Q6URvNl+5Ic+PnFS8FEPwvDTKgb5Del
         oQe/DMHD+DMUMjcpdVPk94WrJYfPc7jgMgjKUsSt2sBgtoJAmH0/7nEp1JUAFGXsNPeJ
         /YSqrQFzDveb2iab77/pjlp2JLF3G/VJJxq8DKzVei+bsVIEuHLyrCirzq8gPNgmbANr
         MLYNNig9nivfh8yqmVlzYav/hnP1LKy1WLQ2Q8qai5leMm5mZDQLqj5DO0xWvoif13ls
         0lOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EmyX0XyWEIneeDYfbBG4ObIuDu7DXUhUCt5AQSkJlag=;
        b=scq4dNYdX33XhviwTAse5CxgR0STwo9hquZbWyMAMnUvE9vyEQK6iPTMLqNXB9jazs
         O8jdyxhAc3oLVOvQdyhNrnoUL7xwWHmX9PkhErI4tWyG7xlkygRC+2H/wkGjQUN7jnSD
         2SzdYnr62QXztMyhyDG1YK3DKa/sZ2MVFwqq7YObwTnK+oQ8ADJ5owW0+cQp02s4z8m2
         NInA3IdYYa2JqgCYTaa8OXG5jO4ooKFoT9wgjDVMnn5p22VlcEz3wt8hAgcEWoxzmqBU
         7QV3CyFChZ3PEZYuiBohCprE4/S8w30QFR6ayROgEN3CqEQLP3yY0kr8BOItBLWf2tI/
         IAVg==
X-Gm-Message-State: AOAM532mAhoOj92INJBP0IL+KZH51e2BN8ZuAGmf6l53vOedpecEvBGG
        4Gq8e5FNrNI/YTV/bYXNVatevq0mFUS15mQK5PAQ7g==
X-Google-Smtp-Source: ABdhPJwhyFKw222zE8Liy33p0ZBdfNsTgR33XIaWU83t4vfa9un3ZfpXlpcOzIVgPrw84BBsZEJOG27VJfUQk84EqWc=
X-Received: by 2002:ac8:470b:: with SMTP id f11mr535777qtp.273.1622741499724;
 Thu, 03 Jun 2021 10:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210603141357.572347-1-yangyingliang@huawei.com> <20210603171253.GA25742@codeaurora.org>
In-Reply-To: <20210603171253.GA25742@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 3 Jun 2021 20:31:28 +0300
Message-ID: <CAA8EJprf+ipk45c-niM1PAHCwn5huBEyvBpQA=dgQMohN43E5g@mail.gmail.com>
Subject: Re: [PATCH -next] mfd: pm8008: Fix return value check in pm8008_probe()
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Yang Yingliang <yangyingliang@huawei.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 3 Jun 2021 at 20:18, Guru Das Srinagesh <gurus@codeaurora.org> wrote:
>
> On Thu, Jun 03, 2021 at 10:13:57PM +0800, Yang Yingliang wrote:
> > In case of error, the function devm_regmap_init_i2c() returns ERR_PTR()
> > and never returns NULL. The NULL test in the return value check
> > should be replaced with IS_ERR().
> >
> > Fixes: 6b149f3310a4 ("mfd: pm8008: Add driver for QCOM PM8008 PMIC")
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>
> Acked-by: Guru Das Srinagesh <gurus@codeaurora.org>

Interestingly, the change does not correspond to the changelog
message. And the code is correct as devm_kzalloc returns NULL if I
remember correctly.

>
> > ---
> >  drivers/mfd/qcom-pm8008.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> > index c472d7f8103c..dfefa60d693b 100644
> > --- a/drivers/mfd/qcom-pm8008.c
> > +++ b/drivers/mfd/qcom-pm8008.c
> > @@ -223,7 +223,7 @@ static int pm8008_probe(struct i2c_client *client)
> >       struct pm8008_data *chip;
> >
> >       chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> > -     if (!chip)
> > +     if (IS_ERR(chip))
> >               return -ENOMEM;
> >
> >       chip->dev = &client->dev;
> > --
> > 2.25.1
> >



-- 
With best wishes
Dmitry
