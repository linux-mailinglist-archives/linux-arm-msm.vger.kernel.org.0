Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809F9325964
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 23:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233720AbhBYWPs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 17:15:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234375AbhBYWO6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 17:14:58 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5EC5C061794
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:40 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id t5so5690948pjd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BUl3aZ3O4LXFi8NN7830ax+M9BVmxwxmci3H0NHFBWA=;
        b=ShrzWoNxvJcEJoJCJALthG8BjrCcyXMB0sfwa6zFSIkBeOW6Hq9lKmBTcB+F8zBrvC
         rZ357K04oiT0xlSepXW8xul3DoaRC2KSso0u+uHbAdT7sZSDzHnD/XgqzT3Nyn10LiaN
         xZrtu+fGm3pOYHtJe5vbUI8wkSBPNdORq9gyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BUl3aZ3O4LXFi8NN7830ax+M9BVmxwxmci3H0NHFBWA=;
        b=YP3EqOXncgekJsK6F2+RDMAwGfUIkOlb/U93UvMZwJ9+JfFibWZ5EB5/6/OaLie9Rj
         q7XIIZsmCTR7fPUJnHTIkto2PDO17ckbmMSvbLny3pdQQfiSc5Oo8zytpdJJ1xiGki4U
         suwQtO1RhS5dMAzM5SRRGuXPoraBnD9XUQwhDAG6sC/MjW1G5BHTBtZcrD6KWLrwJ8E3
         qZZKSv1SLJF8sl/xENPDKpNbgATFMHLfEFbRQ9Uzo6Du0LmOYM+d+Aiy0R73LWuDatx7
         pDO+yVdov+wBns+1CxhcJblqQDuTunTlyDiu+AvVGTGE5iuoTtUzRJjjswodPhsgC+2/
         xqpg==
X-Gm-Message-State: AOAM531GxQ8KOZ9C/tN10hoOma+z4BeGAVbJwroLahNfHipj0HQwi6hx
        YkU6pSEW33DWaRkCQgnlY0u+jg==
X-Google-Smtp-Source: ABdhPJzRZhB6hLfPocxitIiG9SZg5ond610o1Oh17YW/TWxwLUlDLBl0L5MUo0EJO49/RXbesVskMg==
X-Received: by 2002:a17:90a:5505:: with SMTP id b5mr46917pji.194.1614291220352;
        Thu, 25 Feb 2021 14:13:40 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:8414:45a5:94c4:d35d])
        by smtp.gmail.com with ESMTPSA id jt21sm6713301pjb.51.2021.02.25.14.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 14:13:39 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/13] arm64: dts: qcom: Move sc7180 MI2S config to board files and make pulldown
Date:   Thu, 25 Feb 2021 14:12:59 -0800
Message-Id: <20210225141022.2.Id27e7e6f90c29bf623fa4880e18a14ba1dffd2d2@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210225221310.1939599-1-dianders@chromium.org>
References: <20210225221310.1939599-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In general pinconf belongs in board files, not SoC files.  Move it to
the only current user (trogdor).  Also adjust the drive strengths and
pulls.

Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc: Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Judy Hsiao <judyhsiao@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This should replace the patch ("Asoc: qcom: dts: Change MI2S GPIO
configuration to pulldown") [1].

[1] https://lore.kernel.org/r/1605526408-15671-1-git-send-email-srivasam@codeaurora.org

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 24 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi         | 18 ---------------
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 07c8b2c926c0..25ab6572f9cf 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -875,6 +875,22 @@ pinconf {
 	};
 };
 
+&pri_mi2s_active {
+	pinconf {
+		pins = "gpio53", "gpio54", "gpio55", "gpio56";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
+
+&pri_mi2s_mclk_active {
+	pinconf {
+		pins = "gpio57";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
+
 &qspi_cs0 {
 	pinconf {
 		pins = "gpio68";
@@ -1015,6 +1031,14 @@ pinconf-rx {
 	};
 };
 
+&sec_mi2s_active {
+	pinconf {
+		pins = "gpio49", "gpio50", "gpio51";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
+
 /* PINCTRL - board-specific pinctrl */
 
 &pm6150_gpio {
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 60248a6757d8..5040923a9f7c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1856,12 +1856,6 @@ pinmux {
 					pins = "gpio49", "gpio50", "gpio51";
 					function = "mi2s_1";
 				};
-
-				pinconf {
-					pins = "gpio49", "gpio50", "gpio51";
-					drive-strength = <8>;
-					bias-pull-up;
-				};
 			};
 
 			pri_mi2s_active: pri-mi2s-active {
@@ -1869,12 +1863,6 @@ pinmux {
 					pins = "gpio53", "gpio54", "gpio55", "gpio56";
 					function = "mi2s_0";
 				};
-
-				pinconf {
-					pins = "gpio53", "gpio54", "gpio55", "gpio56";
-					drive-strength = <8>;
-					bias-pull-up;
-				};
 			};
 
 			pri_mi2s_mclk_active: pri-mi2s-mclk-active {
@@ -1882,12 +1870,6 @@ pinmux {
 					pins = "gpio57";
 					function = "lpass_ext";
 				};
-
-				pinconf {
-					pins = "gpio57";
-					drive-strength = <8>;
-					bias-pull-up;
-				};
 			};
 
 			sdc1_on: sdc1-on {
-- 
2.30.1.766.gb4fecdf3b7-goog

