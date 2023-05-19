Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D807708DE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 04:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjESCjE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 22:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjESCjC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 22:39:02 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A3AE6B
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:39:01 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2af1a7d2f6aso13373341fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684463939; x=1687055939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwIfWRi7SH5tpmvEt1N0yTEC4B47WJkD1VKzReCn4Dk=;
        b=kYlrMjbZX0Ra1vw3Q0VEvgRyKstJUWj3YWTtvA8wXomUyQ3Er8ov3mEoj1J0MlQXuT
         Cf+EZ/9qpRz2A2eiaPd575CChmMBD5Mj15XFlkEsDhYjQEyLLic4RCIBvO1zPMIzZd3Q
         18nznA6Z82/hpIzH0ZRoMP3HCaWt0+AsdVJab/olFg91YQ4vDImW4DFUFXJrFP4UhVW5
         EB4RA+hriKgOAIRIkutBuU993GvWZnqdNfJZVPDPC72AIVDs1a0B6agEhiSTvrR4bpoO
         14cpDKy2HNPpamYPHwFDnzdtL++55SNIn3hvi8mCJdPbZ+R428zXdkWTeVCwZkjNe0op
         5l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684463940; x=1687055940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwIfWRi7SH5tpmvEt1N0yTEC4B47WJkD1VKzReCn4Dk=;
        b=abFfeXekHz7Y2NLzCsY0TnJaMO0vlEnXO/Ka05F/DOoRMxH82KPBXfCO9btwya0J69
         S/2JNArC9qeL6XSGUXQgUhuX70XUR6xUImmgVxf1BSP7MKS5AzAlbxo8CNcLNVEqL4jV
         Ki6VGW+gIXv/FT63Waxn+25nNhy0jqSZmBSX6gpYG/VqmA6LuBG065V6wmtkLL06p8Ky
         Pz3eFz9w3Pb9KiZA1toK24urh24QBtC0lfId27R4iR3L/kOkrhtnV6vkVQgxXTbDhpYU
         wWeT0EA01xRxaZFRo/gg8LMJiNCE/CTQW2EjzL7W0Y1eOxXmezo+54nyp/uA1ysks26w
         pjXw==
X-Gm-Message-State: AC+VfDxRWWmWNywE+rA2ILy2xdug0pItXemnB+1EljwinqvgC5kEiAuK
        y042cbqs/c4mqwa/n0qk0wQmEw==
X-Google-Smtp-Source: ACHHUZ72Ju7xg1QN3KtXzwVox4HtRjoATsB2ZY3SHcihi+os+2MdpthJ0YX+TRIJ+jxWEkN5biXS6w==
X-Received: by 2002:a2e:88d8:0:b0:2a8:c333:ebee with SMTP id a24-20020a2e88d8000000b002a8c333ebeemr101125ljk.49.1684463939821;
        Thu, 18 May 2023 19:38:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s15-20020a2e2c0f000000b002af25598ef9sm25906ljs.0.2023.05.18.19.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 19:38:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/msm/dpu: inline dpu_encoder_get_wb()
Date:   Fri, 19 May 2023 05:38:52 +0300
Message-Id: <20230519023855.3840907-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The function dpu_encoder_get_wb() returns controller_id if the
corresponding WB is present in the catalog. We can inline this function
and rely on dpu_rm_get_wb() returning NULL for indices for which the
WB is not present on the device.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++-------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 267626245a74..92e915bcf88a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1277,22 +1277,6 @@ static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 	return INTF_MAX;
 }
 
-static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg *catalog,
-		enum dpu_intf_type type, u32 controller_id)
-{
-	int i = 0;
-
-	if (type != INTF_WB)
-		return WB_MAX;
-
-	for (i = 0; i < catalog->wb_count; i++) {
-		if (catalog->wb[i].id == controller_id)
-			return catalog->wb[i].id;
-	}
-
-	return WB_MAX;
-}
-
 void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phy_enc)
 {
@@ -2268,7 +2252,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		 */
 		u32 controller_id = disp_info->h_tile_instance[i];
 		enum dpu_intf intf_idx;
-		enum dpu_wb wb_idx;
 
 		if (disp_info->num_of_h_tiles > 1) {
 			if (i == 0)
@@ -2286,14 +2269,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 							    disp_info->intf_type,
 							    controller_id);
 
-		wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
-				disp_info->intf_type, controller_id);
-
 		if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
 			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_idx);
 
-		if (wb_idx >= WB_0 && wb_idx < WB_MAX)
-			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, wb_idx);
+		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
+			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
 
 		if (!phys_params.hw_intf && !phys_params.hw_wb) {
 			DPU_ERROR_ENC(dpu_enc, "no intf or wb block assigned at idx: %d\n", i);
-- 
2.39.2

