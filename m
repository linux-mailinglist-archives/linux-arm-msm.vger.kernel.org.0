Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22CE27CB84F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 04:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbjJQCSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 22:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbjJQCSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 22:18:54 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E5DA1;
        Mon, 16 Oct 2023 19:18:53 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-66d1a05b816so31569996d6.1;
        Mon, 16 Oct 2023 19:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697509132; x=1698113932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bo5wp4VPacPQ/YFv1ka6i/IWIDKPlu3gu5ElNSMims=;
        b=XyjkW1toKb6OpZcwOHbltPjLCuaPsXUzAfSpoVZj9G6cXB8t2tWAori45L+AwzVWr/
         HPJPB8a+F8GLMiL5gQ5uz8KcSiS4ghIp/IKrciLCF9+TfppoFTBIsKXCnF62k7e2NVXU
         Y/cUlCx++E07XYNQPwV109njg3+gaHUh8wI2cng0zZsvfsrwnoPiIFC7xF2pFXGyv28U
         NzXFK+UD569dGv5tI8kgtnTTFd9+qNZ8BpGO6Ufn5lSKkV8EOQtySJ75UO2anuSqRjZt
         zeMAUHLS4kQdYuhxu0XpfhtI3AlPjhE1Bt5slpLd5TrLoXt+9AzlJQzsvoITzVhla+pM
         9BhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697509132; x=1698113932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bo5wp4VPacPQ/YFv1ka6i/IWIDKPlu3gu5ElNSMims=;
        b=GqvBCy5qfMJAeQSzoFEsLr/csjf7eC3X8MPBpvvGLQXuklO5+10xcG7VlXKciO/xg4
         wvAxMLKLOza90yzrI0zyXcDZEdAQiQ3IYPVyzyGTLo/xJvHPp+0aM6s5PlmCZL7/qeJ/
         v5OUTbsXLJ1PDuQdkL1rygY1fKxx9YYAVXfX7Z9/2AN8ngfk0lKgnFi5UTlCJHiH4A16
         ohLI+qv3Qb4e0e1DiYXlDgc3ZwJq60MgTTgYAf0hWx93TPi+vqNcb7lADV/NJOrHGLky
         HLKDAjGLz1gVNHyuFzoafUYQrhKJ/z8h77YJHoE4pPWnphC0wvm0rzcUqdgpuUdcTwjg
         A8dQ==
X-Gm-Message-State: AOJu0YwKQ+7H69qHQnDSuz19Wl8a+oPwQGGzexd32TFbkSoMAL43IYFS
        +xUCCPBtOKyAwXjdKnpE8gc=
X-Google-Smtp-Source: AGHT+IGX16jPx4ZBZwRemxp+ItcB0+zNPzRTizKKVHZAqJevknBuOLrAU8KAF0Pp07aRbRr/DWaiYA==
X-Received: by 2002:a05:6214:daf:b0:66d:15c3:62cb with SMTP id h15-20020a0562140daf00b0066d15c362cbmr1297260qvh.36.1697509132522;
        Mon, 16 Oct 2023 19:18:52 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
        by smtp.gmail.com with ESMTPSA id u9-20020a05620a022900b00767c961eb47sm257090qkm.43.2023.10.16.19.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 19:18:52 -0700 (PDT)
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
Subject: [PATCH v4 4/6] drm/msm: mdss: add support for SDM670
Date:   Mon, 16 Oct 2023 22:18:11 -0400
Message-ID: <20231017021805.1083350-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017021805.1083350-9-mailingradian@gmail.com>
References: <20231017021805.1083350-9-mailingradian@gmail.com>
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

