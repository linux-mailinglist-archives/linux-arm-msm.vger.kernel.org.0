Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7256D115F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbjC3Vy3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbjC3Vy0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:26 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D000B10402
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:23 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c9so15966527lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mg71u/7TiS0yeZEc+ean62kiFm+Wj1LDeVN5x0ynJuQ=;
        b=RlE3Jk2kza5Hn6wvqs8H9mJXXZ+sdzAOFGgtcnJZg4LtCra7uRcpSy+7UvgmmCa9g5
         agx0CxEhawLxeIbUZHi2wMEtvFZuaOJKcdive7Up/dSmymfpJpx4h3gw6tkPZW+hItCV
         SH0fah8/KsavNF3uTWEwCXk6mt01FGz+etcOFaEZ40gcTTIK3nMSBMlnsIhlr0aZ2YKh
         AnbfVz3yYB3cR3jwBvGLs+J495z3jhH7W7avBbrpF1Zm7IpMtNanzFeKIUotsfz2iBFo
         TyS1EZ9dT8pXURKsEq2wZkJaz8KcaySwXDs1dx7NLVRStYhN6u+8HS+Ph/mcTwlkKsWA
         BlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mg71u/7TiS0yeZEc+ean62kiFm+Wj1LDeVN5x0ynJuQ=;
        b=iUbZJxUBmLXgCI4pYxEgkEmdKhdwBHIwwukVuuW4SgD23nKRBsutzRzBHmu99JbS/L
         /jRMKhdSFTO/leKVvpO02NARhqfjV4cfCYziQo8t8KrD8rOLDy8DgFixUa3e5vS/prcE
         xLyon2VgJatzsHHxdkJAwGQn3Rs0z4SFXgghDL2ltYhBDuA/cjR98zUz7OnTsEPdYDoz
         WfKpNs4uyPEmzzoy1Gox+HYPuqhuHdDtN8h7dKWm8IVnD/R0xoRg12054H72ZzwdWtHF
         S0FnQCwdvWVhwPNogMxdVEbsmnqchhdWI0hjDDtej3OqjFy3K3oEBeMo/l+Oy1/U4BOF
         p6jQ==
X-Gm-Message-State: AAQBX9d2bKKdCc6IzhGV6IKTzsXifPrn96prtWVghiMSohtrZduotA+N
        Ctp7BfO8/dO2JNZAFVz+1JZLug==
X-Google-Smtp-Source: AKy350Yq+zO6EudWHj9Ls+EFPMtnQ5dFAOYX4oVyujhvLt4gbmYXlKaK7Iy4Wk0zRJVvHlG1qMqGKw==
X-Received: by 2002:ac2:51ad:0:b0:4eb:c18:efae with SMTP id f13-20020ac251ad000000b004eb0c18efaemr5579067lfk.17.1680213263400;
        Thu, 30 Mar 2023 14:54:23 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 38/38] drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version
Date:   Fri, 31 Mar 2023 00:53:24 +0300
Message-Id: <20230330215324.1853304-39-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To ease review and reuse rename MERGE_3D feature masks to contain base
DPU version since which this mask is used.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 96c5b94264e8..d74029f163c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -88,7 +88,7 @@
 #define CTL_DPU_9_MASK (CTL_DPU_7_MASK | \
 			BIT(DPU_CTL_HAS_LAYER_EXT4))
 
-#define MERGE_3D_SM8150_MASK (0)
+#define MERGE_3D_DPU_5_MASK (0)
 
 #define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
 
@@ -529,7 +529,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x100, \
-	.features = MERGE_3D_SM8150_MASK, \
+	.features = MERGE_3D_DPU_5_MASK, \
 	.sblk = NULL \
 	}
 
-- 
2.39.2

