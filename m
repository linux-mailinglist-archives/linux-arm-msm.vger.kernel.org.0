Return-Path: <linux-arm-msm+bounces-84395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90929CA466A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 17:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6787630B8E79
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 16:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E0226B08F;
	Thu,  4 Dec 2025 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="RFSw5Cvy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF622F12C0;
	Thu,  4 Dec 2025 15:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764863601; cv=none; b=iaN/BDfr4ESQiMLyziifRovFnvADLGHB8c+JRaUomykhwHWU59Kkb6HwodQnBrCx1ftqKlBPpi9eqKnIXpw/TDdEP/26bdFoGrBkm5BRf6IozIoLr2U4auF+n5pB651qG2ujAf2R04DP4x5nskFJ91f+2+NrkzPodJSGROcLiRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764863601; c=relaxed/simple;
	bh=Yt2aoBhpqxT3tI5pamaXB9ZRtIwLDGlCVIlZsZkpxh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWOVqnKMcZsV7mbBTw9noQzP9XhQ4G4fFxiS/4lHN1MGMQEJseKNPe8WBMm2wL4T5gFlfIbZPAHdUqGw4VWAlYaxjZF8l7DJgDRU2E9KI3NP42zRiI+JohQk+0QAIVcgReErYXK5RqK8z+tcRJJ62ttJG9tDOfSAqOdBR8Qggt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=RFSw5Cvy; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.gaeste.augsburg.tuxedo.de (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 3F8692FC0094;
	Thu,  4 Dec 2025 16:53:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764863598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/am8mxdJRHwWxYLQcdUvq9KvkknGb8CbF0KGM4hNonE=;
	b=RFSw5CvyRiz50vh7HlG0+PJzcarGyLOCnwe8+MZoXs5I25oHrVGx59Wm7JYSF2jZn5oIzY
	iFm9XBD1sjT2k4xQf7JStFAuIuzN47aAKWP0FZpDr/Q1uiE6ScFzEz56ObmdgYnlEsCkq6
	wCjjwZLhAWjM7MndNlq6WAPCscbRwGs=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=ggo@tuxedocomputers.com
From: Georg Gottleuber <ggo@tuxedocomputers.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ettore Chimenti <ettore.chimenti@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	stefan.schmidt@linaro.org,
	stephan.gerhold@linaro.org,
	wse@tuxedocomputers.com,
	cs@tuxedo.de,
	Georg Gottleuber <ggo@tuxedocomputers.com>
Subject: [PATCH v2 4/6] dt-bindings: arm: qcom: Add Medion SPRCHRGD device
Date: Thu,  4 Dec 2025 16:52:06 +0100
Message-ID: <20251204155212.230058-5-ggo@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204155212.230058-1-ggo@tuxedocomputers.com>
References: <20251204155212.230058-1-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce new binding for the Medion SPRCHRGD 14 S1 notebook with
X1E78100 SoC.

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 52ec9e6bd14d..13ca0cf5ac7e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1069,6 +1069,7 @@ properties:
 
       - items:
           - enum:
+              - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
           - const: qcom,x1e80100
-- 
2.43.0


