Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2A570CCC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 23:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbjEVVpe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 17:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbjEVVpc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 17:45:32 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1590E9B
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 14:45:31 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f00d41df22so5038050e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684791929; x=1687383929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPZiyM+41u6KV41f466UiDSi20dbWDpELFpeisbXMJ4=;
        b=kwLUVb/RYRXphumuuqIPcHjZNC8S1lqilqqEA3cBLONADHlwQAYfa80jx2YNLHEQQ9
         iyQf2K9TcDaz4BW1XtGrsZuTeyn3XDi3VlELLNMosUnkFVfsjCpfLZt3diwRIEHhUElC
         8LlX2FfGZXzn91Ciiy6lzRLYdI6PoQ4jjY6Nu2rPMTb3KhvmnM7shAh5DhsTKpHyhrgA
         I8l8exLUObliXYi/S0zgG2gcVxvCqBIElpyd2VUvyYyicGLKPNIi3igQ3oqzNd5MQwv6
         HG5iY7uB/nC7OFwyghTF+zXOrSqJ2YFj8kdUA1j+4vPeGmZDgm47t0+Tqn1sBFFB8+ib
         gWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684791929; x=1687383929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPZiyM+41u6KV41f466UiDSi20dbWDpELFpeisbXMJ4=;
        b=A2YXGORG1hL4RS108wRNb+O6COBYGRIQ/fRkW111DRkMkaTwcmGwQHAmjpmhAxK4Zb
         rpT+ynA7k5pO5L7zEYJ70+u/la1kaYktn7+k8SZQ6SPsPky2vhCReBziGiviGMeZ3MyJ
         tvCJGMBbBVqLhf9V3YORvnlnVZ5W6xRQDc5fdr6ic86PaY2n4fSU+nNzsdrsnJHX6pSo
         ONGEsk0e5C5GVLioTekWchOGjCct5t6eFWllKkqyCZf4Jk1BchwwAxt+P6fGKdUioqJ7
         2yoJj5UKZ0OJwnPfg4zL8R+FfvLx7jua0FoGTY4BauMPYmPfH5co3lFBAwnRYRmYmb68
         Hdbw==
X-Gm-Message-State: AC+VfDyWuTgm/oEM4K4syn0ULOywl+JwCS3So4Ht/+K23yItEKrOaior
        /LCJtOy3VJSMKqfjUbKpKrLKVQ==
X-Google-Smtp-Source: ACHHUZ7N55ew+3ZF5N/qRmIuviul0GR4XA/TKZFj9YvHhFZWy9M6af1HDlhR/8Nr8uEW7b4txVtw+g==
X-Received: by 2002:a05:6512:b0e:b0:4f3:7974:2f32 with SMTP id w14-20020a0565120b0e00b004f379742f32mr3940967lfu.9.1684791929333;
        Mon, 22 May 2023 14:45:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020ac25507000000b004f2543be9dbsm1106918lfk.5.2023.05.22.14.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 14:45:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 1/6] drm/msm/dpu: don't set DPU_INTF_TE globally
Date:   Tue, 23 May 2023 00:45:22 +0300
Message-Id: <20230522214527.190054-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
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

Using BIT(DPU_INTF_TE) in INTF_SC7180_MASK (and by extension in
INTF_SC7280_MASK) results in this bit (and corrsponding operations)
being enabled for all interfaces, even the ones which do not have TE
block. Move this bit setting to INTF_DSI_TE(), so that it is only
enabled for those INTF blocks which have TE support.

Fixes: 152c1d430992 ("drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1dee5ba2b312..162141cb5c83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -101,7 +101,6 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_TE) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
@@ -544,7 +543,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = _len, \
-	.features = _features, \
+	.features = _features | BIT(DPU_INTF_TE), \
 	.type = _type, \
 	.controller_id = _ctrl_id, \
 	.prog_fetch_lines_worst_case = _progfetch, \
-- 
2.39.2

