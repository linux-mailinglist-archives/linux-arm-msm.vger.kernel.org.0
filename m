Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 523FC65AB40
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jan 2023 20:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjAATkn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Jan 2023 14:40:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjAATkm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Jan 2023 14:40:42 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C14E1082
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jan 2023 11:40:41 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id m6so28506508lfj.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jan 2023 11:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MW0phKWlXpbBUcPLtblyJtyFj83QhXQn2uWltgLH9s=;
        b=K/vMnmFPEoP693iqYSFlxNIFxirPcbw/wqqmBE3eLksb2iOhBj7PB6WwPLMi6zuY3j
         EQ+wE+I9IekjASLCIrvnOixGz0qi0uucyu/KRXEcm6LvM/fYo7AxlH4X1QkGgmmPAP0+
         tTJPZdmzWhUqd7bRBgu8rTXHfbbh+5j1iwhZkr5NaFjOTrl1+Byx9p/1k1Hebfc77jo5
         3Gkv9+g/xbeL27fd1DyHoWs42mZoWk3pb7pRLpKAolnaFc6uBzW8IlbL61R0gG6TFWz6
         TSceKqzASE976cZ1AKM1sYtxvXRjjwDoK6qJ4HcWcRz7TDDP2If9KGWAjxgyscTwt1Ob
         800Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MW0phKWlXpbBUcPLtblyJtyFj83QhXQn2uWltgLH9s=;
        b=LZJQzKicCIe171cLQ1zuEyc2GWp1HHt/+mQyiiTVHfNkfio62JtAK0LT4uuoFeH9kV
         5IuqeUHIq6Pe5UII8SJPeftiQLu+OsP9Rot/zYaQlJpkn/RNJUZfid03/M5YfwbsO9dj
         MIKHCInk/QllAR2/dUz+43HewzHcAn45vtT8iVTUV7vpjvTUMnxaePnUmlEavc60PIbn
         v+afb7REChQjJ6zRZeOYp/KSr2PQ4qZxfQ3hZ0spmmSc0dig6qosc6B1k+TlDecLhnIP
         XBxzQxfAwg4IF2QZuVnAmVIl75XMv9DyhtMEOhB3p7B0i0geMpDw1nDs/d0558F7rwWd
         QUug==
X-Gm-Message-State: AFqh2kooDyCKVw4QV1q/TH6FTSSC8N9Xhl3849IqoTC8lRvIdNylOWdb
        U4w0mmv+zwKXkG/Aha0p+BiG3g==
X-Google-Smtp-Source: AMrXdXt2u58LDrUIgeOWm0spBNs/KsvzM4h25a2A/aKFETYpr5/ckl0VmDfJM/EOHSYQMfyve4jQ4Q==
X-Received: by 2002:a05:6512:3a8f:b0:4c8:5f19:ccb8 with SMTP id q15-20020a0565123a8f00b004c85f19ccb8mr11769465lfu.48.1672602039566;
        Sun, 01 Jan 2023 11:40:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w11-20020a056512098b00b004a100c21eaesm4228013lft.97.2023.01.01.11.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 11:40:39 -0800 (PST)
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
Subject: [PATCH v6 04/20] thermal/drivers/tsens: Drop unnecessary hw_ids
Date:   Sun,  1 Jan 2023 21:40:18 +0200
Message-Id: <20230101194034.831222-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230101194034.831222-1-dmitry.baryshkov@linaro.org>
References: <20230101194034.831222-1-dmitry.baryshkov@linaro.org>
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
2.39.0

