Return-Path: <linux-arm-msm+bounces-5737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE6C81B383
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 11:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A8AEB2278F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 10:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C465103D;
	Thu, 21 Dec 2023 10:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HkVrYHTF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005584F8B4
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e270639d9so796351e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 02:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703154309; x=1703759109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7t0InnVEdoaDLd0slt0Nn4Ib7Hih+u/LAlcmfNafhqE=;
        b=HkVrYHTFqJmrqs/qywzPjkqUqbhgu/iLdzYBxqPPubCm8FxCviqlxZg4XWa9onUeQB
         qJaeZYO3eR1bjorqlNUGZEgnb6pHPFQtd/6tL3arMRZxMUDMiXHHeLBf6Y8Ofz75nm5r
         GLBINJZLjZNKs8cj483HUH4UM9FhG8b9SmkJQWg//EbU1Ugl4HHALulYJG+kHkEm/8EB
         W6g2MqemQdy419XrcZeE/lk2Xt2JtJZT/UsLeonD+mR7OUqxj+Pg5cUBc2D9Izo4rSq+
         CT9bFuaLQNZ0HXtfIordqnvz/DYlzzl6SLgDzKmJAABn4hqfynhvtK1rGm7vVB07xegC
         fNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703154309; x=1703759109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7t0InnVEdoaDLd0slt0Nn4Ib7Hih+u/LAlcmfNafhqE=;
        b=FWDtxVrOkiYQUOxMsC3JasZ1UWCSkRtBJ6vwIbBoR272gPe+e6ix5yM1cuXEyaYW7l
         YoiTSUesB0moRdV2rNDIZ4cbCJc7+PqfmzqhTkmarRzxaUyoufREt6G8MZ7fwBWTzlar
         elnVD13TgI3+n8p5FzSGUThPPOVx+i3u4j9t7FMzvuKN8rinMcZevJmhf55Jl5xEghgi
         Q0OjdcfafaEBsBrqT/QgPEKlmPHJh+bMPgcl9yms/qLJSCpFXiDAnDinp8/FG+00yO78
         FmfEllYrf/IF6u2VtH9O2lskoZa7auU0S8oiR6c0RhD1T4WhAMEx9D2kIQpWDk3Je6fz
         7DUg==
X-Gm-Message-State: AOJu0YwaiZAEiysjtxTHKKbCNQZ9UudZkIa0Go/iVxdBDlKZA2t07vIB
	ZN7cHoXoquw5tr0WCJNcro/MgQ==
X-Google-Smtp-Source: AGHT+IHsypJK5zmnFF8uxikLuOs/DapVoexa1CtYrg0iXQF5DIPiyEwsd93WTa+aqhMeVusC0+eOQA==
X-Received: by 2002:a05:6512:285:b0:50e:60eb:255e with SMTP id j5-20020a056512028500b0050e60eb255emr275172lfp.23.1703154309104;
        Thu, 21 Dec 2023 02:25:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m26-20020a056512359a00b0050aaae62dbdsm231671lfr.62.2023.12.21.02.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 02:25:08 -0800 (PST)
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
	linux-phy@lists.infradead.org,
	Aiqun Yu <quic_aiquny@quicinc.com>
Subject: [RFC PATCH 2/2] dt-bindings: display: msm: mass-rename files
Date: Thu, 21 Dec 2023 12:25:06 +0200
Message-Id: <20231221102506.18320-3-dmitry.baryshkov@linaro.org>
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

Rename the Qualcomm MSM Display schemas to follow the main compatible
string instead of just using the block type. This follows the
established practice for YAML file names.

Cc: Aiqun Yu (Maria) <quic_aiquny@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml}     | 2 +-
 .../bindings/display/msm/{gpu.yaml => qcom,adreno.yaml}         | 2 +-
 .../bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml}       | 2 +-
 .../bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml}          | 2 +-
 .../msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml}   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/display/msm/{gmu.yaml => qcom,adreno-gmu.yaml} (99%)
 rename Documentation/devicetree/bindings/display/msm/{gpu.yaml => qcom,adreno.yaml} (99%)
 rename Documentation/devicetree/bindings/display/msm/{hdmi.yaml => qcom,hdmi-tx.yaml} (98%)
 rename Documentation/devicetree/bindings/display/msm/{mdp4.yaml => qcom,mdp4.yaml} (97%)
 rename Documentation/devicetree/bindings/display/msm/{dsi-controller-main.yaml => qcom,mdss-dsi-ctrl.yaml} (99%)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno-gmu.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/display/msm/gmu.yaml
rename to Documentation/devicetree/bindings/display/msm/qcom,adreno-gmu.yaml
index 4e1c25b42908..0678cead56bf 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno-gmu.yaml
@@ -3,7 +3,7 @@
 %YAML 1.2
 ---
 
-$id: http://devicetree.org/schemas/display/msm/gmu.yaml#
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno-gmu.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: GMU attached to certain Adreno GPUs
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,adreno.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/display/msm/gpu.yaml
rename to Documentation/devicetree/bindings/display/msm/qcom,adreno.yaml
index b019db954793..ad15f0a6ead7 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,adreno.yaml
@@ -2,7 +2,7 @@
 %YAML 1.2
 ---
 
-$id: http://devicetree.org/schemas/display/msm/gpu.yaml#
+$id: http://devicetree.org/schemas/display/msm/qcom,adreno.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Adreno or Snapdragon GPUs
diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,hdmi-tx.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/display/msm/hdmi.yaml
rename to Documentation/devicetree/bindings/display/msm/qcom,hdmi-tx.yaml
index 47e97669821c..a137ca0b734c 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,hdmi-tx.yaml
@@ -2,7 +2,7 @@
 %YAML 1.2
 ---
 
-$id: http://devicetree.org/schemas/display/msm/hdmi.yaml#
+$id: http://devicetree.org/schemas/display/msm/qcom,hdmi-tx.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Adreno/Snapdragon HDMI output
diff --git a/Documentation/devicetree/bindings/display/msm/mdp4.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp4.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/display/msm/mdp4.yaml
rename to Documentation/devicetree/bindings/display/msm/qcom,mdp4.yaml
index 35204a287579..40c31602affd 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp4.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp4.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/mdp4.yaml#
+$id: http://devicetree.org/schemas/display/msm/qcom,mdp4.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Adreno/Snapdragon MDP4 display controller
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss-dsi-ctrl.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
rename to Documentation/devicetree/bindings/display/msm/qcom,mdss-dsi-ctrl.yaml
index 4219936eda5a..35f4facc2fdd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss-dsi-ctrl.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
+$id: http://devicetree.org/schemas/display/msm/qcom,mdss-dsi-ctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Display DSI controller
-- 
2.39.2


