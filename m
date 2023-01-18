Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6CD670FA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 02:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbjARBK4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 20:10:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjARBKO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 20:10:14 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558783524C
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 17:04:34 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id kt14so20700054ejc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 17:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2AT9KHC4pUGTo4hjZu7eOwD5Wo5qB72fPWxQDAYAOU=;
        b=AT1Pog3PcNorxTSf251HHthQzeLgINleh4Jm7oHRlPpYH46sS0Q9oNfI68pErWMRG6
         /q7+OS1uKFtcOdefn/Kjyolkv62aWR1x/RBGZCTuDeJzu4VJvnjwlnRhgs0q5SI8TJeO
         gmUCY1vVe+E0kJ8zmn4ZfS/xmDUew6CofUd9M9IrgmAsLSXznbzj0DyVDQFCYzY4koHH
         teGSYAXgu++y0E42dA6+39ASkg1ycXfRXfcLDKRNYPnYLm4u8fQDTyEp/qtOVI+Z0bDw
         qj7XJgi2NennnXnJhsLJCJUao89TzxZqSG1dXjX6mAopTlsURaVetzCrZ0eNuH/RDWJv
         zq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2AT9KHC4pUGTo4hjZu7eOwD5Wo5qB72fPWxQDAYAOU=;
        b=La7hd7OYf20/acIpy0qxEs0/BT8V0tV10y0FlSqBYzw4YZXGTLSPLcpTyTpQzaRyo9
         RuZYVp4Yc8TgtzqSD2jXAXnV7oPIkXgUhVcOaeG/usqgQvbhoQ/GA0Q5PIkudOgAUZYK
         L8LOlt2cunD5uyggH5npFrpiCjzspByhetybGfsFFhbYf+GVj6KiYT/g2yQ4Lhq81i2o
         yQGl2XurtsGhJhmZpZLluhl9kWqm/ZvhJMfjecHQiXDABpQI6RIXqzPFmH8Ii2BZCnpX
         1uxS2BgGDkgqgg/++yngP9dIVfOeGgUNW0rgF76kJzj8Va0lcq/zGvSklJ6nTi2tjMdN
         hrMA==
X-Gm-Message-State: AFqh2kpjLCjwySYMVMRQRwfTpXuJOEyUWVrJ6PWi6VGKJMdhhJXCvthz
        7LWGF0rrC6x9HO14/yQJBGKH1g==
X-Google-Smtp-Source: AMrXdXv/DJl6VMwscZYu1N4Y0oWY34Lil+ABtbQJSPHsIb6SSMQ41aYxuz+VnhkOiNw6WUGvnwkCNA==
X-Received: by 2002:a17:906:1911:b0:870:29fd:be41 with SMTP id a17-20020a170906191100b0087029fdbe41mr1043765eje.48.1674003872748;
        Tue, 17 Jan 2023 17:04:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090609c100b007e0e2e35205sm13988953eje.143.2023.01.17.17.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 17:04:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/msm/mdss: add the sdm845 data for completeness
Date:   Wed, 18 Jan 2023 03:04:28 +0200
Message-Id: <20230118010428.1671443-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
References: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
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

Add the platform data for sdm845 platform.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 158d7850c4ba..c15d1e2dc718 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -532,6 +532,12 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sdm845_data = {
+	.ubwc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 2,
+};
+
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
@@ -559,7 +565,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
-	{ .compatible = "qcom,sdm845-mdss" },
+	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
 	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
-- 
2.39.0

