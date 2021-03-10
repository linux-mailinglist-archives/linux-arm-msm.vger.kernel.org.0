Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F06C334C46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 00:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233178AbhCJXOR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 18:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232571AbhCJXOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 18:14:10 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF775C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 15:14:09 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id e20so8794936ljn.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 15:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gKBkQ4taidvPT+w4EteeOYBoZyJgs8TNZ1BWL29YzFc=;
        b=Na0VWH/+PqDpdj52pR54r6QKfmjl0otFfewiwoGPWY7bV4Z9bvdJxvB0OkE/p4WqfJ
         1v7GHpj/rojgQYPqHow4vDV3l3nt0JFX5yhWqzjg/+CmMAJTE1+OIGfQmUwMKOHf+6KZ
         UtrlflzGefkZwhelEQPKARaUYugjC6Rnvcx5SY1T9Q/OL5di0DReCY2AyCXL4ZMyy51Q
         5MNweZBaJvl7t7l//uP/i/O3bPOv2i3I16HRVT3FLBFaD0O64okVhKuzaTe6+RhoS7uD
         fyXOmvauudfuSfA0bfgNXDanTiFL0dR+742do0LbDv3FlNJtyhGDKw3cDZWQ8fr+MWba
         FFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gKBkQ4taidvPT+w4EteeOYBoZyJgs8TNZ1BWL29YzFc=;
        b=Ny1z72QQGLc1UtLIZYDCZZSoxNHFIbesW2d5c6G7DoaZzJl+KRh9zt9YPuj0Yb56ht
         ck4nZoa+xnw8XGRmmDURJoq0ync9V4rK9yzSBtS6Ad1kuvytfx9TN0+Fb4oM7XKtuvYc
         s6k1RHntFnJPBTsHmp0ztEEqSf8XkE0cXfhSHcJf9zQ0dOwMzbbyOFor71Rip4fPxpuL
         QMZswTHJdJfaWSAad9tFk/RfNf+2xtGRLk3xfrnpTzENzB+4tA7LgmMo9Wwb9D0DziX3
         kY0CtByHufedGp3UGuWq3M2/pU04kGuo+uqz2HmBSvP7FyAqaxbuwyC2atYTU5o08g54
         t0mA==
X-Gm-Message-State: AOAM5300PrYwSiXqiQhQ7BvRJk9sDoi/1G27JJJldtJrzreGdD8dQJmh
        16nEc5gD0OFknWr9Fp/FMv3NpKJnghMomEoMHFUb5w==
X-Google-Smtp-Source: ABdhPJzoH1id55M9n/ktJsN7lcUfkG9Te/mK125L6n6433wa+UhQcuZo680G99PeyNnE2FxpoNANEDpH4kd79XP6jRM=
X-Received: by 2002:a2e:9cb:: with SMTP id 194mr3110524ljj.438.1615418048231;
 Wed, 10 Mar 2021 15:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20210304194816.3843-1-jonathan@marek.ca>
In-Reply-To: <20210304194816.3843-1-jonathan@marek.ca>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 00:13:57 +0100
Message-ID: <CACRpkdYn5sau7f4R3uNJe44nB3704pCQqnp0DysDinW1V=ZR-g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: lpass lpi: use default pullup/strength values
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 4, 2021 at 8:49 PM Jonathan Marek <jonathan@marek.ca> wrote:

> If these fields are not set in dts, the driver will use these variables
> uninitialized to set the fields. Not only will it set garbage values for
> these fields, but it can overflow into other fields and break those.
>
> In the current sm8250 dts, the dmic01 entries do not have a pullup setting,
> and might not work without this change.
>
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Patch applied for fixes!

Yours,
Linus Walleij
