Return-Path: <linux-arm-msm+bounces-84600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F693CAB38A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Dec 2025 11:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48C09303AEB6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Dec 2025 10:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2832877C3;
	Sun,  7 Dec 2025 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="bEa+QCu6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190E3B8D61;
	Sun,  7 Dec 2025 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765103755; cv=none; b=TowJ7d7/KBJriXwoxaXYkEAj5hkQ3fdWQkHOoudSkMTbpClR4PwbLDOB7EQr9634ueMDdbH1ftLUzwjov28qdan1QKjZbKpcNaZc4e0wu0nNRKtIMy/QOOYzzCTwawH85sMGteLa1m30Dk4yjZ9RRJiWToi5CMmdN48BmbzkJ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765103755; c=relaxed/simple;
	bh=cdxgLhluKDpR93tBLWRmMFNEs4dqL66QD+PPzLUtjGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Tr1a01TjyAFqNRH8joBuSozeKS1NlHQPHGTi31ZB4d5rFTLaFAAPqf5BGfywqEDd99AY6dvyVigDbMjw72ISY8VmDGiC4heRP7JeZNltOeX46OgsgpSRymG6vrozzscVK697BWj1xWIkXRUYr9gnngGVFK1379k2WmnavYsjZM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=bEa+QCu6; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1765103745; bh=cdxgLhluKDpR93tBLWRmMFNEs4dqL66QD+PPzLUtjGQ=;
	h=From:Date:Subject:To:Cc;
	b=bEa+QCu6YYXBn6wLwNYGqjP6N6oSU7HpHtfyX/D93R/0sKgdZoo0wG5Ib3LRC1fl5
	 czQqQ4b2r9pDaVhRZYSCBzP6fetEmcLt99oE04BaM/Bf/o3OxWdKtAd0pSm/WhmtFr
	 asmu8DVnKNUvWF3WLbw/notJXm1WH/4XhpcY6+zA=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 07 Dec 2025 19:35:35 +0900
Subject: [PATCH] dt-bindings: remoteproc: qcom,adsp: Re-add cx-supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251207-adsp-cx-fixup-v1-1-0471bf2c5f33@lucaweiss.eu>
X-B4-Tracking: v=1; b=H4sIAHdYNWkC/x2MQQqAIBAAvyJ7bsEWK+kr0UF0q72UKIUg/T3pO
 AwzFTIn4QyzqpD4kSzX2aDvFPjDnTujhMZAmoae9IQu5Ii+4CbljmgMWUvGjuwHaE1M3MT/W9b
 3/QDuSC2EXwAAAA==
X-Change-ID: 20251207-adsp-cx-fixup-442882486ec5
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.3

Some boards (e.g. sdm845-samsung-starqltechn) provide a cx-supply
reference for the SLPI PAS.

The Linux driver unconditionally tries getting "cx" and "px" supplies,
so it actually is used.

Fixes: 3d447dcdae53 ("dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as power domain")
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
There's literally one board using this upstream, judging from that I'm
not sure this is a misuse of cx-supply or what exactly. An alternative
to this patch is of course removing the usage in
sdm845-samsung-starqltechn, but as it stands right now the patch under
"Fixes" introduces a dtbs_check warning.
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 137f95028313..bde138716873 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -32,6 +32,9 @@ properties:
   reg:
     maxItems: 1
 
+  cx-supply:
+    description: Phandle to the CX regulator
+
   px-supply:
     description: Phandle to the PX regulator
 

---
base-commit: 37bb2e7217b01404e2abf9d90d8e5705a5603b52
change-id: 20251207-adsp-cx-fixup-442882486ec5

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


