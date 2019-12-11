Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 666FB11A00E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 01:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbfLKAga (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 19:36:30 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:42712 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfLKAg3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 19:36:29 -0500
Received: by mail-pj1-f68.google.com with SMTP id o11so8163225pjp.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2019 16:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FP/zf8K1mqQfn8K0ftqgHZHJkSfo2eQNHAUrAnf9xJs=;
        b=mMm9OjJqHaCdZ8bw5nQR5ALK6Vvq1vvnOx/1JoAZq+nyus+8xOU3LLEqdKoJlDDBpT
         k0ouqFNdxes2yTJ5conUr5xMaJ0GVpw6NQYsh+ghC21UfebkirgvIMkF+nPRVUkAwzl6
         o2++Q32flzjDaXapq5Iqowm5PmrJBJYiWOoC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FP/zf8K1mqQfn8K0ftqgHZHJkSfo2eQNHAUrAnf9xJs=;
        b=aj6Ns9xTb3uIR+z1dBy5IjkgeJdlYskxYAtRc7vbXpESx/T/ruU12o4vDkkLFuxvF3
         G2Y7vaGk6um1m2f+7bWIXD2+BYbvx2pMZgLOwi8Hq175oQh9VqSbT5ZE9opOJ4kRogIg
         m/IJdKtAwKj7qa/GkB0Y/B3seNpXLz4KsFcpTNOcOARR3TYqFkQsLWZ/0jhU6S/8j38x
         gsj2ezkHLHd8+c3WL+l4zpypMGKRrsVJLO0vN6mb+PKn/e/VI6lsiJVTs9MiGdRtW8lH
         UzBNftHh2gtLN/GwzZXGPyw5882lOfJ2gTexiLaSwnv7mDhk+jKxLWff80ER2XIBDP4z
         o8jQ==
X-Gm-Message-State: APjAAAU3Pda8qcmJctL6vEdk7/xT1wFXIgB9JXafXwl1UZZxORgy2Ho3
        zjh9txGB+yLvG3yn0FYPTXaDNA==
X-Google-Smtp-Source: APXvYqyyMYn3eEkOXOSpuNWtCY++KZHNmwUrop6lejJN8jyCdg0iqPJPyizJpEsGK/R5di1B2iynhg==
X-Received: by 2002:a17:902:7c88:: with SMTP id y8mr299401pll.104.1576024589168;
        Tue, 10 Dec 2019 16:36:29 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id d38sm159954pgd.59.2019.12.10.16.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 16:36:28 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     mka@chromium.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/2] arm64: dts: sc7180: Fix indentation/ordering of qspi nodes in sc7180-idp
Date:   Tue, 10 Dec 2019 16:35:39 -0800
Message-Id: <20191210163530.1.I69a6c29e08924229d160b651769c84508a07b3c6@changeid>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qspi pinctrl nodes had the wrong intentation and sort ordering and
the main qspi node was placed down in the pinctrl section.  Fix.

Fixes: ba3fc6496366 ("arm64: dts: sc7180: Add qupv3_0 and qupv3_1")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 73 +++++++++++++------------
 1 file changed, 37 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 189254f5ae95..5eab3a282eba 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -232,6 +232,20 @@ vreg_bob: bob {
 	};
 };
 
+&qspi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_clk &qspi_cs0 &qspi_data01>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -250,6 +264,29 @@ &uart8 {
 
 /* PINCTRL - additions to nodes defined in sc7180.dtsi */
 
+&qspi_clk {
+	pinconf {
+		pins = "gpio63";
+		bias-disable;
+	};
+};
+
+&qspi_cs0 {
+	pinconf {
+		pins = "gpio68";
+		bias-disable;
+	};
+};
+
+&qspi_data01 {
+	pinconf {
+		pins = "gpio64", "gpio65";
+
+		/* High-Z when no transfers; nice to park the lines */
+		bias-pull-up;
+	};
+};
+
 &qup_i2c2_default {
 	pinconf {
 		pins = "gpio15", "gpio16";
@@ -364,39 +401,3 @@ pinconf {
 	};
 };
 
-&qspi {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&qspi_clk &qspi_cs0 &qspi_data01>;
-
-	flash@0 {
-		compatible = "jedec,spi-nor";
-		reg = <0>;
-		spi-max-frequency = <25000000>;
-		spi-tx-bus-width = <2>;
-		spi-rx-bus-width = <2>;
-	};
-};
-
-&qspi_cs0 {
-		pinconf {
-			pins = "gpio68";
-			bias-disable;
-		};
-};
-
-&qspi_clk {
-		pinconf {
-			pins = "gpio63";
-			bias-disable;
-		};
-};
-
-&qspi_data01 {
-		pinconf {
-			pins = "gpio64", "gpio65";
-
-			/* High-Z when no transfers; nice to park the lines */
-			bias-pull-up;
-		};
-};
-- 
2.24.0.525.g8f36a354ae-goog

