Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63248350304
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 17:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236057AbhCaPOK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 11:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235665AbhCaPOJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 11:14:09 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919C8C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 08:14:08 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d13so8669115lfg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 08:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=szrnHwOMXqsq40OfwiBkaChIfbhw+vSJppKz2hMlXUk=;
        b=SDbgjo2E4CWkK9exdps6SOvJMvHfGv2yAP96YouU6KKUJs0uYAvlW2MOIjXz9ShUlk
         kzU0B9oTosK42j49NXJigkYjCQmI8WASV6J1LOaOp5A9tlJYPimbEWx6XMIrFC+7Lovg
         c/NXlVPOlDlLwy9C/jk2/MkLd2PLjO/RAn79RfvX9fp3m3zdnanvMWmuKKJGaZiKaf2V
         pgAxx4N9VA89ubrjgloFzhPlPucyM/nVEu/gC8XijuABjOgnZ1R6rGNkFPpyJeiaVypE
         WSY/C/u4Ze7sWhHWHznoPqspQz4O23NbUaK0BnDVviowKgaoev6aI/hvtgseE+FBhw5K
         r67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=szrnHwOMXqsq40OfwiBkaChIfbhw+vSJppKz2hMlXUk=;
        b=WODX8JR6zKS1u7yYY3irOhx8dhRVMuJSytIpEFDpW0SLhpnfDdGnPOciN+VLSJEkOC
         N6zFD8O9qcdWtTpt015JfrqhtMq8VACyJWAnnVv36oLCGK+BcUfp43sW1poVK3z1XiH7
         hNVETTPeE+UNkEF8kK+ue30YMO3CpuuiZli/n0AjLR0nOIaFcOxT4V/73eJNaUVLw8EI
         NnMxL+1r3MztQJKlDsR9if/PhP9yfnb7RsK2BbtyJGAcJGB8X7hfzn0SPolC6K8Mpjv4
         GoZANO4ooGKougrP2q+SEXBRfe9Ljr3VNQLp3IeP0SCsxU6b4mTxsVxxSTKKKLs58jfL
         l5Iw==
X-Gm-Message-State: AOAM533zKgTEI+lwA2VNOb5fuyUp5LOXLwbrPHRWnPNXaXoPDwazwnHb
        mxVwLI8ru3eunB3UVFW3j/xUsQ==
X-Google-Smtp-Source: ABdhPJx8wJimx8Bjx4vf436ecI3j1vwX+V9pniNN9LBrkbdu+/2+6Y39SPXzJGhsP6No69QnxUatzQ==
X-Received: by 2002:a05:6512:2097:: with SMTP id t23mr2393277lfr.21.1617203647130;
        Wed, 31 Mar 2021 08:14:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s29sm266586ljo.136.2021.03.31.08.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 08:14:06 -0700 (PDT)
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
Date:   Wed, 31 Mar 2021 18:13:59 +0300
Message-Id: <20210331151405.3810133-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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

