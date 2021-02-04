Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0216030F7D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 17:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237978AbhBDQ1R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 11:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236960AbhBDPBr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 10:01:47 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928B7C0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 07:00:09 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id t142so1228316wmt.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 07:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=28ZBg6HWPIrbV+zPYpH6RT+vX30g3C029HWLCzM+KTU=;
        b=XWA5TX5+90UYIeU2L4Yh0RIg5dicSIysZDGFObgurM7Qg8TtAxHLu6+dVm6fuZe/yB
         vkkCL7eVcibRvIxWReLLiI2IRMyoBTbqD7dCAGX2nXyv4qxGpByDDuDMRtsde558Ofjp
         CgYYKy/TDNel3ky9fYEC/CQaG3w64Jvof0PngGMWLZynWfcqXjrcCOIKYghhiqEQjcia
         PIrKZ4b/zT6SAffkKK9axbeBfZ+zczdI25VYPmlojGWE0gbWdDOwxuJcgXY94L9qddsE
         fXBky95IfqYf04JQXFptbJ5crBnfNKcS6P+tVGozRPP+Q9yGmzDd6kH2Q7helJnQrBNe
         i5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=28ZBg6HWPIrbV+zPYpH6RT+vX30g3C029HWLCzM+KTU=;
        b=k+7Wsnd/cp0PYaBXuDHdAEM3r9oa5zjMhHs7/p3siv3QaEdVXzQy6lrUSwj17JhlFo
         D8KE5BRipYpH0bXpmgiNxZUNI4ODsuEVoqO07pvC11j+cmSGvZYr0MbqjqDczb784CWB
         fLiFOeKVuPDmgFVhFALxNLWX0K6+0e2v/IpCQ9MucSsm4aV4ms6pG4rjz5HICNPnn0D8
         jb3/7TU09pedZhPhhiKri+Ng9dYuaXC4SRlubPQ9wZ7IoQpBJsvj2jwxNRuLv5YiYlSB
         BgDWolK9O1MDJVjWMMpt4gbbMS214Vcs9nfxKGhhT2FA3oi3+MwaZCxeqdh91qPBI/vM
         mmAQ==
X-Gm-Message-State: AOAM533V6E6qc5OfeMG9KRBupwHPdJTPacoavR5DlQ0OY81qAcllqgOa
        rG6jkQJPLZ9g/rPZUSRVqlCa/Q==
X-Google-Smtp-Source: ABdhPJx9ATUPuwuSSUJqvX8E9gV9HDrCv8XsS345fMtp3A0gI98Iv3W3T3VGOy7ldfM7pQXm7HAnKw==
X-Received: by 2002:a05:600c:20c6:: with SMTP id y6mr7799946wmm.97.1612450808290;
        Thu, 04 Feb 2021 07:00:08 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c11sm8312664wrs.28.2021.02.04.07.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:00:07 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH v2 2/4] clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
Date:   Thu,  4 Feb 2021 15:01:18 +0000
Message-Id: <20210204150120.1521959-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
References: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the missing video_cc_mvs0_div_clk_src entry to
videocc-sm8250 replicating in upstream the explicit entry for this clock in
downstream.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 2797c61f5938..cc84963ced40 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -169,6 +169,21 @@ static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
 	},
 };
 
+static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
+	.reg = 0xd54,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "video_cc_mvs0_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
 static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
 	.reg = 0xcf4,
 	.shift = 0,
@@ -276,6 +291,7 @@ static struct gdsc mvs1_gdsc = {
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
 	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
 	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
 	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
 	[VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
-- 
2.29.2

