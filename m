Return-Path: <linux-arm-msm+bounces-102565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPkJKwFT2Gl4bwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 03:31:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3DE3D11B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 03:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0357E3014C09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 01:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F94277029;
	Fri, 10 Apr 2026 01:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUXREq/X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12B92165EA;
	Fri, 10 Apr 2026 01:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775784702; cv=none; b=tjXDf+66Fa8cOMmWEwEMbWB5YsUMZyprGJtgqYsnmQ0VdL3j850f9LEs02a2ObTXh7rK9VDgbmZDpeywH8FSmCAnxTl7un/HeFGigK/l5VxfEzFuLpPCjAZa4FQBH1fI2Q/6glkIsD5lK32vNj04jaL6A8g+Ov5Os9wwPypfHhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775784702; c=relaxed/simple;
	bh=V0eqrfPC3DyKnqyGvHgxN/vCb+mIQ/W9mLgpRYvLZK0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T2E+jBJ9hDvY6HSopfY/CegwWqlojxHG3b8Uu0QD/zAVpxMDGY8BD2+i1YCr/Qvs31MMlbTFBmrEYw/WURABQxIIvrLXkf3uJjEmRGDaBkAzHnKiyTkSsR5L55gXRpv3YiBH/Jj4QMJaAnPv4/AFmkY0I8I+S4GxkFa5EMDyLsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUXREq/X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A28C4CEF7;
	Fri, 10 Apr 2026 01:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775784702;
	bh=V0eqrfPC3DyKnqyGvHgxN/vCb+mIQ/W9mLgpRYvLZK0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tUXREq/X2eYZdLsQKWGrxmhXLYU+Ng54OdB84rAAPq+MJKSxY5pGTgoNiHr4h+Ptx
	 J//XZykRuzcT27xrCe3BfrdedUsfuraN4n+2cyI/KZfOyntOAiuKoCj3xJznNvRsNA
	 mkt5FdAXM0FJgP63Se67CS0YdB5CrlvA6MDzE2wCwQbWFzmPbzzDzwUeQ6r/nnHozd
	 5ocx8ZP/1PYUIOtalXkII1oBakDeksdkWnAGP7OepHIKnPphxz2ERDxp0bvcyGUrem
	 pxRV1VYH1q1jmYZM0maIoBLi/qoQGXpWn3K2TP95Du3lRPU6W3+lQrjVuLYrsLua7R
	 kFNe0kubHofsw==
Date: Thu, 9 Apr 2026 18:31:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Alexander Koskovich <akoskovich@pm.me>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/6] IPA v5.2 support for Milos and Fairphone (Gen. 6)
Message-ID: <20260409183140.56b99b89@kernel.org>
In-Reply-To: <48464d44-1fac-47a2-839a-c963e9421615@redhat.com>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
	<48464d44-1fac-47a2-839a-c963e9421615@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102565-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4E3DE3D11B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 9 Apr 2026 09:46:31 +0200 Paolo Abeni wrote:
> On 4/3/26 6:43 PM, Luca Weiss wrote:
> > First, two fixes that unbreak IPA v5.0+, which can be applied
> > independently.
> > 
> > Then add support for IPA v5.2 which can be found in the Milos SoC. And
> > finally enable it on Fairphone (Gen. 6) so that mobile data (4G/5G/..)
> > starts working.  
> 
> You should have probably split the series in 2, with patches 1 & 2
> targeting net and the following ones targeting net-next. It looks like
> patch 5 needs some adjustment. I'm applying the first 2.

1 & 2 have now propagated to net-next, please repost 3 & 4.

