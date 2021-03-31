Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA02E35030C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 17:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235908AbhCaPQ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 11:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236151AbhCaPQ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 11:16:28 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6274FC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 08:16:28 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id s17so24295915ljc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 08:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=szrnHwOMXqsq40OfwiBkaChIfbhw+vSJppKz2hMlXUk=;
        b=upQXAejzgPv+H4nLxw/TZdHhITf90bSgJFKa7jsA2hwGQ0Co08D9NbJ7vpwSfieCxT
         W9SJsoqINMcJKyP7t8jEn65cpyr92l/K392htdyFqtDpkHdMU7Uf6wfqkrp6rKVQTOAS
         C5aKz71YSobND7VImIowzM7/XxmGFAC4pCe1IbXWE4xiy3KIYFwz0di0+0hPzWu/isKy
         8gHi+KX6+y4BbSj8oAoBg7//e6VE+ucQHfNMCVDgOeYdqWfH4k4UxRPcQ88alkuasM2i
         BCOaswei+RhwPZ7+8oDcbHTIoBJEXUbM+c3EZ3BeIA3gotrS9irg6aR9NfpeFFLjqSvC
         frvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=szrnHwOMXqsq40OfwiBkaChIfbhw+vSJppKz2hMlXUk=;
        b=uBp/SWKGhGGoJcy7OhqtfipUA3O618qezfASDhFuSJ+UyIp2VNL8QWDwYXgblJjz4L
         xjXuCq4Tgmj6WNfQbxLp5dHsfNfrE4imzMEX4FSq+ZeF7uZSk31RDBXO5NZhBuMF+JkJ
         KuuymSupUmzeNjjXQhxR2NZ148aWTPEDJX5jDKGiK6nr6+wOaRnLI1vfP0AuUkfvmSd0
         gQ/FmpUmk0YrdtnzdlRHmT8mnXENUfxRsbt2j3JZ19nTGYDMI6KsN8N7f0Jbhg+GatlB
         WkS+b6563/6CUc+Fv5Zbjld93SOox2iPrXTyYOaHG3rzoLaTzRLj40stMEpzRKYDmGzz
         pBeQ==
X-Gm-Message-State: AOAM532bvA5AcFVlYx6PAtoq7pjnw5IC/dWHDMjOFA/oQznXh2VaE0Ef
        3XzL+j2K/hzl2fMsmF0G2rXiKw==
X-Google-Smtp-Source: ABdhPJyL/SWLD3xIBuuJ+0maF2hVry+EmXIDVEmKMDw1jR8CGVcY0HEyBl+/KLky+Lirs/ZfMXGpyQ==
X-Received: by 2002:a2e:8959:: with SMTP id b25mr2480146ljk.245.1617203786452;
        Wed, 31 Mar 2021 08:16:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t201sm266738lff.70.2021.03.31.08.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 08:16:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/7] dt-bindings: phy: qcom,qmp-usb3-dp-phy: move usb3 compatibles back to qcom,qmp-phy.yaml
Date:   Wed, 31 Mar 2021 18:16:08 +0300
Message-Id: <20210331151614.3810197-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331151614.3810197-1-dmitry.baryshkov@linaro.org>
References: <20210331151614.3810197-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit 724fabf5df13 ("dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy
information") has support for DP part of USB3+DP combo PHYs. However
this change is not backwards compatible, placing additional requirements
onto qcom,sc7180-qmp-usb3-phy and qcom,sdm845-qmp-usb3-phy device nodes
(to include separate DP part, etc). However the aforementioned nodes do
not inclue DP part, they strictly follow the schema defined in the
qcom,qmp-phy.yaml file. Move those compatibles, leaving
qcom,qmp-usb3-dp-phy.yaml to describe only real "combo" USB3+DP device nodes.

Fixes: 724fabf5df13 ("dt-bindings: phy: qcom,qmp-usb3-dp: Add DP phy information")
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml         | 2 ++
 Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 626447fee092..7808ec8bc712 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -25,11 +25,13 @@ properties:
       - qcom,msm8998-qmp-pcie-phy
       - qcom,msm8998-qmp-ufs-phy
       - qcom,msm8998-qmp-usb3-phy
+      - qcom,sc7180-qmp-usb3-phy
       - qcom,sc8180x-qmp-ufs-phy
       - qcom,sc8180x-qmp-usb3-phy
       - qcom,sdm845-qhp-pcie-phy
       - qcom,sdm845-qmp-pcie-phy
       - qcom,sdm845-qmp-ufs-phy
+      - qcom,sdm845-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sm8150-qmp-ufs-phy
       - qcom,sm8150-qmp-usb3-phy
diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
index 33974ad10afe..62c0179d1765 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@ -14,9 +14,7 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-qmp-usb3-dp-phy
-      - qcom,sc7180-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-dp-phy
-      - qcom,sdm845-qmp-usb3-phy
   reg:
     items:
       - description: Address and length of PHY's USB serdes block.
-- 
2.30.2

