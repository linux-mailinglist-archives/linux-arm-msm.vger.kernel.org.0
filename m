Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 698389D43E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 18:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732739AbfHZQpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 12:45:16 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35697 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732049AbfHZQpQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 12:45:16 -0400
Received: by mail-wm1-f66.google.com with SMTP id l2so195538wmg.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2019 09:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=40OiuM1nuJAlvKWfMTtKgR/XOwSSjLB8LuDFl5DKXzY=;
        b=GN6MYYYHB3XQKR+KiwiVIeeM+2G4bD2QVjJ0i4C+/s4CBPD92zJDGewr9zJsWAgCRN
         /z45GHS5Uf1w6DWI8hlpFtkeIsMSlftBpG6gJ22S3dI3X7s70ELcZ3mclie1tUmUtfX+
         7pSX+Q9Ic4LZ2i1TtIGatlciKeYIMHfq2cQGn4RqSdKevBITEYAnSgSL0AQOZhdJWE2V
         K4U7eHqz160iQTcPGp/97QN/v6FHd0Pu3PPD505UezV34nYhvf/t7bezKlDgHDu/HOHj
         P+1lnPj6hPWhzZ0P3jWvjG75//1tON4d5jP/dlA5EzYpFSW+CUy/Z5vD3LS+Y++h62OC
         fYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=40OiuM1nuJAlvKWfMTtKgR/XOwSSjLB8LuDFl5DKXzY=;
        b=KrejUmv+EOl1/Qar32bZdsnK7ffDscfBY02GrBaUZ4HeRxYufPm6DuTwIOY8wiOPZI
         nr92YPd4Vw4W12R6AVp968m1iOrYoKTETr/TKBuXNjKekcNVElHAjO0JVfduCctoS4Iu
         L71U1B7/Ozf8TuucHXsKjrMv4xDA9J/oHCVzGBycDs4yZ4bNtqWFv9rVf+CU0RniZQQ9
         OYS9IJI17wS5SH0S6Kc2acuFKl5un/4JXSiqc2SokCh1pgRdZFTXnu2Lj69OdjxtX4vq
         x+X+4agX7HhwCXBB1Di2hK56xleQZJ18TTTXWeXFU6jwWvElsn/kf7ptsSsa5kx1Wcf1
         ZwsA==
X-Gm-Message-State: APjAAAWBzf7mtQ6i5x5ukhFqOWPkM9PgWvue/e8+ZtNTYEv6Ip95jpxB
        hhou6BDqWiWyq6iOtmVcmVknww==
X-Google-Smtp-Source: APXvYqz15pvffql6Kf9l8H7kJ6RNaJf4BK1apbLb2u0bWrcxkLHHlUQlchWJBjOeUDMhDxya4m/k1w==
X-Received: by 2002:a7b:c4c6:: with SMTP id g6mr23832612wmk.52.1566837914285;
        Mon, 26 Aug 2019 09:45:14 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id l62sm77872wml.13.2019.08.26.09.45.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 26 Aug 2019 09:45:12 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        agross@kernel.org, mturquette@baylibre.com
Cc:     bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
Date:   Mon, 26 Aug 2019 18:45:06 +0200
Message-Id: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
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
index e12c04c09a6a..567140709c7d 100644
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
2.22.0

