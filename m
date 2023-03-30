Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4BE6D1156
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbjC3VyZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbjC3VyV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:21 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6213710A8C
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:20 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id k37so26442817lfv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poUhOJaeys58+jtD9Aa/rVyzrUjEuyrJs5YUCBlvN4A=;
        b=EAyfmThl7iwzELCxzJrxDiyljtz2OJ/SGo7XYlgxzxxT8P2dg463TJrw7EXIB8oUxY
         dGGqZ2l3S2Rmtr2PXW2R+QoYNKqXOzcelPFhxjOuqRwh7mTCq0ulUlpI6+gOqj3HnFJI
         +2bWps0eu35U/JHbNRHv4m0gLsdxnkWdsOwv9LTBT6rxs3CW8yA+Km6wWKAmM80q5MZo
         QVDrm9YsG5VK0JKvFTmfZiYRXThlphWg2RVnkDBdp0/Uxf8/qSe+aNgtEzE1k37HpflU
         fqKKVsrnGt/VErV1xwDEvnIUUXN138e6l5ebJEeb1kAMY3420g50N1xMEdrqpCvBK2ZZ
         GTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poUhOJaeys58+jtD9Aa/rVyzrUjEuyrJs5YUCBlvN4A=;
        b=Lk8TmYqgmAHI/uWccjMTmjRdgu3jqYCZ/eCnf2BAExPVszMbwaizm9OlwQfaATUQk5
         UMUm5TnAEj64BSTZRBczXqq21AOMMNFPK/+GGJHD7Nbk9JT0tDdD2v3AHYEKo4Op7C+J
         tvpss5PbISx5hdurHXUSXEqpJxNg4NsjEHWTGNcq9C0U7hf+VE+H3o8Aco9Z36F0wPf+
         DpxPpoY+9t+fiwQweAWLFHpKsTrJ20/jxVcB7jeSq7X+9jOfLRRAk91D4GBCbNwNGBYi
         jRomtUqJ6F9MSlTtwzyAzp+PEqTpDubPCxgN2SvxBmJMzW6CAiwtDcpgjXuUy/U+cpzV
         9XMQ==
X-Gm-Message-State: AAQBX9eaGvry+pz4XBHgt9l0aLIKF2NX/i5FzMelFjhE1kK8agZByncZ
        09DPgfpNGj77TV27i8aOlqizlC4L4Cy+iVt9z3g=
X-Google-Smtp-Source: AKy350aVqoIlo1aF+bYfcphODXbxeWzt6UG7YNc4A9jd5E+xYjqIU6C2o/C9PlV4Ol3NJXuG2nE/ig==
X-Received: by 2002:a19:8c43:0:b0:4db:787:e43b with SMTP id i3-20020a198c43000000b004db0787e43bmr2223181lfj.8.1680213258775;
        Thu, 30 Mar 2023 14:54:18 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:18 -0700 (PDT)
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
Subject: [PATCH v3 32/38] drm/msm/dpu: drop unused macros from hw catalog
Date:   Fri, 31 Mar 2023 00:53:18 +0300
Message-Id: <20230330215324.1853304-33-dmitry.baryshkov@linaro.org>
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

Drop the version comparison macros from dpu_hw_catalog.h, they are
unused.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 00c3c67dd267..92cef44b5382 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,14 +24,6 @@
 		((MINOR & 0xFFF) << 16) |		\
 		(STEP & 0xFFFF))
 
-#define DPU_HW_MAJOR(rev)		((rev) >> 28)
-#define DPU_HW_MINOR(rev)		(((rev) >> 16) & 0xFFF)
-#define DPU_HW_STEP(rev)		((rev) & 0xFFFF)
-#define DPU_HW_MAJOR_MINOR(rev)		((rev) >> 16)
-
-#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
-	(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
-
 #define DPU_HW_VER_170	DPU_HW_VER(1, 7, 0) /* 8996 v1.0 */
 #define DPU_HW_VER_171	DPU_HW_VER(1, 7, 1) /* 8996 v2.0 */
 #define DPU_HW_VER_172	DPU_HW_VER(1, 7, 2) /* 8996 v3.0 */
@@ -53,14 +45,6 @@
 #define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
 #define DPU_HW_VER_900	DPU_HW_VER(9, 0, 0) /* sm8550 */
 
-#define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
-#define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_300)
-#define IS_SDM845_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_400)
-#define IS_SDM670_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_410)
-#define IS_SDM855_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_500)
-#define IS_SC7180_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_620)
-#define IS_SC7280_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_720)
-
 #define DPU_HW_BLK_NAME_LEN	16
 
 #define MAX_IMG_WIDTH 0x3fff
-- 
2.39.2

