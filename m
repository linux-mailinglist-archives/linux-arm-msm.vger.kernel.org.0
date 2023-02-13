Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C067969482D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 15:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbjBMOfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 09:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjBMOfs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 09:35:48 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30AC1C30C
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 06:35:43 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id hx15so32315346ejc.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 06:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUsrpJKvpOf/IejcS66CIVhN9ZDPD+2AL77vlAldsrA=;
        b=Z2R6EuNZyLJZIv3xxNXXQZL+bZFW94Xg1z1H9fNFPCgBUePtA1H3YLxqOXP0BE5Hpe
         aBKLq+BQ7YPBNnxycsZojYdiXPtuPCZ2rYidA6VBqAjvOipTQRTTETmjnsSjkao87X9/
         OQQMDKjFxuwlh5n+zmA86n2IKMJ5Qdid/qV1AV8IwJzVI2pDcPvESWo/FoPHh0Y3GCZz
         hcEKn77EFEenguCdgFKDK3ajAonjlzktneNVvNFxMU3j4PDxFIRb1oexL7O21YXgoFCv
         GssGi25duNt9sEinxtCTufXzjynXN1EWxjwAuydCswf9aj9rRxw9PD+ziyEhxCxid2O+
         JPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUsrpJKvpOf/IejcS66CIVhN9ZDPD+2AL77vlAldsrA=;
        b=GFj6XNTsu1Ug0k2wJ+LbdmYPBvnaekFJljroI6JCi1yvCiHt2XPtLAqWwz+mWVw/iK
         cf7qlN1tT5yBZc4YI6TSGvTx8rtAf7X5BYbu7VQS61JqICw+5MxRHIPc4Ub4PcccTA5G
         TFEiv9I3XeFVs1fT6z0JWpwwnHAVaeT2YxeQS2tNuGL0nNcINnu6rczqgMRk23ZjMXIw
         XUKywO2g6IOv06445JDbjSLI/T59exNoK63/qtJanyw/M0HxjK/PJnM9YNRGeThOAvyE
         MY3MRVsjZaq+ZTLMUIb5CQG5k0NnuOMASfz7QwMKtRydPkNUEZd10lMgfvAgCkfkn2gF
         v0OQ==
X-Gm-Message-State: AO0yUKVPqbPqMml9eW6biZ1i9tZoFpF/j7IwpoRaTOciZWRFZ1C2Zt/e
        MBg+HOIrv/4Vhbdxr1M1ZceaYDC3iMlSa12j
X-Google-Smtp-Source: AK7set/aabLaQoO1OcVlrAFrhTyyHeVN49VrQuy4tkoEGM6wjOBV75Cvjsbmbv49KeJu1QPZDQRqfA==
X-Received: by 2002:a17:906:1d14:b0:88c:a43d:81bc with SMTP id n20-20020a1709061d1400b0088ca43d81bcmr22744167ejh.58.1676298941949;
        Mon, 13 Feb 2023 06:35:41 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id uz6-20020a170907118600b0088a2397cb2csm6927186ejb.143.2023.02.13.06.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 06:35:41 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] soc: qcom: rpmpd: Hook up VDDMX as parent of SM6375 VDDGX
Date:   Mon, 13 Feb 2023 15:35:23 +0100
Message-Id: <20230213143524.1943754-9-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213143524.1943754-1-konrad.dybcio@linaro.org>
References: <20230213143524.1943754-1-konrad.dybcio@linaro.org>
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

The GPU core clock requires that both VDDGX and VDDMX domains are scaled
at the same rate at the same time (well, MX just before GX but you get
the idea). Set MX as parent of GX to take care of that.

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/rpmpd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 2027c820caa7..2669c9210754 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -216,11 +216,13 @@ static struct rpmpd gfx_s2b_vfc = {
 	.key = KEY_FLOOR_CORNER,
 };
 
+static struct rpmpd mx_rwmx0_lvl;
 static struct rpmpd gx_rwgx0_lvl_ao;
 static struct rpmpd gx_rwgx0_lvl = {
 	.pd = { .name = "gx", },
 	.peer = &gx_rwgx0_lvl_ao,
 	.res_type = RPMPD_RWGX,
+	.parent = &mx_rwmx0_lvl.pd,
 	.res_id = 0,
 	.key = KEY_LEVEL,
 };
@@ -228,6 +230,7 @@ static struct rpmpd gx_rwgx0_lvl = {
 static struct rpmpd gx_rwgx0_lvl_ao = {
 	.pd = { .name = "gx_ao", },
 	.peer = &gx_rwgx0_lvl,
+	.parent = &mx_rwmx0_lvl.pd,
 	.active_only = true,
 	.res_type = RPMPD_RWGX,
 	.res_id = 0,
-- 
2.39.1

