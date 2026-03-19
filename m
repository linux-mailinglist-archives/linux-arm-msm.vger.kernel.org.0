Return-Path: <linux-arm-msm+bounces-98595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDEnJ+Ruu2nGjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:35:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D222C58CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98EE031D94BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B12F3806B3;
	Thu, 19 Mar 2026 03:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifW2hx+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564612D781E;
	Thu, 19 Mar 2026 03:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891101; cv=none; b=VzXDjVnGFOksHQeJ5PojQXtqCqGx3lRUigvfAYaEQpsehLnU74IQvN8W8SKeVksT+Nb1wrNzoi0cCQiNLF6wJmMgaIO9Hp4c98l0qNkkLam5NyCbAa73khyAtCPoABJdBvYGmdXs7QO9wV5MAZQ05MD4ZsVMYfnrKVrXm4YnbpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891101; c=relaxed/simple;
	bh=H6I5iUhu8WEwyl4RUJBiWSwYRh7/RzqkKvsbi7zUy8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQxTn5o9w2xM/QMdFocOszrD3um+nBtpHwO4Mt2N6TSmm9JiUFs5B0vucRMxIUS3P93G+eXP9Gh+HI4G0d0T5SOFAN6DmeItpzL2EBxgHfMuv1nq0oJqZMuWeZNJCWJMIhJyGmc0kg9n/Ppi8bNanh1FfR4TT9fVOZQU2Idy0ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifW2hx+U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6DCC19421;
	Thu, 19 Mar 2026 03:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891099;
	bh=H6I5iUhu8WEwyl4RUJBiWSwYRh7/RzqkKvsbi7zUy8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ifW2hx+U8NaZJcLLbX94ufGr0m5tNIS4xaSo15GqB7GYyCmMMPo5Nhkox3UrfIMJs
	 TKxDubfXS03QeOeRNiSXdC78juO1gCeHVENN0CyYcfGojX7vPGlgMCUkxKLtfeFkA/
	 kwi6+H+LaatPZXYEKLRxeI+nRJrBeJ6C++ToO+6YJP0DDolJBZr1KgVeFHPX+8GTcG
	 CR4evGHMc22/NKwKxk8chBLBwaNDs4c4VaYLU/UTgMu6ps4m/vDNe+JVVZUBO7R5Vh
	 +lZG3cO4b0Aab2Aw7M1OKrZx0OaQMF5XRtaiOuXno4azjq4kXJL7kIkDiBaa/RuVUS
	 gIefoKU1FZAHw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Koskovich <AKoskovich@pm.me>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/5] Enable Bluetooth and WiFi on Fairphone (Gen. 6)
Date: Wed, 18 Mar 2026 22:31:17 -0500
Message-ID: <177389107881.16612.7570963903012308144.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
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
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98595-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 33D222C58CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 16 Jan 2026 15:50:46 +0100, Luca Weiss wrote:
> Add the required bits to enable Bluetooth and WiFi on the Milos
> SoC-based Fairphone (Gen. 6) smartphone.
> 
> 

Applied, thanks!

[1/5] soc: qcom: pd-mapper: Add Milos compatible
      commit: 678647c26e317d8d1de4d630ee9ffa7ecad637fe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

