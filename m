Return-Path: <linux-arm-msm+bounces-118350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kwzWLN41UWpdAwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:11:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AF173D41C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:11:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WsppvxBC;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118350-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118350-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D35633057F1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E045F3806CA;
	Fri, 10 Jul 2026 18:07:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178FC37B00C;
	Fri, 10 Jul 2026 18:07:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706847; cv=none; b=AcHHs/YfAhFJ+7k1qNSIx2WLb9awzFk5uMvpkK6JBcuFqLmLuqtqHbBh4LxadC7xdva00IUPhgsHRFp/vRHLndtvjCbotPbT8ER15BrkWib1WNfTwG0dEjcVVGfpZetRZAM6YeAqsRnk9zLUm6Pg3NTw5pmomFwc64u/yRmu3DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706847; c=relaxed/simple;
	bh=aGN9UFD3p475WZ6QXcEiVRxsI4VaSpdbdcP+8eMNjsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VKXDG/9DgBNoK+DtbWjIBXP6vKnLLmlhD6Q0FBJ/SZHYt8RxhZ+Pl53yi64UXuzWxlRgkfHmQcBCpSGbuNVPJnNedJx3Th+S7sIgbmjAKsppUXDy2Q5wadP0gUI+6waM0Do3Ksz8eUl7+JI4MQJyszjVZFCbep5ldXzmKVzTy7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsppvxBC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510801F00A3E;
	Fri, 10 Jul 2026 18:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706841;
	bh=CkkWKKS0uGZCaAHGZBZy/8v2NW2sWpG1nQLGD//HsUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WsppvxBCzNiHA7uoHo0VR2TJVPWjt9pSO/0hSJCG1lkGLBe5DyuwNAe3fKC+XOwtT
	 n9wKT+g36dNs2uaIzJdV5Cj32Wx6PQ0IiT0h10udXo8vg6HUbtL1w9slXsY/USPYnr
	 RJPd7w3FiCbGwhznkeP8RMY7foGPkjqIEJ0ZjCeh2YWkPILgE6i6kKbMHpD5QQ2ltL
	 OzjSQMuD4Ryxl3sPI3AVcBgZ/FAEOmE1HNbYWQbj1qS6RP6wUFZwQxPAg4rJLLqoXH
	 E+m0L9qwLlSB4lbhXP6fi8dfo3IvXVLYJb66i2o0k5SNW9yeww4r+LITe1SlE6Gzd2
	 7NO5dqZSJQj0Q==
From: Bjorn Andersson <andersson@kernel.org>
To: mathieu.poirier@linaro.org,
	Uday Khare <udaykhare77@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/4] remoteproc: qcom: Fix glink->node reference leak in qcom_add_glink_subdev
Date: Fri, 10 Jul 2026 13:07:06 -0500
Message-ID: <178370682991.2572738.9046057904322921905.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618132054.11010-1-udaykhare77@gmail.com>
References: <20260618132054.11010-1-udaykhare77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:udaykhare77@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118350-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09AF173D41C


On Thu, 18 Jun 2026 18:50:54 +0530, Uday Khare wrote:
> In qcom_add_glink_subdev(), the device node reference acquired via
> of_get_child_by_name() is stored in glink->node. If the subsequent
> kstrdup_const() allocation for glink->ssr_name fails, the function
> returns early without calling of_node_put() on glink->node, leaking
> the reference count.
> 
> Fix this by adding of_node_put(glink->node) on the error path before
> returning.
> 
> [...]

Applied, thanks!

[1/4] remoteproc: qcom: Fix glink->node reference leak in qcom_add_glink_subdev
      commit: ed5dd2a9b716568ff7d6446322ee60846af313aa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

