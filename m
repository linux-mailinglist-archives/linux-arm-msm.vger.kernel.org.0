Return-Path: <linux-arm-msm+bounces-51688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7529A66D5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 09:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EF031886C98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E521DE4DC;
	Tue, 18 Mar 2025 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7SbVcyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256C31C5F2C;
	Tue, 18 Mar 2025 08:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742285033; cv=none; b=mjt1SNrv281WBiEr5Vc9K4CHLC0IGK3bq1hGGmilUnuyoo6Beky1CVNq5T09N2w5eDW2IPUUCYmAiuBiKwIgAAh7X1oOtIMObTQlDzducV0mgQCX+pD9G0tWi+o0cUE6ltAS7j0cSnMtG1Lm5/xyy39zvvEKQgpwfZIDVYU8THg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742285033; c=relaxed/simple;
	bh=f9CYo4Uw3wv/kLJ+02y6bPa2u62OtlEWZY3oV/TKKpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daK/9PygXsEGWwy3X20gWrnHR0k7TuamJDGZ3wqbLZ7GsqJer7+Rt806SC2gXVtw/ghovg75QLcz43E6F9XwxgkqpYzxM0zql3VwOmPPDUb+R+5g31dKd/kMLx5RAIBgkQFw2e3xEZ9RwUDTKS1gAbyJmLgtRd9oL7hn3WheIiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7SbVcyZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA15C4CEE9;
	Tue, 18 Mar 2025 08:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742285032;
	bh=f9CYo4Uw3wv/kLJ+02y6bPa2u62OtlEWZY3oV/TKKpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7SbVcyZ7qG2+PtmM4gLx7qy5lOObOGtzj1GSnGZQMjpYQR+eMT47pYFbujd+ex4w
	 yGExsM1D/dAxC/v+Pgecv6o2QOIK2W4k5OZHnue2DnT5KCRg5lD1+Zo2qHlyJGB1s+
	 x9mUPzprBB3L0G+uWcIkbjVu3M2L1s/zHjxqRNGJrpyVaI0YaihjqgDN/EoNWeKaPq
	 SfjJxiOPKrWWNf93idH0+KAM7wqHiDQm1kdb5fYiqqzzxq1jrmz/VBt8bvj/DCI9KP
	 wixKQJ+wk62rVUmoaFGEqw/GcrOmG6ohrQRh3JmzYCTa3WAWHuERJTI1BD5TTwivbu
	 PtjNg5w5e3GFA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tuRvU-0000000041L-024q;
	Tue, 18 Mar 2025 09:03:52 +0100
Date: Tue, 18 Mar 2025 09:03:52 +0100
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
Message-ID: <Z9ko6PIObQZfTSvM@hovoldconsulting.com>
References: <20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com>
 <Zy3oyGLdsnDY9C0p@hovoldconsulting.com>
 <b1e22673-2768-445c-8c67-eae93206cca5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1e22673-2768-445c-8c67-eae93206cca5@quicinc.com>

Hi Chris,

On Thu, Nov 21, 2024 at 04:28:41PM -0800, Chris Lew wrote:
> On 11/8/2024 2:32 AM, Johan Hovold wrote:
> > On Mon, Nov 04, 2024 at 05:29:37PM -0800, Chris Lew wrote:
> >> From: Bhaumik Bhatt <bbhatt@codeaurora.org>
> >>
> >> The call to qrtr_endpoint_register() was moved before
> >> mhi_prepare_for_transfer_autoqueue() to prevent a case where a dl
> >> callback can occur before the qrtr endpoint is registered.
> >>
> >> Now the reverse can happen where qrtr will try to send a packet
> >> before the channels are prepared. Add a wait in the sending path to
> >> ensure the channels are prepared before trying to do a ul transfer.
> >>
> >> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> >> Reported-by: Johan Hovold <johan@kernel.org>
> >> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com/
> >> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> >> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> > 
> >> @@ -53,6 +54,10 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
> >>   	if (skb->sk)
> >>   		sock_hold(skb->sk);
> >>   
> >> +	rc = wait_for_completion_interruptible(&qdev->prepared);
> >> +	if (rc)
> >> +		goto free_skb;
> >> +
> >>   	rc = skb_linearize(skb);
> >>   	if (rc)
> >>   		goto free_skb;
> >> @@ -85,6 +90,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
> >>   	qdev->mhi_dev = mhi_dev;
> >>   	qdev->dev = &mhi_dev->dev;
> >>   	qdev->ep.xmit = qcom_mhi_qrtr_send;
> >> +	init_completion(&qdev->prepared);
> >>   
> >>   	dev_set_drvdata(&mhi_dev->dev, qdev);
> >>   	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> >> @@ -97,6 +103,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
> >>   		qrtr_endpoint_unregister(&qdev->ep);
> >>   		return rc;
> >>   	}
> >> +	complete_all(&qdev->prepared);
> >>   
> >>   	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
> > 
> > While this probably works, it still looks like a bit of a hack.
> > 
> > Why can't you restructure the code so that the channels are fully
> > initialised before you register or enable them instead?
> 
> Ok, I think we will have to stop using the autoqueue feature of MHI and 
> change the flow to be mhi_prepare_for_transfer() --> 
> qrtr_endpoint_register() --> mhi_queue_buf(DMA_FROM_DEVICE). This would 
> make it so ul_transfers only happen after mhi_prepare_for_transfer() and 
> dl_transfers happen after qrtr_endpoint_register().
> 
> I'll take a stab at implementing this.

This bug still exists in mainline and occasionally triggers a
NULL-pointer dereference on boot with the in-kernel pd-mapper on X Elite
laptops like the T14s.

Have you made any progress in reworking the code to address the race?

Johan

