Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1E2CC465B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 06:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfJBEQ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Oct 2019 00:16:59 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45229 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbfJBEQ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Oct 2019 00:16:59 -0400
Received: by mail-pg1-f194.google.com with SMTP id q7so11144223pgi.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 21:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=yB6EANp2Gq2nUYi0fb1/BMw/e2qObJRACvpr+KuVRDo=;
        b=H4UzvH8s1D6iyBib4zTgN4lMKIc7Ddl66kGBgRvUt2vZCz0fN3PgY5MeWjfW5WNtOv
         XBqf2xOjig9aRUTTluZryXiJBTonzxGvntVT6u/hSOnQGbDbh4h6x8w+/eJ6ip72tROs
         614tDITQjEweLmuhU79n/mvp75x6Xph8oSsP1HxnkBGg1CHM3tsvzx7RF7oqh+E2FkCj
         NBpgLewGFWwp1Hb4mZerIFkZz6DvyTUDJoigib5+rscmJgC0xKCSoWwkNQhSmmvSU3tD
         YvINPYlznif8X8fb7oxhzKpjnUeySO8ObwJSz41MU+1T1icieqSgzuebgLQRuAQSq1QB
         el5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yB6EANp2Gq2nUYi0fb1/BMw/e2qObJRACvpr+KuVRDo=;
        b=A2b4h6QqHtoO9KYlJ4l5Fw/mCKCp0D8BQhCRsnvGCikeVFpjkZCvOrU/vReXHwKfix
         meEI2n8epe775KhNyjJAYrznMqk7JdP1Z70AST8Ue9/g+Ucybh1DEgSngpsyyMpm044P
         wPWhO4P25ec9ZeOV4h/3WArwv7isXeuaLpKy/jEPyh7q1dG7jfdPxYq56BMB/3YMaUhU
         WQm+8grI2e+wepmBWNvCEKIdqP4IbB42oFb+w7xeek/33QuuJvXV1Wd2yHD880mqxeyY
         KsasNVXXcsLY1X96A6S8PBdLbvfpE7racNqOTIuBm3Tn+E4+XIHMvk8S8QlcxFS3K2kv
         JZvA==
X-Gm-Message-State: APjAAAV/WejOVkk4jwnCYjUHEazqR+/x/s+UjzmZw+OtbkgtRhzKvFNT
        7Niv+GodtdbOoxaPD12una8Z/A==
X-Google-Smtp-Source: APXvYqwBVvw6q508G5o3bf3yw4tBbE/PmtZBiLhL99mw7fwFWisBT9Caa+zDSh/1LGrKgk4EGRcVwg==
X-Received: by 2002:a62:d14c:: with SMTP id t12mr2223538pfl.185.1569989818127;
        Tue, 01 Oct 2019 21:16:58 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 37sm18013315pgv.32.2019.10.01.21.16.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 21:16:57 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: db845c: Enable LVS 1 and 2
Date:   Tue,  1 Oct 2019 21:16:54 -0700
Message-Id: <20191002041654.3620-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

vreg_lvs1a_1p8 and vreg_lvs2a_1p8 are both feeding pins in the low speed
connectors and should as such alway be on, so enable them.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c314b5d55796..6e97ae7f7a08 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -312,6 +312,18 @@
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
+
+		vreg_lvs1a_1p8: lvs1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		vreg_lvs2a_1p8: lvs2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
 	};
 
 	pmi8998-rpmh-regulators {
-- 
2.18.0

