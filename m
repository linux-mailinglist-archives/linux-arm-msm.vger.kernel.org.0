Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F36875B055
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 17:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfF3PSy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 11:18:54 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37374 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfF3PSx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 11:18:53 -0400
Received: by mail-lj1-f194.google.com with SMTP id 131so10469669ljf.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jun 2019 08:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HpE46Z6NWvdrS3lUw3ggCLBRnMjBwHHDcERIdjH6Lfc=;
        b=lNA5GC01Ut8STwziDZJ14QDg5Jkz1OhXo58x/jpwiIA94v/qDZQmIz+rShADdD7LZb
         kGPohCC3lRFssrv01dW4Dmve6RPDWLS/ngQD+NbljIYFzrUXUcNFcIqz4s8S1DX8iJC+
         okLacsbZggc128MbinPna6eeiBhSAYZsCNsGVeKTPuWVCZ3qepp0k/konAKzRPlE6+a3
         iUnK/JBW2jnHjiHjetqnfPwqYGUTIWoHcUtSMYCqPggUVTmgHQKp8rTXo2qteSu7Z7qn
         A5k9mr7LF23EoJvk9qC1eJ+1+QxefWLMLG8m2WztyMBKAhTr2CdoZwwpoWOMNMNnMv4v
         ZbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HpE46Z6NWvdrS3lUw3ggCLBRnMjBwHHDcERIdjH6Lfc=;
        b=GSV4jgz0OE8qsuM+23+fR266BHm1flMvM0V/FTdoNMfF5BAD6Adyp0LKoVUrMtxEkz
         dRdOWHWJ4i1oPry6nljMSf5UPjmhFWepYYgnTKfO+FgFknbEzCozcDk7DZhfhAMf0cvJ
         SiCVCd5W13YsiM+UV8rElnIxf2bLh4UgBSmdEnEoa+zi2piajKyIIETwYHVEYTZWxdvK
         vPP4hnzpQ8oIX2Pg4qAggv3STHdk+QRWEcMq/XND34Ddkw/mY0+GbOZ9+sIHalL1KM/a
         pWUfdHIR5uiMl9cY93GXFmm+Mg4cFPAOpZKhpM1OWhkDbIzKIF1y1NjMWZ5GASulty9V
         SCWQ==
X-Gm-Message-State: APjAAAVGrgs8CdcrlysOTC5X8OQnhdSVk6I57DuYy144M1ddvoqFaknn
        svTFcuZ64QgoGgInsmLQxzSxjZW2Io+ZDUOc7QxDm7gg
X-Google-Smtp-Source: APXvYqyKV3l5gyErMxjKVpfAN7k4MLE/7m4iA8/iiX3NkTUuMtONgnsOIROJ+Gi3Fplauela34cwa52JNx/MRP7FH2A=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr11621890ljm.180.1561907931835;
 Sun, 30 Jun 2019 08:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190629125933.679-1-linus.walleij@linaro.org>
 <20190629125933.679-4-linus.walleij@linaro.org> <CAF6AEGun2QEMVyO+L3W0UJubgzVPrFr5jkVoTOwHpy9b4MeJMQ@mail.gmail.com>
In-Reply-To: <CAF6AEGun2QEMVyO+L3W0UJubgzVPrFr5jkVoTOwHpy9b4MeJMQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Jun 2019 17:18:39 +0200
Message-ID: <CACRpkdYAmVSiUQozgCvaNe_X1hcmhAzeApQcSxdhWC_wg0tdsg@mail.gmail.com>
Subject: Re: [PATCH 4/7] gpio: of: Support some legacy Qualcomm HDMI bindings
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 30, 2019 at 3:26 PM Rob Clark <robdclark@gmail.com> wrote:

> I'm ok with this.. although I wonder if we need to try this hard for
> backwards compat?  At least I don't see any upstream dts
> using the old names.  Maybe it is ok to just look the other way and break them.

I am usually of the opinion that if a tree falls in the forest and noone
is there to hear it, who cares what sound it makes.

So we can just apply the other patches and not this one, which
should work just fine. It will support the variants of the
bindings ending with "-gpios" or "-gpio".

Yours,
Linus Walleij
