Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 352DC55A513
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jun 2022 01:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbiFXXvY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 19:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiFXXvX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 19:51:23 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C008BED6
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 16:51:22 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id w20so6987525lfa.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 16:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P9baGnfbZe4W5Si2Az6nOv/xqySt/TKjyl9d4AgEnz8=;
        b=bukXzi2lWT5Ql2mpcuU2lrxCya4q8HoKwQY9qH68JdWJe0Ai4rK/GqwYT6ItseU2uf
         6EliMDL7EizkIEy+QAEbP/mZL/KDkSWgZM0yjhuIYOhe+uRfMmoZGY/JXvSLNZcziqDz
         ZDmwcNZBYG/RUJ1jHPSCnv5Hw6b/DhOmtIbqd1ZoCGHzg3q+onVpCD0qaswRDBSr9hOo
         WMylDelhnMdTeLcy9MvKhAjL9B2E4N2Yw8FfYm10mJCedm0NG2xbohGClthxuQcNt40z
         mHLBtWQISlPYE0sX3hP6G9FO5g6VKvS6IwvXdVaNBgMg8b8B35gkORrAlOcwtrq9oUjI
         YC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P9baGnfbZe4W5Si2Az6nOv/xqySt/TKjyl9d4AgEnz8=;
        b=mFwn2dNjB5Fkcel5cUFV+hY0nfDzQE3nhcD9WK0MUTNj1QRxmM8Mqm5BpLnMr3iSAq
         piSgoZ7EB90/E4slukr1xQlQhTlGqIqDuTSUK4u+hW32SwUw4aEHtN1M8vGSMEBozPd+
         8DusyKO4yvg9gOjfhDTCrgCP9v8yfnelJ8WEwm8YL9JqrgOm2mZG3GC/Wvab0T6ZMped
         pL8gtiDBi3T6wjxCTrywN+OoNzRbTph2fM+oY6C2IU/wQ+fP1uKWG35nbme0XChqvP3h
         NEYUXOe1+hEBpC1tjWiAigZlbXw6YVOCX5UcHq6pIoDTS5134VIbk0hviYz6mdm4OvKd
         QUKw==
X-Gm-Message-State: AJIora81ki3BgtHdV9j4UpUxtS1HAPA2/SHgRNeox0H/DSanXVB5bzVt
        bkh6KIWSYMCiqAXUDQOjBiysYg==
X-Google-Smtp-Source: AGRyM1tB+IfW+Bzv7LTTxIsyjWQuHfFks/UAMPIDti/xPLc8AYIbVjxtUv9PifwYCVZ+P+cFiXV7Dw==
X-Received: by 2002:a05:6512:2256:b0:481:10e:b2f3 with SMTP id i22-20020a056512225600b00481010eb2f3mr620777lfu.619.1656114681278;
        Fri, 24 Jun 2022 16:51:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v8-20020a05651203a800b0047f9fa2925csm579003lfp.234.2022.06.24.16.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 16:51:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: simplify and unify dpu_encoder_get_intf and dpu_encoder_get_wb
Date:   Sat, 25 Jun 2022 02:51:20 +0300
Message-Id: <20220624235120.376293-1-dmitry.baryshkov@linaro.org>
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

Remove extra nexting level from the dpu_encoder_get_intf(), replacing it
with the explicit return in case the INTF_WB was passed to the function.

While we are at it, also change dpu_encoder_get_wb() to also use
explicit return rather than the goto.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

