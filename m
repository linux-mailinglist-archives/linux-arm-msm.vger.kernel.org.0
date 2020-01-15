Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCF713BD4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 11:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729712AbgAOKXb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 05:23:31 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38210 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729631AbgAOKX2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 05:23:28 -0500
Received: by mail-lf1-f67.google.com with SMTP id r14so12288320lfm.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 02:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0kDyGOaxaI1GMqThNHth9V/5VSfUUwVFewl6E0xy0nc=;
        b=E4jE3An78Ex2CgQPVi5COQjsp0vDCZeW6pA72WOdA+dPszIB5smmk5ZEh4dswC0+er
         OwY2CCBnl8JnyoX02lSRZpLJK2slg7BhZGnfdOXQwQN9j/Nro48Xxg0+Chv3rwmAm5Mi
         KXIfKiTiWjOg3GKkjypiRFqPKGBWBOWc3wP5bfSNKDgTRWafDjGWwvNGaXdMMVtZ0pwy
         viXP7tzxMcPo7JTth0XG6xK5L5A71EcSTOdGLMhHbmfsg7LPtruMwMMJR+kDpLKT8cg2
         rdPsl9+BkssxuDwNvACevxoT4h3y7ObHKDLDGl8vSgBhdVpG7QIuvsQIP7Z7+oEQnjkR
         20aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0kDyGOaxaI1GMqThNHth9V/5VSfUUwVFewl6E0xy0nc=;
        b=i/crVR++4Z5HR/ZT5B0s1MwbWHHsEb7SvBZXOmYP/Kt20ahVb72GKKxwPTi7y3vPRa
         C4UFzpH9lZMXx3+94W29LokfUkif6FsW7vGkXONo/oetlQua5vh2pbdHtFu5j/F1NTyq
         06NczcrAGhG+BgyLWXUM0ijXnXcvYfAxFAgTL61HwBWgOS0/SmOA9IK3/rThsMD+6nQh
         u4ZCBUR/TwUtde0iPKN+YlJSa+saIZZH7ZB/0CySqG4UbqVEbumIW0fNoznPUvW26gl4
         ydtCjqO7beD1LYW67ej+SbLF0bD6pHs6IWu2O8NqOmL+mtCMOWpDkxaxVekQ30sQmDhS
         GUlA==
X-Gm-Message-State: APjAAAXgaJQg5gClx19aC6r9EMeVo+QiNEw2tzxukgpYHwmCGaT6lDC/
        ZwataPCYJP+1VrCIo0wymGI2smXKAKr0usmQiyIxcTgRaSw=
X-Google-Smtp-Source: APXvYqzoH/cbCUM9WkqwMpVkWL8950Zqu8b72maR4cxbaUVrgqLDgiiLP876Lez3Tc1YvlB2kW9QJ7yqo7qN1cw9djc=
X-Received: by 2002:a19:5513:: with SMTP id n19mr4126113lfe.205.1579083806398;
 Wed, 15 Jan 2020 02:23:26 -0800 (PST)
MIME-Version: 1.0
References: <20200114231103.85641-1-swboyd@chromium.org>
In-Reply-To: <20200114231103.85641-1-swboyd@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jan 2020 11:23:15 +0100
Message-ID: <CACRpkdbzqeAo9+muiTez3PjSLS3-pCocktFe2Lm8tDMVzSnr4A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Set lockdep class for hierarchical irq domains
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 15, 2020 at 12:11 AM Stephen Boyd <swboyd@chromium.org> wrote:

> I see the following lockdep splat in the qcom pinctrl driver when
> attempting to suspend the device.
>
>  ============================================
>  WARNING: possible recursive locking detected

Thanks Stephen, patch applied!

Yours,
Linus Walleij
