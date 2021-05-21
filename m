Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625BF38CE98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 22:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbhEUUHd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 16:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbhEUUHb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 16:07:31 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129D6C0613ED
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:06:08 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id v12so11550937plo.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wf4wk2hYKZvYoiak2ddgb48a4NAmsAjej7Py46r9Ndw=;
        b=SWFLUKUDqsL879uRmUAJcZGM4rX9s/upJwg7OtUTR++1RtrJoh2Rtytxd/Mza3BOVF
         M9fcW4v0D9NMuJ5dv4QlMzEz39J0iOWToEvQy+rB3s4Mvay85v1SO3jwm34TJPiGtbvo
         YgoaYQEfHgCLp5mzNV8RI5kp51POiRo+nwmT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wf4wk2hYKZvYoiak2ddgb48a4NAmsAjej7Py46r9Ndw=;
        b=U4BfFe1X52mdj6+7dMron1hHbXvm71jlAUmecS0KK6Edqy6LYOE/XzcHL0AOWcnkST
         G5sGwDZhLeVWddf6vDZ7RDaby3FCTSSCxlknV6fwJCgnrovCjpTnsIxn/sBotwk9uUZ/
         VMCk9WVub9O/q9rR+JvIW5VDG0wxmNTlDuS7bvN8PC5Qs5Avdukpa7ZES2u3JXrPsy1n
         HbMNJLp/f5Elwyvu1t1XUVw2RpgtgSpqZhKuynVBGZhnUlJsJiMzYMGvbD1fMhyFEdMf
         v86n0CCOsVekbaNmjZDC/O9ITU4MOFl/rxnkKbgvizWVINQ9NjWvVpO8YvG5WrgQt3yW
         2BWw==
X-Gm-Message-State: AOAM530WsCnJ7IbRRC6kiVdslAxv/jctUvzHiiKxayYepfMywge+Zlz8
        bmEPJXf2cJ0JtxGxn+cW5L5GvA==
X-Google-Smtp-Source: ABdhPJzqAo86oQgd0Ds5xJnUcYsOwQOzn37NNIOsZ2bZoQwT+p5lCuJQmmUvtj9qFmenGAYW385AoA==
X-Received: by 2002:a17:902:7407:b029:f0:dace:a5a9 with SMTP id g7-20020a1709027407b02900f0dacea5a9mr13595274pll.34.1621627567547;
        Fri, 21 May 2021 13:06:07 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:22bd:8c3f:584d:d265])
        by smtp.gmail.com with ESMTPSA id z19sm4550614pjn.0.2021.05.21.13.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 13:06:06 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: qcom: sc7180: Move sdc pinconf to board specific DT files
Date:   Fri, 21 May 2021 13:05:28 -0700
Message-Id: <20210521130511.v1.1.Ia83c80aec3b9535f01441247b6c3fb6f80b0ec7f@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210521200529.1991729-1-sujitka@chromium.org>
References: <20210521200529.1991729-1-sujitka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move sdc1/sdc2 pinconf from SoC specific DT file to board specific DT
files

Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 102 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 102 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi         | 102 -------------------
 3 files changed, 204 insertions(+), 102 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index e77a7926034a7..07133e0af581a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -598,4 +598,106 @@ pinconf-rx {
 			bias-pull-up;
 		};
 	};
+
+	sdc1_on: sdc1-on {
+		pinconf-clk {
+			pins = "sdc1_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		pinconf-cmd {
+			pins = "sdc1_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		pinconf-data {
+			pins = "sdc1_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		pinconf-rclk {
+			pins = "sdc1_rclk";
+			bias-pull-down;
+		};
+	};
+
+	sdc1_off: sdc1-off {
+		pinconf-clk {
+			pins = "sdc1_clk";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		pinconf-cmd {
+			pins = "sdc1_cmd";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		pinconf-data {
+			pins = "sdc1_data";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		pinconf-rclk {
+			pins = "sdc1_rclk";
+			bias-pull-down;
+		};
+	};
+
+	sdc2_on: sdc2-on {
+		pinconf-clk {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		pinconf-cmd {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		pinconf-data {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		pinconf-sd-cd {
+			pins = "gpio69";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+
+	sdc2_off: sdc2-off {
+		pinconf-clk {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		pinconf-cmd {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		pinconf-data {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		pinconf-sd-cd {
+			pins = "gpio69";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 609f0ceafd095..d128a0ed6ad3a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -1540,4 +1540,106 @@ pinconf {
 			drive-strength = <2>;
 		};
 	};
+
+	sdc1_on: sdc1-on {
+		pinconf-clk {
+			pins = "sdc1_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		pinconf-cmd {
+			pins = "sdc1_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		pinconf-data {
+			pins = "sdc1_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		pinconf-rclk {
+			pins = "sdc1_rclk";
+			bias-pull-down;
+		};
+	};
+
+	sdc1_off: sdc1-off {
+		pinconf-clk {
+			pins = "sdc1_clk";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		pinconf-cmd {
+			pins = "sdc1_cmd";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		pinconf-data {
+			pins = "sdc1_data";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		pinconf-rclk {
+			pins = "sdc1_rclk";
+			bias-pull-down;
+		};
+	};
+
+	sdc2_on: sdc2-on {
+		pinconf-clk {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		pinconf-cmd {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		pinconf-data {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		pinconf-sd-cd {
+			pins = "gpio69";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+
+	sdc2_off: sdc2-off {
+		pinconf-clk {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		pinconf-cmd {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		pinconf-data {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		pinconf-sd-cd {
+			pins = "gpio69";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 1fc328ba0403e..0630a9c410b58 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1872,108 +1872,6 @@ pinmux {
 					function = "lpass_ext";
 				};
 			};
-
-			sdc1_on: sdc1-on {
-				pinconf-clk {
-					pins = "sdc1_clk";
-					bias-disable;
-					drive-strength = <16>;
-				};
-
-				pinconf-cmd {
-					pins = "sdc1_cmd";
-					bias-pull-up;
-					drive-strength = <10>;
-				};
-
-				pinconf-data {
-					pins = "sdc1_data";
-					bias-pull-up;
-					drive-strength = <10>;
-				};
-
-				pinconf-rclk {
-					pins = "sdc1_rclk";
-					bias-pull-down;
-				};
-			};
-
-			sdc1_off: sdc1-off {
-				pinconf-clk {
-					pins = "sdc1_clk";
-					bias-disable;
-					drive-strength = <2>;
-				};
-
-				pinconf-cmd {
-					pins = "sdc1_cmd";
-					bias-pull-up;
-					drive-strength = <2>;
-				};
-
-				pinconf-data {
-					pins = "sdc1_data";
-					bias-pull-up;
-					drive-strength = <2>;
-				};
-
-				pinconf-rclk {
-					pins = "sdc1_rclk";
-					bias-pull-down;
-				};
-			};
-
-			sdc2_on: sdc2-on {
-				pinconf-clk {
-					pins = "sdc2_clk";
-					bias-disable;
-					drive-strength = <16>;
-				};
-
-				pinconf-cmd {
-					pins = "sdc2_cmd";
-					bias-pull-up;
-					drive-strength = <10>;
-				};
-
-				pinconf-data {
-					pins = "sdc2_data";
-					bias-pull-up;
-					drive-strength = <10>;
-				};
-
-				pinconf-sd-cd {
-					pins = "gpio69";
-					bias-pull-up;
-					drive-strength = <2>;
-				};
-			};
-
-			sdc2_off: sdc2-off {
-				pinconf-clk {
-					pins = "sdc2_clk";
-					bias-disable;
-					drive-strength = <2>;
-				};
-
-				pinconf-cmd {
-					pins = "sdc2_cmd";
-					bias-pull-up;
-					drive-strength = <2>;
-				};
-
-				pinconf-data {
-					pins = "sdc2_data";
-					bias-pull-up;
-					drive-strength = <2>;
-				};
-
-				pinconf-sd-cd {
-					pins = "gpio69";
-					bias-disable;
-					drive-strength = <2>;
-				};
-			};
 		};
 
 		remoteproc_mpss: remoteproc@4080000 {
-- 
2.31.1.818.g46aad6cb9e-goog

