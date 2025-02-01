Return-Path: <linux-arm-msm+bounces-46652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5E9A24A23
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 17:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7EF11885CF1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 16:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4E41C5490;
	Sat,  1 Feb 2025 16:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPOQoCwH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AF12F56
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 16:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426049; cv=none; b=r9RC+wiNR5Nu1dpTy/BqZsqaVKSQMqHmGgYX0Kmg2XXg2pbUNYjegEtSMgB2AHtlGwXhsYaKfBOhnRa4LrqJ7oQNidfJBkF3DmW87w68Ca3vrAm+rkeDDNFGidZyrgAoG4hL/nuBA5piYIlLcyesdIH/JAKpGMQV/7ccj+XZahM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426049; c=relaxed/simple;
	bh=g06AyooziM75vKiwG8D4NAwEKMYO1gOo6PVjYKxBdaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoe+LwSZKPCPrq3S86AEmUAOLof4u0gu8vtYaZ03NO1UyiWoZCWHQFEFImKrTvVhiXPUCILDZAoPrFxKdnP+IqEZPYyOq6ov6ZiL0hg/Cm2B7Rk3NkxAjhFGWu2xsZ9/gyfQ82HCQL7a9cIJZ/4/fzp6bi7u71mRPzmsy0RZvPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPOQoCwH; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2164b662090so60437615ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 08:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738426046; x=1739030846; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eZ3t1aj2mFgpfj7pEzNxUv1YuWtm6+xQW/tflVh/XyA=;
        b=FPOQoCwHGroKq+62FC7BFJ3iINNFucnQQD6mqCjAWS1H5GszDzRcL9FiKM7fH78jQe
         RkURyARXnq+rSwjYTmG8i9oJkqC4b9ln06p91mkQqCuQRRDUdNQUQDXQDG3MRX3kOEDc
         mFcNv0VGqjfCRpM1A3uRfaK2CkPxI6zSENzPgRyOUdsxiNzLtmtHasEHr4yptjaObISy
         CCxw7sK/PE9KDRfI1SvIkTSDhSynw/BDkd3fsO3jI2b0RpmTrSUsk6TeMFqL7R9B8L4o
         iPhXeRUmLEDhL9oPPTuBt2YSSIos97QyUIIQ/iM7XbvsPbD/el4Yar+CYBcgib71qPi0
         oapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738426046; x=1739030846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZ3t1aj2mFgpfj7pEzNxUv1YuWtm6+xQW/tflVh/XyA=;
        b=hMq+WeiZHRogVDfC/iBUp2ks4eKiILp9YT/+tVf8EM1ttbaQw4uBCw8OKPpOVP1Vqa
         /wn5jhYdWxotXcyyYQQC59m0RGPRyGoQRGcX1dzbnJYyo9wYTdBCVq/olMYRXOM/VZjo
         wDCabx5paPlwawY+gl8FqlQXfG+2la7fvo0pWpBYg2gNJUHLg5r4+UrXXx+mKsvs2dm3
         mD66Zo8qWIPxEZtuX4KfFes89EVGZnU5YdBVMSWFAaG4zk+b+FYPcmBpEgCmIPJFsYwA
         gZVpU3VwjxbOtIwfUDimrRSErtg8ff+xy2fzpueEXYveYxYs8Bd64y/Vjg/p1xcHPAwr
         t8oA==
X-Forwarded-Encrypted: i=1; AJvYcCVMpXPjYeFTlCuwR8gZxn5nkGnCdR0T9UY+YstfLYq1swPpcG2iSGKgFp1z8xn6o52SVAqvxaYGxB1NBFyi@vger.kernel.org
X-Gm-Message-State: AOJu0YyO5fjl3rUFcYzgI67o2BJNLxNTqKPlGXbyMc/uk/4UJEvEM8l4
	umsxAn1NjY2gS5HDqbxrYnz5SaafCsX46hCutAKUmRSOlahDg1MMdBSIGzdVmAI5Rt8Dk3xYE3Y
	=
X-Gm-Gg: ASbGncsPQ9uaeZtmoa6C0rkdGm74WK0ylo2oAzZsgOrXltT+231OrptmBDBJORrivSd
	Xt9aysuJJdqcl37qI8HdHbmEXBwU6E7Zt+fvWImAnb/kzgT+Uo8SiProHdGKRS7uuE/kNwUKXjP
	80lvX/NtlUU3I6h+wV5jhGHF9zY1TjmgJ0305UpMHoaxKFo8iap3ACwWQjeHu24EXDr6vOcYlmK
	DD1NbTyeoXsQlXCRmruEAsUWh+6Iq2ApINsNd5jUGEOBU/aGmD6ppU/ZdPD8QrOBXDHFAi31cra
	WvLKX5PO9wjpd7NT2T0k09c4Gjw=
X-Google-Smtp-Source: AGHT+IGKVXS8baXhCPTBe6sl/h9UfWPlgRpWJrmewAX1ZXLow3mZ1mzo+rt7H8F7HI7Zdq7gTkCKAg==
X-Received: by 2002:a05:6a20:72a0:b0:1e5:a0d8:5a33 with SMTP id adf61e73a8af0-1ed7a62498amr27455365637.18.1738426045945;
        Sat, 01 Feb 2025 08:07:25 -0800 (PST)
Received: from thinkpad ([120.56.202.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cd80esm5193344b3a.121.2025.02.01.08.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:07:25 -0800 (PST)
Date: Sat, 1 Feb 2025 21:37:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: linux@treblig.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Remove unused functions
Message-ID: <20250201160721.bgfyi3cwilvibl74@thinkpad>
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

Subject prefix should be:

'bus: mhi: host:"

> mhi_device_get() and mhi_queue_dma() haven't been used since 2020's
> commit 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
> added them.
> 
> Remove them.
> 
> Note that mhi_queue_dma_sync() is used and has been left.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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

