Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0A64B9742
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 04:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiBQDyT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 22:54:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233203AbiBQDyS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 22:54:18 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D2F2A229E
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:03 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bu29so7670196lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2AdJ+qrckMHTJcRwxA8dkshi8PG6FFViBpmjAV8cCbI=;
        b=YdeBlsi7Cyzf4Eq7wBVPnTETdHlYz6euXzIFkcUr+cR2wdgIgI1YnhPQVMwj0VQQa4
         FZezexG9HiA/r7U7Wrbfo6UVTtfPfAh085oHq0rKVj0zyfhCZvbpGlE60CQccHo8tTNg
         GVvT0+k93R5zSgbiwBcte3drWUZwyPfCQMGiLYxXLwHX5W7kg0gfrPO3YllduuEmZNWJ
         Uyfvl4gPmNpii/3+gmD677VfDLTvosb/dxY03SWkMBEbjjrr27jutKebs0vCzpkMmoDl
         uFAjzc1S1IPfxOGfpAQEfx/1EwCRz/NphQB/n9xYAUMm4eimR5wddnZFGWvwzA7cFA7S
         Bavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2AdJ+qrckMHTJcRwxA8dkshi8PG6FFViBpmjAV8cCbI=;
        b=AOUHitW0fG1qpBWqt+Lc3c5Xkjbb4eQeqgFSWC+qEV7hAUjH8fWMGCSoPeA5rsoES5
         X7+aCFgl55qnchJQvAlvsYgE4F9dVB2dj9FZSUmRLtJde/I9IZlCTciP/KjpRSinb8Gv
         VgS3dR916MKz+MR2fYAdxY9wbkZAVYpi3S45pK9T837lZY4NzTnZuU5iXW36JU8Ci/h8
         Oilp99aEaVXxxd6E0SCrpKBXJ2dnjsV3nTZuGcqhXsW89+nUpYQzwFRr9CYSYNgD3Bcp
         9zHspUTd0MXHHYcJMhMF4tefy9srwPONa+cLzxQCswZbKaq3YTPm3Qb4AbcKpf+S9IB8
         UWnQ==
X-Gm-Message-State: AOAM531BegvzZEFZ2vO+MRZ5a+VZ9XS0TRxsoTO3vguHC3IeF7VlSAz+
        OETwZ4XXqQo1k33nDjgIgok2mw==
X-Google-Smtp-Source: ABdhPJyFslGnM3IMNPCamQzXQZWO667qKtPpEi0zc/zicfSSW+fwFF20dF3cNkNm6OSOOBid7Ik3mQ==
X-Received: by 2002:a05:6512:481:b0:43d:f703:721e with SMTP id v1-20020a056512048100b0043df703721emr803431lfq.55.1645070041209;
        Wed, 16 Feb 2022 19:54:01 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 19:54:00 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/7] drm/msm/dpu: fix dp audio condition
Date:   Thu, 17 Feb 2022 06:53:52 +0300
Message-Id: <20220217035358.465904-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
References: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DP audio enablement code which is comparing intf_type,
DRM_MODE_ENCODER_TMDS (= 2) with DRM_MODE_CONNECTOR_DisplayPort (= 10).
Which would never succeed. Fix it to check for DRM_MODE_ENCODER_TMDS.

Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1e648db439f9..02d0fae1c6dc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1099,7 +1099,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 	}
 
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_CONNECTOR_DisplayPort &&
+	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS &&
 		dpu_enc->cur_master->hw_mdptop &&
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
-- 
2.34.1

