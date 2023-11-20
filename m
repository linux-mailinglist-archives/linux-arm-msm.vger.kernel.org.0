Return-Path: <linux-arm-msm+bounces-1201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7547F18F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 17:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12B341F252EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 16:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BA71F945;
	Mon, 20 Nov 2023 16:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsCciNx5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3FF1E526;
	Mon, 20 Nov 2023 16:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0283C116B4;
	Mon, 20 Nov 2023 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700498618;
	bh=A3mbBr9rE95h2nv6AWfZYX5TX/s3kpvz3ZObpg71pDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jsCciNx5tZ1EiuX/UezIiD9iLgLT182VAQ1Xa72PTHcojDSaCs6Z8h43Nh8eueeqr
	 ///4F+PStPFlpAndVwdv/NzjV8bc8D0tfDfKlqUbgZ5QrZUvcqfVnCCpg4C3iYOvQR
	 7dja83IOjfIdOKjeYFd8nCtLNVHVJmoCZQbiggfz7DW3L7cSuh5JhuYJcCQs2E+XjR
	 EWp7RXmh99sqh/bpCjRzuuRDUjTauY6Z/uxW/KKnPGBpKhW57lCTJfsYOkWJCoYDmS
	 YL/aWggnbYlm8Hi30LNpHZPHQhv6lyQL0TaVJ4DYhNI8SKwFerLR/7VeE83crzU6HZ
	 mz0WoFdez2EGg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r57NE-00027o-2H;
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
	stable@vger.kernel.org
Subject: [PATCH 09/11] arm64: dts: qcom: sm6375: fix USB wakeup interrupt types
Date: Mon, 20 Nov 2023 17:43:29 +0100
Message-ID: <20231120164331.8116-10-johan+linaro@kernel.org>
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

Fixes: 59d34ca97f91 ("arm64: dts: qcom: Add initial device tree for SM6375")
Cc: stable@vger.kernel.org      # 6.2
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index e7ff55443da7..b479f3d9a3a8 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -1362,8 +1362,8 @@ usb_1: usb@4ef8800 {
 
 			interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 93 IRQ_TYPE_EDGE_BOTH>,
+				     <GIC_SPI 94 IRQ_TYPE_EDGE_BOTH>;
 			interrupt-names = "hs_phy_irq",
 					  "ss_phy_irq",
 					  "dm_hs_phy_irq",
-- 
2.41.0


