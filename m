Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCF9A6BD667
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 17:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjCPQz4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 12:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbjCPQz4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 12:55:56 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18EF067011
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:55:54 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y20so3196683lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678985752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19Mh1AennFks/7EMfm7YcmHqybWalPcK9N+h2nso4NM=;
        b=Q+o8eaXaggd1xHv+8/sP6VRDJxypKAktrx/6oBZIIjSUhStHdjLahQtABJg+cMnwXA
         ynHkEf1cOQGg1QjLvdW/qb/IVlNxVLQq4j2jF6lN1JLRnYpoeJ7gkYi4AVRUh//mbiZG
         JXgOzf/1qvJaqnPZ2RkAkBTJo5NVuXxS1NjYpN/IJ6rHShjxoVEEHv+QwFs847rGRPik
         dgV++9wT24qXSsVDhWWyMTP+rBkt/W9rQQ8h6ZlasOHTwZEW5OPxG3dotbDfjUmZqfnI
         8ZIljT3wXUNXNVQbdlyKfGmEFaCI9yWIXVHlFv1pxGjqQSpdKX7HOhcPjobp9AhfQCub
         lL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678985752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19Mh1AennFks/7EMfm7YcmHqybWalPcK9N+h2nso4NM=;
        b=co87ln4IDqhaAm9UgfzHI4fViBGuTC/J+TDWfARhQ2oWw14EHg5cierJv4bivUyvdf
         2RV4M+D9K+42cuG2qFSKNCC00xDnj3aPdpWpKKSow27uV6ZGQpZXshVHHhab4ccIAOrI
         8v4sz5mCgF5h62IOoBnYIBt1togAayQcKKxCqELGrqmFA4nd1AgDuxHfiV6EpKAIGOPd
         4aJISd7zrkv0xw+5Eb3rId2ozeXL6egFxZfhORiXbY9/m+49+mCySnPxXTPMZ+ciKkr+
         Rk21/Iz+Isu9GsvMS/4eQ+Iv+Zbx7JrSugT65FBDoWK39GmtoIaCiJME4qof5s4aC3Kn
         2kKg==
X-Gm-Message-State: AO0yUKWhwySmDjLCg6mg1mPXx5Bu+hLMHfuH2QenL+sepH+B0Go3GZ9Z
        HO3TTeSTdgFq/7LG4t2LeuPD9Q==
X-Google-Smtp-Source: AK7set+nYuz8YwiKTrnQtWLuDiOY4XU/ENQTxKx8hmpu+ck9GdvxnRSfeEZXYQkyc6rQmBvTYZh32Q==
X-Received: by 2002:a05:6512:3044:b0:4dd:8190:a26b with SMTP id b4-20020a056512304400b004dd8190a26bmr27177lfb.13.1678985752498;
        Thu, 16 Mar 2023 09:55:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t18-20020a2e9c52000000b002934b5d6a61sm2661ljj.121.2023.03.16.09.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:55:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v1 10/12] drm/msm/dpu: add a field describing inline rotation to dpu_caps
Date:   Thu, 16 Mar 2023 19:55:40 +0300
Message-Id: <20230316165542.4109764-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
References: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
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

We need to know if the platform supports inline rotation on any of the
SSPP blocks or not. Add this information to struct dpu_caps in a form of
the boolean field has_inline_rot.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2d6944a9679a..33527ec7c938 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -489,6 +489,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
+	.has_inline_rot = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.format_list = plane_formats_yuv,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4847aae78db2..cc64fb2e815f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -400,6 +400,7 @@ struct dpu_rotation_cfg {
  * @has_dim_layer      dim layer feature status
  * @has_idle_pc        indicate if idle power collapse feature is supported
  * @has_3d_merge       indicate if 3D merge is supported
+ * @has_inline_rot     indicate if inline rotation is supported
  * @max_linewidth      max linewidth for sspp
  * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
  * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
@@ -416,6 +417,7 @@ struct dpu_caps {
 	bool has_dim_layer;
 	bool has_idle_pc;
 	bool has_3d_merge;
+	bool has_inline_rot;
 	/* SSPP limits */
 	u32 max_linewidth;
 	u32 pixel_ram_size;
-- 
2.30.2

