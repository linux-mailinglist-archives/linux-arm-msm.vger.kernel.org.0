Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8566911FAEF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 21:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbfLOUCS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 15:02:18 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44872 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfLOUCR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 15:02:17 -0500
Received: by mail-ed1-f67.google.com with SMTP id bx28so122975edb.11;
        Sun, 15 Dec 2019 12:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Eb9PaeS91fFId6JoOrDL2h8mYp/pNovUb3BQNtXEkY=;
        b=l39CyODrigrJr//o2nlMDiXSW3PPVc3PNwlifzyBK9+ZaFT4yW+61K18suZPiJhZ4y
         9P3RWsUKzrow2krjPjWnJ02+xHox/C9gDf14LyZW1OFgJI+HljebzeklvQer9KNO1zN7
         BcjQA+gomciH5LFjv8vu03ZwAVOc5ZmY2Z3zFOrGLMC5DFAd+chfQIPFEl0IH2t3Sh9T
         r/HLEqDrH3pPwBIFHlDmFMtNYiRSkT7qxSe6qZXZ8j7KDSP+vqedTca2cqLQBSu3a/zm
         UIF6u2zSeOoCxqxCVF9/8OMen+aV2r3X1AMH6CBA6CXNWKUMiMU7TQXatxoBG1aLR0qd
         D5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Eb9PaeS91fFId6JoOrDL2h8mYp/pNovUb3BQNtXEkY=;
        b=osH78/WeXVo/jYujIfbc+hHj74kvySi/Eusmo7fpq253HsgLdur2szz0OcNalXsrIc
         VWYSO/A3QtiVXTJ+Vnb5sW2p7LgOwPZfbqIm3dEUlY8ImC8EYOBlyRaszEgD8I5Nr70H
         aMfGTEnKygpvIZKWbzvH13mi0LSUSix8cSwy0luh+Qmsy4RmImq6Xa2jXJyMaz4xidVW
         NNid0gzgaqoUF53gxTLuxse+4vS2nwtUlJM1xUIxN1rKY9MM/e9hUpuQ66jCTx8gSDkm
         GQetuB0RRerDB3lvE9xfu+n54nwubAxPJvWN6gzOaq1erwLfCBGyyda5sBxu3++49VnK
         oNGg==
X-Gm-Message-State: APjAAAWrkkWSojD4zezPCD9dEPuKc1c+GG7+6I54nZBDSMfTHevZmahI
        h2ckSBntBb7kmRNxstg2v08tD+IF+3NxI/n41yg=
X-Google-Smtp-Source: APXvYqwXWuftMyTU+v9pDTeFceCDJh7oOC80IPG6kupreczCdmilrRrpGU30V0yDNxarQZ4IwUA5DCbL3g36OxTBcSw=
X-Received: by 2002:aa7:d80c:: with SMTP id v12mr16528373edq.302.1576440135503;
 Sun, 15 Dec 2019 12:02:15 -0800 (PST)
MIME-Version: 1.0
References: <20191213234530.145963-1-dianders@chromium.org>
In-Reply-To: <20191213234530.145963-1-dianders@chromium.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 15 Dec 2019 12:02:07 -0800
Message-ID: <CAF6AEGusg19F-=m7k5JDQDdr4xAT1By--5FicM_iuKcFRCfMdA@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm/bridge: ti-sn65dsi86: Improve support for AUO
 B116XAK01 + other low res DP
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 13, 2019 at 3:46 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This series contains a pile of patches that was created to support
> hooking up the AUO B116XAK01 panel to the eDP side of the bridge.  In
> general it should be useful for hooking up a wider variety of DP
> panels to the bridge, especially those with lower resolution and lower
> bits per pixel.
>
> The overall result of this series:
> * Allows panels with fewer than 4 DP lanes hooked up to work.
> * Optimizes the link rate for panels with 6 bpp.
> * Supports trying more than one link rate when training if the main
>   link rate didn't work.
>
> It's not expected that this series will break any existing users, but
> it is possible that the patch to skip non-standard DP rates could mean
> that a panel that used to use one of these non-standard link rates
> will now run at a higher rate than it used to.  If this happens, the
> patch could be reverted or someone could figure out how to decide when
> it's OK to use the non-standard rates.
>
> To support the AUO B116XAK01, we could actually stop at the ("Use
> 18-bit DP if we can") patch since that causes the panel to run at a
> link rate of 1.62 which works.  The patches to try more than one link
> rate were all developed prior to realizing that I could just use
> 18-bit mode and were validated with that patch reverted.
>
> The patch to try more than one rate was validated by forcing the code
> to try 2.16 GHz (but still skip 2.43 GHz, which trains but shows
> garbage on AUO B116XAK01) and seeing that we'd try 2.16 GHz (and fail)
> and then eventually pass at 2.7 GHz and show a pretty screen.
>
> These patches were tested on sdm845-cheza atop mainline as of
> 2019-12-13 and also on another board (the one with AUO B116XAK01) atop
> a downstream kernel tree.
>
> This patch series doesn't do anything to optimize the MIPI link and
> only focuses on the DP link.  For instance, it's left as an exercise
> to the reader to see if we can use the 666-packed mode on the MIPI
> link and save some power (because we could lower the clock rate).
>
> I am nowhere near a display expert and my knowledge of DP and MIPI is
> pretty much zero.  If something about this patch series smells wrong,
> it probably is.  Please let know and I'll try to fix it.
>
>
> Douglas Anderson (9):
>   drm/bridge: ti-sn65dsi86: Split the setting of the dp and dsi rates
>   drm/bridge: ti-sn65dsi86: zero is never greater than an unsigned int
>   drm/bridge: ti-sn65dsi86: Don't use MIPI variables for DP link
>   drm/bridge: ti-sn65dsi86: Config number of DP lanes Mo' Betta
>   drm/bridge: ti-sn65dsi86: Read num lanes from the DP sink
>   drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
>   drm/bridge: ti-sn65dsi86: Group DP link training bits in a function
>   drm/bridge: ti-sn65dsi86: Train at faster rates if slower ones fail
>   drm/bridge: ti-sn65dsi86: Skip non-standard DP rates
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 230 +++++++++++++++++++++-----
>  1 file changed, 187 insertions(+), 43 deletions(-)

I've given these a spin on my yoga c630, which uses the same bridge, so:

Tested-by: Rob Clark <robdclark@gmail.com>

I've got one small fixup for a compiler warning for the 2nd to last,
and with that, the first 8 are:

Reviewed-by: Rob Clark <robdclark@gmail.com>

I've also got a fixup for the last one which reads
SUPPORTED_LINK_RATES.  However the panel I have is pre eDP 1.4, so the
interesting codepath there is untested.  Not sure offhand if the
panels you have are eDP 1.4+ or not?

BR,
-R

>
> --
> 2.24.1.735.g03f4e72817-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
