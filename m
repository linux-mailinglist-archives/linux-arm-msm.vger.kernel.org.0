Return-Path: <linux-arm-msm+bounces-56642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9BDAA8023
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 12:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A39081BA1264
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 10:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C831EB5C2;
	Sat,  3 May 2025 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="xeDnJEWG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B235D1E3DD0;
	Sat,  3 May 2025 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746268809; cv=none; b=i5zmVtZlQW2ZZZi4ecKD8H1ZXhafo3LD5xDzTBfA/vjOYlf7lV9z8GxMZHr+9gA11+XSB/ziJGMTJOIIEtD5UNzXJKY4w99Tpz64xXXymDpAeukC6RE8XOh/cfLjqDh/C48lkCIbtAUii+Jl8+tWXqAuhsU8EEGMIWrgmSErwdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746268809; c=relaxed/simple;
	bh=TK4hEyPMkYbCZlehLpnWJgAjP62FEEwufy8Wx+ZMA44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDunohZagKZHePuc7/wv/HRUMBLaKZ75vrBvELYNvKUiqKwoxFamzxY2pT/IMWyw4YLUUchu0jfOB2pG96ur4OJXYCqBhJ5xg3TYdjx+NOPImBw3NEsdj3OstAGl9HSgGthkg1xWwWeMUyVro+C8an004yA1/m1DRLKl65FO/xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=xeDnJEWG; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1746268800; bh=TK4hEyPMkYbCZlehLpnWJgAjP62FEEwufy8Wx+ZMA44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=xeDnJEWGRM7op+Y5umJxsiKvhaIFnWKJgLQtPatAH+Wy2U3UiapWPRx8bAh1qwesq
	 4ssacjUH8EwuGumkHhCgsqz6fFgpylXs8o23hcaO1KK1XmAbYEdlpcZkax4zKeRKBy
	 l2oP8+mYjAwyITu16uGKJrdDqyM/Q6KxvCoYmvuM+txT8fl6CJz5ZxRvs+aEpgAPoe
	 fmi4aINDCw57pdm76b4rOoVDllCFmfML5qQ1RzAp82LDibGgCAExFEYA5LfJcYB8I6
	 clUbmtPBni4ADWdPyTjy6jh6jI6g/3f5pMay+e9nIjnVL7FOhmjeTmzZjE2NJp8wBc
	 Mq2z7/GpZJErw==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 4AAC4C971;
	Sat,  3 May 2025 15:39:59 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Sat, 03 May 2025 15:39:29 +0500
Subject: [PATCH v2 2/5] arm64: dts: qcom: sc8280xp: Add PCIe IOMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-sc-el2-overlays-v2-2-24e9b4572e15@trvn.ru>
References: <20250503-sc-el2-overlays-v2-0-24e9b4572e15@trvn.ru>
In-Reply-To: <20250503-sc-el2-overlays-v2-0-24e9b4572e15@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marc Zyngier <maz@kernel.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1403; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=TK4hEyPMkYbCZlehLpnWJgAjP62FEEwufy8Wx+ZMA44=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBoFfJ70x4aJqDuOy0WTSriVZp3HsbqFjo2uPGA6
 +y2KPYYsU2JAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCaBXyewAKCRBDHOzuKBm/
 daS4D/4quQUYnXxcHbgL6FSMPfDq67U+rkeTqs+S5Gwga/Ad1FbMZXIJmXrCLbspEUR/Wu8yJ2e
 Z+A9IvCHh9B9KlLc0ooQEKpM3P5R6nlqkNHvhQnC5o4kqWLQSBaiV6RFGEfQh5640Je8JWrV4Ij
 lQ5bhm8UkBlYxcIQKTmxFeGGAQhv25Q3m0MDc4sdng2/whxll5xVlX98NbEl5mCG2A4rojc69h1
 +1l1+6YBblWmcVgd8pBR8YJ/SIixhd2nuRrKjjdChWt62Fc7xB1jcE9OfkHhcqhosCzmixs7Ucl
 tnB/VACXQn66L8UmpwEtZHwP8AjdLQwUHvaAfVfkHikY2TNZ2cOruluht7mzvBg4PNJFXo3Xbjm
 X6ZgCR5DsSccor/V0dZqW2CYoF0nAKzdOgZaqVQ/I+TWTspshP+Ilg6koQbtn12fBMdbt+yhP2r
 mqJGecdNbBdOfFDeOuYa5LgboiAn9GL8av3rmvT2Ie+UFYhOGMsnOtdxvA6N4KgB1OlYz8hrHNo
 sYTCNL8WfosGDdU9rgVb4bebtkZwYQOu7vI2Db3ub17nRyi2A7+XcTQO9qqiJkVLE2BQJIXtFaO
 uRq/n9pw4c/BtA5O0/X/vMg1490IKgoc7GdUk1141dzWtg9KYol4G0LJ++AVW93cQFd3ggMyTWU
 G/j9R/pAI65TdSg==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

sc8280xp has an SMMUv3 connected to PCIe which is normally controlled by
QHEE and is thus transparent to the OS. However if we boot Linux in EL2,
without QHEE, we need to manage this IOMMU ourselves. To make that
easier, and since the hardware actually exists, just not "usually"
managed by Linux, describe it in the dts as "reserved".

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 35ef31d4ecf26125407bb64dd2de6e777a3400a3..27d21e1a2d50c6fc12f324ab2b4dfa4b99791b81 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4927,6 +4927,20 @@ rx-pins {
 			};
 		};
 
+		pcie_smmu: iommu@14f80000 {
+			compatible = "arm,smmu-v3";
+			reg = <0 0x14f80000 0 0x80000>;
+			#iommu-cells = <1>;
+			interrupts = <GIC_SPI 951 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 955 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 953 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq",
+					  "gerror",
+					  "cmdq-sync";
+			dma-coherent;
+			status = "reserved"; /* Controlled by QHEE. */
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sc8280xp-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;

-- 
2.49.0


