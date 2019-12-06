Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2BA1115588
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2019 17:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfLFQgY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 11:36:24 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38555 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbfLFQgX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 11:36:23 -0500
Received: by mail-lj1-f195.google.com with SMTP id k8so8307240ljh.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 08:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HnJtFpZ6jjWosnNm58PnBnTv4VRgmN3wB8xLAynPWog=;
        b=KluAb/4Mo3kTzHDHB3oCfFJIyJBu6He1LR/O65SLLuUB9MPFPJAiBR0pO+r3CrCW7v
         6YVIYTkVHKctyppN/7wPW8ZYOXmyb0z9UMQB4A4X7m/Y3F0kKJcubdldYDgNxET/Fu1F
         fMDZRWhaTvY+91BOkXyCjg/uuJHFidRBW2L8tZAbaedFND0dVGbqEtB5X5ukXrjy37W1
         3w1JI0dTRUW/nWqofMzbhGACVJyHZg0hTW3/d8o8zpgO7pCicaFf3+CUPBERbyXYseSJ
         erfkuCG93rFUr7pqDa4HllSD8UUDZ13s+T51wrs5CKV5TBKfFzIgi0UllRgHfQqErnRj
         NeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HnJtFpZ6jjWosnNm58PnBnTv4VRgmN3wB8xLAynPWog=;
        b=UjGl0JSpd/jK26/eshvaTJL3RyxGaluhtAY1n21qdQLRzbG/e5tfSZNDhhXmTVolFj
         xHN9VKHMChJzChbbg1fPdQy7gLeqysiN7KUarlSeGCYwOTrWcvBcWE8AiKH7XnikY5Hw
         rAb3oi3nDVBzbbj0vmLLYVrZ/6YicVrVRSqHvdI//zLEMlxRA9X4bx93vb8cTmmIGvrm
         8uL1snIDfEGYHJaFFho5uinNEsu/BJNQay2rZvtY54Tf7lhat8SPo9pGpzfsrYpofWoq
         kM4NqX7zECM+e5Uj/xLPCMPj+78NAtRNN//p+dJg8TornimKX/Xd1Z/mRE4YGoS0wIam
         /sOw==
X-Gm-Message-State: APjAAAVTQX0mvg/ZRaB5DhGcVlSR+j8hlROQTLq/0wXI9qh5NC6TpDKv
        ArATUf1eRi/cGorJMfm+JRZTIA==
X-Google-Smtp-Source: APXvYqwKWoNwsDw4lLlo6f+cwU2nrcz+ksaYea+IvWUnWl3JsguNTfwQAjFoWHJlaoF6xdIzrn9wxA==
X-Received: by 2002:a2e:1f12:: with SMTP id f18mr8959769ljf.11.1575650181787;
        Fri, 06 Dec 2019 08:36:21 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id w19sm6748148lfl.55.2019.12.06.08.36.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 08:36:20 -0800 (PST)
Date:   Fri, 6 Dec 2019 08:32:37 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, arm@kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 Defconfig updates for 5.5
Message-ID: <20191206163237.t4ohf7fviz4ywkck@localhost>
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
 <20191106220406.4aoq5suvwww6c3ov@localhost>
 <20191206050222.GC289401@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191206050222.GC289401@yoga>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 05, 2019 at 09:02:22PM -0800, Bjorn Andersson wrote:
> On Wed 06 Nov 14:04 PST 2019, Olof Johansson wrote:
> 
> > On Wed, Nov 06, 2019 at 01:33:56PM -0600, Andy Gross wrote:
> > > The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
> > > 
> > >   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> > > 
> > > are available in the git repository at:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.5
> > > 
> > > for you to fetch changes up to a36612b7469cf76953cf237a2b9a62f6c97730bb:
> > > 
> > >   arm64: defconfig: Enable Qualcomm watchdog driver (2019-10-20 23:04:59 -0700)
> > > 
> > > ----------------------------------------------------------------
> > > Qualcomm ARM64 Based defconfig Updates for v5.5
> > > 
> > > * Enable Qualcomm cpufreq, watchdog, prng, socinfo, SPI, and QSPI controllers
> > > * Enable SN65DSI86 display bridge
> > > * Enable QCA Bluetooth over Uart
> > > * Enable various Qualcomm remoteproc dependencies
> > > 
> > > ----------------------------------------------------------------
> > > Bjorn Andersson (6):
> > >       arm64: defconfig: Enable Qualcomm remoteproc dependencies
> > >       arm64: defconfig: Enable Qualcomm SPI and QSPI controller
> > >       arm64: defconfig: Enable Qualcomm socinfo driver
> > >       arm64: defconfig: Enable Qualcomm CPUfreq HW driver
> > 
> > 
> > Hi, this turns on the driver as =y, when the option is tristate. Other
> > cpufreq drivers are also modules. Is this driver truly needed to be
> > a built-in for a generic defconfig?
> > 
> 
> I see Linus merged the arm defconfig PR today, but afaict the patches
> from this branch is missing. Please advice on how you would like us to
> proceed.

I think I was waiting on the promised validation of using =m for the cpufreq
drivers and an updated pull request.


-Olof
