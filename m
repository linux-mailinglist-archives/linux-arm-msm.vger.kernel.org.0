Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72554710AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Dec 2021 03:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233223AbhLKCVm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 21:21:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhLKCVl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 21:21:41 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC250C061714
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 18:18:05 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id b1so21093288lfs.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 18:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Gomy4ei7qSbDbo9NwD3wFRtHE34eVnEHILbspr7bME=;
        b=Bposn8EzOnBHIzoDzi+VerE2/NgDZoXm+dPK1naAF6BS4VP25rlv5Wb7CDYTZUafXy
         xeSF+Q/0LU8z8GkdHHjvkwUcjZyDEvFdMY2kypGmbfEqwL+tZaMBUNM/gs6cz0pBG/m2
         G41/BSpTVhrQMOxmYsGT4ilKq2R72XGHbkkFqUctHyEyIr3KsEyC+JhsswBF2bNm6lxu
         DPnaeu8nms3eKAEk4KJTDBkvL37njEJdbpW0cE6BvNHreQfmsr2k7MBMEqRFwjoU38Uj
         nY5O1kSJvAVz1Ax+AeQGB0KME54yiMG20Qh/64iICiVVFsdJNUumbl2huB6Q/IwH+cuD
         003w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Gomy4ei7qSbDbo9NwD3wFRtHE34eVnEHILbspr7bME=;
        b=yLj3CpWt9pB9z5ntR8zsYLkbuUPioUZdBhz8v0SgDrO1T4zuCdfb+LZFVF09ysStxX
         FKJ1cObuyQL6xw2IU8fhglG9ObK/pWl5Blq542X9bKAKY1B/i6ujuOlXgbkfrxh1T9yL
         ifg8Ug0FjIe4H23rRY2AVcV/3EnN7kj9zioG74u0BK1e9QzZxg7pc4oFnWIYqZEXHDEa
         WPbfdKKRy7Ag1lHi4uvVYUBsiBnKuOv+C+6eTGCHh2mZunrgYRBmHN3ELA4+2QbKU0rg
         fiPwrNK6k2mmaF54K1fBIa/ttCTpz3VlFaT0nytElmUv+wAdC1UC5ffY+HaVBdvTgQ7t
         NY8g==
X-Gm-Message-State: AOAM531UnMNy/KS7DwTZ1s948FDPB/wtAbH6nmne55hNcHllf6quAjat
        j6iiCZDjrncsTmfm+8mzYqKJ6w==
X-Google-Smtp-Source: ABdhPJy2iqOvz5oiC9mbpaYvNpZrU0kJc2FQTM+3ouhw50dnA7I/3G/X9H4WpLd1NGK21whRdZqPyA==
X-Received: by 2002:ac2:4119:: with SMTP id b25mr15215917lfi.3.1639189084146;
        Fri, 10 Dec 2021 18:18:04 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y7sm504663lfj.90.2021.12.10.18.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 18:18:03 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 02/10] dt-bindings: phy: qcom,qmp: Add SM8450 PCIe PHY bindings
Date:   Sat, 11 Dec 2021 05:17:50 +0300
Message-Id: <20211211021758.1712299-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211211021758.1712299-1-dmitry.baryshkov@linaro.org>
References: <20211211021758.1712299-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are two different PCIe PHYs on SM8450, one having one lane and
another with two lanes. Add DT bindings for the first one. Support for
second PCIe host and PHY will be submitted separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index c59bbca9a900..d18075cb2b5d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -50,6 +50,7 @@ properties:
       - qcom,sm8350-qmp-ufs-phy
       - qcom,sm8350-qmp-usb3-phy
       - qcom,sm8350-qmp-usb3-uni-phy
+      - qcom,sm8450-qmp-gen3x1-pcie-phy
       - qcom,sm8450-qmp-ufs-phy
       - qcom,sdx55-qmp-pcie-phy
       - qcom,sdx55-qmp-usb3-uni-phy
@@ -333,6 +334,7 @@ allOf:
               - qcom,sm8250-qmp-gen3x1-pcie-phy
               - qcom,sm8250-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-modem-pcie-phy
+              - qcom,sm8450-qmp-gen3x1-pcie-phy
     then:
       properties:
         clocks:
-- 
2.33.0

