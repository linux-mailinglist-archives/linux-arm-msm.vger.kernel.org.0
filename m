Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDA955A58A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 02:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbiFYAag (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 20:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbiFYAaf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 20:30:35 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA836B8F4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 17:30:31 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z21so7070529lfb.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 17:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VG/DX3eL+6/NlPCigDEfKk/fZDBpp0l2CQ7qut1J/nk=;
        b=X2RAWpzb5zfsaioKpFiaDcrudgPO86EFVdo2uY1ggJogYyO7zQpw9/KuKOSFkpFbMB
         UWwIq+rRzb892IURBWzmr9z2TAV0aqel2bJoO+ZYanSEwmO0T16o7asd/xgb8Wzr13hU
         LTLwbWTOuiMPPTHbcWnq14eOJW6ppH30DAhNydGkhKIrtHFBlE+T2bgNzUWM4u7A7gH1
         lq5muRzT/0h1vEjaXCRam5NQGUpetCZ324zg8Ycx6xK1SI/YKJ92oTgxFP7A+jyUHw4Z
         4SobBW2zyIZr6YpGvZ7UZ1a5tObCBC7OosfPZNm2cRWDM2/IeFYd4dj3CpEbrJ+6BCBY
         QSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VG/DX3eL+6/NlPCigDEfKk/fZDBpp0l2CQ7qut1J/nk=;
        b=itkNkk44uoREv9NfdsfFoD0alZ+b727n21DIjaaYhns09w2RyARhaWErIHUnm6K5px
         RJynxoHbSWfwxJWQWZuOgb92TvN9jGG/iiwcv7M+NuZewQDIbJbfhCzQlAKb6KKGVUSL
         La26XzDsqiyQT0L63zQywk80PyAGjrG0SWQd10kNMEdrqDSZMiSM0i6spBD2iGqYhlmW
         0RTIt0hX0N80+g7fsEchh7v73pTub0HVERcUM3lVL/CV2BC2PkangQ/GFd9ynVRyENqo
         8pUcTJU4GE3KiMvnTYTFvyxIFjPNK6O2EGqaMW6jJxH0sQ9IRcJiJRhbPgm07a3YaPO9
         T+fA==
X-Gm-Message-State: AJIora+c08lr+dO1qnh7EycYoMxyLnCduhQvzYighLvR3Wb6yhWSqT5M
        Qo7ZN3pqRR5u3CzrH3QStsc7DQ==
X-Google-Smtp-Source: AGRyM1v9dtC+FdbrGuG1FLnlvEt8frK2DhVJEb+xVODy6mHi0YJGyHHHWpry/op0jR4oZjK5eBrEBA==
X-Received: by 2002:a05:6512:32c1:b0:47f:9d05:b6be with SMTP id f1-20020a05651232c100b0047f9d05b6bemr865588lfg.335.1656117029359;
        Fri, 24 Jun 2022 17:30:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d22-20020a2e3316000000b0025907141aa6sm440094ljc.83.2022.06.24.17.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 17:30:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/dpu: simplify and unify dpu_encoder_get_intf and dpu_encoder_get_wb
Date:   Sat, 25 Jun 2022 03:30:28 +0300
Message-Id: <20220625003028.383259-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Remove extra nestting level from the dpu_encoder_get_intf(), replacing it
with the explicit return in case the INTF_WB was passed to the function.

While we are at it, also change dpu_encoder_get_wb() to also use
explicit return rather than the goto.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1: fix the typo (noticed by Stephen)

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f435baa500f8..c682d4e02d1b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1255,12 +1255,13 @@ static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 {
 	int i = 0;
 
-	if (type != INTF_WB) {
-		for (i = 0; i < catalog->intf_count; i++) {
-			if (catalog->intf[i].type == type
-				&& catalog->intf[i].controller_id == controller_id) {
-				return catalog->intf[i].id;
-			}
+	if (type == INTF_WB)
+		return INTF_MAX;
+
+	for (i = 0; i < catalog->intf_count; i++) {
+		if (catalog->intf[i].type == type
+		    && catalog->intf[i].controller_id == controller_id) {
+			return catalog->intf[i].id;
 		}
 	}
 
@@ -1273,14 +1274,13 @@ static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg *catalog,
 	int i = 0;
 
 	if (type != INTF_WB)
-		goto end;
+		return WB_MAX;
 
 	for (i = 0; i < catalog->wb_count; i++) {
 		if (catalog->wb[i].id == controller_id)
 			return catalog->wb[i].id;
 	}
 
-end:
 	return WB_MAX;
 }
 
-- 
2.35.1

