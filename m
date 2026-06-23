Return-Path: <linux-arm-msm+bounces-114072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D5xkDdvjOWrLygcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:39:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D316B3472
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:39:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nzMjUmEr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114072-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114072-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A34DC307C2E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5927D38735E;
	Tue, 23 Jun 2026 01:31:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7CD386C16;
	Tue, 23 Jun 2026 01:31:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782178316; cv=none; b=nm7Uxz0BunuHHXLG4AjApc60bxmXdnnpAcTayBEUL3gshNui5hTmTzBQzhgSdGad6vMfSQI4NsTc62MQG64cB2mxQJmq0XQ8uKBBJk2J/mrLkWfPIto9HVu+bYS2QzjnQT5WnQB5N5kDPd3Gn+h8Toh4mkZpqIw7nwMdKV4SMmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782178316; c=relaxed/simple;
	bh=9K+M/4HZdspGlMfZXYrFXjuhAei1ZCD3NmYQ+Ymkz0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FU7vyKUSQMhMaqdRrCml1jS2/XLeVVF+vsrHlTbf5ZnWzYK7jiKp4MvXnllV/bN4zLwW3ZUwpJzoqMCYeSLA38m8LrHgXe6SBBM9KdDCP04WJ0Fkq9Zj6B20j9g8bZoPe44cPAVOrdj99IHxrw/J7H4sEKgniL9pChAtpYxF2vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzMjUmEr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75AFD1F00AC4;
	Tue, 23 Jun 2026 01:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782178315;
	bh=675ND78xvurskbFnv1RIRmXuRqzVptTvAcTS/5iJwuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nzMjUmErKFRF/u1XPixWDmK7ZqOdHd9jt0tJYXz7Uor43LjPw5nvNZXual/wot3z4
	 JKbvXpANfoVvwpUopMoQUrTv8C/Hrepp5Akd89Jccs5AesWXs0ilPYNxa8/kSQpD9D
	 HFjnCylJy9I05xu5K+PtdDpZxFe6UzqpwMpvFtBB4X9CW4zV0Ytf5VTqTJ3aMP6lV9
	 bruO4Ty52sKtmDWXXarUtPebP2vk7sQEHm6FIxhu9VRUFpupFwyYsIN/ah0lROWs+/
	 za0GzIpSpGMkvGSC1d60xCKW9Tm8K1dIFLtxbyoQGiLBHRASLWXu8n1L1aL5obbZZ6
	 OFBo+M/eIlK/A==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 23 Jun 2026 01:31:51 +0000
Subject: [PATCH 3/3] firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14
 (UX3407NA)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-zenbook-dts-v1-3-3f80f680381d@oss.qualcomm.com>
References: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
In-Reply-To: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782178312; l=990;
 i=bjorn.andersson@oss.qualcomm.com; s=20260623; h=from:subject:message-id;
 bh=+USkAK8YscT5Xo/IULdKrTH7kUxFxj5JWKaK712ZaCo=;
 b=PYFlwISNiCdOYHpkvO+Lk84UReKQMyp8yDEHcPLVAi9Su9GHDZ27dIwcKECHUaeT2nKhLhwpB
 onEFjxKkwKfByRSD7TfkOanlPS1r8rXw0MkF7ttZK13wn1gc5cCwJfd
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=NcABXERZwQW1ZuuTca83ns67voH6xv+CB55m7ZJPaRE=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114072-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1D316B3472

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

In line with other Glymur-based machines, the Asus Zenbook A14
(UX3407NA) exposes EFI variables through the "uefisecapp". Add it to the
QSEECOM allowlist to enable this access.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89db..96607ac5c10d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2289,6 +2289,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
+	{ .compatible = "asus,zenbook-a14-ux3407na" },
 	{ .compatible = "asus,zenbook-a14-ux3407qa" },
 	{ .compatible = "asus,zenbook-a14-ux3407ra" },
 	{ .compatible = "dell,inspiron-14-plus-7441" },

-- 
2.53.0


