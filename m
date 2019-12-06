Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40BC8114BD2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2019 06:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfLFFC1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 00:02:27 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42549 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfLFFC1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 00:02:27 -0500
Received: by mail-pf1-f194.google.com with SMTP id 4so2704075pfz.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2019 21:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U4Lcf6OzjK9nHXk3oZTWYhDlkvR9rdJR4Wl3wSLyGro=;
        b=qj/d8D9KI6xRGYKEQ+Vq0h9kmJIL1AKFwocLZa2hfCKDv8jrieiUvCEROLIM+d5Juq
         J5qwPq6ztIP/hCk6mbgE7qgJ3vOVr1tjgR2DI6JOezi5sOAdUM91PBJiPfiYtc0DzZwe
         9Rhu8iN9XmZURwZgZDLhqr0HZqaYy2B+GVLykfJFCY/SKtrA2sXv4Gw7TQHcHOYQTcJc
         P76BW+P856GdQQmfNZZobPLuR54fSkrR5FOtpfVuww/p4+NbaqClak4xN3btVL+gFpi3
         G7dj2RNCKh9l8jREiLmefxL8zZwA/U11RbJpVIse87u1XdBH7s6Uil8lLHumoTA7Fv6Z
         sQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U4Lcf6OzjK9nHXk3oZTWYhDlkvR9rdJR4Wl3wSLyGro=;
        b=RdLOyJ9taeyEAqGaHL4m2RtomBLH+nSbh/5WlXYXWUMwTCo1ZPxHH+K5QyxS4zXAOR
         oJssS+bTMcUwIpqYy7AAI2AzqD9fnVa3Uhtl0nk8Cd12iQwRltjPLqG5BF7avnXl9R0J
         j1v7kJ+Oz3u4JC3PR5EwMqg4S7jPm/7ABzqzxUFNfDYwPvsihwSVFLS/hx3v6HGMQzHB
         D64j+I9rXMARIKoJdE5O/rpwjib6UeIgzkcOfsBDWPfz6GF+17eUyA9SDtdG/QSCyeMQ
         RhLRgbkiECUTa9Mc8+9RErjIBjyYcTToTN7fM0bVYYI5vDhj3t+dSqNW9lG/LZyPVFhg
         FaLg==
X-Gm-Message-State: APjAAAVIgZWhSOpfYXQ9MMYD32+dhG5sHOlJpaPW9ZChKSWYmhF/uxci
        uDoZPOKMihWswoW3T3z52xbJ2g==
X-Google-Smtp-Source: APXvYqyGIC+8KPPt0G9cZQQRc1DGQeGGAWvehzmEKSWMFhU3kqQXiyPa1VFb9dKGGld5b5TznRyh7A==
X-Received: by 2002:a63:ec0a:: with SMTP id j10mr1487160pgh.178.1575608546072;
        Thu, 05 Dec 2019 21:02:26 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q6sm14341478pfl.140.2019.12.05.21.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 21:02:25 -0800 (PST)
Date:   Thu, 5 Dec 2019 21:02:22 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Olof Johansson <olof@lixom.net>
Cc:     Andy Gross <agross@kernel.org>, arm@kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 Defconfig updates for 5.5
Message-ID: <20191206050222.GC289401@yoga>
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

I see Linus merged the arm defconfig PR today, but afaict the patches
from this branch is missing. Please advice on how you would like us to
proceed.

Regards,
Bjorn
