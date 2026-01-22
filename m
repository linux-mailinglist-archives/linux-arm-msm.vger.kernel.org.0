Return-Path: <linux-arm-msm+bounces-90194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCDII4IecmmPdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:56:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE3F66EFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCB75909504
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA654418CE;
	Thu, 22 Jan 2026 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8FBzML9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB09441031;
	Thu, 22 Jan 2026 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083860; cv=none; b=k+uDiiIkEi+wA/1iOo9VKnJFenOOJLKEFggiYVNuWEhPDSxuR5vXqHdSpLv1XDcUvlf1e7AKh/tA4QUyqL12RjY61utwq/bfoiNOR1WjNUfB+/U1bexbHJLa6z0hL6iDG4w1z6FHNzXW9yXUsB1sKMbh3tMC7jh5Qn6H8aVanuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083860; c=relaxed/simple;
	bh=9ccenAsibnCIpjCYWgUX5dURH7Ms6uJLp/BBNzlLZj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PanMtfqB1g27X9mnagDpi2wQkze2UdPlBpdY4tUpvT4e0DAT8OSFqTRbWuDlR48pqyA5IQ7dYm13almBsoMfzE8bJQIKsTZ/fXnOH8E6YtWMLCU2ii+Rc9y5kxzcg5qAbR17pciPU2aO997/oNdRtBwn9HMAeGCpOw1JclkQRkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8FBzML9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B20C116C6;
	Thu, 22 Jan 2026 12:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769083859;
	bh=9ccenAsibnCIpjCYWgUX5dURH7Ms6uJLp/BBNzlLZj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X8FBzML9f9vEGoat9oAnq2qYRbzJSoXnSD38JpP1qkxIuqiaImkBnenr+lG6zvyUR
	 jjGFGotFffp5+shwyfeAziCsbA2k/Tbdyf84wWlX/QcXUFXC1qWBpe3KvxzC7YEzfu
	 G437t7Ri7+0mN2heqOqEA1OvuDPqSOjhwwFh87rO6lSRAR+uKX9bSm2TNmtFLIorNU
	 n3LxECrNOwHivjOaqHnbQSxzjnCMBg/i+vzn4GWu90U7cN5r6Z0eP83pwVN7vgzrT9
	 uwlnDHrMHV1ScLu+HVGBhQCAsPJzFnQpQkTUmILV+hZGVJTYqm1tCO85Fa4FnmPRfG
	 n3GZxsbBmna+A==
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
Subject: [PATCH v3 1/3] dt-bindings: display: msm: qcm2290-mdss: Fix iommus property
Date: Thu, 22 Jan 2026 17:40:40 +0530
Message-ID: <20260122121042.579270-2-sumit.garg@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-90194-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:email,5e01000:email]
X-Rspamd-Queue-Id: EDE3F66EFE
X-Rspamd-Action: no action

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Fix IOMMU DT propety for display via dropping SMMU stream IDs which
relates to secure context bank. Assigning Linux kernel (HLOS) VMID
to secure context bank stream IDs is incorrect. The maximum value
for iommus property is updated accordingly.

These DT bindings changes should be backwards compatible.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml  | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index f0cdb5422688..2772cdec7e42 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -33,7 +33,7 @@ properties:
       - const: core
 
   iommus:
-    maxItems: 2
+    maxItems: 1
 
   interconnects:
     items:
@@ -107,9 +107,7 @@ examples:
         interconnect-names = "mdp0-mem",
                              "cpu-cfg";
 
-        iommus = <&apps_smmu 0x420 0x2>,
-                 <&apps_smmu 0x421 0x0>;
-        ranges;
+        iommus = <&apps_smmu 0x420 0x2>;
 
         display-controller@5e01000 {
             compatible = "qcom,qcm2290-dpu";
-- 
2.51.0


