Return-Path: <linux-arm-msm+bounces-1119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8AD7F0FCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 11:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C67482820EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 10:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2AB10795;
	Mon, 20 Nov 2023 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/PEQ78m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62893A7
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 02:06:23 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9c603e2354fso787365966b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 02:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700474782; x=1701079582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BNQ2xPx++wH1nrxiKy++CwCgkNUnb0789llzrpG+llY=;
        b=B/PEQ78mZuZ9GPtvo69D+zfDxtXZpG6/YYWVQDWwrR96Sizzr8tqpKqpw3norQCpuS
         Woa7VCgJRDEMkNZOxA0K6nTp77oxLY9A2IRRHrPNR+g4aodiHNcTa4sWrKb3ylL6hlU+
         vGBM1r4kFWThlbrIn1pWe26dkyssodLoi9+wQHzZj+atb9qmgXJ0ExbhoLMAEFL7mxNR
         v8pmys9p5bW4ztMSDsyOszXBbCFTjp3gmrNW2cxYKEmZaMRQR4pENQRPGbR+H/2s7y1o
         aHGmRnLPOQPqkJkL7Lg6bpW6skVFTElHsiYBDIJXXtlxTlk3vCFch0u0S9OzSaWx+KNp
         SHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700474782; x=1701079582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNQ2xPx++wH1nrxiKy++CwCgkNUnb0789llzrpG+llY=;
        b=j8PRxE9zl+GTJUk2REhJ+E+dAXyXKNnd46inrG/TBE+DpBz6x4SGQiBOl7Sm95YSQM
         87430Zj9g4j92LZNMGNW6PQIHqiYmxVmLSJGQnUr1+YMhNtKN66sY718uozZLaKM03X5
         qjwknarfY513yKgcoXyVj1sEXO+Ndb978ZK6PlkHKWmtqzl8gZqTJUDAdz2aJsfWSjX2
         JrA96s6ryR1lrBIK6AAjjmjUxJplNq6pqf6cW4rlH/gIwlBQMDad5XNWyKTDrf1R1lnv
         ND1yWBSvGiS+8DWQIAq2+bhM8hw9H+ww3tzvukNnG9WMZ7O+JSKDNn0otXr2rHmdie9/
         7lcw==
X-Gm-Message-State: AOJu0YxWxkWvav3g8qxzqJoeE5nxRW+HtwiyxpQ9LMCl64welubqr2Lz
	7VnLd1/CVN0cg9KTvD+qlnc/jTIC5fQulUFx4QA=
X-Google-Smtp-Source: AGHT+IHAYX5jbEOAAbb7JbyibH41NWLc5m7fX4drhHV55VH6R4hupBnKsasjqhtvfqGrVuuzbd1fDw==
X-Received: by 2002:a17:906:74d1:b0:9c7:59ff:b7fd with SMTP id z17-20020a17090674d100b009c759ffb7fdmr1311917ejl.28.1700474781661;
        Mon, 20 Nov 2023 02:06:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id f16-20020a170906391000b009fe16be6a65sm1075022eje.63.2023.11.20.02.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 02:06:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>
Subject: [PATCH] dt-bindings: arm: qcom-soc: extend pattern for matching existing SoCs
Date: Mon, 20 Nov 2023 11:06:17 +0100
Message-Id: <20231120100617.47156-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing QDU, QRU and SDA platform names to the pattern matching all
Qualcomm compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Sibi Sankar <quic_sibis@quicinc.com>
---
 .../devicetree/bindings/arm/qcom-soc.yaml        | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 97621c92a1ab..09db42456c12 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -23,7 +23,7 @@ description: |
 select:
   properties:
     compatible:
-      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
+      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
   required:
     - compatible
 
@@ -31,17 +31,17 @@ properties:
   compatible:
     oneOf:
       # Preferred naming style for compatibles of SoC components:
-      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+(pro)?-.*$"
+      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+(pro)?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:
-      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
-      - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
-      - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
-      - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
-      - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
+      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,gpucc-sdm630
-- 
2.34.1


