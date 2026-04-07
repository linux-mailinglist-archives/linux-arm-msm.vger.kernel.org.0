Return-Path: <linux-arm-msm+bounces-102201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNo3EQUn1WnB1gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:47:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4053B142B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD38D3026B3C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A8B3CF023;
	Tue,  7 Apr 2026 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvTAnQe8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0483C5522;
	Tue,  7 Apr 2026 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576825; cv=none; b=hfFP7zFAtI4kpHmW3nduRzJV9eAlVrLCl+V/qeD5rLeJ3NiZDRWcs/oznbO1+rH2ddN7r62LmtRgDU/3Pewxz44C1V8rWyXOaCF0zWt11MnCGMsrne8CMtVSOkEkXwRL+jHvDOGuG4+SHn2vy0ZnazZQ4CuUDl+iCE4NeutEZBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576825; c=relaxed/simple;
	bh=1C8erMBkmhho8TykF2JBIC5b2QBXVcuu2DWUJn5djhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aNTuWq8iStewOipyWjXt1B/uxRfFyaA3nk6h7R5aw3WYWs6tiNWj7/Eh2NLpuTD2vZqCvlS/Wy+U0Fjoa9tHeZk6TAoRVBVhBdofe3S5DrBSONhgJ3w+WN4fULS5Itd/RwIUx54UKH37T7Jm9vtZmR6FdRoxSMmU4cb30tiWPlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvTAnQe8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96396C116C6;
	Tue,  7 Apr 2026 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576824;
	bh=1C8erMBkmhho8TykF2JBIC5b2QBXVcuu2DWUJn5djhc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jvTAnQe8P+yGh4ImvJZWl3nHohV7xgSYOypm2RfHFOvGr233nuDmuQQpX/F6vqyfz
	 EkBrL+4PyaaKRc1ejm0bq3r2K+nuBlbUCqrrcSYQsZVT0ZeE2Kqc3ETHNubM5e//PQ
	 rhMfpwAydUUuj6bOMBNLUXKktOtnk0L3nEi072y0oujADyUjhIU71t2DWnsJUWjK7W
	 rw/OEsdoZ+DQ5h6L1uaGT6gFzUeqRl/8Z0CNMFtdJjwYRmziwwq4OiXJqAxpI5g8ay
	 SjK5dFAqjKPrNRpj0dnNJqJco81/M8cHEptEbgaUxUtXGiqK9BEfVBF9DBh1UVUWWM
	 AgqOL6r4wOLbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83156FF5109;
	Tue,  7 Apr 2026 15:47:04 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Tue, 07 Apr 2026 16:46:44 +0100
Subject: [PATCH v2 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-rb5gen2-dts-v2-1-d0c7f447ee73@axon.com>
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
In-Reply-To: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775576820; l=1736;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=zqeIqGY0ruAR+kg3tcV4DAYxkIVC1JYpXX7imW3l6zM=;
 b=QB6NgBqN5aVf/a8PYwZobdMpjC7FGvZVQpFZneYFNDbKbNQV+3etFGaAVxyLG4bzbe8J4n05B
 USova4LG1WWA8zzinhP6vnq8oIhXS2VuFbdLVnv5FVV0WJ4rguIi52h
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102201-lists,linux-arm-msm=lfdr.de,jsandom.axon.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[jsandom@axon.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D4053B142B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Joe Sandom <jsandom@axon.com>

Add the MHI register regions to the pcie0 and pcie1 controller nodes
so that the MHI bus layer can access controller registers directly.

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



