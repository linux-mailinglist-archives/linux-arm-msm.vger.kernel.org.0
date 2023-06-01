Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE1871F099
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 19:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbjFARWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 13:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbjFARWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 13:22:45 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3380136
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 10:22:43 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f3a99b9177so1552532e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 10:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685640162; x=1688232162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uszklEUt7TcVwD9KcCnqW+XdFVglmQC2gN3N+u5zZiw=;
        b=MOIIbINfZofijQbnfqkhAvi0wvZ9VzFQldIkkGLku/RTct2zAZX9+1XeRNyqxvLmei
         AvuVdJ2818X4c4kPdEMTqKS/b7xHyLLaNIB4oXQMzNz0OEjoopR3iwoR+yzIRFZ+5wd5
         hYHERDZa+KRrg4Fee00/6ufkKd0QEI3EHs6M1rU6/01snrd6gicXPJcsm+ObPE72R+of
         vdYwWEoVQcpEVIDOlj9KUVacElOx3DmDqOQVf5Pegcwtj0nsSWpFBEcteQgj4iB0zNOe
         kO2liTng1GiHB7ZQ3vyLW2BKcFIlv7OEZkQnlrTPlPa1mcSaO9FlPNIFH8QY9SxwWNKu
         XTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685640162; x=1688232162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uszklEUt7TcVwD9KcCnqW+XdFVglmQC2gN3N+u5zZiw=;
        b=HYpN9e4eR8tQV+JQNw4BwMfmJoSplOjZYiuUqhcltGdmGLxgwIPCCxw5dlUOknlgWO
         Cz0xFw3iJtDrd10wn4No5xZb7ZT7RK0W7pbJw+RnsvCAc+8Nu9BUfAyJMTTM+ba1NtAL
         f0KB7aPKGPjO5o4Q08XteK3rcoGGzL6zZkQ+vd/c3oK8FudJHavFeqKFiywQ6qBOOlt/
         2gql4CAJ9ZhhIs+PIOTpiP4NMKz0KkDfg80hTPrMmCiSvCb4UW8BuzOwbyPFU6JtDbDI
         0V9zZN45bq8i4wTDU1VFoCBpElAquTgWRPxgC9Z2Iaa7yR/VICxUVEzqfXiQ+ht3akia
         dA4A==
X-Gm-Message-State: AC+VfDxRIcjhBUL3/EvbErh7wj6soHpSs0D6Ymco9pzuAQp+3v7MmsFW
        bHYnrdiNvTRTk4COIV8uKlTCoQ==
X-Google-Smtp-Source: ACHHUZ5ZacCiA/+9jxIKQm/6C3XAijP2X8lKjCIwg2bb3952XAuKJxdZ/8pny9phhJdB2Fff3s7hww==
X-Received: by 2002:ac2:5289:0:b0:4e9:bf52:7898 with SMTP id q9-20020ac25289000000b004e9bf527898mr361983lfm.37.1685640162113;
        Thu, 01 Jun 2023 10:22:42 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b25-20020ac25e99000000b004eb2f35045bsm1145739lfq.269.2023.06.01.10.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 10:22:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
Date:   Thu,  1 Jun 2023 20:22:34 +0300
Message-Id: <20230601172236.564445-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
References: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
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

There is little sense to get intf index just to call dpu_rm_get_intf()
on it. Move dpu_rm_get_intf() call to dpu_encoder_get_intf() function.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 94432451e175..c04b551c9d34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1270,22 +1270,23 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
+static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
+		struct dpu_rm *dpu_rm,
 		enum dpu_intf_type type, u32 controller_id)
 {
 	int i = 0;
 
 	if (type == INTF_WB)
-		return INTF_MAX;
+		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
 		if (catalog->intf[i].type == type
 		    && catalog->intf[i].controller_id == controller_id) {
-			return catalog->intf[i].id;
+			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 		}
 	}
 
-	return INTF_MAX;
+	return NULL;
 }
 
 void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
@@ -2262,7 +2263,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		 * h_tile_instance_ids[2] = {1, 0}; DSI1 = left, DSI0 = right
 		 */
 		u32 controller_id = disp_info->h_tile_instance[i];
-		enum dpu_intf intf_idx;
 
 		if (disp_info->num_of_h_tiles > 1) {
 			if (i == 0)
@@ -2276,12 +2276,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
 				i, controller_id, phys_params.split_role);
 
-		intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
-							    disp_info->intf_type,
-							    controller_id);
-
-		if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
-			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_idx);
+		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
+							   disp_info->intf_type,
+							   controller_id);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
@@ -2305,7 +2302,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 			DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
 			break;
 		}
-
 	}
 
 	mutex_unlock(&dpu_enc->enc_lock);
-- 
2.39.2

