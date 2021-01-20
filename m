Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 698422FDDF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 01:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732738AbhAUAbW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 19:31:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404037AbhATXXj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 18:23:39 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687D2C0617B9
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:45:24 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id o11so25028236ote.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yTbXPqD4zbkGnIMCPH6cR9hk9qRDwJpn65PvPJP75rA=;
        b=SigRUfruDOPZEcpEs32X6xFJzSEF06xjGtl3S7gbsSPxEW3D9OH028lvWarC79YREo
         S49n5rep+rR7y6cZ7UYUPLocMNO2eK6eQKsB4DoNBhs8Y9+sTpa1JsQ5STAgwBl+1/30
         mgDuzPcBCcETZWccZ2Z75mJAZiHslMEEf/xuu4ZtoLAF1UfPCro18ib4TN9+nSwNpMac
         DVgGNG5DvuCSAY/emiujcVKtr9IlvN1Sx5FINbDmwCPFwqRIWFQJGSUnk3RCzE4oM+Kt
         YSwqSVTwJvEjl3CesWJ+o2v8aEBnsx7K/r5PCRc7vIXEKeFRQb1bp33nVaguz34Z+/mG
         7OAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yTbXPqD4zbkGnIMCPH6cR9hk9qRDwJpn65PvPJP75rA=;
        b=lrzZdqUfkXjzaHzSJ/FbwkbqNuLXAgS7owU/Q5DmPAf8/6acT6IPcW6eDcQj7ppQLw
         OUadQEKS6x9EesFuOThJkJkAGtCBirx27bgKFcgqKX3zQbk5WNI4k4AKfTfrRRKN6xri
         nYkAswSAx1t8XSzfGEZjUHVUEEMmAgFOjuj7HrMULdPcrGpOEUkQ/tx+JZlgeDLKTm+/
         L7qEFGMs7nUJ1O5rQWlSx6XkxMiPxrNeST4xm/IdJU4kBXLlqWnXSsW23YxOk7BFCnRF
         c4WGUVmV1GadXwcoIBJso0LWjdNMM6go/SvBTb3OCGwNPnO9A3p4SMfZGXHezP13meLp
         4tCQ==
X-Gm-Message-State: AOAM532uTpw3sd0umAmCN78aKDzuXKhHd68BUMcyB0ZSUtEaswe85zSJ
        aa1Xn1F1Z502rZeOlsx24SiYSg==
X-Google-Smtp-Source: ABdhPJyRWzkSjCeucXDNQb9N7qrb1yr44yzshKhXo9BLqb4OLAoYZJ/9slysAREVqRWkxCkz03wBrg==
X-Received: by 2002:a9d:3d06:: with SMTP id a6mr8092044otc.368.1611182723720;
        Wed, 20 Jan 2021 14:45:23 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m18sm692791otj.50.2021.01.20.14.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 14:45:23 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add SC8180X UFS to the QMP binding
Date:   Wed, 20 Jan 2021 14:45:30 -0800
Message-Id: <20210120224531.1610709-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for the SC8180x UFS PHY to the QMP binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 0f00d82461fd..e272a1077150 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,msm8998-qmp-pcie-phy
       - qcom,msm8998-qmp-ufs-phy
       - qcom,msm8998-qmp-usb3-phy
+      - qcom,sc8180x-qmp-ufs-phy
       - qcom,sdm845-qhp-pcie-phy
       - qcom,sdm845-qmp-pcie-phy
       - qcom,sdm845-qmp-ufs-phy
-- 
2.29.2

