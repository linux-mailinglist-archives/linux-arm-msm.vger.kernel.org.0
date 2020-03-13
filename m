Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7870E184FC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 20:58:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbgCMT6k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 15:58:40 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36663 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbgCMT6k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 15:58:40 -0400
Received: by mail-ed1-f67.google.com with SMTP id b18so8832923edu.3;
        Fri, 13 Mar 2020 12:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kKbduOEJuOLH2ICDgcZMDUzuXMTHH9ThPo15fxYAG8Q=;
        b=jaKb/qiY9hvPPm2wefRCbqRqP2dBg7WeqTO0szzvCTvq2vT9hXPtxxpviHbflvXULl
         BexCSc/sE9aCgx4tvT7j/W80vLEBisf+YULhvwN7kkWy7FxPB8NVkSmxWNXsGqZf+CYO
         MfVb5/iaOiDKOQlG61G9XNivMVssoXVHRZ3pDsekEbWHmol/JR0eNjCdHHd7VBcg7DNF
         bCIrqWA55fxw0GQHmjgkmgigeh+Kpm1wa1RZ/+09RHAgTxgSMfOUE+dNQ6BwJExW3n5r
         BQgB2XYrv/rxXjyMaEFwEVsRuwmaBcX9pxRHz5zME1fFkP6mB6z0pgp0YXKP5hRgfW1E
         ME7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kKbduOEJuOLH2ICDgcZMDUzuXMTHH9ThPo15fxYAG8Q=;
        b=eVlYMVbA13uBKJUV3lAqiQu/Au26PV4tYflLEGxTCWKeIWdieshMLqY9lM3aLsyXXD
         yR+ebKVaf3gRWro7wwYJewfFn0tRGU5TAtlCSEBFd4jYHEBHDmsxQkcG2zxYlFS9i1ir
         spXChbjGlKBvKkd62sIDxDBYobv4oirV2BMBvRGAd+7ncJqSBRfOFtUtzMXYzPHaOK8p
         lSpBisgm5L0AK65oeVAElux2FD+a0svMbXI1lvQ8tvCmKSBZilm3e/XPYXSorsxs7HKo
         QBCaITEtLHLxGzyqNESHuupipmElUjBcmoK25f5nvLCJBgQHBWoaGF42iEc7GVF3JXVp
         FrUw==
X-Gm-Message-State: ANhLgQ2Sr858jdmlad6eFFtXESrzFQwAwJSJOJk1Ywdmtg0hzRuWzRwU
        U+mAdicIj2/aF2tKwAarHgE=
X-Google-Smtp-Source: ADFU+vsevLnvdtrqilhEhLXL1GVc4pJDLqk8uB5OV1ek1c5li/33mVhGe5XnsLRgX3rc7yotIGJydA==
X-Received: by 2002:a17:907:104e:: with SMTP id oy14mr13262578ejb.82.1584129517304;
        Fri, 13 Mar 2020 12:58:37 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host61-50-dynamic.50-79-r.retail.telecomitalia.it. [79.50.50.61])
        by smtp.googlemail.com with ESMTPSA id j19sm1192052edq.57.2020.03.13.12.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 12:58:36 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     agross@kernel.org
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Mathieu Olivari <mathieu@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH] ARM: qcom: Disable i2c device on gsbi4 for ipq806x
Date:   Fri, 13 Mar 2020 20:58:16 +0100
Message-Id: <20200313195816.12435-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Disable the i2c device on gsbi4 and mark gsbi4_h and gsbi4_qup clks as
unused. If they are enabled, clock framework will turn them off at end
of probe. On ipq806x by design gsbi4_qup, gsbi4_h clks and i2c on gsbi4
are meant for RPM usage. So turning them off in kernel is incorrect.

Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 9 ---------
 drivers/clk/qcom/gcc-ipq806x.c           | 5 +++--
 2 files changed, 3 insertions(+), 11 deletions(-)

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
diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
index b0eee0903807..75706807e6cf 100644
--- a/drivers/clk/qcom/gcc-ipq806x.c
+++ b/drivers/clk/qcom/gcc-ipq806x.c
@@ -782,7 +782,7 @@ static struct clk_rcg gsbi4_qup_src = {
 			.parent_names = gcc_pxo_pll8,
 			.num_parents = 2,
 			.ops = &clk_rcg_ops,
-			.flags = CLK_SET_PARENT_GATE,
+			.flags = CLK_SET_PARENT_GATE | CLK_IGNORE_UNUSED,
 		},
 	},
 };
@@ -798,7 +798,7 @@ static struct clk_branch gsbi4_qup_clk = {
 			.parent_names = (const char *[]){ "gsbi4_qup_src" },
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
 		},
 	},
 };
@@ -991,6 +991,7 @@ static struct clk_branch gsbi4_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_h_clk",
 			.ops = &clk_branch_ops,
+			.flags = CLK_IGNORE_UNUSED,
 		},
 	},
 };
-- 
2.25.0

