Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94291F2272
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 00:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfKFXSJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 18:18:09 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44850 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfKFXSJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 18:18:09 -0500
Received: by mail-pf1-f195.google.com with SMTP id q26so339971pfn.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 15:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SGORRswerRGgZb83hhOx9ckaLWQ0QPtRE4RCzu+hdLs=;
        b=tKEGBKrCAbJWIHkSwrtRTiliUEyei4XSN1ZjV8jbmJcFB3P/OJmD9diJXPu1CvIWOo
         AmmAan25C3+lXhDFEGLH0Kd99GTm1xcCxrzZN/ZFrjfPw9hOMylVxdbasInyfqNCPd/6
         L8VfQ3OxlMvWvbTC5NNuwXvuE7sxoVx5BE0PrpH8ANkm9wgim6ZF2nMaJnRc8VZi/+F6
         qXkJSQ3VptgcymL/7mbgqX3yaRPXHaIMDE13mx+7Thzl2qNi9UdZ+iM66REvdLXKb/Np
         RfYHMKYvG7wuDKGIemHFpT7u2LM0QrU9krqyXzxFuv0DP2fE9vL712Q58MNN24caFx4r
         n+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SGORRswerRGgZb83hhOx9ckaLWQ0QPtRE4RCzu+hdLs=;
        b=RXCueJr2c6STE4Mr87Hxj7Of/JevRAUZR8cvhAebznngYqIz8dMVb1FT+oQWht8MxS
         +qMz5hFEhgQxf4ghN0D+ecEyiKKAm+mqrJ2ppNMBVnWgPBqJcnwocmYE5RTuYqGm/OV2
         RTSoBXhVtI5Tlu70lSBRK69+cGMZ2hWvwzfcOZp3YKTZfHW3sLeFkga6+sIty/CXi7f2
         0UaDfLkvO2PdNs4g3XwUk976XJBa7SO6loGlzto4yihBgX0ZI9PjB9H0ojVQ2WbikoTT
         suH+LDUFjX7Zk8e7Ze/xFRy4iUQX4w8b4no6gYD7XtOIWYL4BciHWCarINzW3xS3/84Q
         pqsA==
X-Gm-Message-State: APjAAAVAynL1A8hLgTUozsLHg/orxSzXNhSWVWHwIJg2+HgGTMaJeZ45
        VJ0TIYXPhdYlm7Cz0IpjIJXVKA==
X-Google-Smtp-Source: APXvYqxcy59hYgCqEMdh0JBfNeEqEneqe1WlmaAkMHqGuw6K66Fvgkuiq+8L6PvH68RDPFvTbDoUHA==
X-Received: by 2002:a17:90a:a409:: with SMTP id y9mr605399pjp.106.1573082288563;
        Wed, 06 Nov 2019 15:18:08 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 137sm49565pfu.173.2019.11.06.15.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 15:18:07 -0800 (PST)
Date:   Wed, 6 Nov 2019 15:18:05 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Olof Johansson <olof@lixom.net>
Cc:     Andy Gross <agross@kernel.org>, arm@kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 Defconfig updates for 5.5
Message-ID: <20191106231805.GG36595@minitux>
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
 <20191106220406.4aoq5suvwww6c3ov@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106220406.4aoq5suvwww6c3ov@localhost>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 06 Nov 14:04 PST 2019, Olof Johansson wrote:

> On Wed, Nov 06, 2019 at 01:33:56PM -0600, Andy Gross wrote:
> > The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
> > 
> >   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.5
> > 
> > for you to fetch changes up to a36612b7469cf76953cf237a2b9a62f6c97730bb:
> > 
> >   arm64: defconfig: Enable Qualcomm watchdog driver (2019-10-20 23:04:59 -0700)
> > 
> > ----------------------------------------------------------------
> > Qualcomm ARM64 Based defconfig Updates for v5.5
> > 
> > * Enable Qualcomm cpufreq, watchdog, prng, socinfo, SPI, and QSPI controllers
> > * Enable SN65DSI86 display bridge
> > * Enable QCA Bluetooth over Uart
> > * Enable various Qualcomm remoteproc dependencies
> > 
> > ----------------------------------------------------------------
> > Bjorn Andersson (6):
> >       arm64: defconfig: Enable Qualcomm remoteproc dependencies
> >       arm64: defconfig: Enable Qualcomm SPI and QSPI controller
> >       arm64: defconfig: Enable Qualcomm socinfo driver
> >       arm64: defconfig: Enable Qualcomm CPUfreq HW driver
> 
> 
> Hi, this turns on the driver as =y, when the option is tristate. Other
> cpufreq drivers are also modules. Is this driver truly needed to be
> a built-in for a generic defconfig?
> 

linux-next has 7 CPUfreq drivers =y and 3 =m, so I picked =y for the
Qualcomm by majority choice. And the same driver is used by a number of
different Qualcomm platforms, so the growth looks to be bounded.

It should work as =m as well, but we would need to validate that.

Regards,
Bjorn
