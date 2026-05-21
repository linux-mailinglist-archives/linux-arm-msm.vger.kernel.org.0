Return-Path: <linux-arm-msm+bounces-109058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON7NNEb+DmomEAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:44:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 360415A5043
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F6BE30A8E42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BEE3D6663;
	Thu, 21 May 2026 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJQjf0cX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7AE3D25DE;
	Thu, 21 May 2026 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366983; cv=none; b=fuimyAk7JD1LUgb+OGI52lPvg6zgmbwQHIQHCE64tKM4JpRnPF/RwFBsJWX+/t+FJ9bgQypbJQl+Vrzjf24pzuOPssVFTXnCFNfRuaGutkeKu2tqaBT/zLQSqeIgMjJg7d1VHt7mpSTbahex+zhjSMHWioGbrWyTptdn3667GLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366983; c=relaxed/simple;
	bh=JmXFacSnYQpRxT/Ms3NRdwETMQIsO0KOqLnlb/SxZT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdtAsNHHOpTz5jQwWaqb//hANOQM4rlt4sZQdkxx/Dm/xQh1pWXZxIL65gvPzQF1OLuksnrDjMI3vsddq7RXpvvZb++QHcKgi2pUgd12wR/KASrJuZ7yRZYZgyVYkerNupgjDOx3MiwpgMqil2VgUm6O7cUsIYuSFZ9n9gSlRzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJQjf0cX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA21EC4AF0C;
	Thu, 21 May 2026 12:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779366982;
	bh=JmXFacSnYQpRxT/Ms3NRdwETMQIsO0KOqLnlb/SxZT0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pJQjf0cXXTcU7H+nVYoLWJuNQqj5PpZ13aKdO6yc6SgvDG9wlhLStDkWLbMAxS+NK
	 rJQjyM6dyJWTkIhtXnMI7juzCmXdpIbyu55/YvRHDh4dKQ4FzlFzBTFd1xx+SSpzv7
	 TMluCgVvZzCIzyNvR0QtD/4XyF7V9LOlCKr4Z/v7Kd/1oCvDo9IVhM+kKSmrKDR/cj
	 S2I75tuUU8VXV8wNyTrEdPq0pIxfiU/cYDO8xdrrTVEZCHgtL5qPvk5WjT4ytKZIy8
	 UFgAj3guXfVSNxuYCljc4KGDWRy0PiMgAtUCRAXet66JlRKeff3V1DssbtHQo+nu6C
	 TRlwuYzt2u1BA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C2DCD4F5E;
	Thu, 21 May 2026 12:36:22 +0000 (UTC)
From: Manivannan Sadhasivam <mani@kernel.org>
Date: Thu, 21 May 2026 12:36:20 +0000
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,prng: Document Hawi TRNG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-hawi-crypto-v1-1-9176a3b51bc0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=907; i=mani@kernel.org;
 h=from:subject:message-id;
 bh=87Y5FwOjUYP3cLO2wi3+Srs6AfNhdn+1QiIA070LBV8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqDvxE68+VLP4JD5mfqCBLgToH2WODoY19+n7ZF
 7kcGB/pTMiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCag78RAAKCRBVnxHm/pHO
 9RlnB/9MKf2X0z1K9DYHIi2kpH2/oYGxzWOrZ02bk9J7GENYUFTZeU6szlFAr9LBEXvwZgUM/Bf
 IaSDf05AFY+k/TzKm3AVkm0G54H87b3ErOltrd2yj4WL4VaZ6qMKkQaYsBViqaB0ogUhafpDhfh
 9MXcGxgHhe5Mas/uKfVgqmnmA+20Xf4wj6PCbLHCuKI0cQVOeZEE63u8UFJ7ExinZbttIDTbHZd
 JiSgYZOdQ3OfW2ls8uAxGCeFYt0BUCerW1etQs/+xHVjYQzsBr5LTY9amwIhuMRVmGKecFVGohi
 T/lkwaXo/ggbfZ55dQ1dtfewty95xnEpy+yZIUV9wR9NF0cx
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for mani@kernel.org/default with
 auth_id=787
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109058-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 360415A5043
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Hawi SoC has the True Random Number Generator (TRNG) which is compatible
with the baseline IP "qcom,trng". Hence, document the compatible as such.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 41402599e9ab..e5489941e769 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,prng-ee  # 8996 and later using EE
       - items:
           - enum:
+              - qcom,hawi-trng
               - qcom,ipq5332-trng
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng

-- 
2.43.0



