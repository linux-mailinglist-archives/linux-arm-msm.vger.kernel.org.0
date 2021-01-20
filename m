Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7257A2FDDFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 01:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731833AbhAUAcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 19:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404160AbhATXZw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 18:25:52 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B2DC061386
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:50:29 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id a109so25056158otc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vc7WFCAWQd7lGBvjvH/5e8iw6nJRl7Fhz61duy/6iFg=;
        b=u/1tJKMNtHK98EFuEZpTHLK+W1csEfoTc92KipCGW7mazkJJQt3U61PItRCVAS8XKD
         G+BDGVE92bFOQO9fW+hCMxOU8zMB44QekYabBps0qLMDHDnI99Vl435M51AawtE4hhBo
         zNhOXEhEZic7qlS1o0X1ov20FhuCkwVvDq2kOJvUwPGEsMpLT0qXhbUBXfvxDWX8KARw
         DScCVyzoh2v8uimhXaqQPlatsu6i4aeXUzQdw+v6GIvbGlD22RrQYazyLtUrMFTVeRJw
         7reRpOAN9YWq5Y8Sg9em4UBrvKlfgP8IDb7jXOVy77SLucv1/6QfH5uxfgYyKOb1XPl3
         lpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vc7WFCAWQd7lGBvjvH/5e8iw6nJRl7Fhz61duy/6iFg=;
        b=Ox8NvTNty43eJ6xq/IK3X7nVXQGvQ8aGEVOtGnTL0t7fbj2aE0jhVODrg9nK3NqI1P
         XnGbqlm/EnJ1OB7PbDtjN9OssqRtkBBdALCe76p3pdp7OqE6N+bwUGbP8RMhnJ5+tuvy
         7cMXduJNrTq3ji/QTl82aMJryXREjLCg+sgG/3rsykLpgwswOALYZBwGr6a4pypGBQUR
         258lFOVbbKCJNIPZ/Lpf1lBum3JaG1t3RHmb7k0fKq/w7iQIaAwgzlw6BlUHz/HZiHfo
         K47X9Un8C5GsW0cd+DkHoVuoMdbd8ZJLWpSBiTzo1eJ7Zx8i/mc6u0HqUpY6tF+OosYt
         oCvw==
X-Gm-Message-State: AOAM531JhWjKbpFXxv4CFAqhaRkWvWUjvtuTOnlwJluz+rta1ShH/+MO
        RwTBzaX2vSS5VGfSMesiDAqskw==
X-Google-Smtp-Source: ABdhPJzEkbbKp7kG9e04NFVhjy2sAAt6Kpbsjhwi/k9ObpNujk5WxyEW16BW5wy01w1BwOb9eKjQTA==
X-Received: by 2002:a9d:2046:: with SMTP id n64mr8646527ota.38.1611183029398;
        Wed, 20 Jan 2021 14:50:29 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r133sm677632oia.17.2021.01.20.14.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 14:50:28 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: power: rpmpd: Add SC8180X to rpmpd binding
Date:   Wed, 20 Jan 2021 14:50:36 -0800
Message-Id: <20210120225037.1611353-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible and constants for the power domains exposed by the RPMH
in the Qualcomm SC8180X platform.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml       |  1 +
 include/dt-bindings/power/qcom-rpmpd.h              | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 64825128ee97..bdf454712b10 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -24,6 +24,7 @@ properties:
       - qcom,qcs404-rpmpd
       - qcom,sdm660-rpmpd
       - qcom,sc7180-rpmhpd
+      - qcom,sc8180x-rpmhpd
       - qcom,sdm845-rpmhpd
       - qcom,sdx55-rpmhpd
       - qcom,sm8150-rpmhpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 7714487ac76b..5f07dc16f863 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -55,6 +55,19 @@
 #define SC7180_LCX	6
 #define SC7180_MSS	7
 
+/* SC8180X Power Domain Indexes */
+#define SC8180X_CX	0
+#define SC8180X_CX_AO	1
+#define SC8180X_EBI	2
+#define SC8180X_GFX	3
+#define SC8180X_LCX	4
+#define SC8180X_LMX	5
+#define SC8180X_MMCX	6
+#define SC8180X_MMCX_AO	7
+#define SC8180X_MSS	8
+#define SC8180X_MX	9
+#define SC8180X_MX_AO	10
+
 /* SDM845 Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION	16
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
-- 
2.29.2

