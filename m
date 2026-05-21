Return-Path: <linux-arm-msm+bounces-109057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL4TOID8DmoSDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:37:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAD25A4ED4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B637C30314B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467C53D6CAA;
	Thu, 21 May 2026 12:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PE0gNRg3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE7A28C874;
	Thu, 21 May 2026 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366983; cv=none; b=oUmocbUMHzg+SIpTyzYnZ/54ryxAzB0HcrbfkXR9Xn3RjUB3Rp8CIiHNTCKGDLB2lFcdAbmmAA1FxCSKszHV1T11hbGEBt1Cd4hOrBlTVnWsx+Nm658ln/Kvwdw8L2WNpJRALGE9R5V3ghblcVECeMZFmcyemQSKUbWJ79rapwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366983; c=relaxed/simple;
	bh=bVazAnn/f7sw1kgQBKSAA3N55r0zYbvnrlBQfLw2pfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4QUg1/ZvbPjl6CNM2Uf/zFr2gNPaPWvN8nIjEqqV0m1MU0qJxc60Y0mf2DM9o8/jh+5LVGPBkHXs9bnCHjdwYFhY3K6KEzsUvzQagY5xF4cOsspLzyt9who/Rud34wkFH3QdsJAUDFwPQCb3uZu264M5r/EUGR/G579QYdoP2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PE0gNRg3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4609C2BCB4;
	Thu, 21 May 2026 12:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779366982;
	bh=bVazAnn/f7sw1kgQBKSAA3N55r0zYbvnrlBQfLw2pfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PE0gNRg30h25VWzrCZ4Cj6DrRo/xyFZiXPIpattPNfIPfAgLn5j22pUwGD68RVtIH
	 Pn0x2jz6Vi24j8KHaVGtoTiduD99aW6ZKTWh9AKerG/5iV3kNp3ay0sLLJyBNIU+zv
	 +xN6EEPyhKYj2vduRRF1/NVUl7kXkRiN6rtRXTTHDikjaMdci9Zp5o5XU/0aC3Uso8
	 wYPRTcq1jdaQ13Yzghoc/D1S3ivdHLVetpoNttgSq+ly7JuFRFrmQLjpUKzaA5y1+y
	 bhzi9uDZnkoKbh+zkHlRQf4ujsKnBob/jqCR7jNjv/OioiMzERzsiEMxL36yeSL+im
	 lFN9Vz5kUBYcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5A1CD5BAC;
	Thu, 21 May 2026 12:36:22 +0000 (UTC)
From: Manivannan Sadhasivam <mani@kernel.org>
Date: Thu, 21 May 2026 12:36:21 +0000
Subject: [PATCH 2/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Hawi ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-hawi-crypto-v1-2-9176a3b51bc0@kernel.org>
References: <20260521-hawi-crypto-v1-0-9176a3b51bc0@kernel.org>
In-Reply-To: <20260521-hawi-crypto-v1-0-9176a3b51bc0@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mani@kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027; i=mani@kernel.org;
 h=from:subject:message-id;
 bh=sc+HfR6j5a3ujVo0ShNKGvCFMa9cPO2/pJqvTuqAxPg=;
 b=kA0DAAoBVZ8R5v6RzvUByyZiAGoO/ESgx71obOBk5uPKjm6jfRRVyXa+Hi1bitbegIFOqTeY6
 okBMwQAAQoAHRYhBGelQyqBSMvYpFgnl1WfEeb+kc71BQJqDvxEAAoJEFWfEeb+kc71tY8IAKJZ
 3OsOA2iGYhsATnDiaNfUMNzQiSnkdScNAuYKzv0ZgWiH0heM2Gi597f5OaF3oQ7ncfOPvzcg3pf
 yR4uDmC/NuCkp7MTxSFdR8NmyXgTNAvXcx5lXBT9F8LzgFVA+igwUNmBST6S4irZXLAsLzMa/CX
 W1eIXmKSTEn4Nr6FNh+r4jGkKO9Vtf9Hd8FBXAZ4XxnYpdq6rfRR1/24kYnwWO72Uzo0jNy5OKm
 FBFGJoJJrnAlgo1idyN0Rrg6NhTXab/dtmvl0LsDUK6TSnknlHXPC4d7S4LDnyslKbwuzUWj71A
 7AuvLCnVX6l1/oBAqTAbd1oKDOO64VJS18BZDrY=
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for mani@kernel.org/default with
 auth_id=787
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109057-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8AAD25A4ED4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The Inline Crypto Engine found in Hawi SoC is compatible with the common
baseline IP 'qcom,inline-crypto-engine'. Hence, document the compatible as
such.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..2a183b07b03a 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine

-- 
2.43.0



