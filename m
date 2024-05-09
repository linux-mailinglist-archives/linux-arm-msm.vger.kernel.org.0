Return-Path: <linux-arm-msm+bounces-19600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AF68C14F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 20:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 502711F2125D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 18:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5307EEF2;
	Thu,  9 May 2024 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L0eH3QZX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E453B7CF3E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 18:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715280092; cv=none; b=W+2CoNUOBTRFcwcV4GWfnw9WNvpxz2JIXupaMi7HCrqrpi+Ys5YhrDkkInM51j6OTO9UUMthda3YHafgdtYzgQ0WH+gKnw8ibMlMeBsW+CYcYswqbQOcnheSuf4evDa7s5Bb9NmMW8K5d+eBrG+NmB2R/cwAhMjU3qEkCR/4WIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715280092; c=relaxed/simple;
	bh=z6XHl5llDJyiHPA78/v4DUNEAeOPZTfmTPQPFm4H3Nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W77bRSqad+HkduJsEwPW3ivnGNq5/4BNidFmEGoFPJv4ysHKaoM03cvQFq6xJOVjj2sEaWi6KxpAni0+UqE/7kNx7VIAHv8w9r35eQZenbHMH7XXLQKJTLq+6pgeE19DgLFWyvw0n/ZhMSO3WrtovoAcmLAI95kV2o078thOu/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L0eH3QZX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a59a64db066so309217466b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 11:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715280087; x=1715884887; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mqPEfUzcM7hu8r9fmVZs+WucUjP6utXCGhcKPrzzj8I=;
        b=L0eH3QZXygPjvMUIMMzJ9GOIlykb2QPjVKbNV+1BAeDhhErNfrxUoktUvp+GpCIfcq
         shAEb11u430KWbv7YLXKjEqYpmCZtQmRQuaoTH8GBhJLy/yjrY7UhdXqhIOIMdlmjMGl
         PvIoxOmRP1tf5F12ihuBeE+/DWYgRqYed3JVfsKG0F/DhiOpSSY0Mgx+oX5KuhnQ8P7o
         +wLPUYFTY8rB4QSkNsJDCkRv58jSwhA23JqIwtP0xdezx1PiKJ1QMM7qAcwJi2O3r+J9
         hH4LDo8L2C6Sq1URWhfam+LaH07BSNlwX/djqrBwrFIRr7GCTvjuOQZXx/yIv80oVUL0
         Eu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715280087; x=1715884887;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqPEfUzcM7hu8r9fmVZs+WucUjP6utXCGhcKPrzzj8I=;
        b=djqTIVQME3WMPXkiNl0UcEU8aB/lMxyV130tvqOlOOCyZx48aVl6EOvQJ4WuTiXiUL
         PFZdmx8Iha2xJRgXBeVXwDpyAmGJ58otNFYygI35r9xuqU2Z5s1W+x7e/q5Hr+H/pCle
         9zEDvS1Pe/FfJB8xfbwS0u9ex5axyqRu57ixcV/pi7o7e6qHOxGcDGffW4JOeA8JcfQS
         ooB7Vp9QPYKCPImt/oxq4MAg+M5dmpy4S+mcV34spZbuwr5VXyDKnv8hfJ04l18Txbt1
         a5/bAOm2k44V4UlM77WrvzIbWthQdRnqzrMOJQGqghWfnAeJM+NeQGkc3cDtOZnJ96EZ
         DCng==
X-Forwarded-Encrypted: i=1; AJvYcCU4OoZZ3juz5Zuu4CdIaVS/cREEiOdhykikwcIBHFfnr9dSgZGLgJ8il2ynUKikwpKu31PEBOMNjqlFaBgML6IxnwEJAl1ii7C2RWr1jg==
X-Gm-Message-State: AOJu0YyoCEa4L9P7VnKEds5Y2Cbu6Uf+BwtPQnB8Vuqbf7ES+JaXNbAq
	1jLDJ4IXzU6ucE2y3dIM7x3BKEykY60OSN4/BYZ3R3c/ZuitnL+9AgYhR6D7q7g=
X-Google-Smtp-Source: AGHT+IGhx7HNcYGITxPU9mNn+ku+A6vTT7YBFccM+yXBc7Idaz4Uq4aqT5RpvZSXeN7Mp2i7aNrD6Q==
X-Received: by 2002:a17:906:aad5:b0:a59:a9c0:57e9 with SMTP id a640c23a62f3a-a5a2d678775mr26706966b.76.1715280086983;
        Thu, 09 May 2024 11:41:26 -0700 (PDT)
Received: from [192.168.62.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01517sm99929166b.157.2024.05.09.11.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 11:41:26 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 09 May 2024 20:41:23 +0200
Subject: [PATCH v2] drm/msm/adreno: De-spaghettify the use of memory
 barriers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-topic-adreno-v2-1-b82a9f99b345@linaro.org>
X-B4-Tracking: v=1; b=H4sIANIYPWYC/1XMQQrCMBCF4auUWRtJo5HGlfcQF5Nk0g5oUialC
 KV3N7hS3upbvH+DSsJU4dptILRy5ZIbzKGDMGEeSXFsBqPNWVvt1FJmDgqjUC4KB3dy3pl0MRb
 aZRZK/P7m7o/mJOWllkkIfyPDf2TtVZtHH7UNfe/i7ckZpRyLjLDvH2cr00SjAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715280085; l=5092;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=z6XHl5llDJyiHPA78/v4DUNEAeOPZTfmTPQPFm4H3Nk=;
 b=bWXRy6aulY2LTlIiaVEc91Yo7C4I8hLO+xSdtizQpxkFS48xA6mHIfG9nDAHOLmFZvLwxWUvl
 6ts9tcSY/TPC54E2eMJRWZyg7uk7mfqLrJeSHz8/kdeQTuvUHduzFyd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Memory barriers help ensure instruction ordering, NOT time and order
of actual write arrival at other observers (e.g. memory-mapped IP).
On architectures employing weak memory ordering, the latter can be a
giant pain point, and it has been as part of this driver.

Moreover, the gpu_/gmu_ accessors already use non-relaxed versions of
readl/writel, which include r/w (respectively) barriers.

Replace the barriers with a readback that ensures the previous writes
have exited the write buffer (as the CPU must flush the write to the
register it's trying to read back) and subsequently remove the hack
introduced in commit b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt
status in hw_init").

Fixes: b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt status in hw_init")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:

* Introduce gpu_write_flush() and use it
* Don't accidentally break a630 by trying to write to non-existent GBIF
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  4 +---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 10 ++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++------------
 drivers/gpu/drm/msm/msm_gpu.h         | 14 ++++++++++++--
 4 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 0e3dfd4c2bc8..fb2f8a03da41 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -466,9 +466,7 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
-	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1 << 1);
-	/* Wait for the register to finish posting */
-	wmb();
+	gmu_write_flush(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
 		val & (1 << 1), 100, 10000);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 94b6c5cab6f4..ab7f581f0d24 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -111,6 +111,16 @@ static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 value)
 	writel(value, gmu->mmio + (offset << 2));
 }
 
+/*
+ * Use for timing-critical writes that must reach the hardware immediately
+ * (to work around write buffering), e.g. for reset registers.
+ */
+static inline void gmu_write_flush(struct a6xx_gmu *gmu, u32 offset, u32 value)
+{
+	gmu_write(gmu, offset, value);
+	gmu_read(gmu, offset);
+}
+
 static inline void
 gmu_write_bulk(struct a6xx_gmu *gmu, u32 offset, const u32 *data, u32 size)
 {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cf0b1de1c071..ef7eaa6d5e5c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1714,21 +1714,13 @@ static int hw_init(struct msm_gpu *gpu)
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
 	if (adreno_is_a619_holi(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
-		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
-		/* Let's make extra sure that the GPU can access the memory.. */
-		mb();
+		gpu_write_flush(gpu, REG_A6XX_GBIF_HALT, 0);
+		gpu_write_flush(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
 	} else if (a6xx_has_gbif(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
-		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
-		/* Let's make extra sure that the GPU can access the memory.. */
-		mb();
+		gpu_write_flush(gpu, REG_A6XX_GBIF_HALT, 0);
+		gpu_write_flush(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
 	}
 
-	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
-	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
-		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
-
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
 	if (adreno_is_a619_holi(adreno_gpu))
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index a0c1bd6d1d5b..45d00acd5b1b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -553,14 +553,24 @@ struct msm_gpu_state {
 	struct msm_gpu_state_bo *bos;
 };
 
+static inline u32 gpu_read(struct msm_gpu *gpu, u32 reg)
+{
+	return readl(gpu->mmio + (reg << 2));
+}
+
 static inline void gpu_write(struct msm_gpu *gpu, u32 reg, u32 data)
 {
 	writel(data, gpu->mmio + (reg << 2));
 }
 
-static inline u32 gpu_read(struct msm_gpu *gpu, u32 reg)
+/*
+ * Use for timing-critical writes that must reach the hardware immediately
+ * (to work around write buffering), e.g. for reset registers.
+ */
+static inline void gpu_write_flush(struct msm_gpu *gpu, u32 reg, u32 data)
 {
-	return readl(gpu->mmio + (reg << 2));
+	gpu_write(gpu, reg, data);
+	gpu_read(gpu, reg);
 }
 
 static inline void gpu_rmw(struct msm_gpu *gpu, u32 reg, u32 mask, u32 or)

---
base-commit: ec2d9beb604a623a9f5308f7abcff3561e08c155
change-id: 20240509-topic-adreno-a8939b92f625

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


