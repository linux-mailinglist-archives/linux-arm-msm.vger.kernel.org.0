Return-Path: <linux-arm-msm+bounces-118343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kv9PCdg0UWoRAwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:07:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F9C73D345
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:07:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BJUC6Hcr;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118343-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118343-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18811301016C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82721378824;
	Fri, 10 Jul 2026 18:07:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE5233D9E;
	Fri, 10 Jul 2026 18:07:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706837; cv=none; b=r4yvln243p2mI61sH5Q2dnF8PLyB0or6dgdzw3RX/jfPEfhJJcql7zb5URpCAxHvkr8KnOPFQn4jYiYgz3eVRcWWko93S7LZdp4a0OfBu9wzdnq9KCvo5LZMNwhVMcWSp02SXicPzyOyzIkjQB99Q8nHI1CNp2eHq09Ap2zY3jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706837; c=relaxed/simple;
	bh=R+3xuU0fGxeS4VtZIuWRNl8qODwyCTkC7JZ7Z+3a2aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d4h9/YFbNIjr4/fJ8dolhTgGk21WdVuEzqBPQdCaRhB5r20Qz32FGDjW8KtzR9nUiaWhkln82kXpDF/zokO6VQtKjfb/pJArkAIBh0spu8FuF5uYYLXlbpqbezG7G04Y35Sy9xMUOk1Sk28qWKsEeGPZn15kNYXvSvGNMN9NNnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJUC6Hcr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2311F000E9;
	Fri, 10 Jul 2026 18:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706836;
	bh=5Xgwd6CE7fFT9Yo/GH1TxWishV+zovn5eviinx1pMPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BJUC6Hcrr3+kVBB/YidRUGKIx9M+oGUfEkslIbogo6IA/bqN6LxiRX7LvFXmrXw5C
	 S/Kx8GSbwUSzmazzvacwFT4sJ+3jyNUHIO90CaQngVjP2OxPIgCVBA+UI54F+3eGpL
	 afTE8JXvwpwhFhat3NiY0K/rPiArgskiU7KW7IV3UXjBzHsjD1Z8LNDT8O8zhwyfC8
	 S03fez4XkTk1M8TH4ay/X1vGkcpbTn7XgJGzsTqDnLzLmFtkMk5pLbGc51cvBv//ZT
	 ZVdqv940QN1Vgcl7NRIXgRoxjL+kFfIaiyL2RZVfuaTw9xcgLr8RKM7XG8am97q6Z9
	 et6CKXR+JIDVw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Make handover IRQ one-shot
Date: Fri, 10 Jul 2026 13:06:59 -0500
Message-ID: <178370682992.2572738.5569287299808984621.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612-rproc-q6v5-handover-irq-one-shot-v1-1-bb688f4446b3@oss.qualcomm.com>
References: <20260612-rproc-q6v5-handover-irq-one-shot-v1-1-bb688f4446b3@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:abel.vesa@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-118343-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60F9C73D345


On Fri, 12 Jun 2026 14:09:08 +0300, Abel Vesa wrote:
> The handover interrupt is expected to be consumed once during each prepare
> cycle. If the remote processor keeps signalling handover after the first
> event, qcom_q6v5 currently logs the duplicate interrupt repeatedly while
> leaving the IRQ enabled.
> 
> Track the handover IRQ enable state explicitly and route all handover IRQ
> enable/disable operations through idempotent helpers. Request the handover
> IRQ with IRQF_NO_AUTOEN so it is only enabled through the helper during
> prepare. The handover handler disables it after marking handover as issued,
> while unprepare disables and synchronizes it before checking whether
> handover was issued.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom: q6v5: Make handover IRQ one-shot
      commit: a5c0d4e3d98ffe9d853c8b06018f7782683215fc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

