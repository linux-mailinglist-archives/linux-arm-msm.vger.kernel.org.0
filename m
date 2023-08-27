Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6207F789D79
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 13:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjH0LvQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 07:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjH0Luz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 07:50:55 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA0ECD1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:45 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-500b3f7f336so1026491e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137044; x=1693741844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVZJg+f84R7PJyB3nirGOnHo9z3XpfKQ1Jd83cypp5Q=;
        b=NJQTBElmk3IK4FkIvFrV4rT9eYc/8Nq9i8SDIPDdGSYQoVp9WVJBR/LwRECek1gfEL
         jnSTv5hbAszFfK7LIgZ+dAWeLa8bnmbNVGBvEpibohXckdlaJlFX7zrLP3dPxrlVy1CZ
         b1K5y0Ty60EKc/yk8m7SkqKxATnhHFIyJvR79j2NG980yY7VT226j1Mx6QwptFd6ppeP
         ojdmmr9wrj34Tc4WR9gshSx8Jdmf+H7bjDrbG7aheiZuJPNpUXXvz+BwBKeMylPMNlf7
         V4Hw3Bda9NpFnUkj2wS+a6LzzX3Pm1tBpEM+W+KxPkUBY7vj/xDdBJ13n/Bs6eoa/SfB
         vQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137044; x=1693741844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVZJg+f84R7PJyB3nirGOnHo9z3XpfKQ1Jd83cypp5Q=;
        b=R4YOmCYQAb0YxXooODA+NMbiuL8WH7RGdMVsKT1qiMoFPft3f9reo7FpG/i/IHIJlU
         UJ2hxOdYMZ7LmxWwEpm20/qscXnrVvK0EyxE0xJpEtlyJJagVWJCfi6g1tV8F+9x2KCL
         EL8oH9r2xK4klNUOb7kQYTes0iQx7/h4Lny9wLaKx3NUrEy/FSdlz2zmjzXu2LW8FBw8
         v5O+J/pfx2citVgEKCwGXF+nSpXd0xou4yOb8K8qF9xmDXqghXbPk0lzCIbhKtcQ8THG
         bzvy6ESDtp+t9rOC1tSOpOIGgzKo0oDAi/fsLCOMnlM0ol6bs5An7+5EA/I1M72TfZjF
         +u+A==
X-Gm-Message-State: AOJu0YwuhhdANvdP83F3lip6BTBBtPVJ+yB1pno3P2ZaSb/ugCUp9sjs
        egfRXcNBVLy8fDQdcvRJAbbCwQ==
X-Google-Smtp-Source: AGHT+IFXwNmLKwO0eU+BnV6btdlQbqS9/6m3vHIjGJkMwbt3gumalz1+cSPtBK5eKpvAFd0Xbb39pg==
X-Received: by 2002:a05:6512:33c1:b0:4ff:a23b:de27 with SMTP id d1-20020a05651233c100b004ffa23bde27mr3461549lfg.50.1693137044233;
        Sun, 27 Aug 2023 04:50:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v4 11/23] ARM: dts: qcom: apq8064-ifc6410: constraint cpufreq regulators
Date:   Sun, 27 Aug 2023 14:50:21 +0300
Message-Id: <20230827115033.935089-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add additional constraints to the CPUfreq-related regulators, it is
better be safe than sorry there.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
index 3078afda37c6..062c9cf4ec77 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
@@ -227,8 +227,8 @@ pm8921_s1: s1 {
 		};
 
 		pm8921_s3: s3 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1400000>;
+			regulator-min-microvolt = <950000>;
+			regulator-max-microvolt = <1150000>;
 			qcom,switch-mode-frequency = <4800000>;
 		};
 
@@ -274,6 +274,12 @@ pm8921_l23: l23 {
 			bias-pull-down;
 		};
 
+		pm8921_l24: l24 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1150000>;
+			bias-pull-down;
+		};
+
 		pm8921_lvs1: lvs1 {
 			bias-pull-down;
 		};
@@ -282,6 +288,14 @@ pm8921_lvs6: lvs6 {
 			bias-pull-down;
 		};
 
+		/* HFPLL regulator */
+		pm8921_lvs7: lvs7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
 		pm8921_hdmi_switch: hdmi-switch {
 			bias-pull-down;
 		};
-- 
2.39.2

