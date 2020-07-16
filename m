Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206A3221A75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 05:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgGPDBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 23:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgGPDBb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 23:01:31 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14100C061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 20:01:31 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u5so3002035pfn.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 20:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GPQxbwTXWhN79V6vWRx99MB+RvD215vLIPI8oltDITs=;
        b=QNys3f76fO3ArkQ+U5VKCzEsVFzThuhz6zGESkCJzCWv48Hn20rX6sbrqvMiXZmH0h
         8emf3+hAUEec4VwlSjakOG0ZUQPpWEeV9RtlnZANPtzBQS6jsTwfcZfrgODHToJBAU+Z
         QqZeqmpnSva1PaQhCQQpBA09o98pUGKIp+fZPLuk8pg3PaEktGanlA946ErEkY85CTqh
         XtBI9FpHu75vBCj+mchEeC+5UUJKIu1ZxDJbfnJLXhnRvAhMtuvdM2RNyyKiAYkkNUG7
         u1hBHZ+lNeypvSgt3AdCzOm6aj27OjOqfmedqtH96zkcJAzS+QhbYYy1UgU7zy8VpdVw
         duAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GPQxbwTXWhN79V6vWRx99MB+RvD215vLIPI8oltDITs=;
        b=nGK+dk0VzljKbGmlNZVfXc4r+9+T+4LpiQoYn1Nd/H/duJE5uLHhmtaehCIou7kjFH
         p00sE95qvswpqW6ZgFpGGEtDhOrx2HZ3IFNf0cItZFRLD9sUFa8ryEmLtTydj6zpgJB7
         kHcJSAzHxaFfj+Q19mn7GlR7VtabHW5USZuhFgvJp8mTyoUwUj8iR9ekZa4x4KB8yo1q
         VisbLeiYefiLwdlkjmloVKcxfAwJChfdm9bllxGHstq9hjF0yhpzrD0DHAKoEeEcwGRB
         2BzYa8mRfjdZbKWPK9NfxwyQUC2py2qOEMJriiC7RDEDAhDzf09l+jLkZ6qczNHsJoec
         JXPg==
X-Gm-Message-State: AOAM531Q6/+b73EmoN1LRtUeUNycKqaeD1K2TxV8DgGV37taIl188ihq
        CgLUnbfJqW+0vDAcDFFcwA+6
X-Google-Smtp-Source: ABdhPJyzi/egeBx/Sr3rQArvWkCqTJA764GFCwXdcJsxZl69YGlOGD2d4Qqo/A7HCaa3I213BOGucg==
X-Received: by 2002:a62:6305:: with SMTP id x5mr1903199pfb.81.1594868490574;
        Wed, 15 Jul 2020 20:01:30 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d89:fed1:9157:c271:c363:4849])
        by smtp.gmail.com with ESMTPSA id l16sm3224414pff.167.2020.07.15.20.01.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 20:01:30 -0700 (PDT)
Date:   Thu, 16 Jul 2020 08:31:24 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] mhi: fix doubled words and struct image_info kernel-doc
Message-ID: <20200716030124.GB3271@Mani-XPS-13-9360>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
