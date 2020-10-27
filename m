Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8374B29BF1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 18:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1814972AbgJ0RA4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 13:00:56 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44476 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1814961AbgJ0RAw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 13:00:52 -0400
Received: by mail-pl1-f193.google.com with SMTP id t6so555261plq.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2020 10:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tXlyL6zU9Oi7mF712cW5uVDhhzbjKozJmhsk4g6QPrE=;
        b=spJYyW1Ul46OYC+5CBcPT6oVBYkeQx/N2YYxZBtcKnNmYJD2asXB0DfKkjJmVrRize
         EnWCJClPKBz65X8+igdUVUmedh0pqwGwpvWjgJKGxNPUQbE+RmpdE0w5ehfV+VjiFn3e
         hyjyf0VDZ7nWMUEQ2ZKbTDghSSN43cMpqxyKDGL7mS087SYE2SOWFRqrBTHV7nVLoyPx
         RAcOfyn1gC4gP8r+/tIGBFEP4vY8Old+gNl9jxFkVmmcW7iT7q10DvMvkm7QpVdwH3Vc
         7eCZj8tx6XKhOEYhck88VF4BUkF3e3SflfVl0YcS/+c5SRxs5tGASdGX8GDjTl31rnvj
         lKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tXlyL6zU9Oi7mF712cW5uVDhhzbjKozJmhsk4g6QPrE=;
        b=j8jtlsDzC9rwQGF4Kd8Kq+dyTCjHqnlZlRY3ViC7Z5K/nfsyH+omshnGkyPQAUaJpb
         h3JwX3kMnH5xBZtk2yDcxc2bTTAi5HSjJDL7k68JJTp4tXYY1rD9lR2Ytp0YJRK2MfNp
         +yIT/ZzxDAhgpj3sRPG2ngovZW5QPiwFait1fDZA5CJ6WlTuxITiKzoMx7WWzD9HAlwP
         pW7D8h9bMPowMc/OHN8A4RwkbboXLw3jLo6PKJZGAy9JOK5gy/9+lbMXFJy2OXpX8luG
         iHkn151GkuKCtYWowapMHSB2sTmFxQ4bK5a8h2XLKkGKf2Rv4ThY7Sv84QNRuwJ2r4LV
         mDgg==
X-Gm-Message-State: AOAM5304jE/vH84Xd+KeYlAsKIaTRFA7PhOz04tK9RJBSB3v0B+WS9aS
        tU67x5C7GP69sQsb4rLECEwF
X-Google-Smtp-Source: ABdhPJxI5lXKIdqOqdlCGYKZDvii4G1E8qmtaiHGeTUSLVkvOb1kS/tTw2MrmdX+OPFULn86KG8TIQ==
X-Received: by 2002:a17:902:7298:b029:d4:c71a:357a with SMTP id d24-20020a1709027298b02900d4c71a357amr3451859pll.38.1603818051120;
        Tue, 27 Oct 2020 10:00:51 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id x26sm2845206pfn.178.2020.10.27.10.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:00:50 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        vkoul@kernel.org, robh@kernel.org
Cc:     svarbanov@mm-sol.com, bhelgaas@google.com,
        lorenzo.pieralisi@arm.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, devicetree@vger.kernel.org,
        truong@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 1/5] dt-bindings: phy: qcom,qmp: Add SM8250 PCIe PHY bindings
Date:   Tue, 27 Oct 2020 22:30:29 +0530
Message-Id: <20201027170033.8475-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027170033.8475-1-manivannan.sadhasivam@linaro.org>
References: <20201027170033.8475-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the below three PCIe PHYs found in SM8250 to the QMP binding:

QMP GEN3x1 PHY - 1 lane
QMP GEN3x2 PHY - 2 lanes
QMP Modem PHY - 2 lanes

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 185cdea9cf81..ec05db374645 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -31,6 +31,9 @@ properties:
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sm8150-qmp-ufs-phy
       - qcom,sm8250-qmp-ufs-phy
+      - qcom,sm8250-qmp-gen3x1-pcie-phy
+      - qcom,sm8250-qmp-gen3x2-pcie-phy
+      - qcom,sm8250-qmp-modem-pcie-phy
 
   reg:
     items:
@@ -259,6 +262,9 @@ allOf:
             enum:
               - qcom,sdm845-qhp-pcie-phy
               - qcom,sdm845-qmp-pcie-phy
+              - qcom,sm8250-qmp-gen3x1-pcie-phy
+              - qcom,sm8250-qmp-gen3x2-pcie-phy
+              - qcom,sm8250-qmp-modem-pcie-phy
     then:
       properties:
         clocks:
-- 
2.17.1

