Return-Path: <linux-arm-msm+bounces-93403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD3tHYgVl2kRugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:52:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A7E15F406
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FC7A3063426
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7EB33E37B;
	Thu, 19 Feb 2026 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSKo7NWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A93A25B31D;
	Thu, 19 Feb 2026 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771509037; cv=none; b=sCvrs+norLDZ+oP/QC5OyBe9Ftqw372BYLfLVO9kkDgVTzkTXV0PGp8u6roC9umaBqEzgJr57QCrCfQmvVIj0HGA5uSOPN4GI/J0jn2ha1mTDPoPwzGMVRa3ARy3LoNyf4+KNJfQ1h5KVeUavPKhe8EomragQVd6BA77eUReDNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771509037; c=relaxed/simple;
	bh=C5oY30UkFQ3O3eG6iTmmPWTIKiizU7kru4zFrzFk5sk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VnwQcnH3w+clIqtCkkbZ0z1KygqW0PSO7K7ACb6LuV/Bk1tbBkNvt2w+6gNycSCs31eiHWCCZe0QWmCqPGkg6tuPqmpWgcEPKzBbwrOMbLvbnKuBRsbAcyzM1Vso6w/7A+otsJAG7b/CoS2QDAlB7RZxcJh1eaQMIHMgePe8GN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSKo7NWS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FC4C4CEF7;
	Thu, 19 Feb 2026 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771509037;
	bh=C5oY30UkFQ3O3eG6iTmmPWTIKiizU7kru4zFrzFk5sk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sSKo7NWSryM8IANgajCZ97j06+BsuQ2Zup1JXszIz9XNT6BzJaav6nFdGvH3O0Fcx
	 YRHf4xja5v3AV7oZezAzyImobkiC+ppIwuNeN+fKAVeptfvzuxhMYgohmzJKmBMI4H
	 Z5Jt+cHUc6PDqvcufifBxCOY54fkQroGY4PICekjUOaG5jF7McSzgREPLA/cCCum+3
	 SuH6ifqgds8sYrFFHR52xLYaPMFPtA4azrMtDef5jweBGVk/xvqlqWBFPyqwAK6yrB
	 rdXCmLUIgh0HU77BZmIvDotuNLVHtOb16d2AVDz4b6SD3z8yXZjTCZGOotQ8xfURef
	 FUKrg/DtwNSEg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Feb 2026 14:49:50 +0100
Subject: [PATCH net-next v4 3/3] net: ipa: Grab IMEM slice base/size from
 DTS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-topic-ipa_imem-v4-3-189d91dbee84@oss.qualcomm.com>
References: <20260219-topic-ipa_imem-v4-0-189d91dbee84@oss.qualcomm.com>
In-Reply-To: <20260219-topic-ipa_imem-v4-0-189d91dbee84@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771509014; l=2728;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=RQ2LdCvjFfiS0OMnOv+dT6EBkJVtY3P4ubESo3oaBx0=;
 b=JQkD4XzdBvCi8zCrqx51J7TP2egaspc10g1YRC5JtB1vvrMpsTode1VKUVKjX0ngZWjSbpKVA
 Rp9vdqBXbghCmxNvdPtdi5SjwtJ/Sj2VjofF/5Z8DirkXUBgguG9EBP
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93403-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:email,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 04A7E15F406
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This is a detail that differ per chip, and not per IPA version (and
there are cases of the same IPA versions being implemented across very
very very different SoCs).

This region isn't actually used by the driver, but we most definitely
want to iommu-map it, so that IPA can poke at the data within.

Reviewed-by: Alex Elder <elder@riscstar.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_data.h |  9 +++++++--
 drivers/net/ipa/ipa_mem.c  | 22 +++++++++++++++++++++-
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
index 2fd03f0799b2..f3bdc64cef05 100644
--- a/drivers/net/ipa/ipa_data.h
+++ b/drivers/net/ipa/ipa_data.h
@@ -185,8 +185,13 @@ struct ipa_resource_data {
 struct ipa_mem_data {
 	u32 local_count;
 	const struct ipa_mem *local;
-	u32 imem_addr;
-	u32 imem_size;
+
+	/* These values are now passed via DT, but to support
+	 * older systems we must allow this to be specified here.
+	 */
+	u32 imem_addr; /* DEPRECATED */
+	u32 imem_size; /* DEPRECATED */
+
 	u32 smem_size;
 };
 
diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
index 835a3c9c1fd4..5d3f68bd02d9 100644
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
 
@@ -656,7 +659,24 @@ int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
 	ipa->mem_addr = res->start;
 	ipa->mem_size = resource_size(res);
 
-	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);
+	ipa_slice_np = of_parse_phandle(dev->of_node, "sram", 0);
+	if (ipa_slice_np) {
+		ret = of_address_to_resource(ipa_slice_np, 0, res);
+		of_node_put(ipa_slice_np);
+		if (ret)
+			goto err_unmap;
+
+		imem_base = res->start;
+		imem_size = resource_size(res);
+	} else {
+		/* Backwards compatibility for DTs lacking
+		 * an explicit reference
+		 */
+		imem_base = mem_data->imem_addr;
+		imem_size = mem_data->imem_size;
+	}
+
+	ret = ipa_imem_init(ipa, imem_base, imem_size);
 	if (ret)
 		goto err_unmap;
 

-- 
2.53.0


