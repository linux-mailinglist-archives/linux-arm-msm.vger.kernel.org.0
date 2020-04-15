Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0F01A928C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 07:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390402AbgDOFhf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 01:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726636AbgDOFhc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 01:37:32 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1B5C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 22:37:32 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id w11so981364pga.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 22:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1DpqNkdYjp7AgN19jz89WzdaX519p2fuqV9ZKi1SZTY=;
        b=ao7NeAXe4q3XDw6YGwRybqHsHu2QW4/Y8cg7FlC7rb8QxWa00kb6DCprkSDhE1dPTX
         3WCb03iGwMABjglJG7//2Q2BSLwUluLqq1ibb5bnwbRGMkiSCXGKasXQuT736bSLoPco
         Xm3R+uZIwkR34Jz7FQH5r3AyCrNe9hKNd8oX8d99Lbibv8n2WjuWWxwNa1diYbVzWJ1H
         BrJtNb+rz+BjUJ6WtjZheapF4FAane+hwxCknlW0HBwQAVhWtlB55OIizjlmAoCMnaPh
         t+sjFgucKAUGyIMBAoTucJF6wFQ7wmklLkLFvzMg3b/XTc/2HFEUdKXlfRuUJEs8fMvA
         tQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1DpqNkdYjp7AgN19jz89WzdaX519p2fuqV9ZKi1SZTY=;
        b=cc8O+1HBVTU0W/Zh8oY8x87V6+BJtQq6IhVhLQPErD6qRnxHbkXZamodFVkFFuzeHo
         rXCGM+JibroygDgc3r3eyEh4UkguE5mX/fqCvWLytw/Xj3/tVdoGjVNKF3UPYtukKsps
         DAzwN7ye5DMCiNPw9rZlL+JC90P7Y5O3B+/Q3tZNA11w19h0HLLlAe3IuiYbdHsUYdxW
         m0RNA3jSYgoLJQ2jDiaoD6ArvH0Z+4f5/mLiUirjRk2pWMc05p+8gZKw5jdF1ONUGsYz
         ckxftPwOoDboRB1m3RknxtZ1I90PkMJDdle93oGAu6DYnoqqwJ8IY/wUBMVmkzWXPcbn
         oMFg==
X-Gm-Message-State: AGi0PubEbBxbM8jEacwbnrdG1gqNql4Wha7f7XGEhOJH8yRo4en50jeL
        yNJopMzFJ8LpEOGnh1PNmpjQBw==
X-Google-Smtp-Source: APiQypIMWPJtUkcJE17271ZDMIVp+P6naL6E573ldPQmsDBDbUKcgvvfTthqRoPrNcYScClx78nA4g==
X-Received: by 2002:a63:513:: with SMTP id 19mr26340845pgf.48.1586929051430;
        Tue, 14 Apr 2020 22:37:31 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 18sm12839178pfv.118.2020.04.14.22.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 22:37:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] regulator: qcom-rpmh: Fix typos in pm8150 and pm8150l
Date:   Tue, 14 Apr 2020 22:37:08 -0700
Message-Id: <20200415053708.717623-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix typos in pm8150 l13/l16/l17 and pm8150l ldo8 supplies.

Fixes: 06369bcc15a1 ("regulator: qcom-rpmh: Add support for SM8150")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index c86ad40015ce..c88cfa8952d6 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -832,11 +832,11 @@ static const struct rpmh_vreg_init_data pm8150_vreg_data[] = {
 	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l2-l10"),
 	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_nldo,      "vdd-l1-l8-l11"),
 	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l13-l6-l17"),
+	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l13-l16-l17"),
 	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
 	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,      "vdd-l13-l6-l17"),
-	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,      "vdd-l13-l6-l17"),
+	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,      "vdd-l13-l16-l17"),
+	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,      "vdd-l13-l16-l17"),
 	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
 	{},
 };
@@ -857,7 +857,7 @@ static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
 	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l4-l5-l6"),
 	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l4-l5-l6"),
 	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l7-l11"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo_lv,   "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo_lv,   "vdd-l1-l8"),
 	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,      "vdd-l9-l10"),
 	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l9-l10"),
 	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l7-l11"),
-- 
2.24.0

