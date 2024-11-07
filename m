Return-Path: <linux-arm-msm+bounces-37227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 034A49C03EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 12:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 353B31C21FB4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 11:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82B21F4FD3;
	Thu,  7 Nov 2024 11:27:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982B91F4FAC;
	Thu,  7 Nov 2024 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730978860; cv=none; b=koikzLzG/O9Ms5E0a7WLHfep6Ou26pHpPQHGE63Y06CONOV54bL2uq9FP1AhFDtrdUBq74g/LYEsFB7y1VkXkApARS6u21tm202dCGHeNoBc5v5zPphoigUbj2FItpUzw46HRXFg/ybV+c9sBDtrJ0mRK8cjgUCjlZwZ/mRF/Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730978860; c=relaxed/simple;
	bh=CiRRGlsT3dDhWyONtG/CZiwwSxcdju77JCm6fWfpbFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRe/oLd+5ynKTxWX8lKKDbPIBUGOLFnvap8TGuCQMekbovGMKQi6w15DZGFzG/nguDnVKpfetBMTthZwbov+kUL5I7OQ3ywKxIPZdCRiGNWE/2xzeUmeQUC4Q+e0kdbS2oNtWdAIQMsPGM/m6RldmzcBaBIsmGxakJZvV+KQ5hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB575C4CECC;
	Thu,  7 Nov 2024 11:27:36 +0000 (UTC)
Date: Thu, 7 Nov 2024 11:27:34 +0000
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Chris Lew <quic_clew@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hemant Kumar <quic_hemantk@quicinc.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bhaumik Bhatt <bbhatt@codeaurora.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] net: qrtr: mhi: synchronize qrtr and mhi preparation
Message-ID: <20241107112734.v2ik6ipnebetjene@thinkpad>
References: <20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com>

On Mon, Nov 04, 2024 at 05:29:37PM -0800, Chris Lew wrote:
> From: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> The call to qrtr_endpoint_register() was moved before
> mhi_prepare_for_transfer_autoqueue() to prevent a case where a dl
> callback can occur before the qrtr endpoint is registered.
> 
> Now the reverse can happen where qrtr will try to send a packet
> before the channels are prepared. Add a wait in the sending path to
> ensure the channels are prepared before trying to do a ul transfer.
> 
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com/
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>

I think we need to have the check in 'mhi_queue()' instead of waiting for the
channels in client drivers. Would it be a problem if qrtr returns -EAGAIN from
qcom_mhi_qrtr_send() instead of waiting for the channel?

- Mani

> ---
>  net/qrtr/mhi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 69f53625a049..5b7268868bbd 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -15,6 +15,7 @@ struct qrtr_mhi_dev {
>  	struct qrtr_endpoint ep;
>  	struct mhi_device *mhi_dev;
>  	struct device *dev;
> +	struct completion prepared;
>  };
>  
>  /* From MHI to QRTR */
> @@ -53,6 +54,10 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
>  	if (skb->sk)
>  		sock_hold(skb->sk);
>  
> +	rc = wait_for_completion_interruptible(&qdev->prepared);
> +	if (rc)
> +		goto free_skb;
> +
>  	rc = skb_linearize(skb);
>  	if (rc)
>  		goto free_skb;
> @@ -85,6 +90,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>  	qdev->mhi_dev = mhi_dev;
>  	qdev->dev = &mhi_dev->dev;
>  	qdev->ep.xmit = qcom_mhi_qrtr_send;
> +	init_completion(&qdev->prepared);
>  
>  	dev_set_drvdata(&mhi_dev->dev, qdev);
>  	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> @@ -97,6 +103,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>  		qrtr_endpoint_unregister(&qdev->ep);
>  		return rc;
>  	}
> +	complete_all(&qdev->prepared);
>  
>  	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
>  
> 
> ---
> base-commit: 1ffec08567f426a1c593e038cadc61bdc38cb467
> change-id: 20241104-qrtr_mhi-dfec353030af
> 
> Best regards,
> -- 
> Chris Lew <quic_clew@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

