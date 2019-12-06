Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B37D115680
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2019 18:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbfLFR2p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 12:28:45 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39354 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbfLFR2p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 12:28:45 -0500
Received: by mail-pf1-f195.google.com with SMTP id 2so3663573pfx.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 09:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pYg4WaewSYxl4/E7hvxWoaqhGSiMuoN2AMdqqblwD1I=;
        b=OhNEObPQprG+BMiYBmvy8Vgv59VBLOp26wdu+gfSzY1V9hZ7XrNKNWboHj+JjU9Z95
         Gnt5xKXEt9dC4gl2g7fRrII4QS1WPOmIZN4Y1Yy6Iu4wxhftD25X1RNNsUKU5mEn8qOo
         X1e/6jUixgcELBsD/1NAc3enOCntPmTCiDG3GT+1CzfbW45yWH4LwSzvUcjH5O1Hoe3C
         0XAtLtu8+qn+tnBfS7w1AbfBmUdRmpngDC1AEkneiW3nRmAvAIvYtGA+rfLVxQfnnAgR
         286d+gXZAyIbZFSy44/xg80ShWH/4Eg3auyHNnyW4tITlEiOhdVx9ohrTZM7cPja4lNy
         AwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pYg4WaewSYxl4/E7hvxWoaqhGSiMuoN2AMdqqblwD1I=;
        b=ZMwGhn1engy+Ia4xZJQsX5UJfBra8ilKCUZ+6aOgapS+h/w9aRkgwNhJiAt+O+IgjW
         naACKhLFkowKC9iieoKKO0L6Tao1MCBMMp1n/Wd+v4w0s1PZd8MoYhnKI7AOIlmQc8r1
         ymwx5Fo/oP9ecFZkIn7MI044rBUU4IqMG89rtr9rv9rOGygYhiqRJaECgsUuohEuuSLO
         jlFt0sc+RWkYyz3kp+XfT5yYhVrsJE71WJ3PxxRoOsWqepVU59MQ7SUh1QTfuTyf0Naa
         Ibtg1xR2bdy7/gBK1G5jozkT+dK+g/1i9fJSfxZbAI1H/2TNKzwYYIM56DXzaXuJEgGR
         DUwQ==
X-Gm-Message-State: APjAAAWrVztFN/rLwyd18qS+QTXKpJxkgcTT8qymucSCAWWruPIVVmTw
        Jz8vF3pStId/JQfPe26r2TCQcQ==
X-Google-Smtp-Source: APXvYqyq7iz4wtkQUNbqVjPFpRs/B3Rx/PJOGMbVHuA7E7amQYm+Hc9G8fpaaA87q4T3AE235JNkyA==
X-Received: by 2002:aa7:870c:: with SMTP id b12mr15682376pfo.82.1575653324580;
        Fri, 06 Dec 2019 09:28:44 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s27sm17332406pfd.88.2019.12.06.09.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 09:28:43 -0800 (PST)
Date:   Fri, 6 Dec 2019 09:28:41 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Olof Johansson <olof@lixom.net>, amit.kucheria@linaro.org
Cc:     Andy Gross <agross@kernel.org>, arm@kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 Defconfig updates for 5.5
Message-ID: <20191206172841.GA10830@tuxbook-pro>
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
 <20191106220406.4aoq5suvwww6c3ov@localhost>
 <20191206050222.GC289401@yoga>
 <20191206163237.t4ohf7fviz4ywkck@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191206163237.t4ohf7fviz4ywkck@localhost>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 06 Dec 08:32 PST 2019, Olof Johansson wrote:

> On Thu, Dec 05, 2019 at 09:02:22PM -0800, Bjorn Andersson wrote:
> > On Wed 06 Nov 14:04 PST 2019, Olof Johansson wrote:
> > 
> > > On Wed, Nov 06, 2019 at 01:33:56PM -0600, Andy Gross wrote:
> > > > The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
> > > > 
> > > >   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> > > > 
> > > > are available in the git repository at:
> > > > 
> > > >   git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.5
> > > > 
> > > > for you to fetch changes up to a36612b7469cf76953cf237a2b9a62f6c97730bb:
> > > > 
> > > >   arm64: defconfig: Enable Qualcomm watchdog driver (2019-10-20 23:04:59 -0700)
> > > > 
> > > > ----------------------------------------------------------------
> > > > Qualcomm ARM64 Based defconfig Updates for v5.5
> > > > 
> > > > * Enable Qualcomm cpufreq, watchdog, prng, socinfo, SPI, and QSPI controllers
> > > > * Enable SN65DSI86 display bridge
> > > > * Enable QCA Bluetooth over Uart
> > > > * Enable various Qualcomm remoteproc dependencies
> > > > 
> > > > ----------------------------------------------------------------
> > > > Bjorn Andersson (6):
> > > >       arm64: defconfig: Enable Qualcomm remoteproc dependencies
> > > >       arm64: defconfig: Enable Qualcomm SPI and QSPI controller
> > > >       arm64: defconfig: Enable Qualcomm socinfo driver
> > > >       arm64: defconfig: Enable Qualcomm CPUfreq HW driver
> > > 
> > > 
> > > Hi, this turns on the driver as =y, when the option is tristate. Other
> > > cpufreq drivers are also modules. Is this driver truly needed to be
> > > a built-in for a generic defconfig?
> > > 
> > 
> > I see Linus merged the arm defconfig PR today, but afaict the patches
> > from this branch is missing. Please advice on how you would like us to
> > proceed.
> 
> I think I was waiting on the promised validation of using =m for the cpufreq
> drivers and an updated pull request.
> 

Sounds reasonable, I would however like the CPUfreq driver to be =y;
there are several other drivers doing this and lately work has gone into
ensuring that this driver probes as early as possible.

In either case, I presume we would change the =y to a =m in an
incremental patch, in order to not have to rewrite the branch?


@Amit, have we done any validation with the SDM845 CPUfreq driver built
as a module?

Regards,
Bjorn
