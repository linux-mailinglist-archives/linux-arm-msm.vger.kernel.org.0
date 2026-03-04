Return-Path: <linux-arm-msm+bounces-95434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KRvK0OEqGmgvQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:13:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C4C206F91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CACA4302263F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 19:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF033DA5A8;
	Wed,  4 Mar 2026 19:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqMAJOtt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCF728504F;
	Wed,  4 Mar 2026 19:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772651394; cv=none; b=KgLTKXrFEf4y/F0tI6HdL2sq0o5eeBYpOGBbqg2ZO8TXdTJ+JnQPM/Emn67nocAC8nd3HkLcrnLV4f71m210nB+sNqFvPDbtI3+g+hbhV1VNQwcGpuAqaSh4CSjl71rgZrLMGiad+oUDBtWDo57N2OGv1+Ta8gBAZDHSJAyi4DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772651394; c=relaxed/simple;
	bh=hpbVWUNxEEHzPDcYAl93i7ZTWuK/43eTmFhvBhl5RoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gg9ZN7LUN3P3gX16qszDbjfxH8GgMuVkHi5Xp0QQslAk0h5IhTgTPFYLIDdg29id25piDqVtp29i2iRx1SsAfbtRSfedG+4aiSoq2Z04zBqZ4xcZzDWQIkQObc8M6OP0F0rr6XccXYzg17unhKa6HicVYc/jezo2R84rb6+4A1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqMAJOtt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5953C4CEF7;
	Wed,  4 Mar 2026 19:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772651393;
	bh=hpbVWUNxEEHzPDcYAl93i7ZTWuK/43eTmFhvBhl5RoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqMAJOttVgjWoQw+dgEHt7jGeyIOV9dpgnYzJWV5qLrm/P7SUaYaehDMfJ3MEejF5
	 wNKSns5H98cqU6lgwtZQI//aOBYZDL4j6KanGC79Nj2Y99g9H7QLhbqeH1Un4n992w
	 EwPlzeF0B/m7re29ELqOxq6QpP3TkwtbnE5zmKzHK7fbz9Fzqv9vnvG7XbLmEDyuBX
	 OMn0A9Yv8V8P1u6hkV2ldPstJzXl4iImwuoK3LIBU+QST9m0nh5Ccu7B54R51sgsIi
	 hDYoG6+MdODEaRN+W+Kb4Cpy9nrLbb9MB2d7LM0h57AMhL1x1spXlqaESzqsHTMMa7
	 6ET4BN6DBg5ow==
Date: Wed, 4 Mar 2026 13:09:31 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	akhilpo@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com, 
	dikshita.agarwal@oss.qualcomm.com, robin.clark@oss.qualcomm.com, lumag@kernel.org, 
	loic.poulain@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <6yafwubiwtjnpao2crgi3wnfgj5546e3vjcpjnwsnj3y7q76m4@ej3ldry6fbki>
References: <20260122121042.579270-1-sumit.garg@kernel.org>
 <20260122172222.GA2670019-robh@kernel.org>
 <aaWIPgKd-_cm4t7X@sumit-xelite>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaWIPgKd-_cm4t7X@sumit-xelite>
X-Rspamd-Queue-Id: 10C4C206F91
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95434-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 06:23:18PM +0530, Sumit Garg wrote:
> Hey Bjorn,
> 
> On Thu, Jan 22, 2026 at 11:22:22AM -0600, Rob Herring wrote:
> > On Thu, Jan 22, 2026 at 05:40:39PM +0530, Sumit Garg wrote:
> > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > 
> > > Fix IOMMU DT propeties for GPU, display and video peripherals via
> > > dropping SMMU stream IDs which relates to secure context bank.
> > > 
> > > This problem only surfaced when the Gunyah based firmware stack is
> > > ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> > > Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> > > as a fault by Gunyah hypervisor which were previously ignored by QHEE
> > > hypervisor.
> > > 
> > > The DT changes should be backwards compatible with legacy QHEE based
> > > firmware stack too.
> > 
> > To avoid intermittent warnings, Bjorn should pick up the whole series.
> > 
> 
> Just a gentle reminder in case it slipped your attention. Can we pick
> this as part of fixes for v7.0 release?
> 

Thanks for the ping. Is the Gunyah firmware generally available and
would this thereby be considered a regression that we need to fix for
v7.0? Or can I just pick it for v7.1?

Regards,
Bjorn

> -Sumit

