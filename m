Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028B227A5FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 05:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgI1DpJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 23:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgI1DpI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 23:45:08 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46E3C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 20:45:08 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id m34so7096358pgl.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 20:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+sYbS7EwWqFM5qiEO+nz0uVts4J0a1ndqME5esSXwmI=;
        b=spF1juPvcIHT95yJdQPJgw0rwf6PD7NH0XwQVfiZ4TvGFuacfOXymk7Adv8f+DZkCp
         hajaQILVdqIuyJgoTHAH0I69sj1LRlc5OmxZ4glPaYC/FSG7N/DGv4DALKcLp2V0KQmy
         I0ot7Ne++NA9EGDT22j/3UZ7r2MpW8XpcbkLH9JJVURjwbihWmmpDpPecQdErU7A6K15
         dw2SKY+0tUjDouCEOujpZO6Q0luDiWVO50j+jAfAVF0gJtZrVZ/d/NWQMzPxXaDB2l74
         EVzFU/uwnhQsl1uW5aB4M8IjxemVPn0an9BQU7f+0gWY6dcFArhNUSGIRmozcpuIajqy
         A03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+sYbS7EwWqFM5qiEO+nz0uVts4J0a1ndqME5esSXwmI=;
        b=RiSulHjkuYN5rAe6Fp0Fv1YM1Ao0WzxgqIk6lb9T31+b6J1LOccmnhPp8fKh+Nfq//
         1JpoE25Arw31BxNDQcDrEb6NRreyk9yaM4LOo2lzU2MqSLRWSGohYjnta4qHVr9bkoYB
         KscjGO6oOhYlHmKDJnbMHeU0xOTv1gxZXECNsmFSwfRP19tYWwHe1Ifdc2FgHBcZq/+n
         mvkWdzxs+BqYlB7HaQ5t1/qqaqrrdCV15ZZaTgoOMNlhiYDthsyNpXzN8opg9MT2cAxT
         ChZTFcuyXEEsabIlw9WMFeQpJrJEA3y2ZV8gF0Oh/fpH9t3TUXOazKxTyT6GDDRXdHCK
         3PfQ==
X-Gm-Message-State: AOAM532SyB53QBEHaSx7r7OWBDHaJyZd1AIWF5AKGkztbo/bBAW4hTUj
        0oV6LyoGOZQe/CDWHMpa3a9j6p2mPfux
X-Google-Smtp-Source: ABdhPJz/ektcg0F0w5QQJsofwbKiimEl5cBXP5l4TTbaXyAUUPmEPzBLtDdt2ztBHBpebAe7+uwL8g==
X-Received: by 2002:a63:8f18:: with SMTP id n24mr1579765pgd.209.1601264708301;
        Sun, 27 Sep 2020 20:45:08 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id l141sm9790784pfd.47.2020.09.27.20.45.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Sep 2020 20:45:07 -0700 (PDT)
Date:   Mon, 28 Sep 2020 09:15:03 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/18] bus: mhi: core: Fix the building of MHI module
Message-ID: <20200928034503.GB3605@Mani-XPS-13-9360>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
 <20200921160815.28071-20-manivannan.sadhasivam@linaro.org>
 <20200927102233.GA87283@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927102233.GA87283@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 27, 2020 at 12:22:33PM +0200, Greg KH wrote:
> On Mon, Sep 21, 2020 at 09:38:15PM +0530, Manivannan Sadhasivam wrote:
> > The Kbuild rule to build MHI should use the append operator. This fixes
> > the below warning reported by Kbuild test bot.
> > 
> > WARNING: modpost: missing MODULE_LICENSE() in
> > drivers/bus/mhi/core/main.o
> > WARNING: modpost: missing MODULE_LICENSE() in drivers/bus/mhi/core/pm.o
> > WARNING: modpost: missing MODULE_LICENSE() in
> > drivers/bus/mhi/core/boot.o
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> What commit caused this problem?  Can you add a Fixes: line for it?
> 

Sure, will add the fixes tag!

Thanks,
Mani

> thanks,
> 
> greg k-h
