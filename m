Return-Path: <linux-arm-msm+bounces-114586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wN7NDMT2PWqh9QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:49:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5778D6C9F5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:49:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=CFnr5QJo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114586-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114586-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFB373038B83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 03:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5E82E612E;
	Fri, 26 Jun 2026 03:49:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687F94315F;
	Fri, 26 Jun 2026 03:49:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782445760; cv=none; b=oghei/0JgtXCid+CFnN3HeJYc7X2tXXYYfHRUcEHA3uDTfkORYnyqmxDOUV1Vh7RL/UAsVS8Y9ej8QQK9EUiP57uk6v3DiRHFsNInaVGrR/6fIEgojMeFZrKboFAbUROldoOi7XBobtmaWFz9r07WcbDa0N2CfAh4Ua5SJLkulM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782445760; c=relaxed/simple;
	bh=lYBkepImZanyDf9QC4Q9+aF667H5NSCMeYDWP3/hjmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jCzkIH/Y13Z1/HhYmJxQXsZWJC7RtPehlGn9h6DPLvyzfw9q1f1bL8c7HGI/GTZyX6xshY0ZkNpSPxUx/Qp/R73nGmWJSsqvsotbnFEO3ozEVtqDOEJ3hh3giwgT4klYVcNKesGCi84eM0EOa9jSGkPlSyC8qe7ZfuVVWzFc/Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CFnr5QJo; arc=none smtp.client-ip=220.197.31.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=NW
	yoXbgygOpcCi/yIHJZ3pHe5OxPIWQu5ala3dipl4U=; b=CFnr5QJoMawYwLeLpf
	xegXtiDdL8a75Njdn4O+PV2WpHetfJyUcwNCLk1cwtN74AAwqsdwLOmAJqGIExL3
	jduBbK8MF7YCgDQ6yUgEtTmVEs+Vymy5263bamjzRZx4Oix5X9wDT3qgau/I9xUO
	3WPA72s9olOXKU4gOC2FIv0E4=
Received: from jbd-ThinkPad-X1-Carbon-Gen-14 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXT0sb9j1qMFkbGA--.63492S2;
	Fri, 26 Jun 2026 11:46:36 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: pci_generic: Add SAHARA channel support for Foxconn products
Date: Fri, 26 Jun 2026 11:46:33 +0800
Message-ID: <20260626034633.23112-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXT0sb9j1qMFkbGA--.63492S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF45Gr4rtw48Ar45Cr1xZrb_yoW8AryUpF
	1xZ3yUtrn2yryrXay0y34DKF98W3Z7Xas7tr1qkw10qasYyws0yrW0934IqFWYv3yvqF4f
	tFn8JrWfZF1UJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRahFnUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbCvxyuE2o99hxzrAAA38
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[slark_xiao@163.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:slark_xiao@163.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114586-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[slark_xiao@163.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,163.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5778D6C9F5E

Since we have such a requirement for capturing ram dump for PCIe
WWAN devices, we shall enable this channel.
Currently this change shall be applied with QC original uci driver
which was not upstreamed. And I also found someone try to upstream
similar SAHRA uci client. Maybe this would be help for us as well.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 750da3dbb4c6..59d4c82bafbb 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -491,6 +491,8 @@ static const struct mhi_pci_dev_info mhi_quectel_rm5xx_info = {
 static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
 	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
 	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
@@ -506,6 +508,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
 static const struct mhi_channel_config mhi_foxconn_sdx61_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
 	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
 	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
-- 
2.53.0


