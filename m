Return-Path: <linux-arm-msm+bounces-106437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL4XG/Kh/Gn2SAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:30:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1401E4EA361
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E52BA30ADC14
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE50406293;
	Thu,  7 May 2026 14:25:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E23F20E3;
	Thu,  7 May 2026 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163956; cv=none; b=LKO+j0IySm8VdrDJBwWn7xoAo61qOaxVaeeswKTf1k1+1OBoHg6anI7l1nRRMRskENx0zrzMi2BMoqTA6rbe3HyYgBCHyaZNGLA/n/r9gHgVN9A/4brt1BGGbBKlw17OQgOp+HJqADu9x7vnBNR3zPEmZGLI3o9Gl+FunAShW5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163956; c=relaxed/simple;
	bh=ar8b35BT7DGw9o0JTPaJXc1LkZT88TT0v+x9y+pRWSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SxedWJ1ArHg/bGLtbdEtEh/KimLhMb7ZEFOZWadKmOf0GeD5ukDullA/OKgaa3aDqzXDChHpKWqBaOdIJDcmOnR3rktMVTnt3DlcekWn9SXRZOnbJ6H7u+Q/k3uq1ZS8lEy+U1YPLpNlpw5j/QNH4kIgwSbBvniYxwz7JkkJ904=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz12t1778163924t72b03f88
X-QQ-Originating-IP: d3FR6BTPFfIkyHEhGuflvGaoRQPgM4SifelKYrAD++E=
Received: from [192.168.30.32] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 22:25:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7931842178826442287
EX-QQ-RecipientCnt: 11
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 07 May 2026 22:25:13 +0800
Subject: [PATCH 2/3] interconnect: qcom: sc8280xp: Enable QoS configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-sc8280xp-qos-v1-2-15135858cd98@radxa.com>
References: <20260507-sc8280xp-qos-v1-0-15135858cd98@radxa.com>
In-Reply-To: <20260507-sc8280xp-qos-v1-0-15135858cd98@radxa.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22742; i=sophon@radxa.com;
 h=from:subject:message-id; bh=ar8b35BT7DGw9o0JTPaJXc1LkZT88TT0v+x9y+pRWSg=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJl/Fpy9r+3gs7DFJvGbnF4Ol7vB17U84R2ehxnN2tZdz
 DbT2MrXUcrCIMbFICumyKIQzzCXvTL32lOxUj2YOaxMIEMYuDgFYCIFMgz/Qzli0mTcLp63nv/3
 4IeMXN1vCUw9IbNqT9mtV7tXVv25nZHh1F+fTNcju/Y8PHcvpmR7uLnvgmVJl088vJy1puPmrEJ
 FPgA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M4LpGsSJQudYe2TB1aqVh4yTp4rFjYVsQtkC54qkjyDsMBAa8kujSOxn
	rZS+Ah3YJ/+Ih7iSSvr/RTSvZLJAWTB/HWUaMyavyyjy52HMhMnTEg81dAABzWcMGLp9JfD
	JVGUfxIVUgpfpHH48wgHTOayGJXGXUIoJHZ3BMARCTv6DbCB9/ARsD7XDRzs1uju6tmwVIH
	QVlO14F/olPX1wBUaHkqq9MH5bFOtQeFD/DKNodKB4uDglMFrEuJ3sJjgyg1Nc971sD/ivl
	3kkSjURylPMstBNXH7tJLudA9blxiG7o6/ttiGdIZniRgl9zoZJXTGCG3Bg6A4BWMOuhEZD
	kWnZkzdIiWuWJEfYin60rQ+yrDW3xNhzYXCWWbX7WIh5CipmuG3ogA/ijKTpXsocJWwCsPT
	Xb9xHMwA4J1q7p+F6qmVxAmv2ZgLnn9ajfeFDdBE4NljJA5EQ/DtWP/xwEVOANbStgST947
	dypzOq/2Ggex4sqV0RPAyXJraeXKBW91GfxXNGhXK/UH9GttvX/XUiJ/jZ7d9lUF87QWZJG
	zE5DhQW+BpPnUnV0ZpIQyZuwq0dQsXq5JOndq/D1tsADTUa93Kokr+EIZ1fc8hwbshDOCCQ
	rf7/JlJy9EaXRxH0O2tnh/lCUmxGAdWbM9LITNsGKJzYX0myUv2H4xLpSc0oKlG0b9StpHJ
	toowDxadjKqRatpa3t1p+Y8TxTyBBC0m23ro/YXgAYvmEPVJ/dmRL/RGNQUEyPKzuJEb0bH
	lbdPlBGcpWc42bCofVnZcKE9NcPFGf7FWbyIvP/h/khSmtt1+4eSdhDVfD9ck8TCAMpL9nR
	mn2Sxg1Lq7Nl38i6JsWtybqXQVvj73iXo65gYqcJhUMi86wJR06YSbEEW32eiDesmMxAggE
	bjxci1yo5hOUVRwUyAUYoW22lnGXLj4zBBl+9OAj+PzeN6L4Cr1zoqSWSy7GHcRHJdCHptZ
	URP03zfWMjM37rZy7V1O9n3dWrgad7gs3I5CxkFj7VKjzg1VNYdsOTcoIDuGlUpF9EFOK6b
	kuh08gSo7RCvlyBaVD5JcqwZ1DdWzYu1sa8ytOl2vTEa6yG/Xmdw67rIaDK0cOWKSwHvHnf
	D6jveu3fqXs
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 1401E4EA361
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-106437-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Enable static QoS configuration for SC8280XP NoC master ports with
predefined priority and urgency forwarding values.

Add the QoS box data for the SC8280XP providers, add regmap configurations
for the real NoCs, and mark only aggre1_noc and aggre2_noc as requiring
clocks for QoS register access.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/interconnect/qcom/sc8280xp.c | 356 +++++++++++++++++++++++++++++++++++
 1 file changed, 356 insertions(+)

diff --git a/drivers/interconnect/qcom/sc8280xp.c b/drivers/interconnect/qcom/sc8280xp.c
index ed2161da37bf..333e0aa6b953 100644
--- a/drivers/interconnect/qcom/sc8280xp.c
+++ b/drivers/interconnect/qcom/sc8280xp.c
@@ -216,6 +216,11 @@ static struct qcom_icc_node qhm_qspi = {
 	.name = "qhm_qspi",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x5000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -224,6 +229,11 @@ static struct qcom_icc_node qhm_qup1 = {
 	.name = "qhm_qup1",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x6000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -232,6 +242,11 @@ static struct qcom_icc_node qhm_qup2 = {
 	.name = "qhm_qup2",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xc000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -248,6 +263,12 @@ static struct qcom_icc_node qxm_ipa = {
 	.name = "qxm_ipa",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x8000 },
+		.prio = 2,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -256,6 +277,11 @@ static struct qcom_icc_node xm_emac_1 = {
 	.name = "xm_emac_1",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xd000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -264,6 +290,11 @@ static struct qcom_icc_node xm_sdc4 = {
 	.name = "xm_sdc4",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x7000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -272,6 +303,11 @@ static struct qcom_icc_node xm_ufs_mem = {
 	.name = "xm_ufs_mem",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x9000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -280,6 +316,11 @@ static struct qcom_icc_node xm_usb3_0 = {
 	.name = "xm_usb3_0",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xb000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_snoc },
 };
@@ -288,6 +329,11 @@ static struct qcom_icc_node xm_usb3_1 = {
 	.name = "xm_usb3_1",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_snoc },
 };
@@ -296,6 +342,11 @@ static struct qcom_icc_node xm_usb3_mp = {
 	.name = "xm_usb3_mp",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xe000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_snoc },
 };
@@ -304,6 +355,11 @@ static struct qcom_icc_node xm_usb4_host0 = {
 	.name = "xm_usb4_host0",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xf000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_snoc },
 };
@@ -312,6 +368,11 @@ static struct qcom_icc_node xm_usb4_host1 = {
 	.name = "xm_usb4_host1",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x10000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_snoc },
 };
@@ -320,6 +381,11 @@ static struct qcom_icc_node qhm_qdss_bam = {
 	.name = "qhm_qdss_bam",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -328,6 +394,11 @@ static struct qcom_icc_node qhm_qup0 = {
 	.name = "qhm_qup0",
 	.channels = 1,
 	.buswidth = 4,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xb000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -344,6 +415,12 @@ static struct qcom_icc_node qxm_crypto = {
 	.name = "qxm_crypto",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xe000 },
+		.prio = 2,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -368,6 +445,11 @@ static struct qcom_icc_node xm_emac_0 = {
 	.name = "xm_emac_0",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x11000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -376,6 +458,11 @@ static struct qcom_icc_node xm_pcie3_0 = {
 	.name = "xm_pcie3_0",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x12000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_gem_noc },
 };
@@ -384,6 +471,11 @@ static struct qcom_icc_node xm_pcie3_1 = {
 	.name = "xm_pcie3_1",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xf000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_gem_noc },
 };
@@ -392,6 +484,11 @@ static struct qcom_icc_node xm_pcie3_2a = {
 	.name = "xm_pcie3_2a",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x13000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_gem_noc },
 };
@@ -400,6 +497,11 @@ static struct qcom_icc_node xm_pcie3_2b = {
 	.name = "xm_pcie3_2b",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x14000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_gem_noc },
 };
@@ -408,6 +510,11 @@ static struct qcom_icc_node xm_pcie3_3a = {
 	.name = "xm_pcie3_3a",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x15000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_gem_noc },
 };
@@ -416,6 +523,11 @@ static struct qcom_icc_node xm_pcie3_3b = {
 	.name = "xm_pcie3_3b",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x16000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_gem_noc },
 };
@@ -424,6 +536,11 @@ static struct qcom_icc_node xm_pcie3_4 = {
 	.name = "xm_pcie3_4",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x10000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_gem_noc },
 };
@@ -432,6 +549,11 @@ static struct qcom_icc_node xm_qdss_etr = {
 	.name = "xm_qdss_etr",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x7000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -440,6 +562,11 @@ static struct qcom_icc_node xm_sdc2 = {
 	.name = "xm_sdc2",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x8000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -448,6 +575,11 @@ static struct qcom_icc_node xm_ufs_card = {
 	.name = "xm_ufs_card",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x9000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -587,6 +719,11 @@ static struct qcom_icc_node alm_gpu_tcu = {
 	.name = "alm_gpu_tcu",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa0000 },
+		.prio = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc,
 			&qns_llcc },
@@ -596,6 +733,11 @@ static struct qcom_icc_node alm_pcie_tcu = {
 	.name = "alm_pcie_tcu",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa1000 },
+		.prio = 3,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc,
 			&qns_llcc },
@@ -605,6 +747,11 @@ static struct qcom_icc_node alm_sys_tcu = {
 	.name = "alm_sys_tcu",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa2000 },
+		.prio = 6,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc,
 			&qns_llcc },
@@ -624,6 +771,11 @@ static struct qcom_icc_node qnm_cmpnoc0 = {
 	.name = "qnm_cmpnoc0",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x1b000, 0x66000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc,
 			&qns_llcc },
@@ -633,6 +785,11 @@ static struct qcom_icc_node qnm_cmpnoc1 = {
 	.name = "qnm_cmpnoc1",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x24000, 0x6f000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc,
 			&qns_llcc },
@@ -652,6 +809,11 @@ static struct qcom_icc_node qnm_gpu = {
 	.name = "qnm_gpu",
 	.channels = 4,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 4,
+		.port_offsets = { 0x1c000, 0x1d000, 0x67000, 0x68000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc,
 			&qns_llcc },
@@ -661,6 +823,11 @@ static struct qcom_icc_node qnm_mnoc_hf = {
 	.name = "qnm_mnoc_hf",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x1e000, 0x69000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_llcc,
 			&qns_pcie },
@@ -670,6 +837,11 @@ static struct qcom_icc_node qnm_mnoc_sf = {
 	.name = "qnm_mnoc_sf",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x1f000, 0x6a000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc,
 			&qns_llcc },
@@ -679,6 +851,12 @@ static struct qcom_icc_node qnm_pcie = {
 	.name = "qnm_pcie",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa3000 },
+		.prio = 2,
+		.urg_fwd = 1,
+	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc,
 			&qns_llcc },
@@ -688,6 +866,11 @@ static struct qcom_icc_node qnm_snoc_gc = {
 	.name = "qnm_snoc_gc",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa4000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_llcc },
 };
@@ -696,6 +879,11 @@ static struct qcom_icc_node qnm_snoc_sf = {
 	.name = "qnm_snoc_sf",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xa5000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 3,
 	.link_nodes = { &qns_gem_noc_cnoc,
 			&qns_llcc,
@@ -738,6 +926,11 @@ static struct qcom_icc_node qnm_camnoc_hf = {
 	.name = "qnm_camnoc_hf",
 	.channels = 2,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 2,
+		.port_offsets = { 0x10000, 0x10180 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -746,6 +939,11 @@ static struct qcom_icc_node qnm_mdp0_0 = {
 	.name = "qnm_mdp0_0",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x16000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -754,6 +952,11 @@ static struct qcom_icc_node qnm_mdp0_1 = {
 	.name = "qnm_mdp0_1",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x16080 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -762,6 +965,11 @@ static struct qcom_icc_node qnm_mdp1_0 = {
 	.name = "qnm_mdp1_0",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xf000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -770,6 +978,11 @@ static struct qcom_icc_node qnm_mdp1_1 = {
 	.name = "qnm_mdp1_1",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xf800 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -786,6 +999,11 @@ static struct qcom_icc_node qnm_rot_0 = {
 	.name = "qnm_rot_0",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x17000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -794,6 +1012,11 @@ static struct qcom_icc_node qnm_rot_1 = {
 	.name = "qnm_rot_1",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xe000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -802,6 +1025,11 @@ static struct qcom_icc_node qnm_video0 = {
 	.name = "qnm_video0",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x14000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -810,6 +1038,11 @@ static struct qcom_icc_node qnm_video1 = {
 	.name = "qnm_video1",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x14080 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -818,6 +1051,11 @@ static struct qcom_icc_node qnm_video_cvp = {
 	.name = "qnm_video_cvp",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x15000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -826,6 +1064,11 @@ static struct qcom_icc_node qxm_camnoc_icp = {
 	.name = "qxm_camnoc_icp",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x11000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -834,6 +1077,11 @@ static struct qcom_icc_node qxm_camnoc_sf = {
 	.name = "qxm_camnoc_sf",
 	.channels = 1,
 	.buswidth = 32,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x12000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -900,6 +1148,11 @@ static struct qcom_icc_node qnm_lpass_noc = {
 	.name = "qnm_lpass_noc",
 	.channels = 1,
 	.buswidth = 16,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0xe000 },
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_gemnoc_sf },
 };
@@ -916,6 +1169,12 @@ static struct qcom_icc_node qxm_pimem = {
 	.name = "qxm_pimem",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x10000 },
+		.prio = 2,
+		.urg_fwd = 1,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_gemnoc_gc },
 };
@@ -924,6 +1183,11 @@ static struct qcom_icc_node xm_gic = {
 	.name = "xm_gic",
 	.channels = 1,
 	.buswidth = 8,
+	.qosbox = &(const struct qcom_icc_qosbox) {
+		.num_ports = 1,
+		.port_offsets = { 0x12000 },
+		.prio = 2,
+	},
 	.num_links = 1,
 	.link_nodes = { &qns_gemnoc_gc },
 };
@@ -1997,11 +2261,21 @@ static struct qcom_icc_node * const aggre1_noc_nodes[] = {
 	[SLAVE_SERVICE_A1NOC] = &srvc_aggre1_noc,
 };
 
+static const struct regmap_config sc8280xp_aggre1_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x3af80,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sc8280xp_aggre1_noc = {
+	.config = &sc8280xp_aggre1_noc_regmap_config,
 	.nodes = aggre1_noc_nodes,
 	.num_nodes = ARRAY_SIZE(aggre1_noc_nodes),
 	.bcms = aggre1_noc_bcms,
 	.num_bcms = ARRAY_SIZE(aggre1_noc_bcms),
+	.qos_requires_clocks = true,
 };
 
 static struct qcom_icc_bcm * const aggre2_noc_bcms[] = {
@@ -2033,11 +2307,21 @@ static struct qcom_icc_node * const aggre2_noc_nodes[] = {
 	[SLAVE_SERVICE_A2NOC] = &srvc_aggre2_noc,
 };
 
+static const struct regmap_config sc8280xp_aggre2_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x3af80,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sc8280xp_aggre2_noc = {
+	.config = &sc8280xp_aggre2_noc_regmap_config,
 	.nodes = aggre2_noc_nodes,
 	.num_nodes = ARRAY_SIZE(aggre2_noc_nodes),
 	.bcms = aggre2_noc_bcms,
 	.num_bcms = ARRAY_SIZE(aggre2_noc_bcms),
+	.qos_requires_clocks = true,
 };
 
 static struct qcom_icc_bcm * const clk_virt_bcms[] = {
@@ -2159,7 +2443,16 @@ static struct qcom_icc_node * const config_noc_nodes[] = {
 	[SLAVE_TCU] = &xs_sys_tcu_cfg,
 };
 
+static const struct regmap_config sc8280xp_config_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x2c000,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sc8280xp_config_noc = {
+	.config = &sc8280xp_config_noc_regmap_config,
 	.nodes = config_noc_nodes,
 	.num_nodes = ARRAY_SIZE(config_noc_nodes),
 	.bcms = config_noc_bcms,
@@ -2175,7 +2468,16 @@ static struct qcom_icc_node * const dc_noc_nodes[] = {
 	[SLAVE_GEM_NOC_CFG] = &qns_gemnoc,
 };
 
+static const struct regmap_config sc8280xp_dc_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x5080,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sc8280xp_dc_noc = {
+	.config = &sc8280xp_dc_noc_regmap_config,
 	.nodes = dc_noc_nodes,
 	.num_nodes = ARRAY_SIZE(dc_noc_nodes),
 	.bcms = dc_noc_bcms,
@@ -2209,7 +2511,16 @@ static struct qcom_icc_node * const gem_noc_nodes[] = {
 	[SLAVE_SERVICE_GEM_NOC] = &srvc_sys_gemnoc,
 };
 
+static const struct regmap_config sc8280xp_gem_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xb8400,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sc8280xp_gem_noc = {
+	.config = &sc8280xp_gem_noc_regmap_config,
 	.nodes = gem_noc_nodes,
 	.num_nodes = ARRAY_SIZE(gem_noc_nodes),
 	.bcms = gem_noc_bcms,
@@ -2232,7 +2543,16 @@ static struct qcom_icc_node * const lpass_ag_noc_nodes[] = {
 	[SLAVE_SERVICE_LPASS_AG_NOC] = &srvc_niu_lpass_agnoc,
 };
 
+static const struct regmap_config sc8280xp_lpass_ag_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xf080,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sc8280xp_lpass_ag_noc = {
+	.config = &sc8280xp_lpass_ag_noc_regmap_config,
 	.nodes = lpass_ag_noc_nodes,
 	.num_nodes = ARRAY_SIZE(lpass_ag_noc_nodes),
 	.bcms = lpass_ag_noc_bcms,
@@ -2280,7 +2600,16 @@ static struct qcom_icc_node * const mmss_noc_nodes[] = {
 	[SLAVE_SERVICE_MNOC] = &srvc_mnoc,
 };
 
+static const struct regmap_config sc8280xp_mmss_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1fa80,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sc8280xp_mmss_noc = {
+	.config = &sc8280xp_mmss_noc_regmap_config,
 	.nodes = mmss_noc_nodes,
 	.num_nodes = ARRAY_SIZE(mmss_noc_nodes),
 	.bcms = mmss_noc_bcms,
@@ -2300,7 +2629,16 @@ static struct qcom_icc_node * const nspa_noc_nodes[] = {
 	[SLAVE_SERVICE_NSP_NOC] = &service_nsp_noc,
 };
 
+static const struct regmap_config sc8280xp_nspa_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x10000,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sc8280xp_nspa_noc = {
+	.config = &sc8280xp_nspa_noc_regmap_config,
 	.nodes = nspa_noc_nodes,
 	.num_nodes = ARRAY_SIZE(nspa_noc_nodes),
 	.bcms = nspa_noc_bcms,
@@ -2320,7 +2658,16 @@ static struct qcom_icc_node * const nspb_noc_nodes[] = {
 	[SLAVE_SERVICE_NSPB_NOC] = &service_nspb_noc,
 };
 
+static const struct regmap_config sc8280xp_nspb_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x10000,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sc8280xp_nspb_noc = {
+	.config = &sc8280xp_nspb_noc_regmap_config,
 	.nodes = nspb_noc_nodes,
 	.num_nodes = ARRAY_SIZE(nspb_noc_nodes),
 	.bcms = nspb_noc_bcms,
@@ -2349,7 +2696,16 @@ static struct qcom_icc_node * const system_noc_main_nodes[] = {
 	[SLAVE_SERVICE_SNOC] = &srvc_snoc,
 };
 
+static const struct regmap_config sc8280xp_system_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1a400,
+	.fast_io = true,
+};
+
 static const struct qcom_icc_desc sc8280xp_system_noc_main = {
+	.config = &sc8280xp_system_noc_regmap_config,
 	.nodes = system_noc_main_nodes,
 	.num_nodes = ARRAY_SIZE(system_noc_main_nodes),
 	.bcms = system_noc_main_bcms,

-- 
2.54.0


