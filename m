Return-Path: <linux-arm-msm+bounces-100239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDZkHhhTxmkkIwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:51:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2037A342048
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DE33301C881
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E63A3CCFA6;
	Fri, 27 Mar 2026 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHHKVt8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A080194A60;
	Fri, 27 Mar 2026 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604771; cv=none; b=f4fgv6s5VV/bQCeE1628OZxu3MQ5Be1tQb4svQdIX44JqFxR/WFcqWOiyN4+BG8VGgMtv6s4w8WZqHLbgONY0/ep4mOYEIs/NSxhtC8BeXa/4yMi/K+G0Flp2Z1IeC0EtPGD4K2mKbE5ne0LHLI92Qq5cNYZr63aJspI3W1dGOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604771; c=relaxed/simple;
	bh=+MUW+avYZt7oaC4kYjMVVARlvKfJmItUyiCG4Endg/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qN6ajIPTFBqu8Nzs4bpn6Ezi03WcwXzY0lxgwkHU9htQHelE0sh35OR5oNOEg7BPLdo0ohWbglaWixfIyq29eXyYV4mbUMKjW7mgKZYtirc40mMz7hTjUh6hjd/bhZgQz2TAzXjxF68z0Wg7SXdvdlvYn0t687i5uOVPIDdat6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHHKVt8F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1D1C19423;
	Fri, 27 Mar 2026 09:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774604771;
	bh=+MUW+avYZt7oaC4kYjMVVARlvKfJmItUyiCG4Endg/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHHKVt8FKWHjtqPzw8YXzj/Kvd6TguCpirQajRUv5c8u0uGhI2XQCmuDfJfAk/MYj
	 2xnSrOhE+BHD/OyWnqgWE7ZgOAcLaDVizQ1UwuMhkUN2bE+RWhdLTPs/lTlreU9bZO
	 F8i3coPbioiHjQ2/Az6pyjov51zt5ndVTDV3eapKAl0dPPY3QgBjlkiRXx/ueRVS1B
	 DF8Tz8lzqYk6h2ALkz7uiCQmRMZxji4t7jZXxcOWp7x42+GdQ5feJHJpXH/54+bCHe
	 a8U8P98A1CPeQWu0HUgmMtoDyUtDOhQdf5IfwHmOL8Zoj83vQE9ptTa4lsxJgAi8DV
	 K2PEUCPR+x0oA==
Date: Fri, 27 Mar 2026 09:46:06 +0000
From: Simon Horman <horms@kernel.org>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3] net: qrtr: fix endian handling of confirm_rx
 field
Message-ID: <20260327094606.GB111839@horms.kernel.org>
References: <20260326-b4-qrtr-fix-confirm_rx-on-big-endian-v3-1-9ea3c855ce39@westermo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326-b4-qrtr-fix-confirm_rx-on-big-endian-v3-1-9ea3c855ce39@westermo.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-100239-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[horms.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,westermo.com:email]
X-Rspamd-Queue-Id: 2037A342048
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 08:17:52AM +0100, Alexander Wilhelm wrote:
> Convert confirm_rx to little endian when enqueueing and convert it back on
> receive. This fixes control flow on big endian hosts, little endian is
> unaffected.
> 
> On transmit, store confirm_rx as __le32 using cpu_to_le32(). On receive,
> apply le32_to_cpu() before using the value. !! ensures the value is 0 or 1
> in native endianness, so the conversion isn’t strictly required here, but
> it is kept for consistency and clarity.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
> Changes in v3:
> - Rebase on latest net-next tree
> - Remove "Fixes" tag
> - Link to v2: https://lore.kernel.org/r/20260324-b4-qrtr-fix-confirm_rx-on-big-endian-v2-1-674fb3f4865b@westermo.com
> 
> Changes in v2:
> - Rebase on latest net tree
> - Improve commit message
> - Link to v1: https://lore.kernel.org/r/20260320-qrtr-fix-confirm_rx-on-big-endian-v1-1-e1a337dc1a38@westermo.com

Thanks for the updates.

Reviewed-by: Simon Horman <horms@kernel.org>


