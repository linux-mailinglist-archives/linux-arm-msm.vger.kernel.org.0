Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD950448073
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 14:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240080AbhKHNrr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 08:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240073AbhKHNrp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 08:47:45 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5591AC061764
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Nov 2021 05:45:01 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id t5-20020a17090a4e4500b001a0a284fcc2so8836949pjl.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Nov 2021 05:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4UOv0Q9v/U5JIJTiKm8SH11m1yqDdnBMvjTxmZVLkw4=;
        b=ylHyHX+UGT5QsNVlzYmEnT7hIPcEeUVCV2qQBNbqyyvOJ/gEGeztQ/qNlhubkEBV1g
         HlF+FDI+WsumTjwtFNj6+0/ahYTechXYI0sTWXIOjy2B4cBRc2MU9wZgpOxHFiG5fp/7
         YOkaAeXRFBUjVoYVANNXKudsg2MXUUGZAZ6JILRianhXhCTBJ2OtjXrs3VEb1CE9XR0p
         vK4K/vS6g7/2f20lgn7JMbSFZRtwipGLQqbCrB+NOqKwNdzRcUChFN3xuDpCK0vU4aYi
         anJQaAzTm29UCS/tnM3a/5YRbfOi4YPUW4sAysImqfsKkXxv7CN/CMHp72AwxrwbBxCO
         VCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4UOv0Q9v/U5JIJTiKm8SH11m1yqDdnBMvjTxmZVLkw4=;
        b=SIYx+ydGNIxYtLuhWtjhh2voClQj2N0Km+aJNLOegV3GX+FSGd42K+lfFQRTQMSeCa
         TxeLqmtcG7xb1zmGzmmSc7XzL0xjn9Q5ehWlpAQ5uGjTlHjYVbzNGt+IHg8blL7vEoUu
         pOLGZEueZPJiNrTKSE/oBGjHwt5p4Ywzd9RrFaS6n55Tvk11j0dne+F+7I2kqy9tlnro
         9OmBkc4BdGUQFA1PL00b3Td8y6AJvEsfukIqxRdOhmjxIae3q/trqcXhzhsFVY+MBhAg
         21LRdm1eU42rQdqvwU1qIe9ivwfSkl0m2nGGZcHklYth+TVhFtLIzD3Ghu2VuNadNC/E
         iuXA==
X-Gm-Message-State: AOAM530T/O8D2DHoxzr9osMHD+B5KZuWE9Z2RTG66+FLVbdq7ipMt8HS
        lJlds9evzXvAeb781rhmYJdHow==
X-Google-Smtp-Source: ABdhPJzS2GYQkG5XZPpFKujvNeCeo3QPrZplZEKknzw4IS0aNed8TR75djH/ucDFk2HovG0q1OwxiA==
X-Received: by 2002:a17:90a:4a06:: with SMTP id e6mr52879333pjh.228.1636379100914;
        Mon, 08 Nov 2021 05:45:00 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id m184sm3693974pga.61.2021.11.08.05.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 05:45:00 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/3] dt-bindings: power: rpmpd: Add QCM2290 support
Date:   Mon,  8 Nov 2021 21:44:41 +0800
Message-Id: <20211108134442.30051-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108134442.30051-1-shawn.guo@linaro.org>
References: <20211108134442.30051-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible and constants for the power domains exposed by the
QCM2290 RPM.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml          |  1 +
 include/dt-bindings/power/qcom-rpmpd.h                 | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index e810480e3eb7..a6d51d51d2c7 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -24,6 +24,7 @@ properties:
       - qcom,msm8994-rpmpd
       - qcom,msm8996-rpmpd
       - qcom,msm8998-rpmpd
+      - qcom,qcm2290-rpmpd
       - qcom,qcs404-rpmpd
       - qcom,sdm660-rpmpd
       - qcom,sc7180-rpmhpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 960f7976a807..340b0ffe5eb8 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -219,6 +219,16 @@
 #define SM6115_VDD_LPI_CX	6
 #define SM6115_VDD_LPI_MX	7
 
+/* QCM2290 Power Domains */
+#define QCM2290_VDDCX		0
+#define QCM2290_VDDCX_AO	1
+#define QCM2290_VDDCX_VFL	2
+#define QCM2290_VDDMX		3
+#define QCM2290_VDDMX_AO	4
+#define QCM2290_VDDMX_VFL	5
+#define QCM2290_VDD_LPI_CX	6
+#define QCM2290_VDD_LPI_MX	7
+
 /* RPM SMD Power Domain performance levels */
 #define RPM_SMD_LEVEL_RETENTION       16
 #define RPM_SMD_LEVEL_RETENTION_PLUS  32
-- 
2.17.1

