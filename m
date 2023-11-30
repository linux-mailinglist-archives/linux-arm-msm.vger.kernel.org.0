Return-Path: <linux-arm-msm+bounces-2663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F757FEA65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 09:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2599AB2109F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 08:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAFB1A27F;
	Thu, 30 Nov 2023 08:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDT5Mwnk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF0110E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 00:23:50 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-41cba6e8e65so3631951cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 00:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701332629; x=1701937429; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QIzdnOff2PoZMygWcqyDE4rrb5xvAOPPEWo8BOB6JM8=;
        b=fDT5MwnkaS0xzh9Sy1fn+soBigBO0Ho97iYIEcmMAEkG0kVcfoUwrKr75rIPI9p392
         E3JK0YQAf7OV4y3XU30G6YmyPXzszK8sKuIAR9qYBmHFwezK6MaU/p5cx0TQnaIHvhYd
         WbZZn3iHJdhps3yCjAjIjqpTEfWc5loE4UvQZFQ6Xq0sO4DtF/Lqy1hkrQrye9v4BfJ7
         3aoG1Qt1AfGWBoVK4K+TSUo7yegRn+IPI1s+eynvLg4DpjKJr5QqdBZB2jEdXNrH9/I4
         uVMacNDH/3DnTRs1az23ETX8JgreYLpj5QOzHyxMAvUDSdKwTbTKZzP1RcTrRPU9tTtP
         zebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701332629; x=1701937429;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QIzdnOff2PoZMygWcqyDE4rrb5xvAOPPEWo8BOB6JM8=;
        b=PtljET1FY1fdj6ZkrfbpGxjm6u3zzJgAlxF4rYKnXmkBpC4CXI3ZXUfMOZjc15C/xv
         ENm56YQQzjzfKY20bhPAej8j8tuTVHMQqVJ2u/XkOSYSjjbe/7FrlI8Y5YRp6JUF2pKC
         Fkzv0RGitiu1Z7oJOwRnwNlR7FgQjtaNB7khr0TMM0GmToeJ8Mvehys5z+Yj16/239ry
         aIZQ2bQX096DSXWURVmK5G4DB9GETqfiT15alJhhvevm5Y2+Nn6RmuRFL9eabxPR2EL0
         7sycQITWirQHCjIPMusYSsZTMMjat8kCyQ214ZscYKNT/OW0Fa9yHuWBnb95fH1DOESH
         Dd6g==
X-Gm-Message-State: AOJu0YzmjTqGeNwRRhZMyuFxsDD2nRw1FBM5nMkUAInXHkG4F+rW8UBC
	3LbjSNOJKu62N9k3rpuhMjqI
X-Google-Smtp-Source: AGHT+IFyHJ8goCrL1LNuM8zRCzGccnRCN7rW6OSWWSg4L7kH/z8/NKksqp+NfSIr35BrShINovXe0A==
X-Received: by 2002:ac8:5d8c:0:b0:423:7b1e:e252 with SMTP id d12-20020ac85d8c000000b004237b1ee252mr23644018qtx.33.1701332629180;
        Thu, 30 Nov 2023 00:23:49 -0800 (PST)
Received: from thinkpad ([59.92.100.237])
        by smtp.gmail.com with ESMTPSA id i4-20020ac860c4000000b00423c95e5c44sm275594qtm.97.2023.11.30.00.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 00:23:48 -0800 (PST)
Date: Thu, 30 Nov 2023 13:53:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: ep: Add support for interrupt moderation
 timer
Message-ID: <20231130082343.GL3043@thinkpad>
References: <20231026045513.12981-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231026045513.12981-1-manivannan.sadhasivam@linaro.org>

On Thu, Oct 26, 2023 at 10:25:13AM +0530, Manivannan Sadhasivam wrote:
> MHI spec defines the interrupt moderation timer feature using which the
> host can limit the number of interrupts being raised for an event ring by
> the device. This feature allows the host to process multiple event ring
> elements by a single IRQ from the device, thereby eliminating the need to
> process IRQ for each element.
> 
> The INTMODT field in the event context array provides the value to be used
> for delaying the IRQ generation from device. This value, along with the
> Block Event Interrupt (BEI) flag of the TRE defines how IRQ is generated to
> the host.
> 
> Support for interrupt moderation timer is implemented using delayed
> workqueue in kernel. And a separate delayed work item is used for each
> event ring.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

- Mani

> ---
> 
> Changes in v2:
> 
> * Fixed the build issue reported by Kbuild bot.
> 
>  drivers/bus/mhi/ep/internal.h |  3 +++
>  drivers/bus/mhi/ep/main.c     | 22 +++++++++++++++++++---
>  drivers/bus/mhi/ep/ring.c     | 19 ++++++++++++++++++-
>  3 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
> index a2125fa5fe2f..8c5cf2b67951 100644
> --- a/drivers/bus/mhi/ep/internal.h
> +++ b/drivers/bus/mhi/ep/internal.h
> @@ -126,6 +126,7 @@ struct mhi_ep_ring {
>  	union mhi_ep_ring_ctx *ring_ctx;
>  	struct mhi_ring_element *ring_cache;
>  	enum mhi_ep_ring_type type;
> +	struct delayed_work intmodt_work;
>  	u64 rbase;
>  	size_t rd_offset;
>  	size_t wr_offset;
> @@ -135,7 +136,9 @@ struct mhi_ep_ring {
>  	u32 ch_id;
>  	u32 er_index;
>  	u32 irq_vector;
> +	u32 intmodt;
>  	bool started;
> +	bool irq_pending;
>  };
>  
>  struct mhi_ep_cmd {
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index e2513f5f47a6..c06111045a84 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -54,11 +54,27 @@ static int mhi_ep_send_event(struct mhi_ep_cntrl *mhi_cntrl, u32 ring_idx,
>  	mutex_unlock(&mhi_cntrl->event_lock);
>  
>  	/*
> -	 * Raise IRQ to host only if the BEI flag is not set in TRE. Host might
> -	 * set this flag for interrupt moderation as per MHI protocol.
> +	 * As per the MHI specification, section 4.3, Interrupt moderation:
> +	 *
> +	 * 1. If BEI flag is not set, cancel any pending intmodt work if started
> +	 * for the event ring and raise IRQ immediately.
> +	 *
> +	 * 2. If both BEI and intmodt are set, and if no IRQ is pending for the
> +	 * same event ring, start the IRQ delayed work as per the value of
> +	 * intmodt. If previous IRQ is pending, then do nothing as the pending
> +	 * IRQ is enough for the host to process the current event ring element.
> +	 *
> +	 * 3. If BEI is set and intmodt is not set, no need to raise IRQ.
>  	 */
> -	if (!bei)
> +	if (!bei) {
> +		if (READ_ONCE(ring->irq_pending))
> +			cancel_delayed_work(&ring->intmodt_work);
> +
>  		mhi_cntrl->raise_irq(mhi_cntrl, ring->irq_vector);
> +	} else if (ring->intmodt && !READ_ONCE(ring->irq_pending)) {
> +		WRITE_ONCE(ring->irq_pending, true);
> +		schedule_delayed_work(&ring->intmodt_work, msecs_to_jiffies(ring->intmodt));
> +	}
>  
>  	return 0;
>  
> diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
> index 115518ec76a4..a1071c13761b 100644
> --- a/drivers/bus/mhi/ep/ring.c
> +++ b/drivers/bus/mhi/ep/ring.c
> @@ -157,6 +157,15 @@ void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32
>  	}
>  }
>  
> +static void mhi_ep_raise_irq(struct work_struct *work)
> +{
> +	struct mhi_ep_ring *ring = container_of(work, struct mhi_ep_ring, intmodt_work.work);
> +	struct mhi_ep_cntrl *mhi_cntrl = ring->mhi_cntrl;
> +
> +	mhi_cntrl->raise_irq(mhi_cntrl, ring->irq_vector);
> +	WRITE_ONCE(ring->irq_pending, false);
> +}
> +
>  int mhi_ep_ring_start(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
>  			union mhi_ep_ring_ctx *ctx)
>  {
> @@ -173,8 +182,13 @@ int mhi_ep_ring_start(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
>  	if (ring->type == RING_TYPE_CH)
>  		ring->er_index = le32_to_cpu(ring->ring_ctx->ch.erindex);
>  
> -	if (ring->type == RING_TYPE_ER)
> +	if (ring->type == RING_TYPE_ER) {
>  		ring->irq_vector = le32_to_cpu(ring->ring_ctx->ev.msivec);
> +		ring->intmodt = FIELD_GET(EV_CTX_INTMODT_MASK,
> +					  le32_to_cpu(ring->ring_ctx->ev.intmod));
> +
> +		INIT_DELAYED_WORK(&ring->intmodt_work, mhi_ep_raise_irq);
> +	}
>  
>  	/* During ring init, both rp and wp are equal */
>  	memcpy_fromio(&val, (void __iomem *) &ring->ring_ctx->generic.rp, sizeof(u64));
> @@ -201,6 +215,9 @@ int mhi_ep_ring_start(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring,
>  
>  void mhi_ep_ring_reset(struct mhi_ep_cntrl *mhi_cntrl, struct mhi_ep_ring *ring)
>  {
> +	if (ring->type == RING_TYPE_ER)
> +		cancel_delayed_work_sync(&ring->intmodt_work);
> +
>  	ring->started = false;
>  	kfree(ring->ring_cache);
>  	ring->ring_cache = NULL;
> 
> base-commit: 12606ba1d46b34a241eb3d0956727e5379f0f626
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

