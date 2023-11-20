Return-Path: <linux-arm-msm+bounces-1202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6427F18F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 17:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72D9EB21A31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 16:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1681F952;
	Mon, 20 Nov 2023 16:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uzoT9mZ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDC91EA74;
	Mon, 20 Nov 2023 16:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E097BC433D9;
	Mon, 20 Nov 2023 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700498618;
	bh=FQ0xzwWn42NWTxCZkzqidN/MrgLTjHsoVeG/2jN8NCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uzoT9mZ2/0DUt4Gb4HR4EVAovcSbVISMtSth61Au1jY7bPXXxQcYNWvtvMndlYbsA
	 Ouhvp8/4O93tZRhgoj/uGDTZGhjB79haJJrpenwjkH7zhXY1bi76U1s/7sM1DZkRAg
	 0CM7m7DJUT6ndOk+6bs8YLiaSoKe5rucpDzB8JcvwrsHLw4YPaV79pts+jrxkZyESy
	 Donlc8/F6dN5AuDIgLKqfyfUNirR6MOLjnDWR5sTlVjOGyVkED+gXSND1LAANU5KtW
	 fYw28K6LUpf7e2xiInHSbQiMns6l1YYMR6lSADnlz5mJoF6ftox7kr7y1gASm+/RH0
	 y1BxRTa5ye6Nw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r57NE-00027u-2r;
	Mon, 20 Nov 2023 17:43:48 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 11/11] arm64: dts: qcom: sm8550: fix USB wakeup interrupt types
Date: Mon, 20 Nov 2023 17:43:31 +0100
Message-ID: <20231120164331.8116-12-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120164331.8116-1-johan+linaro@kernel.org>
References: <20231120164331.8116-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DP/DM wakeup interrupts are edge triggered and which edge to trigger
on depends on use-case and whether a Low speed or Full/High speed device
is connected.

Note that only triggering on rising edges can be used to detect resume
events but not disconnect events.

Fixes: 7f7e5c1b037f ("arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes")
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 7b9ddde0b2c9..9b5b098bb7e8 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2923,8 +2923,8 @@ usb_1: usb@a6f8800 {
 
 			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>,
-					      <&pdc 15 IRQ_TYPE_EDGE_RISING>,
-					      <&pdc 14 IRQ_TYPE_EDGE_RISING>;
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>;
 			interrupt-names = "hs_phy_irq",
 					  "ss_phy_irq",
 					  "dm_hs_phy_irq",
-- 
2.41.0


