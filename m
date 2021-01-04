Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49AA32E9844
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 16:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbhADPRc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 10:17:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727287AbhADPRc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 10:17:32 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A3DC061794
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 07:16:52 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id t8so16612924pfg.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 07:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NqVHYrq5zKtTiE7pornKTX0w6UJqMq0DYY+6pQ71lEc=;
        b=t+gUl4thSB7I8esbB+fYtPlH7NSq4bfMmVOe+IfnbQpKW8cQj6HJjaIEtOhXYbDlfF
         96cxRkCcojlApjWm2ca/4ZASbywuCsZ1rNbENrgEkRHmwp8+beQRMuZn1qWsj0uJ9S6r
         I5oswTnDGBOjeguWlewPX0EgBFVr2RbNhsLFOjbzJXdh6ZFJCGQpBw8mqdK6HN8/OJZl
         JIYZxfvD+cLJ/qL2e1DvWMv+kahm6OHJXskc/BZWIsehTapjKtqdKBILfI4KXeEimHr+
         6tIb8OhHgWSBQxcr+QgWBAlC9j8E/CONpCQawQPZl/FEbXaYX2fkLJLAPwsrNkz8j1Qe
         XKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NqVHYrq5zKtTiE7pornKTX0w6UJqMq0DYY+6pQ71lEc=;
        b=Pf3AG2tPffmAnClI8YBtridfV+sqFoAp60jcnVQKJZ7GHiqEWLTvc+TfnSnhLeCVVY
         mvEkUzaVP3umzBV4soMUo5YIbL6mVhy20116Y6ljUHwnXVl0MSps5qjCDMlpIKcZssDm
         YoKB7xw8cIvVcVmvF8zYahaqdN4oHX01oFFybEcoMw9JcHTNx7czw3UDbHlv8RUEYlhP
         JHiyla8JBvegRQVEfJehMNtnGIiuUwT7KGqXqW7R+kPHeUyrPsaB5Der3X7cyYs0gSPC
         KVVbplqNsiY/KHEmjPLFCrCwxbxz8573FRFvr2rbp19nnkELd/ZPEszHe/XhF45gf/tW
         xzUQ==
X-Gm-Message-State: AOAM530QjdqmSB7hTyzCjO8HzbJHo5WUuouY4jjJak46hwuvVuleNRxC
        xOX4yRSph9ISE/JiYpExDbRV
X-Google-Smtp-Source: ABdhPJx45sNy58KLGLoUJ+H7IV38L8x9b8kBL0Xmm55wPO4to1EbMboygEQiIbvuFb84khIxeak26g==
X-Received: by 2002:a63:d650:: with SMTP id d16mr71183196pgj.277.1609773411436;
        Mon, 04 Jan 2021 07:16:51 -0800 (PST)
Received: from work ([103.77.37.129])
        by smtp.gmail.com with ESMTPSA id k18sm21016449pjz.26.2021.01.04.07.16.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jan 2021 07:16:50 -0800 (PST)
Date:   Mon, 4 Jan 2021 20:46:47 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org
Subject: Re: [PATCH v7 01/10] bus: mhi: core: Add device hardware reset
 support
Message-ID: <20210104151647.GA2256@work>
References: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
 <1609768179-10132-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609768179-10132-2-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 04, 2021 at 02:49:30PM +0100, Loic Poulain wrote:
> The MHI specification allows to perform a hard reset of the device
> when writing to the SOC_RESET register. It can be used to completely
> restart the device (e.g. in case of unrecoverable MHI error).
> 
> This is up to the MHI controller driver to determine when this hard
> reset should be used, and in case of MHI errors, should be used as
> a reset of last resort (after standard MHI stack reset).
> 
> This function is a stateless function, the MHI layer do nothing except
> triggering the reset by writing into the right register(s), this is up
> to the caller to ensure right mhi_controller state (e.g. unregister the
> controller if necessary).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 13 +++++++++++++
>  include/linux/mhi.h         |  9 +++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index a353d1e..c181a85 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -142,6 +142,19 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
>  
> +void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
> +{
> +	if (mhi_cntrl->reset) {
> +		mhi_cntrl->reset(mhi_cntrl);
> +		return;
> +	}
> +
> +	/* Generic MHI SoC reset */
> +	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
> +		      MHI_SOC_RESET_REQ);
> +}
> +EXPORT_SYMBOL_GPL(mhi_soc_reset);
> +
>  int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
>  			 struct mhi_buf_info *buf_info)
>  {
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 04cf7f3..7ddbcd7 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -355,6 +355,7 @@ struct mhi_controller_config {
>   * @unmap_single: CB function to destroy TRE buffer
>   * @read_reg: Read a MHI register via the physical link (required)
>   * @write_reg: Write a MHI register via the physical link (required)
> + * @reset: Controller specific reset function (optional)
>   * @buffer_len: Bounce buffer length
>   * @index: Index of the MHI controller instance
>   * @bounce_buf: Use of bounce buffer
> @@ -445,6 +446,7 @@ struct mhi_controller {
>  			u32 *out);
>  	void (*write_reg)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
>  			  u32 val);
> +	void (*reset)(struct mhi_controller *mhi_cntrl);
>  
>  	size_t buffer_len;
>  	int index;
> @@ -681,6 +683,13 @@ enum mhi_ee_type mhi_get_exec_env(struct mhi_controller *mhi_cntrl);
>  enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl);
>  
>  /**
> + * mhi_soc_reset - Trigger a device reset. This can be used as a last resort
> + *		   to reset and recover a device.
> + * @mhi_cntrl: MHI controller
> + */
> +void mhi_soc_reset(struct mhi_controller *mhi_cntrl);
> +
> +/**
>   * mhi_device_get - Disable device low power mode
>   * @mhi_dev: Device associated with the channel
>   */
> -- 
> 2.7.4
> 
