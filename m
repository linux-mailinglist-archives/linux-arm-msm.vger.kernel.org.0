Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7607C272B58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgIUQOA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgIUQOA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:14:00 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396C3C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:14:00 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id k14so9449179pgi.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7YoLea4iis7UK4jWJgAmCe1s062tNwfx0csM60VCnzQ=;
        b=LStrY2ti4wtXEsU8ZbHy+/3TK9gjRH5siN+tBiDPJqSSRz3hdTYDz81UIGgbvN7RPV
         qYaypQLPhwfTYldRJKwoIvflIWKRzQLESa12rKTFLzk9HbqVcLkNM6uuio7vblG830Ol
         6s3M96V10EBrEC/ispkKw1L5B5PQqb+SExRxXBtk8O78UdQxmbgxQKutsVaJIS6FQU2k
         nTqvHmU72hATB0tbHshHDhugR1sncYqGkU5fmLF7PAxnkfB8Up0dLlKPsON5A6aot0Js
         Q7YkljAahWUM0pvIVKJyyZj45jNssiukBPzLpfCEUFo/0Ib/7ySlB01bZod96io2lSl5
         3fuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7YoLea4iis7UK4jWJgAmCe1s062tNwfx0csM60VCnzQ=;
        b=AZlIcgPiw79Kj4wRUHEeW/0SUa+OTEgXYLthAfUT6LMJ9RF/A5tfq0YONkRaxWEhJl
         NDZcyczOPgPQ/goJSkO0qD9JcKpImMHol5hzFDwF9eDbsze5r7Qc+n9kXov35cgSRiN7
         UcHFAhvkUxd9pvog8DAyTf2H2s3BJcWoo6BKZZhKhDnAzT5U6UaEhDVoKEc35f/Ic3l4
         rVZ9oOSYbq2WfDggOV4BENF3T9DmM2gV6T2NjnJ0LyqsTgb1U5gJfUrYTy4QlPniq8Xt
         ajEZ08NPxe5gVgaPN4IwrZVEWQgt0esoAZdTAoKBsnoJTs/jf28rYMqQR+3sWWoTJTWv
         D/kA==
X-Gm-Message-State: AOAM532ZQVNwMaPuoec0Hs8hEgrVlm7G4nju51hhzlC2OR14wWpC3v2A
        elmB0pS4GzQL9aNKYIY83x8P
X-Google-Smtp-Source: ABdhPJyhozGzj0CUa/K3oUvdXFTAbHtP0UY3l7QAB7bfKTwjHdGdVSPqTT/U8IuTP/j5+oYAkbkHmQ==
X-Received: by 2002:a63:ce4e:: with SMTP id r14mr264393pgi.353.1600704839704;
        Mon, 21 Sep 2020 09:13:59 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id j24sm29287pjy.35.2020.09.21.09.13.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 09:13:59 -0700 (PDT)
Date:   Mon, 21 Sep 2020 21:43:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: Fix the building of MHI module
Message-ID: <20200921161353.GK3262@Mani-XPS-13-9360>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
 <20200921160815.28071-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921160815.28071-2-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 09:37:57PM +0530, Manivannan Sadhasivam wrote:
> The Kbuild rule to build MHI should use the append operator. This fixes
> the below warning reported by Kbuild test bot.
> 
> WARNING: modpost: missing MODULE_LICENSE() in
> drivers/bus/mhi/core/main.o
> WARNING: modpost: missing MODULE_LICENSE() in drivers/bus/mhi/core/pm.o
> WARNING: modpost: missing MODULE_LICENSE() in
> drivers/bus/mhi/core/boot.o
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Oops! This one sneaked in. Please ignore this patch as it is already included
in the series.

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/Makefile b/drivers/bus/mhi/core/Makefile
> index 12c57ab3724c..c3feb4130aa3 100644
> --- a/drivers/bus/mhi/core/Makefile
> +++ b/drivers/bus/mhi/core/Makefile
> @@ -1,4 +1,4 @@
> -obj-$(CONFIG_MHI_BUS) := mhi.o
> +obj-$(CONFIG_MHI_BUS) += mhi.o
>  
>  mhi-y := init.o main.o pm.o boot.o
>  mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
> -- 
> 2.17.1
> 
