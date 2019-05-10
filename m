Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98D331979B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 06:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727157AbfEJEee (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 00:34:34 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36505 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727100AbfEJEee (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 00:34:34 -0400
Received: by mail-pf1-f196.google.com with SMTP id v80so2512882pfa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2019 21:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iX3tMXHfmXAFXgezY0ndg+xouFZG1EouvpxfWVnQyEI=;
        b=wPfwc2D5OF/jIrQh6ZiDhbghVvEWi/KSKgRlbqnjQdVSy1tBYJ/ow053Yrs0CJfGRH
         0LybhQkgMUqXokj+6NjwjduqZqgutOyy0QX9GcL8zyspz4T+Bt9pGDhSF57RQaNGLY+M
         cVLmvrlpp7Qz1hO6bALHejmw8tpzUXStqxX3W1Iip0hFVhB4z1p/1FS0J4Cy+nTbGJtP
         lfaDV6tyBANfmTO3J8s0WwMFJEI3NfTxbXYbcKnwoJORsYhUVtHglzjpo6wJDiaxm/g6
         Ajqb+Thj3C1/9Mn4zOaHND+I0qL1LYR3KXR5tkXTclDP4XRG/JML+XFhOFPhBrCsdjtw
         Duow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iX3tMXHfmXAFXgezY0ndg+xouFZG1EouvpxfWVnQyEI=;
        b=Y0z+fEk8IELlBMW5Q1yMcTEh5v/v0uAua8Ba2rRJ3LRvGqueL0RG08/ymkISz0unty
         4XnWOUvrmY49rhdiKq2XQ+XJbBer7fNpzewkfOGeJu0H3dvdfb1jncYPQgwZCPqzV4C1
         O2tJPVUSaphA3PDnZ8UWJpYqO0Ddvn8h8z6Gv0H+vfasaoE6C5VPnRZML9COVPJFE1t/
         x/9Ug7SrKMtGpDUVsVI/Ibl3KgefQ6r85/GJ237jBNzHH8aBXEuTTRvunW8oCunh4fju
         bZRZpc+zvlPCR2DUC8nIN0EvrWSz2DvyCWzoCUWtsfJ7PhHpizRwckgi5qQVpslFHEMN
         mdFg==
X-Gm-Message-State: APjAAAWKiWXoD5OtsDBRKptBz1bLDUI3OzplfCbKgVWN+2T1vew2aa/G
        X528xRxCEdFCA/lrIPLqxjnmqA==
X-Google-Smtp-Source: APXvYqz+VCrGwz0F1OeNQEiRJZyZwGUfV3b04q0MFLWKiNqRgZb4ye/bbEOX7ZRjTy+HIpkkBqHGmw==
X-Received: by 2002:a63:ed03:: with SMTP id d3mr11006230pgi.7.1557462873882;
        Thu, 09 May 2019 21:34:33 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s17sm4785317pfm.149.2019.05.09.21.34.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 21:34:33 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] arm64: dts: qcom: qcs404: Add fastrpc nodes
Date:   Thu,  9 May 2019 21:34:21 -0700
Message-Id: <20190510043421.31393-9-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190510043421.31393-1-bjorn.andersson@linaro.org>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Thierry Escande <thierry.escande@linaro.org>

The ADSP fastrpc provides 3 context banks and are assigned to IOMMU
context banks 23, 24 and 25; using SIDs 0x804, 0x805 and 0x806.  The
CDSP fastrpc provides 5 context banks and are assigned to IOMMU context
banks 5, 6, 7, 8 and 9; using SIDs 0x1001 through 0x1005. Add these to
their respective remoteproc.

The lower 4 bits of the SID is used to identify the context bank when
communicating with the fastrpc firmware, so this gives the reg values.

Signed-off-by: Thierry Escande <thierry.escande@linaro.org>
[bjorn: Added SMMU linkage and extend commit message]
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 66 ++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index fcde4f0334c2..858a53160564 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -243,6 +243,45 @@
 				mboxes = <&apcs_glb 12>;
 
 				label = "cdsp";
+
+				fastrpc_cdsp: fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_iommu 5>;
+					};
+
+					cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_iommu 6>;
+					};
+
+					cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_iommu 7>;
+					};
+
+					cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_iommu 8>;
+					};
+
+					cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_iommu 9>;
+					};
+				};
 			};
 		};
 
@@ -928,6 +967,33 @@
 				mboxes = <&apcs_glb 8>;
 
 				label = "adsp";
+
+				fastrpc_adsp: fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_iommu 23>;
+					};
+
+					cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_iommu 24>;
+					};
+
+					cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_iommu 25>;
+					};
+				};
 			};
 		};
 	};
-- 
2.18.0

