Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 223261D4B4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 12:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgEOKp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 06:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728013AbgEOKpY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 06:45:24 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB599C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 03:45:23 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e16so2962879wra.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 03:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Cd7qB8BAMww/iv9WmCLhIPHREYnAoZQ6w79B6P0E6xg=;
        b=xP+CinPdhHJdBjl9cEQqmu4DEA3UtVXZdBP7jqRNyAo0v9749k2ET+YUkOxJpV8x48
         /zi9CEO2JexEpMGzWxjP+uS7KXXviQr7dpYE8UAf3Yhvjt9YIOIeSMSlQ6arlBHRgllI
         GSyelo7kJIw2le571fQUHCKuHVftyT/NiPioOYLVs6camgsZAbgkYFMSwOu7e0nwDQB6
         a66nTFdjPwh+BuzvO8QOtsWxvH/AFnK4HGT8J7Yxoybk1PSqW7a62ZOMEAodFlT86hS5
         0iw+hj9gW3zvmz1F0DySLxkKplkE60LPynfbBQtp7qra3lLh2Qoqa+pqhfZeVVv8unTh
         Z1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Cd7qB8BAMww/iv9WmCLhIPHREYnAoZQ6w79B6P0E6xg=;
        b=EFuwnQ4159MExyWAlp7QhQLtyk2YbMJbf0imY6h9N2/6o31+46b0NTEJrdmSbWXJN5
         dNFiW/j/JZCVxnemZBgUv3gI4Up9Ulv8gnoK1abFqjKIH3BgN7jvqZB73Zx/Xjhjhj41
         Cma/kkKWUs5wX6nmUG3hD9GGn0rWSzJFOyX50He19hVmqkkLM9+mLieV2qO16cEylTYt
         M1dpHRZ5dPOlgnWs7mEIPYJCVOZTsT4IDF822qUXH3ltchkAgk9bZkQuOMwD4DF5rh71
         y9qWkMpshWh7IF08IVp0PT4ls9b65QYFFunmWju9+wWBnbul7TECsaxuHaBKxaxIG9sm
         BXmw==
X-Gm-Message-State: AOAM531R7Y3oMKHyuV/QmN8SefBOv0B15peAfRumhcDCXk0+G4aFGSeu
        WPgQkfet80kHgezpGH80HYrh8s9TDI8=
X-Google-Smtp-Source: ABdhPJzbfw5o04oHo9dS73R/kDPCPBnMrv+TxxiUYGhV32BiVaTVeZw53f6QhVV5pucVUf2qfhjPXw==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr3533148wrm.224.1589539522608;
        Fri, 15 May 2020 03:45:22 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id b14sm3022482wmb.18.2020.05.15.03.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 03:45:21 -0700 (PDT)
Date:   Fri, 15 May 2020 11:45:20 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] mfd: Introduce QTI I2C PMIC controller
Message-ID: <20200515104520.GK271301@dell>
References: <cover.1588115326.git.gurus@codeaurora.org>
 <5644dea146f8b49a5b827c56392ff916bfb343e9.1588115326.git.gurus@codeaurora.org>
 <20200429075010.GX3559@dell>
 <20200501011319.GA28441@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200501011319.GA28441@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Apr 2020, Guru Das Srinagesh wrote:

> On Wed, Apr 29, 2020 at 08:50:10AM +0100, Lee Jones wrote:
> > On Tue, 28 Apr 2020, Guru Das Srinagesh wrote:
> > 
> > > The Qualcomm Technologies, Inc. I2C PMIC Controller is used by
> > > multi-function PMIC devices which communicate over the I2C bus.  The
> > > controller enumerates all child nodes as platform devices, and
> > > instantiates a regmap interface for them to communicate over the I2C
> > > bus.
> > > 
> > > The controller also controls interrupts for all of the children platform
> > > devices.  The controller handles the summary interrupt by deciphering
> > > which peripheral triggered the interrupt, and which of the peripheral
> > > interrupts were triggered.  Finally, it calls the interrupt handlers for
> > > each of the virtual interrupts that were registered.
> > > 
> > > Nicholas Troast is the original author of this driver.
> > > 
> > > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > > ---
> > >  drivers/mfd/Kconfig         |  11 +
> > >  drivers/mfd/Makefile        |   1 +
> > >  drivers/mfd/qcom-i2c-pmic.c | 737 ++++++++++++++++++++++++++++++++++++++++++++
> > 
> > The vast majority of this driver deals with IRQ handling.  Why can't
> > this be split out into its own IRQ Chip driver and moved to
> > drivers/irqchip?
> 
> There appear to be quite a few in-tree MFD drivers that register IRQ
> controllers, like this driver does:
> 
> $ grep --exclude-dir=.git -rnE "irq_domain_(add|create).+\(" drivers/mfd | wc -l
> 23
> 
> As a further example, drivers/mfd/stpmic1.c closely resembles this
> driver in that it uses both devm_regmap_add_irq_chip() as well as
> devm_of_platform_populate().
> 
> As such, it seems like this driver is in line with some of the
> architectural choices that have been accepted in already-merged drivers.
> Could you please elaborate on your concerns?

It is true that *basic* IRQ domain support has been added to these
drivers in the past.  However, IMHO the support added to this driver
goes beyond those realms such that it would justify a driver of its
own.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
