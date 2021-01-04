Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 282722E90E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 08:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbhADHXm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 02:23:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727682AbhADHXm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 02:23:42 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D1CC06179A
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Jan 2021 23:22:46 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id h186so15960674pfe.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Jan 2021 23:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rmh+CTj/H1pwh1n20C+/KUGBokrzZ4wWICcJIDFC7P8=;
        b=xngIJ8KP++ywSldcUlpFrRvAp2Q1AEGr363zzNiFvtV50BHnCG10elW8nA5ZadC4b0
         XJmB7oQFH5rIPd5k68Tgf6SpejLgN+WpTNrtrjlHIUzfCoj7/W1cvHZAf72Cp7lwbktI
         KYNclRE6daOvcKukDudcEBJVz9dARKnkn3Nazl+GgSHVK6pyscCBGCEfkfj9/mALa04Z
         NUSVt/tNkVv/k8COXiuqYRxlMAmohZEx/h6J4ap7l8Bn5aR4Pvyv4Fo3iElGPgM+gayt
         WUUND+RvjbXOhvT1Z5U9rXEv1w1Pam8KUqMYPePnWzzL+w87EIllEF9jszUu0knT3Uza
         3MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rmh+CTj/H1pwh1n20C+/KUGBokrzZ4wWICcJIDFC7P8=;
        b=isN6xc1wgcTkwERW0sk1ZHnghehk3GLHQaPnknSnaS1qCORpgg0OWcMNp00QDpceuC
         APZcvvn5R9kwLqONjea8NH0XaxvgByXbxHm9eXqiDk64Ivdefa4bXV4fkHoFzlAKYrVY
         UnfnbZLuCKYgQBErWCB6k6h5WGYYoCSvSLvEreq5RrLMtjhsXgkRgHncpLAuH+mW4WC2
         YqQ1EkRsqUJcg+xBjOZsWgme/MRLakay3uM/fnd377D7jUk39xJtL07b8C5jpYsGkGWi
         Ma64QWGPUQzqgc8mX1wg7R03+b6Ud7V7bojH/yQ7/IRrrbKnyar0deM/3ie9fxzMVsrq
         KfCQ==
X-Gm-Message-State: AOAM532zhhhVCJLRpcwM8+gc2FYaSrRdCwk45gZbMXk4qMNJcTB+Mvh8
        YF0aL0H3cJsD70s8MmzZUryF
X-Google-Smtp-Source: ABdhPJxHTLZwkhu6ZRf7m0yiaHgoOkOmM3qsLfPPBG/LTqKT35FQiMlN5nqjhs/GcFiv9TsuSp5cgw==
X-Received: by 2002:aa7:8708:0:b029:19e:924:345a with SMTP id b8-20020aa787080000b029019e0924345amr41278800pfo.54.1609744965869;
        Sun, 03 Jan 2021 23:22:45 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id h7sm56676668pfr.210.2021.01.03.23.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 23:22:45 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, vkoul@kernel.org, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add SDX55 USB PHY binding
Date:   Mon,  4 Jan 2021 12:52:11 +0530
Message-Id: <20210104072212.144960-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104072212.144960-1-manivannan.sadhasivam@linaro.org>
References: <20210104072212.144960-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree YAML binding for Qualcomm QMP Super Speed (SS) PHY found
in SDX55.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index ec05db374645..390df23b82e7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - qcom,sm8250-qmp-gen3x1-pcie-phy
       - qcom,sm8250-qmp-gen3x2-pcie-phy
       - qcom,sm8250-qmp-modem-pcie-phy
+      - qcom,sdx55-qmp-usb3-uni-phy
 
   reg:
     items:
@@ -109,6 +110,7 @@ allOf:
           contains:
             enum:
               - qcom,sdm845-qmp-usb3-uni-phy
+              - qcom,sdx55-qmp-usb3-uni-phy
     then:
       properties:
         clocks:
-- 
2.25.1

