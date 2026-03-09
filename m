Return-Path: <linux-arm-msm+bounces-96298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM59GPrrrmkWKQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:49:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C06F123C07D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CD6930B980C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 15:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86F93DA7D8;
	Mon,  9 Mar 2026 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JU43hZHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664AA3DEADC
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071078; cv=none; b=mk30aWK46d1WAkv4X9Hm2X+eUjgjOhfIMOikjoYUBjEPDbQSmZ8ycMKr3eu4VKSy+GsdAsQJol+mgs4p48+1elb4WmSrzPoDdyqvPrkJD0prVp9UBvNUEiuClZeRmKECU4BkbWRCJ8PeDy9UcSkoi5fQNhSZcFgXGXnHCcOzg/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071078; c=relaxed/simple;
	bh=lz1ezfgNh94/XLP8fy+tZpmQ73duUYujCzQ3XN5c66s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqFYMV333JXMOiUKSA2v1uaHsGhKsjeynWYrH0Em31Q1pRypq9KARXYuhp8wiQbuT0lJyUQCUaYU3MmvyhFN5HDOiE3SoRR/mOgrzxD09hEjkQNKYrfzmyh966lNOGGSJVrYROS2icn/c3lm9w9H3f6K3WQ22IIo5B/SYL5D1oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JU43hZHO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853a5ffc05so2732125e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 08:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773071076; x=1773675876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qcTW7+6Cg2+gxZdrQfqfkBSqoWwEQDXBlUTitYt0Mio=;
        b=JU43hZHOrHB++2vy4KhOqCYJwvqwGCXX8QloiMjg4GEbChMTuYqtZ+ABsyhp8BkhBM
         Lfi/56p6mb4xpn9Ydx4xtHXWdmsu33g3GlvJq7W20r3P9J4zTKxbFtSknKAbYl2QeDDx
         4vcKmrWqXJFAVkYp27MXFiRg+xybGMmbNcihzOO6ln1DhOaDSkPjfQt73RjgkXgxwek7
         8tPcVJL+CYTBgq30zAEx0friWndwsly4pGPUN//7IdLxlo/u416oFFfGdwTpdM+qJP1k
         cvnvHUdaTJhvzR78HOH0kQ5j8R2preud0Itv2HM90yNoJ6zMXxVx4eNfZhEsSKfAH7Iv
         aVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773071076; x=1773675876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcTW7+6Cg2+gxZdrQfqfkBSqoWwEQDXBlUTitYt0Mio=;
        b=jZ2HnYqbfwivozw2Qvsg/Gh8QS0SnIBDTLqIfvK9HP0hAkcxfk9xtaWiuMgnHKznyB
         60dZWZsa8NW44oasMZ3SlTKDUXQTK/4zGxG4eoLCuQJV1voc3RQgQERH1e18jqX/kwDH
         aYpNv0ubRVEl/nPbuN9+VMdMK7q3Ltw2Xj0KsKPzvOJGlD2aSkC9uX8u5hg+GABsdLv8
         RBig6RF2toFmKVu7+vXmLOpNfb+BUtyfbIBIWWaWQoh/qUGuTKW7ljzL17Ho6D6Az2O1
         E3drVLbFAn0/i1JQWW3rZpYJMV0QEdnCDjjALRXAx3eIQvZQxp1vUCfGpw1VGU0rp8La
         5h2w==
X-Forwarded-Encrypted: i=1; AJvYcCW67Yrm67GY9JtXlVmMrK9pGi4TgMx8hByHFXaBCc1XODmAVWqnWa99bhyn9IUoQnymtfIYUm9EGfMNf+Z9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg9xNub+K4wLt4hp5v3ZWOOTGRfy8gDybshUnRgSg1rTCQFF/l
	CO1uhYjcwsYQNfzsoce8KNydo6au0KUfTV6oSVTuVrf/fOJy8YYvUZoU
X-Gm-Gg: ATEYQzxIJ4edtAxrIqlHllu9mMYtWVoPM4QbTKHrUQKUuUg6LdqeXwYVYGGSPGfSCk4
	iuaCd24WGoqqY+UXB41hiuDWDaAaEtuDEEq42ORLf7UE2d4njfV7PsEhKyXMoDTn6PwmP8JRE1I
	IxbJhPGDUlPY/BjS2cUTeKeuDswSdyOr7wkHQlyFDL1nelbujLb4CYg+Ri9P+nkShwUuDNqhr10
	GKfpJrhIbs003BHkg/HYLcJaUEZm52JWll6CA+XHr5qAMs4Z4E3IidN0UNwL7OEHVtvYFZPHmjn
	peEo9bNqGuaoDljZ3dQ8skNLTqCx/xgJRB5n0uZ4xk8aUT1cDjMTYUowbwCFNYgIvu6KOo5ZaX5
	RBbRQ/6/amaT4nqSq3x8SfLdKew2F7PmRvpRY+YIVD2bApCOzqx0Dx6eQsLgPbEjBZnhzA77LwL
	LjqFj2ZOHe0CagOg==
X-Received: by 2002:a05:600c:c4a2:b0:471:ab1:18f5 with SMTP id 5b1f17b1804b1-48526978618mr112712015e9.7.1773071075458;
        Mon, 09 Mar 2026 08:44:35 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d00a:e00:8799:3a7d:3c86:3200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a6bbcesm439845e9.3.2026.03.09.08.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:44:34 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:44:32 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260309154432.b3dbantow3e3tkry@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
 <aaRBjWhP4-7Kru9D@shell.armlinux.org.uk>
 <20260302155736.1fd2980e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302155736.1fd2980e@kernel.org>
X-Rspamd-Queue-Id: C06F123C07D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96298-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.937];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 03:57:36PM -0800, Jakub Kicinski wrote:
> Alright, I think the best we can do here is to merge patch 2 
> in a "stable tag" way. The rest will have to go via net-next.
> 
> I applied patch 2, Russell please rebase the rest on net-next 
> and repost. Patch 2 should disappear. I don't want to merge it
> now as is without an explicit nod from Vinod. He did ask for 
> a tag and we won't provide one.
> 
> Vinod / Vladimir, to merge the "stable tag" of patch 2:
> 
> tag_name=phy-qcom-sgmii-eth-add-set_mode-and-validate-methods
> git fetch https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
> git tag $tag_name 0e8147f4da00
> git merge $tag_name
> git tag -d $tag_name
> 
> I think this should work.

Thanks for the anonymous tag. I think you mean sha1sum
4ff5801f45b494ad8251a16ec06c9f303ed3b9a0, not 0e8147f4da00.

