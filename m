Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDA2399357
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 21:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbhFBTQC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 15:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhFBTP7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 15:15:59 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 084DEC061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 12:14:15 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y15so2933202pfn.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 12:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J40pfNO1z/oZg+T4JrMxCJAgL+ophFd41F1h06L9GdE=;
        b=WEMdAm8+lkl9uEEDDxAZQtW7EiRrXcohh0GjVMtJhqXlryWGd/2uD/H1Ud0t8f1BqN
         B80plYSnkXr9bzGa/3yKeR83kHiEmCPXWwEg8WQjcaLexv0Ia6SRFZAps6GdK02EN7tA
         eT415vcx1oikWTSxWFIhJrFEy4bBVu5zw1QFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J40pfNO1z/oZg+T4JrMxCJAgL+ophFd41F1h06L9GdE=;
        b=ZEIdnNRQsH4G0twr/5hh6tiTwMyUmC06iJgMqn/voT19rA4WAXmSg5aT2/Mokjtb1W
         +mr0tpiB9WORlGSWdzbLtLem0GLbdQmcSRwSSAETYAK8yA6zMqo5VYquLGPfdZxROo1W
         UveWF0MEQckSEKq25nNbr6U/NA0AcE5HskvwKOcGNJgY40tdkz+FDF3P9hgA3M1hQnfn
         oDkfL7ZcHKsnjtf3dnHThvfrFmMYIKUHgg2rU69X7QpE6PKXB4BM8BIFT7gSueu9Gb9q
         x+fqUsXYtuRXKKbdFyASbW9SZlsGUTtC0ocw9dAoM0A/VMV/+BC+jIzBwVhNBfchg+oB
         wnhw==
X-Gm-Message-State: AOAM530cZpc/PD+LTiT7d/XJab0fUNHySMyMptrtyqccn+VlsM++7m5+
        r1iREYsaquPpAC92MuYeowPlpQ==
X-Google-Smtp-Source: ABdhPJw85jionUUV4LEHlkBdeM/AcGBIxLvtW7QA29CWiE/p98GDO++A3jVpKgnFy2yvc3XnX++Cbg==
X-Received: by 2002:aa7:8585:0:b029:2e9:a990:fd48 with SMTP id w5-20020aa785850000b02902e9a990fd48mr22641989pfn.16.1622661254559;
        Wed, 02 Jun 2021 12:14:14 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:3c25:f769:d7de:98bd])
        by smtp.gmail.com with ESMTPSA id z17sm329242pfq.218.2021.06.02.12.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:14:14 -0700 (PDT)
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
Subject: [PATCH v3 1/2] arm64: dts: qcom: sc7180: Move sdc pinconf to board specific DT files
Date:   Wed,  2 Jun 2021 12:13:39 -0700
Message-Id: <20210602121313.v3.1.Ia83c80aec3b9535f01441247b6c3fb6f80b0ec7f@changeid>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210602191338.1995827-1-sujitka@chromium.org>
References: <20210602191338.1995827-1-sujitka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move sdc1/sdc2 pinconf from SoC specific DT file to board specific DT
files

Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
---

(no changes since v1)

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
2.32.0.rc0.204.g9fa02ecfa5-goog

