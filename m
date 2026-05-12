Return-Path: <linux-arm-msm+bounces-107192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLA6FiGOA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:31:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D79352936E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F1CAA307A793
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01BE3D0C18;
	Tue, 12 May 2026 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqJeXpZl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCF73D0C04;
	Tue, 12 May 2026 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617427; cv=none; b=Os4OQIPulFaG6tJpQxO+K9jeSIh4tNlxl6Jy5417yn+DLRtQGUd53/YBYHyv0JV6RbblyXZc/pdLRlfrMNgdS8IZQC1nV55+BMbEh2lOCk7yzMHW5yFuMNWNZpPCPGZgqFooGROkJPxuiVYIYr8FFo7OHrca3WDv9tYWYtHkL98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617427; c=relaxed/simple;
	bh=lkWA8SVTZLYxFAeMOEe8kqVPtYoCyT0Ppqp79vk9lRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YeNxb0q/POs7EEh88g7aZhmKeMAleyA7Ir4gjQCqyzC/Qnrv65WCa7OIUj9nyhbbdqUTKdL2aiHYyENpc3TyJzPWwXre4pKWYmFaYzdQ/LYsLuY3ansoszhP+Nr9089JHdFrviaeu6Bdlw+rm1EQK2+6/IQDaBKnTcS9c0LoKeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqJeXpZl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5F5C2BCB0;
	Tue, 12 May 2026 20:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617427;
	bh=lkWA8SVTZLYxFAeMOEe8kqVPtYoCyT0Ppqp79vk9lRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OqJeXpZl/+vQMDCqzPE2uOnDsHky7ULTsMX0M5bFS8l569NEd2AtNnzcafmu5o2nv
	 zqZ3rPQpE3pz2NyqKxL7vYuNQZmMjR2z7ijFolgEZSXvzJXJR4iZvA/5dnF3n17EgC
	 XjU+f3Bc2X72ly6atn8NRYXfXnpVG+diEtbknk+4ZWg/SWoeJ9hANPm5g5bjSJERgq
	 OpEP0IUKbNgBgjsWFk1a+bVGeyD0NYYuPWsrOVc0VhLUA1mQmtjEpKzzbn8Swv93q0
	 /UI9PHlqxo0eML65PIcIprE4MvIai665jUIRFiAcr97WhprOz206eBnWXqsVosdVYs
	 0QYd/ff6tTp0w==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Daniel J Blueman <daniel@quora.org>
Subject: Re: [RFT PATCH] clk: qcom: dispcc-x1e80100: Fix (possibly) dumping regmap
Date: Tue, 12 May 2026 15:22:59 -0500
Message-ID: <177861739371.1242344.13895936456661762533.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5D79352936E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107192-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 05 May 2026 17:29:09 +0200, Krzysztof Kozlowski wrote:
> Reading few registers at the end of the block (e.g. 0x10000, 0x10004)
> might result in synchronous external abort, so limit the regmap to the
> last readable register which allows dumping the regs for debugging.
> 
> 

Applied, thanks!

[1/1] clk: qcom: dispcc-x1e80100: Fix (possibly) dumping regmap
      commit: c41f66ea9dae235cc1a5c3108a4420483d730328

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

