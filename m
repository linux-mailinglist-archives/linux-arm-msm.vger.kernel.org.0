Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21FA855511
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 18:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730740AbfFYQrm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 12:47:42 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34325 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbfFYQrk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 12:47:40 -0400
Received: by mail-wm1-f68.google.com with SMTP id w9so2699108wmd.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xx1EmDNUL6NrJs1zybeQYATP7BtRS3ZxfHrchYlbb1w=;
        b=ehQo1iJYS9sB9JFN2Xa22OZs9vsDho+0SpTjnu+gLJrGOR91YDeDq/PPd81moyZ2sY
         0FyU9t0jreva8jyV04sH4pWQ70l6pRHZJbBWvSULWQngBX+Z9EdPpp8VUtNT8LxcsAHh
         vDjKzTSGbPyFTth0SxzDdo/EeN3U2FXuXRuyJ3TxRvy0pEcSXC+KKU2wL+Z5fIRO2H+P
         d9Vits6jzByP971MXaDurZbFM8FOV/kvXPKitcFxzyjSvvlNu2YsdbbzQjdSN7vX566V
         qamvc45X6PPKW9gW0tctAb3tSHNSMZYpqHHqaWFj/NT0HYHWhFqZhwRFbJsoHe1X8UJn
         kUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xx1EmDNUL6NrJs1zybeQYATP7BtRS3ZxfHrchYlbb1w=;
        b=BuSxjGbT61kTavegg2Enm6q77g3ggTpQAjTYzMdeXA3Ef/qcguYT/ifEPMhYyAm6jp
         VVQg8m4krPvMuVsO0U8cdEZ/1XH77eGBBAwFijzlSgv6CkStOSLuNYyio+N+/FkmOihn
         ZYKMMPSqh8B4NHXzAE1xtDtWVsd0iD8aYLZJfPzgQKkzbtMfRDWqYxtbpKisWrwlKRHU
         r3lt4OxKmvn2FepRpBCMxllR51mpsRlfq81x0VxAidW3lMU2Tvzj5TAy9gg1lHyI/lTU
         b1Dli5EgekWHLtK15iIp48Y2mqtc1fa8rlte/lFy5YOqZJZ6tGQKrRdh3VgdCtPDPvn8
         I6/w==
X-Gm-Message-State: APjAAAXiHLu8hB+zR691TWRYUyOhU+E8i//Z1MSTxH3tA0LJ0c/mv3b6
        eidkFIKDs+Vt+ckLG+I2h3+YhA==
X-Google-Smtp-Source: APXvYqzQegDiAysGwbSCaeJGZtZMZeEuUAmigshcMMK0ThMtUBYljkK/qXsHQTpNJjJTMGnl9rKg9w==
X-Received: by 2002:a1c:cfc3:: with SMTP id f186mr19048286wmg.134.1561481259356;
        Tue, 25 Jun 2019 09:47:39 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:38 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        jassisinghbrar@gmail.com, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com,
        arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de,
        sibis@codeaurora.org, enric.balletbo@collabora.com,
        jagan@amarulasolutions.com, olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v3 01/14] clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
Date:   Tue, 25 Jun 2019 18:47:20 +0200
Message-Id: <20190625164733.11091-2-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Limit the GPLL0_AO_OUT_MAIN operating frequency as per its hardware
specifications.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 8 ++++++++
 drivers/clk/qcom/clk-alpha-pll.h | 1 +
 drivers/clk/qcom/gcc-qcs404.c    | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 0ced4a5a9a17..ef51f302bdf0 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -730,6 +730,14 @@ static long alpha_pll_huayra_round_rate(struct clk_hw *hw, unsigned long rate,
 	return alpha_huayra_pll_round_rate(rate, *prate, &l, &a);
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
index 66755f0f84fc..6b4eb74706b4 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -104,6 +104,7 @@ struct alpha_pll_config {
 };
 
 extern const struct clk_ops clk_alpha_pll_ops;
+extern const struct clk_ops clk_alpha_pll_fixed_ops;
 extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ops;
 extern const struct clk_ops clk_alpha_pll_huayra_ops;
diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 29cf464dd2c8..18c6563889f3 100644
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
2.21.0

