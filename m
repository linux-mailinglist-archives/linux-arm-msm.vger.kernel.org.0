Return-Path: <linux-arm-msm+bounces-39410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAD59DB59C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 11:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CC37B26099
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 10:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D77196C7C;
	Thu, 28 Nov 2024 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ly+wbuPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A86F1917E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 10:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732789553; cv=none; b=uPLpIXOOqExYkqdc1IlDq/sP8mY1rblhMvxgWUSDWYlhwPOi6BX4rpY8tTduBui7pAJiUU+3fTTXA/iz5C2zxDVCH6NvnnAqxuoSAMzV7rs+bg8va0V9JHWkSLNwFSHGHG5vuBqx7sUgYhm36BYCLIKi3oHNE63qMh0VMp/I6yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732789553; c=relaxed/simple;
	bh=Yox7ns7AWe9CCOqpJVniXlXb56y0ulJikyMV2//ouGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tx02/TTACu0PLgJfgo+dbMnGmb24iFTvGOrW1KFdM68/63jZd7KRkJt+BL3NkoIbyYbowObH77s7l0LT6jF7CrsRZUqoQnu9Z1P/kH8A6TIJRma+61iPIShVLDjnGBGFeHTVld72aLCCmUpcb7PjWz9uo+czOpVpfMiMFYbR1bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ly+wbuPK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3825a721ae5so410021f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 02:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732789550; x=1733394350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WD4k8z96es8B14gjovDS2FjtHXDh1zXMm66FOvsAIWE=;
        b=ly+wbuPKuJTdpHkXoCZnT0pUSIsgXpGd7luagQPZFGf4A11OoWK79S30T/22stsNjg
         uKan2bQIYUdmRYv2xlPe29bhMUno0gD1DOnd7aY3tnFJl2Nb8no33K8fc428gIANXTo1
         JOYQrilaPBMuY7V2VOWNUjbNAuGcCMx4h3Mykhkp2haYzNSIWulYCYPEpTPx8Eoq+/8v
         /wRLJpK5Jjdxh6slKHZ/P497KIaF4vIlhqfdYXwbBI0jl62Pt5FeMF1CgSrsiBKkmaTn
         gEhjTXS7AGl7sve8Wk1uW06+6D5L8lAURtTIwOc1AW2HuykC5Ioq1VK429OsREIzY0WP
         RBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732789550; x=1733394350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WD4k8z96es8B14gjovDS2FjtHXDh1zXMm66FOvsAIWE=;
        b=dHb1fTCrZKhy2tPCjMuCHhdahlaXrJpEyqRn7OdDz3OSc5ql782nnBPVIwcVKHn+E5
         9iEywZJ7YjbSlkrSWMiMXq/accf9duJuPvP/xItrgIdqmljlA8NDH4daQTdDXMfRqE+b
         t4Zqzv3wrs2JmufNjA+yECiGmCksbZgsKD+2mNohBoBw1M4gOAajEshlPRzlc/JzQG2V
         IvSe9STiRtRHkiJCjAWyNjCYrk+6SQKb0W9yOFncN4VKHWnubyCo7SgFAHU51+EM5EIS
         YJBKswGIooNFacKBJM6WZYpP+oVmeHxgMmcwQCU+1qbwbxnSLO65w5861fV4zZQtlPnW
         WOlQ==
X-Gm-Message-State: AOJu0YzfRYGe1YyyamM0Q143ith+0pjlIx9+3bM7eDfYNDKgdoT4XeH4
	apsxces/s7mYgL9Lj48xFW1TAOGThh3scutylSZz/0HeoyG3uI6NH+RQEf9ivpw=
X-Gm-Gg: ASbGnct/sXEaYX4c4iekdiOw39XfuK8cCkMnU0yC06/dW1IDVxMoG8fofQ5GS7EWMa+
	NeXi8Th+6cQ+iro1ENu8uOclK+TMlwiahJPO9ViSkZSTTbVgxTKBSpUJdjCQjs6Y96KHnvNHqX9
	PQxU0V+7lTEibnk2Xzenvn7JoqPEL+IlHLFUrD2Fr3FL+wjAa45ieLFI49dWvyR2gt/gOQyFIaR
	d3Fm2Vowa4rIthJ7o1wwzQrFjw4pNhnkp7RPxykgxopSvL9D6bMsBpRvFQBFHUhkW7hg7U=
X-Google-Smtp-Source: AGHT+IHiah0ZporX1boPQyRJnxWi0PYsdjol0KT8cTMhis10crc5JNx+P71COKeg+wguvfAAotc3mA==
X-Received: by 2002:a05:6000:1886:b0:381:f587:40c4 with SMTP id ffacd0b85a97d-385cbd816f8mr1897058f8f.21.1732789549807;
        Thu, 28 Nov 2024 02:25:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2db59sm1265909f8f.11.2024.11.28.02.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:25:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 11:25:42 +0100
Subject: [PATCH v3 2/7] drm/msm: adreno: add plumbing to generate bandwidth
 vote table for GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-sm8x50-gpu-bw-vote-v3-2-81d60c10fb73@linaro.org>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10352;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Yox7ns7AWe9CCOqpJVniXlXb56y0ulJikyMV2//ouGw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSEUoF3bv93h4bMtSfLxgVWFRxPI4RsyxrQT7pcdh
 TeLsSv2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0hFKAAKCRB33NvayMhJ0c8MD/
 9bauAz6BQ24jKdL3MiaRqjsQBXRnyyN8H3+OEHNERAiuRP4eySuHynn3f22rF7gjzsoRH9InqhoCZv
 DRFmWyNKjug262/7fUBef1PN0Qo2cvLZyrrpuJpaDbwopt8274/A/P/qQ397pEUDnHyIn6awF6nOsg
 /t/llMHRpp+CRNpIfJMXRiSpU3nXUBAJDyQ7EzT46rgsgii1IO+/HGQdoSGSSjHg4MQlMjmUbPl31u
 LV2rYH+ns7evutzj7fsJP4SEG0/mdSZDekDmeO4ROgI68nl1IRslLLcEAVsiH7Ac2w0utCbU+EFKlr
 5izNzJVg5ZBsaf6azN4S+YhhHjzMV+AHLSA9TJiWtq72n7CIdN6ZyxwwlMp+Xo20qt536Zm3rIDxTr
 VS6dwHj/Bo0Mq6KLXQYKezI/EUuAsCQ49v8FBYTcIIS2loJCDpNjKIKZBjYeAr4ULDGHMK4Dq3/gag
 TX6opBk9lOX4aGq7OlPvOGjT5WvoQVmbFcG8jkplv6IA33Hlim92pTbHDA6Y/I+bb2ayLpCYe54JxJ
 bZzsntw8c6rPC62+U5Om5Jv4HcMtnfyh7oJB1oBkicJr2Lrvu58Yf3J4YHfuX8/BmvtEBn5A96Vv6X
 GhM/gJkh1TpKJ6rwAhc5ok911tYKHrcQKnZuhxn1LqHeUiDT3fC+j3E8h51A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
the Frequency and Power Domain level, but by default we leave the
OPP core scale the interconnect ddr path.

While scaling via the interconnect path was sufficient, newer GPUs
like the A750 requires specific vote paremeters and bandwidth to
achieve full functionality.

In order to calculate vote values used by the GPU Management
Unit (GMU), we need to parse all the possible OPP Bandwidths and
create a vote value to be sent to the appropriate Bus Control
Modules (BCMs) declared in the GPU info struct.

This vote value is called IB, while on the othe side the GMU also
takes another vote called AB which is a 16bit quantized value
of the bandwidth against the maximum supported bandwidth.

The vote array will then be used to dynamically generate the GMU
bw_table sent during the GMU power-up.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 174 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  14 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h |   5 +
 4 files changed, 194 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 14db7376c712d19446b38152e480bd5a1e0a5198..ee2010a01186721dd377f1655fcf05ddaff77131 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -9,6 +9,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <soc/qcom/cmd-db.h>
+#include <soc/qcom/tcs.h>
 #include <drm/drm_gem.h>
 
 #include "a6xx_gpu.h"
@@ -1287,6 +1288,131 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 	return 0;
 }
 
+/**
+ * struct bcm_db - Auxiliary data pertaining to each Bus Clock Manager (BCM)
+ * @unit: divisor used to convert bytes/sec bw value to an RPMh msg
+ * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
+ * @vcd: virtual clock domain that this bcm belongs to
+ * @reserved: reserved field
+ */
+struct bcm_db {
+	__le32 unit;
+	__le16 width;
+	u8 vcd;
+	u8 reserved;
+};
+
+static u64 bcm_div(u64 num, u32 base)
+{
+	/* Ensure that small votes aren't lost. */
+	if (num && num < base)
+		return 1;
+
+	do_div(num, base);
+
+	return num;
+}
+
+static int a6xx_gmu_rpmh_bw_votes_init(const struct a6xx_info *info,
+				       struct a6xx_gmu *gmu)
+{
+	const struct bcm_db *bcm_data[GMU_MAX_BCMS] = { 0 };
+	unsigned int bcm_index, bw_index, bcm_count = 0;
+
+	if (!info->bcms)
+		return 0;
+
+	/* Retrieve BCM data from cmd-db */
+	for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
+		size_t count;
+
+		/* Stop at first unconfigured bcm */
+		if (!info->bcms[bcm_index].name)
+			break;
+
+		bcm_data[bcm_index] = cmd_db_read_aux_data(
+						info->bcms[bcm_index].name,
+						&count);
+		if (IS_ERR(bcm_data[bcm_index]))
+			return PTR_ERR(bcm_data[bcm_index]);
+
+		if (!count)
+			return -EINVAL;
+
+		++bcm_count;
+	}
+
+	/* Generate BCM votes values for each bandwidth & BCM */
+	for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
+		u32 *data = gmu->gpu_ib_votes[bw_index];
+		u32 bw = gmu->gpu_bw_table[bw_index];
+
+		/* Calculations loosely copied from bcm_aggregate() & tcs_cmd_gen() */
+		for (bcm_index = 0; bcm_index < bcm_count; bcm_index++) {
+			bool commit = false;
+			u64 peak, vote;
+			u16 width;
+			u32 unit;
+
+			/* Skip unconfigured BCM */
+			if (!bcm_data[bcm_index])
+				continue;
+
+			if (bcm_index == bcm_count - 1 ||
+			    (bcm_data[bcm_index + 1] &&
+			     bcm_data[bcm_index]->vcd != bcm_data[bcm_index + 1]->vcd))
+				commit = true;
+
+			if (!bw) {
+				data[bcm_index] = BCM_TCS_CMD(commit, false, 0, 0);
+				continue;
+			}
+
+			if (info->bcms[bcm_index].fixed) {
+				u32 perfmode = 0;
+
+				if (bw >= info->bcms[bcm_index].perfmode_bw)
+					perfmode = info->bcms[bcm_index].perfmode;
+
+				data[bcm_index] = BCM_TCS_CMD(commit, true, 0, perfmode);
+				continue;
+			}
+
+			/* Multiply the bandwidth by the width of the connection */
+			width = le16_to_cpu(bcm_data[bcm_index]->width);
+			peak = bcm_div((u64)bw * width, info->bcms[bcm_index].buswidth);
+
+			/* Input bandwidth value is in KBps, scale the value to BCM unit */
+			unit = le32_to_cpu(bcm_data[bcm_index]->unit);
+			vote = bcm_div(peak * 1000ULL, unit);
+
+			if (vote > BCM_TCS_CMD_VOTE_MASK)
+				vote = BCM_TCS_CMD_VOTE_MASK;
+
+			data[bcm_index] = BCM_TCS_CMD(commit, true, vote, vote);
+		}
+	}
+
+	/* Generate AB votes which are a quantitized bandwidth value */
+	for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
+		u64 tmp;
+
+		/*
+		 * The AB vote consists of a 16 bit wide quantized level
+		 * against the maximum supported bandwidth.
+		 * Quantization can be calculated as below:
+		 * vote = (bandwidth * 2^16) / max bandwidth
+		 */
+		tmp = gmu->gpu_bw_table[bw_index] * MAX_AB_VOTE;
+
+		/* Divide by the maximum bandwidth to get a quantized value */
+		gmu->gpu_ab_votes[bw_index] =
+			bcm_div(tmp, gmu->gpu_bw_table[gmu->nr_gpu_bws - 1]);
+	}
+
+	return 0;
+}
+
 /* Return the 'arc-level' for the given frequency */
 static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 					   unsigned long freq)
@@ -1390,12 +1516,15 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
  * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
  * to construct the list of votes on the CPU and send it over. Query the RPMh
  * voltage levels and build the votes
+ * The GMU can also vote for DDR interconnects, use the OPP bandwidth entries
+ * and BCM parameters to build the votes.
  */
 
 static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	int ret;
 
@@ -1407,6 +1536,10 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
 		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
 
+	/* Build the interconnect votes */
+	if (info->bcms && gmu->nr_gpu_bws > 1)
+		ret |= a6xx_gmu_rpmh_bw_votes_init(info, gmu);
+
 	return ret;
 }
 
@@ -1442,10 +1575,43 @@ static int a6xx_gmu_build_freq_table(struct device *dev, unsigned long *freqs,
 	return index;
 }
 
+static int a6xx_gmu_build_bw_table(struct device *dev, unsigned long *bandwidths,
+		u32 size)
+{
+	int count = dev_pm_opp_get_opp_count(dev);
+	struct dev_pm_opp *opp;
+	int i, index = 0;
+	unsigned int bandwidth = 1;
+
+	/*
+	 * The OPP table doesn't contain the "off" bandwidth level so we need to
+	 * add 1 to the table size to account for it
+	 */
+
+	if (WARN(count + 1 > size,
+		"The GMU bandwidth table is being truncated\n"))
+		count = size - 1;
+
+	/* Set the "off" bandwidth */
+	bandwidths[index++] = 0;
+
+	for (i = 0; i < count; i++) {
+		opp = dev_pm_opp_find_bw_ceil(dev, &bandwidth, 0);
+		if (IS_ERR(opp))
+			break;
+
+		dev_pm_opp_put(opp);
+		bandwidths[index++] = bandwidth++;
+	}
+
+	return index;
+}
+
 static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
 	int ret = 0;
@@ -1472,6 +1638,14 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
 
 	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
 
+	/*
+	 * The GMU also handles GPU Interconnect Votes so build a list
+	 * of DDR bandwidths from the GPU OPP table
+	 */
+	if (info->bcms)
+		gmu->nr_gpu_bws = a6xx_gmu_build_bw_table(&gpu->pdev->dev,
+			gmu->gpu_bw_table, ARRAY_SIZE(gmu->gpu_bw_table));
+
 	/* Build the list of RPMh votes that we'll send to the GMU */
 	return a6xx_gmu_rpmh_votes_init(gmu);
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 88f18ea6a38a08b5b171709e5020010947a5d347..bdfc106cb3a578c90d7cd84f7d4fe228d761a994 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -21,6 +21,15 @@ struct a6xx_gmu_bo {
 
 #define GMU_MAX_GX_FREQS	16
 #define GMU_MAX_CX_FREQS	4
+#define GMU_MAX_BCMS		3
+
+struct a6xx_bcm {
+	char *name;
+	unsigned int buswidth;
+	bool fixed;
+	unsigned int perfmode;
+	unsigned int perfmode_bw;
+};
 
 /*
  * These define the different GMU wake up options - these define how both the
@@ -85,6 +94,11 @@ struct a6xx_gmu {
 	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
 	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
 
+	int nr_gpu_bws;
+	unsigned long gpu_bw_table[GMU_MAX_GX_FREQS];
+	u32 gpu_ib_votes[GMU_MAX_GX_FREQS][GMU_MAX_BCMS];
+	u16 gpu_ab_votes[GMU_MAX_GX_FREQS];
+
 	int nr_gmu_freqs;
 	unsigned long gmu_freqs[GMU_MAX_CX_FREQS];
 	u32 cx_arc_votes[GMU_MAX_CX_FREQS];
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 4aceffb6aae89c781facc2a6e4a82b20b341b6cb..9201a53dd341bf432923ffb44947e015208a3d02 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -44,6 +44,7 @@ struct a6xx_info {
 	u32 gmu_chipid;
 	u32 gmu_cgc_mode;
 	u32 prim_fifo_threshold;
+	const struct a6xx_bcm *bcms;
 };
 
 struct a6xx_gpu {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 528110169398f69f16443a29a1594d19c36fb595..52ba4a07d7b9a709289acd244a751ace9bdaab5d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -173,6 +173,11 @@ struct a6xx_hfi_gx_bw_perf_vote_cmd {
 	u32 bw;
 };
 
+#define AB_VOTE_MASK		GENMASK(31, 16)
+#define MAX_AB_VOTE		(FIELD_MAX(AB_VOTE_MASK) - 1)
+#define AB_VOTE(vote)		FIELD_PREP(AB_VOTE_MASK, (vote))
+#define AB_VOTE_ENABLE		BIT(8)
+
 #define HFI_H2F_MSG_PREPARE_SLUMBER 33
 
 struct a6xx_hfi_prep_slumber_cmd {

-- 
2.34.1


