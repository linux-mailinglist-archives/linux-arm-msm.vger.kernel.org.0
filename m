Return-Path: <linux-arm-msm+bounces-28529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7CD951FCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 18:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 543B41F2186D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 16:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9981C57AB;
	Wed, 14 Aug 2024 16:20:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB791C2336;
	Wed, 14 Aug 2024 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652431; cv=none; b=tAj+9NZg1vEdvrz3j3qwwYoCsLrLlOgEv6Kzp/+O+6tNAsvPrScnu/HNlVbx56TS2zPbcuw+1Wa8Z/5cuX6U8rM52x/PIVX5HLKZfrX5/f4czWk8nTGcDkp7fAtuVepggx4Bi/Mb72QRFX8DEP2c13jHU2RkcTJ0GFF4UkxeaGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652431; c=relaxed/simple;
	bh=4OXxcKmhH5VlFNsmTD9at0MDXLegn9KiGktRA4VA2SM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FOJI1iWg/TGIR0LIBDP7tiaLrH2hLStj577bpIR4Sp6CyxFh5Iz2yOwjADckuvHvuDFkMhL1vj/7Pw4UGv56sCRpoMup2iHK/GEEh7jjlpkoCJwnA0KO7oygS5Hh+LYlujEdtzMBX4B/WDqMTxy39TJRkG9w9RnJ6kRD9sMe3Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id E1357209A7;
	Wed, 14 Aug 2024 18:20:24 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id CEC9B20989;
	Wed, 14 Aug 2024 18:20:24 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Date: Wed, 14 Aug 2024 18:20:22 +0200
Subject: [PATCH 1/3] dt-bindings: clock: gcc-msm8998: Add Q6 and LPASS
 clocks definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-lpass-v1-1-a5bb8f9dfa8b@freebox.fr>
References: <20240814-lpass-v1-0-a5bb8f9dfa8b@freebox.fr>
In-Reply-To: <20240814-lpass-v1-0-a5bb8f9dfa8b@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Add definitions for the Q6 BIMC, LPASS core and adsp smmu clocks,
required to enable audio functionality on MSM8998.

Add the GDSC definitions for the LPASS_ADSP_GDSC and LPASS_CORE_GDSC
as a final step to enable the required clock tree for the lpass iommu
and for the audio dsp itself.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 include/dt-bindings/clock/qcom,gcc-msm8998.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-msm8998.h b/include/dt-bindings/clock/qcom,gcc-msm8998.h
index b5456a64d4213..5b0dde0809007 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8998.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8998.h
@@ -193,10 +193,15 @@
 #define GCC_MMSS_GPLL0_DIV_CLK					184
 #define GCC_GPU_GPLL0_DIV_CLK					185
 #define GCC_GPU_GPLL0_CLK					186
+#define HLOS1_VOTE_LPASS_CORE_SMMU_CLK				187
+#define HLOS1_VOTE_LPASS_ADSP_SMMU_CLK				188
+#define GCC_MSS_Q6_BIMC_AXI_CLK					189
 
 #define PCIE_0_GDSC						0
 #define UFS_GDSC						1
 #define USB_30_GDSC						2
+#define LPASS_ADSP_GDSC						3
+#define LPASS_CORE_GDSC						4
 
 #define GCC_BLSP1_QUP1_BCR					0
 #define GCC_BLSP1_QUP2_BCR					1

-- 
2.34.1


