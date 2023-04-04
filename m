Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8C66D6207
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 15:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234864AbjDDNJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 09:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234955AbjDDNJL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 09:09:11 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D55170C
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 06:09:09 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 20so33788743lju.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 06:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680613748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pEmrp5fJSjYas7ZHAUSxzBzhunF/atevLaV+PLA6DY=;
        b=uIX/KodGkKd2KIEzZiuSER0+sn2MRWct5PpnRVMVz2//DfVIveRIqv0p0rdEG4fPLg
         k9pnjfIBSkWby2l7ciX3ufwsJjSdv8Zat5+9DlvzmFM/X2/eWam/BVNn9CORNkaD+wCD
         +hzJLMawPvDaM3oUOs3QAvrvffjNuI8htMWtDeQRqy+c6wGFy2c3vEWFqdwNNStDNn5D
         ULZ2h4mq63k2ZVzFIkFteDbrU6u+UuhjOyWJ2uTI/bks2dFJh3jVOJmQCcrWL5KUui+N
         OjkOKqu44jazK2gDIBgdz5J6tjDomod+7WZHwaoZfJ3alYRQH43V2HY6R0jHUmGFOgmp
         Pbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pEmrp5fJSjYas7ZHAUSxzBzhunF/atevLaV+PLA6DY=;
        b=N06vw9xWrYvI5tkEloKP6pzDsy9WcvoajpELjzOVEy3GIBlUddW5ZhncepV24Pr2qq
         rOz39RJO6+SPehw5OJmS13eWs+BXK35kfoJLemhwxvNeRxv31Cgp4id4b2lHLBi9D7eB
         7Ql+yoJ5w99ELhSVnmJONw3BBW/OsA0DSLkOhmtqsTapbxl/utiL3pNM6eEUdF/ITxta
         fqexp/rJ3K4NieetHGUhBCvkae5QeWpPhxDYlGHWpJKbOVM9rYioON6kfGiiW06OUuNK
         SA4ENLR/0yicD62sr43/w8lF3nIVgTTq+ukdrsv12QPtA8vEnIIZuDO3O+8FgBjLLaAM
         ZIyw==
X-Gm-Message-State: AAQBX9dIxZUhzv/OOSEoa4N9RpoccFDJTyvzkqH+ZWk0eBRjkhVNXeNq
        X4w8AaYZcOWCjp/teeG1U5OLYgRvZm3Ork0Z5VM=
X-Google-Smtp-Source: AKy350Zab7+B/Jx56LSksTzqOKYnihs5dcG4F+HrlL1jvv29Z/80Hc28KLk8Q0BjBT+joC0kRyDI9A==
X-Received: by 2002:a2e:8797:0:b0:2a6:1780:7700 with SMTP id n23-20020a2e8797000000b002a617807700mr774133lji.1.1680613748087;
        Tue, 04 Apr 2023 06:09:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:09:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 21/42] drm/msm/dpu: duplicate sc7180 catalog entries
Date:   Tue,  4 Apr 2023 16:06:01 +0300
Message-Id: <20230404130622.509628-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Duplicate some of sc7180 catalog entries to remove dependencies between
DPU major generations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index ea34c2c7e25c..0b10e2060591 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -81,6 +81,11 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
+static const struct dpu_dspp_cfg sc7280_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sc7180_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk, -1, -1),
 	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
@@ -131,8 +136,8 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.ctl = sc7280_ctl,
 	.sspp_count = ARRAY_SIZE(sc7280_sspp),
 	.sspp = sc7280_sspp,
-	.dspp_count = ARRAY_SIZE(sc7180_dspp),
-	.dspp = sc7180_dspp,
+	.dspp_count = ARRAY_SIZE(sc7280_dspp),
+	.dspp = sc7280_dspp,
 	.mixer_count = ARRAY_SIZE(sc7280_lm),
 	.mixer = sc7280_lm,
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
-- 
2.39.2

