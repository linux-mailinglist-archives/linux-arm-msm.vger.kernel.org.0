Return-Path: <linux-arm-msm+bounces-92526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE8JEvBvi2lhUQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 18:50:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A411E1AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 18:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FEA7301048A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 17:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C83832ABFD;
	Tue, 10 Feb 2026 17:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="bBgWFrSG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283232D0601
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 17:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770745836; cv=none; b=Kcgyl0xhhsURPRG9jLV+sG7JE1OG9ZV6Sbb/2XB9h+3JbDpVmhktmPqUKCgb89fQT6+ybFr5v2e7QrwK9ZG9Oz8kw0h0BKVmVWZK8FMUfvNlXbplWNwnOZZgq2zi9ajvCSEEsw64Cml6aTLdtqsL1hM8H6d9/2+H0KkgvGrS9Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770745836; c=relaxed/simple;
	bh=7H8AXW46dTjVX8vozCU/ZKW1TUqULLhadiRLsrorCn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o/gzscItNGSAhTwqKAyCsVOK66HndMhMLQg4afh2QhBpTVMN8XT3tSkE+vl7xk3taloinQOVlEt5oOsP+8B+vKgLHc2/aK6umBIhpGFpOL/bL59tBmjbnCuy2lDwt+DZwxHEpvmpGlx4ogdaG0nBWHCMjMNAH4OyUIYoJLiCSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=bBgWFrSG; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1770745832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WzLleB1jTLTyInbriIvdNoziTpV0FYAszLt0XpnXAVQ=;
	b=bBgWFrSG8MSUqES7/uTAcdFP2qMfJlBg2UyD4Ps961EXp6MdSBSF2vNLyBwCWiIvHIJw8Y
	l8DGMt4V40v9jbG5ZZYuIfw/FjcqRl3jmmj4E0wLcGa05/APQS157PzM9l+S2vVPcVG1yS
	ymiPnn9RPEhultAcojk96Wj6lkRDZv2YYehYztx+sXt4o0S18ghdxSQHUYkkFaX7OA3EMC
	ixSiR6Rs89xkm97EshgoTKWUQvTFMkJhW1c9fQzHi20jZ9A2oMHkkrub9haRm95Z9PKxIn
	tTaaXC8h7dl47bJYrwQNvcPOJY1L+GFhdsigeIghQ+GOsWcF+K4BF2zLzMykEA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: x1-dell-thena: Move PERST and Wake GPIOs to PCIe port nodes
Date: Tue, 10 Feb 2026 14:45:27 -0300
Message-ID: <20260210175001.7691-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92526-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[packett.cool:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:mid,packett.cool:dkim,packett.cool:email]
X-Rspamd-Queue-Id: 634A411E1AE
X-Rspamd-Action: no action

Recently the DTs for most Hamoa-based devices received this change, but
the Thena dtsi (common for Dell Latitude and Inspiron SKUs) was skipped.
Apply the change to it.

Fixes: 960609b22be5 ("arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index bf04a12b16bc..fcf2845beb3c 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1081,9 +1081,6 @@ &mdss_dp3_phy {
 };
 
 &pcie4 {
-	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
 
@@ -1098,6 +1095,9 @@ &pcie4_phy {
 };
 
 &pcie4_port0 {
+	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1115,9 +1115,6 @@ wifi@0 {
 };
 
 &pcie6a {
-	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie6a_default>;
@@ -1133,6 +1130,11 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pcie6a_port0 {
+	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
 &pm8550_gpios {
 	rtmr0_default: rtmr0-reset-n-active-state {
 		pins = "gpio10";
-- 
2.52.0


