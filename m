Return-Path: <linux-arm-msm+bounces-61154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC3CAD7E7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 00:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 470371736EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 22:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8E72DFA3B;
	Thu, 12 Jun 2025 22:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtOJ4aMR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABBD2DECB1;
	Thu, 12 Jun 2025 22:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767849; cv=none; b=Uk+V91LRJOp44ViUgvuRN7uUX7oQkE15KGkedanbN346Di8igdAFK6Bx82EvQWRrNWCAu1fSStRWf+H212KrptugGicE1vqZEA+voT4KX2ZculEmaSmmeb1S3MpiCN1rxpnUMwojcpeTECdIRcDrWmH47BL5e2sML8bNd+OO7BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767849; c=relaxed/simple;
	bh=1uYvRcI0pxSXAIY2O+3sCtQu0vDyFPdZRcPi7GWU6QM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uo69IAuLvdEiXMtxat6L2lYTD6r0aNJo1kXe4TWh/xglMV2YTDEft8YmNyA/wxBhkYhdK8TSGAgiX/K8jGwKv65IVI6rlyBXmaFfEOSbdKR/IQaCoXTX2dQC2NvcbFWfiJYXT7X6ci7acIxejIIks3kdxaYHvrj2WcipLknVdWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtOJ4aMR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A17BC4CEF0;
	Thu, 12 Jun 2025 22:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749767848;
	bh=1uYvRcI0pxSXAIY2O+3sCtQu0vDyFPdZRcPi7GWU6QM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AtOJ4aMRYz6ugL0UeRJsFUdmeIDhGTfg+NM5PO+jDHzcGMsO4VWjGJhJ1hEaFJNTU
	 eojTdb9YPAtAz7Gm8INIGdowF6oXlLU6z8B4BO73Ppc/tSRUFoGSBzyAw+TdbO/lCL
	 Td99WyLyGZzTMhg86utHQ1jRPa4zZppYXdwrAwnM9qb6MTqan59Io+4lpKfqJl30Vh
	 zwaTqTt6ZJRFejbsx1ZyyYyUAS2OyQqq2RoIJK73aZpSlQvMdlIZ2a28wFO4Reqh9H
	 OwKW+5tz2ZvyKzLTteZZI5QHom2ejLp6LJx2LhwydmaYB/VkPPLpO5qqL8AngQdR+9
	 8qPOPp5nFWC3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61490C7114C;
	Thu, 12 Jun 2025 22:37:28 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Fri, 13 Jun 2025 00:37:18 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: msm8976: Make blsp_dma
 controlled-remotely
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-bqx5plus-v1-1-2bc2d43707a6@apitzsch.eu>
References: <20250613-bqx5plus-v1-0-2bc2d43707a6@apitzsch.eu>
In-Reply-To: <20250613-bqx5plus-v1-0-2bc2d43707a6@apitzsch.eu>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749767846; l=1628;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=7RNlUvwWnhNcuB3GcL6ljCmZEwDbsQ6nBU+8OKp1mqc=;
 b=6OPARPuNs5gdn9eq6oOSdm4TIIbwz2SOTtH3z97yW5k9BuY9GtqCewm+fEPPyErYJqfQQbKDy
 V64dXbvBdsdB5Pa7pVk9jHstfGyms8ROyF3UX5UOifZG6q9+/pDy/Vu
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The blsp_dma controller is shared between the different subsystems,
which is why it is already initialized by the firmware. We should not
reinitialize it from Linux to avoid potential other users of the DMA
engine to misbehave.

In mainline this can be described using the "qcom,controlled-remotely"
property. In the downstream/vendor kernel from Qualcomm there is an
opposite "qcom,managed-locally" property. This property is *not* set
for the qcom,sps-dma@7884000 and qcom,sps-dma@7ac4000 [1] so adding
"qcom,controlled-remotely" upstream matches the behavior of the
downstream/vendor kernel.

Adding this fixes booting Longcheer L9360.

[1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/blob/LA.BR.1.3.7.c26/arch/arm/boot/dts/qcom/msm8976.dtsi#L1149-1163

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index e2ac2fd6882fcf47e846a92d45e0fcb9beba633a..2a30246384700dac2ec868c6f371248cfcc643fc 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -1331,6 +1331,7 @@ blsp1_dma: dma-controller@7884000 {
 			clock-names = "bam_clk";
 			#dma-cells = <1>;
 			qcom,ee = <0>;
+			qcom,controlled-remotely;
 		};
 
 		blsp1_uart1: serial@78af000 {
@@ -1451,6 +1452,7 @@ blsp2_dma: dma-controller@7ac4000 {
 			clock-names = "bam_clk";
 			#dma-cells = <1>;
 			qcom,ee = <0>;
+			qcom,controlled-remotely;
 		};
 
 		blsp2_uart2: serial@7af0000 {

-- 
2.49.0



