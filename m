Return-Path: <linux-arm-msm+bounces-5738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 245FC81B382
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 11:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FF751F24D95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 10:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F444F884;
	Thu, 21 Dec 2023 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tsi8h5Yi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2472E51C23
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e305530baso777809e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 02:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703154308; x=1703759108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zl+unRu+Z3Li1VZc4Qd2ksf/Y02Bj/Ncp2AcgdIJpNI=;
        b=tsi8h5YimJkL+anEm9KMRn9MYAgWKtm7Y9nIKm+cRWhx40WgRjAFCp4TFYlQsNPEZq
         vgFVFlWIqIeMl3UpBde5NBM3JOjXdDLoMH3LeEHjg70P/vHIqWNwQSvEcW5KnYcfKhiO
         e+u5Sd9s/hkuuwGNocMNlBbCUK2vGWO+YaLrjGVr7LG4lChesMEY6aZwOaMaW3aaT5bP
         XF5x920ugFtzX2ZvMAZxq4WxWIxcvyqIrYi87cejUVkIX4XbJLMCm85ODoqpawSv2vsP
         ycXDfoq3WskC7Q9nhVg2x/WuylNmAgR4TO7km0FcMDC7YiURv+3Mi2/WnEYf+amCN+UG
         ipcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703154308; x=1703759108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zl+unRu+Z3Li1VZc4Qd2ksf/Y02Bj/Ncp2AcgdIJpNI=;
        b=f7OvwzNk4ubcQTFmST5JhvHlyjU/Abxk+W0Igu+MQtZgi7A8G8RXwfNr3iyEi9xXk2
         DYubXWBegFEUgf8JvY5z6p5+xz7RDY7WHLc1dHMUuiaehloMGoZMvt6H4SBxiWuoq4A3
         00Yyb1jSC7X5Qot1db7B5ZITDNkZz0XvrRwSzPPYmuSl/MuaapXPTSW6HSecwl/i3JlS
         KRQXCySqOsylaQOWY2k9GVhcP7cP06qa09uW4bd1hk8UE4tuT33q+OelWcAzXbZVuV0P
         +Fe3CM9w+sv6Spxhzi6QIpQ9VK2dodSdoS5TyRGDp4+M/54UeRuxuYKNhxjH5sPThJ3a
         xcxw==
X-Gm-Message-State: AOJu0YwmJ12mmbvfvzDO19r1I5e2nxKXjshOxXk1w6JZXIIU7Q2vlrvA
	7DIVmkBtRUGtA/18ZZLaos+wBQ==
X-Google-Smtp-Source: AGHT+IErFsX1C+i5hoTMPx7U4b5LtQifR1S+KwjgLmAZYmXWJKsKdb6GqMAJPx0m4XRQ74za46cjAQ==
X-Received: by 2002:a05:6512:b26:b0:50c:180:2156 with SMTP id w38-20020a0565120b2600b0050c01802156mr11739569lfu.7.1703154308200;
        Thu, 21 Dec 2023 02:25:08 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m26-20020a056512359a00b0050aaae62dbdsm231671lfr.62.2023.12.21.02.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 02:25:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-phy@lists.infradead.org
Subject: [RFC PATCH 1/2] dt-bindings: display: msm: move DSI PHY schema to bindings/phy
Date: Thu, 21 Dec 2023 12:25:05 +0200
Message-Id: <20231221102506.18320-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221102506.18320-1-dmitry.baryshkov@linaro.org>
References: <20231221102506.18320-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the DSI PHY schema files describe the display-related hardware,
they still describe a PHY. Move all DSI PHY schema files to the phy/
subdir.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/dsi-phy-10nm.yaml => phy/qcom,dsi-phy-10nm.yaml}      | 4 ++--
 .../msm/dsi-phy-14nm.yaml => phy/qcom,dsi-phy-14nm.yaml}      | 4 ++--
 .../msm/dsi-phy-20nm.yaml => phy/qcom,dsi-phy-20nm.yaml}      | 4 ++--
 .../msm/dsi-phy-28nm.yaml => phy/qcom,dsi-phy-28nm.yaml}      | 4 ++--
 .../msm/dsi-phy-7nm.yaml => phy/qcom,dsi-phy-7nm.yaml}        | 4 ++--
 .../msm/dsi-phy-common.yaml => phy/qcom,dsi-phy-common.yaml}  | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-10nm.yaml => phy/qcom,dsi-phy-10nm.yaml} (96%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-14nm.yaml => phy/qcom,dsi-phy-14nm.yaml} (94%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-20nm.yaml => phy/qcom,dsi-phy-20nm.yaml} (93%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-28nm.yaml => phy/qcom,dsi-phy-28nm.yaml} (94%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-7nm.yaml => phy/qcom,dsi-phy-7nm.yaml} (94%)
 rename Documentation/devicetree/bindings/{display/msm/dsi-phy-common.yaml => phy/qcom,dsi-phy-common.yaml} (90%)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-10nm.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-10nm.yaml
index 69d13867b7cf..094fbd60093a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-10nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-10nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 10nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml
index 52bbe132e6da..308706d37944 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-14nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-14nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-14nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 14nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-20nm.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-20nm.yaml
index 7e6687cb002b..cf6f96d04150 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-20nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-20nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-20nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 20nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-28nm.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-28nm.yaml
index 288d8babb76a..4fe30ca2d5f5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-28nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-28nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-28nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 28nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
similarity index 94%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
index 7e764eac3ef3..1208aa59ca84 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-7nm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI 7nm PHY
@@ -10,7 +10,7 @@ maintainers:
   - Jonathan Marek <jonathan@marek.ca>
 
 allOf:
-  - $ref: dsi-phy-common.yaml#
+  - $ref: qcom,dsi-phy-common.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-common.yaml
similarity index 90%
rename from Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
rename to Documentation/devicetree/bindings/phy/qcom,dsi-phy-common.yaml
index 6b57ce41c95f..b871a36cb210 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,dsi-phy-common.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-phy-common.yaml#
+$id: http://devicetree.org/schemas/phy/qcom,dsi-phy-common.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI PHY Common Properties
-- 
2.39.2


