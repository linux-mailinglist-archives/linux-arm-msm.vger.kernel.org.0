Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1C6108F5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 14:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbfKYN7S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 08:59:18 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39039 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727666AbfKYN7R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 08:59:17 -0500
Received: by mail-lf1-f68.google.com with SMTP id f18so11087613lfj.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2019 05:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UyfsDOjViaLy31rOpDuIJP2/tnh70uuMePmLyotTbkw=;
        b=MHDvRHjkJIFUfMfGegrgrKlpv2zmfBLohiOLgx4UIyE3n0riOQHx0+AxlRvu1q3eHT
         S1AtdURFgmdpIPgJ7Jt2UK95EnVyTpKWD53sQMm4saA3p1Wd5XW65dWl0j69khJJ1x9w
         W3AJkht1Xclp90KZZRtanNu5SNy5FKDpU+cJ+uWbUVsQM8mqJ5IVJPinTI6v52fySDiO
         dai+VItWn95ik4QZJvLT+WpGGcVYcJ3aMFL9evIZC+FN1iXfnmBCM3ll1SEkcmRChedn
         kSv3FSkifhhu9wjRMdYpeegX9xx5TwfRxzlTzj06ZGM1K6bBInBBg+H0jNENGb4a+fxH
         AZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UyfsDOjViaLy31rOpDuIJP2/tnh70uuMePmLyotTbkw=;
        b=c5galsTK7qp3/7Pxk6h4rr4Z4hSHQxdlFmL7Fprnc4oey3qMsHysuOMzucTRNLBq9V
         T6cgpPr8czgSbxrRi2Wy3JU0Mq5ZgtBckH7h9W0mTCCAgzEu+E8wlSkE9WZ22qL1A0WW
         K/QsqzojhXiMKh+1ldV4s1ABeNQviv3BXJwg/eLE9AVfVqpb9D8gCjHY+5bxhBzQBo83
         9R0aX4cJ1lvINkVrqp1Wd6LfPeDALKQGOQQOwKjNjLZM7w+R8SCIxebkOlh/sG4yjeAu
         EZiR1F3fHrhKHGUvR9dw9GrbuECk7ajBj0Rn21VOSqmqqGzwBa6RC0R76BQRowKA2i1D
         Ouew==
X-Gm-Message-State: APjAAAWt/Rzt4wp6bYPKP+SltLu1sPkLwFEn0TMAn4owSFpu9zMnOiYT
        /lUdC7/XifGnj0Ok0fEAAk3lllb87KLl3A==
X-Google-Smtp-Source: APXvYqxNSlHJd8iQr1qHKpJZCFZ5YInMRzi23oMjI34GeF45sTBW6kOR292nDuXByYR0vGIGVMG52w==
X-Received: by 2002:a19:520b:: with SMTP id m11mr20364369lfb.77.1574690355801;
        Mon, 25 Nov 2019 05:59:15 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id w71sm4189705lff.0.2019.11.25.05.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 05:59:15 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
Date:   Mon, 25 Nov 2019 14:59:04 +0100
Message-Id: <20191125135910.679310-3-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125135910.679310-1-niklas.cassel@linaro.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Limit the GPLL0_AO_OUT_MAIN operating frequency as per its hardware
specifications.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
Changes since v2:
-None

 drivers/clk/qcom/clk-alpha-pll.c | 8 ++++++++
 drivers/clk/qcom/clk-alpha-pll.h | 1 +
 drivers/clk/qcom/gcc-qcs404.c    | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 055318f97991..9228b7b1f56e 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -878,6 +878,14 @@ static long clk_trion_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	return clamp(rate, min_freq, max_freq);
 }
 
+const struct clk_ops clk_alpha_pll_fixed_ops = {
+	.enable = clk_alpha_pll_enable,
+	.disable = clk_alpha_pll_disable,
+	.is_enabled = clk_alpha_pll_is_enabled,
+	.recalc_rate = clk_alpha_pll_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_ops);
+
 const struct clk_ops clk_alpha_pll_ops = {
 	.enable = clk_alpha_pll_enable,
 	.disable = clk_alpha_pll_disable,
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 15f27f4b06df..c28eb1a08c0c 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -109,6 +109,7 @@ struct alpha_pll_config {
 };
 
 extern const struct clk_ops clk_alpha_pll_ops;
+extern const struct clk_ops clk_alpha_pll_fixed_ops;
 extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ops;
 extern const struct clk_ops clk_alpha_pll_huayra_ops;
diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 9b0c4ce2ef4e..46d314d69250 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -330,7 +330,7 @@ static struct clk_alpha_pll gpll0_ao_out_main = {
 			.parent_names = (const char *[]){ "cxo" },
 			.num_parents = 1,
 			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_alpha_pll_ops,
+			.ops = &clk_alpha_pll_fixed_ops,
 		},
 	},
 };
-- 
2.23.0

