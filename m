Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C6564905B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 20:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiLJTLB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 14:11:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLJTLA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 14:11:00 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E0B13FA3
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:10:58 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-3bfd998fa53so94159737b3.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wMKlZ/XsQ/RdDfIxg477G91ZfmGJ9kv/1t3NaSxe8I0=;
        b=I2eH+MgR5SeGOdBzAAYEcMED5kcnPrFJUaA4zv9Id6KCJG62srQleG3RD2iSLuegkQ
         vO5RVM7A3MdadypzwTtzkx9AldJp3b6kOwOKD2oID/EirUPBporFmeyCVgMLwpaqO+MP
         sMbTaF73UHRm3Tk7xrAfZeIA5UfSYvWvXi0Wz6cCDPfdDEWCBHIRwnWJouv65wGAFcxE
         E/y2E0J+crmQP66rt5v39yDHVMqoq1lHk7cS4Ojr1FZXGqcfZTwPekUiYjzW2CIe3NV/
         XSyCw4eNY750eWFmFyPCOG0NeoQEwX7YP39yTUrgTUwKduCQWcWj6Qha6oqpfjcZ9UH7
         LVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMKlZ/XsQ/RdDfIxg477G91ZfmGJ9kv/1t3NaSxe8I0=;
        b=QZLd/mFbvcnTwPUXvfQeCjTVN/BjNbw6u9emrhebkDgXy0/YVHvYYPfG8XzBTbCBfB
         ubQnawXET2YzhoJ5emAPUGsqKIp3BOFUKgHbdxII+k/DJRtsIBmEv5rkgDzljyySB9sy
         PZwFjTpQpXs22LiaqWaRGWunZfTGU4fgWA0VhBekxUB/aPxvs1AasYVg2SwyhHIo4Rw6
         v9LCgu+KEe8CvG3pxCyii0kjQfjxGxiDh3YJ4h2gVwEnTy2LwP6D4KO2eb5Nz/ZJ9C35
         zlGnQb5LxBX4SV7+YnzEQ0buz0k94kpDTeTHmU/TSXK+kAhXRshvsnfCuVuYHe+IqqFR
         AxTA==
X-Gm-Message-State: ANoB5pkvJq4P20FSBYrVG3C0fqjdc6BqEwEL7JKAoZ4+oHnjb7e1eALP
        /doeyNBuSH35LuXpB5pMSBhRsfwPaiSimUZ9T8a+F4tQrKLOSw==
X-Google-Smtp-Source: AA0mqf7R+gG44S3wvy6vkMr40xZSszYJhEawjax/JeCM6OoYN/7Mej+y9NKqwfFUnbAf0kJMrJhf99A16SdxVN7YGQY=
X-Received: by 2002:a81:6c52:0:b0:370:4c23:eacc with SMTP id
 h79-20020a816c52000000b003704c23eaccmr25291714ywc.127.1670699457998; Sat, 10
 Dec 2022 11:10:57 -0800 (PST)
MIME-Version: 1.0
References: <20221208143945.50279-1-dmitry.baryshkov@linaro.org> <20221209012131.0054CC433F0@smtp.kernel.org>
In-Reply-To: <20221209012131.0054CC433F0@smtp.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 10 Dec 2022 22:10:47 +0300
Message-ID: <CAA8EJppsZAhqwOcUzWQTh-ePwVWWxpfufaRF9TASTX0LfgUuHg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: clk-spmi-pmic-div: convert to use parent_data
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 9 Dec 2022 at 04:21, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-12-08 06:39:45)
> > diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
> > index f2cf55cee2fd..aa015c51ab4f 100644
> > --- a/drivers/clk/qcom/clk-spmi-pmic-div.c
> > +++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
> > @@ -175,6 +175,10 @@ static const struct clk_ops clk_spmi_pmic_div_ops = {
> >         .round_rate = clk_spmi_pmic_div_round_rate,
> >  };
> >
> > +static const struct clk_parent_data clk_spmi_pmic_parent_data = {
> > +       .index = 0,
> > +};
>
> Why not put this on the stack? clk core should be deep copying.

Thanks, fixed in v2

-- 
With best wishes
Dmitry
