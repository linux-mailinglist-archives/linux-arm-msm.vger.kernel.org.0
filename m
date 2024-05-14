Return-Path: <linux-arm-msm+bounces-19829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAA08C5571
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 13:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D6BC1C21CAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 11:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0196C1D54D;
	Tue, 14 May 2024 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RLBQQaKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB501CAA4;
	Tue, 14 May 2024 11:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715687893; cv=none; b=rYxeD1v3i2ULSj0CIYS7Txzugf3GLtL7cscWhpWJJbRLZDPQtRNJ1Q/i9lIasm+fuiHp4floYk9L9s7KjAQ163b6tpR0y3dZPl/3Hqd0HO1nrh1vSxhbLvO2d+solAR37rcWMrqCdWs/OPKwFmHXVrOkZhn4LdEWMyc313JoXa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715687893; c=relaxed/simple;
	bh=dyPe/2/RZS1cHsdwKursv3+vfOD3zDlUKDhy+QlA6kI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avJuUVjAIBpd8F3u/zfbukM3kTWuC2PGdpB8VGDatV775f4+r4IM0UdvupeFGbsIG2MKFhMXun/IjNfsEDQCJ9Bd07SjjtZCRCa37+zl7WnSWS2rikTQFjwcqbV6+A3/ijzmZjmsjZWnUOPv5XPgYNAjz+Rvw3RRuz5HNVMmnSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RLBQQaKc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E2FC2BD10;
	Tue, 14 May 2024 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715687893;
	bh=dyPe/2/RZS1cHsdwKursv3+vfOD3zDlUKDhy+QlA6kI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RLBQQaKcJG3xJeMxoLwyk1zOLW9Hjz/KTx3Ch/erJa1SUgR/h2vJHVbAKjgqPV6K1
	 q7QGxIf3Q+Iq/70vekiIkW/nSXQ4nZh1gEnnjiCuK71qf8Y0OXyP05phhVWdouYkPS
	 Y3qFZTKTNPc+7G8DfU81MaVbPnDND3muFMpxzRWA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Alex Elder <elder@linaro.org>
Subject: [PATCH 5.15 140/168] arm64: dts: qcom: Fix interrupt-map parent address cells
Date: Tue, 14 May 2024 12:20:38 +0200
Message-ID: <20240514101011.972359466@linuxfoundation.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240514101006.678521560@linuxfoundation.org>
References: <20240514101006.678521560@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Rob Herring <robh@kernel.org>

commit 0ac10b291bee84b00bf9fb2afda444e77e7f88f4 upstream.

The 'interrupt-map' in several QCom SoCs is malformed. The '#address-cells'
size of the parent interrupt controller (the GIC) is not accounted for.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Link: https://lore.kernel.org/r/20210928192210.1842377-1-robh@kernel.org
Cc: Alex Elder <elder@linaro.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi |    8 ++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi  |   16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -958,10 +958,10 @@
 			interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi";
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map =	<0 0 0 1 &intc 0 135 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 136 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 138 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 139 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map =	<0 0 0 1 &intc 0 0 135 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 136 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 138 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 139 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
 				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1996,10 +1996,10 @@
 			interrupt-names = "msi";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>,
 				 <&gcc GCC_PCIE_0_AUX_CLK>,
@@ -2101,10 +2101,10 @@
 			interrupt-names = "msi";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
 				 <&gcc GCC_PCIE_1_AUX_CLK>,



