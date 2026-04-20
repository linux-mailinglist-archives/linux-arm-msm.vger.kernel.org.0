Return-Path: <linux-arm-msm+bounces-103707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLZZH2Xu5WnxpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:14:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7C2428B7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0641F3032678
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EA838A70B;
	Mon, 20 Apr 2026 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaTVtaYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC6837F74B;
	Mon, 20 Apr 2026 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776676398; cv=none; b=IToQ4928i17K3MrSrak5JBTOAlAJCluc+XfKyMiEBDG/QVbYv4AGWFCJAL/69FLo2KtTW+70FmOERSEwyb0qyUzS0qHSUG3j0793C6gG48kkx2w4JiKRrfO1HgaJxVAsQKQ4DoaUMw6cFbCfZuInsyDaNvIAlpU3NcG3/gbFOk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776676398; c=relaxed/simple;
	bh=kYKKh3yjhrCLUcr9S2EWw9HdMii+lLklObWQOAAVf0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLYC62PqQB2/qYkgNyIzj25ruz5Mglrc8V4QT1DrEDJPVts6SY9u4WmYL6EtTSNN+A5JhMpDAQkzDflF0vf6PUncmpqgRHbyQsKAJGcQYaRXELFCix0vrnOv4SDr3s5yJCP3Bs8sGFRyQFALauQMROawm78jrZcCD3DktS3wJSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaTVtaYt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0307AC2BCB6;
	Mon, 20 Apr 2026 09:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776676398;
	bh=kYKKh3yjhrCLUcr9S2EWw9HdMii+lLklObWQOAAVf0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jaTVtaYtN+TlR/zbYGrv3gzHOorOP18lxvg6j15y7UAMWTAzooGez/RNKRKIDfAbV
	 HMzQ96wrM/qBtMgoedyqjPrYuXKKYaMsJaKhQ5YornDvvYS1tV9Nllo2IgHMpc7xSo
	 z6OMO+FzHhGsmH+i364C9zXQYI/6iEKYHdkNqPJS+1ZqX2tALcxOavMU0S+jgFwOd2
	 OdBltugHTGoM2rxePSqWgZg+gDKJj4NylrcP3Mo569qxcm0cIEsMeyjAkociGiGylJ
	 uEdkdBcsVdfsUXuR8Z3vWZQ/56k4m38ccWoQRALlEKEhvUgDUgK2r7+szZ+KdV5SJM
	 mTgPtzEZLfZOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E414BF557ED;
	Mon, 20 Apr 2026 09:13:17 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Mon, 20 Apr 2026 10:13:13 +0100
Subject: [PATCH v4 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-rb5gen2-dts-v4-1-b461909c2de8@axon.com>
References: <20260420-rb5gen2-dts-v4-0-b461909c2de8@axon.com>
In-Reply-To: <20260420-rb5gen2-dts-v4-0-b461909c2de8@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776676395; l=1909;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=Vi+0IvziSsy7bRQBuTCX0upSx5r7zT4LrrG+rgsBuCw=;
 b=0bXjcyd6K6tC1I21oPSPLM85JgG3kJHrUiVSBvb534nzaNWR3ui8LDWnHAcurATFY1PuSE6qk
 lY1A/RXHd4+CY3HN2mSwQS5m5XU8QlxzfgE1X9LZDX0Twb6J3JGPun7
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103707-lists,linux-arm-msm=lfdr.de,jsandom.axon.com];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[jsandom@axon.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,axon.com:email,axon.com:replyto,axon.com:mid,qualcomm.com:email,1c08000:email]
X-Rspamd-Queue-Id: DB7C2428B7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Joe Sandom <jsandom@axon.com>

Add the MHI register regions to the pcie0 and pcie1 controller nodes
to expose link power state transition counters (L0s/L1/L1.1/L1.2/L2)
via debugfs. The PCIe host driver uses this region to read the
link_transition_count from the MHI registers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Joe Sandom <jsandom@axon.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6f5e1cbb8887ee0bf9e39650dc4ff..055ca931c04859f3a312eb9921aeb7a8cc676822 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1964,8 +1964,14 @@ pcie0: pcie@1c00000 {
 			      <0 0x60000000 0 0xf1d>,
 			      <0 0x60000f20 0 0xa8>,
 			      <0 0x60001000 0 0x1000>,
-			      <0 0x60100000 0 0x100000>;
-			reg-names = "parf", "dbi", "elbi", "atu", "config";
+			      <0 0x60100000 0 0x100000>,
+			      <0 0x01c03000 0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
@@ -2138,8 +2144,14 @@ pcie1: pcie@1c08000 {
 			      <0x0 0x40000000 0x0 0xf1d>,
 			      <0x0 0x40000f20 0x0 0xa8>,
 			      <0x0 0x40001000 0x0 0x1000>,
-			      <0x0 0x40100000 0x0 0x100000>;
-			reg-names = "parf", "dbi", "elbi", "atu", "config";
+			      <0x0 0x40100000 0x0 0x100000>,
+			      <0x0 0x01c0b000 0x0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,

-- 
2.34.1



