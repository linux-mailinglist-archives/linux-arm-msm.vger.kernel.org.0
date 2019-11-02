Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7123ECC35
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2019 01:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfKBAQg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 20:16:36 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36638 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727846AbfKBAQg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 20:16:36 -0400
Received: by mail-pf1-f193.google.com with SMTP id v19so8099475pfm.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2019 17:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EapszYfvEB6K8sEWHaQ1iAc5AjFM/LVHBmLTFLDPXBw=;
        b=C9jBbmjCOtlmfd9Kji+BRlQgBHfp3vzq9SUqGTbVo8ETminht+TX42OJNIQHr273oq
         7Wmapp/R5ETNfS7XMR86KJgrCRmKWWA65yPP2TPMPxA0RROb4ore7RFMS4P2/K+GYHYx
         Bm+szuU7nUXJ/LZ7204/zZVwDIl+/1PZvpFXNdZ68PjcY7zSwx6HwzU06bZCYwPMWWkI
         PzM7JqzeiObqUVwlL2TLQmoKVY6GfPjsSLhT/eGSISgl3Z/eIivUFopMFk9lBD06/5KO
         wc8a6HZaGLTvs7E4GkHjyJJB3nIR3L9UY5pocIsab6FkO6hXMQ/eT+P1wQJIo33FIcDK
         /5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EapszYfvEB6K8sEWHaQ1iAc5AjFM/LVHBmLTFLDPXBw=;
        b=UAnr2hAeKL0ivIV7SqtC5LoD6fo2LbfwAIgg2lmcG3xWBiREZ/zmYoxjPJlNK/49Lk
         0aHL9O1CNTIFNHlD2lpNxR5Dj0NWLgaYzg48v1A+DpIXoy+pRjayiCt/TR8RaEXaQs0B
         /jii7geJY043q3I+IxfB/7mzcE8khqT7D1lPIIDeYZLnbHGEDmbXe10kiMz5beTbdctZ
         CMA+d7okOEbNxM+6VZjRGJv2jhPKVicQlUn5w4riDqMTCpuNuHyQ+mCAQo/rbHGyPxE6
         uy+LD6Moam9ebxk+p6lWhd7BV6pwlEaazPTsRlsz0vIkYMREtxtibMnvGOmlUf7Sxecu
         lYgg==
X-Gm-Message-State: APjAAAVVkgI1zhda/fhyM/nQYudtt9uBcOgQPqjsf0uO/N4eY7xzH5pX
        hHkG6ojTVDK7zfCObRV9xc7nwg==
X-Google-Smtp-Source: APXvYqzbPEa/n2QnB4bJ9zd7eFQ8wjUGVd076ss8w7Vdh3qpR/dLc+LIBS0tVhnjje0HjMP5Oggkog==
X-Received: by 2002:a63:1042:: with SMTP id 2mr16916553pgq.59.1572653793995;
        Fri, 01 Nov 2019 17:16:33 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j11sm7876250pgk.3.2019.11.01.17.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 17:16:33 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: phy-qcom-qmp: Add SDM845 PCIe to binding
Date:   Fri,  1 Nov 2019 17:16:24 -0700
Message-Id: <20191102001628.4090861-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102001628.4090861-1-bjorn.andersson@linaro.org>
References: <20191102001628.4090861-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible and define necessary clocks and resets for the SDM845
GEN2 QMP PCIe phy and GEN3 QHP PCIe phy.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Extracted from QMP patch
- Added QHP part

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

