Return-Path: <linux-arm-msm+bounces-59145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FB3AC1765
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 663FA1BA45B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06F52D029B;
	Thu, 22 May 2025 23:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndV/BLrA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813792C2ABD;
	Thu, 22 May 2025 23:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955400; cv=none; b=lcPmNGy69q3FWaWhC7iR+VBMZUNMn7sW34Y6CpeajrhyeEym3NRQ1QZdDpbZUaS17xY2zXTGyC7g3W8SD+cd/v9fXRRAwLOQAidxmiu7Mz5vQs2s1+RE9blr0pyeKaiDI9B1ZQ5sQspXSEpc+D9eIm/U4Ix82kYOL0UFzkR+LS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955400; c=relaxed/simple;
	bh=vBwqWBOAhTAITJr2XrioYNf+NEHYtpRFOxT1X9KhXLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JeNnjs7+Jl7zizW0bPWUXrtW5pBPOoGLwVX+MnF//yHGhgtZED6CLn26JyKS/ghv9fus/1dBP3Nv2lX33KkXEAUNfCi0Jze9qsM56KFuO8BBoJAHDSeWoRR1V0HevfEbdb3lPmbLd0/GMF4Pu1hhX0SlDB+TKd8fH7vsNw9v6Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndV/BLrA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810C6C4CEEF;
	Thu, 22 May 2025 23:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955400;
	bh=vBwqWBOAhTAITJr2XrioYNf+NEHYtpRFOxT1X9KhXLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ndV/BLrAYOWW12vZMZHe1MJDs1gW9Z1R2GDxiVyFg508oBMLF2jgbUg9mS6OLOxsG
	 0SuVQU6XVtuP0SH2BDaBPwLR6lrzyFIv1pM8lmaneg8ptAmbW4MEiuWYCdDLJubpPK
	 EYFyHnF88pf4EZhSCvLGgGmnO5bhM7Aco8TWVIb9egPz+rShhpSWLRaA//iJh23N6y
	 UzrjM7yXcniEXaC44SwhE+MUrG6Lg9P3myWxIwDSrO452NWAeUJciyv3LdsFptmiYJ
	 uymMAwIaob4BWA9kG/PVbsIcrM7ewaq/a8yeRLIU8hznd2ItyPxLFWuhJAHHEUIDFt
	 pAV3w4hS9eOBA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 23 May 2025 01:08:34 +0200
Subject: [PATCH 3/3] net: ipa: Grab IMEM slice base/size from DTS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>
References: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
In-Reply-To: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955379; l=2488;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=BxYd/QN68RiitmM73igLziUtNmm+r8OWYlo5gtCr2Ds=;
 b=MYV1WZvT6wq+sw7hE4Vq3WPBdKROsfy7ePCtkecch0IfUi4t366ydh4zzzAxRTpQ6hQlGPJOL
 7UT4PbyfvXPDWvz/vMNXG6BphrEE7Q5SN3qZ24A3UFF2NZ0TZHVDRa9
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This is a detail that differ per chip, and not per IPA version (and
there are cases of the same IPA versions being implemented across very
very very different SoCs).

This region isn't actually used by the driver, but we most definitely
want to iommu-map it, so that IPA can poke at the data within.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_data.h |  3 +++
 drivers/net/ipa/ipa_mem.c  | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
index 2fd03f0799b207833f9f2b421ce043534720d718..a384df91b5ee3ed2db9c7812ad43d03424b82a6f 100644
--- a/drivers/net/ipa/ipa_data.h
+++ b/drivers/net/ipa/ipa_data.h
@@ -185,8 +185,11 @@ struct ipa_resource_data {
 struct ipa_mem_data {
 	u32 local_count;
 	const struct ipa_mem *local;
+
+	/* DEPRECATED (now passed via DT) fallback data, varies per chip and not per IPA version */
 	u32 imem_addr;
 	u32 imem_size;
+
 	u32 smem_size;
 };
 
diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
index 835a3c9c1fd47167da3396424a1653ebcae81d40..020508ab47d92b5cca9d5b467e3fef46936b4a82 100644
--- a/drivers/net/ipa/ipa_mem.c
+++ b/drivers/net/ipa/ipa_mem.c
@@ -7,6 +7,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/iommu.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
@@ -617,7 +618,9 @@ static void ipa_smem_exit(struct ipa *ipa)
 int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
 		 const struct ipa_mem_data *mem_data)
 {
+	struct device_node *ipa_slice_np;
 	struct device *dev = &pdev->dev;
+	u32 imem_base, imem_size;
 	struct resource *res;
 	int ret;
 
@@ -656,6 +659,21 @@ int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
 	ipa->mem_addr = res->start;
 	ipa->mem_size = resource_size(res);
 
+	ipa_slice_np = of_parse_phandle(dev->of_node, "sram", 0);
+	if (ipa_slice_np) {
+		ret = of_address_to_resource(ipa_slice_np, 0, res);
+		of_node_put(ipa_slice_np);
+		if (ret)
+			return ret;
+
+		imem_base = res->start;
+		imem_size = resource_size(res);
+	} else {
+		/* Backwards compatibility for DTs lacking an explicit reference */
+		imem_base = mem_data->imem_addr;
+		imem_size = mem_data->imem_size;
+	}
+
 	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);
 	if (ret)
 		goto err_unmap;

-- 
2.49.0


