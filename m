Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E91C26A094
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 10:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgIOIV6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 04:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgIOIVx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 04:21:53 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43977C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 01:21:51 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id bd2so951648plb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 01:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YI23JIiAx/yAbJk7ESH/yeS1S6/uWMelgMnCd+huPiA=;
        b=nGaaSE+9YN6RrZMI8oT/ME/GtyogXfwhZPlnb2Y75Y/Fcpg1oReJ1g+4FFpqaN6qsM
         sx48aM2795+4DoaFUUtaCQj0cFBpeKcovhCifKHy5NfgSO/K8Wg6jGTEN/55ZootC6uf
         MGnluWeapywcxF4ZonkGvYxpKLCHKsKRz8SX2xjJZ6sRrWSReaWb8nJ6q8c8AAHxZe+u
         0oDYaqAsIfR0Hz/9NAulJAfkxmI5iHs6MzJZWNWPnyk5x2ND5NbkiSlghCB+6Rsa8HUu
         Lq9mihwXYBzj5fte3NNcZt4R5w+o6dgXqaHKspEgowP1BEf3OFvKAVA0HSpCSlfD4o1K
         9Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YI23JIiAx/yAbJk7ESH/yeS1S6/uWMelgMnCd+huPiA=;
        b=YAPKPTexD2TXKFKmyZdqj7RqjAgHUEBHLJr0YPrnxF7jFD4MREaHHBwkt0bYDRFuYa
         AAF3pi++COxUf8X1cDjONPWkp2Fja5L0sMvovTCVrMZTGg/XPn4hxaAuFwOE0x2OwSYi
         2wnAetf+TollHN9nk7fovSLDLfjmSW3j04+ihdPFPaIo9Yhnyi+bMG8xaMfteKgkFvrO
         Ce9IvQ1ssFbn3lD4NyYu1S/viF5pQ7jZw4Zxvk9OErvYYgd5HyLQ0M4Wqe4M5rLREyyR
         3Cr0mTI/Xr8/cTjjJxEonNbfNWqEVfTBT4KdEdKL4io0Ux3rdMIME6c1VcBzyVC7kVxH
         71fw==
X-Gm-Message-State: AOAM533NchXpM5cTKbrJ1x291qL85QqvA7owM0LW1179NPTugHJtXd6G
        QNBPHJhqS6H2QJq5hnmo/iys/52zckJht/I=
X-Google-Smtp-Source: ABdhPJzlAf1vOGk/Wgkl4oQzUiVAKsJpTak466qiI9yV4CsekwJH5n7HkPjUdL1DNk3q1KTh8U8Oew==
X-Received: by 2002:a17:902:7089:b029:d1:e5e7:be13 with SMTP id z9-20020a1709027089b02900d1e5e7be13mr709240plk.70.1600158110767;
        Tue, 15 Sep 2020 01:21:50 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id fz23sm11540788pjb.36.2020.09.15.01.21.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 01:21:50 -0700 (PDT)
Date:   Tue, 15 Sep 2020 13:51:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-arm-msm@vger.kernel.org,
        Hemant Kumar <hemantk@codeaurora.org>,
        Clark Williams <williams@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] bus: mhi: Remove include of rwlock_types.h
Message-ID: <20200915082144.GD12395@mani>
References: <20200915074816.52zphpywj4zidspk@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915074816.52zphpywj4zidspk@linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 15, 2020 at 09:48:16AM +0200, Sebastian Andrzej Siewior wrote:
> From: Clark Williams <williams@redhat.com>
> 
> rwlock.h should not be included directly. Instead linux/splinlock.h
> should be included. Including it directly will break the RT build.
> 
> Also there is no point in including _types.h headers directly. There is
> no benefit in including the type without the accessor.
> 
> Fixes: 0cbf260820fa7 ("bus: mhi: core: Add support for registering MHI controllers")
> Signed-off-by: Clark Williams <williams@redhat.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Applied to mhi-next!

Thanks,
Mani

> ---
>  include/linux/mhi.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index c4a940d989121..2b4ed30d47294 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -9,10 +9,9 @@
>  #include <linux/device.h>
>  #include <linux/dma-direction.h>
>  #include <linux/mutex.h>
> -#include <linux/rwlock_types.h>
>  #include <linux/skbuff.h>
>  #include <linux/slab.h>
> -#include <linux/spinlock_types.h>
> +#include <linux/spinlock.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  
> -- 
> 2.28.0
> 
