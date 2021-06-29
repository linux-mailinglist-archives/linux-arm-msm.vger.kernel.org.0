Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 578673B6BD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 02:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbhF2Asx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 20:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhF2Asx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 20:48:53 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9366C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 17:46:23 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id o13-20020a9d404d0000b0290466630039caso5669381oti.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 17:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0d8zbMo9V9zxdFiDSYDzc1ZZBoiwj8ZiodSoR+dBxQM=;
        b=hsKiwYalAxSUUx0v4gCd+27Xm+6jJ1qMca4RdjGuvuWKXA3RkC7jz+ANVpJIuK9dZO
         u/WUDE0UkBa1c87HasMLvLXWv1/amOE5I4VXyT6M1hn1hrZFQ8lLbhW2wvtzRGBwh5Ka
         ZQP5zSMJtZZ9BCyOLQpM0obhVYOKMg4b9/XzD/3BpHON/FevDsC8IuuY/wSFAvBnda+P
         QN6GYs1t0/8hebF2eCVrVailE+SY6Vnvu0/3VY+gN2EKQo4QMdSga5WTo9AzKggoOQZ9
         qidM2Z0wGjKLKw7sZd5BRg5K9enoTRJYaE5Qj/CvCHAGbx5e0nsqhbcVrHKHiUrFJuOS
         9udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0d8zbMo9V9zxdFiDSYDzc1ZZBoiwj8ZiodSoR+dBxQM=;
        b=AfOXHvLqk550400wtPqv1M4PVMRDisy3XLPIKMu52N72EFS0MzN4WVZdNsgVWDGAMu
         3LF9Puv4ULoYiO7U6u8gL5/R3iCsUUaqOXyQhDwN+nLRWYIS3Bwj+gEM/BruGn/WQ9WN
         GKyQv3PfGSO22BlR8SyFbepNDXL8OoHRcoXmtrKFZpWJvMoa1goKl6AmGg0L5WzmE1cY
         icOI5MynjWUAps1JO8fqNs2RZXKVVcHrVSrH9hgD8TgbOwWzmwR76hkYZTHyAHg85pl7
         pWzRR65tukRtkP1tVb+a2p1FB/v8dFtkR5kKkqyPWyp4JIV5PMPvlOTtdCuA2SkN30Un
         vIQw==
X-Gm-Message-State: AOAM530zjm8QuqZyCcuAtGb+2HzA9lwd4krs4hWqcbQOMQTkADEtXFNs
        y2+Wc78rAksAovrWAtXYzedpmQ==
X-Google-Smtp-Source: ABdhPJygaGlBx4cJgfr4jOjytIOq6ewXtnUVJFP6+ftbUl4R7nxAOyT4TP5jOpwN0V0HHguQifak2g==
X-Received: by 2002:a9d:6087:: with SMTP id m7mr2014551otj.318.1624927583076;
        Mon, 28 Jun 2021 17:46:23 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f3sm2671979ote.74.2021.06.28.17.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 17:46:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add sc8180x PCIe compatible
Date:   Mon, 28 Jun 2021 17:45:08 -0700
Message-Id: <20210629004509.1788286-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible for the sc8180x PCIe PHY.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index f0497b8623ad..242560ff52a4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,msm8998-qmp-ufs-phy
       - qcom,msm8998-qmp-usb3-phy
       - qcom,sc7180-qmp-usb3-phy
+      - qcom,sc8180x-qmp-pcie-phy
       - qcom,sc8180x-qmp-ufs-phy
       - qcom,sc8180x-qmp-usb3-phy
       - qcom,sdm845-qhp-pcie-phy
@@ -326,6 +327,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sc8180x-qmp-pcie-phy
               - qcom,sdm845-qhp-pcie-phy
               - qcom,sdm845-qmp-pcie-phy
               - qcom,sdx55-qmp-pcie-phy
-- 
2.29.2

