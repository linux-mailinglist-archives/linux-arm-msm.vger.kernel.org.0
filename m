Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A5526C38F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 16:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgIPOSm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 10:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726732AbgIPNcn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 09:32:43 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D9ADC014D06
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 06:20:26 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d6so3949266pfn.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 06:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VmOMPTou3Wj0j6dTANO73AOskZgjqqpzS5JmuHpvsbo=;
        b=SyjMB3LbiWpa+pk/F91+b9485LKR7QUBf2K43yXiNwsVArpOOwdh1XhH+kOD9YKAEa
         QXgoVr58RIyz1uFp78+KHF5YK3m/i3vEJJVdie4anZiJsmbqLtHdEoYs1athbGkhdr95
         mXD3VyiDPyahpvzZ/nwwNDqw0FuMv2Yb1ZMy5kmEABld28iStkI6wgq4MgZncvE7VTwM
         yw8vy5Ph1ab+ITHCbAqGmgK6JLNFh4LCfaMdrnvhN3XRwD1avQaYzSRbJaxZJSAiH39F
         h6yGpX6jTe995+4WOnJLT8l/13Ewxi+rBhUb7Yg8Xl41P9kwXkxNol4q4I2sYjttq1eh
         Ll1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VmOMPTou3Wj0j6dTANO73AOskZgjqqpzS5JmuHpvsbo=;
        b=C5K3l21pfXftlQLVWpQ29vG9FrdGmpAZPGjTEIE1I9MDiaHzx4NgzHpndawTJKswss
         BanDt7hgPVt42hqO8A/osjJUH+hPQ1pvzteIt1fs3gKoYHyhOzhqzzBt92mtOGg9oqfs
         F57xQpZcmCRk7DUL564zME4JMI3jahA7iuREXJbTeRCUql7tlDRLyDZfbKKOfm3ha0zc
         7cpO7ouJQALxxz+kGeXk3oXhO9p3XQP8Yd+Xy4MXitiktXU9Lzdl0+phWZ60aYID6KLE
         iMNT1y27PECXe2+39kQu7H0q2LluZQLlE9XjIl2rD2GjeszP9zmsVVwyP4iyjpVAcbci
         9iFA==
X-Gm-Message-State: AOAM531mF1jDO7bdDSPUuilvItUvsdHG+G7FFuo9YHnOUFIVyZIwgUUv
        9jyOheSu8XGIJNm58FQIADqT
X-Google-Smtp-Source: ABdhPJyzr+4ciBnBMWFpVsSaLSrBiAFMpRpFpNbECi3ynpgx0U725ZHMH6zeLaoB4K81sdYTjj4aZA==
X-Received: by 2002:a65:4c0f:: with SMTP id u15mr17373878pgq.296.1600262425512;
        Wed, 16 Sep 2020 06:20:25 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id e123sm17615726pfh.167.2020.09.16.06.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 06:20:24 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        vkoul@kernel.org, robh@kernel.org
Cc:     svarbanov@mm-sol.com, bhelgaas@google.com,
        lorenzo.pieralisi@arm.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/5] dt-bindings: phy: qcom,qmp: Document SM8250 PCIe PHY bindings
Date:   Wed, 16 Sep 2020 18:49:56 +0530
Message-Id: <20200916132000.1850-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916132000.1850-1-manivannan.sadhasivam@linaro.org>
References: <20200916132000.1850-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the DT bindings of below PCIe PHY versions used on SM8250:

QMP GEN3x1 PHY - 1 lane
QMP GEN3x2 PHY - 2 lanes
QMP Modem PHY - 2 lanes

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 185cdea9cf81..69b67f79075c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -31,6 +31,9 @@ properties:
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sm8150-qmp-ufs-phy
       - qcom,sm8250-qmp-ufs-phy
+      - qcom,qcom,sm8250-qmp-gen3x1-pcie-phy
+      - qcom,qcom,sm8250-qmp-gen3x2-pcie-phy
+      - qcom,qcom,sm8250-qmp-modem-pcie-phy
 
   reg:
     items:
@@ -259,6 +262,8 @@ allOf:
             enum:
               - qcom,sdm845-qhp-pcie-phy
               - qcom,sdm845-qmp-pcie-phy
+              - qcom,sm8250-qhp-pcie-phy
+              - qcom,sm8250-qmp-pcie-phy
     then:
       properties:
         clocks:
-- 
2.17.1

