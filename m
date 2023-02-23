Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD216A00CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 02:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbjBWBru (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 20:47:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232947AbjBWBrt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 20:47:49 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB4D457CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 17:47:47 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id n2so9192351lfb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 17:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGhJ8k8BvYcG4UvdUcw3fi971zbE82bjXqWQD3F+nXY=;
        b=ldmW/ilzYBZSCA++GxzPyyWkJ9St3Yw6f0acU3vMlovh8nGZ09axkbDopIWmHhy5r3
         RKk+BcjWDQxjERBaHcat7fpz3LJGOOObvDIDk0MZuhT9fQhrNKcIOUJ7YqNe1DhsMtHD
         UEsQoAHfImfOpsgDVwB420ikxTcKMboeuC+1TOyiVcP1cjUJK4WQGj6QBFQXsyvORhhG
         OkuE3Xv1cU+UU9JiEEBxVqX2kQ+5BFKiY0XmeMPx5AS6ZVoVW3is9ZoxctlOPDFuBG4R
         WS8lBPianCAIhWBJuj7YyR9+Rm6l+U5D2DUx3IRJ1yhA9DEGXSnLzEzQRpbVqRIqzdZF
         MF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGhJ8k8BvYcG4UvdUcw3fi971zbE82bjXqWQD3F+nXY=;
        b=xixhi9No+6U33peaTB88+HiJezk3HbzVd+BLESgjk0kpu71gSvKBCOaDM+ZNUuaYA+
         8u2VDT5IZqLHtjdgt14SFD5NKTreVqqx5B9DyhL1XE+CQMG5dZmGdHf51DRu1pQh7U3c
         S/mo4TE5c8KAhsFifkgXqrJI1539dLqRG/95AmxP3eKE3Ux/y7hv+4xfZ5B8h1g8Mydo
         OTdU5cS/ieriHXDDamlxBdhPR+qbM5piZTzjbVe6tZ4nwZ7zJ2XzMxtMnRuvgkjuufzc
         2FrpehyQkjp93ApE+ciDO+dH6Rl3Qdz4QICWXs2zataK7PALLffyh4MQdA8g3YVLTnwW
         w24A==
X-Gm-Message-State: AO0yUKXo8LTdAZJ8Qr4tv+sqeQHIcr0fsvt4cS/lCAB3PgOKCqnpUkfu
        bF73HB/8gX31022N85O+OlAQkQ==
X-Google-Smtp-Source: AK7set9PMp+yF3wgjC3PGFWQ8f6vxlGN6VYMdTeVO7IMMHRkvT3q22dmsGb7RDmy4uqz1vm6Ewjb2g==
X-Received: by 2002:ac2:5207:0:b0:4dc:8192:c5e6 with SMTP id a7-20020ac25207000000b004dc8192c5e6mr3568694lfl.13.1677116865722;
        Wed, 22 Feb 2023 17:47:45 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id 12-20020ac2482c000000b004dc807b904bsm427376lft.120.2023.02.22.17.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 17:47:45 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 23 Feb 2023 02:47:41 +0100
Subject: [PATCH v2 5/6] drm/msm/a4xx: Implement .gpu_busy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-opp-v2-5-24ed24cd7358@linaro.org>
References: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
In-Reply-To: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677116858; l=1379;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Mfqjq6oPzn0mWycAv8UA9lcR+KDEDYvYmMvB7YZF6m4=;
 b=Mfz5NyNGrq9Nm2ebit78yYPih/DJD0y9rsEuSb/O6TQITG+HY8Lpy7U/ZcaAMxslu1ZDXovwWvec
 Sl2idkBSBQcCcNyqzRAVoMvNDIdkXp2SWe4SvswlugR1Av5gR6yI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for gpu_busy on a4xx, which is required for devfreq
support.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 3e09d3a7a0ac..715436cb3996 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -611,6 +611,16 @@ static int a4xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	return 0;
 }
 
+static u64 a4xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
+{
+	u64 busy_cycles;
+
+	busy_cycles = gpu_read64(gpu, REG_A4XX_RBBM_PERFCTR_RBBM_1_LO);
+	*out_sample_rate = clk_get_rate(gpu->core_clk);
+
+	return busy_cycles;
+}
+
 static u32 a4xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	ring->memptrs->rptr = gpu_read(gpu, REG_A4XX_CP_RB_RPTR);
@@ -632,6 +642,7 @@ static const struct adreno_gpu_funcs funcs = {
 #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
 		.show = adreno_show,
 #endif
+		.gpu_busy = a4xx_gpu_busy,
 		.gpu_state_get = a4xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
 		.create_address_space = adreno_create_address_space,

-- 
2.39.2

