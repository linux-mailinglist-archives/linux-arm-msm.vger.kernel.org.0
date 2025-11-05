Return-Path: <linux-arm-msm+bounces-80462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B03C36A49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 17:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1951B626618
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 15:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6F734403E;
	Wed,  5 Nov 2025 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="LBAWIOiB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05682343209;
	Wed,  5 Nov 2025 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357363; cv=none; b=tJOaQhj6ugVbFgY5/SqhDjm0+8SZV9KfDmJBvG/RVpnMVv+KfMx92pnKU43mmv+V7ioHRM7ETdRgUulpphwtPt2N0ULxLqpxb5b3R0NMGUlZpiCsIgJP8j/xZ/YwmGTkMXDOxr1dWRXvgqhyGuN+k3Ui9DpN1uCfzlpu4XwTCmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357363; c=relaxed/simple;
	bh=KJobcVzwA4zIMrsjHQAAcu8HhqxGjrH7mu6RXxWl6u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRkQaUP547Xz5HX50WA50OP7tPEgIeEDRQbVAA4guaJIMsetdaU+vdQ//m13Sbl0fcPF5zRWAyzl3nJzRf6OoMinvbnL3ECcsHbPvxsPlzdp4LwWTqRWGgv3Q8cL+nCKnEd2t0BiVXd/ISdA0nSLIPUtykn+dS/FWUjs6i4g5s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=LBAWIOiB; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.fritz.box (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id DCAE92FC0057;
	Wed,  5 Nov 2025 16:42:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1762357360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BeW4Pgq7w0D7DW50sjKBlQe3Cg6/rigiT3VkbBMy5PQ=;
	b=LBAWIOiBIF33u6jvpk5tYyXZ54mgOX/QLNbr6ESrr4o/b9IhPWc+6P8sraWk1bnxuoznWl
	j+UyrZPa0BcnxEYXETRoVjG0cx1Tz2FGTQFs3fULv6rfISTzh915EfviCFG478VGJa5bCs
	pk2eT26eiYnPKE5Tbq4Pc+9bnKGPzc8=
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
Subject: [PATCH v2 5/7] dt-bindings: arm: qcom: Add TUXEDO Computers device
Date: Wed,  5 Nov 2025 16:41:05 +0100
Message-ID: <20251105154107.148187-6-ggo@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105154107.148187-1-ggo@tuxedocomputers.com>
References: <20251105154107.148187-1-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E80100-based TUXEDO laptop

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..6e5aa9d6e1a8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,7 @@ properties:
               - microsoft,romulus15
               - qcom,x1e80100-crd
               - qcom,x1e80100-qcp
+              - tuxedo,elite14gen1
           - const: qcom,x1e80100
 
       - items:
-- 
2.43.0


