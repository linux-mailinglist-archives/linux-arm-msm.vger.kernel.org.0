Return-Path: <linux-arm-msm+bounces-61690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 015CEADE4EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 09:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C68963BC756
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 07:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E5525C6EE;
	Wed, 18 Jun 2025 07:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MeLStGLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928E97E105;
	Wed, 18 Jun 2025 07:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750233216; cv=none; b=XyzrkVYH0fjKmYfYqDqxbA/qF+nBxvH7yTGiQiUa0D7nTau8yNjvUKtdTE/uKBOY4u6t5WpT+EFAOwUqyJq6zwzI0PNrNjEXky5I+QRJbKM7F48mje5S9vdxuXbv6noPqg4Rj6brdsV+HzaL05ueYFVEI7hKfN6IyP2SgILh0GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750233216; c=relaxed/simple;
	bh=F2H3BunHCPg9NsszYk0dwTbM/S1iidnIY2xiUi2LJ5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdfEiXbLGfkFUbgBhNMbFp3FckJHEusb/6Ayb6h8jxG5DoMBTRBuMLv8TZnKrtEkMHe3LlsKheujxLSbVagQJkCSlSSkbx4sTUBk/3SCezZD2ZcblRoBCLZYsFTnIbmxF8NHX1r4gkYnVQmM8SikEPO2oMTKUauKO/raw49hlGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MeLStGLT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12ED4C4CEE7;
	Wed, 18 Jun 2025 07:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750233216;
	bh=F2H3BunHCPg9NsszYk0dwTbM/S1iidnIY2xiUi2LJ5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MeLStGLTmuQ7RwPEGwlIyeXiJMCjHGBACHFVSx1tpbcULWU7jptvWuV3ZZePLLj6z
	 o6UHCFWXklA7kklHLCYB05eDgJUlJV6gqh6EB6iF/XnEnhRt8hsjZ64QMtbk3tqHQf
	 rYfpeQDGmI9Ui+/1eQ+NZkyIEsitRhCB08G1jNNSuteJIWbD0VRB5IakrCU2vB6/s3
	 iTQiWyujGepJdqCrxGKcbgB+wrtUSTQhz1x3gwzWePjnygfpsrcug8X7fEgVLCKGoA
	 QolepyWcnIxe4VBxYojgGLVWVyh86ogAyB3ip6zbFYCSiOayHiniQZM6mxOOTN4MvZ
	 GChJgYBVp1L3w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uRnbx-0000000037b-3kSa;
	Wed, 18 Jun 2025 09:53:34 +0200
Date: Wed, 18 Jun 2025 09:53:33 +0200
From: Johan Hovold <johan@kernel.org>
To: Chris Lew <chris.lew@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hemant Kumar <quic_hemantk@quicinc.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: qrtr: mhi: synchronize qrtr and mhi preparation
Message-ID: <aFJwfXsnxiCEWL1u@hovoldconsulting.com>
References: <20250604-qrtr_mhi_auto-v2-1-a143433ddaad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604-qrtr_mhi_auto-v2-1-a143433ddaad@oss.qualcomm.com>

On Wed, Jun 04, 2025 at 02:05:42PM -0700, Chris Lew wrote:
> The call to qrtr_endpoint_register() was moved before
> mhi_prepare_for_transfer_autoqueue() to prevent a case where a dl
> callback can occur before the qrtr endpoint is registered.
> 
> Now the reverse can happen where qrtr will try to send a packet
> before the channels are prepared. The correct sequence needs to be
> prepare the mhi channel, register the qrtr endpoint, queue buffers for
> receiving dl transfers.
> 
> Since qrtr will not use mhi_prepare_for_transfer_autoqueue(), qrtr must
> do the buffer management and requeue the buffers in the dl_callback.
> Sizing of the buffers will be inherited from the mhi controller
> settings.
> 
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com/
> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>

Thanks for the update. I believe this one should have a stable tag as
well as it fixes a critical boot failure on Qualcomm platforms that we
hit frequently with the in-kernel pd-mapper.

And it indeed fixes the crash:

Tested-by: Johan Hovold <johan+linaro@kernel.org>

>  /* From MHI to QRTR */
> @@ -24,13 +26,22 @@ static void qcom_mhi_qrtr_dl_callback(struct mhi_device *mhi_dev,
>  	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
>  	int rc;
>  
> -	if (!qdev || mhi_res->transaction_status)
> +	if (!qdev)
> +		return;
> +
> +	if (mhi_res->transaction_status == -ENOTCONN) {
> +		devm_kfree(qdev->dev, mhi_res->buf_addr);

Why do you need to free this buffer here?

AFAICS, all buffers are allocated at probe() and freed at (after)
remove().

> +		return;
> +	} else if (mhi_res->transaction_status) {
>  		return;
> +	}
>  
>  	rc = qrtr_endpoint_post(&qdev->ep, mhi_res->buf_addr,
>  				mhi_res->bytes_xferd);
>  	if (rc == -EINVAL)
>  		dev_err(qdev->dev, "invalid ipcrouter packet\n");
> +
> +	rc = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, mhi_res->buf_addr, qdev->dl_buf_len, MHI_EOT);

Please try to stay within 80 columns except when not doing so
significantly improves readability.

Also you don't do anything with rc here. Should you log an error at
least?

>  }
 
> +static int qrtr_mhi_queue_rx(struct qrtr_mhi_dev *qdev)
> +{
> +	struct mhi_device *mhi_dev = qdev->mhi_dev;
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	int rc = 0;
> +	int nr_el;
> +
> +	qdev->dl_buf_len = mhi_cntrl->buffer_len;
> +	nr_el = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
> +	while (nr_el--) {
> +		void *buf;
> +
> +		buf = devm_kzalloc(qdev->dev, qdev->dl_buf_len, GFP_KERNEL);
> +		if (!buf) {
> +			rc = -ENOMEM;
> +			break;
> +		}
> +		rc = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, qdev->dl_buf_len, MHI_EOT);

80 cols here too.

> +		if (rc)
> +			break;
> +	}
> +	return rc;
> +}
> +
>  static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>  			       const struct mhi_device_id *id)
>  {
> @@ -87,17 +122,24 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>  	qdev->ep.xmit = qcom_mhi_qrtr_send;
>  
>  	dev_set_drvdata(&mhi_dev->dev, qdev);
> -	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> +
> +	/* start channels */
> +	rc = mhi_prepare_for_transfer(mhi_dev);
>  	if (rc)
>  		return rc;
>  
> -	/* start channels */
> -	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
> +	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
>  	if (rc) {
> -		qrtr_endpoint_unregister(&qdev->ep);
> +		mhi_unprepare_from_transfer(mhi_dev);
>  		return rc;
>  	}
>  
> +	rc = qrtr_mhi_queue_rx(qdev);
> +	if (rc) {
> +		qrtr_endpoint_unregister(&qdev->ep);
> +		mhi_unprepare_from_transfer(mhi_dev);

Jakub already pointed out the missing return here. Perhaps you should
consider adding error labels for the unwinding.

> +	}
> +
>  	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
>  
>  	return 0;

Johan

