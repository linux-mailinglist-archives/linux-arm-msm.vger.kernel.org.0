Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA8B26D111B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjC3Vxe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbjC3Vxd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:53:33 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6388110AA7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:53:28 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id h25so26376229lfv.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtXkCra60kvYHKQaEV8+l7jyVV0lZ9rSzNYwpQPqlv4=;
        b=R9lqQbmV5RlJYCn4owAdz59pmJs0P0GvSG1kh5vNL0pDpDewVXmQQnoQbTjfvXhGl3
         kHfSOy6U/M4NhH3bHdmhpknw7jlrqWvYjZBtQ9DCw4trjVnffMG3DWePkV5dXldN5hx2
         ulOZYta+wP6Umxx1OvQQk+6HpmNv9sq/ehfz5JOV2eFKeFQyAALSQ4qGqhLI0qEmaLkr
         C/tnENAjm/y/1ndanY6xx79pzTw2EGPW0gFbKiWJQPojC5fRgRHhMEgPh6sdYig521Nq
         dsUPmhyKjbdEUwMYiA+fVf2gHmvryTvsLO4l3vOjYy9k2jDzU+4y0PNN9NZKKh9RpCU+
         TYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtXkCra60kvYHKQaEV8+l7jyVV0lZ9rSzNYwpQPqlv4=;
        b=0zF7hsAH1tVC9g8Xq36eHKoTkuSluycby5le0rbtg9J4cM4VK0lK0sphTYQJtmkJA1
         Un78or56TicYTh/2zb6Rf4IyqNqzvvt4ZFsX5mD2whrGAPWESnTDZ71XNSABTeqAvcey
         ScOUUS7UCj5OBe3R2VuNATsAiXWCRQ8rep860Xs1pIv5Y5sLmF//NdYKcYOAjInN1Mpb
         Nrh/QSvw1jf3YTeUlidSHN5VvmzsAAPNKoEj1FGaRE6H7UHT11NBmBd5k/knvVoJP1t4
         Jq2A0vU5AfQ1O9QLndmHS7EnGnnBq5Ql5PGqJk5rq9ZQpFaGmszUTdYmcWUF+hjPMY6r
         Bj7A==
X-Gm-Message-State: AAQBX9cNZfGxRejqdqC0VvO3pki/qCH8s8mKuNjQK+kk0des/vvDSvom
        CyFG5Ts60sBUawW24xcfIbR/iQ==
X-Google-Smtp-Source: AKy350ZF4JInPm4/dFyC/M7RhyL6adrWHzB9fM+8yoJNm4W4VSK1p5JXA8+PiuShgkO0Vb6WxTIWDw==
X-Received: by 2002:ac2:4ac7:0:b0:4ea:f7aa:e778 with SMTP id m7-20020ac24ac7000000b004eaf7aae778mr2492567lfp.24.1680213206756;
        Thu, 30 Mar 2023 14:53:26 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:53:26 -0700 (PDT)
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
Subject: [PATCH v3 02/38] drm/msm/dpu: constify DSC data structures
Date:   Fri, 31 Mar 2023 00:52:48 +0300
Message-Id: <20230330215324.1853304-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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

DSC hw catalog data is not supposed to be changed, so mark it as const
data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c     | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e44e7455a56e..be9b9f8f143b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1837,14 +1837,14 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
 	.features = _features, \
 	}
 
-static struct dpu_dsc_cfg sdm845_dsc[] = {
+static const struct dpu_dsc_cfg sdm845_dsc[] = {
 	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
 	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
 	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
 	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
 };
 
-static struct dpu_dsc_cfg sm8150_dsc[] = {
+static const struct dpu_dsc_cfg sm8150_dsc[] = {
 	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
 	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
 	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 2f532543848c..fe360fb7c77b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -872,7 +872,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_merge_3d_cfg *merge_3d;
 
 	u32 dsc_count;
-	struct dpu_dsc_cfg *dsc;
+	const struct dpu_dsc_cfg *dsc;
 
 	u32 intf_count;
 	const struct dpu_intf_cfg *intf;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 619926da1441..4e1396575e6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -175,7 +175,7 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
+static const struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
 				       const struct dpu_mdss_cfg *m,
 				       void __iomem *addr,
 				       struct dpu_hw_blk_reg_map *b)
@@ -207,7 +207,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
 				   const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_dsc *c;
-	struct dpu_dsc_cfg *cfg;
+	const struct dpu_dsc_cfg *cfg;
 
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
-- 
2.39.2

