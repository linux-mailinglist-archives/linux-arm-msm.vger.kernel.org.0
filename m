Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63662221A9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 05:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgGPDLa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 23:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727850AbgGPDLa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 23:11:30 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A8BC08C5CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 20:11:30 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o13so4142000pgf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 20:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QLoWBC0BJ34kcTABjgpHRAC9g5IOexIa4Kkz6/GXqs8=;
        b=ijalJuL9PGxOrIsrIUwPgLKAwFP9kmsjcYbHNxc+aaEXHPHVEkxRH3D1TxMn6YtWdc
         fJ59p1EBxUmbvlDi6KkjStMofhrvt+csKuX+vs4IRMq89BiKJpFo1Pv+VCZbxIVqSVyt
         1MR3LlWOesnrBBGsGbCIPxBAl385jEJ5PGRYdY9yjUur0FWod5qyRE2EsdVO0mtkdR1y
         EGuy5zC+fPrlDlnH57JJKjUi6l3pS7HtepmEuMBQWrnSAw5QCRELuXsqUaVTdnvNoIrl
         5yPDdkvrtTlungl+Ra/JF7QjuVjtZSSa+aq10gZtIzEzqUspziaFnWYDMwOO3CAOQwTm
         a3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QLoWBC0BJ34kcTABjgpHRAC9g5IOexIa4Kkz6/GXqs8=;
        b=GwxbL1yjidtqbKX7JACghM7s19Opj5qUnttvN/xUZX+qEtUnPuY7fjgG/i1GuxeBYg
         3E4dLOO32RJuEu4ODZEKuojNy6e1IT/HO4TarHLVEFzgxZa2zVXZ9u+pdyeJdeRlpNrB
         K0SrtVJ4xgpv0XBFGGYM09MLgfmQlF53/Iio+vmvTrQKbnsw4a8IteE68+sHCthf2jP8
         FIpIR7tp/V3RFho69vobkNanr+gLyjGwTYy7P8zP+une/qeIDIfcVcESYSt8K+NsIBHN
         QuHK73pV5QSDPb23ZBJK1Je3g6tglX/bbHfCjpqTeHPqufBGA4Amjh9uGkdc5nb+Nr/8
         dVAw==
X-Gm-Message-State: AOAM531H6eaY+T6+RWQARQYJn0yg6AxUDkH1sIOSCTdQhx03c++lX7sS
        IO/Cecfqx6pBJGJqXb1qY5wEB7HY0Q==
X-Google-Smtp-Source: ABdhPJx8qzuAcYQYs9VvKUu35phOkt2EJG4oIBl/MnxUezG+NMCCfUn3ns+lQahCvc6jA5gHENh/oA==
X-Received: by 2002:a62:e712:: with SMTP id s18mr1936293pfh.224.1594869089523;
        Wed, 15 Jul 2020 20:11:29 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d89:fed1:9157:c271:c363:4849])
        by smtp.gmail.com with ESMTPSA id az13sm3165742pjb.34.2020.07.15.20.11.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 20:11:28 -0700 (PDT)
Date:   Thu, 16 Jul 2020 08:41:24 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] mhi: fix doubled words and struct image_info kernel-doc
Message-ID: <20200716031124.GC3271@Mani-XPS-13-9360>
References: <cab64692-31f6-5a2b-a540-aa434d35f9a9@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cab64692-31f6-5a2b-a540-aa434d35f9a9@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 15, 2020 at 06:29:32PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Drop doubled word "table" in kernel-doc.
> Fix syntax for the kernel-doc notation for struct image_info.
> Note that the bhi_vec field is private and not part of the kernel-doc.
> 
> Drop doubled word "device" in a comment.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied to mhi-next!

Thanks,
Mani

> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Hemant Kumar <hemantk@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> ---
>  include/linux/mhi.h |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> --- linux-next-20200714.orig/include/linux/mhi.h
> +++ linux-next-20200714/include/linux/mhi.h
> @@ -85,13 +85,15 @@ enum mhi_ch_type {
>  };
>  
>  /**
> - * struct image_info - Firmware and RDDM table table
> - * @mhi_buf - Buffer for firmware and RDDM table
> - * @entries - # of entries in table
> + * struct image_info - Firmware and RDDM table
> + * @mhi_buf: Buffer for firmware and RDDM table
> + * @entries: # of entries in table
>   */
>  struct image_info {
>  	struct mhi_buf *mhi_buf;
> +	/* private: from internal.h */
>  	struct bhi_vec_entry *bhi_vec;
> +	/* public: */
>  	u32 entries;
>  };
>  
> @@ -593,7 +595,7 @@ int mhi_async_power_up(struct mhi_contro
>  
>  /**
>   * mhi_sync_power_up - Start MHI power up sequence and wait till the device
> - *                     device enters valid EE state
> + *                     enters valid EE state
>   * @mhi_cntrl: MHI controller
>   */
>  int mhi_sync_power_up(struct mhi_controller *mhi_cntrl);
> 
