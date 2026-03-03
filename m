Return-Path: <linux-arm-msm+bounces-95051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGTGOF2ApmmIQgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 07:31:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 409021E9A15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 07:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44B2730379BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 06:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777D133E367;
	Tue,  3 Mar 2026 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hxev20dF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5160B2FBDE0;
	Tue,  3 Mar 2026 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772519513; cv=none; b=gfI6EZZ8s8Wt4cUpaXKGVEufw8/Hu5vRuUAWjaM4M6qmOWw3PoBvs4QnN+lvfpM2pLST4bugA1PnQ7P7N6lQgIpFV+H6PLBJ9g9ImUbRvifsX075oX2EmemH/AKokoKSjUBcds2VhiRpBTk2LoNUYW3yTvFMfxqwQFnuVbEVsyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772519513; c=relaxed/simple;
	bh=etIR7Pe56EdJQFM6d1qXtDhGMMHWIdR7Aif3D35ehjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRHCi62EH8dnrn4BOvqYsXRU2OWQLwLYAKn0SwkQfol4MjBIM1mYAZ4hBjKrgKZJnMvIVwfsluvLCSRQvUnkN6aYZvZHpOIHvY0gbOgctS5FtIM1F0zV2CdGvIxpFeGrt9Rvw13rFblKiAtw9wavU+VCkVaNWRYU4LB4ErHARPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hxev20dF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DF8C116C6;
	Tue,  3 Mar 2026 06:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772519512;
	bh=etIR7Pe56EdJQFM6d1qXtDhGMMHWIdR7Aif3D35ehjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hxev20dFa+dxxwB5bP7ivl+Y1AczyuBBSYjv3OaLW8gvm5Ntid6NW2+EIESuixvhL
	 953KNgVlOyKO7TnKtiVYZkTSgTBWbHDR+gAJDqTReljaT3DidnyXPYpkmP0a/7MNiZ
	 Yf6705jGZZjSsANI7pppbBjL60NwbCyf+Phk5+gj9JMgJPTsWW3B1ZHTl3qc1WTaiI
	 US9O3xk2ZFVQDR4TjAv6HmZw+S7Mwu4N0rOKUEuzlkbVLNoR43qALwDeblDTGeXWix
	 AtVU7GR9t5aqKD2c+KhVCeffJBfrcBTIvubMCf68lanjTJ81pbAq3S3J3tAgPECwu0
	 Ppe3qphaARC2A==
Date: Tue, 3 Mar 2026 07:31:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: display: msm: Fix reg ranges for DP
 example node
Message-ID: <20260303-resilient-bouncy-anteater-b4cf0f@quoll>
References: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-0-8fe49ac1f556@oss.qualcomm.com>
 <20260302-glymur-fix-dp-bindings-reg-clocks-v3-2-8fe49ac1f556@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-2-8fe49ac1f556@oss.qualcomm.com>
X-Rspamd-Queue-Id: 409021E9A15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95051-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:58:36AM +0200, Abel Vesa wrote:
> Add the missing p2, p3, mst2link and mst3link register blocks to the DP
> example node. This is now necessary since the DP schema has been fixed.
> 
> While at it, use actual addresses from the first controller instead of

As pointed out by bot, this must stay bisectable, thus should be
squashed. You can keep two Fixes tags, if both are applicable.

Best regards,
Krzysztof


