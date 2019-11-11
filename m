Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92FABF7075
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2019 10:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfKKJY5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 04:24:57 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35662 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfKKJY5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 04:24:57 -0500
Received: by mail-wr1-f66.google.com with SMTP id s5so2671519wrw.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2019 01:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=YWJNU/KRDci9JaBSSlvjD8ejfPkt5O8bTmBLBv7FEfI=;
        b=g45g1B9CgnICXh+L7YGsSwGItv1VEJKTbuwdGm/cgURZrltl6remdq17TWkf9IQj0t
         2cgaZlsss/2FQVPU4QV83/EZYMXeP4/JM/rzgGquBXWY6tsruKzcr0+SGbVegz+xLLcZ
         WRlkw6voDLEDe2B7TEZryWLFlOlqEbkxvcdq3fjD/vIom2LOugSVjFmrSTEjpHYiyTeg
         jy3QY5TM9aS6jBUdcaYKPjTc07TztHyuCW+skdOtl3zc2svXUOdhiAc53Q5Ohry9vPLQ
         X91mgOIDh2Hy+Xa/MpzmiIpup7RmwG/dso2672x4CVD4Z4HurT/bAG9/az5EB48HKFhA
         5CBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=YWJNU/KRDci9JaBSSlvjD8ejfPkt5O8bTmBLBv7FEfI=;
        b=tZL5FVNa4w/meq3XOiKk34PtLjMZqQFGNPQ5u3UpYfnQ/R0WjH3dgcTDByS7oxsQUD
         5YjZ5mIhkXP+FLtNeIfirGE7v3ko6cfZLN00TA015h0qm5JEv0CGfO24pFUhPlhsuFV6
         UIrlEH6ZU3l2PBOd2yLFORoxK6l2P1XdBMXyqqIQgIdB2pRQY0e5jfCR/lem7hYw/Rct
         0xtCBscGxpK25Ue1XJaB8ErygINqRNF7wBw9sg+PcoskrffJBGAYR/rsXVOAyv8x4nSr
         HkpNmC1KwyfcCLs3TYY8yfUwSAAMvq1ussUR6Ac5m1Wl/82cHq41M7a3b8ouvgpT1hVm
         Pv1g==
X-Gm-Message-State: APjAAAUot2I0YGrI2qmDO7wgcyZH0YtJBHmBb/CgPosAbFVStD4wBaR0
        0JONbwC9FMXpVB+WxJjI8b4DLQ==
X-Google-Smtp-Source: APXvYqxLWSqz1Db3ODg/rszTepYxIenSPrtyAq4nFKwOfdpSCLBq8+G1tD9JlSzHMInuJ7vRBsDVHg==
X-Received: by 2002:adf:e5c5:: with SMTP id a5mr20805012wrn.103.1573464294593;
        Mon, 11 Nov 2019 01:24:54 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id w18sm14019087wrl.2.2019.11.11.01.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 01:24:54 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:24:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Andy Gross <agross@kernel.org>, linux-fbdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V10 1/8] backlight: qcom-wled: Rename pm8941-wled.c to
 qcom-wled.c
Message-ID: <20191111092446.GO18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1572589624-6095-2-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 01 Nov 2019, Kiran Gunda wrote:

> pm8941-wled.c driver is supporting the WLED peripheral
> on pm8941. Rename it to qcom-wled.c so that it can support
> WLED on multiple PMICs.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  .../bindings/leds/backlight/{pm8941-wled.txt => qcom-wled.txt}    | 2 +-
>  drivers/video/backlight/Kconfig                                   | 8 ++++----
>  drivers/video/backlight/Makefile                                  | 2 +-
>  drivers/video/backlight/{pm8941-wled.c => qcom-wled.c}            | 0
>  4 files changed, 6 insertions(+), 6 deletions(-)
>  rename Documentation/devicetree/bindings/leds/backlight/{pm8941-wled.txt => qcom-wled.txt} (95%)
>  rename drivers/video/backlight/{pm8941-wled.c => qcom-wled.c} (100%)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
