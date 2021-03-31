Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66E534FE96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 12:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235122AbhCaK6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 06:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235119AbhCaK5p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 06:57:45 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132E3C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:45 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id b4so28493419lfi.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=81aVn3cgKmJwkahVoYGBOYGXWnu3CXfAkBhhOdfG2tg=;
        b=dowG8r//ltSsk5+GxENoi2CH9y5XFUg1fBKh/cDzr7m7mvxVuq9jmTm5RWE/aMR+bK
         aP+hTg6AaPOiNyPCy0iOcU932h7ZulujBB1ejURrh2EaKTy+UHRGS8OrbCwT7505prsQ
         NQ3DuW+3exedbLIDbcMrjpMmYR2fuBRkbfkac5rN1rGgrK3PzNBGJNkN92kxOI9lVeUf
         Bj7l2sBVK4QeyAxbsUcsIhzDS5qczI/MLWEQGjCZEmCu3lDI83Lu+Vi1islbzINi5fZM
         QOE6/0VTC+Jkvs3v2wDWWMlacPKW5ob/z8NEwgOL6IZ+f+tEZ0T6MjLeQsV8KNelNcRm
         xoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=81aVn3cgKmJwkahVoYGBOYGXWnu3CXfAkBhhOdfG2tg=;
        b=KMsFLGCiPVipQ2ajLOVC3nX5my118AGckeMUNlvXOWVkO33jGFqbhB2Afmk1gAC8dp
         KIx3Nba4Ci0STJI/O9uGeefAOCaiTgY/5Q7wrcySlC7jf/IACA3ZhoG8UPrCESMoDAgb
         jcO1RcCKWwvC/VuqCPIayu9EnqffYl9sB4w8GmHx8sQV0XP/0ajthhlncSVsEImLl1/6
         dR+kcLaChbKb/bjrqXTYe2sPTfgZSs5uzlcdmFbKRNltJ++epdyLuJ4m5wwS1MUgbaJe
         lR8UZbL/1WQ/QBohs61WYU2/MmC0L8mG7zwBwuAN5mO7sz6txjMIiOZ9NyvjYywE/V1x
         M+DQ==
X-Gm-Message-State: AOAM533kpbYQUA0ZDF/VHdjomPA5hgs0CF2rD2t49kSNzLACXDMVtce7
        83PLaX78v9LQU14QiLfWaxQ0QQ==
X-Google-Smtp-Source: ABdhPJzYPwkY1k+8eDMII6mlVm082SsnI1RnEiwqTWsJls8rtTQpyK22Nh1lAk5IN+wfm3h19AmW4Q==
X-Received: by 2002:a19:7dc5:: with SMTP id y188mr1911348lfc.309.1617188258457;
        Wed, 31 Mar 2021 03:57:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:57:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4 02/24] clk: divider: add devm_clk_hw_register_divider
Date:   Wed, 31 Mar 2021 13:57:13 +0300
Message-Id: <20210331105735.3690009-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devm_clk_hw_register_divider() - devres version of
clk_hw_register_divider().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 include/linux/clk-provider.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 9cf7ecc62f7c..6273a841f51f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -785,6 +785,23 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
 				  (parent_data), (flags), (reg), (shift),     \
 				  (width), (clk_divider_flags), (table),      \
 				  (lock))
+/**
+ * devm_clk_hw_register_divider - register a divider clock with the clock framework
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_divider(dev, name, parent_name, flags, reg, shift,    \
+				width, clk_divider_flags, lock)		      \
+	__devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
+				  NULL, (flags), (reg), (shift), (width),     \
+				  (clk_divider_flags), NULL, (lock))
 /**
  * devm_clk_hw_register_divider_table - register a table based divider clock
  * with the clock framework (devres variant)
-- 
2.30.2

