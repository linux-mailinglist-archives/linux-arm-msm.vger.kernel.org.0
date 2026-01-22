Return-Path: <linux-arm-msm+bounces-90195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FZwLVIfcmmPdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:00:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D466F63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D85C170C702
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2701B472776;
	Thu, 22 Jan 2026 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWbVekbs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB746AECF;
	Thu, 22 Jan 2026 12:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083867; cv=none; b=Ne9wnzXWFc4sgjZSx6wSiw8SWfDR1Lf90ShNcGJqtixpEyA99eNbIFIJLiLSgklmFUv3uWGDfaiR62mq7bShBz36PjadJ5/ApSYDdX6Se8GI51T5z0yT833Gem1d3eGhA0+7iU56/k1e6YXmQdUwR+YBRDBe+1PIqnaGR3ohQ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083867; c=relaxed/simple;
	bh=YSENznK5xVCKBkPuM2sDSPh9VH+p9mizyUlmc+JKDlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+GBFP8RX5rVrzWhfU14tp1jHOkZY3hgUohW4NqqvoeHXtjjZUV1/mSqVP4+CWloRgVn+rPolFC1bLpIimHy4yCFPm9wELtDnetIYx6ie9QaFcqkpibgcLyB/sjZIWRel7GW1mhnxwD60YxJONCz/27OXID4myPVeWeyO4YtdQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWbVekbs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D882C2BC86;
	Thu, 22 Jan 2026 12:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769083866;
	bh=YSENznK5xVCKBkPuM2sDSPh9VH+p9mizyUlmc+JKDlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aWbVekbs4Mr9qSCCKxR59oR55Te2Ai674l6t49YwvEn3A0zY18zx2IZi0HoAYktEi
	 6MN7HkDwPKsDPah26jSfw0ORIkS6moVB6ohxhPhTez894LprhGHmocAvqJKTE9Krxt
	 GuAVhntoixtWNS+6V6tBA5g4Jb20xXRnvIS8Fa4IabnUx+esKxWwqlmgJyavxAzqPP
	 9EKAX/lbSzM7UK4qF0ur4mMm6kSDAXP+zIKGjPodI+ww2D/2S/JEHDsv2OxJxA0mcc
	 GsUDywG7Kfug7309M+PNZ5Bd6+tpEGNnMaaXuCdmgF8cSI/PPyqTjVxA2Q3Vi/dXdX
	 AfHayqKv+DpqQ==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	loic.poulain@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: media: venus: Fix iommus property
Date: Thu, 22 Jan 2026 17:40:41 +0530
Message-ID: <20260122121042.579270-3-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122121042.579270-1-sumit.garg@kernel.org>
References: <20260122121042.579270-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90195-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 548D466F63
X-Rspamd-Action: no action

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Fix IOMMU DT propety for venus via dropping SMMU stream IDs which
relates to secure context bank. Assigning Linux kernel (HLOS) VMID
to secure context bank stream IDs is incorrect. The maximum value
for iommus property is updated accordingly.

These DT bindings changes should be backwards compatible.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-venus.yaml      | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 3f3ee82fc878..7e6dc410c2d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -42,7 +42,7 @@ properties:
       - const: vcodec0_bus
 
   iommus:
-    maxItems: 5
+    maxItems: 2
 
   interconnects:
     maxItems: 2
@@ -102,10 +102,7 @@ examples:
         memory-region = <&pil_video_mem>;
 
         iommus = <&apps_smmu 0x860 0x0>,
-                 <&apps_smmu 0x880 0x0>,
-                 <&apps_smmu 0x861 0x04>,
-                 <&apps_smmu 0x863 0x0>,
-                 <&apps_smmu 0x804 0xe0>;
+                 <&apps_smmu 0x880 0x0>;
 
         interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
                          &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
-- 
2.51.0


