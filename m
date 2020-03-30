Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D62B1985E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 22:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgC3U5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 16:57:01 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35774 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727750AbgC3U5B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 16:57:01 -0400
Received: by mail-ed1-f67.google.com with SMTP id a20so22577912edj.2;
        Mon, 30 Mar 2020 13:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xV24bY+9ZHrEg7r2qYUHnQ8d27A7ffpYwBJNYjkSVys=;
        b=b2bXKFNiFz7uYVBZYuUFOsPh+KRsloBhmBsh55XB9RUHCsuUoTL56b0zhQxc7XlXE7
         rxnEjGULGjg6n2E1rcof+8xU9YKcOZYHAA/rfvFAMHTmRfPUM+BhPujRpbcabTQOBbwb
         yg6QqQMVVy+amHCdIhhPsPNEFh11eko0FdApqzApyQAUTjPven7iQwZS5UMilDIu7zAi
         Rf/nXJJ7rdlqj03DEWhMlNtZY78T/p8cYrDwmpGZIN+O0S1UEVWh9n91cfU9rbsQqlIM
         FksYuIfWBZ8I+g3tEF3wQBkAdQP4+W5z3ZYkqQZiUhyTziz+bXcXwZarSvsuWfhsYd9E
         PXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xV24bY+9ZHrEg7r2qYUHnQ8d27A7ffpYwBJNYjkSVys=;
        b=TwqUTOXAzOWRz5aC2KKaCLxPXtCFQzNLvjHpzwaJ18t8/Uua+ba1Aa2aA5Bwjj7eeg
         5dvaZAqU4Vn1ph2po9ac5tB81gGARfCiJC07vtV12ase5xHxfif3373sFicfGEIifn4O
         pz0ItMSto7qlEEpTZE0DFxy+mpZPwQ6JNXhqd6rm3a1L7gr1y03OadRRhmpWxeodnvk9
         V57xCKTdwrkYkhqBqOzTfvFN6ZI4dnD6OF17Txu3iOmhq2p7NWBWMkpx5QMLh9nKWz84
         G6RBXFcsVOUjmQdNwFPGAD6hHAVghSsMaKfTrCpi5+KHXKL5LHKD1Jo8lVNiEfLwBhQv
         txbg==
X-Gm-Message-State: ANhLgQ1jBzq2n9k0StY6ckYaO5JHjn7OORLIOPAAoC05506oBdtk8lcR
        Npks6o0LS1sOENd9wncmiYo=
X-Google-Smtp-Source: ADFU+vumP9c0QoPy1L/XVTrWfUB8yNiEmoCy+BYk7bNQi2c0EANdKJo32GXatd9yH3cBjgoyJwd8+g==
X-Received: by 2002:a17:906:3607:: with SMTP id q7mr12498455ejb.65.1585601816946;
        Mon, 30 Mar 2020 13:56:56 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host203-232-dynamic.53-79-r.retail.telecomitalia.it. [79.53.232.203])
        by smtp.googlemail.com with ESMTPSA id n10sm2006475edf.3.2020.03.30.13.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 13:56:56 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Mathieu Olivari <mathieu@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2] ARM: qcom: Disable i2c device on gsbi4 for ipq806x
Date:   Mon, 30 Mar 2020 22:56:46 +0200
Message-Id: <20200330205647.24806-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Disable the i2c device on gsbi4, mark gsbi4_h as unused and gsbi4_qup
and src clks as protected. gsbi4_h can't be set to protected as it's
used by both gsbi and rpm and making it protected creates some problem
with gsbi4 uart function.
Without this fix, clock framework will turn them off at end
of probe. On ipq806x by design gsbi4_qup, gsbi4_h clks and i2c on gsbi4
are meant for RPM usage. So turning them off in kernel is incorrect.

Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 9 ---------
 arch/arm/boot/dts/qcom-ipq8064.dtsi      | 3 +++
 drivers/clk/qcom/gcc-ipq806x.c           | 1 +
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index 554c65e7aa0e..580aec63030d 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
@@ -21,14 +21,5 @@ mux {
 				};
 			};
 		};
-
-		gsbi@16300000 {
-			i2c@16380000 {
-				status = "ok";
-				clock-frequency = <200000>;
-				pinctrl-0 = <&i2c4_pins>;
-				pinctrl-names = "default";
-			};
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 16c0da97932c..d9a803c8a59b 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -421,6 +421,9 @@ qcom,ssbi@500000 {
 		gcc: clock-controller@900000 {
 			compatible = "qcom,gcc-ipq8064";
 			reg = <0x00900000 0x4000>;
+
+			protected-clocks = <GSBI4_QUP_SRC>, <GSBI4_QUP_CLK>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
index b0eee0903807..f7d7a2bc84c1 100644
--- a/drivers/clk/qcom/gcc-ipq806x.c
+++ b/drivers/clk/qcom/gcc-ipq806x.c
@@ -991,6 +991,7 @@ static struct clk_branch gsbi4_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_h_clk",
 			.ops = &clk_branch_ops,
+			.flags = CLK_IGNORE_UNUSED,
 		},
 	},
 };
-- 
2.25.1

