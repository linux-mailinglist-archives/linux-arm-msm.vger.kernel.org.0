Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E34429174E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Oct 2020 14:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgJRM00 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Oct 2020 08:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgJRM00 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Oct 2020 08:26:26 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA95C061755;
        Sun, 18 Oct 2020 05:26:26 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id b127so9994599wmb.3;
        Sun, 18 Oct 2020 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t1weUtNO96dKRYI1qRIuX5UtXeM+HTLPsujZT7Xa7/8=;
        b=J34eS6XGO0akDnelvkfungKI6IkF1hKyMmZan7/+qUOEb8FH1vZOlrcb8J79zEpy7A
         AgF3GsCGzNoVyDURN8pnEo5KeI1ey9zk+vw14vcOHdDgI04uJ7vSbBZ+nf113v5KPGkA
         ecPPXxvHn3Xcojz+IP9vUWlCluy0ZBDSJUsuml1BTpHqyXuZWQuwdaWoDjQwtAPPT6Ro
         23wfGPbjKDHphsfgNr+xBvZfHO5hYLq2WIX/tGAZ1MFlIXEdGCb4JidfDccb3vfwMCi3
         L/bL0qgLuKn5spigzjskMLk3bledQtykrqGy+bGu4CjQ62fMoILT/gr9LSaJ5N+MhIMz
         pD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t1weUtNO96dKRYI1qRIuX5UtXeM+HTLPsujZT7Xa7/8=;
        b=uZdz6GHbBTWbnAQkhWjgPgRad/fnE2/iQE70H/FqItaY/owSeUKS08bpLT4mcg3R0V
         /lJKa5hYIUdqTn05YCoDgIThN6L4tvESeRxyHpR1m+befmx/zAmxCQ6vu2M38WG/Kk+W
         iQCvYXM5ZKUqVEa6lc3xuj0BU6y9klcjMu0uhLYptOlShx5pBq1Y2zvOaEv1vPKPwrkT
         kTMEHnGNTTCu+vxNw3ObhWVO9GP+FY7HajS9lXOqGzxy7zDPLJi8l36kGzulRcl1ZHED
         q4s5cyjC10xT+QRLHjJA49UrOSgsNN7LcltpaCr0lVpcXC1m8+EHQ+j9qg6RvyOIN2nu
         QCiA==
X-Gm-Message-State: AOAM530IbN9rPytj7Xb2a3VOK8zihuvzvS49cxFVfqLMWqiztd3bf2Nv
        SKrCF75EfDw63mdOZsXQQOA=
X-Google-Smtp-Source: ABdhPJwBw/m+riHlVkJZa1sTgXszJEXQDAniU85jnTt4ZvQCc9CQqO6e3/f4MTK+xjb0jH0a6HflPg==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr13209534wmj.80.1603023984609;
        Sun, 18 Oct 2020 05:26:24 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id 14sm11744400wmf.27.2020.10.18.05.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:26:24 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: power: rpmpd: Add SDM660 power-domains bindings
Date:   Sun, 18 Oct 2020 14:26:20 +0200
Message-Id: <20201018122620.9735-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018122620.9735-1-kholk11@gmail.com>
References: <20201018122620.9735-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

Add the new bindings for SDM660 rpmpd power domains.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml        |  1 +
 include/dt-bindings/power/qcom-rpmpd.h               | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8058955fb3b9..45ec2439ff51 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,msm8996-rpmpd
       - qcom,msm8998-rpmpd
       - qcom,qcs404-rpmpd
+      - qcom,sdm660-rpmpd
       - qcom,sc7180-rpmhpd
       - qcom,sdm845-rpmhpd
       - qcom,sm8150-rpmhpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 5e61eaf73bdd..2a39dc40483d 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -102,6 +102,18 @@
 #define QCS404_LPIMX		5
 #define QCS404_LPIMX_VFL	6
 
+/* SDM660 Power Domains */
+#define SDM660_VDDCX		0
+#define SDM660_VDDCX_AO		1
+#define SDM660_VDDCX_VFL	2
+#define SDM660_VDDMX		3
+#define SDM660_VDDMX_AO		4
+#define SDM660_VDDMX_VFL	5
+#define SDM660_SSCCX		6
+#define SDM660_SSCCX_VFL	7
+#define SDM660_SSCMX		8
+#define SDM660_SSCMX_VFL	9
+
 /* RPM SMD Power Domain performance levels */
 #define RPM_SMD_LEVEL_RETENTION       16
 #define RPM_SMD_LEVEL_RETENTION_PLUS  32
-- 
2.28.0

