Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C224D350681
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 20:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235042AbhCaSjB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 14:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234743AbhCaSic (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 14:38:32 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D097C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 11:38:32 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso1724152pjh.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 11:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xVFz/Gq0fZO5UVwwcIiQh0M0HySLnxCGk6JFPLS55FQ=;
        b=nD+fMWxyp1aMJrHunt0P+awE8UXGq9q5H/OouV/r40K/EMiLhnVygeAB/ntSafx7f/
         aAOv4UCmR9rDrMrFXQyZ1+5hSPmsBf7TKgfQTEZEzywXqguuGE+XbdHc04zYwcFkNW8B
         WXQNLTMhtnJrrihE4CI1etpLIb3BZvdEG6vem8h7Ct2L2IeXdd0B6UbueVfSFe/hBIaB
         hKWiV/6UcHBc/UBZQoFShDn3pLaIghR6nMT1SVUhBweZj7klbRW0JEJE+1pPyQFIhBYk
         WpHU7oq4qijrtzP1CPJXAGwq6KhgEHvbFx6b+SX9QQz2j1GMg1i2kuyNHEFb61xzTjBh
         LIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xVFz/Gq0fZO5UVwwcIiQh0M0HySLnxCGk6JFPLS55FQ=;
        b=juAeIzKs4Txox5fganHWtVqV6uc7ksTHX7EmTEzpHZrCe4EJnsWxr0f2kCdd4ubsnG
         spsdkJvGUZjuy155eSeUYGDRC6aQ6MD1rqQob01YtRTjV1UNu+SMR6Xttg1X1Bf9cliS
         rpD80LAIo6iWQmnFq0wYJ3IGZ41+DLTii2JlxnA5q20gGajDtm95fh+AjZOCgFj+5Euf
         CnZxDkS0Ws3jIvo2sqssHVpROOynJsInjrKqlzUVwUNgyqe1kkNXoW751FAk6weorXiv
         WeD08/bSh65hyN4hLNac1wTncUQ4QMshc4i8XW0Pi2AnDLL4zav31TGLLVeaEq0uh+uZ
         PSTw==
X-Gm-Message-State: AOAM5300IakoK9rs8DF6BxnZmqjfjxJCDb2i1bDsymWhHoUlsxphI6AU
        KFe9UrGUWb0kbtSHUUXWoOIw
X-Google-Smtp-Source: ABdhPJwSj5cF7swcDrkrrQqUOU5UwVjBN8W+tp6XjVg6MJ0qV4YyRUMhQAADjDmkEn2nDQ+kkWmtJw==
X-Received: by 2002:a17:90b:33c5:: with SMTP id lk5mr4779631pjb.207.1617215911978;
        Wed, 31 Mar 2021 11:38:31 -0700 (PDT)
Received: from work ([103.77.37.129])
        by smtp.gmail.com with ESMTPSA id i14sm2953078pjh.17.2021.03.31.11.38.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 11:38:31 -0700 (PDT)
Date:   Thu, 1 Apr 2021 00:08:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH v6 1/2] bus: mhi: core: Introduce internal register poll
 helper function
Message-ID: <20210331183827.GM15610@work>
References: <1617215665-19593-1-git-send-email-bbhatt@codeaurora.org>
 <1617215665-19593-2-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617215665-19593-2-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 31, 2021 at 11:34:24AM -0700, Bhaumik Bhatt wrote:
> Introduce helper function to allow MHI core driver to poll for
> a value in a register field. This helps reach a common path to
> read and poll register values along with a retry time interval.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/internal.h |  3 +++
>  drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 7aa5cfd..e690f15 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -646,6 +646,9 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
>  int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
>  				    void __iomem *base, u32 offset, u32 mask,
>  				    u32 shift, u32 *out);
> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
> +				    void __iomem *base, u32 offset, u32 mask,
> +				    u32 shift, u32 val, u32 delayus);
>  void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
>  		   u32 offset, u32 val);
>  void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 8b68657..58b8111 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -4,6 +4,7 @@
>   *
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-direction.h>
>  #include <linux/dma-mapping.h>
> @@ -37,6 +38,28 @@ int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
>  	return 0;
>  }
>  
> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
> +				    void __iomem *base, u32 offset,
> +				    u32 mask, u32 shift, u32 val, u32 delayus)
> +{
> +	int ret;
> +	u32 out, retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
> +
> +	while (retry--) {
> +		ret = mhi_read_reg_field(mhi_cntrl, base, offset, mask, shift,
> +					 &out);
> +		if (ret)
> +			return ret;
> +
> +		if (out == val)
> +			return 0;
> +
> +		fsleep(delayus);
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
>  void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
>  		   u32 offset, u32 val)
>  {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
