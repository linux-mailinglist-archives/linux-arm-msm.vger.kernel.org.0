Return-Path: <linux-arm-msm+bounces-56385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1DDAA621D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 19:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA1109A630E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 17:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058042147ED;
	Thu,  1 May 2025 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="jY7R3qyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375E31F8BDD;
	Thu,  1 May 2025 17:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119565; cv=none; b=ix+47jQGpnHWQdxQ8js+IslaYgsn/ubfeHn7otjK1SEOQxAkdYl8SswEQVTcyyUEjLOB6KvZXY2dt8u5BNEOslGmi/yfx0SsAYraH0UHalWRcQmL+juwS7wYnKB50rYjIWalJIbzVST/yThK5qxyoHjy3pYVIUjDMZwUsgzCO/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119565; c=relaxed/simple;
	bh=TK4hEyPMkYbCZlehLpnWJgAjP62FEEwufy8Wx+ZMA44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pNGJoNO799oogue4peZm91h8rlZRhyl8gxMR1SLZOQot0QTjrAEn9UTNcMpgA4sxW0m5XhvnOFC8vvKdD59uts4LWF8ZPfc8U4VFoJjOQmd/iuPlbaSKc6DUIPNEtW6ft9EQbZDIt4XAN7NiYkvYAFpSw/8zwwBip0yVyY2LljQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=jY7R3qyT; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1746119048; bh=TK4hEyPMkYbCZlehLpnWJgAjP62FEEwufy8Wx+ZMA44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jY7R3qyTV2griE2Q1M926tS/oJtp5sFu5dXd8azSpPtxyvu5hZjYTg4PgoAxqDmdd
	 Lu7MnGdJHmaaa2xst+7yRETfPrmjNkp/Rg+yXNbqCoVXo3L3nVJBHZAAFACiNCAUE4
	 rZ9gkrMpA/EfqvrsMGyZCeV0qqISB4XPiaBKgGxXLOV9miXbG9HRALUpx7QJg+XkrD
	 TpvViHUrGXaZJKiEKc5thMFb29RlE6q0qT4PDavMl9f7XOFi/6vs8bLhTkdEJ/FKP3
	 hEVhXX41bFkf77oIR6THFwcgN8k0eNXgCTGcUA9b53vHQMyqzAszzbU4B1PKWqx0tq
	 8cWoXVSRInxYw==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 896B7C8F8;
	Thu,  1 May 2025 22:04:07 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Thu, 01 May 2025 22:03:42 +0500
Subject: [PATCH 2/5] arm64: dts: qcom: sc8280xp: Add PCIe IOMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-sc-el2-overlays-v1-2-9202e59e3348@trvn.ru>
References: <20250501-sc-el2-overlays-v1-0-9202e59e3348@trvn.ru>
In-Reply-To: <20250501-sc-el2-overlays-v1-0-9202e59e3348@trvn.ru>
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
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBoE6mDkV7NQteSZKi1IAe1zJV7GsvFIllrEkQre
 2hhOXaVi3WJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCaBOpgwAKCRBDHOzuKBm/
 dXLfEACA3JgkI1PvALqhKEWkvprk7DZiRmyRikbRar+DDjh1t6gY7aa8XWBR9c6UPN09Fqp8ftB
 LdzXPRY3nFwEkjna5/7Hyc+Cqj1hapvmWUlG9hikdcyC6MSGS98Yd+JajSmwwtANvhzoRhOIsj8
 5MZA/zWJd/hBy+Yb4Qo/LMtZzNuDrejcnOc908yyfKcbKGQN8QZ3U5CdjzEzqsnFbDV04xu1S52
 ZUp0e/Mps/BWXr0yn+4NFthverpwxTqfvsgBlWpGoJR1t7quSRCMv/c+utthjKKZpLIeyVxWQBJ
 BR4JvJOzOorQMDIzap1DF1bIazJ1Bh+RkXSXVXEj7cBcK+vnNJ5AKldf2TEtuvXHkDZG4JvT568
 rYeavOR3Adg601HV9vpbpn0uzglUlVvfJ12jGVwhgf6SgYbgH/I839Acq/cenvXRS95B3khUPDF
 Z0vxIF1MfNJxe+NHkQU7YHsMTwOCECaY0RV9n0UupwXvm42y/2f4Ph8zqG9lcpXfotrLEf/5Eun
 dqOJeXrWcnDw95UG+bbCMBSOfUts0fz7YPcZoGTYyRAR0fFsYlffhSjWWdDo5Rm2A6u1zE8Xiyr
 EVbt4DzvJyjrUzF43LfDCSFm/tOAIu0PWJhhTDYb9Pvqq+CFG0sw8Ntzy4Cg2UU45gPKJ5TD0ZX
 6oeQWRjGDtRkdKw==
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


