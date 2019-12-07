Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 135A0115EA6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 21:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfLGUgo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Dec 2019 15:36:44 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40353 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfLGUgc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Dec 2019 15:36:32 -0500
Received: by mail-pg1-f195.google.com with SMTP id k25so5071201pgt.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2019 12:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y5s38wz/6dk76o2wu93apOYv5A1m/3RpeMLEd54gKHA=;
        b=s5bZeDr0Sln+9g/a0EciNEuzuvps+Nd8eSHR6z8G3Ycx0YyHpqr46Js6YGYw7nPhr9
         N2/9cpqmyhIf1JnmNWUN+m+HPBXc6M7Qszc44JENP5u7QgwkD95SjIJE7pr4InM6WYfQ
         X0OlPgXFDJWR3GyD0VXGKwow5ut5scco33KtrJdQVrPCHNv4pAylg6wh7vM/3zS9Skcr
         eSoqV8ar331KUVaLm5vpS2iQOyTlDQymKNY9NCuQnRKN0gYLe6qLoDfrGb6eHamR9FMK
         CUZ0/oWQqk1zHLx4M9guPBwTOlUgdKznrz+z9m90DmzAT7uXI6mOihy4zS+012FGj3u/
         2Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y5s38wz/6dk76o2wu93apOYv5A1m/3RpeMLEd54gKHA=;
        b=f+DFiNQue4rDSiQJvqx8ksJW00SEdx3Yt1aX1FX5opDjisUyrhJt2xnXXTqC0voSk5
         9lhNrLm+e5eFViKSe6l+aEMy4jxHfoYUO+wsL2n2fzFcGUf646z9OzqFxGEmCzKxf0LN
         qaFbW49GQZGQoX5oygKIECJ8QzB9bDNlgwxcG1pn1ooMUeu/SdOoXKyjOvi4uBf9X5Ae
         9VUS0El19QrVrVEHj1bi8ChdcHphcpZk+cnFq4kN17TvwheJCNTvllo6VfUq0lsAClRb
         4SpZMTqbNFYBmjwMWoZOUOu5SEO7dgA2VSb5UNyvLMzWO/cQJcReJA4/XU2qEmfaaNdJ
         3/Pg==
X-Gm-Message-State: APjAAAUWXvZI9v6Cnb70U+STRAPZbxCKBvenwmwpneZth8I91Le5X5pf
        lT4BLM6O0j7dAp31KqtMduIZdw==
X-Google-Smtp-Source: APXvYqxPvzGVJHajbJKyNuh/L/VZJpPacmlCJRWlTu4zUkXrUoGgX4pOBwfDBPRMamkQ922x9BnOCg==
X-Received: by 2002:aa7:9118:: with SMTP id 24mr22439749pfh.182.1575750991839;
        Sat, 07 Dec 2019 12:36:31 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d14sm22982186pfq.117.2019.12.07.12.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:36:31 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paolo Pisati <p.pisati@gmail.com>
Subject: [PATCH 1/2] clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks
Date:   Sat,  7 Dec 2019 12:36:02 -0800
Message-Id: <20191207203603.2314424-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207203603.2314424-1-bjorn.andersson@linaro.org>
References: <20191207203603.2314424-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The CLKREF clocks are all fed by the clock signal on the CXO2 pad on the
SoC. Update the definition of these clocks to allow this to be wired up
to the appropriate clock source.

Retain "xo" as the global named parent to make the change a nop in the
event that DT doesn't carry the necessary clocks definition.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc.yaml   |  6 ++--
 drivers/clk/qcom/gcc-msm8996.c                | 35 +++++++++++++++----
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
index e73a56fb60ca..f8bd902d4e6d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -41,19 +41,21 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
     items:
       - description: Board XO source
       - description: Board active XO source
       - description: Sleep clock source
+      - description: Second XO source
 
   clock-names:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
     items:
       - const: bi_tcxo
       - const: bi_tcxo_ao
       - const: sleep_clk
+      - const: cxo2
 
   '#clock-cells':
     const: 1
diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index d004cdaa0e39..3c3a7ff04562 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -3046,7 +3046,10 @@ static struct clk_branch gcc_usb3_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -3060,7 +3063,10 @@ static struct clk_branch gcc_hdmi_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_hdmi_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -3074,7 +3080,10 @@ static struct clk_branch gcc_edp_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_edp_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -3088,7 +3097,10 @@ static struct clk_branch gcc_ufs_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -3102,7 +3114,10 @@ static struct clk_branch gcc_pcie_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -3116,7 +3131,10 @@ static struct clk_branch gcc_rx2_usb2_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_rx2_usb2_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -3130,7 +3148,10 @@ static struct clk_branch gcc_rx1_usb2_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_rx1_usb2_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "cxo2",
+				.name = "xo",
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
-- 
2.24.0

