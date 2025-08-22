Return-Path: <linux-arm-msm+bounces-70376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE50B315F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 121593AB031
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5981A2F8BFC;
	Fri, 22 Aug 2025 10:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfNXgrRb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CCE2F6189;
	Fri, 22 Aug 2025 10:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755860175; cv=none; b=NBDXXUbBpAFZQTMg09/4LhFu+VVhEji21WWZ/VrvVOMWAPiw4KhvpOn/qsg84BvKpN+DPaCYB1MG4mhU53lWmIOtXlo+8VFUtB7RQbJOTc9rv19J7maABxqxAPCleX+5IoiM1XWz4NBqRPBN2qLGiUHI+G2ftraSPqKrMQp/gdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755860175; c=relaxed/simple;
	bh=Y29p5D56IdCwPxS75fiLrqc2z3/aZOozQQw7iVirDKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGFc4ckPQ6CKjDcIurLqeItT0n3VHGOGf57PxVominCVuuQJC0oWRxeZFUIvtsbDTqcUtphe041W8RbflsRI3272dcjCe/wJ4bEo3/QNznNj+i3RdpNYx5eSSCaBfJSfyBxqdzxc40F8WBoapttXe05j/q10IvWuzy0a2f/bZnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfNXgrRb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6BBC4CEED;
	Fri, 22 Aug 2025 10:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755860174;
	bh=Y29p5D56IdCwPxS75fiLrqc2z3/aZOozQQw7iVirDKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfNXgrRbTlpTGbncUjlp3oKLl7vbSs/EWWibyFfXjtl3UGv+tfjVM0i/VivP5Ecmk
	 XtxHyqCyy5oRv+OUz7rDUvasw8Y366O9NLfB7KJzRPZ8SAAu5Vq+ByoXqHeGklFgi/
	 TCSDhzvLl6NYU0JPscssiq/XIUo4ebFfP/58gOL9NXLj6GmCgzsitZU5JFgc3ILnE3
	 uW19gZGeb6q12rmhUGnLE8DJVrnHhxim5AAR88ypJlP62AF2zFyhR+CNUFvrAT4C/n
	 xI1Xk1ojoI9qO2pKrNXKrX8f+YIjiYxCBkzVLAXfFZndMeeBxaZvqiv4aH35KbJc+M
	 TMlTAzqBldumw==
Date: Fri, 22 Aug 2025 16:26:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, vkoul@kernel.org, 
	kishon@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8650
 and SM8750
Message-ID: <pp3hr3kssytyfuuesdfrzdo6hm6e3tjlahla53mlmydetsgxdy@wmxwkatf7lvr>
References: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
 <20250819222832.8471-3-quic_nitirawa@quicinc.com>
 <ger4kizeltjwalfuwu4dpfjiskrv2okgo5c7d6n3pb24yaxgfo@nkcndblyx3il>
 <xir3u3hlmcvfu6uasijz6g2oialoasmuu4bno6ctxpscqcebz6@6kw6xpm5bxbd>
 <761c97bb-ee90-4ace-acd3-08349831aade@oss.qualcomm.com>
 <2635ced4-b91f-4c79-ae2a-079f06bbb8a9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2635ced4-b91f-4c79-ae2a-079f06bbb8a9@quicinc.com>

On Fri, Aug 22, 2025 at 02:53:31PM GMT, Nitin Rawat wrote:
> 
> 
> On 8/22/2025 2:45 PM, Dmitry Baryshkov wrote:
> > On 22/08/2025 11:53, Manivannan Sadhasivam wrote:
> > > On Wed, Aug 20, 2025 at 03:49:31AM GMT, Dmitry Baryshkov wrote:
> > > > On Wed, Aug 20, 2025 at 03:58:26AM +0530, Nitin Rawat wrote:
> > > > > Add regulator load voting support for SM8650 and SM8750 platforms by
> > > > > introducing dedicated regulator bulk data arrays with their load
> > > > > values.
> > > > > 
> > > > > The load requirements are:
> > > > > - SM8650: vdda-phy (205mA), vdda-pll (17.5mA)
> > > > > - SM8750: vdda-phy (213mA), vdda-pll (18.3mA)
> > > > > 
> > > > > This ensures stable operation and proper power management for these
> > > > > platforms where regulators are shared between the QMP USB PHY and
> > > > > other IP blocks by setting appropriate regulator load
> > > > > currents during PHY
> > > > > operations.
> > > > > 
> > > > > Configurations without specific load requirements will continue to work
> > > > > unchanged, as init_load_uA remains zero-initialized when .init_load_uA
> > > > > is not provided.
> > > > 
> > > > Can we please get configuration for the rest of the platforms?
> > > > 
> > > 
> > > Only if the rest of the platforms require setting the load... It is
> > > not very
> > > clear if the older platforms share the regulators with other IPs or not.
> > 
> > Yes, they are usually shared. USB. PCIe and DSI frequently sit on the
> > same voltage rails.
> 
> Yes, it’s typically shared across multiple clients.
> 
> However, as I mentioned earlier, in the current upstream codebase, the
> "regulator-allow-set-load" property is defined only for SM8750 and SM8650
> within the PMIC PHY and PLL device tree nodes. This means that even if the
> UFS PHY driver is updated to vote for this configuration on other platforms,
> it will have no effect, as the property is not supported there.
> 

Which means:

1. Those platforms are still prone to this stability issue.
2. Only UFS is setting the regulator constraint, but not other drivers sharing
the same regulator.

IMO, both cases are bad. At leat, you can update the UFS driver to set the load
now and later on add the DTS property as a follow-up series for those platforms.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

