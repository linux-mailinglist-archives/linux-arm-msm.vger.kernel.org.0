Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53B1A58976A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Aug 2022 07:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238853AbiHDFrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Aug 2022 01:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238589AbiHDFrA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Aug 2022 01:47:00 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 368665F984
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Aug 2022 22:46:59 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 13so2581965pgc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Aug 2022 22:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=nR0GZSZHxkQfSFgE9IcYh18ZJ6xJzqTkhKj/qxtoCHU=;
        b=YLT0+kYU3VKFS/NjXMA2ICg5k3chT0RGG/z34e6wvrSps9K+Ri+zDQ5mU6tDYkMbd/
         3o3gRvGi6/NCiH6Q3Qil3dQViWcfJktkPYtY0EUkz1vcWF4uI2Ndb3sMa9E8oGSLEzgs
         3vGT/fCm4oR2z9gkpHtYr0kG/VFIUy0XLG7qp+l1zuGJvEWFXyxJXWJyL8IPQRBh4Eln
         idk41Qdw+//OhQMWzuJPq5dOjHbRbVyVdavu1PCAPAyC5i7XsdjhKz5UZRLb6iQaIejB
         aKxFsUAzh8x/caOAMsU8e6k/cz0fyGx9ibj7uJwt7eC8xTHWiV1ntShM0DNAsYhTMiRj
         eO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=nR0GZSZHxkQfSFgE9IcYh18ZJ6xJzqTkhKj/qxtoCHU=;
        b=yTbqBDyXSKMBqRFfoM1blamBBiXuZM2nU0osLmxXuiAU2Qas8tFs8AqYPgW1rKWPbA
         NefAc6KVck1EffdXdhJhnJpY9qBLojow4uOCBdO/MoWwJCNeC+mROVF8dlZ6DjgLh//b
         eozchfZrB2kYDPFrC8IjK2jtOGN9rDGS7agKB1U/fDwRCKkS5JRmZGcJSvd1OAxtlojr
         awrdnoSY7kCag0XA06IDV+neHBpE4OjpYmp4Z26oklCwaE/MQGrLNaEQTzgTgmPgK8A/
         rVABLLsQ7zltZKWFHJI9R0awJA0A/ImpGts5et9EOZkuUxyCPnEygvzA/adVil5mq+Xi
         PGPg==
X-Gm-Message-State: ACgBeo3ewGJo9Aus9QQ5Ec2QgMGcVqRmqZPNUVzyhsj5788zGune+rNZ
        bnx7g9Y8pcn2s21SwmY0ZaNXsQ==
X-Google-Smtp-Source: AA6agR73rPAO/MH4zI95CBe2sa4aOoJYd9bmYwh6c4g/Lb/EaQB1AR04VKhHNlmctJhopR8sEM9tsw==
X-Received: by 2002:a63:484:0:b0:41c:cb1f:a60f with SMTP id 126-20020a630484000000b0041ccb1fa60fmr323007pge.546.1659592018669;
        Wed, 03 Aug 2022 22:46:58 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c5e:ddbf:1bd6:4443:9e5b:2aa2])
        by smtp.gmail.com with ESMTPSA id q25-20020aa78439000000b0052dcd14e3desm5375636pfn.183.2022.08.03.22.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 22:46:58 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, robh+dt@kernel.org, rafael@kernel.org,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Subject: [PATCH v3 2/4] thermal: qcom: tsens: Add hooks for supplying platform specific reinit quirks
Date:   Thu,  4 Aug 2022 11:16:36 +0530
Message-Id: <20220804054638.3197294-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220804054638.3197294-1-bhupesh.sharma@linaro.org>
References: <20220804054638.3197294-1-bhupesh.sharma@linaro.org>
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

