Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6AF77AE282
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 01:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbjIYXhX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 19:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjIYXhW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 19:37:22 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C54E12A;
        Mon, 25 Sep 2023 16:37:15 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-59f6041395dso54014937b3.1;
        Mon, 25 Sep 2023 16:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695685034; x=1696289834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr0k7lEx47CbWkSjN9jo/N618Kr1MJPmmWsGVOz1DDs=;
        b=eCx9yg1HA9UeZQfOXX8ktT33V/rFsyYl7wRcDuJKAs/otfdIXmtzmXMXT1xXZ+eHOx
         FBmOcctbHihvI3YytELtCfRF8mIBZhT4Pq+mte3+nPM4lyQRWxucGV4CaD4PmKDHvrC1
         dIY63gK5pPTBBgsWMFI1HEzN9yPolN7UVvcLjGwQhbEUYJdTQmkXoaWMr+A0NUTOv2uq
         ZpPseuynEcRuJLQHmhSZjKek/IByFX/TwNaUAnhMskC89lEL5qPXTTzxoVvDumNzQ24G
         Vx284DsnXtfnl9Luxa7+tnnFjRRZ3jaI82SIKuotvpvn3vwBJY/aD7NXaBgikjPt/N+n
         A1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695685034; x=1696289834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vr0k7lEx47CbWkSjN9jo/N618Kr1MJPmmWsGVOz1DDs=;
        b=W9VeTP1b2hvjSenbYs4tvKsBLwQZ7W5zo6OXahfOpd81i5R7WueYluLE+rO501MTl3
         x4/GQUDGvlKhjbVC7pbqPFgYliEhCNBx0mNOOfu/Ic+jbKUhpqde0bF0ZmZo9djgW/ml
         l+4OfTPNi3CGxTOUJlmfRKa8shUn3CP4DRG0faM7HlG97EhGyBIQdaaTr/HZOOooqqNW
         +dEImyU5Zdm7u49CKLdKMa+4egOqK6Qpzz3HrHM3JD81tzqO/yFVEYQmnfjQz3PmxMTZ
         tbllp6u5K2Sz6M9D7iH+Y84C+437wNyJceNnksbcRmO9ylXKVCoPbC26FuIsTzNjtbJN
         JHfQ==
X-Gm-Message-State: AOJu0YzvUb9yWnC6jy2PQSvP7M5DzBkzaW+DrxtQEka/nWbQzK4XxHMj
        RnZECSIt7r1B4zTZJHtLxKM=
X-Google-Smtp-Source: AGHT+IHRio6ekS8UQ4S4yKF/DX3yMmncgTHTK+rPvw8sao5gRtWxRA1N6cAht/s2dc5KXEunvj87/A==
X-Received: by 2002:a0d:d993:0:b0:573:30c8:6e1d with SMTP id b141-20020a0dd993000000b0057330c86e1dmr8468607ywe.44.1695685034522;
        Mon, 25 Sep 2023 16:37:14 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
        by smtp.gmail.com with ESMTPSA id c64-20020a0dc143000000b0059a34cfa2a5sm2638864ywd.67.2023.09.25.16.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 16:37:14 -0700 (PDT)
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
Subject: [PATCH 4/6] drm/msm: mdss: add support for SDM670
Date:   Mon, 25 Sep 2023 19:26:31 -0400
Message-ID: <20230925232625.846666-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925232625.846666-9-mailingradian@gmail.com>
References: <20230925232625.846666-9-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
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

