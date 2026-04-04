Return-Path: <linux-arm-msm+bounces-101755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHTDKJ3f0GklBgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:53:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FD239A9DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BFCD302BE38
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 09:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E043A9637;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDu9fJE3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BE03A874E;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296273; cv=none; b=eFtQhk/hSdDRIt3Xpt7akjd4wElFAVpKVGxl8FtwLNKYdFOGjLSbpLELLsnUxwV8RImyDqn3iD6aXJWomeecXDjs5TBnFg+jnctdQVSWlWOkUSpJWo3QGXWY6fmhZTwesrNELGLmLLMFoKw1QQTaGhHggI+1JDfd14pxiMkNup0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296273; c=relaxed/simple;
	bh=Vra/2k6XZsVtXYstalJUyiUNk9QEEovbJYAM7Cw82Tc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TP1Ll6H2OOH5DY+fDTE5+ZcWHhAv4dBH91cqCQKXbwqyIC1bRFusGhBMY6CtK5tLvAMpJjMq9RelUmKDiX3A3nm1hbTMMXa29n1shRavSD3ND5ma9IqUa5OF3dx6f3o3Wuoi8vOJiZ0e6OxdlDtkGRSJ8dFd1oG2Un7tS+im8Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDu9fJE3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86B24C4AF0B;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775296273;
	bh=Vra/2k6XZsVtXYstalJUyiUNk9QEEovbJYAM7Cw82Tc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LDu9fJE3oTegn1m9SKdvQjC3f/+Yn+DcBaOZx7BT04wuTAmH5mbIjWm+28Z6Xfobc
	 B7eYbel8Fx8JZntqeIojGPOO70LK+RP7Gvq3ncycMxjolwaBFukiXjo7RbvbGprpal
	 K88GTGpCPiDCQpwqrywbNqpVd16ZR38euvnx4Fl4pWWi1TTo3uh6+xd/C8IhN9c1rp
	 uAzQwZ/BWQ0d/IoPTij8EtctgEQa2rak0Y4ZR5B9uP3gBwUWgeseXADaHQ7mhgMP3e
	 uTfOGnzBwAI39bDYtXMnHNSk5Atre7xmaVLwXdeYpcio2tmkZ5ZseB/41bV7pQFExw
	 k56d8lvjyr4Tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76893E88D96;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Sat, 04 Apr 2026 10:50:55 +0100
Subject: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: update PCIe port label
 reference
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-rb5gen2-dts-v1-2-895f8fc494fc@axon.com>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
In-Reply-To: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775296270; l=718;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=J5wHGXLHT9ZEeK8mCO8+XsWDq4+eMfiE3/aGssrA40c=;
 b=8KhRPaMM/0TP0sqFFPcbk9SQSIB6QkEqGo2pUq0EVkwjG7L1cW2ahYbIaFpumWN7ALvoaApmB
 /hDYcxyfeqdBpSpyPAcPP2OnCB/hfZHBpzC7to3rDPCQldBstrpcEc9
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101755-lists,linux-arm-msm=lfdr.de,jsandom.axon.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[jsandom@axon.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axon.com:email,axon.com:replyto,axon.com:mid,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49FD239A9DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Joe Sandom <jsandom@axon.com>

Update the pcieport0 reference to pcie0_port0 to match the label
rename in sm8550.dtsi.

Signed-off-by: Joe Sandom <jsandom@axon.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a8259d28540e718851e094f74ead278..e821b731bdc496c872703723df02ae9b9b0233b5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1012,7 +1012,7 @@ &pcie0 {
 	status = "okay";
 };
 
-&pcieport0 {
+&pcie0_port0 {
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;

-- 
2.34.1



