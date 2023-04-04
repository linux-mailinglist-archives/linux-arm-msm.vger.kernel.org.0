Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC6C6D6224
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 15:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234958AbjDDNJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 09:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234976AbjDDNJ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 09:09:28 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC45170C
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 06:09:25 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id y7so1341082ljp.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 06:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680613764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3Fx3sk6Vn5lZzb/pUoNHIe5WMfmNRaGDKPmYFHhJvI=;
        b=GBCLKiFtcawE3NWz82ifekpZfkzi6SZJzphv4ONq67WMTNMc0Xs7+xCHUsy78IhbfV
         kfWpmu9OY52ApNyBeOTfvsOYePmk7TDsx41qsj0T0sa4k/64JxZhzi+Tc1oqtobMmoxX
         b0V4ptP5H/6r7SSEp6YzO9C16yRIBK2M5CUhQ+xFXhjq3lIY4sBmGw5gI1VZnb5zhkfY
         Y5pTmOkApc+LIFaSynPxyOZxjSre3ryWmnZSK2ZfVk3D9pGiFpw80CNUHzBQkkhtMUy2
         ApUMA9n5iFmpEmkNox7ahwcychsRi9kp9tALElZ3oP+hGWQ4txV5agorewOo5mqyNz2G
         U5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3Fx3sk6Vn5lZzb/pUoNHIe5WMfmNRaGDKPmYFHhJvI=;
        b=x0JP8r3opzG5q+rAToV8Rhab/+Hp1l3A8nhw5gqWuq2J/tLSaknMrjikNDKghH57KK
         BSejfMqwZeEq4wMY3s83x5rTY0i6UQxkd0e7CH7dK098hTYj29UESXFXZdCdkpHirmLg
         rTm/gIX4lWXlnqM0NXR+w7G2yclmVh7G2AZcDxeG1aiND2cUwvi6nasZEi0gDMaOItBg
         HkAa/IbrR5hdc6DXknepVAJO9cIJ/8S2/Phru9MT/zvVK0FwXUPXcwBOH7IgPkd/HeSD
         oyxiLq2/GkZjPzqqb8UTh/DekLyfZV3UuAhErPTEgElzB7p25HdJQ+rJ5p8oXDA08uk7
         NzUQ==
X-Gm-Message-State: AAQBX9dWRE6bk0DOn5yCa/CX6r2c+zUOEiI9nM0rz2c7aKuMsBt88pCb
        GMLkn/IzPBA6zL/pdIMWo2SoPQ==
X-Google-Smtp-Source: AKy350YymQmNmYx7ky4qkixUz5KwnKiqsiPqms3ZBxxlMT3nOM/mz6XPYUJkzXNXdJUH3d8I+z6Jlw==
X-Received: by 2002:a2e:b046:0:b0:298:b333:4267 with SMTP id d6-20020a2eb046000000b00298b3334267mr960471ljl.18.1680613763866;
        Tue, 04 Apr 2023 06:09:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:09:23 -0700 (PDT)
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
Subject: [PATCH v4 29/42] drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
Date:   Tue,  4 Apr 2023 16:06:09 +0300
Message-Id: <20230404130622.509628-30-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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

Use defined name DEFAULT_DPU_OUTPUT_LINE_WIDTH instead of open coding
the value.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 39894cbf456d..d30b797e90e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -8,7 +8,7 @@
 #define _DPU_8_0_SC8280XP_H
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = 2560,
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_src_split = true,
-- 
2.39.2

