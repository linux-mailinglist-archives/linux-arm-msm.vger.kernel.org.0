Return-Path: <linux-arm-msm+bounces-93538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABa6ETz4mGlyOgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 01:11:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0C216B83E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 01:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A473A300D690
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 00:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48801373;
	Sat, 21 Feb 2026 00:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVU5Nk3j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9EB800;
	Sat, 21 Feb 2026 00:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771632696; cv=none; b=b90J414KMNEabY5otxBXMvsbakOpnts9h29s01iWONViO80dMMdi83e27nys/q2Zwo0WrtixrB3IdEcNA5lfpoAAi7tq8G3czcAin+DDYvO4ky+6xijX26vlnr8JFxPfQxeElO/4+PLJfqdF1oPRWFPO/hXPZP3SzO9hpCMEwp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771632696; c=relaxed/simple;
	bh=iAa1txVJOw2LWNdxxG5IZ6O8+JDliDDMmQc1XBb4dKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNd+5i0KTWuCO1uPg9xPccbReF2PAmz9yOzqbdPyUr5pRa4Wxx3DVFz9Lu6Rhs408oJ25Yat+lGZvy2OvENI0LgmjaW85wWCxP1ttxbv4vNFmCshjJr2yvgN+1gvf1u+o+a8LivQlsX5m1THpkD/R1nf0htYK0aGge6DB5JDWY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVU5Nk3j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B666FC116C6;
	Sat, 21 Feb 2026 00:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771632696;
	bh=iAa1txVJOw2LWNdxxG5IZ6O8+JDliDDMmQc1XBb4dKQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uVU5Nk3jjuCZ6daTPh+YnA/9YPZ2OY1BNmhJFTRty5+iV6Ytalmgdex0oMksqqB9W
	 SlqYDz9FQyXEAkaVZVGY/lBMXgDhpcHbs61M04tkKMvmp46ZeHf5aSLFo3l6g3PdKk
	 suOT3zwM1V3b+UAdMY+tf57j/maw3Im3/a2pfKohum1v+r0Goe1o2P0ViOJ6rGVlbM
	 8QvBdSQXE65disWP/WSOCe4vtg5ns8IyDjkZy5aum26TiFE+KRjxrKhNUL2s/OzvWa
	 rQXKO0Qh9/oNYHV3oQjeHH4gvZfcse+PH4z+WV/xE0JhtgRR/EaF070PbzNI3V0j3J
	 NDZhM0+Xuk9Pw==
Date: Fri, 20 Feb 2026 16:11:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Alex Elder <elder@kernel.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Alex Elder
 <elder@riscstar.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Simon Horman <horms@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [net-next PATCH v4 0/3] Grab IPA IMEM slice through DT
Message-ID: <20260220161134.5663a273@kernel.org>
In-Reply-To: <20260219-topic-ipa_imem-v4-0-189d91dbee84@oss.qualcomm.com>
References: <20260219-topic-ipa_imem-v4-0-189d91dbee84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-93538-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AF0C216B83E
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 14:49:47 +0100 Konrad Dybcio wrote:
> This adds the necessary driver change to migrate over from
> hardcoded-per-IPA-version-but-varying-per-implementation numbers, while
> unfortunately keeping them in there for backwards compatibility.
> 
> The DT changes will be submitted in a separate series, this one is OK
> to merge independently.

## Form letter - net-next-closed

We have already submitted our pull request with net-next material for v7.0,
and therefore net-next is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Feb 23rd.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed

