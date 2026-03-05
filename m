Return-Path: <linux-arm-msm+bounces-95512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANZLM/YjqWkL2gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:34:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EC420BA78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D9873301489E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 06:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA58304BBC;
	Thu,  5 Mar 2026 06:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGkdP6PT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4632F0C62;
	Thu,  5 Mar 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772692465; cv=none; b=bw8s1J+IeGohXEGgU9W2RNd7ltb1Cf0DIWx1SXr+Y2DhvmxBXjwXt51711+QHLBQEBUnYptq5wSKT7C2NmZjm3piBZ05veVpTz5MW9bP6q+Q29B+2rpsWMA5togOTqC++HQsr14o9RZi+m50mivbQkbKLeL/R+2GIZx6onmavfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772692465; c=relaxed/simple;
	bh=f2dopSibfdiIHFBquHFXrfBYdoRAd/vshIkU1FaNDgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8K3XxCEYXA+rCXG2i5Sfs4JLEf9g4YOQ8GMnpyWQTmoj2qdlt5caTQvCDdRXTUDP/PhvEG4bV7Tks4I2OAg5XqkOyisxLYsoD/qMmD7y5QbUg657wpUymWrZ+k/u/KlzmJAHkpOXXsrORoreYtXpEMBsl2rkGexcAzVrZIX1zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGkdP6PT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46858C116C6;
	Thu,  5 Mar 2026 06:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772692464;
	bh=f2dopSibfdiIHFBquHFXrfBYdoRAd/vshIkU1FaNDgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JGkdP6PTrdNMtWjYk8OM9NLtZmow8GIMiOceeF+o3zCQSczvRqMUuXJZxCBsapJnc
	 Jt78NqvznjZzahrcDE0SPu70E2euUIPR/JvGi+1iUQh1H4ROs1WrR5NiB4Jq2DgoJM
	 2jVVTADCzgFgtPMrWalu/HLEg29Y0fvUDHf/bxlnzKo3FmdgajGY1ZNiVd4oYFZbBw
	 C5edFxHBFRj+fGEknAGf07T33nGe+pfptTGsOTVjBKmGNgXz5m+pfYSJY1LBcJ/ke2
	 J+Kdp5rrlZ9MuCGrIMnxqR21lzhJFrUE/NfDzTJl9IYk2esMvaYhf6kmjobuobQMih
	 sQwGLnyAYbpdw==
Date: Thu, 5 Mar 2026 12:04:15 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, konradybcio@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com, lumag@kernel.org,
	loic.poulain@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <aakj55LZW_maz6UJ@sumit-xelite>
References: <20260122121042.579270-1-sumit.garg@kernel.org>
 <20260122172222.GA2670019-robh@kernel.org>
 <aaWIPgKd-_cm4t7X@sumit-xelite>
 <6yafwubiwtjnpao2crgi3wnfgj5546e3vjcpjnwsnj3y7q76m4@ej3ldry6fbki>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6yafwubiwtjnpao2crgi3wnfgj5546e3vjcpjnwsnj3y7q76m4@ej3ldry6fbki>
X-Rspamd-Queue-Id: D3EC420BA78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95512-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:09:31PM -0600, Bjorn Andersson wrote:
> On Mon, Mar 02, 2026 at 06:23:18PM +0530, Sumit Garg wrote:
> > Hey Bjorn,
> > 
> > On Thu, Jan 22, 2026 at 11:22:22AM -0600, Rob Herring wrote:
> > > On Thu, Jan 22, 2026 at 05:40:39PM +0530, Sumit Garg wrote:
> > > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > 
> > > > Fix IOMMU DT propeties for GPU, display and video peripherals via
> > > > dropping SMMU stream IDs which relates to secure context bank.
> > > > 
> > > > This problem only surfaced when the Gunyah based firmware stack is
> > > > ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> > > > Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> > > > as a fault by Gunyah hypervisor which were previously ignored by QHEE
> > > > hypervisor.
> > > > 
> > > > The DT changes should be backwards compatible with legacy QHEE based
> > > > firmware stack too.
> > > 
> > > To avoid intermittent warnings, Bjorn should pick up the whole series.
> > > 
> > 
> > Just a gentle reminder in case it slipped your attention. Can we pick
> > this as part of fixes for v7.0 release?
> > 
> 
> Thanks for the ping. Is the Gunyah firmware generally available and
> would this thereby be considered a regression that we need to fix for
> v7.0?

Yeah it's already available internally and we are just waiting for a
public release of the Gunyah firmware which is expected to come before
v7.0 gets released.

So, please get these fixes in v7.0 as these are boot critical ones.

-Sumit

> Or can I just pick it for v7.1?
>
> Regards,
> Bjorn

