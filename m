Return-Path: <linux-arm-msm+bounces-24150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F891703D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 20:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA6C2B2541E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 18:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE56017B437;
	Tue, 25 Jun 2024 18:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O8GUPPfR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0736417B41C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 18:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719340101; cv=none; b=mxhJ65tMaU58Uqc/obCB4l856kccQ6OfNQpDrtwmXkTPFz/0V3uYbPZr9uH3qVIKeCpE5uhIDjMG1A1QhcWG/HgfW+qfKQgW4UgUPe4eZU5KvPQq+d2YVKUBGtBqDOACn+bcp/uLJzyk4Q61KMN6Elwtu/GKm5HClNHaGd5djq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719340101; c=relaxed/simple;
	bh=pgXB3ku76GP+Ynds4TGlmCZD8EhfvV2JMzgzNC6TMuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eE7d3DYwVKkJ+DNF1t2ftgm57wD+hWmRm2T5lrcUYEgCs8Oz8cM5R+Nj6RQP2ZDDqdy7x8ubKqwQe1HM8OfxoKLyh7jNXaxPjxl6zgwnEPMUy/qr8pZM8XMYvwJ8yivAPc+uYFzFQdIFowRGklibTrw7gFYWiVhWFkK1HI6obdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O8GUPPfR; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57d26a4ee65so5805884a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 11:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719340098; x=1719944898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcWoGGIEC7a8K4XEAMfnShumcqiU+VC3T2hAJ7CQxuk=;
        b=O8GUPPfRtg0fSBYDFnpasBhtx+a5dz0XmGfIRrYqgOoUg6VT4+HoKb3oTOMWle6N2O
         50BjnyXuyarOGKM7G9U/0VXk3hSonoUSI1+BmQegTFpeMqIkg78gBTLxqEcEBp/VxtvC
         TarJ31N92SswNgSx/UfQI3McRCd9M1C5ng4nwKMZMU7JW0wVcL8sjXOoEBY98EyOf8gF
         2+1xz7KJAQHh99uDGyZENxxWkzpfFCdhZq2Aw3PUKxwysscX0q/SCAYxLcDz/Ga2TQjC
         5LOhvu6zRJpWg8N/tJ2qqMXLyapnqBV08DEhmtL8WjEQcK3o16QxqXRDEzyDc8pl7oxe
         SyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719340098; x=1719944898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcWoGGIEC7a8K4XEAMfnShumcqiU+VC3T2hAJ7CQxuk=;
        b=rLdm0WeJW8RQ3+pjXfKVEbS5LnSu70Jpl2d0VkR37qw5QXtd9FsGMLd5PgRHxbCF6N
         tpulU6VWXTTR4Nj6J2x29Y3oyoeZql9AQAcCh+B/RNKeTFUc3f5yngZ5osSmzg7FVP+j
         BcH5axZmACa8vb6/ks+5sQCXwE5FYrkU7JxkzrkY/0CQ1Uv6IAE8LekS6Iscf4mTX7ba
         IZyXWCAUk2Tm13OiGu9KoDAQjGBj5sLYPv/gPJvxlW5AxXErXCbcqdfM/pj1DANlueBz
         NHGXylCm8L+iur8g5Bs42oGMip7+lVT1gfdJ/s3JisZynRZnZo5nvSkKrxyUtHzBYrF3
         /OUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSRpwRpTXJKUWGtico4RIIu+lJMFVwel8wfTmGclXFN8OsB7vJjuxNETmcM9qI88hYdGn6mGG4Mcy2u4/Z++eqBDz+K4fEJLXinYSXKA==
X-Gm-Message-State: AOJu0YylcxXP+I+aLP0DWOMSQKHc885yCV36JBPey8iHoakas49GJRZ7
	BL4HnfYXx7x3vfRxuGUDgPpyKlFFPV+AX4AC+vQlT1d25kksp82p/Hd/WJuBwrJzMoetRKnc627
	8nUM=
X-Google-Smtp-Source: AGHT+IHH9Hnr7bNyOy7pplC6xVh0aDu4XjTvNl6ry3li+pWizfJqcj812ToaosLCAUB1mnaROqNCTw==
X-Received: by 2002:a50:cccf:0:b0:57d:3be:5ec2 with SMTP id 4fb4d7f45d1cf-57d4a01f21dmr6022510a12.30.1719340098207;
        Tue, 25 Jun 2024 11:28:18 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3042fd72sm6323136a12.48.2024.06.25.11.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 11:28:17 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 25 Jun 2024 20:28:07 +0200
Subject: [PATCH v4 2/5] drm/msm/adreno: Add speedbin data for SM8550 / A740
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-topic-smem_speedbin-v4-2-f6f8493ab814@linaro.org>
References: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
In-Reply-To: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719340091; l=1481;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=pgXB3ku76GP+Ynds4TGlmCZD8EhfvV2JMzgzNC6TMuc=;
 b=4pAQCD48WMIG4yPsA0ws8Nht+e2p4Y2ez7R8+XZVKTh1CmihZSf2KTi89K6tp6SMOv2htCcc3
 eDOPlXUrflcDo3HEbFZc5BtkIKqfE7vvJ9frwICe6+2ScwBiA3Jwcrx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

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
index 53e33ff78411..8f280d69ba71 100644
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
@@ -1208,6 +1211,11 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
+			/* Other feature codes (on prod SoCs) should match to speedbin 1 */
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,

-- 
2.45.2


