Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9AB1415463
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 02:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbhIWAF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 20:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbhIWAFx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 20:05:53 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935F5C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 17:04:22 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u18so18403101lfd.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 17:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sa3iqWTO0RSINxC6pdN7sv6Khz55kfHyIbBdNZkvBp4=;
        b=OTFX9ZJLD5vh0fKJTVOUpE2Zrv1mtIFUZoxaIdu+/Z8ekt3vtoHq9DfqyPDOQKM5Qp
         fm0X/JKT4FZ+fNpYGrHe9kjjBLdkS6IVFbyBOk72qtaYrWRSTXFOXejvI92QiP1yP9lI
         1eqx0xpNNdQUBZmNQO7wNm6OcyF1UNTl3X0d9/nD156HuE77iYWDaamArGvrq4Zmn5wC
         R66btAiYOjOXDOQuJqKzo6iiyvDbQN/+NpipWY+SRMGfTCuPMGeiQGAreEv3Cw6gObqD
         OBIF3UNpZkpHDxHxZgzHO5hy7cvH7ODAiy0cd9soNkLOsjjtEnB0vqvMr7buHSxQZmfk
         mHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sa3iqWTO0RSINxC6pdN7sv6Khz55kfHyIbBdNZkvBp4=;
        b=1fr3DkFKEBNIj7ITwHCiT/UAUMmNMtFUad5EosK6hjd65yqgm01w0ptTC2BBL/8m+R
         e4wx/IZaWWBa8PRmnQM1N3hybUsKzLdQTvgPPV4vj+oyFmoAyB0Pg7SRvf7yuxefwzrn
         T3UueYTa2aNTEMHptoszO2mc+zupZQg9/ZyAdhjhdQelyPGHvFwkAYu0m5aYMK/tO4gG
         9RmlM8Nh+OF4ujKe5MeD2LPHgN5DQrrnVlw+swusctB8EAej0sFadc5wBwDt/HMpH88f
         JKHNGAadPPZrp/WJFHMehtNS27I/FqY3b4E2dTuKTewOFVljBO8gl7V7HBJwT/y39HXp
         wHfg==
X-Gm-Message-State: AOAM531IF0+/NGMqWFroTlD/m1KpbxScJlHn1cYNbO+VWXQhhL1mLdgV
        IUg1nYCidj4xPRE0SY5D3yZJazSutMhP+rZ5bPOH2xfyVj6Vtw==
X-Google-Smtp-Source: ABdhPJwsRrPN9D5ir08pDg3q5mLEmvyUxXdigIoSb7uBDAMPrKXkSs+VHrXem7+1aFU6lGf2cgBHR3FPOw9sGQqHh4E=
X-Received: by 2002:a2e:4c19:: with SMTP id z25mr2083292lja.145.1632355460966;
 Wed, 22 Sep 2021 17:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210921162433.1858296-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210921162433.1858296-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 02:04:10 +0200
Message-ID: <CACRpkdb15D0m7L-vO7RFcAaVuS7hdD8J=6=15TFgRgvvsw1e9g@mail.gmail.com>
Subject: Re: [PATCH] mfd: qcom-pm8xxx: switch away from using chained IRQ handlers
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Heidelberg <david@ixit.cz>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 21, 2021 at 6:24 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> PM8xxx PMIC family uses GPIO as parent IRQ. Using it together with the
> irq_set_chained_handler_and_data() results in warnings from the GPIOLIB
> as in this path the IRQ resources are not allocated (and thus the
> corresponding GPIO is not marked as used for the IRQ. Use request_irq so
> that the IRQ resources are proprely setup.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I sent this patch:
https://lore.kernel.org/lkml/20210819154400.51932-1-linus.walleij@linaro.org/

David Heidelberg reported that it didn't work for him.

David can you test Dmitry's patch instead and see if that works
for you, I suppose I could have some bug in my patch :/
It would be nice with a Tested-by from David.

FWIW the code looks good:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
