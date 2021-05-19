Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F9D3892C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 17:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241453AbhESPhl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 11:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347685AbhESPhl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 11:37:41 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE0B6C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 08:36:20 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id z85-20020a1c7e580000b029017a76f3afbaso1048668wmc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 08:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2k1RQcHuqE3d5DTNLm7iPcGtCR5pGOkRkdI9x42tRhc=;
        b=YDsCNb9nXIZW+RCd48mBEbQPVZ838svVhqV3ByPzilyBN7EM0FhjLOM5EfqdXGNnrY
         HC0yiBLobWxEDqDlq9O8EhhIcThv7XpDaZAgD7YNDn+33K84zjzdBj7AOj3ueA3e2EU1
         Tqb/DQDY9WGgN5HbI0eEKds/X8L7fY+3aBvGMotjv+kiSQT4OgTiSP+5ndTqm9WpWKEE
         SEmUDP+5u5s49yUwKT9UtfZZ/5mHde/8W2Ru5EY6QGXgiXEsfvRx2q9XinbbGd1ycxIG
         mA+qxA32aTEnQ7aEhIlC2Anjqw+S2vNeKZdyTcnOhwzh9AVIGC+Ft4E4Mx/onPmJS1Vs
         tW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2k1RQcHuqE3d5DTNLm7iPcGtCR5pGOkRkdI9x42tRhc=;
        b=f51LShB9eV8uVPxVo+yy3m2PkzMcCvZFMRrR7SOqv1h+lmcFCSK15WOBmBCFDvVCra
         ThxrcdFj9MMx2xQUBCeU1hL96b001RtsNc+3nYojD/9Gmlhq3v4h2+4uAVuiev3+w+iD
         UTzXos6voP7MxuPQ3dv6NKL7x2lFYOIE9sLDgI8TdO06R7grruAYctl11hMi7HsoWw0L
         jqOQD3bwVl+YTbWWbxyQbLgmwWUTKBF8BIUccK24ZfRYFaN6Ebq1BbDSajb6Exxn0vgs
         1rkOrLvlMjFq3m66J0RZDvx5YY/IrMfNjW4POOGgrvWUf6iwPnEtftrf/ZyJnbzWK4Eb
         qMSA==
X-Gm-Message-State: AOAM531p5F31ptpVdkkFJsqmWJJqjbU0+IyJbuLRIyiNX3Nea7nlRYUB
        x0965sjZ6QxZsUVLW8C17IxYrwe4/X/da/UIiW0=
X-Google-Smtp-Source: ABdhPJw7lVf5a1fGFQ2vWFsdurmPB6vtBSIqVFcGs3b6A4LYd3tn0YtkXaSVD/mhMaaNiLkJWQdOHn5x+Yo+vDjATUM=
X-Received: by 2002:a7b:c012:: with SMTP id c18mr11855157wmb.94.1621438579254;
 Wed, 19 May 2021 08:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <aff4807e-e554-2e32-5789-dfaf65128a8e@connolly.tech>
In-Reply-To: <aff4807e-e554-2e32-5789-dfaf65128a8e@connolly.tech>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 19 May 2021 08:40:02 -0700
Message-ID: <CAF6AEGvnL9mOp3vKuSvz=KDijtFVMdKCF4BXSLxXeoR38O-SUg@mail.gmail.com>
Subject: Re: fw_devlink breakage on SDM845 / a630 with DSI displays
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     saravanak@google.com, John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ some more folks and msm list..

I suppose I didn't hit this because CONFIG_FBDEV_EMULATION is not
normally enabled for CrOS.. but I'm not really to familiar with
fw_devlink

BR,
-R

On Wed, May 19, 2021 at 8:26 AM Caleb Connolly <caleb@connolly.tech> wrote:
>
>
> Hi,
>
> Since -rc1 I've been hit by some DRM breakage in freedreno which happens
> when fw_devlink=on. It seems to cause some clocks (rcg) to get stuck and
> break DSI displays, here's a full log from the OnePlus 6:
> https://paste.ubuntu.com/p/8kPx4nFGF5/ (that is with
> "deferred_probe_timeout") The PocoPhone F1 also seems to be affected by
> this.
>
> The display will still come up after pressing the power button a few
> times, although it will be incredibly slow.
>
> It's worth noting that the issue only happens with
> CONFIG_FBDEV_EMULATION is enabled, I've previously required this to see
> kernel logs during boot and general boot splash with postmarketOS.
> Without it the display will be stuck on the bootloader splash until I
> press the power button and cause it to update once UI (like Phosh) has
> started (though this has been the case for quite some time).
>
> I'd appreciate any help with debugging / resolving this issue, I'm
> afraid I haven't been able to determine much from some brief digging.
>
>
> --
> Kind Regards,
> Caleb
>
