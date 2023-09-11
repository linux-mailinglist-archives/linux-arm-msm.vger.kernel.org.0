Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1BFE79B6E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344191AbjIKVNb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241643AbjIKPLJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 11:11:09 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92888E5F
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 08:11:02 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52f3ba561d9so3788030a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 08:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694445061; x=1695049861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=116M1Uf4FxkGVcXqN1wBq1UncYtXwEEG2hN8+ByRx2U=;
        b=Z+Rk4WRCrsSSqttXHrfsPbU2dGv0kPljBb16JEutqFxIf+yVBmWSrpttdE5mUXy7ZO
         VqUO65FbRH3ib2FzEsmqJTetjhaMxe8doFOOXVCSfBI9Z8xqpq3GRxWvEus42o1FtA3m
         SkcG+GtRyqhg9HqsoA6NpOj0PrHVY6wO8ts8qpYszaSG3U1XLL+laULKRXqnzPS91gYZ
         JbzbmVzc9H3xfJLFdUVKspXGTBloFezXxlncrjv4MBFqwde/OkbLPZirHeXepDIx69LZ
         RUIc+TN/gKy0lLm4hm9aoKHM8agLxXCg9g4TKNhyETeIWx5R4SKbskROhTZoAoNjuslV
         UG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694445061; x=1695049861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=116M1Uf4FxkGVcXqN1wBq1UncYtXwEEG2hN8+ByRx2U=;
        b=uCQvmIbmBJ4gBc+Qs+VoZ7FLE7ecgaUSDBUU7DZmdk/HTgVxDFXM0/quYs0c7EgZZC
         Krf6YJqwqXkYhPk7EEekaYILd7FAAiPvVQs2362DZdQ3Jbvy8vw8CdLhxCiWx4Z0Fmbr
         LCkwE+gnIxK/TPsaGwrZKokEJtqHk0VCORdOHsa5Mwj3eyG9DlYvl3Wy69cGH6/nDMlQ
         R94P7lrpybLmKSyHpZiU3ejvf2gr0hVlIseig06ZigIBjcOQ7wXi7j7EAQ87AGbQevL4
         0aITTnh6zjGj9yANMkoX/EjeBLfd3h+tRSRqqAdKm1UZpHJqj8PIA8NVBIS+4B0cAbna
         gKkg==
X-Gm-Message-State: AOJu0Yw4ShJIGcvtEgANiIALzG1jeM58ZqsnhiToEhprQJ3t2zNzOXlC
        zP5m7xAroYNWkaFfhzleWHF7uA==
X-Google-Smtp-Source: AGHT+IEvvAGK6lqIPwjV7PEMM+tywxepjWAX/NQ/dlwbyxSX9kJBmKg9i02x5I20YkqjdqPrl/H/Hw==
X-Received: by 2002:a05:6402:124f:b0:525:8124:20fe with SMTP id l15-20020a056402124f00b00525812420femr14949632edw.18.1694445061156;
        Mon, 11 Sep 2023 08:11:01 -0700 (PDT)
Received: from [10.167.154.1] (178235177061.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.61])
        by smtp.gmail.com with ESMTPSA id n4-20020a056402060400b0052a3ad836basm4681281edv.41.2023.09.11.08.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:11:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 11 Sep 2023 17:10:32 +0200
Subject: [PATCH RFT 18/20] media: venus: pm_helpers: Commonize getting
 clocks and GenPDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v1-18-a7d38bf87bdb@linaro.org>
References: <20230911-topic-mars-v1-0-a7d38bf87bdb@linaro.org>
In-Reply-To: <20230911-topic-mars-v1-0-a7d38bf87bdb@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694445027; l=3351;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9AKWBnlvj+Q6WSygovq46dA98O8B8twaOC1bOaWKQLA=;
 b=laMrLpKy/LbvHFS/2/vbvWUy7x94OHugyBeOVM5X6pDzlPuwylz6rzNcHKYsAIXhTmLLk01xT
 kB9YPsDJwwxDP0sYjSuG/sAqkJOojLShhcDAUhZpqAzpWIXt8wnZ0TP
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As has been the story with the past few commits, much of the resource
acquisition logic is totally identical between different generations
and there's no good reason to invent a new function for each one.

Commonize core_get() and rename it to venus_get_resources() to be more
meaningful.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c       | 8 +++-----
 drivers/media/platform/qcom/venus/pm_helpers.c | 5 +----
 drivers/media/platform/qcom/venus/pm_helpers.h | 3 +--
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 42bfcef9449a..e8a16355d39e 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -337,11 +337,9 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (core->pm_ops->core_get) {
-		ret = core->pm_ops->core_get(core);
-		if (ret)
-			return ret;
-	}
+	ret = venus_get_resources(core);
+	if (ret)
+		return ret;
 
 	ret = dma_set_mask_and_coherent(dev, res->dma_mask);
 	if (ret)
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 741b29cc76c9..6e282a69c7c5 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -326,7 +326,6 @@ static int load_scale_v1(struct venus_inst *inst)
 }
 
 static const struct venus_pm_ops pm_ops_v1 = {
-	.core_get = venus_clks_get,
 	.load_scale = load_scale_v1,
 };
 
@@ -395,7 +394,6 @@ static int venc_power_v3(struct device *dev, int on)
 }
 
 static const struct venus_pm_ops pm_ops_v3 = {
-	.core_get = venus_clks_get,
 	.vdec_get = vdec_get_v3,
 	.vdec_power = vdec_power_v3,
 	.venc_get = venc_get_v3,
@@ -926,7 +924,7 @@ static int core_resets_reset(struct venus_core *core)
 	return reset_control_bulk_deassert(res->resets_num, core->resets);
 }
 
-static int core_get_v4(struct venus_core *core)
+int venus_get_resources(struct venus_core *core)
 {
 	struct device *dev = core->dev;
 	const struct venus_resources *res = core->res;
@@ -1114,7 +1112,6 @@ static int load_scale_v4(struct venus_inst *inst)
 }
 
 static const struct venus_pm_ops pm_ops_v4 = {
-	.core_get = core_get_v4,
 	.vdec_get = vdec_get_v4,
 	.vdec_put = vdec_put_v4,
 	.vdec_power = vdec_power_v4,
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.h b/drivers/media/platform/qcom/venus/pm_helpers.h
index 3014b39aa6e3..7a55a55029f3 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.h
+++ b/drivers/media/platform/qcom/venus/pm_helpers.h
@@ -10,8 +10,6 @@ struct venus_core;
 #define POWER_OFF	0
 
 struct venus_pm_ops {
-	int (*core_get)(struct venus_core *core);
-
 	int (*vdec_get)(struct device *dev);
 	void (*vdec_put)(struct device *dev);
 	int (*vdec_power)(struct device *dev, int on);
@@ -28,6 +26,7 @@ struct venus_pm_ops {
 const struct venus_pm_ops *venus_pm_get(enum hfi_version version);
 int venus_core_power(struct venus_core *core, int on);
 void vcodec_domains_put(struct venus_core *core);
+int venus_get_resources(struct venus_core *core);
 
 static inline int venus_pm_load_scale(struct venus_inst *inst)
 {

-- 
2.42.0

