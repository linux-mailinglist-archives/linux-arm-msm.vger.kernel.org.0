Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 627A87D394C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Oct 2023 16:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbjJWO3n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Oct 2023 10:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjJWO3m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Oct 2023 10:29:42 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799B1100
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 07:29:40 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c16757987fso48919851fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698071379; x=1698676179; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=59STP8IG3xhkl1R+OwWbm4nT/u7IRLl4iyf5Y7WczEY=;
        b=aV0lQEgNe6nzRLj3kLeArWz6mRwwpsfCl3CEcohtUfp13PW43qH15/GLwPHrI1mEqc
         WSQBtuEdiw1WwfisryebMepzGcMKdic94zTaOIKbqeUzVrYF0dWI8I61JSV3t7zeluSw
         4bShazqB5AtdEO9JU0Plo9EQ8BTwAsXuwUZXAw58BsaMKTmIGQp+uCkTn5n/3aBnA4A3
         xRledW4M+q3LU+n0iav6YSEArFDOPDmey7Sn8WJAmBfa2YUDPaoPUI1ADpgll1NiOS1C
         VxbRzlAbHS6osSS6AryQKicMHszh2C+WvpMKc+IjxSFaSNOMS1/Zsabo3ocqj/3R5z0p
         l6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698071379; x=1698676179;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59STP8IG3xhkl1R+OwWbm4nT/u7IRLl4iyf5Y7WczEY=;
        b=P99uKBfsVt8zWvBPytayusPw2q5aom417LZcNad0P2v29RVXJz8jl+w2wiw2DqiozB
         DH4WL2GeS5KoUvbvzUzDatdwUi/tfvO3PcyUfEWZe4gD9yeTBUR0Hw8FchkhH+oZF3w8
         Msbd2IbBXobm1fPzIcsls3NGSVPpOGkr4Tl1pqzMbtGlVcOMvmRwgnIQRGq/2GvxC6rh
         nP033VbYQJbmyFcoj7RggMMc1PVi00ukipFYJhiDNtLHplMXS0jks7D9M06OL603lB9b
         QdDe+PuNNoRx9BU5+pPoPV321lwUYLZJ+qXcG4P4J/tWbS3cpkLJQh9fnXsqLFFdlQDO
         COyw==
X-Gm-Message-State: AOJu0YzZETMV0SbYaD8MjUJDjEYh8gF58zSEONYvbrSt+v/OwmzWQYHa
        wRO0MR+E9bMBi9UHyyZxarpv2A==
X-Google-Smtp-Source: AGHT+IH5WFoFfyNzJgl4CLmejLA/ZgHuJygZLcv0FelZqLu9BJ1k+mLHsMaN3Mm0ni7tH5Yu0rnSiQ==
X-Received: by 2002:a2e:a7c7:0:b0:2c1:5645:a2c0 with SMTP id x7-20020a2ea7c7000000b002c15645a2c0mr5768343ljp.35.1698071378607;
        Mon, 23 Oct 2023 07:29:38 -0700 (PDT)
Received: from [10.167.154.1] (178235177080.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.80])
        by smtp.gmail.com with ESMTPSA id t13-20020a2e8e6d000000b002c4faf47378sm1616655ljk.28.2023.10.23.07.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:29:38 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 23 Oct 2023 16:29:31 +0200
Subject: [PATCH] drm/msm/adreno: Drop WARN_ON from patchid lookup for new
 GPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-topic-adreno_warn-v1-1-bb1ee9391aa2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEqDNmUC/x2NywrCQAxFf6VkbaAdB0F/RUSSaWoDJVMyvqD03
 w0u7uJcOJwNmrhKg0u3gctbm1YLGA4dlJnsIahjMKQ+HYcYPuuqBWl0sXr/kBvmRP2ZOfN0yhA
 eUxNkJytzmPZaljhXl0m//9D1tu8/hqsr1XgAAAA=
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698071376; l=1189;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=CI9uW4HFCd+sT4l3B8ani/4HRFmQfbbgjJhTrM3t/ig=;
 b=SCcIvz1UzYt8XexR/pBOz+V+i46dV2cDA1630eMo2ve5CMi9C6GzQ58HdfRNOoV17ffhl+axh
 GqYKdlDyyY/DwK9zWKbyUnlzLfk2p9kjX0+mVT5IVcj8WRb7GEdWRi7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

New GPUs still use the lower 2 bytes of the chip id (in whatever form
it comes) to signify silicon revision. Drop the warning that makes it
sound as if that was unintended.

Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying GPU")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 80b3f6312116..9a1ec42155fd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -203,11 +203,6 @@ struct adreno_platform_config {
 
 static inline uint8_t adreno_patchid(const struct adreno_gpu *gpu)
 {
-	/* It is probably ok to assume legacy "adreno_rev" format
-	 * for all a6xx devices, but probably best to limit this
-	 * to older things.
-	 */
-	WARN_ON_ONCE(gpu->info->family >= ADRENO_6XX_GEN1);
 	return gpu->chip_id & 0xff;
 }
 

---
base-commit: e8361b005d7c92997d12f2b85a9e4a525738bd9d
change-id: 20231023-topic-adreno_warn-42a09bb4bf64

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

