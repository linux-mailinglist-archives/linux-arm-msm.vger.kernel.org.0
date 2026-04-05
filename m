Return-Path: <linux-arm-msm+bounces-101882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CzOKkm70mnGaAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:43:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A9239F8EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 21:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25E8F3033D3D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 19:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5675835BDA7;
	Sun,  5 Apr 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHHUdqlv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32008359A6B;
	Sun,  5 Apr 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418040; cv=none; b=dxHgAQbMCjIKYAAIqlx2B4VBFLBoAkHFj+0oMOeGZYmvamYVTjH7vTQEs0H6hPlbSphrvFNH6A81ya6PLfrOZcLwvGMDj//gWo/PKGnsUU/82f5PAJLoBjcA9Z8j0ATZyvDm6smM84CrSM4p89yOMo1v8NYMNAjZegI9CwsFzM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418040; c=relaxed/simple;
	bh=F6qst3LBccqfafD86O3ZKGJti3SyNgdle+pCAPtzzro=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jDgzQSzVyA4vkwTC3cM6m9FBOeuckCWPvimGzkI6765xWxVAAf9B+A2KuOweaWxK+qENWO9ygWnuCQ66YQ4FIDgDCSFv92gafjvuzi1qIZHmfZl6o8zrPwaREc7834o2jefZSv3mjZegCBMW6LpS8tQZ/NyDr9iahaSSSWVux80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHHUdqlv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AA8C116C6;
	Sun,  5 Apr 2026 19:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418039;
	bh=F6qst3LBccqfafD86O3ZKGJti3SyNgdle+pCAPtzzro=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YHHUdqlvUxvqgbqpHgiHnOJxb/bBwCTy+Ye+xBX4NLO67OqGfmJilzzO37Xi+Dk35
	 FHELVBf4Ck80uqRyeWe020nsBrRGMkn/B8IAfc63ZqfPBJkz6q02PB28eBNxcMLRqC
	 r+xZAWg8UXHoWJnqFlGIeQTGB2CBDNakP4i331W4Uwk8zXKaCorpIJ0PW6KpnEIB2Q
	 FWUggyW2SZpi4oW3rY9EVn9YSsSsgI+1cMheIJbPKwnk6Gn19Ly/nJk8RDcZoICbQX
	 Tz0KheAsRVfWnYiPCKMMHwYuEpZ4kwTDCTJj2Tw7wAYz8HFujZVjIBZBlFTwoC5GTT
	 LbwInDF4FQo7g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
Date: Sun,  5 Apr 2026 14:40:19 -0500
Message-ID: <177541802158.2061229.7249314871905290258.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101882-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 43A9239F8EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 31 Mar 2026 11:17:22 +0200, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' contains probe match-like data
> and is not modified: neither by the driver defining it nor by common.c
> code using it.
> 
> Make it const for code safety and code readability.
> 
> 
> [...]

Applied, thanks!

[2/2] clk: qcom: Constify list of critical CBCR registers
      commit: 87df31ea43eef5f6b9e7be0fa2555e58a9455e05

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

