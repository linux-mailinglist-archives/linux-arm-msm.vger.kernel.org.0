Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A04D1C0347
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 18:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgD3Q5t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 12:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726562AbgD3Q5t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 12:57:49 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889F0C035494
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 09:57:48 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id 7so3721715pjo.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 09:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p/VZn+3Asz7aaDQPzGnEebRPNN6ygrqn+6YJbJEkTFY=;
        b=TwSkiCUJFpMuBZeS3QjD+j2K6lA15TNF64ZPTKeBi91KH9p23KCq1ZVS5vzG5XzekY
         Pw/9ybfo5BIHYh68/EjpeEyVVMBF398PDKjTHTxSM8Kbn88t2dElFLxwiaBotqnuhZJE
         yWEyuoEg/vzOxKDXCh6hNSSipnK1wavGkT1l7ZWL98CVUkMEVvmqxcGeLrd7XUPaSe2y
         +scBdpNJer946KwQf6WmjwqhOcsOIWAsI9gNBoHeo93aBS1mwrOyJDkybew6ZnGC4CIy
         okBI2KNNqTz//p/iPX0Ec/bf0EVNRUYiAWi2OJUPphPKUo6OsLHuU7MJW/3WnVfu3BvN
         ygmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p/VZn+3Asz7aaDQPzGnEebRPNN6ygrqn+6YJbJEkTFY=;
        b=UTIZTktfUCkQyW9jwPW/Pmqtf4kvp3GR8F6wCm9/AkmgUYDq3YE9VImx/14iVWplOi
         Xqn5Z+r26zOHfFU9nAL8AS3iTYHTsCoG5EPZYg792vpD0nMJaC9/KgrrZ+FwUcdNqR8U
         S9D0Qmn7CGQLIOD2sGgWN7+OkdJ6K+BbPTxu42HyOBhtMSauHSc83zBxn8rQEx50NkDX
         WgvfkIA8OhLB3zZ8btt439dMgU9pUx446S6dWUtERSLyXA1CuP/vqQQmEEDg3a2GCYEB
         2ks89yf+HyBtE7xY4Qs0rsCU5MAiBpIC1et1xiSclLqWOoKnWR+VhtzgZddycDKzuQiE
         PYQA==
X-Gm-Message-State: AGi0PuZub0hIe13jI2/ZThcGAM3gEDudQTF6Ms5mCr64Rqp4XFQKWl7B
        0pQQZuLgHlvvsBKKjW3LbkVO
X-Google-Smtp-Source: APiQypKJRv1qRDQSleePvXOtIJqgTa4c0L5f1A/x2rBmTJVhGw23cE2Ewopjq5wDlrmHbHC/iac7ow==
X-Received: by 2002:a17:902:14b:: with SMTP id 69mr4617204plb.121.1588265867991;
        Thu, 30 Apr 2020 09:57:47 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id x193sm319051pfd.54.2020.04.30.09.57.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 09:57:47 -0700 (PDT)
Date:   Thu, 30 Apr 2020 22:27:40 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] bus: mhi: core: Offload register accesses to the
 controller
Message-ID: <20200430165740.GF9449@Mani-XPS-13-9360>
References: <1588003153-13139-1-git-send-email-jhugo@codeaurora.org>
 <1588003153-13139-4-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588003153-13139-4-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 27, 2020 at 09:59:10AM -0600, Jeffrey Hugo wrote:
> When reading or writing MHI registers, the core assumes that the physical
> link is a memory mapped PCI link.  This assumption may not hold for all
> MHI devices.  The controller knows what is the physical link (ie PCI, I2C,
> SPI, etc), and therefore knows the proper methods to access that link.
> The controller can also handle link specific error scenarios, such as
> reading -1 when the PCI link went down.
> 
> Therefore, it is appropriate that the MHI core requests the controller to
> make register accesses on behalf of the core, which abstracts the core
> from link specifics, and end up removing an unnecessary assumption.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

You know how much I like this patch ;)

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c     |  3 ++-
>  drivers/bus/mhi/core/internal.h |  3 ---
>  drivers/bus/mhi/core/main.c     | 12 ++----------
>  include/linux/mhi.h             |  6 ++++++
>  4 files changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 2af08d57..eb2ab05 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -813,7 +813,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  		return -EINVAL;
>  
>  	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
> -	    !mhi_cntrl->status_cb)
> +	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
> +	    !mhi_cntrl->write_reg)
>  		return -EINVAL;
>  
>  	ret = parse_config(mhi_cntrl, config);
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 5deadfa..095d95b 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -11,9 +11,6 @@
>  
>  extern struct bus_type mhi_bus_type;
>  
> -/* MHI MMIO register mapping */
> -#define PCI_INVALID_READ(val) (val == U32_MAX)
> -
>  #define MHIREGLEN (0x0)
>  #define MHIREGLEN_MHIREGLEN_MASK (0xFFFFFFFF)
>  #define MHIREGLEN_MHIREGLEN_SHIFT (0)
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 473278b8..580d72b 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -18,15 +18,7 @@
>  int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
>  			      void __iomem *base, u32 offset, u32 *out)
>  {
> -	u32 tmp = readl(base + offset);
> -
> -	/* If the value is invalid, the link is down */
> -	if (PCI_INVALID_READ(tmp))
> -		return -EIO;
> -
> -	*out = tmp;
> -
> -	return 0;
> +	return mhi_cntrl->read_reg(mhi_cntrl, base + offset, out);
>  }
>  
>  int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
> @@ -48,7 +40,7 @@ int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
>  void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
>  		   u32 offset, u32 val)
>  {
> -	writel(val, base + offset);
> +	mhi_cntrl->write_reg(mhi_cntrl, base + offset, val);
>  }
>  
>  void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index be704a4..225a03a 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -342,6 +342,8 @@ struct mhi_controller_config {
>   * @runtimet_put: CB function to decrement pm usage (required)
>   * @map_single: CB function to create TRE buffer
>   * @unmap_single: CB function to destroy TRE buffer
> + * @read_reg: Read a MHI register via the physical link (required)
> + * @write_reg: Write a MHI register via the physical link (required)
>   * @buffer_len: Bounce buffer length
>   * @bounce_buf: Use of bounce buffer
>   * @fbc_download: MHI host needs to do complete image transfer (optional)
> @@ -425,6 +427,10 @@ struct mhi_controller {
>  			  struct mhi_buf_info *buf);
>  	void (*unmap_single)(struct mhi_controller *mhi_cntrl,
>  			     struct mhi_buf_info *buf);
> +	int (*read_reg)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
> +			u32 *out);
> +	void (*write_reg)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
> +			  u32 val);
>  
>  	size_t buffer_len;
>  	bool bounce_buf;
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
