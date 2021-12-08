Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10E6546DA84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 18:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238395AbhLHR6Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 12:58:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238346AbhLHR6O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 12:58:14 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B23D5C061A32
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 09:54:41 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id n12so7184353lfe.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 09:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TES3MR8gbSACRGcPH3e8TPXSue7ORh8Me+o7MCUMalg=;
        b=aFfPSCieETzY7jEcT/T4jmqLn/89qHWOmiwr8lLxYofi33tozivuaCyzLpXCr2g/WV
         QUzQfPTFx2OWXog2GuUUdTTfK2uFDb7bUL6TMvOw2LNczn1yK/p8TiM5Ri1JWWrkaB0P
         UL57D6ubEaZ3GLizQbwdlxnu9uJTC79IoctCD6s39ikF/JgVqKLL1BStNO6MPzguOVdC
         I2W0DS5vWcuOjYKd6jFvM93qZoZWkO66xKpwOi/PpLh6miVMNMGfGpaBBamMmOhQ5a8I
         d9rP+SqNGhuD8OFL0mi2xBhk1JceYhtPRqOn+oQiEe8bgLH1IWsjvRroKF2nDFX3/0DM
         4tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TES3MR8gbSACRGcPH3e8TPXSue7ORh8Me+o7MCUMalg=;
        b=omVJcNm8YSOqzcYeuiBZdITzD/gPM6vEmAP99EAGum8I8J/olYdEe4NUKhNhPDfzzE
         cINHJCfrroFJVP1ZzbGka/HOUtMbCs3iIIu1cIy8V9vYvBg7EYSOMlXf9ZOMOxyoJiFW
         odCNazx6+uNqkKpn9ZRo/HWM6AFQ83KwIstfDujstnHzioggyCWXoFJ09mvyOKvlhja3
         bvCDlvYEmGCzfNw05rAE62OJ7dzYj+jNXCfzrxqU+3TJ+hmUBBlD6Q19Aue4DDH4FPRF
         aI2iEY76KIQ2zhfjYqb+trYNDL3UcRNdQ1s8WwOovC2Yu0icht9ScsEgQxBrstHO2lK3
         WHsw==
X-Gm-Message-State: AOAM530+Mguce1yJNikuMCujjHr00NTfhlltCf2kkqFjmrcwnWodJdIR
        hQ1kffJ/RLIptk0XUqkL+UUgPpadY+f0LnNi
X-Google-Smtp-Source: ABdhPJzkGh+lH0yHaFqLkAUPczXqILwIw8bLITvGOvzTESfjcz6wiszhn0A6ODcG16jSvOnvwGDQDg==
X-Received: by 2002:a05:6512:2602:: with SMTP id bt2mr821386lfb.631.1638986080016;
        Wed, 08 Dec 2021 09:54:40 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm388903ljg.90.2021.12.08.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:54:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 09/11] clk: qcom: gcc-msm8996: move clock parent tables down
Date:   Wed,  8 Dec 2021 20:54:28 +0300
Message-Id: <20211208175430.1333594-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move clock parent tables down, after the GPLL declrataions, so that we
can use gpll hw clock fields in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 184 ++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 92 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 3acefe16355c..c2f9ae729d1e 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -33,98 +33,6 @@ enum {
 	P_AUD_REF_CLK,
 };
 
-static const struct parent_map gcc_sleep_clk_map[] = {
-	{ P_SLEEP_CLK, 5 }
-};
-
-static const char * const gcc_sleep_clk[] = {
-	"sleep_clk"
-};
-
-static const struct parent_map gcc_xo_gpll0_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 }
-};
-
-static const char * const gcc_xo_gpll0[] = {
-	"xo",
-	"gpll0"
-};
-
-static const struct parent_map gcc_xo_sleep_clk_map[] = {
-	{ P_XO, 0 },
-	{ P_SLEEP_CLK, 5 }
-};
-
-static const char * const gcc_xo_sleep_clk[] = {
-	"xo",
-	"sleep_clk"
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll0_early_div"
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL4, 5 }
-};
-
-static const char * const gcc_xo_gpll0_gpll4[] = {
-	"xo",
-	"gpll0",
-	"gpll4"
-};
-
-static const struct parent_map gcc_xo_gpll0_aud_ref_clk_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_AUD_REF_CLK, 2 }
-};
-
-static const char * const gcc_xo_gpll0_aud_ref_clk[] = {
-	"xo",
-	"gpll0",
-	"aud_ref_clk"
-};
-
-static const struct parent_map gcc_xo_gpll0_sleep_clk_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_SLEEP_CLK, 5 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_sleep_clk_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"sleep_clk",
-	"gpll0_early_div"
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll4_gpll0_early_div_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL4, 5 },
-	{ P_GPLL0_EARLY_DIV, 6 }
-};
-
-static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
-	"xo",
-	"gpll0",
-	"gpll4",
-	"gpll0_early_div"
-};
-
 static struct clk_fixed_factor xo = {
 	.mult = 1,
 	.div = 1,
@@ -229,6 +137,98 @@ static struct clk_alpha_pll_postdiv gpll4 = {
 	},
 };
 
+static const struct parent_map gcc_sleep_clk_map[] = {
+	{ P_SLEEP_CLK, 5 }
+};
+
+static const char * const gcc_sleep_clk[] = {
+	"sleep_clk"
+};
+
+static const struct parent_map gcc_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 }
+};
+
+static const char * const gcc_xo_gpll0[] = {
+	"xo",
+	"gpll0"
+};
+
+static const struct parent_map gcc_xo_sleep_clk_map[] = {
+	{ P_XO, 0 },
+	{ P_SLEEP_CLK, 5 }
+};
+
+static const char * const gcc_xo_sleep_clk[] = {
+	"xo",
+	"sleep_clk"
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll0_early_div_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL0_EARLY_DIV, 6 }
+};
+
+static const char * const gcc_xo_gpll0_gpll0_early_div[] = {
+	"xo",
+	"gpll0",
+	"gpll0_early_div"
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 }
+};
+
+static const char * const gcc_xo_gpll0_gpll4[] = {
+	"xo",
+	"gpll0",
+	"gpll4"
+};
+
+static const struct parent_map gcc_xo_gpll0_aud_ref_clk_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_AUD_REF_CLK, 2 }
+};
+
+static const char * const gcc_xo_gpll0_aud_ref_clk[] = {
+	"xo",
+	"gpll0",
+	"aud_ref_clk"
+};
+
+static const struct parent_map gcc_xo_gpll0_sleep_clk_gpll0_early_div_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_GPLL0_EARLY_DIV, 6 }
+};
+
+static const char * const gcc_xo_gpll0_sleep_clk_gpll0_early_div[] = {
+	"xo",
+	"gpll0",
+	"sleep_clk",
+	"gpll0_early_div"
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_gpll0_early_div_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 },
+	{ P_GPLL0_EARLY_DIV, 6 }
+};
+
+static const char * const gcc_xo_gpll0_gpll4_gpll0_early_div[] = {
+	"xo",
+	"gpll0",
+	"gpll4",
+	"gpll0_early_div"
+};
+
 static const struct freq_tbl ftbl_system_noc_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0_EARLY_DIV, 6, 0, 0),
-- 
2.33.0

