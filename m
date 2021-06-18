Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971EE3AC759
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 11:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbhFRJZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 05:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbhFRJZv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 05:25:51 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC313C061767
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 02:23:41 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id f30so15590607lfj.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 02:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zUmaAdhvpCE8rTi8Nu21lM0leDt0J+C5lHTAMCRYdmY=;
        b=Px4mkWvksGAe4XErN0YNWZAu3VO2QDBQBRJ6C6S+BjDtcGkiQ4MeYp2NSzWb/E01V/
         2ogun+mOFHugk8lFwz6+BrHmax4HKlmlvXpEXfWvc/mGBAhyQM6jvP333WhMYODzsa16
         YymPuLhJD64brpUHQbE5YMyR2KFdUtz7Fu5QXSMCf41NdZeCwRKjgL5jBnKqun55ND8Q
         VtxHUbtufK0PAtHJ6hFJ+iQujI/6ONwIUkGf3aHwO/VCoGD/Ynqk6x7xajEz0NMxY1D5
         qFHTBCJTawXnBxwutXyMjyduAGeyjCTyD5IJ2wpEqpO8ji9rQFuv9kk1JHXVWmZNeIDg
         G4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zUmaAdhvpCE8rTi8Nu21lM0leDt0J+C5lHTAMCRYdmY=;
        b=HwV3+zaOKfWDApjBL2F04iAZPdPSCNBbxqMFX7ia+sDT95KGkjTmipnPL8WqLfru05
         pc5vN3pBUdWb+hhXOMm8xycT/b0gPGIwQHKL78fBktyhIKV+HVHejiDBF/YyaQDi8+ch
         cXvDOKL2arREJ93AKkSHa0KXVb21XvFnRJZExGQ3TzmiXB1JZI4FJl7sZVSW6o5XivOt
         hqWZhVj0sS2N62vW49S/IjvpTI0SIDth6vSMHc9swUenrGUf8w2XI73+eXmcvPjRRF/A
         qSTqrEEtjh3TSdK7iERHVoZcEkGetJOLeb660QcUTmHBbNC+zMxxxsdlfv9OKfsjOWD/
         w4kg==
X-Gm-Message-State: AOAM531mkk/PnY3BTljPLMs6vVYKBtzz9pMR6JFLOIiUOT+SsBk6s+NI
        16UiEO17NIy/mU0vgzffxsTJLH20BYRdxMENDVJYuw==
X-Google-Smtp-Source: ABdhPJylOphVSuNKFsbcLlcxR0J/hdcDmlDJGNN2iITcAv1mAOg0RrezfzSnr1lvVBcUTFMUmgahGNc3x5RgUoVgjxc=
X-Received: by 2002:a05:6512:2105:: with SMTP id q5mr2364148lfr.649.1624008219992;
 Fri, 18 Jun 2021 02:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210614172713.558192-1-martin.botka@somainline.org> <20210614172713.558192-2-martin.botka@somainline.org>
In-Reply-To: <20210614172713.558192-2-martin.botka@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 18 Jun 2021 11:23:29 +0200
Message-ID: <CACRpkdaYjskpgUUkJgHu9jjwDY7sy-EMcmpU6pNmJVp7mu861Q@mail.gmail.com>
Subject: Re: [PATCH V5 2/2] drivers: qcom: pinctrl: Add pinctrl driver for sm6125
To:     Martin Botka <martin.botka@somainline.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
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

On Mon, Jun 14, 2021 at 7:27 PM Martin Botka
<martin.botka@somainline.org> wrote:

> This patch adds pinctrl driver for sm6125.
>
> Signed-off-by: Martin Botka <martin.botka@somainline.org>

Patch applied.

Especially happy to apply patches from somainline.org, keep up
the good work folks!

Yours,
Linus Walleij
