Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE4A874B7EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 22:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjGGUh3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 16:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjGGUh3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 16:37:29 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D77F19B2
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 13:37:28 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f954d7309fso2936778e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 13:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688762246; x=1691354246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5z5CQN9gQhlBI3rw12W+BY+UTTjPQqcnHrgndY2Aqs=;
        b=K8SzyygLZhcJ1NCDc8Nb0SWwAqFFS2xoH1sytz/vUwBxBpSQtlnoQHDjWwOfp/ouv0
         2kVmdSDs3nVZJhQxv9eqU2SxBNhkndxGfI2+xMgpmalZ6YU+oNyri8jTbu0WqvXBEBmg
         QlqfFPd1sNWIroohbwJbuxndDJ6llL5CZfKMHJ4jrPjPcMutJ7rCnUnGLwFBqVpevcm+
         rHnj5HPdlclbNN6dacK0tnRutFs3AVM0s4xpFzcG+m6UbgULzjJ3xJQ9zz7IEF9Enn0G
         DKjlxzbeKbdvVaVFvQzRBsM29tCNq4HfCyIBrklLUcKZWdtYGE6TekYyNrcneNAn+0r8
         njQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688762246; x=1691354246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5z5CQN9gQhlBI3rw12W+BY+UTTjPQqcnHrgndY2Aqs=;
        b=D6Uns/Ei6P6ZmllYMJ6BpdjMDzNfW7EmvLK5pR2EecJQdjGtt/d50JdGx1EDiNb6JS
         yCkCpTUA9OUEmOLTXCIG/mPsXx8JSkgGVQzHG2VKjTH9nrmp4XnRLizuL8pAgYQCCqdD
         9oWYzXeBKs+nJ6yV+uLknMsYbPFzUGvvDoSg5sFcS60a0RxGDoTD0pKl2dZA40gEzxx+
         I+v5AGUWl/Eq8VV9RWUcBR24UIZb3mxkRQ1tcwak4Ujwh656f4DwGuaq40ynTZlrMKt1
         6MkX8hJWMrjtesVtw3CwssLUSwjEX0F5JA8WPf86nu0Yt1c+viPFosqkCYFvSBzV69iq
         5kdA==
X-Gm-Message-State: ABy/qLbnTsaTao8gZPW5VuBPR0hawd7tAzZtgGlcbLqdtja8lnDlmF/p
        KJeIRITKrJX5LBbU8QfzjUU9hA==
X-Google-Smtp-Source: APBJJlEEEGlGG49xFjzciptjIKA5rT715Bv8VLBJcooIHYOgOe71L3exff/WPaP46GEbKhlCVAlihg==
X-Received: by 2002:a05:6512:e86:b0:4f4:7a5:e800 with SMTP id bi6-20020a0565120e8600b004f407a5e800mr3257908lfb.10.1688762246383;
        Fri, 07 Jul 2023 13:37:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 13:37:26 -0700 (PDT)
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
Subject: [PATCH 02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for dpu_hw_intr_init() error handling
Date:   Fri,  7 Jul 2023 23:37:13 +0300
Message-Id: <20230707203724.3820757-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
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

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Replace IS_ERR_OR_NULL() with IS_ERR() in the
dpu_hw_intr_init() error check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e7ac02e92f42..85b8c9cc99ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1096,7 +1096,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
-	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
+	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-- 
2.39.2

