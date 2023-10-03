Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC267B5E94
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Oct 2023 03:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjJCBVw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 21:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238962AbjJCBVw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 21:21:52 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B043BF;
        Mon,  2 Oct 2023 18:21:48 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-77433d61155so30986985a.2;
        Mon, 02 Oct 2023 18:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696296107; x=1696900907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr0k7lEx47CbWkSjN9jo/N618Kr1MJPmmWsGVOz1DDs=;
        b=kCznV8TPEgLmXve8/7+I/ltnNFduaqN1vabLNjAvA0oltQVvZWynS4F6+Us1wgu6pI
         G+S7TKG4ujXnuKLs2nkTb9JibFXY0rqRWJkuCN2GA16Hoal3zftiSsUaHiDBDaY+p0Z1
         X3CrlKhajyanKDQ0PiOAfEg3MrwJ1q8t+PvCsL3YVyHHKwPWKwkMJNp1Jx1XetvdVbGd
         xEavnpYN9EqG0xLvfFcXZwEZaAgYEYRIEzHwCxQ+7Nmmx2eB+/nzy0cMC+RN8F/J9sLm
         qftvdEpiGDIi+HQG/CZjKCR2wGelymm2zdyEts5G70xI47Zrv9g4zbvP7+RYwThNuKVo
         fa8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696296107; x=1696900907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vr0k7lEx47CbWkSjN9jo/N618Kr1MJPmmWsGVOz1DDs=;
        b=oaiJr4q/Z5jercUy+y1cFFstdtYtJDf2fATH8SmJh5Ih0054slIImJLiJGZZPkSk02
         rx2/2/McgwuefHTzTzLYQohC930Yes09MWzmUqWag0NIroz6B1E6WX4yjXYOKVLP5br6
         4cm6UxG6l5ywklphMsCD3WIUJMzF/VRxUmigYBBig6tfnof4xMlGU+SXw7u9TWmT7U7c
         6YejTtCwhIMdOjPlVKyN7xpOk1kDyJETLXggMAYmNTJQ+y0URhAexbL6WprMbDopbmQu
         U0YgT4RqAlKq73EGushImXz+pm/CTTFyceU8gVwA08yWFTDXymO2WI6XCULobVUFKAiR
         s2fg==
X-Gm-Message-State: AOJu0YwfuxPpCCFUHeY4HObO0CFGHGFqLrbFviEWzC4XMNwz9EG6xyxq
        aFjWrGLJqAWHyVqGndTT6LE=
X-Google-Smtp-Source: AGHT+IFF8qyY7+L9sM9KLSnsmyzF8Ie9tiJr1eGJkFaGi75OW1rpZbtS0kn/hsUEIvrQ8PjzacqFoA==
X-Received: by 2002:a05:620a:b5b:b0:774:17f5:471e with SMTP id x27-20020a05620a0b5b00b0077417f5471emr12132412qkg.46.1696296107644;
        Mon, 02 Oct 2023 18:21:47 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
        by smtp.gmail.com with ESMTPSA id d1-20020a05620a140100b0076dacd14484sm49291qkj.83.2023.10.02.18.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 18:21:47 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 4/6] drm/msm: mdss: add support for SDM670
Date:   Mon,  2 Oct 2023 21:21:25 -0400
Message-ID: <20231003012119.857198-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003012119.857198-9-mailingradian@gmail.com>
References: <20231003012119.857198-9-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the MDSS block on the SDM670 platform.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2e87dd6cb17b..2afb843271aa 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -551,6 +551,12 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sdm670_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 1,
+};
+
 static const struct msm_mdss_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -609,6 +615,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
+	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-- 
2.42.0

