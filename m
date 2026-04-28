Return-Path: <linux-arm-msm+bounces-104894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPo8Axpl8GmWSwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:43:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E689F47F1C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 586C83007B22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A223AC0E7;
	Tue, 28 Apr 2026 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9XI4NDl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E54F3B5826;
	Tue, 28 Apr 2026 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362096; cv=none; b=jGDsa/iEyijP5VQPcOQTQrc4tYrZE+hnDqL8ZJU0y/rqafGg7VPzvghngbgMqUccntgRjqdm2DEyAwXcIKbLVpzk/xaJwHhaE6CORTT+v5Q6BE1RTdznHV2cumkqj4capSyDfuxdXdut2TJmVNCEjgULxw5jJbacT56XdlDta4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362096; c=relaxed/simple;
	bh=UfYVcnjZ7Yd1VqbbHzwFGlt22qkE7sYoXn7cJY+5boY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+xLFIAhUXo3L8jayvfCtgtYF8HPkN0rxn34o4o9Yrcq4NjIxZaNsQVLBV55LcGqb5Ouu39Nhz/hfuozPx/LDQDHsTX0LdlUNczUWWFI7yJa0+CUHimMm7CXTierQQWuzk4IqBgawHgEZAoHobWaSiWEOqprBXM3btWt6zAzQbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9XI4NDl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7589DC2BCAF;
	Tue, 28 Apr 2026 07:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777362096;
	bh=UfYVcnjZ7Yd1VqbbHzwFGlt22qkE7sYoXn7cJY+5boY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9XI4NDlKQ4ouR8xO0xmvuukD3U+E8twBJIWuneFbU9ESgJxLDGAl+ejeQMerVlA8
	 oKFpcaUBUVSpRiB1fs2UanW/pn3xZbb2t98eLegYJZZxY/laF0PW3w/hCosnp8tyDK
	 w7mivNDfY76dP6IHKrEjwhP1YTtlMVhV228fzYPYrEq5YuEBKX08RAAkMQ8yabpXLY
	 477mqFiYY4Xc3vSnEPNYsYkKp3DGBG9Ve7PhLkM1H6qy0KiuPz1hNkMaLKSwUadSNq
	 yih7OWwLMGKiSLBZPwO3cP00Kqzzts+EHG4PhhN4HBZnV0hlXL3BCYZ2N00fff62X8
	 Iunf09LYhxIVQ==
Date: Tue, 28 Apr 2026 09:41:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: display/msm: Fix typo in clock-names
 property
Message-ID: <20260428-wise-rat-of-criticism-df0ea3@quoll>
References: <20260427154658.276737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427154658.276737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Queue-Id: E689F47F1C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104894-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,vger.kernel.org,lists.freedesktop.org,bp.renesas.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]

On Mon, Apr 27, 2026 at 04:46:58PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Fix the typo "clocks-names" to "clock-names" in the allOf/if conditional
> blocks.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Note, patch applies on top of next-20260427.

No one can apply on top of next-20260427, there are no such maintainer
trees.

Please add Fixes tag.

Best regards,
Krzysztof


