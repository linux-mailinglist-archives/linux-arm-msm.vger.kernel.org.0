Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D071772D558
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 02:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233482AbjFMAKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 20:10:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbjFMAKL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 20:10:11 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F57E1713
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:10 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f74cda5f1dso1500678e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686615009; x=1689207009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMZvwl44ms7Xwpm8GNdjd1hqyKGN/MTr2D0GCfzVRGs=;
        b=Be2wPWCeK3qDjIUttzQTXauZvz62GcAITjhMitxj7LDFNiU2TvRxeWXp5Me6TKDx3U
         QBsCYyUvTh3bL5A2fjlGWrB6YBa13Vr9SEnHdTAUnTqBWQHFbqkhDGFQ8abRbuvkX9K4
         qQLD5Ua2gvuWWOp9ayGQ2pqqUGz+cYSISOOuYrrnC2ia5SwrjLiFd4ElVztLr6294oag
         I5FjeW1jGoFSiej984yaXGoRQ0uiCSvlKb5JGqzKfvzJ9Y7IM1psKfphgr070vE2pd8Y
         LOrafVp1FKWvgb/urAjeDVCK88PmPZNbjN6cS1bot1o1DEEh9AOwpv/ygFjiuQPt+uhT
         5aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686615009; x=1689207009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMZvwl44ms7Xwpm8GNdjd1hqyKGN/MTr2D0GCfzVRGs=;
        b=CArvf2iR6tAPW0aLQgA0YuM7FvinsRz7rsIj8PRmTSuTwvmOYLSrohwyS2p7FrVxDC
         o4N84FXovQqec70jcvOJeW4zl/FdOMIeHZJ2tzLpl9KWW8hsYUQuGZhxY/VB7nAYw7g8
         irEs44Nx0wYMDa+zWfw+6TAFHefkJ6CASWfWLoOBHtWvn9MBdpF8EAaJQpyXFdIYPTMz
         P3cH2PkQHXXBH1yoojmFkcK+869nQjv0GrGuE9cIAyIA/TJ8sM+DvJ0E1Nayl3lzO1he
         qSROrVPJlY7y3apfJGOpMkNaD8ZQ12oGgyHCWbn0n4xFJWBRa3ZIX7bESVZSeo9owe1P
         eCsw==
X-Gm-Message-State: AC+VfDx4KC4iOwb3VI9YKdb7ZkEsHWARXMc60he/c9tpFKsbckI7GRGq
        /5wM0UrQViTrhwWzj9ySHmn9ng==
X-Google-Smtp-Source: ACHHUZ6HfcI417Ibo1OlTj65/ufgRzmJVnxaHP4arCDkxcaC+3wx7HrcTfjzOReqWHfhFCOwoymlkg==
X-Received: by 2002:a05:6512:521:b0:4f4:d41b:f421 with SMTP id o1-20020a056512052100b004f4d41bf421mr5681292lfc.33.1686615008917;
        Mon, 12 Jun 2023 17:10:08 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 17:10:08 -0700 (PDT)
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
Subject: [PATCH v2 03/22] drm/msm/dpu: remove unused INTF_NONE interfaces
Date:   Tue, 13 Jun 2023 03:09:42 +0300
Message-Id: <20230613001004.3426676-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
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

sm6115 and qcm2290 do not have INTF_0. Drop corresponding interface
definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index ba9de008519b..031fc8dae3c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -66,7 +66,6 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 };
 
 static const struct dpu_intf_cfg sm6115_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 92ac348eea6b..f2808098af39 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -63,7 +63,6 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 };
 
 static const struct dpu_intf_cfg qcm2290_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index d7aae45e3e66..241fa6746674 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -71,7 +71,6 @@ static const struct dpu_dsc_cfg sm6375_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm6375_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-- 
2.39.2

