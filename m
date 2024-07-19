Return-Path: <linux-arm-msm+bounces-26627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 990DD93783C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 15:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA2991C21038
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476A613E028;
	Fri, 19 Jul 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OH+O31Ah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D17D13C67D;
	Fri, 19 Jul 2024 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395049; cv=none; b=OELhKHqC07F5KhCNTNvlqyG2WmFSx0iB1uCo6/hpISMx7nbm8vkzSEejoaLERQqukbaWXTMmXzgo1KSCO4SJn99d+Lf38jo1d4Kvrks+vflGSbX+U5ixWZlfv+eVS8wniWYZmRf9gOF8rMGySPbUtY6PElHFKHE0iR2EA1+S2a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395049; c=relaxed/simple;
	bh=iJk3IcgisbQjv0U1z8NE0RXXYZsQFwNEI/+8pagonIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VGT26+n9CWuDJH9SlnouhsU56xrDMcwSqsRCSiT+rQnxambE3rC60fwJcU1BIu4JQ6XbJyYgBYMcD9pvcsCkVPUtqUXkBCalTg5bABaryGZcyGlB8v2kp476Sq4FN6IUjt12acsnV9LMauTlBVEnnWeI5kaOHpE6p8a0HEC10fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OH+O31Ah; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0F3C32782;
	Fri, 19 Jul 2024 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721395048;
	bh=iJk3IcgisbQjv0U1z8NE0RXXYZsQFwNEI/+8pagonIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OH+O31AhzjXYkgYPo2XOqR+o30zV09aWIajGCmY2CZ7Ar68HofKBMqnFpu+AB2jog
	 eUUDDa13Bc0SY5zg6h5HsK6pP/8/1FSDeQZmKKAjzMxNbzXdTgD09qKmBI/Adp9S/+
	 kQi2HsTqJ04PZnBgSHqZ6phBJpzNFAByzMjP1PCADDv1Zde9avyme6GANhY9FIkcUV
	 KcUH0X3MhjTpJG7dFHAfM0J2ub9/8LH8bEJDijE9obt1kBhi6IQZM+B3qlUCMBCiPr
	 NPXDupSlJsNAOXCTtRClv6KifMMWDN2yI3fJ3XPTgFzcg5Q51tF/nadMBYbSZZh1Fj
	 W9sKPhPafnPmQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sUnUO-000000002BG-2VRS;
	Fri, 19 Jul 2024 15:17:36 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 3/7] arm64: dts: qcom: x1e80100-crd: fix up PCIe6a pinctrl node
Date: Fri, 19 Jul 2024 15:17:18 +0200
Message-ID: <20240719131722.8343-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240719131722.8343-1-johan+linaro@kernel.org>
References: <20240719131722.8343-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe6a pinctrl node appears to have been copied from the sc8280xp
CRD dts, which has the NVMe on pcie2a and uses some funny indentation.

Fix up the node name to match the x1e80100 use and label and use only
tabs for indentation.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 6aa2ec1e7919..41d05ce01cbb 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -975,7 +975,7 @@ nvme_reg_en: nvme-reg-en-state {
 		bias-disable;
 	};
 
-	pcie6a_default: pcie2a-default-state {
+	pcie6a_default: pcie6a-default-state {
 		clkreq-n-pins {
 			pins = "gpio153";
 			function = "pcie6a_clk";
@@ -991,11 +991,11 @@ perst-n-pins {
 		};
 
 		wake-n-pins {
-		       pins = "gpio154";
-		       function = "gpio";
-		       drive-strength = <2>;
-		       bias-pull-up;
-	       };
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
 	};
 
 	tpad_default: tpad-default-state {
-- 
2.44.2


