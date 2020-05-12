Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925691CED65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 08:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbgELG5X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 02:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725814AbgELG5W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 02:57:22 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B20C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 23:57:21 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f15so4993007plr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 23:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xESt8YrdF5zA7OhTRZwQ+JJUIra4yQxemc2O867l028=;
        b=VMRbs0PHQWvOftRxUJW++79cw5PG5idWx50PkcZn+aKCIc29PQ60fCbNcQgFUNVVqk
         sdyIhki9WgY4wPnBnzXgJcOw69bSpnxwWWVQzpxPmYKuGEhSlR0vF2bnH2H0AGK7c06I
         d5X/wrA1QU/fshcMRO+pBIePVhV1NEO6W69zMuA3jj/U5N5DC7yckl3AGb4nZigsWzwP
         tT38ovAl+wpb68X/jPpChDDVu8QUBI3kaDX6tdm4lMQM+PZDWA3eKYeoLERgcPBFrDDG
         fLAQHTtX5B9ZatTMWnxQ6upKLw5az7B7ZJ5Pyg9lB+a2ZZ4fXfU7MiAimZurPAXbPiz2
         utWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xESt8YrdF5zA7OhTRZwQ+JJUIra4yQxemc2O867l028=;
        b=lv8u6kzeNbxcVfmm7gmErnvBTlFJ4Sxf8JpgPuYuJE/VGIR6q398EJ0R3FYO1EivaV
         zKzxlv3pV7QRxUSFHDfcCxhvsA5B2JfWnZ3Ru9ylBbKqMNgCGSw/eyaxs7SD06EtU++g
         kFC4061thNkO5wcNosn+ZvyfrbOXr4HVR7pg6BPJXGG8Nq+sfM2/SpMoYmxJd0ura7oI
         cKR44jsU0NrhGaibmDE6tgGRcdFR87AZicCGC/ED2C1v0sFoQtC3iqejHZHyPEJefjDo
         yPQUCPSL4GwqRvJQVQhaRG5xQn3k6ZSaxh0x4niOOM9Jw0wHVqcjEeOk2CpoN7zkBiJo
         uPfw==
X-Gm-Message-State: AGi0PuaIVbblAVtHp1TeX+gJXzuuOyEHSOmaDg8gBkmj4qV0sn1Xbhow
        TuwM5BdqzsSY9eFwgRMcfH9O24385g==
X-Google-Smtp-Source: APiQypIdRl4nB/2mZFYqstDYIZKg6KAQai2y8tkp/VYwtSTyd5EaZqNMdtCSHUciPW9Ml8VDxxqTwg==
X-Received: by 2002:a17:902:930b:: with SMTP id bc11mr19040031plb.2.1589266640847;
        Mon, 11 May 2020 23:57:20 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6007:2f23:5151:5dd:ea86:4678])
        by smtp.gmail.com with ESMTPSA id n23sm11709667pjq.18.2020.05.11.23.57.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 23:57:20 -0700 (PDT)
Date:   Tue, 12 May 2020 12:27:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v1 5/5] bus: mhi: core: Handle write lock properly in
 mhi_pm_m0_transition
Message-ID: <20200512065715.GG4928@Mani-XPS-13-9360>
References: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
 <1589248989-23824-6-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589248989-23824-6-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 11, 2020 at 07:03:09PM -0700, Hemant Kumar wrote:
> Take write lock only to protect db_mode member of mhi channel.
> This allows rest of the mhi channels to just take read lock which
> fine grains the locking. It prevents channel readers to starve if
> they try to enter critical section after a writer.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 345f197..de5abb2 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -288,14 +288,18 @@ int mhi_pm_m0_transition(struct mhi_controller *mhi_cntrl)
>  	for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
>  		struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
>  
> -		write_lock_irq(&mhi_chan->lock);
> -		if (mhi_chan->db_cfg.reset_req)
> +		if (mhi_chan->db_cfg.reset_req) {
> +			write_lock_irq(&mhi_chan->lock);
>  			mhi_chan->db_cfg.db_mode = true;
> +			write_unlock_irq(&mhi_chan->lock);
> +		}
> +
> +		read_lock_irq(&mhi_chan->lock);
>  
>  		/* Only ring DB if ring is not empty */
>  		if (tre_ring->base && tre_ring->wp  != tre_ring->rp)
>  			mhi_ring_chan_db(mhi_cntrl, mhi_chan);
> -		write_unlock_irq(&mhi_chan->lock);
> +		read_unlock_irq(&mhi_chan->lock);
>  	}
>  
>  	mhi_cntrl->wake_put(mhi_cntrl, false);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
