Return-Path: <linux-arm-msm+bounces-59218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75457AC22A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 14:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAEE87AF65F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4283D101FF;
	Fri, 23 May 2025 12:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aC79Ajjy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A37EAE7;
	Fri, 23 May 2025 12:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748003467; cv=none; b=X80evqOMpPpwvRL722JwXij1cSf+bEkkG8QDpXYONfzxXWJCHzn8wq0vrAekISH7TxPhkrhrJ9aXBrs7Izil15cIykk/EBZQkrlNeNypHhD3a6u1K8aaZbcWPP6NTI2W3czwMCGt9vzCvYbCC+SXA/gk33NA5D+O97jnlK0UbRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748003467; c=relaxed/simple;
	bh=4y2PveC/h75bcQttgkXFN96tLnxfj24S3ST890NjdU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XcyEL5LhgCrZRPbS9SdVg3QcN4JMrHoTrEFf/TbqBA82F1eFSZlttiwFUCgXskbzpb4en0oMIaGScr9H7tiwRUA4rxOvkOustJNpB2ZJNHhZlU/8y4chzzkGBdwIh0UsPd7fbOhmvRmHf3qyoGjs25+5+ga05fFAgDIJSsahLik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aC79Ajjy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80B9EC4CEF1;
	Fri, 23 May 2025 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748003466;
	bh=4y2PveC/h75bcQttgkXFN96tLnxfj24S3ST890NjdU0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=aC79AjjyfyequVxdv4kjZysK1lGBBNfFn1a6wBX0mRXCwzgBMdkCPhmvru2wPmOZv
	 HN/UDb2yQfhhOpIK4yg9uX3WVAoNk1Uhxeh3tAu4BKnKBGqfwhLoVPMlnow8JRNkKd
	 9bKrvmWVq4m9tNiLovZp5FDhIwPJJn4CBlLrm5NHOhyEuQY856sQfhY9OJeeTQIs7j
	 DeMv6IgabmCGP5CdGmilB9e+E4detaZuI4hb9PuYGB3nrbdBca8oaCEFxkx6FyEpRE
	 MVo/0f2PpvCjSlfygrEh9NDBlvFaL3L5j+nJx+XfFM0SJdG+NTuAt96n0egAIsIzqN
	 Jy//rREnPMPXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4ABC3DA6D;
	Fri, 23 May 2025 12:31:06 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 23 May 2025 16:30:57 +0400
Subject: [PATCH] arm64: dts: qcom: ipq5018: Add crypto nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-ipq5018-crypto-v1-1-0818047d8a18@outlook.com>
X-B4-Tracking: v=1; b=H4sIAIBqMGgC/x3MQQ5AMBBA0avIrDUZZaRxFbGgBrOpakWI9O4ay
 7f4/4XIQThCV7wQ+JIou8uoygLsNrqVlczZoFETkq6V+IOwMsqGx5+7Qt3SZAw1E1rIkQ+8yP0
 P+yGlDy8IbJVgAAAA
X-Change-ID: 20250523-ipq5018-crypto-0265b8854b0c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748003464; l=1660;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=ineOdeuF7pypv/3WmasEmTw596e4Gn4lKAa9inTMryA=;
 b=NkSy9lIFJDZAYFs5H2LeInXpsalg4huxzmDYBVApJ6Qg0iSTNfZ6sHmmT6l6ct7LwsuC5DDuP
 9FQRgSDZfSNDwC+QOnfs5uB2/sNWO/xlUd4JQudZZAqqh+IMmc/b5+R
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

IPQ5018 uses Qualcom QCE crypto engine v5.1 which is already supported.
So let's add the dts nodes for its DMA and QCE itself.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 130360014c5e14c778e348d37e601f60325b0b14..09ed9c34c1c6129174143ae770f8542dbf61128b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -182,6 +182,36 @@ pcie0_phy: phy@86000 {
 			status = "disabled";
 		};
 
+		cryptobam: dma-controller@704000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x00704000 0x20000>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_CRYPTO_AHB_CLK>;
+			clock-names = "bam_clk";
+
+			#dma-cells = <1>;
+			qcom,ee = <1>;
+			qcom,controlled-remotely;
+		};
+
+		crypto: crypto@73a000 {
+			compatible = "qcom,crypto-v5.1";
+			reg = <0x0073a000 0x6000>;
+
+			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
+				 <&gcc GCC_CRYPTO_AXI_CLK>,
+				 <&gcc GCC_CRYPTO_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "core";
+
+			dmas = <&cryptobam 2>,
+			       <&cryptobam 3>;
+			dma-names = "rx",
+				    "tx";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5018-tlmm";
 			reg = <0x01000000 0x300000>;

---
base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
change-id: 20250523-ipq5018-crypto-0265b8854b0c

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



