Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7866588E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 04:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233067AbiL2DBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 22:01:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233098AbiL2DBQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 22:01:16 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2386E6413
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 19:01:14 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bq39so18123614lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 19:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeGFs4GcccqXZZZCB7yNyRaa7FgNL2v1qzsFkPqUUwY=;
        b=IY8GKRbc02QpUWDxiPwqhyew28kwMI+pGaGyJJPOtrGZAjt08SkNXnxHUzs566D/YE
         TgHQefvpsa/lJ/FlXKrgxqCzUg8N1QHa0h187cWqACvqiDRBWXNkhgNr4LBqMACU1es2
         SGYw3JQeZDoKX6IDvQQnmJV1u++xmTkQJ+4BMvAzuf+UgOihHsMFjLQw1qiqPzMtc95a
         W2NcU+ycRdn79A6E83TknYoYxeF4aaJpZQAFGlMAQIEWl69Iid/CQkv4ktmF8UemUiWx
         yL7grgXNVKa3VCyierDqfjfDsNdQqSG0MkBxIx0H6lZWvnueywhP9gFv3fcQEFpIXBKq
         7FzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeGFs4GcccqXZZZCB7yNyRaa7FgNL2v1qzsFkPqUUwY=;
        b=WmE5jBRrq2kjsDIS0SoQmYHiJdK5/60LLv15x37hQHdQHTlsOmvQzCiRZ9nna2tnqf
         pTEjOAA5kunG2kpsbdi8CeC5vFykz10ZpjwpGsSC5miRKjmX8VC1TcrGRsOmijHTtLm7
         EZ+/yjjcRimNXYGgp7aABNW09C7NowpbFxuDxiVzdQrvjXV8QoT9B+zoIHgpd7tdPj6M
         NLObgJJwUjkKYRFUqXDl3dZzxP9ts4yZSWt4YIRAMiZLxBc7iNEbxkJY4cWPBF1JO0qS
         42QBhdYyVqfkn/E2/Kgiz/Yayhpkq7oRPcCD4++iofFJ31rWImfOAOb/KgR7U0dcWuhA
         rtVA==
X-Gm-Message-State: AFqh2krTPNsa0npeqk6XZbfvz/+Eg2MGbYbJ7NJzezYe0P4KIBWxK3ZC
        1Uu4Yo6mkHI1O1xU9TDo7H2q/Q==
X-Google-Smtp-Source: AMrXdXtiO6W21w+AYHtJnGTvI/eByd06WfOIER1gi2QpxfOu+QHngmE7y5v+LRDcDDa1UQfjZiNZNA==
X-Received: by 2002:ac2:4f13:0:b0:4b6:f3b3:fe14 with SMTP id k19-20020ac24f13000000b004b6f3b3fe14mr7319624lfr.1.1672282873703;
        Wed, 28 Dec 2022 19:01:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512024b00b004b57277474esm2883070lfo.106.2022.12.28.19.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 19:01:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 07/20] thermal/drivers/tsens: fix slope values for msm8939
Date:   Thu, 29 Dec 2022 05:00:53 +0200
Message-Id: <20221229030106.3303205-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229030106.3303205-1-dmitry.baryshkov@linaro.org>
References: <20221229030106.3303205-1-dmitry.baryshkov@linaro.org>
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

According to the vendor kernels (msm-3.10, 3.14 and 3.18), msm8939
uses non-standard slope values for calibrating the sensors. Fill them
accordingly.

Fixes: 332bc8ebab2c ("thermal: qcom: tsens-v0_1: Add support for MSM8939")
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Shawn Guo <shawn.guo@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens-v0_1.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
index 0bc4e5cec184..6645c98ff56c 100644
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -534,6 +534,21 @@ static int calibrate_9607(struct tsens_priv *priv)
 	return 0;
 }
 
+static int __init init_8939(struct tsens_priv *priv) {
+	priv->sensor[0].slope = 2911;
+	priv->sensor[1].slope = 2789;
+	priv->sensor[2].slope = 2906;
+	priv->sensor[3].slope = 2763;
+	priv->sensor[4].slope = 2922;
+	priv->sensor[5].slope = 2867;
+	priv->sensor[6].slope = 2833;
+	priv->sensor[7].slope = 2838;
+	priv->sensor[8].slope = 2840;
+	priv->sensor[9].slope = 2852;
+
+	return init_common(priv);
+}
+
 /* v0.1: 8916, 8939, 8974, 9607 */
 
 static struct tsens_features tsens_v0_1_feat = {
@@ -599,7 +614,7 @@ struct tsens_plat_data data_8916 = {
 };
 
 static const struct tsens_ops ops_8939 = {
-	.init		= init_common,
+	.init		= init_8939,
 	.calibrate	= calibrate_8939,
 	.get_temp	= get_temp_common,
 };
-- 
2.39.0

