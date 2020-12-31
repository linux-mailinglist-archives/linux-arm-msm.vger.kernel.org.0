Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C16F2E7E83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 08:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgLaHBx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 02:01:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgLaHBx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 02:01:53 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22383C061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 23:01:13 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id n7so12668583pgg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 23:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CUgzZjoKyM0WnoNLjfoSkkJfGdjxSzA4PmwBaWN+oio=;
        b=A+ity+YtjOy2vQY7zR6/CaHDWbU4cOF6HLbqZ2kTvWF6ZADgHsa/Ya7DYCTFbzRhNA
         yNKHhKqMwjKlGU9OJ0KE0ffvsNzZgZTE9vePnSt2OeFLqInXtMbOHzzV7qtoI+knA3zO
         Ksb7VouuGEe+IboMBk9ac6vocgTesf+K7hjKBX2grqfwY0Sqnegyo22J6gR191/J/uLy
         iBuq6BK1W38wJ7sidRydUtGypU+mBT3MjJ1e1La0aQhhtT3yMXGyNHwFVFBu20WsBcBo
         gbCKmD8gUzOxeSWQdw2m6j+kw1OgDm5SnrmPPMM4L44kN9KXHgt59lWL5GL2P2EDK4ks
         w+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CUgzZjoKyM0WnoNLjfoSkkJfGdjxSzA4PmwBaWN+oio=;
        b=NFCFAwH8lrdVkH9LvD89QP0JAombCXi+ErNcVGVo8iSi4wio7eNTdj0WZDkQOQSzcI
         /TANCxuIG/o9nvDAufwnls0CtdlGd5qtuhOWZCGdTKxkVYHQjkSKcpFUnv6V+sdpwVXP
         879eJeRM1Zyf9wKdV9l+0UcUafhiWWduE5xIyfFo204grG+dosr+bhJnh7hnu8H8pnGQ
         l/F4kuDCgLuC1fODGcoZ+hpNNdvrLagtoiRgQzt5XESvmStcfoFdPMB8HUJcxAqwIug/
         PfflpK7gqgBoqwITrUiNsM02fJFeZIX1VK5TpyE0nmORotZWmIBH7hwPoyE6M4dTsNpf
         XGOQ==
X-Gm-Message-State: AOAM533M6mP1H74mPeIspYQxzgsGRKRRbTdcsmYQp0W8CxplWNwa/K7H
        2VtxT48Gsb4nNuMy8i7guBFchDmDcL9M
X-Google-Smtp-Source: ABdhPJx63mp28z/vVW6PHkrq/3llFLyNQ8LqScG0xSQyB4QUPicCp6ZWp9pKuvWQWnZwkpHJFjTk9g==
X-Received: by 2002:a63:4c09:: with SMTP id z9mr37391851pga.260.1609398072523;
        Wed, 30 Dec 2020 23:01:12 -0800 (PST)
Received: from thinkpad ([2409:4072:6d1f:be3b:71a9:d2bf:a32d:897d])
        by smtp.gmail.com with ESMTPSA id p4sm9105824pjl.30.2020.12.30.23.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 23:01:11 -0800 (PST)
Date:   Thu, 31 Dec 2020 12:31:02 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org
Subject: Re: [PATCH v6 02/10] bus: mhi: core: Add device hardware reset
 support
Message-ID: <20201231070102.GB4006@thinkpad>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
 <1609231431-10048-3-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609231431-10048-3-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 29, 2020 at 09:43:43AM +0100, Loic Poulain wrote:
> The MHI specification allows to perform a hard reset of the device
> when writing to the SOC_RESET register. It can be used to completely
> restart the device (e.g. in case of unrecoverable MHI error).
> 
> This is up to the MHI controller driver to determine when this hard
> reset should be used, and in case of MHI errors, should be used as
> a reset of last resort (after standard MHI stack reset).
> 
> This function is prefixed with 'mhi_reg' to highlight that this is
> a stateless function, the MHI layer do nothing except triggering the
> reset by writing into the right register, this is up to the caller
> to ensure right mhi_controller state (e.g. unregister the controller
> if necessary).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/main.c | 7 +++++++
>  include/linux/mhi.h         | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index a353d1e..9f8ce15 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -142,6 +142,13 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
>  
> +void mhi_reg_soc_reset(struct mhi_controller *mhi_cntrl)
> +{
> +	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
> +		      MHI_SOC_RESET_REQ);

This will work for MHI devices designed as per the spec. But we do have few
devices like QCA6390 using some additional registers in the MHI space. So
ideally we'd need to add a callback to the mhi_cntrl struct for handling those
cases and call it here if present.

Thanks,
Mani

> +}
> +EXPORT_SYMBOL_GPL(mhi_reg_soc_reset);
> +
>  int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
>  			 struct mhi_buf_info *buf_info)
>  {
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 2754742..8b1bf80 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -687,6 +687,13 @@ enum mhi_ee_type mhi_get_exec_env(struct mhi_controller *mhi_cntrl);
>  enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl);
>  
>  /**
> + * mhi_reg_soc_reset - Trigger a device reset. This can be used as a last resort
> + *		       to reset and recover a device.
> + * @mhi_cntrl: MHI controller
> + */
> +void mhi_reg_soc_reset(struct mhi_controller *mhi_cntrl);
> +
> +/**
>   * mhi_device_get - Disable device low power mode
>   * @mhi_dev: Device associated with the channel
>   */
> -- 
> 2.7.4
> 
