Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7153F77EF6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2019 12:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfG1KCd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Jul 2019 06:02:33 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38786 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbfG1KCd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Jul 2019 06:02:33 -0400
Received: by mail-lj1-f196.google.com with SMTP id r9so55586651ljg.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jul 2019 03:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dqJPOf3ole/ocwpSBgy0ZOy0oBYIEFe0Lpin0fI4i4g=;
        b=ATSPbECq/2Dk57WgaaHGygsRg1afRoCRLL5jv2+lMJP5BmgY/x/Y6ccmzhGFuwVKwg
         xwU9DQbweCbPfb7SnrSXADgqPsF4lVdP9zsoQZIR9HUy2aUBe9kRKuAzeaRP8UyS5AMk
         E/nPFTLjgD+WnqqqgS9LIlTuZACBvgBZ2mbE3kKlax864d/M+qrTAgzs2yVeVERJ2271
         vMTx/LdiJhVtUCm8ph6Iv01CiTj42iENItK5UUp754dQfQLsmmnchn6s5PWEDbylafvu
         tzJIvhikFsRS+4YtJONZtCO9GD/x/2XIIhvRbjYOLNtS4JRTxi3eNvr/CXHfYiaCnGXs
         LB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dqJPOf3ole/ocwpSBgy0ZOy0oBYIEFe0Lpin0fI4i4g=;
        b=IhxHJ9UqCGIc+lCtlWpyaR8oQR/wMmKR1vRYAzCat/yDZ0N36Fe2K4brPs3sFfT5aI
         qM84FCljkwK10/FwrGUMYQwMRM/iQ58AP2JmzQ2Y6ARI0seW0K7qAkNjRmbRi4PMPiEL
         NHRP36Cmm60s+TJ07McirDk/HDIH5KPrhTFWUexh7qfgEI1gXkqQRkc2lOA0FMKkjipC
         lSOqKaJ3QMo8TqyEtyfdQovtLlrANFjGzrXQYqpSCmaV7Lkimu3K8m4rfn+au3N6+dxc
         YNIwlj3zPtPcAkHbb6zWDStE3UgVR+xBTIWWK5qdmWBWtnxJFkeKuoNWp2LFcGpzZr8M
         nRUA==
X-Gm-Message-State: APjAAAXwZybK0UyP2bew5W6/SrJ9+sjWecf01zT1mPinvlJ5fauM5pZp
        QZRsdPQuwB4MNMF8PKqYHRNNYlv8r9b5vp91jSK/pw==
X-Google-Smtp-Source: APXvYqz6EmJJJTKLfbfJEwbI9boVgwgnhYa+vwRfTg39dxtl7DiKAYb7s7X1xZfaTDAEq8Rul0rr79Hz1LXszhPLgOM=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr32928008ljm.180.1564308151456;
 Sun, 28 Jul 2019 03:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190629125933.679-1-linus.walleij@linaro.org>
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 28 Jul 2019 12:02:20 +0200
Message-ID: <CACRpkdZ-6qBxzTTY4=CV+-ZmnTRPmPNAWrHMb_cMXTYdaNeYQQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm/mdp4: Drop unused GPIO include
To:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Clark <robdclark@gmail.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 29, 2019 at 3:01 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> This file is not using any symbols from <linux/gpio.h> so just
> drop this include.
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Rob & friends: can this be merged to wherever you merge
the MSM DRM patches? If it is in drm-misc I can apply it
but I need some ACKs.

Yours,
Linus Walleij
