Return-Path: <linux-arm-msm+bounces-38977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CC99D7555
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 16:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C822C168C1A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 15:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7E21B85C9;
	Sun, 24 Nov 2024 15:04:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989261B3923;
	Sun, 24 Nov 2024 15:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732460672; cv=none; b=Xn8Ua7mYejtnj8fRTKha0XWAt8HOOdWrVS0LKUANei05B1wQwX2dk7DrsjS8dHgD7x/QJlkSxwFkHyXN9hoJBiqcJg7pMHZfcL2otYyIpLC8/k2//plB2+ctoqh553IaJkUB5jORf4nTLxR3VR4fdDT4DVhPs687WceQONNhYNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732460672; c=relaxed/simple;
	bh=NzAhNdIviC4mcJCGvuq35Fppehjrbw/+lTWbWZ/mAFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hp7LtcLjf+xReX5WeC31r11hR+DkRcOR5mw+Uuw88XirkAnO0J8IMmZKTxRZAyF00kdJq8lo+N/lC+bG767WvvJD9X4y1i6mooPwPx9yxzEncUjC8/4LKXxrBqX5sthmn2i9wdjI+IvY5BlG599XsTDDsnJsOxBFiI4FOAiuk5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20911C4CECC;
	Sun, 24 Nov 2024 15:04:27 +0000 (UTC)
Date: Sun, 24 Nov 2024 20:34:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Chris Lew <quic_clew@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hemant Kumar <quic_hemantk@quicinc.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: Re: [PATCH] net: qrtr: mhi: synchronize qrtr and mhi preparation
Message-ID: <20241124150422.nt67aonfknfhz3sc@thinkpad>
References: <20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com>
 <Zy3oyGLdsnDY9C0p@hovoldconsulting.com>
 <b1e22673-2768-445c-8c67-eae93206cca5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1e22673-2768-445c-8c67-eae93206cca5@quicinc.com>

On Thu, Nov 21, 2024 at 04:28:41PM -0800, Chris Lew wrote:
> 
> 
> On 11/8/2024 2:32 AM, Johan Hovold wrote:
> > On Mon, Nov 04, 2024 at 05:29:37PM -0800, Chris Lew wrote:
> > > From: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > 
> > > The call to qrtr_endpoint_register() was moved before
> > > mhi_prepare_for_transfer_autoqueue() to prevent a case where a dl
> > > callback can occur before the qrtr endpoint is registered.
> > > 
> > > Now the reverse can happen where qrtr will try to send a packet
> > > before the channels are prepared. Add a wait in the sending path to
> > > ensure the channels are prepared before trying to do a ul transfer.
> > > 
> > > Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> > > Reported-by: Johan Hovold <johan@kernel.org>
> > > Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com/
> > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> > 
> > > @@ -53,6 +54,10 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
> > >   	if (skb->sk)
> > >   		sock_hold(skb->sk);
> > > +	rc = wait_for_completion_interruptible(&qdev->prepared);
> > > +	if (rc)
> > > +		goto free_skb;
> > > +
> > >   	rc = skb_linearize(skb);
> > >   	if (rc)
> > >   		goto free_skb;
> > > @@ -85,6 +90,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
> > >   	qdev->mhi_dev = mhi_dev;
> > >   	qdev->dev = &mhi_dev->dev;
> > >   	qdev->ep.xmit = qcom_mhi_qrtr_send;
> > > +	init_completion(&qdev->prepared);
> > >   	dev_set_drvdata(&mhi_dev->dev, qdev);
> > >   	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> > > @@ -97,6 +103,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
> > >   		qrtr_endpoint_unregister(&qdev->ep);
> > >   		return rc;
> > >   	}
> > > +	complete_all(&qdev->prepared);
> > >   	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
> > 
> > While this probably works, it still looks like a bit of a hack.
> > 
> > Why can't you restructure the code so that the channels are fully
> > initialised before you register or enable them instead?
> > 
> 
> Ok, I think we will have to stop using the autoqueue feature of MHI and
> change the flow to be mhi_prepare_for_transfer() -->
> qrtr_endpoint_register() --> mhi_queue_buf(DMA_FROM_DEVICE). This would make
> it so ul_transfers only happen after mhi_prepare_for_transfer() and
> dl_transfers happen after qrtr_endpoint_register().
> 
> I'll take a stab at implementing this.
> 

Hmm, I thought 'autoqueue' was used for a specific reason. So it is not valid
now?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

