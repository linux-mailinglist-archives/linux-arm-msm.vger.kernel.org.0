Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33F97652B2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 03:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234357AbiLUCF3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 21:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234172AbiLUCF0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 21:05:26 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43BE91F9F9
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 18:05:25 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id y25so21336885lfa.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 18:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BDbnJ/AZBuA08A97uDDUpTRd6b7HncteZoPe22xbWk=;
        b=ZdTi0XhuCiiXAgq6dHlIWCmu1AoS9qcUq0MNJ418/Sr1cafTa6j0/n0glctSoz7LYq
         TYkboYI/kCl5PnKdi5la8pFB8/dYlGucIXx94J1ShzuCkbklIwvTPWT6p569geWmTaTT
         b6FPI95GdQGxRWPOSJPkXqO8Zh/WhI7yymOwdym3K84Gxq0P5S1Johax1Jp9RDh0hXtx
         ic2+Zd9o/wyENgfkPB6HIQImfEX9/wA6l03176JsVAzg+NGgJxy7uoDeLc5UMaeO2VVy
         KgPkS8ohTky/fT1VeNEHuJIMK/qwjDzSuxTmZHHlFEl4s/nqHbs5uYsG2k6Ep5BVnRGy
         VEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BDbnJ/AZBuA08A97uDDUpTRd6b7HncteZoPe22xbWk=;
        b=sQohTQeI9qpxmp0OgBYqg0ECfAtCz0cdvwIm+rgVUu/HK3/2XLkMD9AcGmJ4vPlKUJ
         bHc8yj68a1dnKBCp2ElaORW4RjMM4Ahe1rzQFXRIRbFohDaljiAZziccH3JBHKgDZ9e0
         R4KmThEE+CdHquSKFfUpBuoTksoci8wKIxLkSIJMOH4gHn5xiyYpvDPW80ZRBkicxC+Z
         MrijAiTwheV50xD5vTA7NekjN+ayc68Ykj+VcA7ROMUmCZzpnn9sXw+JUCHnj8qYjsi3
         hAjbHRnWsEi78U3GdYmvJqLP5FcKX4+PsQQvVsvxjncG6W4TucxeM/m01exZRRY5s8LQ
         pd3w==
X-Gm-Message-State: AFqh2kqtUfVSPzgNP7mEC1YVr7ZgBAP1a40FS0bVtByenYZA7xX0zFvO
        3ws02Hn9JODn+xrPfHG1PkjReg==
X-Google-Smtp-Source: AMrXdXvt3hfDIJwKmRU97dWmM3fPc6GmAA6jUbygzBLsqEWTIi8KOyIulOt/ObfTB7MGsy5rFDyaWw==
X-Received: by 2002:a05:6512:3e18:b0:4b5:5ceb:3caa with SMTP id i24-20020a0565123e1800b004b55ceb3caamr90348lfv.19.1671588324854;
        Tue, 20 Dec 2022 18:05:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q18-20020a056512211200b004b257fef958sm1673048lfr.94.2022.12.20.18.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 18:05:24 -0800 (PST)
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
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 04/20] thermal/drivers/tsens: Drop unnecessary hw_ids
Date:   Wed, 21 Dec 2022 04:05:04 +0200
Message-Id: <20221221020520.1326964-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221221020520.1326964-1-dmitry.baryshkov@linaro.org>
References: <20221221020520.1326964-1-dmitry.baryshkov@linaro.org>
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

The tsens driver defaults to using hw_id equal to the index of the
sensor. Thus it is superfluous to declare such hw_id arrays. Drop such
arrays from mdm9607 and msm8976 data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens-v0_1.c | 1 -
 drivers/thermal/qcom/tsens-v1.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
index 04d012e4f728..0bc4e5cec184 100644
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -635,7 +635,6 @@ static const struct tsens_ops ops_9607 = {
 struct tsens_plat_data data_9607 = {
 	.num_sensors	= 5,
 	.ops		= &ops_9607,
-	.hw_ids		= (unsigned int []){ 0, 1, 2, 3, 4 },
 	.feat		= &tsens_v0_1_feat,
 	.fields	= tsens_v0_1_regfields,
 };
diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index 1d7f8a80bd13..96ef12d47bff 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -387,7 +387,6 @@ static const struct tsens_ops ops_8976 = {
 struct tsens_plat_data data_8976 = {
 	.num_sensors	= 11,
 	.ops		= &ops_8976,
-	.hw_ids		= (unsigned int[]){0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
 	.feat		= &tsens_v1_feat,
 	.fields		= tsens_v1_regfields,
 };
-- 
2.35.1

