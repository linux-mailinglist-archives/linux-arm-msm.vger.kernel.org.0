Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 279C357F4ED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 14:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbiGXMYp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 08:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233738AbiGXMYo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 08:24:44 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D3C13FB7
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 05:24:43 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id n10-20020a17090a670a00b001f22ebae50aso7885716pjj.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nR0GZSZHxkQfSFgE9IcYh18ZJ6xJzqTkhKj/qxtoCHU=;
        b=W6+L7khMfz+7HA7bhTobQ6LTa010lauG6Ka970cXn17IPD+uPnjWgQv3xdJQHgbPc8
         fAF6bIOYMoXDrQ7tBiWsEvGHHBOXTLKv7FP3RO2jPG/I11U1iypeoKlqsz6U6OK5FsG7
         YPesAhl0R+Yo2RD+GpT2Pz+6A6K8wlXxzAcTY0NRXo1GOhdOM6k83Zp6ywijL+5xLyia
         D+rz17jglQKzjr+U53+C9/9IUXhVKczvqIUXH0MyR1ev47Kv3lBxTrEvg33I4a7qRR9/
         PzSetCX+XHgutJYY2a6ggS61KZRb75ThTNCnJcuM4X72cERmkmy/40vOYUctqa03zftu
         5OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nR0GZSZHxkQfSFgE9IcYh18ZJ6xJzqTkhKj/qxtoCHU=;
        b=wmU3bWDdj8NVcAvDUi5UohRs6fbsDisXKiXZWNI04pi2/cEupVCZkecb5TCj3QSTfy
         Q4ymAvWwywds/FVv71Myp7ffpSBvnHv/Rk3507c2YsSCZWqhKIMqCtL/K+XF7jQVUMYe
         9B12NmXD9xeLI0QUGt4jIGgX537n9I65Qqi+yZ6JrZQsCTf895Wl0rlrYlRJeAmK5Ul7
         arm2vTWSFYF6cscVaVGXldY3IhQ3Y0kAkDMMmyxWupbdrF/3Ee8yQe1NOS9/QopAwZdT
         Nz8usNynv+sVMU2IjMPBYmn81YMs4/Jf276ZnyPR2iIBq0Rvwr4eIsA9CDucGjTlGCo6
         +DjA==
X-Gm-Message-State: AJIora+m4+1lTj8CdVNzPs9GjFdvyucpbNSl5+e71AgcLtOvH88BzMEy
        JY5Li/9UzEiJhY9+0T3KqimDZQ==
X-Google-Smtp-Source: AGRyM1uqh/0UFeYKfWwckPYNB7HSliOOZeZQCgsyLv44rpW9oC4v0AzYkGGgWfiup6gsht2bm9DJjQ==
X-Received: by 2002:a17:902:6b02:b0:16c:3d67:8a8a with SMTP id o2-20020a1709026b0200b0016c3d678a8amr7874169plk.87.1658665482377;
        Sun, 24 Jul 2022 05:24:42 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3a:5a45:a9cd:d7dd:fd01:73c0])
        by smtp.gmail.com with ESMTPSA id p23-20020a1709027ed700b0016c0474fbd0sm7048133plb.34.2022.07.24.05.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 05:24:42 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, robh+dt@kernel.org, rafael@kernel.org,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Subject: [PATCH v2 2/5] thermal: qcom: tsens: Add hooks for supplying platform specific reinit quirks
Date:   Sun, 24 Jul 2022 17:54:21 +0530
Message-Id: <20220724122424.2509021-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220724122424.2509021-1-bhupesh.sharma@linaro.org>
References: <20220724122424.2509021-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add hooks inside platform specific data which can be
used by Qualcomm tsens controller(s) which might need
reinitialization via trustzone.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Amit Kucheria <amitk@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/thermal/qcom/tsens.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index ba05c8233356..92787017c6ab 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -513,6 +513,7 @@ struct tsens_features {
  * @num_sensors: Number of sensors supported by platform
  * @ops: operations the tsens instance supports
  * @hw_ids: Subset of sensors ids supported by platform, if not the first n
+ * @needs_reinit_wa: tsens controller might need reinit via trustzone
  * @feat: features of the IP
  * @fields: bitfield locations
  */
@@ -520,6 +521,7 @@ struct tsens_plat_data {
 	const u32		num_sensors;
 	const struct tsens_ops	*ops;
 	unsigned int		*hw_ids;
+	bool			needs_reinit_wa;
 	struct tsens_features	*feat;
 	const struct reg_field		*fields;
 };
@@ -542,6 +544,7 @@ struct tsens_context {
  * @srot_map: pointer to SROT register address space
  * @tm_offset: deal with old device trees that don't address TM and SROT
  *             address space separately
+ * @needs_reinit_wa: tsens controller might need reinit via trustzone
  * @ul_lock: lock while processing upper/lower threshold interrupts
  * @crit_lock: lock while processing critical threshold interrupts
  * @rf: array of regmap_fields used to store value of the field
@@ -559,6 +562,7 @@ struct tsens_priv {
 	struct regmap			*tm_map;
 	struct regmap			*srot_map;
 	u32				tm_offset;
+	bool				needs_reinit_wa;
 
 	/* lock for upper/lower threshold interrupts */
 	spinlock_t			ul_lock;
-- 
2.35.3

