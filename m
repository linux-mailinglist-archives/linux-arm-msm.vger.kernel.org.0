Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3EA6B9947
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbjCNPaH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbjCNP3Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:29:24 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9713C7EA27
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:29:02 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id b13so16427079ljf.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678807741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rMi4z3KYpk1VOXDtleM/+v4nMkai2X+NZaj5fWAot0=;
        b=GV/tteMajEXLkq7QRWvhGA9tMlhuJp/N2TPtYTY0YtLZQlTqkOTuIJ+KJwU0HqvSND
         xGSr/TymnSrZqWdGV3dGwJHCHSX1GpSUcYgNQe/A8PGmW7SKKznrUpk5ALLQAEMeG9rx
         /XG2RkujzSZ+Ciah38NKKTrq7vN5WRpzPlvjCFFRy/bNyFYfVt8Ef5kxiuulvIT59XoI
         vXAa566h15OVTxr35Iz+0GhOW2Nhhnr+7TqUu03lv+f2t6bBBKynYOG4NnrqcVpOFWKJ
         Zy+TVLtPGwdAQWe9s5RudeIOFXfuel+dLMcI4I3dKyvLmaAfUblEGKcxmRuzgLfwKDD1
         HIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678807741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rMi4z3KYpk1VOXDtleM/+v4nMkai2X+NZaj5fWAot0=;
        b=YPbYagWDPJeSy+o5aiKYdiSfFhuZPHypM6hBVnSTf2ocejraxay1GsFZPsrzUpi9DH
         pgbJG1rRH3lzgC/E+vj+UZmnxjjwCoFwPhpYKEHRxu/1dyimM9No+CS8rmn//2r6bbGH
         K3bUPMzjVori2IX/CjNuHRN9tY6wpznyTlQ3jiAB1nIuWpeQeKNxJQQHL6O7WfvopoaN
         nW3tvWSe/otWfZgcK59eS760Zi0DIOlucYoXWDWHeBn8sWtldbRj4rVPr9kf/AeoDw1u
         rlZLBS3LbGzjR0Ce6N9lWYSuxvuVXCURT+w7wIBlfi/UvdaFpYGWz/4AB41qaRych/JD
         ym6A==
X-Gm-Message-State: AO0yUKVhAd1Xmd52bg8+PVhhpYfQyAWJLi2v5/pG8P8xW5/QvP9/vUyA
        kfEmuAxBDKcJZHB0/F/yxOKyEg==
X-Google-Smtp-Source: AK7set/JjpNvsvf8MV9aq3qP6wInMbwMOVpVCJJNFqgxlkKvmA4HfRtybbTeiYUBXGAMluTsvW8RHA==
X-Received: by 2002:a2e:3610:0:b0:295:acb9:8610 with SMTP id d16-20020a2e3610000000b00295acb98610mr12822310lja.25.1678807740930;
        Tue, 14 Mar 2023 08:29:00 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id 27-20020a2e165b000000b002986a977bf2sm491529ljw.90.2023.03.14.08.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:29:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 14 Mar 2023 16:28:45 +0100
Subject: [PATCH v4 14/14] drm/msm/a6xx: Add A610 speedbin support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v4-14-e987eb79d03f@linaro.org>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
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
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678807716; l=1852;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ZWxWz95kNFsOaOSTnUEHkUaKyj0DdIwF1Eu3I3PdtGk=;
 b=KpKsSEXRQhg/MQJAmTRWDZjQlF+2ofojhmqZlx7eSqwxni5o+DCOvcHjBxCErE0ijWM2Fb5c/ZYL
 mYoD898IBUAF5lQbLmP9ZrsLEqozfQMp+QSYOnwJjDo2iYl97Y1+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A610 is implemented on at least three SoCs: SM6115 (bengal), SM6125
(trinket) and SM6225 (khaje). Trinket does not support speed binning
(only a single SKU exists) and we don't yet support khaje upstream.
Hence, add a fuse mapping table for bengal to allow for per-chip
frequency limiting.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 27b96a335039..f9f1a6c50f65 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2136,6 +2136,30 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return progress;
 }
 
+static u32 a610_get_speed_bin(u32 fuse)
+{
+	/*
+	 * There are (at least) three SoCs implementing A610: SM6125 (trinket),
+	 * SM6115 (bengal) and SM6225 (khaje). Trinket does not have speedbinning,
+	 * as only a single SKU exists and we don't support khaje upstream yet.
+	 * Hence, this matching table is only valid for bengal and can be easily
+	 * expanded if need be.
+	 */
+
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 206)
+		return 1;
+	else if (fuse == 200)
+		return 2;
+	else if (fuse == 157)
+		return 3;
+	else if (fuse == 127)
+		return 4;
+
+	return UINT_MAX;
+}
+
 static u32 a618_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -2232,6 +2256,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
 {
 	u32 val = UINT_MAX;
 
+	if (adreno_is_a610(adreno_gpu))
+		val = a610_get_speed_bin(fuse);
+
 	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 

-- 
2.39.2

