Return-Path: <linux-arm-msm+bounces-107726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGREKZfGBmpdngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:09:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DBB54A556
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2426E30B68F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585B93E1CED;
	Fri, 15 May 2026 07:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVQsGyhy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339B53E1721;
	Fri, 15 May 2026 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828643; cv=none; b=A6mdoK1wXycqh6r+nIJyj8sZ/8VX+QsfGhhMF0XjZWcRrhnOQbX4ZeE5fJ7y5k/Avz5Q7qzj5uA5qKlZYi+hZAOWFV8jz4xWzC//Auuqw2BsfPT7cSNj/iy+dvrJFJB9VeXzBGuszLEMY5bbDvUZnPf0n54jY4Top2XpvyrIeNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828643; c=relaxed/simple;
	bh=VHpZwYfNEozDI+mmX5fvgkM6Qsp2KkrAn2XfYL3rH+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEgGnuvB/3NMYoJTqI2CFo1esT7+yjbKi8sDobBqRakDQbtT5QgYbV0H8qyNBGRKkHK1+ahZ2yn9Bn97zSFJKUL3equ7q0+guCyjCgjRVgKWfvkTMlOQWHHSiJVasThTM2LN4hueWsAcIC1iN/C40h7bbZ5nEJSx0ekD/wotzvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVQsGyhy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46380C2BCB0;
	Fri, 15 May 2026 07:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778828642;
	bh=VHpZwYfNEozDI+mmX5fvgkM6Qsp2KkrAn2XfYL3rH+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVQsGyhyrGGTy+Ynv5DH6pAAqYEA2jCqX1HE6J2Zy+bU/rKztBgV2tbXgEYOy+3y0
	 RvPkZml7s+M+u88HySPw4RVc1nVqGJB/ZyHCuOJ/iYrMtgQiL6Fs0VIA5+PNgLukyJ
	 F/iJFdLCnXIA4O/XcNADnKp2nG8cV9mWwqYgPy0xqxQDIDT5Nx6tXch8lsHc9hwW8S
	 UAHV2bm10zN8DzRTGPpiYFp0R8E2suFrFyv1RH7tA9FG7v/YZ2jcFhsLiYT/Nwg5iL
	 egx3sPx+4I8kZoMc3y2likVcrd+kWWsIqCjO9LMEnsjJgpHlLqxXepTN+lrQXzQNPU
	 WCbql5NIOsSYw==
Date: Fri, 15 May 2026 09:04:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	davem@davemloft.net, neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	jikos@kernel.org, bentiss@kernel.org, luzmaximilian@gmail.com, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, Douglas Anderson <dianders@chromium.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: crypto: Add x1e80100 inline crypto
Message-ID: <20260515-pistachio-mongoose-of-engineering-dcd29f@quoll>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
 <14cd42e3d3af4b2591c9dd8dffde11ef18666751.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <14cd42e3d3af4b2591c9dd8dffde11ef18666751.1778822464.git.harrison.vanderbyl@gmail.com>
X-Rspamd-Queue-Id: 12DBB54A556
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107726-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,chromium.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 03:41:47PM +1000, Harrison Vanderbyl wrote:
> Add compatibility string for the x1e80100/x1p42100
> inline crypto engine.
> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>

This was posted, please do not duplicate work.
https://lore.kernel.org/all/eggp3un5ufbw2mjamxmpfccq3cs2luxabpa2sucofydzoak4vg@hy7mx3rtqfko/


Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

Best regards,
Krzysztof


