Return-Path: <linux-arm-msm+bounces-3539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C56B5806F43
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51076B20DAD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 11:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0050234CFC;
	Wed,  6 Dec 2023 11:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EuJb61s1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93EC3D5E
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 03:53:41 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50c0478f970so2118783e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 03:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701863619; x=1702468419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3Vdsej8Bcsh3gYcNaeKTgqd2sJv+6EY0djT8yDBbDk=;
        b=EuJb61s1xzZ1uFZdlp1PEd9uNv5NOjXtFxiXrm7kUEJZbhYuY5fyZEeCVJqtsd42aS
         X2TWswrASShvWvwi2A+hOFHGGYgbwIC55mdRW+Nrhv6jNTkb+5rFpaNzjBHU6a96NwXs
         IqfGEBHK1xjWFlUNQluISZ/8uqJXSX6PQKtYeDDcrNDD2eP2C+LgciKKigXsybjnjTPy
         bP7dyKjcFvJvA98xLlDdZVY6RMJY1qlJhTE19KWQN0kb23i3QZGmrA7U/jCbdTH12HCY
         2O2n0ZQo8GFOBMkFXJsyu9NFNd5OMk9XM1F2AdgsP+gp6+bngeOUVn00gPqnFLtDXLz2
         Bvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701863619; x=1702468419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3Vdsej8Bcsh3gYcNaeKTgqd2sJv+6EY0djT8yDBbDk=;
        b=rpq+k7KacBrLAIYG/RvGkMzSRQVJgWAskZsZa9BXHcit94nCWd/wcHzOdUlArSFtEe
         LhcAPReZCp72ILQQ5Rzedv6WyB4IXz1yLRvYExHHOJBufAN32i6EvWTmqVZDlRozElxy
         Ao3TcpbddYJusGF9mYNqlVYEbKZ58DuxApt6WDNr/+gdWhP0a4HFyU7ABwly7h4yBbvL
         Gu/BncWG2YJYy7ZesbVCvNBb4x6AsYdRx4UwctkvsS/iTg2QGmyXnCR03v1kvS38qZrr
         Wb09aWPzKQiW52fNX/ZTA7iLpx6xcU2RsAYmWXff+WbD73IBEodIJwLEZCmR+jFkoUXC
         lWtg==
X-Gm-Message-State: AOJu0Yy1SQMA7ey3SC2vqQCL/H4LCAGCgcUHGdtkPZu9dvDFjmQA8Myd
	RZXlFa9aiJ+11cCh1caQeVp9Zw==
X-Google-Smtp-Source: AGHT+IHPKqZmkMmocmv6VlyRh3i7wWNqaLeXnscUcnHn1+t/hyTb1DxF2EOqUPCQHRREgTtRU41nXQ==
X-Received: by 2002:a05:6512:3e01:b0:50b:e77d:32e4 with SMTP id i1-20020a0565123e0100b0050be77d32e4mr581228lfv.60.1701863619674;
        Wed, 06 Dec 2023 03:53:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i13-20020a056402054d00b0054c4fdb42e5sm2337326edx.74.2023.12.06.03.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 03:53:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Hao Zhang <quic_hazha@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] dt-bindings: arm: qcom,coresight-tpda: fix indentation in the example
Date: Wed,  6 Dec 2023 12:53:32 +0100
Message-Id: <20231206115332.22712-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206115332.22712-1-krzysztof.kozlowski@linaro.org>
References: <20231206115332.22712-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix triple-space indentation to double-space in the example DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/arm/qcom,coresight-tpda.yaml     | 32 +++++++++----------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
index 66d291b56019..b748cf21a4d7 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
@@ -96,33 +96,31 @@ examples:
   # minimum tpda definition.
   - |
     tpda@6004000 {
-       compatible = "qcom,coresight-tpda", "arm,primecell";
-       reg = <0x6004000 0x1000>;
+      compatible = "qcom,coresight-tpda", "arm,primecell";
+      reg = <0x6004000 0x1000>;
 
-       clocks = <&aoss_qmp>;
-       clock-names = "apb_pclk";
+      clocks = <&aoss_qmp>;
+      clock-names = "apb_pclk";
 
-       in-ports {
-         #address-cells = <1>;
-         #size-cells = <0>;
+      in-ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
         port@0 {
           reg = <0>;
           tpda_qdss_0_in_tpdm_dcc: endpoint {
-            remote-endpoint =
-              <&tpdm_dcc_out_tpda_qdss_0>;
-            };
+            remote-endpoint = <&tpdm_dcc_out_tpda_qdss_0>;
+          };
         };
       };
 
-       out-ports {
-         port {
-                 tpda_qdss_out_funnel_in0: endpoint {
-                    remote-endpoint =
-                    <&funnel_in0_in_tpda_qdss>;
-                  };
+      out-ports {
+        port {
+          tpda_qdss_out_funnel_in0: endpoint {
+            remote-endpoint = <&funnel_in0_in_tpda_qdss>;
           };
-       };
+        };
+      };
     };
 
 ...
-- 
2.34.1


