Return-Path: <linux-arm-msm+bounces-84393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D780BCA45E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 16:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5C363172AF3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 15:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98132F12D3;
	Thu,  4 Dec 2025 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Rd+1Osb7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECC62DC33B;
	Thu,  4 Dec 2025 15:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764863592; cv=none; b=t5JEqK8xsAP4+1y7U4qH9flfXJCmHyNrfJ6C/V8o7y3fO6mxGU9/+88sm2qFYnbHo91dsuUG3fEoafaE205iL8MvEhAAjAc8vAZH1hSoriqFD8QkiAVKoZ6W89CcY9zo9Aop8sR+OYMExDELOdU54fjfWpRWKOzTVHacNp+tPqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764863592; c=relaxed/simple;
	bh=+2fgo1XTohrhSiY2YR5PBvlYI3GN2wZS/dWEwL82u2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aU3K0QtaNmA+RXx0IqXLF5DJbVhUVpy/W7HYpMyc6AyKFCERNaSd9VV6LRAaR0Zvwmq7IvxhkVRO1oiiviO1v7Zv8B7LedLfArNai7/K/EDFvGSD2dTgnjxyEbHr2QpRgR+s1Q98m6/ptFXSl60f162iYL928jmuVRU7jQv25/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Rd+1Osb7; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.gaeste.augsburg.tuxedo.de (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 914772FC0094;
	Thu,  4 Dec 2025 16:53:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764863589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kce/enqzlI7MEjHj3MheZbVzwTzsjGfncBL9pEQjMyk=;
	b=Rd+1Osb7JSi4q7htKXrDOckB8ohiVm1p2HZvllXG/PTrQUms75Zpb5Z99Ube6tz+Dps7L/
	pm9SYi4qGddLeGLMvrd/Z7nTxN4CZonkMcKQ6Dvzk6F4QTQbJYlpt+MOrrUzaenpVGc3gg
	LGyUBQ1keKsFR34d+aoNXZK/0a2Rzy8=
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
Subject: [PATCH v2 2/6] dt-bindings: arm: qcom: Add TUXEDO Computers device
Date: Thu,  4 Dec 2025 16:52:04 +0100
Message-ID: <20251204155212.230058-3-ggo@tuxedocomputers.com>
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

Introduce new binding for the TUXEDO Elite 14 Gen1 laptop with X1E78100
SoC.

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..52ec9e6bd14d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1067,6 +1067,12 @@ properties:
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


