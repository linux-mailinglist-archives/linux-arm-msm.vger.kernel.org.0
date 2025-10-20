Return-Path: <linux-arm-msm+bounces-77960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 375C1BEFF5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 10:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 025724F0772
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 08:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28452DF71E;
	Mon, 20 Oct 2025 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJb24mQ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A360D2C0261;
	Mon, 20 Oct 2025 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949090; cv=none; b=TLgf3z1sfWLP/KOGZv7DHQKd1qX/o6fv21DA2BpYxpmOXWTcSFKMrLVK0jXQTQHEgg+0kg+wCgMPMQ5czvR5LbnRT/rqIia6fAL7njduRuOt8xtNN2vH4WJRJvkv6NvAet4qqmpR9v3xNSj4UtqjlIpERX7zvaNGriEB/50BSXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949090; c=relaxed/simple;
	bh=p+lVEvzAjUBlk7C1+v1sV9NpurMDFd6D+E2N5di3OWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VYjqQLXGLTQ9QSgipKhxTt2YLyqbK4kUXZRyNYCmhgq+dbt+l6SaazRvUyjY3YTYCt7Kg1jEFdWliBCEOlMs+r4mFyTtOgNdmN70DpMaqgkQngd+3DTLtfyA/C/5rEnwix1TrPXDK9gCeFDWANfUO1NqUW2hMG0oV6JYCd0GW2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJb24mQ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2D2C4CEF9;
	Mon, 20 Oct 2025 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760949090;
	bh=p+lVEvzAjUBlk7C1+v1sV9NpurMDFd6D+E2N5di3OWs=;
	h=From:Date:Subject:To:Cc:From;
	b=SJb24mQ7FlYx1WBTxPVxREIlxWtAa6f3W+H3UzZHqJV0IIM9+VOswuEk+gtKadVgm
	 Ghq5wuXApC5LduxNom3Zdv4xWoFzcvpF0LXd0t3hLLNLlCJO/cX/tHgOkji8b1ZLC9
	 dsKHyxRTjGIdn74dEv+ryysfPpFOQ/uI4Tsc2FjcpwQkmyd2D2BLRCoNvlXksSWrOg
	 YWvsv1Py5EE4Loao6bo5H4o/OmOCy21VmVWiFC43hMCBYnTMbx1LqOs3qRXRBZqCPg
	 AcPaKSk5r5mpM5BIET4WqvqTK5pweCojw6qrOtqNOMTlWbdCKbAfmHxV6UddF61LVd
	 JUj0/1QDyDIqA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 20 Oct 2025 10:31:22 +0200
Subject: [PATCH] arm64: dts: qcom: lemans: Align ethernet
 interconnect-names with schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-topic-lemans_eth_dt-v1-1-25f4532addb2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFnz9WgC/x3MTQqAIBBA4avErBPU/qCrRIjplANlohJBdPek5
 bd474GEkTDBWD0Q8aJEpy8QdQXGab8hI1sMkstOcMlZPgMZtuOhfVKYnbKZaTk0ol1a7HoOpQw
 RV7r/6zS/7wdcoZJkZQAAAA==
X-Change-ID: 20251020-topic-lemans_eth_dt-a27314b4e560
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760949086; l=2255;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=rlZmiaYIIXnZ7mveupmWym6yKp8wCMMkO1+lzDo7VR0=;
 b=VaFwg+p5GkkyWYzKFIqSYHBcytGXZTjIdwYfB6QuQ31WifE90qicYzSrECQDrB2GD5RUIm2uI
 RWtHKBk2xorANv+bwfBaMIFo8l2lFeUiyGsPSFwECwRlZqjoVBfv/33
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reshuffle the entries to match the expected order.

Fixes the following warnings:

(qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
(qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index cf685cb186ed..979fb557e9e3 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -6812,11 +6812,12 @@ ethernet1: ethernet@23000000 {
 				      "ptp_ref",
 				      "phyaux";
 
-			interconnects = <&aggre1_noc MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "mac-mem", "cpu-mac";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,
+					<&aggre1_noc MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-mac",
+					     "mac-mem";
 
 			power-domains = <&gcc EMAC1_GDSC>;
 
@@ -6853,11 +6854,12 @@ ethernet0: ethernet@23040000 {
 				      "ptp_ref",
 				      "phyaux";
 
-			interconnects = <&aggre1_noc MASTER_EMAC QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_EMAC_CFG QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "mac-mem", "cpu-mac";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC_CFG QCOM_ICC_TAG_ALWAYS>,
+					<&aggre1_noc MASTER_EMAC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-mac",
+					     "mac-mem";
 
 			power-domains = <&gcc EMAC0_GDSC>;
 

---
base-commit: 606da5bb165594c052ee11de79bf05bc38bc1aa6
change-id: 20251020-topic-lemans_eth_dt-a27314b4e560

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


