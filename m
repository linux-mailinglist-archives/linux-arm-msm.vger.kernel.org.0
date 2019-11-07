Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9239F2308
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 01:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbfKGAJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 19:09:23 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46304 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbfKGAJX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 19:09:23 -0500
Received: by mail-pf1-f193.google.com with SMTP id 193so532148pfc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 16:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y30EZ6Y+jB8WvOWqfr0x14yaBZH+ZgcuIUz2TMHfKr8=;
        b=Ms/xeib/rHCGDzfSHmCcHkzNr0QrkmBmBM+PiHNWLQV65GiIWMFzPN+KQkBP+h0LHI
         PYKSRO4GlQmy8egZg9qN08T3L22xmPBWvG9IeddjnHmlJGaKSjMCk/1gpGIOIO6YKhvE
         0B8Misw8QMdogPgh94SDoAh7+lhyOzHgAkBy6/K81hUmAVz5mquyl4if22pR/7fmOGrF
         oVwSklV90APcYs0BJtt+8SOcVYKHhWcblQS0HvQl9PuyfZK9V2mk/I7sff4p0lhwvMru
         x6CrTnAsKOb41OXHqOXbdnSKjGfjqu3auMTq7cSalMDIVJVlsPdLFTuWWkU74kNtthdr
         LGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y30EZ6Y+jB8WvOWqfr0x14yaBZH+ZgcuIUz2TMHfKr8=;
        b=mZhfFn2kWPN9RT75e4B8BrFq24j4mxQvxJBJCKfzdI5SfVQdoysKfojaTq/+cl+R6T
         C6IjRt6y1sbYUh39F60ubnW9dgdAdqpGx4kQD6210Uyh7MVWYHZ/+LresZB4Jhg+sXiM
         bV6fT/WRTmh47qbaLqiLwcrLVatxPhExIXTI+BSbC/qu7kVOvluYEN8sE2/4eiCqgBuL
         ubddlxQGHTKwY2zQDJ+7Zq/oqi6tQs9yfSieSzD4DHU6ZB6pRKaFIQMDlIthsaRXC1yU
         t3Nc9kprJEE19ngu3k9vsDTWFpsydRewp7K6Ql7ZAEJ4PVhX0sX3BBZ5zQV85zTk43NU
         08KQ==
X-Gm-Message-State: APjAAAXtNhGRdky3Gih/kBxMo7lrR8iPe9FtWEfZnEaDuhKc1J/uvc7r
        fcYI0NdDNxFy+S4ucETOFqN2Iw==
X-Google-Smtp-Source: APXvYqzinLbWkmOtXo1/RShENTIftrXUZ1DoS+eTqL1HMg19AxARMlNrS8/KhtMbVMbblp3T4J/HXw==
X-Received: by 2002:a63:d70f:: with SMTP id d15mr764613pgg.424.1573085362094;
        Wed, 06 Nov 2019 16:09:22 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z23sm216549pgj.43.2019.11.06.16.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:09:21 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/5] dt-bindings: phy-qcom-qmp: Add SDM845 PCIe to binding
Date:   Wed,  6 Nov 2019 16:09:13 -0800
Message-Id: <20191107000917.1092409-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
References: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible and define necessary clocks and resets for the SDM845
GEN2 QMP PCIe phy and GEN3 QHP PCIe phy.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Picked up Rob's R-b

 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index eac9ad3cbbc8..a214ce6d0db2 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -12,6 +12,8 @@ Required properties:
 	       "qcom,msm8998-qmp-usb3-phy" for USB3 QMP V3 phy on msm8998,
 	       "qcom,msm8998-qmp-ufs-phy" for UFS QMP phy on msm8998,
 	       "qcom,msm8998-qmp-pcie-phy" for PCIe QMP phy on msm8998,
+	       "qcom,sdm845-qhp-pcie-phy" for QHP PCIe phy on sdm845,
+	       "qcom,sdm845-qmp-pcie-phy" for QMP PCIe phy on sdm845,
 	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
 	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
 	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845,
@@ -52,6 +54,10 @@ Required properties:
 			"ref", "ref_aux".
 		For "qcom,msm8998-qmp-pcie-phy" must contain:
 			"aux", "cfg_ahb", "ref".
+		For "qcom,sdm845-qhp-pcie-phy" must contain:
+			"aux", "cfg_ahb", "ref", "refgen".
+		For "qcom,sdm845-qmp-pcie-phy" must contain:
+			"aux", "cfg_ahb", "ref", "refgen".
 		For "qcom,sdm845-qmp-usb3-phy" must contain:
 			"aux", "cfg_ahb", "ref", "com_aux".
 		For "qcom,sdm845-qmp-usb3-uni-phy" must contain:
@@ -80,6 +86,10 @@ Required properties:
 			"ufsphy".
 		For "qcom,msm8998-qmp-pcie-phy" must contain:
 			"phy", "common".
+		For "qcom,sdm845-qhp-pcie-phy" must contain:
+			"phy".
+		For "qcom,sdm845-qmp-pcie-phy" must contain:
+			"phy".
 		For "qcom,sdm845-qmp-usb3-phy" must contain:
 			"phy", "common".
 		For "qcom,sdm845-qmp-usb3-uni-phy" must contain:
-- 
2.23.0

