Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B15695FE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 10:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbjBNJzM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 04:55:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbjBNJys (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 04:54:48 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E1D1284C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:54:44 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id qw12so38700805ejc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alcmQEv21lf+ZQxfpXql4sGdLArmHdHiJ6Fsno5k1fs=;
        b=J8CiysRGB/U8cQz2Di2tXKgm2Ue5izuOlZRhd6dr/iapz7cZ16ru/pOfBojJf2beLw
         0xHbu+jBA7BsSBdXgTJXVUajvNRkruOvY2Y9Z3CgMc6NH7zCGYBtKWWDl87ouXHq3wAU
         JK6u+wIOxqZiFr9J42aXYwzrdrHI7M1L1hqobIPr8DOl1BTIgLYUjniOhFpO4TcmEXph
         W3W6acRqUE3ZzB5KUI2ediLyVknVhOdvBwD3rup1ZxzdBgE0aruse+CTAQDroiB9Cy2H
         LtYHv9dmKNnJCg0yIHsxJAgtn2ITy6GjSEcF864iMFbc0p1KeVikpXBe9IR8p1GamMKK
         lIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alcmQEv21lf+ZQxfpXql4sGdLArmHdHiJ6Fsno5k1fs=;
        b=Zo+eVmfj7DzrdGtYq/yQ+rM1lYHYQjKyhfG1ebUEqHfLHP3F2bHMe4sUKJ6KwPxbay
         siiBwcDpSz34Grqbi6XGkaCksRWpSFMCI42ESnib+rVxDj7yDjCFGnE4kqOGHoEXSOit
         DoKKQbV5wnQ8UKg6b+KpKkIiJyYLHs4Ua9WPIZQX8+83nH3LD8Decj6gYYHqMuI7HDgT
         8xiushbuAB8HquT6SoAVPZtIfAVirohE+hu8k7c6LXgornM1YlUiOUrEq0h28rg8OlSM
         GYpyvDZDXiGLYk3Xb5Zy5w2GZUME5I5T/3iFmRNrYoD9r21W4EmqhrYm55/jHtU+l8wv
         NKFw==
X-Gm-Message-State: AO0yUKXN5BoZqt2030H+TVXfOb3V7pUYECfo81OhPmv/IqoRVcYqakmO
        3T4OECC+LxUuk2mq2yCxvd1XgHdAI8nfd7JF
X-Google-Smtp-Source: AK7set9q/cmcEHxQE8q3AiywfiC8gQc8b3df4TiaWgDC5ILVp9odxVZqfVBhrWX4M64PD6sOQqKvvA==
X-Received: by 2002:a17:906:33ca:b0:864:223:40b with SMTP id w10-20020a17090633ca00b008640223040bmr2954742eja.33.1676368482998;
        Tue, 14 Feb 2023 01:54:42 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906038c00b0088f464ac276sm7936172eja.30.2023.02.14.01.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 01:54:42 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] soc: qcom: rpmhpd: Add SA8155P power domains
Date:   Tue, 14 Feb 2023 10:54:34 +0100
Message-Id: <20230214095435.2192153-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214095435.2192153-1-konrad.dybcio@linaro.org>
References: <20230214095435.2192153-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the power domains exposed by RPMh in the Qualcomm SA8155P platform.
Turns out they differ from SM8150.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/rpmhpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index f20e2a49a669..63c35a32065b 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -342,6 +342,21 @@ static const struct rpmhpd_desc sm8150_desc = {
 	.num_pds = ARRAY_SIZE(sm8150_rpmhpds),
 };
 
+static struct rpmhpd *sa8155p_rpmhpds[] = {
+	[SA8155P_CX] = &cx_w_mx_parent,
+	[SA8155P_CX_AO] = &cx_ao_w_mx_parent,
+	[SA8155P_EBI] = &ebi,
+	[SA8155P_GFX] = &gfx,
+	[SA8155P_MSS] = &mss,
+	[SA8155P_MX] = &mx,
+	[SA8155P_MX_AO] = &mx_ao,
+};
+
+static const struct rpmhpd_desc sa8155p_desc = {
+	.rpmhpds = sa8155p_rpmhpds,
+	.num_pds = ARRAY_SIZE(sa8155p_rpmhpds),
+};
+
 /* SM8250 RPMH powerdomains */
 static struct rpmhpd *sm8250_rpmhpds[] = {
 	[SM8250_CX] = &cx_w_mx_parent,
@@ -519,6 +534,7 @@ static const struct rpmhpd_desc sc8280xp_desc = {
 
 static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,qdu1000-rpmhpd", .data = &qdu1000_desc },
+	{ .compatible = "qcom,sa8155p-rpmhpd", .data = &sa8155p_desc },
 	{ .compatible = "qcom,sa8540p-rpmhpd", .data = &sa8540p_desc },
 	{ .compatible = "qcom,sa8775p-rpmhpd", .data = &sa8775p_desc },
 	{ .compatible = "qcom,sc7180-rpmhpd", .data = &sc7180_desc },
-- 
2.39.1

