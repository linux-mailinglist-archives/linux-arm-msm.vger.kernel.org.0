Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2738E6DB7CA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Apr 2023 02:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjDHA1z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 20:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDHA1y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 20:27:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5584FE1BA
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 17:27:53 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i26so483248lfc.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 17:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680913671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsyKZB+D1tDZFHgYJ4nYnuAQxnj0NBUo0WN0E3vSvz8=;
        b=NlvOLk2Y56T0fwX79yVLjJGI5j879fgEL5zhJt67rHQAXuk2daI9u1kLkCXSSVp1sg
         U46Rq6c7hKYD4MyzrwVzMX7/Vz7W9PNoMxQ4RFWr4myqgBxxBx2Kx3oyCrBQBgu55f42
         l3qa6VTU3jK8DKBDYUP8pGlpD7hKPsfYIpJ9itaxMmALEl2TsN66HXszJJDjYTq1zJuO
         36vUJl9plOYYDfDd03BhwXQmj/2C96NnSquLHaqUajxYX1CW5OqmAivzjWuqjVxdtvOH
         U/gbjK+bx4OjG8Kl5kXkvs3iv8AOqTbcaq7x4vL4dzHNa2TaqItE3cxoU6LV/Wbea66C
         QPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680913671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsyKZB+D1tDZFHgYJ4nYnuAQxnj0NBUo0WN0E3vSvz8=;
        b=m5fFfbwHWNYdWqzNbwgoq8IHJDlaEv0KJ3xTtOcyRgb6CzkHHvejb1s8/RILveymOq
         hyqAHRxrixLnUEurIp1yWULSHq9IVd+SyDxesAVoFawS0weyiVm303lmayLkHrzs3Jk0
         J3QXyQrtUWPo9fwCzZ+/S3Md6fQiVBEtdE/iK+2jAU7BBuc2r9Rv3mCfV8QGV1V1JYTu
         yl4X8DE3PGLWTq965Au6vYA7xKV/m0RiANtaCoHkJ7Qwa5t4iAfZtLbtUqkCTpaxB3Db
         vp6eudH427JNjCAaBp2K8/eTITBavCz7GO1XUxO/Rw9a2LnMJVGIwXI/6RM7qKNhqllz
         s0fQ==
X-Gm-Message-State: AAQBX9eGPsOd3pflzB7z04vpdaGcLLnmS9WfYjCd7Ah/ssTgy0jCNv/k
        T9mkFcJ9XBUfMHIDlCBsCl3dHg==
X-Google-Smtp-Source: AKy350YpHkd6OCTnLxCT96ewnA6MFSt7fuXBRdgMA7jCrAHRUqCS0Bs63YreBas+vmLB7je2iUFycg==
X-Received: by 2002:a05:6512:318e:b0:4eb:4274:df34 with SMTP id i14-20020a056512318e00b004eb4274df34mr907019lfe.9.1680913671724;
        Fri, 07 Apr 2023 17:27:51 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q15-20020a19a40f000000b004db3e2d3efesm915759lfc.204.2023.04.07.17.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 17:27:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 1/4] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
Date:   Sat,  8 Apr 2023 03:27:47 +0300
Message-Id: <20230408002750.2722304-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
References: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
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

Theoretically, since sm8150 we should be using a single CTL for the
split panel case, but since we do not support it for now, fallback to
DPU_CTL_SPLIT_DISPLAY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9aab110b8c44..622992ae53ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -42,17 +42,18 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-- 
2.39.2

