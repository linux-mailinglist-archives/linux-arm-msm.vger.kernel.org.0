Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B60A56D3090
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 13:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjDAL4I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 07:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbjDALzq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 07:55:46 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F0225551
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 04:55:24 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id x17so32258913lfu.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 04:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680350124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2TYwAn1Jyo9PBH+9U5+LtUDgGXL54gtjUvzWRdUK1Y=;
        b=MCDfAhrecL41SY1SS6uJ7vUnQxBWQ8vuGxBhgLKL9MOgthQlKYzvUk4YwBsCv5jJ2p
         GSJAMnbGJl+nQXlULJs1FSsSD74MryfUHLHiDNZRDBUHd7b58qX9d1s+KCKVmcvraKc0
         W533Hf9iG2IsGN7c1+DXlBFdGjAN9FQXLXxFkNafV/3JCOQxuN+0u2Qm7I+8VGbvgiff
         PB0Fb+PWONoH7YXQOWBKts8gCSqJIDbtTHRq4iXrZ4K3YFnaXEyCP6o9W9BWuvXoYevS
         Wj/JDr+sYgjWfagMoWqNFMgub18cjNITLh4rTI4gRpRIdi6L8enhVDzo3x2WQ+rxwlLy
         i4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680350124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2TYwAn1Jyo9PBH+9U5+LtUDgGXL54gtjUvzWRdUK1Y=;
        b=YInAAYcks/ARxSp9smXHHG4/EF4nkdm4YQH3G5qiTWHPvqWNXB6sjQnEJYgE6F3S28
         G/G0rlqpTH9E1Z2zaN4zavoWoAwc9PYpgL9Zzjs+NSN6bVLCUJWm4Lr4FV2cWKmDYkcS
         EAG3p9mdccBR7fo7uD0pLRFymlHmaDMHlJ9Ac1/Z+okbM5Ik5DMWVHOQF+qg26AE1uCe
         BEC1tdAq0KjqN+ctxx1lDDjLwhuIJiCEvOKzPFQjQfJC69uCMtKqXO+YpnyLDPa+MhV0
         o8kv2TzbnfBLq546sc4f9AHQrUlDGHMpie07UDm43L9y9YifKQMxZu/9XYbi7n2+H1W9
         nx1w==
X-Gm-Message-State: AAQBX9cPJmrG+mIJqseZNtPqLSoLpvQFrh5a9oQqiGlasd9Y0SK0LcwX
        eF2jfoT7sr5Pu87WtuV4N3pWAw==
X-Google-Smtp-Source: AKy350Y7b4+rJ7oIMIiEy7rKr+JmgGH1J0f8tpAFMqT1b/f/K/ZRJo33j0ZI8F4dEfux5Qrqr3cw1g==
X-Received: by 2002:a19:550b:0:b0:4e9:c627:195d with SMTP id n11-20020a19550b000000b004e9c627195dmr8145645lfe.57.1680350124471;
        Sat, 01 Apr 2023 04:55:24 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 04:55:24 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 01 Apr 2023 13:54:49 +0200
Subject: [PATCH v6 12/15] drm/msm/a6xx: Use "else if" in GPU speedbin rev
 matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-12-2034115bb60c@linaro.org>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=1434;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=PUHRMhG2i7xarnxRfpZn2n4mbPzcd2Fd9BsLsPanfMM=;
 b=9m5H4CFtN6EC+FWJ//p7SwY92+XoqEoJDeGxyad+OdlVR2aSCDzbfBKcJ+7PZ/AAsHVPruU1PezJ
 w6wcitFEBKR7VUABWMNzhZ/JHGR8NcVQdKNySSAZiH+5yNl8KZbU
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GPU can only be one at a time. Turn a series of ifs into if +
elseifs to save some CPU cycles.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 389a1f7251fe..a802a29f8173 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2171,16 +2171,16 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {

-- 
2.40.0

