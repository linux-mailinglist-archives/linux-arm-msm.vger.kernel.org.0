Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C35811CB91C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 22:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgEHUmo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 16:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727820AbgEHUmo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 16:42:44 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25405C05BD43
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 13:42:44 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a5so4828361pjh.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 13:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v/kJOzHQVNztoa88Zqa893txGdJr3NbK0Uy6cZ9N+p4=;
        b=DpwtSGfUSL9CaKsXqVEz6+TLkdcWRpU57TbJQD2eIMJuVeMUFx37rOlwnIXKjG0zg1
         +T9J0pJVRIGiPFPXLEG2zpm4A7vsYF252Wlid8+YjZBVRvYfbOs2dz7Qpb/m5iRtWtlK
         VvZG3TgTNpJq7gSlWQlFU0fi8IsfhcBGaKSY0ikVodZYDbeUbOJinlO3Y+N2eR4u2ISv
         +SlnwR1RvQ+7JDhuoTMdWxwG2DJuiimRfvT8+B8F2ZnkmQKYNDLRpSXcAAWBJ5R5EMd5
         z/M2wfmFJT4uyoxKQwU6JiCkKwCF0XQPOUaRuzoK+hO9E2951WDCcYkuMAbpCZrpyWQW
         devQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v/kJOzHQVNztoa88Zqa893txGdJr3NbK0Uy6cZ9N+p4=;
        b=XPTHafncL3KRIm1AfIsmBdZ0/aHr5BPC7nhajY3qFb/5X9sd6gFMk4R71VTMvjZFFe
         z9FUJali2D7HhBWSnAhgLqRINx0/Jv5EPVaCj9vGTl0g8PuL7GAGqnGe73xdo1f+3Aiv
         bp/BfRkJpw13bmuF6HWneKNy2I6c5i0YAajh5WkrqzORTtHlWCXCpaZvqORa/9uuc1JN
         1KzmFG0EekzGGIM6EA1wXvx6z4W81azo4WIPjgOWMh+pb5Ba+NOVGXZFPjSHyEQV3H8s
         I/QmO4fLos7S1peMBugDNHohtm2rW7SIwT5io0tpWD1LNk/xejhwF+meMUx7hMV0hiDg
         VLSQ==
X-Gm-Message-State: AGi0Pub+VFSJMA1V5vr0e8CE+LUz7cQPKKqCuDcgxqRa3OIci1Mxg2cz
        O7DfMO9fWBLYizoWgsEggGKR7w==
X-Google-Smtp-Source: APiQypJAb3f+QC64YiN7o7OeDguzr0+81s7Vq9M944QMiAehMTcBe6OBqfD9/1Clsaudgtub5c7lTA==
X-Received: by 2002:a17:90b:8c8:: with SMTP id ds8mr7896979pjb.164.1588970563609;
        Fri, 08 May 2020 13:42:43 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id h191sm2670720pfe.44.2020.05.08.13.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 13:42:43 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [v2 1/4] dt-bindings: regulator: Add labibb regulator
Date:   Sat,  9 May 2020 02:11:57 +0530
Message-Id: <20200508204200.13481-2-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200508204200.13481-1-sumit.semwal@linaro.org>
References: <20200508204200.13481-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nisha Kumari <nishakumari@codeaurora.org>

Adding the devicetree binding for labibb regulator.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>

--
v2: updated for better compatible string and names.
---
 .../regulator/qcom-labibb-regulator.txt       | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
new file mode 100644
index 000000000000..6e639d69f780
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
@@ -0,0 +1,47 @@
+Qualcomm's LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost) Regulator
+
+LAB can be used as a positive boost power supply and IBB can be used as a negative
+boost power supply for display panels. Currently implemented for pmi8998.
+
+Main node required properties:
+
+- compatible:			Must be:
+				"qcom,pmi8998-lab-ibb"
+- #address-cells:		Must be 1
+- #size-cells:			Must be 0
+
+LAB subnode required properties:
+
+- interrupts:			Specify the interrupts as per the interrupt
+				encoding.
+- interrupt-names:		Interrupt names to match up 1-to-1 with
+				the interrupts specified in 'interrupts'
+				property.
+
+IBB subnode required properties:
+
+- interrupts:			Specify the interrupts as per the interrupt
+				encoding.
+- interrupt-names:		Interrupt names to match up 1-to-1 with
+				the interrupts specified in 'interrupts'
+				property.
+
+Example:
+	pmi8998_lsid1: pmic@3 {
+		labibb {
+			compatible = "qcom,pmi8998-lab-ibb";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lab: lab {
+				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "lab-sc-err";
+			};
+
+			ibb: ibb {
+				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "ibb-sc-err";
+			};
+
+		};
+	};
-- 
2.26.2

