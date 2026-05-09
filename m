Return-Path: <linux-arm-msm+bounces-106770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UU57JnUm/2mE2wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 14:20:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCA84FF915
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 14:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 030A1300E3A0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2026 12:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B359433D4E4;
	Sat,  9 May 2026 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhcFoNnO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E17630FF1D;
	Sat,  9 May 2026 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778329201; cv=none; b=rQ3BCVSjSfRY5fBmAcQSLOZw+7C+hKDwugYJelF45HKA2rZMPEvS7VGBKkcAwn1oSVo/Mg58la8GOMGdZgRqZ36qxntjoKFA6pq4Bl1xjxYpJZfm2wvOQOx9gqEtfM/AZ/0kl/AInLWqbxUQR+ejGjKghXfxpYEMXgz7AvAbq1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778329201; c=relaxed/simple;
	bh=Cq7/QM49XQIon1SXcxU39hmlYFljvekcg/7oaZVUPos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJ/GxbLchSu6LdBwTeIGokhzUHs640ZBQeKfZDLj3po95sXVkSvka61PWKUWMRiSTM6fEyRnkRc0W4FcBFH3TGuJk2PJl9B9OOX23ar7EHcPz9cN/8cd4omPiGPH3K5og9esXHUsqGVL4oBausJCAUdUWwQviTVT94F5Z3R6Yao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhcFoNnO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD15C2BCB2;
	Sat,  9 May 2026 12:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778329201;
	bh=Cq7/QM49XQIon1SXcxU39hmlYFljvekcg/7oaZVUPos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XhcFoNnOLchiOyp+IpFy1WAwrUu4KBrpYvJztnKdW0Fn5ebQPp9EmbiZ4y1NxEsxT
	 XG4bho/mW5xFbcUaMPIP/k2s7GadqLGLbR8/vaC9HDU6d5Ar13ATXwawARlLZHJ84k
	 TwfB3jjeIp3g/FD7k2sk4mRvnzprCP8t3blehYM48Q5A9uqy1/eVf2AMgwiX2wA9dj
	 VXk5IIUzNABErG86Ak8X6EjAWhg9vk2yhffE8xSS17c1O9BOZUVdlH4i9XqDQ7hzVg
	 VEhuaSywM7P/1ln4541/Ucc97rcSGO2u4yAPdRdyH5ClLKijctKTxB/Umi1FhUSSrn
	 hGDT+AgvS6NXw==
Date: Sat, 9 May 2026 13:19:56 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jack Matthews <jack@jackmatthe.ws>
Cc: Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: Regression in split ARM MMIO timer driver
Message-ID: <20260509-ruddy-dragonfly-of-poetry-45e9f1@sudeepholla>
References: <46A20F89-E208-4091-8B6E-B5C38BF82B42@jackmatthe.ws>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46A20F89-E208-4091-8B6E-B5C38BF82B42@jackmatthe.ws>
X-Rspamd-Queue-Id: ECCA84FF915
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106770-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 03:48:14PM -0400, Jack Matthews wrote:
> Hello,
>
> I am working on mainlining an old chip, Qualcomm's MDM9625 modem.
> I had previously booted 6.17-rc3 before putting this project to the side,
> but when I restarted work on 7.0 I was unable to boot. 
> I have bisected this to commit 0f67b56d84b4c49adfd61f19f81f84ec613ab51a
> (https://lore.kernel.org/all/20250814154622.10193-4-maz@kernel.org/) and
> reverting this commit makes the device boot successfully. Unfortunately I do
> not have access to low level debugging such as UART so I have not been able
> to pinpoint exactly what is missing.
> My changes for this chip are all available here in case it is an issue of my
> own doing: https://github.com/jackmthws/linux/commits/mdm9625-latest/.

Looking briefly into the DTS file, I couldn't find the sysreg based arch
timer node in the DT. It could be just an overlook unless there is some
issue with it that it's not added. After the above mentioned commit, the
MMIO timer gets initialised bit late in the boot and could be the reason
for boot failure. Unless you have intentionally not added it, I would
suggest to add it and try.

-- 
Regards,
Sudeep

