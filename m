Return-Path: <linux-arm-msm+bounces-26050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE06B92FE27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 18:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B425B236AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 16:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE75176ADB;
	Fri, 12 Jul 2024 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="2CtshHEw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5090178CEE;
	Fri, 12 Jul 2024 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720800286; cv=none; b=K/srNKL/Ki0QGWqELEn3RQqN3Dq5/msLbQ78Ryj/gOYyQxxksLqORYPED7SwphDCyVHTjq/49KSPCP/HMqQ5F9QB49VJKxOUL26AHWjMAg1eSPOZcbC67DIKE3MtBKXjHorRDZH3qYICYdDs8gphHOiezRN6BxX/orY81xOWlWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720800286; c=relaxed/simple;
	bh=Aw1Z3TjECflXLfakeTDiIH8VUBM7J0RBPuDtK3QNd64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sFEOa8NUWq/ubwyB07PoltxLxGRXbBJ4W8QxnpM76d2R8v9L7X1by+3yLjPlJJVbAyVZtWZxUTIFeXc0GASohvhciCHgdXWJrlSKm9rI0SYs1YjDuK5y3+LPhgp0KtKLrQWGbVa6zuyqyULRPYWWwAc9oAfpZQjKux2sGG6KFMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=2CtshHEw; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 5FCCB41D75;
	Fri, 12 Jul 2024 21:04:35 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1720800275; bh=Aw1Z3TjECflXLfakeTDiIH8VUBM7J0RBPuDtK3QNd64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=2CtshHEwZaIytZPUvXD7FHl8evxWEhEMYhJ9lwEjLonAHuSFNoi/ZHkXyBvBh3vXB
	 qhaE5opBW1opAuvY2ycaMM6THhHJJ7FTbGK5e/Qww0U4gTp+eJ+aZyeDxITVneJCy2
	 SMIpHMkOTJerMgtvIMleWr1yCL/14iSQXwd1uJtBBMEzjUYsO+BNOiecG5MRFVfSUu
	 NxcmRKT1yI1qZVtuGeb2eGS9K6O1+PqTgrc9+CNt0x6AtMvrEtoOXdLdVZQad1YzVu
	 SzoMDtKg1EMLxiMQGPmSvMWB1rnghFs/tNinI/BUzDLtCLI47J2LZveNqwWYBxu2QH
	 cvvYgq6p1/crQ==
From: Nikita Travkin <nikita@trvn.ru>
Date: Fri, 12 Jul 2024 21:04:06 +0500
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add msm8916/39 based Lenovo
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240712-msm89xx-wingtech-init-v1-1-64f4aa1870bd@trvn.ru>
References: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
In-Reply-To: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=Aw1Z3TjECflXLfakeTDiIH8VUBM7J0RBPuDtK3QNd64=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmkVQQnSOT7J9SqFTlJ1cuc6cDQq/Q9xEfvRNvp
 ZxOp05m4qCJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZpFUEAAKCRBDHOzuKBm/
 dSfOD/oCOPWko445jjBhaJhrcEN7Jd0NnBsoOl6jkAjjqzqcQuGgsDuYLOtGIif6dEEUCwgVQ1J
 NQKLB3DW8yO14a2klLyZSA07iV0OvrFCBjsUQfICzYnGbc9f7LNKDfjBItgsSgYN8U5BvWyTZLV
 qeA/TPPi6lGJ7KIPcWtGQtNNE560j6lOpgQOks7DSWXuyJeowCR8iI178T6joL5NlMgijpJetOd
 1TBU0Y23YCGow9JMURBFI449FUcgopjOugmA+pVh+WPuB1wiN64t/zZF4Iyzhn089z32T0mlNp+
 QWLqX+gINYRd1TWhuoiKpH88pZpa+UzOGm5SJBpuBqgxKvoIw43/PVMlvhqIZNCHDkPZ2Ct4Ovq
 A3Ng86/pCI7JyrG2PwE1J2agfisU18plskTihOQ85uL15hk7JuSRGI3dIiUsrXJiP+cIkpwyvbK
 CaLBiDYTiOTdn2Eno7075hQuZYymEaDXUZ4fVs8mTxylD8j7yF/j6wWaX7odvbd/joNpzcmXfBR
 mkxFCWMzQ0iAhdYq/9p1bJD3ffAD59HUVIMSZ/D+8KSEuEK0N6YLeC6enspY/01LqhvazWZPBc3
 DnrqliChisP4WASAn5Iuzb+lYLBRODpyd6Zo85yYFGIE68/FpsWNJ8DyiY5TXgdNjTIlvsok0D/
 PgWe5LMR6Z+zdQg==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

Add compaitble values for some variants of Lenovo A6000/A6010/A6020
devices. These devices are based on designs from Wingtech so use it's
vendor prefix and part numbers for compatibles.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f08e13b61172..a3f28f08f5d6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -155,6 +155,11 @@ properties:
           - const: qcom,msm8926
           - const: qcom,msm8226
 
+      - items:
+          - enum:
+              - wingtech,wt82918hd
+          - const: qcom,msm8929
+
       - items:
           - enum:
               - huawei,kiwi
@@ -162,6 +167,8 @@ properties:
               - samsung,a7
               - sony,kanuti-tulip
               - square,apq8039-t2
+              - wingtech,wt82918
+              - wingtech,wt82918hdhw39
           - const: qcom,msm8939
 
       - items:
@@ -234,6 +241,8 @@ properties:
               - samsung,serranove
               - thwc,uf896
               - thwc,ufi001c
+              - wingtech,wt86518
+              - wingtech,wt86528
               - wingtech,wt88047
               - yiming,uz801-v3
           - const: qcom,msm8916

-- 
2.45.2


