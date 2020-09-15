Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111CA26A080
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 10:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgIOIRm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 04:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgIOIRa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 04:17:30 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04D6C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 01:17:29 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l191so1589307pgd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q8hZUxMfC6QzbI94w+e8uygY2k/qOVVeR+DE0efdgOs=;
        b=qPiRNq+bngOudI4UpUdUn6/w1pG7U/4czZvQWPx9KQodMl7k2hZtQ0AC6YXETHZu6C
         1wjO9h4a7IQ8K4OwQmNl3/bC4rlvTWk/Cyw7Xo5r9Q1js6W5AHzvPOYGv+h3NrQh0M5b
         i1rpjucVFvvWlYAYOKv+8DavgpQtSZFTJCgutsTiO3DQF2i+3DS4YVaeZLrxtKVUmQck
         RSrtxh9eZEAd1ObVDAbtlMuO9tYsCpZB3dmF1sd2ueV3nWFw0mlFRTXGdQMJdtQqkZ4L
         VulWFm7uUgWD4plJAk22BlisHH2BTWiteBWricBEBg0hRoZtD1UaTkdYHz3hfMsj4E3Y
         osCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q8hZUxMfC6QzbI94w+e8uygY2k/qOVVeR+DE0efdgOs=;
        b=QuxZicaMB+F0o1c7c8cHZBz6TaTsYeg+ygG2uWlgtRZQ/zqd6eMridIV/+9f95UInC
         AaWHeafseSPXva+NqvzrGEFMImbYInXOoCxwamXeWbMWH42GP2R17PLx8Hl0QCmY/k4h
         opPmptHR0TJmoVvO1cvn1dddoiofTG+ovMMud/Sx+oIWYgdaBm2QZLw+7maudeYhHIMC
         1Pz/RhEPKFdRr6TpRxdsrQ+C9CI89peZgcmj8VS2a0mcVrzPaUDvDSJgxkZX5lDBaczZ
         iKH9bNqXpK6/g26EewcU8HEnMuzw7CKRqd/zNQQE6V3/HYDigxYm/bppKvb7azQ5ObcD
         NhPg==
X-Gm-Message-State: AOAM533i0Ca51NYknqwMR2D8vPu9sl2I/K3Zu4CLbHIbPQWJHakOPUxl
        8z6ViWD3ReT+POY97RqjvIEu
X-Google-Smtp-Source: ABdhPJxX/3IjHAT8z7LVmRWo0emh5jsnu5tqgwJvLw226xjLGhprD8lfrHeyueDO8KBHKd4csSVRhw==
X-Received: by 2002:a65:5bcf:: with SMTP id o15mr13609551pgr.126.1600157837672;
        Tue, 15 Sep 2020 01:17:17 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id h14sm13331726pfe.67.2020.09.15.01.17.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 01:17:17 -0700 (PDT)
Date:   Tue, 15 Sep 2020 13:47:11 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-arm-msm@vger.kernel.org,
        Hemant Kumar <hemantk@codeaurora.org>,
        Clark Williams <williams@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] bus: mhi: Remove include of rwlock_types.h
Message-ID: <20200915081711.GA12395@mani>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
