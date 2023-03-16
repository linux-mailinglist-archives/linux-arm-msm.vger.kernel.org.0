Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B76E6BD532
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 17:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjCPQRt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 12:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbjCPQRm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 12:17:42 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB379DCA5E
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:18 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a32so2275102ljq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678983424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7TyjYiVd8H6cPP12mLuPhqB4XyP7gmrhAUkArPxJQU=;
        b=MtQZl+F35CAkxM+I5ybRwKwXdO3n6bB4W9sFDpW+BCdfVRgjldqqkoIMURzKfJZ+Mv
         0HUEnnCqMjIkVzJNnsdsURb8LPqvkvQaWjmqP5ZsA55HYznZ882JnkOtmta3lCcnSiyT
         ljFarXr781/M8RhOo2ZnC6ZVrJ/C+k7gQC8Nkh7xi1R6jk8Apf+hx1HrkRDgMZhR24hJ
         G2nZNbfoMdfITmrxOToNvWxRWTVX39I3NG84oWZVgc+9x9PM9amNWdRnu8Kf7uJoPz8n
         vGqZ6+dXbWRXE9LzrcE29Hb1GC1aelCq1+f835Yk9ngNrVLzDrlIzH4ANiSlqPrJW1Pe
         6UJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678983424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7TyjYiVd8H6cPP12mLuPhqB4XyP7gmrhAUkArPxJQU=;
        b=nnqQ5DvnY4kkYmu/n1p4pWMqReqzuOLVCd/zjZ5jVSUJjpn7feaTgDIkO6FmU5ntAg
         PLxbXX7AZFT+FrmbkNIRtuegcXVeIE0XIAFSMKrirQ0u4o6tnNQuCKL88nWH8lul+n5W
         G6i4MxnYHxQKo1bHENC4KWbKRCyu+f2Oxi7/REyuO5JhCg7f2x/HRQRMh0qonyWpom7F
         eABmFj5agHDC+TLQAS/ImchW8UxG+E8nB2vVtz5qjks27aPhRq3e9v+68CYfKuwEz6di
         HwN6ZdWoZumHFAjyg63oAUmo7wTMcJc9fFIG5nBNC0MKj202owf2Bx95+FyO+FdWyI14
         CPPA==
X-Gm-Message-State: AO0yUKV6j8HLmO6ANj+pfSG6V/UA2Pd9ld6oDDBNxO0mkhPhHqAQuGbZ
        PcL7F/M1GOSdk/ndLoGkRGPe6w==
X-Google-Smtp-Source: AK7set96GXTt8KQa6ogjGY6ZIbgkm1nSvlTZwWBwZGJ75oQmEWX6GQdjGmKttjQ+zXjBYAJ5rB0VkA==
X-Received: by 2002:a2e:80c2:0:b0:295:ba28:a42 with SMTP id r2-20020a2e80c2000000b00295ba280a42mr2126679ljg.20.1678983424494;
        Thu, 16 Mar 2023 09:17:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:17:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v7 10/32] drm/msm/dpu: clean up SRC addresses when setting up SSPP for solid fill
Date:   Thu, 16 Mar 2023 19:16:31 +0300
Message-Id: <20230316161653.4106395-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
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

Set SSPP_SRCn_ADDR registers to 0 while setting up solid fill, as we can
not be sure that the previous address is still valid.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 3030cd3b253a..0a43c5682b2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -563,11 +563,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_sspp_cfg cfg;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
+	/* cleanup source addresses */
+	memset(&cfg, 0, sizeof(cfg));
+	ctx->ops.setup_sourceaddress(pipe, &cfg);
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
-- 
2.30.2

