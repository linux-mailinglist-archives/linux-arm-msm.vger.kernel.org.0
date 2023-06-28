Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDDB741355
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 16:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232330AbjF1ODK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jun 2023 10:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbjF1OBr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jun 2023 10:01:47 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75822D66
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 07:00:58 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f86fbe5e4fso8125076e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687960857; x=1690552857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlJNXwesiBvinVlCm08BsBVW76YCVdXRX2U7PUbcI/o=;
        b=wjXkcSOYLCmNXkLjTYyrJOKHBDMmFwmDnRDK0j1pFPFRb1ZM/pt7ICV1ZebjyLN71N
         hq4pmTJa7jqZGdNawj771dofrzaTLkJ4loY1+LX9R13tNYzcLaGRb5YW5c0Xh3ZV7X95
         ibGz3ChPD290BemGem64XqAnYUTVOuy4z/3SvgN7QONaWMfX3TF9dpVFuoA4JufA3CgI
         wq486zch/B2BIFDGr/qZPWk6mFjbn1XH7DO1CDBzb5/MMoJrNFRYw2QKOvRBtzDG7wEB
         04Hyx86s5pNRkQU258oxnYYiyMH5Hd3e3NJQwYH4YIqCcgWraub7tHvITlRmaAwVF2NO
         yOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687960857; x=1690552857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlJNXwesiBvinVlCm08BsBVW76YCVdXRX2U7PUbcI/o=;
        b=eZj5Y2REZtq+wnxy1I6VRPgl6Lm5oiAgAdVvq28qEJfqa/lLu1R5lALA4/UNra1oUH
         ooNkTwWopykRBx2GAZkg/y5hWqpxe90jDfN+3BKANlJsFsgcqYvWQ3Mxh7fnJXWzmby9
         NoeAoYjv3O2XO+SGXYzxFQKJaMB9CPXNjPMP/+F9GcHNPFX9yFtzdmohR+l8kQ9NWeIn
         nhOQg6+07ms0t6xoiYBU8+rbx3ywmyfdagQBxjnpPKgHfuyoJv/0notdWyjFx7in6vpg
         RD55rMSfpOU1U/DuC5WhvB60AQiDYGSn8oZ8qMGNB5Y3If1IvRMAiT6sr5TEcGR2xE6x
         GLcA==
X-Gm-Message-State: AC+VfDxV0wnyHuQ9XjVstFOx0Zzo+D0zFE+03rDx+bvvCTKdl+9P2T44
        Vouy56Ur2sfhGDTUhmI+ztelVg==
X-Google-Smtp-Source: ACHHUZ7yT8Jw3pDsVThrqmK0kpEKhx9e/rvSkg6RIp6j5ca60U3Pv7Uf54QDj307JCQasPBlNzl/Gw==
X-Received: by 2002:a05:6512:2314:b0:4fa:21d4:b3ca with SMTP id o20-20020a056512231400b004fa21d4b3camr8000519lfu.2.1687960855394;
        Wed, 28 Jun 2023 07:00:55 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
        by smtp.gmail.com with ESMTPSA id w2-20020a05651204c200b004f8586ab633sm1941359lfq.279.2023.06.28.07.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:00:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 28 Jun 2023 16:00:45 +0200
Subject: [PATCH v12 06/10] soc: qcom: cpr-common: Add support for flat fuse
 adjustment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230217-topic-cpr3h-v12-6-1a4d050e1e67@linaro.org>
References: <20230217-topic-cpr3h-v12-0-1a4d050e1e67@linaro.org>
In-Reply-To: <20230217-topic-cpr3h-v12-0-1a4d050e1e67@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <nks@flawful.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Robert Marko <robimarko@gmail.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687960842; l=2032;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=PZkzlg9a1T62vJjNL6pym3+YcX1sRFAyVy3l058FxdA=;
 b=CyanBX6AWB/zukL+HolgU51mINIbt7hEOwCypuhVvimrPxwU46e7Yvm1wDX8Boj8j51vy/o4h
 a6uaPnYmV3NAKdMOR/wzDdlKRIUuYDrosGEBoxAFTaWXS38KH0cDGeS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

CPR3 makes use of post-calculation flat value adjustments. Add the
necessary bits to the common functions to support it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
[Konrad: separate this patch out of a bigger one]
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/cpr-common.c | 9 ++++++---
 drivers/soc/qcom/cpr-common.h | 1 +
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/cpr-common.c b/drivers/soc/qcom/cpr-common.c
index ea85f6b4bef8..44c681bbbf13 100644
--- a/drivers/soc/qcom/cpr-common.c
+++ b/drivers/soc/qcom/cpr-common.c
@@ -49,7 +49,7 @@ int cpr_populate_ring_osc_idx(struct device *dev,
 EXPORT_SYMBOL_GPL(cpr_populate_ring_osc_idx);
 
 static int cpr_read_fuse_uV(int init_v_width, int step_size_uV, int ref_uV,
-			    int step_volt, const char *init_v_efuse,
+			    int adj, int step_volt, const char *init_v_efuse,
 			    struct device *dev)
 {
 	int steps, uV;
@@ -67,6 +67,9 @@ static int cpr_read_fuse_uV(int init_v_width, int step_size_uV, int ref_uV,
 
 	uV = ref_uV + steps * step_size_uV;
 
+	/* Apply open-loop fixed adjustments to fused values */
+	uV += adj;
+
 	return DIV_ROUND_UP(uV, step_volt) * step_volt;
 }
 
@@ -119,8 +122,8 @@ int cpr_populate_fuse_common(struct device *dev,
 
 	/* Populate uV */
 	uV = cpr_read_fuse_uV(init_v_width, init_v_step,
-			      fdata->ref_uV, step_volt,
-			      cpr_fuse->init_voltage, dev);
+			      fdata->ref_uV, fdata->volt_oloop_adjust,
+			      step_volt, cpr_fuse->init_voltage, dev);
 	if (uV < 0)
 		return uV;
 
diff --git a/drivers/soc/qcom/cpr-common.h b/drivers/soc/qcom/cpr-common.h
index 1f2ebf9394cf..0aa227617d2f 100644
--- a/drivers/soc/qcom/cpr-common.h
+++ b/drivers/soc/qcom/cpr-common.h
@@ -22,6 +22,7 @@ struct fuse_corner_data {
 	int ref_uV;
 	int max_uV;
 	int min_uV;
+	int volt_oloop_adjust;
 	int max_volt_scale;
 	int max_quot_scale;
 	/* fuse quot */

-- 
2.41.0

