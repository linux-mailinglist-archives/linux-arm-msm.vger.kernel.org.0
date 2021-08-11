Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7923E9221
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 15:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbhHKNDs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 09:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhHKNDr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 09:03:47 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8042C0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 06:03:23 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a7so4406830ljq.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 06:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zuMFwAVD6fY0KArmeR9wSduaNs/aEjUW6qkJa3ECyv8=;
        b=TCpUp5F1rIsu50ljO5tUd8VYmUjjBPVQQXUGND2l8iThkPszFllIURH2d9QO5Kp3wr
         20hdUcM+6Mq2hwT8/HawHY7iF3d23NShYFzrA0yQTxhpIVWNWG6J4+mwqwZRds7vSWkn
         ryr9QAZapCb+OCy9ATaGG5pWUNjSb0zXfOsY4sGS9wEDMP4gMGMuPjB4EBZbhBJ4ZJau
         qYXAq8dS5PbHEiyDb/SNZ+os+lZI8mkwHbsYaFgwJ+E7cCOvstIh2d3ZmcSjmxSrk5tr
         XZ0kwT+zphh3jDjsZruTgmXrO7y+kZ3ssAa6Yha3uKi5GrbF+U7p13/r2FIWYwnzAxBW
         aX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zuMFwAVD6fY0KArmeR9wSduaNs/aEjUW6qkJa3ECyv8=;
        b=q5BCyzJhXSAz7gHtnf+mcVLsUS7Se74ACGC+Fxo3gdXHJy8iNyQEjd4QiJOqb7hAT9
         MFRJYhPNBb4j5yJHteJmUpdjmQo87ZCDCjtvaFOPwA55YLe3VUUWVFVoN61O4zuCDBRZ
         3LOs9LRutTkl09SFtCJs17QT0NLjzwLv8CCKaFJnbn+7P1AX89UkyLymQ3mrN5Xw9aXG
         2vPWvMa8deOwPrKP9AwJj6OrNTqMuZOH8hc8VO5YIQBorpjh/dK8BKb7Bu8vtSYYnMh7
         zJtyUnTsQUonPAECCOleuLB8S9ERHE9m+I627NhiTU3i01Ef5f5tyLaZZptHCogpznjg
         WzTw==
X-Gm-Message-State: AOAM533ccV7uBkIM5CU6FVD5wheKjxyPGLUjX3xpzhqiSa6zv7FjRgh5
        kzDh92cz80i0XLmryg7xubLIZpVrR8Y2B4Bgo5YDoA==
X-Google-Smtp-Source: ABdhPJzx+NlgiIZnomfYiB8/G4LgCd6WP6GFsrtvbCL30ZLORab4/n85+ZBn2rA47FR1ujRI3K0kFKlULjuaBeSQo5k=
X-Received: by 2002:a05:651c:327:: with SMTP id b7mr23695765ljp.74.1628687001676;
 Wed, 11 Aug 2021 06:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210805222625.40236-1-konrad.dybcio@somainline.org> <20210805222625.40236-2-konrad.dybcio@somainline.org>
In-Reply-To: <20210805222625.40236-2-konrad.dybcio@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 15:03:10 +0200
Message-ID: <CACRpkdYm_Ky+D5=rhX9gekKYZkTXwvS-FGED_Ou+_0=nEGZUUA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom-pmic-gpio: Add support for pm8019
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        Martin Botka <martin.botka@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 6, 2021 at 12:26 AM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:

> PM8019 provides 6 GPIOs. Add a compatible to support that.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

I will merge this as soon as the binding is fixed (please resend both)

Yours,
Linus Walleij
