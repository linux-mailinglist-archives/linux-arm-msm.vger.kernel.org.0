Return-Path: <linux-arm-msm+bounces-315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADBD7E6EB1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 17:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BCBA280FBD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 16:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C5321A16;
	Thu,  9 Nov 2023 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bA6E+RAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3CB22316;
	Thu,  9 Nov 2023 16:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E12CC433C8;
	Thu,  9 Nov 2023 16:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699547386;
	bh=dUQ0jsrbVJNAIWiCdn5MuT0BOLJUM4Wpzuv+873vQMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bA6E+RAgxCFPzfT+xJRSeWvBs2J6BbZAWl45HDBpsZGZrLPohT0OZCZH29zANzoRI
	 SYm30R2LfNxnhTC5GlqZpGE5/CKYoBXKWMrq9gnu4rdXg472i7LgjE+8MzhGNOcERd
	 Ke7f5v4W5Ro4uspQhcZJ+XMNmviLC4i3TttIC8bNeErJOxewNfHD+WQYFF03qoYwCD
	 pNa/vof+NgxZlYPzHxcnXWvk00z0Ly8mic5K6PF6ah0JSH1Ei/+f6Q0Plwr3G12eNv
	 mGzm7rBmnNR6fSvu72aoQ5OTAaHaF6918HAl1kMeB5YEE5wfXyho8z6zP23rWtE9gZ
	 WphGz+irMnXkg==
Date: Thu, 9 Nov 2023 21:59:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: quic_jhugo@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, quic_mrana@quicinc.com,
	Hemant Kumar <quic_hemantk@quicinc.com>,
	Lazarus Motha <quic_lmotha@quicinc.com>
Subject: Re: [PATCH v3 4/4] bus: mhi: host: Take irqsave lock after TRE is
 generated
Message-ID: <20231109162933.GK3752@thinkpad>
References: <1699341365-47737-1-git-send-email-quic_qianyu@quicinc.com>
 <1699341365-47737-5-git-send-email-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1699341365-47737-5-git-send-email-quic_qianyu@quicinc.com>

On Tue, Nov 07, 2023 at 03:16:05PM +0800, Qiang Yu wrote:
> From: Hemant Kumar <quic_hemantk@quicinc.com>
> 
> Take irqsave lock after TRE is generated to avoid deadlock due to core
> getting interrupts enabled as local_bh_enable must not be called with
> irqs disabled based on upstream patch.
> 

You still didn't address any of the comments provided by Jeff in v2.

- Mani

> Signed-off-by: Hemant Kumar <quic_hemantk@quicinc.com>
> Signed-off-by: Lazarus Motha <quic_lmotha@quicinc.com>
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  drivers/bus/mhi/host/main.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index b137d54..93b5110 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1129,17 +1129,15 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
>  	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)))
>  		return -EIO;
>  
> -	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
> -
>  	ret = mhi_is_ring_full(mhi_cntrl, tre_ring);
> -	if (unlikely(ret)) {
> -		ret = -EAGAIN;
> -		goto exit_unlock;
> -	}
> +	if (unlikely(ret))
> +		return -EAGAIN;
>  
>  	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, buf_info, mflags);
>  	if (unlikely(ret))
> -		goto exit_unlock;
> +		return ret;
> +
> +	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
>  
>  	/* Packet is queued, take a usage ref to exit M3 if necessary
>  	 * for host->device buffer, balanced put is done on buffer completion
> @@ -1159,7 +1157,6 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
>  	if (dir == DMA_FROM_DEVICE)
>  		mhi_cntrl->runtime_put(mhi_cntrl);
>  
> -exit_unlock:
>  	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>  
>  	return ret;
> -- 
> 2.7.4
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

