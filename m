Return-Path: <linux-arm-msm+bounces-118479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HLICFlp2UmqTQAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:59:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD357424EF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:59:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=U+5P7hSy;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118479-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118479-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FA6A3018284
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 16:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C673F3CBE6E;
	Sat, 11 Jul 2026 16:58:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A2F2C21DD;
	Sat, 11 Jul 2026 16:58:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789131; cv=none; b=NY1oru+EK3HE5nIo6pNoisXTIreonejCDq/Es6vfY4WdczUkcG07VQVPbMFEYfXSlUfluTSKTYFtWkd+DN4s7nfSgNNYzp1IiRCNQmOeVvgaY3MiZvOHxSjJ9mFtH8GsvRVJsy81q1BQG/xBPG3QkyXI6sVH63z3SJVlBdy1YVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789131; c=relaxed/simple;
	bh=Q332TfGMszY4YqhvlmsBVuAgFQPSKMmj4sMy+oYviH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3Dm5IDIiVlSqr8O+CYgIT+v2Yh+hMQlwDuZegbaljBEHbPjyMfHGWisuvMGEUVt0x4XVbJifPpRa0fxGvxJRivFD5ZmdQ0i9cfy8V4wFPpngiKFkoDPidQqeyt5ixufLZc3dXQghUzNELJAjwPEy73bJH32uZlxd/fMSAFo3DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+5P7hSy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C6A1F000E9;
	Sat, 11 Jul 2026 16:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783789130;
	bh=xJMk5wfqfmZ8Km+K3oUYO2vXzYnu5TIhfjfCYG6aJXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U+5P7hSywsTiAsJxEmNblQnkreLzh//QvBfQVoqGeDPv9YhhOZtsMI1JwZkV6u6O4
	 bC+6NNJkM0x8+E9m6xDDWuMmIVwLNuotSvuWcr+D5EjuAMT+Xh+77Wym/tszw5KmDn
	 +ho4taDk06q2GHDiDD9HjNMLg0xWSGlyOHZXASpiuu8HBUFE+wjmiSBQDRP/Ush2Hz
	 LLFXUkg73o0KMBKfA6N+/F2r+oigE+8Uj/0wGmxynlJnpId7lCAuNe3DwJh1pj2A+R
	 lZY3xRP+d5UmnCJZsA4lpySmeLNkHOJpQxi1fR6/dtYSh7ov/gpFd7rBz+EC2lX/P5
	 3s+YCvQPP2bvg==
Date: Sat, 11 Jul 2026 11:58:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: esteuwu@proton.me
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 0/8] SM8450 QoL changes
Message-ID: <alJ1EGIa8WM-iRRN@baldur>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118479-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,baldur:mid,proton.me:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECD357424EF

On Mon, Jun 22, 2026 at 08:54:21PM -0400, Esteban Urrutia via B4 Relay wrote:
> Hello. This is my first attempt at contributing to the Linux kernel.

Welcome! A very good first attempt, I hope you will keep doing this!

> 
> I've been mainlining an SM8475 based device for quite some time now and
> I feel now's the proper time to start submitting patches.
> I'm starting with the smallest part which are mostly modifications
> regarding the current support for the SM8450 SoC.
> 
> Regards,
> Esteban
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
> Esteban Urrutia (8):
>       clk: qcom: dispcc-sm8450: Fix mdss clocks
>       arm64: dts: qcom: sm8450: Remove unneeded reserved memory nodes
>       arm64: dts: qcom: sm8450: Modify GPU operating points
>       arm64: dts: qcom: sm8450: Add missing PCM_OUT port
>       iommu/arm-smmu-qcom: Add SM8450 MDSS compatible
>       phy: qcom: qmp-combo: Drop qmp_v4_calibrate_dp_phy
>       phy: qcom: qmp-combo: Correct pre-emphasis table for QMP v4 DP PHYs
>       arm64: defconfig: Add SM8450 camcc

Sending the patches as a single series implies that there's some sort of
dependency/relationship between them, but as far as I can tell there
isn't.

The changes applies to 4 different maintainers/subsystems. If you group
patches based on their dependencies and who is going to merge them, each
group will be easier to review and merge.

Regards,
Bjorn

> 
>  arch/arm64/boot/dts/qcom/sm8450.dtsi       | 50 ++++++------------------------
>  arch/arm64/configs/defconfig               |  1 +
>  drivers/clk/qcom/dispcc-sm8450.c           |  6 ++--
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c  | 33 +-------------------
>  5 files changed, 16 insertions(+), 75 deletions(-)
> ---
> base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
> change-id: 20260622-sm8450-qol-466b8c07eb5f
> 
> Best regards,
> --  
> Esteban Urrutia <esteuwu@proton.me>
> 
> 

