Return-Path: <linux-arm-msm+bounces-59532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3610AC4D52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F7CD189FD7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 11:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C077262FF6;
	Tue, 27 May 2025 11:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVVEsxFv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A63125B1E0;
	Tue, 27 May 2025 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345234; cv=none; b=HmPGZqZvxCdL+eey99UMUvB4pMDTUaXKXMgXUcZ0bhIh6Kva+UMuaNsdIqZ5CAOWiG1Uj+wgRRTekHKDgLdy0cWAWRzMdWUvTewHTKufFYf2FFKkjUl03GLqeFnxPqwZdhmrfzVYNnyxi4pxgdjtPnxnQusZtIuZEjyXlROYNMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345234; c=relaxed/simple;
	bh=HyRoDIFjZLiBuV7jZmhL+NtIFIxLS/o4IEbMZrsgwhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Set8NGJ4pm9WcY8q65p5E46UNNUzei5lGJdoGXxk7jR1BkhQWkoRbjFMkhxclUpjbdCmQ8jXR+FV8OEXzyrYp3Qz0LRslc9EmzpdzKxOy3PvUFTTJzaFbWM94J37LzL0d+BK5K3HdVF10uwX5oMTCr18uQlijsQnLpZt2zKMPoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVVEsxFv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0ACFC4CEE9;
	Tue, 27 May 2025 11:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748345233;
	bh=HyRoDIFjZLiBuV7jZmhL+NtIFIxLS/o4IEbMZrsgwhA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mVVEsxFv3lpIAsGsV35ZMyPhwR5mVeSwURQKTZB1/FwcqOWrImA0HW7ySyvoCZn1i
	 Ap7zhqrJONi1koQpAu/71jNmt42XjSF9xcEWcvQvjNIYDHrIia1KQWAunWW+KoXxkX
	 j1L2HvxKsZEKmHHCGJ8mxwYz8VPDCdAev901e4AuGcB7hawTrtRSxseYoAFTDU4X1W
	 ThhBwGjvmnYEwo9MXJ2uUFw0wp53S9hxjrHCr+/Fw+uwIYwa9hSOSJ2vauGFWvCqoO
	 RkFvOC5pflm8XPQzxtGPI/TQaELE7u0H9slteBSWlo60Rd1c3p9/6k2Vf72S6T7Wwy
	 +CZI/l0QzGZWg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 27 May 2025 13:26:43 +0200
Subject: [PATCH net-next v2 3/3] net: ipa: Grab IMEM slice base/size from
 DTS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-topic-ipa_imem-v2-3-6d1aad91b841@oss.qualcomm.com>
References: <20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com>
In-Reply-To: <20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Alex Elder <elder@riscstar.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748345210; l=2684;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=mmMv6ZRnNf9Nx8r4lZ6LgLAQHBQcffBMRruQc6avbDA=;
 b=poYXHiV44NdrDaTbxg//ajdjBysbeWzJkVqq2mKTsEU3/AiFijShDMNG7kj4lPzoLMeu/YvYs
 kn7JJQfIBArAii9MHBmr6OswIBI6cmCJBdYvVM/ysY1KPQwAlTNux8c
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This is a detail that differ per chip, and not per IPA version (and
there are cases of the same IPA versions being implemented across very
very very different SoCs).

This region isn't actually used by the driver, but we most definitely
want to iommu-map it, so that IPA can poke at the data within.

Reviewed-by: Alex Elder <elder@riscstar.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_data.h |  4 ++++
 drivers/net/ipa/ipa_mem.c  | 21 ++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
index 2fd03f0799b207833f9f2b421ce043534720d718..5fe164981083674a08ba0b69e18140bbcb46053d 100644
--- a/drivers/net/ipa/ipa_data.h
+++ b/drivers/net/ipa/ipa_data.h
@@ -185,8 +185,12 @@ struct ipa_resource_data {
 struct ipa_mem_data {
 	u32 local_count;
 	const struct ipa_mem *local;
+
+	/* DEPRECATED (now passed via DT) fallback data,
+	 * varies per chip and not per IPA version */
 	u32 imem_addr;
 	u32 imem_size;
+
 	u32 smem_size;
 };
 
diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
index 835a3c9c1fd47167da3396424a1653ebcae81d40..583aea6257096b73aa60ff6cada1f0be478846a4 100644
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
 
@@ -656,7 +659,23 @@ int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
 	ipa->mem_addr = res->start;
 	ipa->mem_size = resource_size(res);
 
-	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);
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
+		/* Backwards compatibility for DTs lacking
+		 * an explicit reference */
+		imem_base = mem_data->imem_addr;
+		imem_size = mem_data->imem_size;
+	}
+
+	ret = ipa_imem_init(ipa, imem_base, imem_size);
 	if (ret)
 		goto err_unmap;
 

-- 
2.49.0


