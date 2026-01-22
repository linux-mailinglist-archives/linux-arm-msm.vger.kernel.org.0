Return-Path: <linux-arm-msm+bounces-90249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGdpJlxpcmnckQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:15:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 542AC6C2D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9491530C2FC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4D33921CD;
	Thu, 22 Jan 2026 17:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dm8jrwd/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876B73915C2;
	Thu, 22 Jan 2026 17:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102544; cv=none; b=H8tqH+Uf1pdt2mcDd6Tf6xt19B5UPxegSf22ul9q5AT9K+R5+4AiKMzXH8kXpCHZMa1vL6EkDCwiyJG1532GUYzHVDwy/d7uFf9Bsq7SoSqwSuC9U2ZcWJdb4CjW+Vyf6d54k3m2ZScLYiDUwSQg0aDw9w573zJtj9k6oE2pIBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102544; c=relaxed/simple;
	bh=WlIVL33O3Gy2PKVIre446WseRoLM98vaXuHAaI7vsu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYvs0QP6EGK9xs6A92L3ZNWpz6id/1r0sfykkkPIns733fj1FcVEIo2/ZXN4sf/d4cAXcEVe0GQPOS52nnhXyRxcWJUTlRKLnvXx7VLWd5teWqmGY01R+fR2AWvyRTDRJoEuOpJnD3WrSE/3JztgKBc/C33rC6AgninNLE3ywRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dm8jrwd/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F825C116C6;
	Thu, 22 Jan 2026 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769102543;
	bh=WlIVL33O3Gy2PKVIre446WseRoLM98vaXuHAaI7vsu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dm8jrwd/9k4N/YxJSSrSmViIH8gMIzPDuY9SlR0eG1IB4J7rl4UsQ4o3DSp5E/npc
	 LRC8AH7IjTLxHvHBxg8cYovxeCSaSAsv2WNneeUJW1aRNH4UPbOzr+D9hQjhKqzOUp
	 0hAvHDtqOVgkJ/4LDbp2Rrn7Www2a4hJ/I8phYBtQDm6tXHK3fOkKgRRSlWF9CeMY1
	 0nC1Vjm1wnXtDj/9ug85WWpgiMrDRGQCvGP/fL9BiUVjBEN3wFVmrw4m5H76K6VduV
	 B5On9/tltCsjzgpKS5r0spxswGqHzEY8NfTVUAWD7eiElw8+2fUaz9EkpDkm59tYcP
	 KjstPbjzDYrGw==
Date: Thu, 22 Jan 2026 11:22:22 -0600
From: Rob Herring <robh@kernel.org>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com, lumag@kernel.org,
	loic.poulain@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <20260122172222.GA2670019-robh@kernel.org>
References: <20260122121042.579270-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122121042.579270-1-sumit.garg@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90249-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 542AC6C2D6
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 05:40:39PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Fix IOMMU DT propeties for GPU, display and video peripherals via
> dropping SMMU stream IDs which relates to secure context bank.
> 
> This problem only surfaced when the Gunyah based firmware stack is
> ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> as a fault by Gunyah hypervisor which were previously ignored by QHEE
> hypervisor.
> 
> The DT changes should be backwards compatible with legacy QHEE based
> firmware stack too.

To avoid intermittent warnings, Bjorn should pick up the whole series.

Rob

