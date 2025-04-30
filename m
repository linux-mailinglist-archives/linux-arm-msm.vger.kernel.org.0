Return-Path: <linux-arm-msm+bounces-56248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D678EAA4A26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B3BC179D05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 11:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9BC248F40;
	Wed, 30 Apr 2025 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2uojk/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F7D231829;
	Wed, 30 Apr 2025 11:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012897; cv=none; b=a63E8R74Ls6yJCeZdRghqKmA1MK/VIE1F2gL1aZ+3FKXQzG7cmRmxPDq+2p+HxwRfa7uEMoFxJH3Fj1rEs2V+ldpP/cQam5J7DjcFyegj1aWAGdbQA+wGzMobx5loReIGnPD0ZoTeqvVRE0LZHaJm591GW4MQUfBVGSg+TFx+fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012897; c=relaxed/simple;
	bh=nvHCaF8qd9Kc8urkFp5so4scjDxpMQByuGnGWBLb67k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MgAPgS16ERnlsFzJMwIe+jOJT4vNBDmahwEjfJ4JSDjgPoTQhbytmU3TlOPa4z0ylxe1Ao1DRQem5+yLlzFp/NITVVuDlxP5vR7vEMZjpO9TBMmpPVS5nk0hBxqeQ5yvB6+B5MH1CFITBFIS30rv2zMq1nZkATBgLvk/IQHQ8EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2uojk/Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A987BC4CEE9;
	Wed, 30 Apr 2025 11:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746012896;
	bh=nvHCaF8qd9Kc8urkFp5so4scjDxpMQByuGnGWBLb67k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l2uojk/Q7MsywuGQVGi82QAaos+ZqzmRniiGEdY0lUTIZ1DYWGiOlgO/ZhG6XPD1y
	 WETk+G3QTw+NSC8kPH20jlxWQORBqk6Tj7awrCbevWXx1NZdBU3oUnu2KQMqRagty8
	 jHHC9bf66hGPvvZq6K7LuVMj0kAWrOkx6+O9a1IU+iFIxB4p4GkWus9SnRG7+G4VlT
	 kmB8PZqicZGWW2U5TJyXifRH/kp7LkJSPpM3MKvoT/YnOCnQwnvwoV84FZ2ea6FP5r
	 nKc09AQm/dbR4VJhDlW1AkHSkErpM9JhKzoCzDpjF9acKOxnGi6uUe5GuFUV6Dopyr
	 SbJCqv4R/bUeA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Apr 2025 13:34:36 +0200
Subject: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
In-Reply-To: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746012880; l=1547;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=s8amPV021nvmCFk5BsbFzQEAO5l0wK8PePLGYxCymEg=;
 b=M20YHKO9vKas3G0+FGjEatcTaoRgXamQ47q1mgVoAIrR1hBspD5dxyYSRUOY7LHw/IwqxcR1Q
 BEc6YmTSBfYDyTIpfQOZaoZ+Yh7h5YNXLdR3awkflU6Ix2++3c1mdih
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@linaro.org>

Add speebin data for A740, as found on SM8550 and derivative SoCs.

For non-development SoCs it seems that "everything except FC_AC, FC_AF
should be speedbin 1", but what the values are for said "everything" are
not known, so that's an exercise left to the user..

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -11,6 +11,9 @@
 #include "a6xx.xml.h"
 #include "a6xx_gmu.xml.h"
 
+#include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/socinfo.h>
+
 static const struct adreno_reglist a612_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
 	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
@@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 4192 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
+			/* Other feature codes (on prod SoCs) should match to speedbin 1 */
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
 		.family = ADRENO_7XX_GEN2,

-- 
2.49.0


