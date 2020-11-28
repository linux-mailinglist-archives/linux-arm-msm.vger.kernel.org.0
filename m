Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5A7F2C73A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389222AbgK1Vtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732132AbgK1S6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 13:58:05 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C52C061A53
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 22:01:06 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id w16so5901882pga.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 22:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kiBkbT9YXPZzsVCxaVxoAdpOVrSi2iNZZGGCeHdBJ7w=;
        b=Ric6EViNNXM58y8VLcYqVvlgFmFm6+boSX3mkpFgUeTASYiAesvcFJGwDbDEo5VgAZ
         0uyIcS/mJBO1HNfep3M8uiqAZXUkq2C2tYsV/7NF75Tll64sMeZd3cfYpFD9rAa76hUR
         1N8po2Pp7MbMXpi3suy76U3IOq7clkAhWLDYwfQLPSRTv7tIm8JEXh6lsvy6smUDqIz5
         iAmJqA6thwWuuGqK9ttVKKLib4hTYvSFJw5TSo+N5TVsfcSQgPksrKjAnN8Uj4w5XVjW
         8dCguM2Y3UJJtVT795yctgb/ghr4cI3fxBEUBveKdOCostWM8RW3vQ8A+Gl8mAEcKXlS
         lfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kiBkbT9YXPZzsVCxaVxoAdpOVrSi2iNZZGGCeHdBJ7w=;
        b=C1buNO8qwzmOA0asbcdXL0WB0g4M2cvDBmJno/svPfRABw7KM9G0JFaPP2NGstJ1UQ
         jeF5CKlU3R5IfWoLN/RjF4RZ+4lWAZr4PyhiVZZLyQIyEZYqHq98LydUjKT64D/IbRwJ
         Aebr/mRmpXMTtRn/6ahrKKnBCZYfVlFkLMUaP23mpGb7DhU4ulHMUyqJPI4bIzcCbREM
         C4v3WD5R+ueD+uw17/Pktjv1IZ2P+P0tmBTxdhVh3bRNcOmnm+LX+EnuKLeiMzeDcgzd
         Lr7ywYvYUX1dLpcRgvfTQYaXgJMgH1vZ5jtz2irIvx0j3/qXvPRExZANuSdgDSFBGfeu
         YpBA==
X-Gm-Message-State: AOAM531Xm8pKAg7xPjlZoBVVJd43DjeL6hgCAlX4vbXxtt8gZ9jrvt3I
        FUlA/F3/hS+qus6HeETLrFsuTkLVMTFK
X-Google-Smtp-Source: ABdhPJyyeSt6nb9z1XoVKt1P9pf4Qu3RhVLt0/XXew1qWQdezfnQpra4RakP/dTaYaG4T/DRezAStA==
X-Received: by 2002:a63:a1d:: with SMTP id 29mr9473137pgk.162.1606543265003;
        Fri, 27 Nov 2020 22:01:05 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id v145sm9051639pfc.112.2020.11.27.22.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 22:01:04 -0800 (PST)
Date:   Sat, 28 Nov 2020 11:30:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v3 0/9] mhi: pci_generic: Misc improvements
Message-ID: <20201128060056.GG3077@thinkpad>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Nov 26, 2020 at 04:28:58PM +0100, Loic Poulain wrote:
> This series adjust some configuration values to ensure stability and
> robustness of mhi pci devices (timeout, number of events, burst mode).
> 
> It also includes support for system sleep as well as a recovery procedure
> that can be triggered when a PCI error is reported, either by PCI AER or by
> the new health-check mechanism.
> 
> All these changes have been tested with Telit FN980m module
> 

I've excluded couple of patches while reviewing and waiting for Hemant or
Bhaumik to do their reviews first.

Thanks,
Mani

> v2: 
>   - Cancel recovery work on suspend
> v3:
>   - enable doorbell_mode_switch for burst channel (HW)
>   - Add mhi_initialize_controller helper patch
> 
> Loic Poulain (9):
>   mhi: Add mhi_controller_initialize helper
>   mhi: pci-generic: Increase number of hardware events
>   mhi: pci-generic: Perform hard reset on remove
>   mhi: pci_generic: Enable burst mode for hardware channels
>   mhi: pci_generic: Add support for reset
>   mhi: pci_generic: Add suspend/resume/recovery procedure
>   mhi: pci_generic: Add PCI error handlers
>   mhi: pci_generic: Add health-check
>   mhi: pci_generic: Increase controller timeout value
> 
>  drivers/bus/mhi/core/init.c   |   7 +
>  drivers/bus/mhi/pci_generic.c | 354 ++++++++++++++++++++++++++++++++++++++++--
>  include/linux/mhi.h           |   6 +
>  3 files changed, 350 insertions(+), 17 deletions(-)
> 
> -- 
> 2.7.4
> 
