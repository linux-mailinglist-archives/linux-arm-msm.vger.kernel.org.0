Return-Path: <linux-arm-msm+bounces-94922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDyIGsSJpWmWDQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:59:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C08061D9541
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8FCA305DB96
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C7C3B3BF3;
	Mon,  2 Mar 2026 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5KMeKiN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E683F3AEF57;
	Mon,  2 Mar 2026 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456007; cv=none; b=oW5lG1OCQlIZrdVCGNS/kKPv/9xd82p/AYQp8Sr5jfXGq28AhurwaHvuKoyLh2mwrpXd2BFEyFRZXXYiXy1bHW27twDI4qjJXsUMlkv83GDYLiwtVtyQAejETcLDwZf0dOTAwKXRumCueyV2RP2sK8YMKAj1q70FB4h1XAd0Ylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456007; c=relaxed/simple;
	bh=Ma06Qc4wIRAgvxUOa0Y6mClVALZOj3jxk9Vqq2IwtHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSrj+5nv2YYg26jRiw3hx9UCXCy6FMMT78LwwQigmYw36Q0y39TcIJSNXYjZ02+9KHfR5z2zyfq6/XwRGoR1BVzso846MDADj6ZkwRI76so4qIxLEQdeNtfwRHfb7+cgrAH3jkxnp4ZrNhfc4SwGDcuDMACxPnGfQpaOshBuJQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5KMeKiN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE8BC19423;
	Mon,  2 Mar 2026 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772456006;
	bh=Ma06Qc4wIRAgvxUOa0Y6mClVALZOj3jxk9Vqq2IwtHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H5KMeKiNwWEtrQI2+K5VCQeVCV4JE1E+Bl8gmfxTwe+9jGiSys4N1L5jf/9Z8o/H8
	 FHrdHF7MkHakRemg3t54RiqEk7ewo6CuF2lxOhRhhaiwSgYEjjoyqC8KCQoT9S4p1M
	 Lmvg/FIWqmBgh+lKIH+dh3amBK1UbiUjxTfpS0Mr6NWeWMveOrxsmq7YPWWDP03p3W
	 ZGdVaAQ5bPMmQ1P9EGgN+u+7OU9MHemA50cDWTjxmUHvWnHoxvfA6hgTCMlpRqHAkD
	 VB5lrUxDiMqO/n7InkCrwhHeDwJwzQLHWJRRiqWq+IbvXftU6WHXvhIA1czXQwfZE/
	 B2z8yo8kIO+oA==
Date: Mon, 2 Mar 2026 18:23:18 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Rob Herring <robh@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	konradybcio@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	akhilpo@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
	lumag@kernel.org, loic.poulain@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com, linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <aaWIPgKd-_cm4t7X@sumit-xelite>
References: <20260122121042.579270-1-sumit.garg@kernel.org>
 <20260122172222.GA2670019-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122172222.GA2670019-robh@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94922-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: C08061D9541
X-Rspamd-Action: no action

Hey Bjorn,

On Thu, Jan 22, 2026 at 11:22:22AM -0600, Rob Herring wrote:
> On Thu, Jan 22, 2026 at 05:40:39PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Fix IOMMU DT propeties for GPU, display and video peripherals via
> > dropping SMMU stream IDs which relates to secure context bank.
> > 
> > This problem only surfaced when the Gunyah based firmware stack is
> > ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> > Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> > as a fault by Gunyah hypervisor which were previously ignored by QHEE
> > hypervisor.
> > 
> > The DT changes should be backwards compatible with legacy QHEE based
> > firmware stack too.
> 
> To avoid intermittent warnings, Bjorn should pick up the whole series.
> 

Just a gentle reminder in case it slipped your attention. Can we pick
this as part of fixes for v7.0 release?

-Sumit

