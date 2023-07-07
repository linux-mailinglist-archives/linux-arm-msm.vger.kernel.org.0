Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 702A074B764
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 21:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbjGGTmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 15:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbjGGTlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 15:41:17 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215792D56
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 12:39:47 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso3564849e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688758785; x=1691350785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
        b=TSmNh5jSebPGeymulBDAEcubNE5cn9xQeWeeImrgx/Zzp1QzZacwkj+LIkcUCmXcoX
         UnfhUgHRj5FUcwnyNF05DlhwqEKeolRqmQdfSgfGfz/CsBfzg8iHlx8+cfmiX84bGTjz
         3Hmujaw7GS1NUQGRzsJxPAbDEHVupaEyenZnkUX7dkToVty+L2Jlqr+emV1Gms+VqrWP
         c80FOzhD48gg7JtasLqCb0zxeqc7rwvkP4hWaixVNQf4lfnkDd6ec6+yIhlIXV7Zds+4
         RzLRBcl7CSrIr1LvcDUs6tcHFqvBDzaWm+2AaAiZum0QOOrf2vV31kaEbe9oTZbCwkw8
         cTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688758785; x=1691350785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
        b=CEwTkZw10OPJpd6VISQRHTV49j6p3cAVhZ55uEwQMK/pP8GrxclNZf0u71PNkUGJam
         vVl+t9mxxtKnOYQBM9eeDgF02cP4rYWUZ34ObvyUaS+7cJlb+UJlizejLQuujfTN534r
         yamoLt9aHj6xajC0LIcZ94Pxi6WQuCZ9BIXKod+Drq1CQzGndkXBE+sNOUqkEfgJuQ9w
         Znn//RD5gLjSBhnFGW4aM4R5YFruQXwXwGbqdpKFB9WcCb0V20bXyjRTAHCvXAf4LSze
         SPXiNjtxFiBeIYsVy5BL7ROvcvdz6ZBvr7b+56+8fv8Cvl4g/mLbEJ8DfcUSOXYgViLy
         oGVA==
X-Gm-Message-State: ABy/qLbhesDFxwBwsryAtXDjve94ON6CmdLeugNlt1YpTpEVDw46kaEY
        qo+vSS2vds1wr6ncSIA6AtEpdQ==
X-Google-Smtp-Source: APBJJlF9I+uOMWU3r1bX/Qzz+m3+Ve61FTi0gpIC8FEbD7mHoduGOmKBdvKypzuq/c3Kd4tzp4L0pw==
X-Received: by 2002:a05:6512:33ce:b0:4f8:5600:9e5e with SMTP id d14-20020a05651233ce00b004f856009e5emr5377782lfg.47.1688758785404;
        Fri, 07 Jul 2023 12:39:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 12:39:45 -0700 (PDT)
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
Subject: [PATCH v3 03/11] drm/msm/dpu: core_perf: bail earlier if there are no ICC paths
Date:   Fri,  7 Jul 2023 22:39:34 +0300
Message-Id: <20230707193942.3806526-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
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

Skip bandwidth aggregation and return early if there are no interconnect
paths defined for the DPU device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 333dcfe57800..05d340aa18c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -237,11 +237,11 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	int i, ret = 0;
 	u64 avg_bw;
 
-	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
-
 	if (!kms->num_paths)
 		return 0;
 
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
 
-- 
2.39.2

