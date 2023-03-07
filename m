Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCA296ADF92
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 14:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjCGNCN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 08:02:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjCGNBw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 08:01:52 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF3632196B
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 05:01:49 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id s20so16923550lfb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 05:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55lMFXFd7GmMBP4PF1xB1lq9Cw+L1BmijVr1G6D/aP0=;
        b=fRfy53cEsWZ9faDm5Cd0zlm9rKYQXRpJVLFZt2OVknK3ljQGsqfc1ZQHGRstMJeatU
         OPNPlp0mlLvJU24T7Nyi8DLtqzcFambcmfWwoxANwdKOiJ65QD+CQO9PA2/l83lX8D11
         S5anBLqxPqO+SvQKASzZmsVM83CV4tb83LwMfSs+zLGWggOAgOAMu6EFsexpad7x81Pc
         GSrwhcqCcXOxQO2j+/LxxXQzHyRjggC+mjiIZ+fXZIijnNGYN3u9OaKMiZ0Ii1+2Q8kB
         gCki9l2R1n6B1KK/Cid/IQf8Opf09tq/aIn3JN/BAPB3PtCUE7cB2LMgVBnNY6pM4W19
         34AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55lMFXFd7GmMBP4PF1xB1lq9Cw+L1BmijVr1G6D/aP0=;
        b=nsGoD0MYgOCsS+K3Pb+Fksh7dZeRW8hppkzFFTHNh+DoEBhTLxEmr82iWAIr1/kDVX
         SosAwwHL2SZduzSaUOnDTt4fD2QHnpYUqK1CTrsE1Q++4NxJ1gz5/lRAP3DcVAzVaE1y
         MWPreZpcAzQoPhA/XSakCBDpF8ySqFQrm2EB54pdrqRJInuMP6DKvRwozshtCfAfxV0/
         8hB9KNMdTixiKejVkHnl7W2huH6MxbI3iRGdeHLBSJmtStQwuOD/Bl73zJbhJ8OBU6D2
         v8MJ5Yt52bKt1FT3W7TumAD2WEGvG9BVRhgJ56OOM+iYyEEU8ceghI/s7FNt2CHHhrhp
         Pang==
X-Gm-Message-State: AO0yUKWlOj44GQw7La6rkG5bKoBgJALqjqFOgVWXrhCvSJpNWUiwO30Z
        2DrWg7cTnju4CCLRNJ4IfncOTg==
X-Google-Smtp-Source: AK7set87sMy1FszPQ3DFVXd9IWgFz6raEtqYLt7QEcdv4tEsY/E1WspeaJtD9IFkiPEzi5szujvaZg==
X-Received: by 2002:ac2:5df6:0:b0:4b5:964d:499e with SMTP id z22-20020ac25df6000000b004b5964d499emr3789572lfq.8.1678194109317;
        Tue, 07 Mar 2023 05:01:49 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u2-20020ac248a2000000b004cc5e97d356sm2048265lfg.148.2023.03.07.05.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:01:49 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 07 Mar 2023 14:01:43 +0100
Subject: [PATCH v3 05/10] drm/msm/dsi: dsi_cfg: Merge SC7180 config into
 SDM845
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v3-5-8bd7e1add38a@linaro.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678194100; l=2145;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FABCSvB5sJjrFfkmtzbHoBqH7FB7e/a49B1A9lWjwfw=;
 b=TJaWnNwL/YZbaSACXrVBkph5QhvBKJ7DBK7miT7PVfOpKqHUafq2Dask7moFQVTIwwTzqjuhfKpq
 l3JDU3AHBjIqQEBaUWt+8I/wXLi5YvT06nylSKUYBAdJoiNNtp9y
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The configs are identical, other than the number of *maximum* DSI
hosts allowed. This isn't an issue, unless somebody deliberately
tries to access the inexistent host by adding a dt node for it.

Remove the SC7180 struct and point the hw revision match to the
SDM845's one. On a note, this could have been done back when
7180 support was introduced.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index d39521850018..6d4b2ce4b918 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -169,7 +169,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.bus_clk_names = dsi_v2_4_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
-		{ 0xae94000, 0xae96000 },
+		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 / SC7180 */
 	},
 };
 
@@ -188,17 +188,6 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	},
 };
 
-static const struct msm_dsi_config sc7180_dsi_cfg = {
-	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = dsi_v2_4_regulators,
-	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
-	.bus_clk_names = dsi_v2_4_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
-	.io_start = {
-		{ 0xae94000 },
-	},
-};
-
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 };
@@ -299,7 +288,7 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
-		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,

-- 
2.39.2

