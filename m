Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6DC52FDBF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355360AbiEUPVR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355394AbiEUPVH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:21:07 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBD1E0D7
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:21:05 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 27so7568540ljw.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o0db24Z75xgiNaK8stR7e/3GBiXrKYoix4PN4HjCWow=;
        b=qw1/hiTL0nYvxep71cj+EHA5GcGh1/X0mTM/ZQs/S9K0rjfZjDGHXefX87UTw6HYNe
         TP/IGXd0svQZ40rPtHJ02RDmWrCKWpjJGHgromAxwXjtbwWVAwy3aPZ+CWiwnCnorLah
         YPGLCO2jpk8UeWP19HxKo4l+f39pzC/K2t3/lGC459N+BxVl66caT9O29U6+SWIYbXjj
         6idk5IcmAU2q0LT3kO6zEzMZfXfe28SRBK2fWqJXo8Krz4qsPCftOfIS8/Ob9+aEKmnl
         wqO3+5tEFTFGQhUtAR60yf6XEVQ3n2HWWP401BREE350G03FSWEvtlWOKNnwEypA2xEs
         xrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o0db24Z75xgiNaK8stR7e/3GBiXrKYoix4PN4HjCWow=;
        b=Zm4kPD0PUUJV8Fe5EXYiD9fU5F2+bkPZ8vs8MmQFvaDPWLcYI2bUV5WLC67TAf+hJE
         4h7kd+9CrhqCU6YqL/qOhg6TLbhYsZXHhvItvzoOEqv1idZRluCadEYAq+TtG1J5467M
         p61/VKkDRhS5dLEd0ElQttr/0DkVE0tHMd+xHqXqth7PuSuVu+4lDYTZ6QNh45yznciN
         IdU9+OJvart3ZDoP8UM3DTikAt1XQri7tpxowEjbqRx6NcP5qd265lOmOUvDn/R/43mU
         pjoZJl5wcMe2CMDSIg3Jun+GUdwWociBf8gr9nbzs146PNCCJOMXTMRaPnHzt0hcmBtO
         +xPA==
X-Gm-Message-State: AOAM5300gRtlz+XcWUmhQ3E+u7SVwtk21xU6XYbkatoD5T2Lt4eVL7aG
        FjBPhqVfX/Ozy3kKi6tiMbp8cg==
X-Google-Smtp-Source: ABdhPJwjsR1wpmWIjZgbo03vb4WRedzC8BBCJ5bZeizDuaiMJz4c9FFnlBgJBNXTvnDBblRjZJdlbA==
X-Received: by 2002:a2e:9a86:0:b0:253:cbc9:a977 with SMTP id p6-20020a2e9a86000000b00253cbc9a977mr8145046lji.143.1653146463860;
        Sat, 21 May 2022 08:21:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id k8-20020a2e92c8000000b0024f3d1daeccsm739933ljh.84.2022.05.21.08.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:21:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v6 09/11] arm64: dts: qcom: sdm660: move SDHC2 card detect pinconf to board files
Date:   Sat, 21 May 2022 18:20:47 +0300
Message-Id: <20220521152049.1490220-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This results in dts duplication, but per mutual agreement card detect
pin configuration belongs to the board files. Move it from the SoC
dtsi to the board DT files.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi   | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm630.dtsi             | 12 ------------
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts     | 16 ++++++++++++++++
 3 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 00baacf28c63..ccde9951e4fb 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -549,6 +549,22 @@ vreg_l19a_3p3: l19 {
 	};
 };
 
+&sdc2_state_on {
+	sd-cd {
+		pins = "gpio54";
+		bias-pull-up;
+		drive-strength = <2>;
+	};
+};
+
+&sdc2_state_off {
+	sd-cd {
+		pins = "gpio54";
+		bias-disable;
+		drive-strength = <2>;
+	};
+};
+
 &sdhc_1 {
 	status = "okay";
 	supports-cqe;
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index bcda3a1dd249..e6de49e14840 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -983,12 +983,6 @@ data {
 					bias-pull-up;
 					drive-strength = <10>;
 				};
-
-				sd-cd {
-					pins = "gpio54";
-					bias-pull-up;
-					drive-strength = <2>;
-				};
 			};
 
 			sdc2_state_off: sdc2-off {
@@ -1009,12 +1003,6 @@ data {
 					bias-pull-up;
 					drive-strength = <2>;
 				};
-
-				sd-cd {
-					pins = "gpio54";
-					bias-disable;
-					drive-strength = <2>;
-				};
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 9280c1f0c334..2b1216502eb0 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -363,6 +363,22 @@ vreg_l19a_3p3: l19 {
 	};
 };
 
+&sdc2_state_on {
+	sd-cd {
+		pins = "gpio54";
+		bias-pull-up;
+		drive-strength = <2>;
+	};
+};
+
+&sdc2_state_off {
+	sd-cd {
+		pins = "gpio54";
+		bias-disable;
+		drive-strength = <2>;
+	};
+};
+
 &sdhc_1 {
 	status = "okay";
 	supports-cqe;
-- 
2.35.1

