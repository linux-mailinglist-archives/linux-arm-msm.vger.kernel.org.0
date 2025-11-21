Return-Path: <linux-arm-msm+bounces-82869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1541AC7A2E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 2589024050
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12DC3563C4;
	Fri, 21 Nov 2025 14:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="GMEvKOrf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC01355805;
	Fri, 21 Nov 2025 14:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735312; cv=none; b=AgiBoG/LrwGA2mMRdEnaZMv4jlEph1m7SyUjdeORdehmX8+0Zt7WW1IrKHTwIBeHC5S8iFvrhXZs6Oo2arPR5QCCUvMSRXnLfhGfeyylPfW6iEsqsTR0a0BDmLWOf01nP4XMFCtbXvWzLbNzpPrr7DcO4WNEhqO0wTSuRUsH0NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735312; c=relaxed/simple;
	bh=9DnhboN/agf9a3jABZ/zMUoZ6IYkgbIbFImc5z4aKpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+se/Qkj24l2CfSGGYFcl+K4/k4uFNnOqtvONFMM89R2Ztz5HdSBmjMBxARsjWmeMd8yX4Ky3sZlHRrTZMnhYTdOKh7iOfpCLBf3rlIoNFYt7A+fpOA/MvDTTa+Vu8gJURnwwuttylk3hGUnVHWjVggtAfiMT6ufNhzTX09udMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=GMEvKOrf; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.fritz.box (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 617D72FC0069;
	Fri, 21 Nov 2025 15:28:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763735308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B2d2I24yzT7o62aoQFQh3zUp+L7fReuhIUqz2RkHUwA=;
	b=GMEvKOrfUnkpR3W8elIGNUoJ0Q4n3jFquLeuYyaToqi+3+Z6JWyJAeP0IghDL59wTFjAr3
	P2rkpUtHNEwMlmewJqTRTe88S6stu9BLLQ2Cfm4Wrz9HiPCSh2x4/+t9AMbnTzACeih1JL
	tYcLT41GH2bkaDxRQFpom6NJt55Esks=
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
Subject: [PATCH v3 5/7] dt-bindings: arm: qcom: Add TUXEDO Computers device
Date: Fri, 21 Nov 2025 15:26:17 +0100
Message-ID: <20251121142623.251118-6-ggo@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121142623.251118-1-ggo@tuxedocomputers.com>
References: <20251121142623.251118-1-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce new binding for the TUXEDO Elite 14 Gen1 laptop with X1E78100
SoC.

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..f77dcc379494 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1059,6 +1059,12 @@ properties:
           - const: qcom,x1e78100
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - tuxedo,elite14gen1
+          - const: qcom,x1e78100
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,vivobook-s15
-- 
2.43.0


