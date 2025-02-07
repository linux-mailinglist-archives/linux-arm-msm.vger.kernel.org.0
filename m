Return-Path: <linux-arm-msm+bounces-47167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7266CA2CA79
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 18:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1563116A17C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 17:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6588B23C8D9;
	Fri,  7 Feb 2025 17:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MTtwxVsg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EDD8479
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738950348; cv=none; b=ESY4/GcB8gusstIEMOSBKWQCPwOibMLFmTqPc6iqHWscE4coPvKFjslUbc1tfTOLyK1oZvzfwgFqEYiPbSSR5f2P+j6Bo+Dr5grW8UQk8jx7e8yoJDOncgw2PfEr42jwBWuXmdV2SPH/v6nZWoRF3RglBDNLAqEYfOBN47IHEFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738950348; c=relaxed/simple;
	bh=1n2D3kbQu/2T1snSz3XeOWiwdrifTmgl1iDSxF4sG+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5A+uq2LgtEt/vdEafmOYvOz2A3GGRSaMJgYZCyEr9pT1RHEOaYOauQszIiV0I1mZFh8lo6O7bx79fjv/pG8YwdM2jjkePyT6WKxP652nMj2FBiJxqF7/SVQnayhAHf2wQt1aymLkUkh+yzBCwjvWm8gAN7r8U9BdmPWjodxkDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MTtwxVsg; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21c2f1b610dso58665935ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 09:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738950346; x=1739555146; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z+JB3bnwSE6+9YUnxotFUzDTAjUGU19z7ZryXPIUrCo=;
        b=MTtwxVsgB6mKlJDT2tPwyyPvYnluDtDt99QxkU+DxrVm8mgcA66orJ1wDXMmz3kpBD
         VmFVugIvXnbmsF+jURAqYUGrUO4NU8i06/98trKO7JEATni5Ev6UWu2DEOwui9Z5Rw/t
         EXVCqLYplEUpYY3M+Ylt/WrbnE67FliwDWEMrh5BiP101BXcIh3sdEmPzXyEhLjvw8cY
         9/9CIOv3+11I4qp9TKRZpHSqzeNqp4EfHPeVL9gknUvggL4bhxSgRHIe8EvGyLO6lJhq
         JKbZiIiSEBC1FSHvb0V3EBgOCmJlDCZazJH/EmmrUeqhNuynSZR+6EGEJ+LYar9KdBo/
         nm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738950346; x=1739555146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+JB3bnwSE6+9YUnxotFUzDTAjUGU19z7ZryXPIUrCo=;
        b=fhNqI5QieyzQI7aqrPIkVjyB5KDrRioDroDBBzQfXS9CXenkiP9zQQawP/JjCqD2su
         9/ZxJXjbnbSL6mdccCbhRHPg5Bcl1/etlhPXaf3UhDR1jN5Ck5vj6xekqMZ97ilp2TCL
         f97FP4zf5jRw1WRUvBOL2RK6GvhRMTtXFOo9c+t1q8LMSepxSYOYbOh+9q0fwp+x9jP7
         bFvJfotBcuUwKzc4vd12WHveSenJWi2Gc6jf8jOdIFfgL0lTTuFM9VZUMwMGBMa5HWr+
         Op62n4p92JPLq5Ak2pEcWZd5nUP380WKxEXOKmK/2vqgXzzwYISba7JEgG+Anb8ufqJe
         piyA==
X-Forwarded-Encrypted: i=1; AJvYcCW0H77Kw6I/WCFs2xu2SKn/Y+R552+sQA3HI7mhspAfgLnLLtEejyFU1VvMC0qcR53BS3jrc4Jt168/rMZw@vger.kernel.org
X-Gm-Message-State: AOJu0YxvFiEjkOX9OlgariyiMirUFTjVMKE/ZiyWRhs9TE+BY3oRlTTg
	Hs15vMlxyBC/YF693HzrHjTbkiUX6yJk3RrhqqpFbo7OPnJEXwWzB5wGzNYEvw==
X-Gm-Gg: ASbGncuqCD8PJZTVYsc0kpNwU4kJ5l9Pa1MNUoYz76aHCByNzTF0qjAZNlBrIpfKRRb
	OEViLGV2RpYD1aCCq/RGbYrorsBAUEITlfXQxfLGmDno6+SJAw4AgJ3b+1zCcQIAcs6zhCRTt0Y
	LJkZWIGX3meB2JR/PVLwmIvSPZy7fHpnmsmWTpWHkIlrKH9NJpvtHclA1GKWmAnP7LPl8ubkHHN
	hu+wJbXaEMdPGhgfgKSkDwpFwJPLmYN77kdhlKmIox0wN09dCyVeBRbisGLu5S2PzCOsXZUubvF
	cMhV3AyAd3hTX1MK0/OEuSAm9w==
X-Google-Smtp-Source: AGHT+IG+Cl8Ot1QSlDFwyezPC8kwSDkMJLbgZ64PcdAQ30MNdRJAiOTPikSW9UMmgUO6SsuhjU56HQ==
X-Received: by 2002:a05:6a20:4386:b0:1e1:b727:181a with SMTP id adf61e73a8af0-1ee03a8f420mr8506711637.24.1738950346087;
        Fri, 07 Feb 2025 09:45:46 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aebb9f4sm2919278a12.9.2025.02.07.09.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:45:45 -0800 (PST)
Date: Fri, 7 Feb 2025 23:15:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: linux@treblig.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Remove unused functions
Message-ID: <20250207174542.mewk2gvxq6mxjiwz@thinkpad>
References: <20250127215859.261105-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127215859.261105-1-linux@treblig.org>

On Mon, Jan 27, 2025 at 09:58:59PM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> mhi_device_get() and mhi_queue_dma() haven't been used since 2020's
> commit 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
> added them.
> 
> Remove them.
> 
> Note that mhi_queue_dma_sync() is used and has been left.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/main.c | 19 -------------------
>  drivers/bus/mhi/host/pm.c   | 14 --------------
>  include/linux/mhi.h         | 18 ------------------
>  3 files changed, 51 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 4de75674f193..4c91ffd6ed0e 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1181,25 +1181,6 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  }
>  EXPORT_SYMBOL_GPL(mhi_queue_skb);
>  
> -int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> -		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags)
> -{
> -	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
> -							     mhi_dev->dl_chan;
> -	struct mhi_buf_info buf_info = { };
> -
> -	buf_info.p_addr = mhi_buf->dma_addr;
> -	buf_info.cb_buf = mhi_buf;
> -	buf_info.pre_mapped = true;
> -	buf_info.len = len;
> -
> -	if (unlikely(mhi_chan->pre_alloc))
> -		return -EINVAL;
> -
> -	return mhi_queue(mhi_dev, &buf_info, dir, mflags);
> -}
> -EXPORT_SYMBOL_GPL(mhi_queue_dma);
> -
>  int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  			struct mhi_buf_info *info, enum mhi_flags flags)
>  {
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 11c0e751f223..2fb27e6f8f88 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -1296,20 +1296,6 @@ int mhi_force_rddm_mode(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_force_rddm_mode);
>  
> -void mhi_device_get(struct mhi_device *mhi_dev)
> -{
> -	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> -
> -	mhi_dev->dev_wake++;
> -	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> -		mhi_trigger_resume(mhi_cntrl);
> -
> -	mhi_cntrl->wake_get(mhi_cntrl, true);
> -	read_unlock_bh(&mhi_cntrl->pm_lock);
> -}
> -EXPORT_SYMBOL_GPL(mhi_device_get);
> -
>  int mhi_device_get_sync(struct mhi_device *mhi_dev)
>  {
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 059dc94d20bb..dd372b0123a6 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -720,12 +720,6 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl);
>   */
>  void mhi_soc_reset(struct mhi_controller *mhi_cntrl);
>  
> -/**
> - * mhi_device_get - Disable device low power mode
> - * @mhi_dev: Device associated with the channel
> - */
> -void mhi_device_get(struct mhi_device *mhi_dev);
> -
>  /**
>   * mhi_device_get_sync - Disable device low power mode. Synchronously
>   *                       take the controller out of suspended state
> @@ -776,18 +770,6 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev);
>   */
>  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
>  
> -/**
> - * mhi_queue_dma - Send or receive DMA mapped buffers from client device
> - *                 over MHI channel
> - * @mhi_dev: Device associated with the channels
> - * @dir: DMA direction for the channel
> - * @mhi_buf: Buffer for holding the DMA mapped data
> - * @len: Buffer length
> - * @mflags: MHI transfer flags used for the transfer
> - */
> -int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> -		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags);
> -
>  /**
>   * mhi_queue_buf - Send or receive raw buffers from client device over MHI
>   *                 channel
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

