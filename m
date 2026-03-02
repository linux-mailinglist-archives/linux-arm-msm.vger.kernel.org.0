Return-Path: <linux-arm-msm+bounces-95001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJEmGYC4pWmDFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:19:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6741DC9E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5E5630C8359
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 16:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858504301D3;
	Mon,  2 Mar 2026 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFMnGsgM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613D94219E9;
	Mon,  2 Mar 2026 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467148; cv=none; b=AoZJDIIjNwvTKkIRpdh95h8tZCQ5zUxAFPLvgi+5iF4Qeg2qgGeDr+HtNqc482Ps+Bmlf++SqxJpctfcFrvVsdp+uffPPYCxYxM5rezM0FpEXsOmVV074rPYYV9bJ5rte9hvIRhwj+aM3FxIv5RCVg/L4cgustB95Ls9UOnwwAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467148; c=relaxed/simple;
	bh=jPoALjGIJosbnsT7LQYpnfA7my0J+97RmRVEyzh8brU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O3NgYaiW0QF0N9UdXkr7l1bagB33mPkRFQlHAV+hGkJiccIS8DiA66rrzUkQIe4GzjEkbyS7FZ1WRNp29wUvXOOOLFpD79wKDZkRTVgev8JQ+qpd1UrGon7x8CwxVdBWSM/TFhoG82nvzxMYVg7YwGyoUCj35dxzqs7MKjWA97Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFMnGsgM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB3DC19423;
	Mon,  2 Mar 2026 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772467148;
	bh=jPoALjGIJosbnsT7LQYpnfA7my0J+97RmRVEyzh8brU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sFMnGsgMk3rvHrYjD0+TgRDirgr/P+cWPnZkHnm7Z9v8YLyHsxw3ej39yuXwDwMor
	 KH8jSIWAdTZcJunEkwkI0OKRSMU9hCTXAfQZM7nTLzER3dZSTJNY8V79tuvzE+3/XB
	 Fs2yGUi6k7QG9sXWeUoO4r3u8vIwtoOIkdzFchb0WYi9jh3vTLnTQktsVvHGw6a5gY
	 5d+jBgW8P61/JW0l/RpxQqNJ30PKadxq0gzhLOvXUThlb/h2jpNbO6+Lt3N9Ymc+ME
	 H23EMAZ3IyOpjKw3npGjqmdlRRP9jiLut7VnilBhzY3VJPYuxupsiKqNm7TfHdc/JO
	 w6+XaB2Zz2ZMA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Mar 2026 16:58:45 +0100
Subject: [PATCH net-next v6 3/3] net: ipa: Grab IMEM slice base/size from
 DTS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-topic-ipa_imem-v6-3-c0ebbf3eae9f@oss.qualcomm.com>
References: <20260302-topic-ipa_imem-v6-0-c0ebbf3eae9f@oss.qualcomm.com>
In-Reply-To: <20260302-topic-ipa_imem-v6-0-c0ebbf3eae9f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772467127; l=2779;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=IjEzmMlwd+3eC68bOWdIEpVrr7dfATtLLbU+ngjO+E4=;
 b=HxdYODHFO1ypLQqwFh6Smn5yUCMVYHYWUUN/NZ900TGu/Ca82nspqvG2qSpMbd7u4ZgzO2x3a
 FZggmUClw/jBDEOUDx2lF4vBI8XMox3yD/UV80Z66PX1Z/ft89u6Npc
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 6C6741DC9E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95001-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,riscstar.com:email,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
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
 drivers/net/ipa/ipa_mem.c  | 24 +++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 3 deletions(-)

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
index 835a3c9c1fd4..078d32a18dbf 100644
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
 
@@ -656,7 +659,26 @@ int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
 	ipa->mem_addr = res->start;
 	ipa->mem_size = resource_size(res);
 
-	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);
+	ipa_slice_np = of_parse_phandle(dev->of_node, "sram", 0);
+	if (ipa_slice_np) {
+		struct resource sram_res;
+
+		ret = of_address_to_resource(ipa_slice_np, 0, &sram_res);
+		of_node_put(ipa_slice_np);
+		if (ret)
+			goto err_unmap;
+
+		imem_base = sram_res.start;
+		imem_size = resource_size(&sram_res);
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


