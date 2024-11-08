Return-Path: <linux-arm-msm+bounces-37340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9839C1AB2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 11:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 637622860F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 10:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8361E32BC;
	Fri,  8 Nov 2024 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jw6VeM7M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4F91E32B2;
	Fri,  8 Nov 2024 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731061959; cv=none; b=Xrt8AmF+xkWE/Qri6yGBsJ+ghNLjIrBbFb3o7uMBKKE+zhaglAQYHxqp3zldeca8UkxmdJfZmOXu39YE6bwmccUkh8Xp3tCKRHVLjiHuESDGAYTI30V7bvt6m25x4NPVLhPIU9SsMw3E3XhEd27jaw+fSM0Z++QtBFX5nIzaMmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731061959; c=relaxed/simple;
	bh=Y1DchAs7VMC2A3AGrg36PWB96mQ+5c2bZIG4uYsYJGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AA3SlFgbgQcVYU+XBBBNBHVSL1IQri5vtRwaOsczu2Q8Mq71ODD1OQwXzooO4Yz1XoI+gJgByIJUtWJmpQuOVSE1310AlD4CYb4shf3OWKVEZaCHRwsSjju1YJL9pIAiZu/OuxfoF+N2ZMwuVZ9JilU93X08Pq4DOwwRI2w9IB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jw6VeM7M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DE6C4AF49;
	Fri,  8 Nov 2024 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731061958;
	bh=Y1DchAs7VMC2A3AGrg36PWB96mQ+5c2bZIG4uYsYJGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jw6VeM7MaoKm+BRhRuHk3uLHXcMx10Mp43ZXO8qkVP07TcVCTGaaKCCf1ISwKQF+E
	 ODf8D5xssLYaBDXUmqde42crwmLhEN4FwkeWH0HFoD6jk4r0WXjv6NkGusQQY86P5z
	 cooUnndltc6JqeV9A1WrmJACVsETpoOl2+rJx/uZ3zOMHqXjr2MWS7dhUYI2qIVHIl
	 UqxrRWAV/AmdfgARnJvMhDGuf9viIVi57RRSwNGeFMygGoKm7EmqMu0ONkoVXP2H0J
	 dIEg1K6q8VZxXHnRSguReDmSdElq5qwCuacw4DLT0U3OGArQpEGo26cjXGwdK12BQZ
	 aFZWVfmb4ZbwA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t9MIC-0000000081z-29in;
	Fri, 08 Nov 2024 11:32:40 +0100
Date: Fri, 8 Nov 2024 11:32:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Chris Lew <quic_clew@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
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
Message-ID: <Zy3oyGLdsnDY9C0p@hovoldconsulting.com>
References: <20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

While this probably works, it still looks like a bit of a hack.

Why can't you restructure the code so that the channels are fully
initialised before you register or enable them instead?

Johan

