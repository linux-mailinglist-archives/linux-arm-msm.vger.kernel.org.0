Return-Path: <linux-arm-msm+bounces-102204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aH9oKAcp1WnB1gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:55:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D3A3B161F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FDEA31340FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185213CF04B;
	Tue,  7 Apr 2026 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGhJwOi8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C771B3C3BFE;
	Tue,  7 Apr 2026 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576825; cv=none; b=DanwBF44HfMAWIk3vQRnO+WwevF7NtrWCv7hOfHCFkp7+9iBuCiFwoVPTdKJsjkHqVP1hznr0k0DkCHxpOGe+D/SpTuQ69rif/Nw3iWSo0Px76Sy401fYQp0ke/9OIeZ+ru1BlVRkrqhHMKilUmrlSoHFvrXQJQ+vPSM7eNgZfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576825; c=relaxed/simple;
	bh=88LCgl1K+8KFjEbyLKlJbwFaR2xhzocQoX7vPhKrX/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DPY6OEzvvlPJLEgBHK1ILkvxUvXZWq0CGrOd4JdOeXw+z+rDQ/Q2i75Ba4EVBIk+k/4T4e4tilHZuPwSNNCzGGkI150n+M8dNtLJmcr7UYTn9j+GrJ5X+cgCHSl4xQQgNSTOWU49LIC6mic1B8O6+c6ZVtxznipmgUGgysrO2KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGhJwOi8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5816C2BC9E;
	Tue,  7 Apr 2026 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576824;
	bh=88LCgl1K+8KFjEbyLKlJbwFaR2xhzocQoX7vPhKrX/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HGhJwOi8EC4bbkM7RMPe6+BPtNINP6ibGoMm1MvDbA/2VQzGnUkH+wtLsme6cBf5K
	 fq+29gOz4CfteDsZQGRav1YdrZr5cOVQXC662jehLoTXr96wDupmcMmSmkgSZ2TM9T
	 bowENhVEgv8JR+mVqBXZ5HpY9FlqQ6Gbd9Yc/3CltUuF31q41ChuXI7udMGhkGSbv7
	 ZPsFETxBGmyt7IG2h4WJT4+wb9IFCl16Bq+RsaKyWG8N2QSUjoMQnG10hFwRNt5LBv
	 AeDuoCT2D3yQLnpPBRXkO9ITIdHZ1XgS/WYIMURyqu2+I3cAoQxX7kB23Ksp+sjvRg
	 E5MHT1yMOSXGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CC3FF5106;
	Tue,  7 Apr 2026 15:47:04 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Tue, 07 Apr 2026 16:46:46 +0100
Subject: [PATCH v2 3/5] arm64: dts: qcom: sm8550: move IPA properties to
 SoC device tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-rb5gen2-dts-v2-3-d0c7f447ee73@axon.com>
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
In-Reply-To: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775576820; l=1946;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=DI99AvEpGsL6r2SmlVAToW6BWMlBITxdeE6FFg4G3qY=;
 b=tXT/2YlX7G+47oURLfmV18DiK3si8x62zxALzU6QivbXvnus61nCNt/mfS530KusyxPR+mME+
 KK4Cbmgn3nZDf/LsfdsUFNo3IQ5FrmqcwuG95iz0CsxnfbeBtZca86B
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
	TAGGED_FROM(0.00)[bounces-102204-lists,linux-arm-msm=lfdr.de,jsandom.axon.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,axon.com:email,axon.com:replyto,axon.com:mid]
X-Rspamd-Queue-Id: 05D3A3B161F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Joe Sandom <jsandom@axon.com>

Move qcom,gsi-loader and memory-region properties from individual board
DTS files into the SoC DTSI, since these are common to all SM8550-based
boards.

Signed-off-by: Joe Sandom <jsandom@axon.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 --
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 --
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 2 ++
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index e821b731bdc496c872703723df02ae9b9b0233b5..b795589385520acd74eecc7701cab82f4f7da200 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -939,8 +939,6 @@ &i2c_master_hub_0 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index cf63109ff7bf7b6fc827f108e22e82b8b04273c1..f2effa55d8197819175bfd5a89d2fddb20561548 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -818,8 +818,6 @@ fsa4480_sbu_mux: endpoint {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 54308cbde40732da072177eab533582c155df590..d292dfce6b66fff6cff918b8bd6ac0b9cd22c4b3 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2730,6 +2730,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&ipa_fw_mem>;
 			sram = <&ipa_modem_tables>;
 
 			status = "disabled";

-- 
2.34.1



