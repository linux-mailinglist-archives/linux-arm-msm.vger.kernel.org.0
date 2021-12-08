Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCB146D962
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 18:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237690AbhLHRS0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 12:18:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237682AbhLHRSZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 12:18:25 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139D3C0617A1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 09:14:53 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id z21so6894383lfu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 09:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Gomy4ei7qSbDbo9NwD3wFRtHE34eVnEHILbspr7bME=;
        b=GiqsfntNaSI82qioDW6hnyhFjU2z/SUV02rzfFzcleBRXBxUMikcAcJFBXER2lPphX
         hpBEYZ7hK5iBY7fYYy/i3V8SfPqpvRrcF2mT+YSRJhapPmqS9sD6hbI2ymtweqzyavGl
         vszyLNUCXuolhEDzCPT3qYx9wNxRRZ4TJTVqKGCgoW39G80U4VLGO8DG8IBEMv3Nb/gs
         Uh/SDY4c+B7KM0eS3r/sbWVlo25+NAM6HnRD65Ub2XteBisifxcPp6dBhwg//8ZxPGBD
         iy7qzxRFCNgWpfr0fUJwpArWrtgTGKHuQbrmr90V29ZaplojI8HdoEGPbKl56AumC9x7
         UR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Gomy4ei7qSbDbo9NwD3wFRtHE34eVnEHILbspr7bME=;
        b=JXEDj5vNtCFcli5laKZaZammP6J9S5/c4WPG40YbNYY8RpF3IEu1ukeWrOD85fIyku
         yigcAmARBYkDMb14WEL86sKCPeU/TUvdnkGHT9NaJemu1Pn1qt9m8HwzydmMGcm/DddX
         S5HPJGCnMVaxtGKjYnSucNUO4PnRC3rmWjRvAsghyQA+OOd0VC+sx9b1QNhGG67jGvxa
         8oCDDK7K6QgtKQrTZHCmP4WR64KfQ7qDWE845RtwG+juPzfKG9cH7t4je6NBbgE7TgPx
         C9QVohzAV9l9Ryb6DcaREjRXPNNbSLwWu9ZU+mjDG1+qqfoUX1Jc3QLQL9LaMwVLuxZu
         btsQ==
X-Gm-Message-State: AOAM532ackVLo+dbnsYSkl3jUY+rXrSXP5OZY4iqvJo1X0yzc1LC7a3i
        A9CTZPTSlySbK4T/CT0Cq5KH3A==
X-Google-Smtp-Source: ABdhPJyLmmHF1K32biMOFJNZVCgRuWge+W86qVR9zXqexHcmbBmvI04a7YqLiRvCokbc8UUgzqQsBQ==
X-Received: by 2002:a05:6512:3090:: with SMTP id z16mr701620lfd.335.1638983691372;
        Wed, 08 Dec 2021 09:14:51 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t9sm307213lfe.88.2021.12.08.09.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:14:49 -0800 (PST)
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
Subject: [PATCH v2 02/10] dt-bindings: phy: qcom,qmp: Add SM8450 PCIe PHY bindings
Date:   Wed,  8 Dec 2021 20:14:34 +0300
Message-Id: <20211208171442.1327689-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208171442.1327689-1-dmitry.baryshkov@linaro.org>
References: <20211208171442.1327689-1-dmitry.baryshkov@linaro.org>
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

