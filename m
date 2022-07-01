Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 531A156364E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 16:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbiGAO6n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 10:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbiGAO6l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 10:58:41 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF54922B3A
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Jul 2022 07:58:40 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id c4so2599021plc.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jul 2022 07:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9QtXv+dZtlgm6HhECfGhA6Ldyd18a0f5mRfAQaK65pM=;
        b=NChGv5zKePfICEsTb+zLWaxX0nFbB09r45Fa20a8VG8xqbvcm+3emPJxopN9k43Ty2
         kqW5kpngN1dYSuhrSzIKtyzZSoHtVbjYygHD0YRlmcoEph6T9QPaYtWHuUwEum+0MG1i
         5irl0mYhfZOYiX5lM4xLsBRqegnqvjPEg2NPqU632Hd25Sa4yQMRb2TTKbAiVA8Tn1tS
         czTOq66dANxKtxxnZ+EmngkKQNBTUejSBiXexJNeLnkcDUyCopQS5xGPxpb8I3LI4d+b
         p0fv7kMHBSlZCm+vWF242RN/L1iK9Sn91wvErlCvnlZlkAvm8DHO01hV3IdysyUa3crH
         aT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9QtXv+dZtlgm6HhECfGhA6Ldyd18a0f5mRfAQaK65pM=;
        b=kEuBVzxQdXQ67lpKhH258baavO5fRihrDcc2b9MbkEzKv/MB6xZBdBxDvmVDRT/AKz
         aNw433XQXcJKnWVMJQBJeYwFAlYOj54UDtKD0H4OpjuL+GzH0F1O4iwjsUlNsT8r0TGZ
         TSypOANxzq3JRuE99pCSlys44cdO01mGHlRiAUQBTbjEf4P0PFZIToGbYE5U4nNNvm7a
         HWpIUHWy3CEL+TQsxNp9J7vpeLAkqH+n3WJolZOzirt/VMFm2HD6xFeIARITI2chTJ+b
         uSrHf+s7yn1Txa5dEoyrgJ+/uSAJXno6zEUOId0KUaggFA20okPBQo0G9/ZR8YqCQO4a
         g5dg==
X-Gm-Message-State: AJIora9r4Vq0re1mL2nyefR8iRotNo6Qyc8T975uj4Zq7WNSrGEG6yps
        Xy6gVi5yp9TC0ReZp0Uh6wcRiQ==
X-Google-Smtp-Source: AGRyM1uNr5BumNBOeW2BsNpLv3/vyY1Q7Vs22yHhwqqQqPUV5TmuVwRJfKY3ueLUMALMScd3oss+9g==
X-Received: by 2002:a17:902:d411:b0:169:2eb:1b79 with SMTP id b17-20020a170902d41100b0016902eb1b79mr21586757ple.61.1656687520229;
        Fri, 01 Jul 2022 07:58:40 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c5e:e6c0:8e75:c988:f80f:8bec])
        by smtp.gmail.com with ESMTPSA id y19-20020a170902e19300b0016b844cd7e9sm9641399pla.115.2022.07.01.07.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:58:39 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] thermal: qcom: tsens: Add support for 'needs_reinit_wa' for sm8150
Date:   Fri,  1 Jul 2022 20:28:14 +0530
Message-Id: <20220701145815.2037993-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220701145815.2037993-1-bhupesh.sharma@linaro.org>
References: <20220701145815.2037993-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCoM sm8150 tsens controller might require re-initialization
via trustzone [via scm call(s)] when it enters a 'bad state'
causing sensor temperatures/interrupts status to be in an
'invalid' state.

Add hooks for the same in the qcom tsens driver which
can be used by followup patch(es).

Cc: Amit Kucheria <amitk@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/thermal/qcom/tsens-v2.c | 11 +++++++++++
 drivers/thermal/qcom/tsens.c    |  4 ++++
 drivers/thermal/qcom/tsens.h    |  6 +++++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index b293ed32174b..61d38a56d29a 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -101,6 +101,17 @@ struct tsens_plat_data data_tsens_v2 = {
 	.fields	= tsens_v2_regfields,
 };
 
+/* For sm8150 tsens, its suggested to monitor the controller health
+ * periodically and in case an issue is detected to reinit tsens
+ * controller via trustzone.
+ */
+struct tsens_plat_data data_tsens_sm8150 = {
+	.ops		= &ops_generic_v2,
+	.feat		= &tsens_v2_feat,
+	.needs_reinit_wa = true,
+	.fields	= tsens_v2_regfields,
+};
+
 /* Kept around for backward compatibility with old msm8996.dtsi */
 struct tsens_plat_data data_8996 = {
 	.num_sensors	= 13,
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 7963ee33bf75..97f4d4454f20 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -991,6 +991,9 @@ static const struct of_device_id tsens_table[] = {
 	}, {
 		.compatible = "qcom,msm8996-tsens",
 		.data = &data_8996,
+	}, {
+		.compatible = "qcom,sm8150-tsens",
+		.data = &data_tsens_sm8150,
 	}, {
 		.compatible = "qcom,tsens-v1",
 		.data = &data_tsens_v1,
@@ -1135,6 +1138,7 @@ static int tsens_probe(struct platform_device *pdev)
 
 	priv->dev = dev;
 	priv->num_sensors = num_sensors;
+	priv->needs_reinit_wa = data->needs_reinit_wa;
 	priv->ops = data->ops;
 	for (i = 0;  i < priv->num_sensors; i++) {
 		if (data->hw_ids)
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 1471a2c00f15..48a7bda902c1 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -515,6 +515,7 @@ struct tsens_features {
  * @num_sensors: Number of sensors supported by platform
  * @ops: operations the tsens instance supports
  * @hw_ids: Subset of sensors ids supported by platform, if not the first n
+ * @needs_reinit_wa: tsens controller might need reinit via trustzone
  * @feat: features of the IP
  * @fields: bitfield locations
  */
@@ -522,6 +523,7 @@ struct tsens_plat_data {
 	const u32		num_sensors;
 	const struct tsens_ops	*ops;
 	unsigned int		*hw_ids;
+	bool			needs_reinit_wa;
 	struct tsens_features	*feat;
 	const struct reg_field		*fields;
 };
@@ -544,6 +546,7 @@ struct tsens_context {
  * @srot_map: pointer to SROT register address space
  * @tm_offset: deal with old device trees that don't address TM and SROT
  *             address space separately
+ * @needs_reinit_wa: tsens controller might need reinit via trustzone
  * @ul_lock: lock while processing upper/lower threshold interrupts
  * @crit_lock: lock while processing critical threshold interrupts
  * @rf: array of regmap_fields used to store value of the field
@@ -561,6 +564,7 @@ struct tsens_priv {
 	struct regmap			*tm_map;
 	struct regmap			*srot_map;
 	u32				tm_offset;
+	bool				needs_reinit_wa;
 
 	/* lock for upper/lower threshold interrupts */
 	spinlock_t			ul_lock;
@@ -593,6 +597,6 @@ extern struct tsens_plat_data data_8916, data_8939, data_8974, data_9607;
 extern struct tsens_plat_data data_tsens_v1, data_8976;
 
 /* TSENS v2 targets */
-extern struct tsens_plat_data data_8996, data_tsens_v2;
+extern struct tsens_plat_data data_8996, data_tsens_sm8150, data_tsens_v2;
 
 #endif /* __QCOM_TSENS_H__ */
-- 
2.35.3

