Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9B21F4FCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 09:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgFJH5o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 03:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgFJH5n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 03:57:43 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4699EC03E96F
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 00:57:43 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id c21so902262lfb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 00:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0KyoP79CsKr5AT7aKPpGNvSLAzpD8FQ9m1dHvM/WUr0=;
        b=QpPET0xCUQTnBo8sa6xbnJ8D/8aIwjrpMM3eQHGQvdqhEe6XAQZRTlGGtSwBAAVw1O
         CtPTV0skN31lu01Djp22/ZHJEAfA1Gzl8bi+bnSo8BEbFlkDw2CNuvtZl/thHE0z/gPg
         1qsD6oggAf62tE4B8Nd9Y+UaSX1F4evj1aQ7K7id2nHosPq6kUgw5EpeNBB7lJVH4xTg
         XyJKOFP3We62xACTICfhirm9zAdyvSFscr2vHLfCLf7uDq+I94sppk84YPEy70Z7X/KX
         3RTJJP+qKfLdEcjKHy5nzcqD4gyyHMHUMYxYP+aRxqYJKip4fDw2mYmQfQdCvTFNq3Dv
         MfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0KyoP79CsKr5AT7aKPpGNvSLAzpD8FQ9m1dHvM/WUr0=;
        b=VpyHt98/XcqlBc8Zf5EbmlWKdRVDRfwqKaMqaOjAPmlIKM2eMEJY3FtYkbhmPaLXzm
         eZSBljHASz1d12eX2J4ZzJgCS8Jcak6FX4bUbXMbkuhcaPk+t63+ImA/jOs0J1hU3En0
         ZwYj9cZQSctMY2K13yTJwiC9dvjZp/iFRKG4Hi7reicq79WYBE1ekRbhcR29v3ZwQSlF
         ozWqq49R+jiOtPt0Yfn+3EbSm4r1DtJ2v31+lUXsJx2FtQOGnc3VQQwTerSnPKBZY6P6
         hspStx1Q48p1YD021MwJDfXohp075BoyYlYcqXxj1UI+ZsTK4n3sSDvMIqK6jqyiUI15
         GIHw==
X-Gm-Message-State: AOAM530Azwd4TfsRSy3j+aJBybIPPGcWuLJZzzJdSaHTFSVp2UchHEtU
        6nhath49rZow/ULfvIwIK/3DPcSMT/WGEzfK9CqAXQ==
X-Google-Smtp-Source: ABdhPJyp19NYX18/LcwZHQGRy2EwAvHrg7uVVDnSTzR8wy+N/7ZSuVfbDKsiF9pG3pZk0xyBsnAmlG3Kd0+6ExKV6Fo=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr1018533lfn.77.1591775861710;
 Wed, 10 Jun 2020 00:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200604002817.667160-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20200604002817.667160-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 09:57:30 +0200
Message-ID: <CACRpkdY5gqO24=-R=QZuvXgYvpv4noHwTrfCEJC=bdnZb3iQ0Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: fix warning about irq chip reusage
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Patch Tracking <patches@linaro.org>,
        linaro-kernel <linaro-kernel@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 4, 2020 at 2:28 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Fix the following warnings caused by reusage of the same irq_chip
> instance for all spmi-gpio gpio_irq_chip instances. Instead embed
> irq_chip into pmic_gpio_state struct.
>
> gpio gpiochip2: (c440000.qcom,spmi:pmic@2:gpio@c000): detected irqchip that is shared with multiple gpiochips: please fix the driver.
> gpio gpiochip3: (c440000.qcom,spmi:pmic@4:gpio@c000): detected irqchip that is shared with multiple gpiochips: please fix the driver.
> gpio gpiochip4: (c440000.qcom,spmi:pmic@a:gpio@c000): detected irqchip that is shared with multiple gpiochips: please fix the driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Patch applied.

Yours,
Linus Walleij
