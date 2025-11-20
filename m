Return-Path: <linux-arm-msm+bounces-82610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEF3C72442
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 06:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B4724E2A76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 05:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E89301487;
	Thu, 20 Nov 2025 05:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VR40VyuP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1D5301475;
	Thu, 20 Nov 2025 05:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763617266; cv=none; b=kXTTgRF38Mrv+L5g8QFkFyLdJk8xRJRQuuBF2NnsG/QCmA3zsKtIkpwxwWRMdSx8kJ8aJzJXh/2JHSf0ayWJzYl25jIrD8wgcZthsRdklz4Zc0Zc5dPmEhem02AdDOMMG45qpXjPke8ujczpJ1Xjubs7hmiMkkKsdsFLFMizfPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763617266; c=relaxed/simple;
	bh=wyaW6Alb+xIR8XODgiQhXjfy74PuWHyuVMpykJP20eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTGJTqlM6ajHjtj7q12rpDBBW/ko22mtMMJCker0KnIi89+V7tbfUTBglGkznohzhEkrHSRNPgAXBGecwxiWUr48TAHmFxUEG6Qz7yPQQV7grCpvvN0jowQWqKO94Qo38Va+BtcHC8r+xk2GBSo5gVZApXDN0CaAQYArODkNxZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VR40VyuP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AFDC4CEF1;
	Thu, 20 Nov 2025 05:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763617266;
	bh=wyaW6Alb+xIR8XODgiQhXjfy74PuWHyuVMpykJP20eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VR40VyuPukP6WoqZLBTDemSXcGqOXe2Ow/9mJjGTnHXWYGyZGaGJLZMMRPbsUeGR4
	 2EsBKGLGZfRGWAK3eD8VPefP++gppKo4YCTBTrzfaNeBV8XTms/J8X7b96daEW7EHo
	 2TS361mj2KKn/QwFdZxkXwOLco4vuVvTd1YJGGLnFPNrrD7I4RWXtryuhxhy6wR1+M
	 x1QcQM/qXGaVpTOiqzcATUH46a5HTONShpwH1rMZ62lINgbkT1yiHB5dC9HqlAdX0W
	 M90XD//d8CemI+zk8zVbBnMicuk7tyQ9k+1zXd5m3EMhUh0cI1mucV/tulBURnC2Cj
	 5+OwuZjiJjA/g==
Date: Thu, 20 Nov 2025 11:10:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Slark Xiao <slark_xiao@163.com>, ryazanov.s.a@gmail.com, johannes@sipsolutions.net, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for Foxconn
 T99W760
Message-ID: <moob5m5ek4jialx4vbxdkuagrkvvv7ioaqm2yhvei5flrdrzxi@c45te734h3yf>
References: <20251119105615.48295-1-slark_xiao@163.com>
 <20251119105615.48295-3-slark_xiao@163.com>
 <rrqgur5quuejtny576fzr65rtjhvhnprr746kuhgyn6a46jhct@dqstglnjwevx>
 <CAFEp6-18EWK7WWhn4nA=j516pBo397qAWphX5Zt7xq1Hg1nVmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-18EWK7WWhn4nA=j516pBo397qAWphX5Zt7xq1Hg1nVmw@mail.gmail.com>

On Wed, Nov 19, 2025 at 02:08:33PM +0100, Loic Poulain wrote:
> On Wed, Nov 19, 2025 at 12:27 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Wed, Nov 19, 2025 at 06:56:15PM +0800, Slark Xiao wrote:
> > > T99W760 is designed based on Qualcomm SDX35 chip. It use similar
> > > architechture with SDX72/SDX75 chip. So we need to assign initial
> > > link id for this device to make sure network available.
> > >
> > > Signed-off-by: Slark Xiao <slark_xiao@163.com>
> > > ---
> > >  drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
> > > index c814fbd756a1..a142af59a91f 100644
> > > --- a/drivers/net/wwan/mhi_wwan_mbim.c
> > > +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> > > @@ -98,7 +98,8 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rcu(struct mhi_mbim_context *mbim
> > >  static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
> > >  {
> > >       if (strcmp(cntrl->name, "foxconn-dw5934e") == 0 ||
> > > -         strcmp(cntrl->name, "foxconn-t99w515") == 0)
> > > +         strcmp(cntrl->name, "foxconn-t99w515") == 0 ||
> > > +         strcmp(cntrl->name, "foxconn-t99w760") == 0)
> >
> > Can we replace this list of strinc comparisons with some kind of device
> > data, being set in the mhi-pci-generic driver?
> 
> If we move this MBIM-specific information into mhi-pci-generic, we
> should consider using a software node (e.g. via
> device_add_software_node) so that these properties can be accessed
> through the generic device-property API.
> 

MHI has to business in dealing with MBIM specific information as we already
concluded. So it should be handled within the WWAN subsystem.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

