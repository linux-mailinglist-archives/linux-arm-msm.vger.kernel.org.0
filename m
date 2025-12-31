Return-Path: <linux-arm-msm+bounces-87037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAB2CEB13F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30B19303C9FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 02:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAC82F3C37;
	Wed, 31 Dec 2025 02:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="AEN/8Pu1";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="iy6SQrlm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EC12E8B66;
	Wed, 31 Dec 2025 02:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148183; cv=none; b=gs1VbSKtHczRnIkErGZ7z1zWuCItJrdwspyRZF6qjktoxryblNqWgcDVBSk7CtFpHCrUH/kwyfEeRC9/nKmLKLTskNJHKtmkptlo0/m+UfjmRtpYPsTHcvC/1MmLhAfMbEW/PaZQCnapxK07ZriNemYMNuy6WhG0IvtW8o+es1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148183; c=relaxed/simple;
	bh=04XEBMDpEV1lgd2MHxPLm427fT+7qwuMKA4T1FeHvJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hiPlmnQKUGNvdZ3ji+a3Xl6S6hbyVSd7mmc5Geb+8gmF1QHjrdszp4kw4Y4+mISnEt/hdwipPPoBLY7FtP2Z6HitXABJPKY4O2L9d/ul8S3vKTUIHQNTu8BuZLv1MBY3JsHZMoBiCKSpwVdeKAUYi5Ww0UFgqTlcJsNcrz3kGGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=AEN/8Pu1; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=iy6SQrlm; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148174; bh=QffQ/HFvNOEYyu7fqrFQscK
	deFLLrT010lx1XxLDOn4=; b=AEN/8Pu1nzdoH6AkI0A5gKfyHm1uQyhxJYJtf9l3S8N1AiBQHJ
	46zkkkRqcj93hNrFbWIve8hxYXpFhBkrL2cbR8zHUafpj5k9VDR0SBZ8DH7p0FfapK7ZQAqcYqK
	PJ4KspfbzpnTKsG3tFl/6bWHUPG5tA1qtEjfodEwoGuZ+ZDX/iEUXwQu6Oj54lZNk0sdMKAfeMf
	o/A2lmeyu3plXYHsyhsEqlt0T4f+D+CjhsYtysG+PNZrUtQw7fXkomZ/AnVPxIARJYQRsYFgudG
	UM8L45x+PoGTDcwlTm/tgm2kWMIgTz7Rxx359pTBbTHixzosBOKP7i430Pgrbs23KUw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148174; bh=QffQ/HFvNOEYyu7fqrFQscK
	deFLLrT010lx1XxLDOn4=; b=iy6SQrlmalvNpzn+zf1IBt4gwiUBb5DaWGKdjNX+RyxdWNXjGy
	FTYM1LoC/btpdSwGazGjCUb332rcKFKMpUDA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 03:29:33 +0100
Subject: [PATCH v2 6/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v2-6-ae5eafd835c4@mainlining.org>
References: <20251231-mss-v2-0-ae5eafd835c4@mainlining.org>
In-Reply-To: <20251231-mss-v2-0-ae5eafd835c4@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148170; l=1343;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=04XEBMDpEV1lgd2MHxPLm427fT+7qwuMKA4T1FeHvJI=;
 b=UTzF3amo0qqZ2f3g7QKkgMi1NJ3nogMyAvp1tYOk8rqOn1wpCp5pjO/q55H5ujNjDjMbIrG+h
 +uBYcE0Ls2IA66CHT86GuBb8XOBu0AoBUhsK1lOc1lDayhGHuWeqz1T
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MSM8937 platform.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index 74202dd34703..b4a1b5852896 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -23,6 +23,7 @@ properties:
           - qcom,msm8916-mss-pil
           - qcom,msm8917-mss-pil
           - qcom,msm8926-mss-pil
+          - qcom,msm8937-mss-pil
           - qcom,msm8953-mss-pil
           - qcom,msm8974-mss-pil
 
@@ -232,6 +233,7 @@ allOf:
               - qcom,msm8909-mss-pil
               - qcom,msm8916-mss-pil
               - qcom,msm8917-mss-pil
+              - qcom,msm8937-mss-pil
     then:
       properties:
         power-domains:
@@ -276,6 +278,7 @@ allOf:
             enum:
               - qcom,msm8926-mss-pil
               - qcom,msm8917-mss-pil
+              - qcom,msm8937-mss-pil
               - qcom,msm8974-mss-pil
     then:
       required:

-- 
2.52.0


