Return-Path: <linux-arm-msm+bounces-91927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFlMAqmWhGk43gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 14:10:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE94DF3022
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 14:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9AEB301CC73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 13:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D4C3D413D;
	Thu,  5 Feb 2026 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8wOaubt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA293B95FD;
	Thu,  5 Feb 2026 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770296988; cv=none; b=MxBwk4fiBH23+iQpkXG6VOzP5eSuH7W5brRSFf0ft8rfSYovC259DwxDEn9zuEyo0R6hXCe3ZPd7yKhaOd0CcrYi2xl/nngJ5ig0JyOGBUlzB80bTKex8pMuz2JmzgqeeJBT7vN6FKM5x2ZaS2bLkVXObCpgK2QpHvCGVKWANKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770296988; c=relaxed/simple;
	bh=veMJKaZ6Rc2cigcfOwDAZy09/u0wn043GkOQjCV8XzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dikOKJ7yEoDlRDvndifr7i8dhJz9jTeTx4VCNWYAlCdyFaes9GeBp3jwTLgj5Xy/3yZYFeeCMBRJpSBQu/VugShjbr+7uqNUkilM5+FofgYFvA1hYBP9fsVI7NSlcjDQni1OOm6JUqj+sJeVV3cbjc4C4HNeEMfOLkm14++mH6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8wOaubt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A592C16AAE;
	Thu,  5 Feb 2026 13:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770296988;
	bh=veMJKaZ6Rc2cigcfOwDAZy09/u0wn043GkOQjCV8XzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8wOaubtN529HHkDll7yTtGvTEbxFS3qGpAMAPXAC4QyOzHMd2c1I3nDJ6jfq/Un4
	 mjLCDqVmPOnCUc3r9NKJrozrpuGGcqrk1c62iC+WW3DikLPGyzw6zN4TcrhfIadU9Y
	 w0vworH0mmEkVFLoOXy1vN7rnAHHPQLbZ2Cyf01L4eMcp5YNXEeahAsjtnsJWW16+4
	 zP6VDwro0XZMq/AlaHF5QQ2RIQiUDlBO52gFDIBh01gWnZw36KxEGFiSM8+F0bxN+b
	 VcrRJ4tdZ9HeHjOs3TzQ5e/IoZX2voNodqQC2BsYVDhXq7Cx5eRTYRbbNuKBDykd5H
	 dsLOH6N6/n8dQ==
Date: Thu, 5 Feb 2026 14:09:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611
 DSI Port B
Message-ID: <20260205-calm-aboriginal-mastiff-b07eb3@quoll>
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-3-ba51ce8d2bd2@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128-rubikpi-next-20260116-v2-3-ba51ce8d2bd2@thundersoft.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91927-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org,debian.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thundersoft.com:email,0.0.0.1:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AE94DF3022
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 07:15:47PM +0800, Hongyang Zhao wrote:
> The LT9611 HDMI bridge on RubikPi3 has DSI physically connected to
> Port B. Update the devicetree to use port@1 which corresponds to
> Port B input on the LT9611.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> Reviewed-by: Roger Shimizu <rosh@debian.org>

Where did this happen?

https://lore.kernel.org/all/?q=f%3Arosh%40debian.org

And again, v1 was completely different so how pre-v1-internal-review
could be applied to this v2?

Honestly, initial guidance is useful but continuous development behind
the closed doors is not.

Best regards,
Krzysztof


