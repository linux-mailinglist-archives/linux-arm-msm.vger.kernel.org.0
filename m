Return-Path: <linux-arm-msm+bounces-92738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Wr9ACkyUjmmhDAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 04:02:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE313283D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 04:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB848305F3F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 03:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459311D95A3;
	Fri, 13 Feb 2026 03:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZV9rS1he"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2026C2A1AA;
	Fri, 13 Feb 2026 03:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770951753; cv=none; b=rK7EkRtCUZQp2Y5hA0/AIvYuNLBYkJePs6H2F/FGx4zvXuyZa4kUcgqbrq78MDjazKheiTPR+JCdPL7ol5dlZrgc+hTFitGW4Ph2BWujGdVyfFCPzvWigau4kd5z6Q0ICz3ruYM9kdBFphpnlb34Sj7eiZMqrwNXifhQAt9LqNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770951753; c=relaxed/simple;
	bh=ARs9CZb7e7/lgIZqVtnRtmdC9U5w3k5FQn9Hq9vkxMk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=brl6RsPHudq/nV7WI6/VwygM+LhZ5NJX53lkez7FC5EMTcCdAVcH7r1vkxp+IHG0aXSaO7K34Winkg72AWVphgnGxwvfWgVCqvTui8hyrhv1pPMZ5j1sBND3EAYhFckq7BJivfhWioM0TEalV7nx0XMyPLMK2niqnKvvG4sBp4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZV9rS1he; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A77C4CEF7;
	Fri, 13 Feb 2026 03:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770951753;
	bh=ARs9CZb7e7/lgIZqVtnRtmdC9U5w3k5FQn9Hq9vkxMk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZV9rS1he2LsZHlh7uGK/QRE0AANDPwkif5Ndtt/a9aqYCYvNDl+tds32UYIRtDItx
	 O0Z9sVjx/eM0Mfh5iuuOJXaDgwdmDOhRjE9YomkqTchVYfRrAJxcgdM3NGkZoYn5ks
	 Jp5dwuHrXWaVmqshPB0i+zM9xbf0oKJjFFEBDW8q+/LSu6Eux3R9qtSiHzggHxqYkJ
	 vObmd01h9dGfATMpTRIxRysRrvskx8LU2HqJ6wB2HmDP9OnAvO3BggpnF4h2HNXeiJ
	 65sGJt1+hLQ3XFkBHBj9xf4GKn5RI1uxS3+Jwvl0bPpTQe2aT4Gokj36s5MAYEhTtI
	 isM3PjGppkVrA==
Date: Thu, 12 Feb 2026 19:02:31 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Manivannan Sadhasivam <mani@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v8 1/2] net: mhi: Enable Ethernet interface support
Message-ID: <20260212190231.681f6e73@kernel.org>
In-Reply-To: <20260212-eth_vdev_next-20260211-v8-1-0974b3a8d61b@qti.qualcomm.com>
References: <20260212-eth_vdev_next-20260211-v8-0-0974b3a8d61b@qti.qualcomm.com>
	<20260212-eth_vdev_next-20260211-v8-1-0974b3a8d61b@qti.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92738-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 78FE313283D
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 16:30:22 +0530 Vivek Pernamitta wrote:
> Add support to configure a new client as Ethernet type over MHI by
> setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
> interface named eth%d. This complements existing NET driver support.

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

