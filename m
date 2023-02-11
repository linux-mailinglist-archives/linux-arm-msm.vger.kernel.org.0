Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2C56934E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjBKXNr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjBKXNp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:45 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA4913DE3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:44 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id p26so23885643ejx.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/VWqDzJndMFu0ExSBe2fdNW8P6NIqUgWOtcl+LA3Fs=;
        b=OUgRemnEzJ9Ih9nEzpuwx2dYqGd647U8YMgqC8Gj6hvMkLMXThzK2kZv7vrZtDcHzT
         9WT3L4BvSBXg9IK46hsEaeughULXI3fVdqUpCAvjvEH1MQyCgytqDcjCStpUXUQsOahs
         Ddx7ldtpdj7y8wMtF4d4/2MGwYM+zeeUHrpe8JY0xSl2eM0CyU6Iv1r8ARKH9qtrCnE8
         izLBgFO04/4PQTHjVCNjbgay8PfKD9WlH3g4l950uiOhpu4e1bMYcaJ2goqE0/nXaOa7
         UK0fadiRTkMbma+ApWMJDZYlPhlqVaxkMwbc8MuT81TeXOC4S99a3GNzNH6lzdAYc6SJ
         fGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/VWqDzJndMFu0ExSBe2fdNW8P6NIqUgWOtcl+LA3Fs=;
        b=OuxCg6F/pSv8UUI2JCEq8HJkqvKU0UZkKux2KppayeWS9bDElHVWHI2uszd4rkHPnu
         zEBl3YOx4reZViBB+jr466QNl1BspFjrC54X1ozwtkRzMrj6/BLQg8+iHgszsdljR4nb
         CS3iwiqdlL12c6fwrsNGEvEeGfdBANBPh+seH+Q2u351Fw+0LHhkIxgBiS0eBxqc8/ih
         2yJDFORL2MdhNrrS0zPQrVou3F6CTQU2mSHcfNwqHFdspTxnPJPAlx+NFiZbcnGwmig8
         jzrxsu6TAxAT1wXSXO8CiqTV6cuMNf/8j6EDfhGU70T3O/bp2j46pHimG1RGmOzsWGx8
         cVbw==
X-Gm-Message-State: AO0yUKULeGVrM26Mzu6Ok95DhlEKTyQcUHDcuXA2JCugQ1jK+VmbPKmn
        GmqDqz7wJYw+pofPzwfG3jO7OA==
X-Google-Smtp-Source: AK7set9V+WQSUalu94KTAVloSps3aFGcGNNCF4s3HouU2LDE9Ty8azq860o+VC+GC4ga+THsgxbh6w==
X-Received: by 2002:a17:906:8a69:b0:87b:dac1:bbe6 with SMTP id hy9-20020a1709068a6900b0087bdac1bbe6mr18639458ejc.36.1676157222742;
        Sat, 11 Feb 2023 15:13:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:42 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 35/50] drm/msm/dpu: duplicate sm8350 catalog entries
Date:   Sun, 12 Feb 2023 01:12:44 +0200
Message-Id: <20230211231259.1308718-36-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

Duplicate some of sm8350 catalog entries to remove dependencies between
DPU major generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 748f7e14dfcc..0a5d6d9fe751 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -137,6 +137,12 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
 };
 
+static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
+	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
+	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
+	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+};
+
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
 static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
@@ -192,8 +198,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.dspp = sc8280xp_dspp,
 	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
 	.pingpong = sc8280xp_pp,
-	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
-	.merge_3d = sm8350_merge_3d,
+	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
+	.merge_3d = sc8280xp_merge_3d,
 	.intf_count = ARRAY_SIZE(sc8280xp_intf),
 	.intf = sc8280xp_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.1

