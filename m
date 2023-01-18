Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F46B670F9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 02:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjARBKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 20:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjARBKO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 20:10:14 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D4539CD9
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 17:04:33 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id bk15so22088656ejb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 17:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4s4Hwtg2zYGRteABpg2Gt7N6Et+C29koIoHOiolG/j8=;
        b=SITs6oBbmLzfxfyTHpwwYvqgEH1kGNSx0Bt5aSGM1cdMyui3dGi9EIGJgWkYYsiiCh
         Q0j2jHoFS4UPpFDkEgSqQu5lxPICMX114cDAH5R/uAkz0B/g5R/iz1XwZMfmFCSkrHWZ
         o2PuJw/4VgL3bRnb4BQTvsFTUwkkVoLD1H85FDTiKHWzu8ajoDWNC9H48CtE+Pq0Y/nQ
         hXJT5tlSX2Yc5aesjwiP/Q6slW8kDNlwFOwvqVI3k/FaJm/4IgLHV2T1gqyFtI6Ym5Gr
         oIdYJUToNeYnFnCvCvxl7/drWJa+7Jqu9mLDm1rFkjsOAueE/as7RLEPk8gMope8zPxH
         X/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4s4Hwtg2zYGRteABpg2Gt7N6Et+C29koIoHOiolG/j8=;
        b=shOtM/kBH1eZfNgPNsjyJsLzySKmZQ8oZvYcw7cmd7z0yEvOIuv0TM9rXgt5/sbpcB
         PIBnrtW8QryrNgPdAwzM/roXJ0GW7dFJ+7DEFx6Vh4PnAF6NPFUcRVVbPK47RVfrTvRJ
         OgW1wxOIKy0NLNmYjK3fEv53G8QuEM04EHwK75SGKMciIKAhNWQ+idvmivZAWJzSkzdz
         e6F0SncUYooMu0L6t9waBW9FqvvSNCrTG8C7oHhJ89vpwXUIZ1zhVk3heh7ypJTdKZdG
         Ff2HEVmfohW0/PZ04/KLNraBA+fCAhAyFkuKLrKsrMlINLrMHhBOoccbKTTtLWFn7IY6
         WN0w==
X-Gm-Message-State: AFqh2koXBQcuCCV2MOQBOJ7Pa1+MQ3C+stSskliL59SSWq9Hv7EeS/3a
        EEbQuvAq+5z7IlE9nQn19hQQoQ==
X-Google-Smtp-Source: AMrXdXsv0EgCBY0a12ywp5+iQzl/7G+zgNe1C7etzL0Agtyn5lAz/myJB5ungktF2MxZmCKeqhm7nQ==
X-Received: by 2002:a17:907:a092:b0:876:9069:3fce with SMTP id hu18-20020a170907a09200b0087690693fcemr1099984ejc.72.1674003871821;
        Tue, 17 Jan 2023 17:04:31 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090609c100b007e0e2e35205sm13988953eje.143.2023.01.17.17.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 17:04:31 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/msm/mdss: add data for sc8180xp
Date:   Wed, 18 Jan 2023 03:04:27 +0200
Message-Id: <20230118010428.1671443-3-dmitry.baryshkov@linaro.org>
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

Add platform data for sc8180xp based on sdmshrike-sde.dtsi.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 799672b88716..158d7850c4ba 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -516,6 +516,13 @@ static const struct msm_mdss_data sc7280_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sc8180x_data = {
+	.ubwc_version = UBWC_3_0,
+	.ubwc_dec_version = UBWC_3_0,
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+};
+
 static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
@@ -555,7 +562,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-	{ .compatible = "qcom,sc8180x-mdss" },
+	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
 	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
 	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
-- 
2.39.0

