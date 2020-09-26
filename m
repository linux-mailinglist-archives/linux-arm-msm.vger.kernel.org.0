Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDC76279931
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729289AbgIZM4K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgIZM4J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:56:09 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8F8C0613CE;
        Sat, 26 Sep 2020 05:56:09 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e16so6892728wrm.2;
        Sat, 26 Sep 2020 05:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iWbBh4wEsI+3oKMbFeIqVzya6+vka++Z1j+OucMUxWY=;
        b=dUc9QEox4/Z1jVdI1Z61Jy1FMR1K6SYHTAE6aJwawQtULBWgsK4sJlbRIs3u922igH
         8pccKNlWo5Ae/ZngxEU/B0dEOlvqWBE1wFdqgsbE7Lc4hG3NykHj7o/DAakb92C4rC9/
         flghAapyAoXOAnKj2fQpj332AkGbehOS+va2lbY3oV+cLsDA+QURaOSSCq4z9p59bawp
         d7D5YpUrDiefPUWmixDqhn8v4iPpF1HSys8plJbv/ju3DU/2QHBwkabEeOQRJCim1fwG
         mMohvzMlnJev/LXoQ1QuYIyQoEvyk9+Poy4CkCy7CSufEH1lg5IHEWcwyWG1kernyOYK
         dbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iWbBh4wEsI+3oKMbFeIqVzya6+vka++Z1j+OucMUxWY=;
        b=jAgPgrLE0Rba7sGyS1AFrOg81/Qy+364EXsrKzjRHZSQFIyjH5cmeycUHqPRB3QI1y
         cnehYBM8sox8PQK8hOD04a7nlss3XvTd5Xd2uL7IGaJWyhTolzhUpHTy9pc0A+2KSwvQ
         WUl4jYlgxkXO+/T/iV9NERuXGBmBQKrhUaH77svkxqfG9ZqvI4eSX+Z9U9/hwgavNeV1
         n7v93mmVHQ82nXOLqP7kphP7+9uyi95pmv1+x4drwNQmzWvFYC8sfYBSp2SzLxMAdKs2
         lvbQ8gutjDmc4v/d7ZN10sNrbleI9FjgdgqjpgHloQ4d6FL+DzXvcQyXtW1NuHXc66nN
         pGwg==
X-Gm-Message-State: AOAM530YTK7f1jqQ3PKynb4YgGYhCd3vMSrRBd/Gnj+Ch/tPyVS1vVZB
        eKyTf03Mlg6AXOc1U6E8yFiJ12c650GLdA==
X-Google-Smtp-Source: ABdhPJwqv+JFFCPEOx0SDe5gJ9pdEbkFuio/iCJMbGKii72NeZF2ohRBb7+AtqGK0NlOfd2HjaIMww==
X-Received: by 2002:adf:ef4a:: with SMTP id c10mr9055793wrp.13.1601124968265;
        Sat, 26 Sep 2020 05:56:08 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id h1sm6503024wrx.33.2020.09.26.05.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:56:07 -0700 (PDT)
From:   kholk11@gmail.com
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, kholk11@gmail.com, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] regulator: core: Enlarge max OF property name length to 64 chars
Date:   Sat, 26 Sep 2020 14:55:43 +0200
Message-Id: <20200926125549.13191-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125549.13191-1-kholk11@gmail.com>
References: <20200926125549.13191-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Some regulator drivers may be defining very long names: this is the
case with the qcom_smd and qcom_spmi regulators, where we need to
parse the regulator parents from DT.

For clarity, this is an example:
{ "l13a", QCOM_SMD_RPM_LDOA, 13, &pm660_ht_lvpldo,
  "vdd_l8_l9_l10_l11_l12_l13_l14" },
pm660-regulators {
	...
	vdd_l8_l9_l10_l11_l12_l13_l14-supply = <&vreg_s4a_2p04>
	...
};
Now, with a 32 characters limit, the function is trying to parse,
exactly, "vdd_l8_l9_l10_l11_l12_l13_l14-s" (32 chars) instead of
the right one, which is 37 chars long in this specific case.

... And this is not only the case with PM660/PM660L, but also with
PMA8084, PM8916, PM8950 and others that are not implemented yet.

The length of 64 chars was chosen based on the longest parsed property
name that I could find, which is in PM8916, and would be 53 characters
long.
At that point, rounding that to 64 looked like being the best idea.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/regulator/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 7fed8cd134f8..d88bd846d866 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -409,11 +409,11 @@ static struct device_node *of_get_child_regulator(struct device_node *parent,
 static struct device_node *of_get_regulator(struct device *dev, const char *supply)
 {
 	struct device_node *regnode = NULL;
-	char prop_name[32]; /* 32 is max size of property name */
+	char prop_name[64]; /* 64 is max size of property name */
 
 	dev_dbg(dev, "Looking up %s-supply from device tree\n", supply);
 
-	snprintf(prop_name, 32, "%s-supply", supply);
+	snprintf(prop_name, 64, "%s-supply", supply);
 	regnode = of_parse_phandle(dev->of_node, prop_name, 0);
 
 	if (!regnode) {
-- 
2.28.0

