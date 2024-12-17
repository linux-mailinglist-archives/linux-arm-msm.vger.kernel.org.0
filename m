Return-Path: <linux-arm-msm+bounces-42561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B249F4E73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 15:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD45A7A8CBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 14:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6F31F8909;
	Tue, 17 Dec 2024 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZX/9rte"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517E51F76B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447090; cv=none; b=B9VJ/8kgajrk0L4I+evIV/jpxP+yZsb7t+qd2gjBny0dnKnvXtZ7TJxqgYmscuvWFora4Q4NUKgCOzlkwTkVZzjLkvHE6St9CXaROyKMSjE/u28BDSIM3/ddQKRtBCWfNq6zamPqOgCRG/PvL9uxxxsdCviSJdrn93+Hdd6juz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447090; c=relaxed/simple;
	bh=pFyjA7euOqm+0wBT4oSozMjJLtT7o/w3C/+bVaerMDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S8JyiINwgWuD+SAzd4NiH2zwM3e7SYTeaQYDd2eO6NH3PSKNNUB7PAxUSGVnRFLLFhrGEWWbw5LAw03+N0O/T5OPMuLHURfPsqDTZB9B7R8Lc+nlaOVWgIcHfS6Rp8V2Bjf3ESykAUg7UrlT+24HbbWE6VIlLbNrY7sc9DPYZo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZX/9rte; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436249df846so37923395e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 06:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734447087; x=1735051887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIrfAODWEtzrv49NBBQJYnoAU4fT+7LfJcRyGW4hPYM=;
        b=KZX/9rteXNMp/Rl6C5mO9arnJEqVi876bJ3rd9jKmvbGCDRXcBG2R3A7gTPZgP8uAQ
         ZgroHO4AKwVNqFzZSJfOB9yXpQn0cT/0yiKbOYnJrP1WmYQ51VrMmJ99C7m2IGngnKKj
         +KdVmmksHQVnzM2NV7vrMXNyC+RBbTcrgIvPrmm02eTRNPKKM86fljAt0RoeConA51aZ
         hAW7ElP2X6kq78erBGXHMH70JFk7RqD4BeBg43QEAe2aadC3gg9IadPy1tzTx7eYh/V4
         CSpUgeVGbnwQAVsijPyZHkueS+pThQkadwIYmUn/oo8WMzshwtIDtjmKFasyesgHeKXH
         PfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734447087; x=1735051887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIrfAODWEtzrv49NBBQJYnoAU4fT+7LfJcRyGW4hPYM=;
        b=A4ALjDWMvqthPFHykXGxjvYNz+Pdov79BjlLiNYmZRkM157hWdDGXsc1io1yz64EBd
         9O62UibBTPUYdpGXUzDxeI93TMYCHMwMtZZK/0IESKtX2q7SsM3fevwt1PHbzPm59j6A
         m6JAhctQYtygs25MzDcMfLVl52sRvMP7VS8x7ySU5RGusiaMNp1xPdfGsaz12scZHX2M
         O1cY5eMjCHnfcex5h7LpnOm+g6nGKSvvl/LnhNuQGITfjUr0nCcHyus1/JCDT2N/hsWu
         Su5ZObXLvcsXviYCNtmRBOZuTMvVC30BQsN6Z2LU+Fyg+IyM3JXQO3dMH76yFpd3PB4G
         5xDg==
X-Gm-Message-State: AOJu0YxyLQQ1agwBEsjHQPa/37ArlQwZVktLXEdnCmbJPaKPizdl4Z38
	C5a3dnHjau3i+1tBCDiLkkbOQWT0lHyqoMPqVsOLW0ufs96g2aBg9Xzm6NEus2j7AUU1E6czuME
	zbIY=
X-Gm-Gg: ASbGnct3YTEWwHQ9C0WZZpLp4oTXWzubBsLaEMZEkKH0F7Tna5nGqE8nohB3utG+JP9
	lcKgXirS5DuPRdOjzxeJEYIKKgCWIgUg9dDtEKb3fMI9WTnpkoq6Ic8zaE79ZV/qUXZ7zdEP0ZZ
	XQXc7Pi8e6q+DNFYVSyDlfvDH+ZqgsA8Uy85vkWfacwZWlSMDYeEQswtS4NkiaUAQhSpjnDSE9a
	XWzjoH9zSA27OXuMMcstdyVvaGH1NMGEyyF0GbTJbtiim08l6aBGXQiTJASDNzgfQmIGYJ3eApM
	2A==
X-Google-Smtp-Source: AGHT+IGdrQ8r7Q9sJC41pRjZbU+OQ5ERacHlDm6pav9QNrLthhZX1p4radFywM4nGqfXeJmzILaJaw==
X-Received: by 2002:a05:600c:4ed4:b0:434:a734:d268 with SMTP id 5b1f17b1804b1-4362aa589f0mr161009205e9.14.1734447086622;
        Tue, 17 Dec 2024 06:51:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43636066f51sm118417375e9.22.2024.12.17.06.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:51:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 17 Dec 2024 15:51:17 +0100
Subject: [PATCH v6 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-topic-sm8x50-gpu-bw-vote-v6-4-1adaf97e7310@linaro.org>
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6722;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pFyjA7euOqm+0wBT4oSozMjJLtT7o/w3C/+bVaerMDE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnYY/nZhPLQnxhaKJAnTI1Nc4bqRo49TidTq1oDyPx
 GjjBKVSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ2GP5wAKCRB33NvayMhJ0VHkD/
 96+ILk/PYI9BRjotd+u3Ojp5zO+Y+vj00htstNN5zslJ1qZVbB/9mzgIePfDXvDG7qX4ELw1nEFGbe
 92RfdVXbrdeRPa4tH5u+/qQeFQbymAz9yqxqByqLafOO/ZwxwME+JCt0hRuoEHWiNfbXowV33MM95m
 alDz1faCPUiaHsyF1Ar5Uqe60XAH5px+kUIvKVHn8fpktpo+ttzfg4xg51pqrPO3ErqbaFiJDq6Cfu
 qCeO51FdG9lMjZz2hZynbDVxeYwdcgpsVAZ9uPPJOPrnJg5TFpxm33SMHwF/OP+TqMbZX61X42NvX0
 hqzrla1zr+C04oC/CVi0ip1bgEHTKFOWCxfz4cGXAL7lJnl1sXGb20FhCGv4wSa8SkiKtuCz/YlL+5
 CuPJKWxVyGUMUb6jVONUjNDB34AIXGwwjx69gk5ytI2bYYB1blnIM9W/Nv5AIMHAaZZR0QA3l7icjW
 VJWUpqLM3bwTYD2py9/SD3GnT7Ynmp56YWhphO3e+aEfbk1WFQX3pqSAOFLELwCB+8iBOfIr/CVVQ1
 G1+lUQrK2XW9l6veen/s36/ynpbbfPF2QsmrbsHucJHXHlaHWRa2T2P/u6JK5gUvsgmXKQndLnkHSt
 Q4XHh2pMEZs5ehVCilZ+3tDbaM8STI6LCCYXiQuly7cXwaMazTGIXmXnLkzQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
along the Frequency and Power Domain level, until now we left the OPP
core scale the OPP bandwidth via the interconnect path.

In order to enable bandwidth voting via the GPU Management
Unit (GMU), when an opp is set by devfreq we also look for
the corresponding bandwidth index in the previously generated
bw_table and pass this value along the frequency index to the GMU.

The GMU also takes another vote called AB which is a 16bit quantized
value of the floor bandwidth against the maximum supported bandwidth.

The AB is calculated with a default 25% of the bandwidth like the
downstream implementation too inform the GMU firmware the minimal
quantity of bandwidth we require for this OPP. Only pass the AB
vote starting from A750 GPUs.

Since we now vote for all resources via the GMU, setting the OPP
is no more needed, so we can completely skip calling
dev_pm_opp_set_opp() in this situation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 39 +++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h   |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c   |  6 ++---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h   |  5 +++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
 5 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b1dadafc35e95d6173019bda1105008dec1ac03a..9520fbcc89d85ee6dd4bdb17cef5f38dbf5afe6d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		       bool suspended)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u32 perf_index;
+	u32 bw_index = 0;
 	unsigned long gpu_freq;
 	int ret = 0;
 
@@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		if (gpu_freq == gmu->gpu_freqs[perf_index])
 			break;
 
+	/* If enabled, find the corresponding DDR bandwidth index */
+	if (info->bcms && gmu->nr_gpu_bws > 1) {
+		unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
+
+		for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index++) {
+			if (bw == gmu->gpu_bw_table[bw_index])
+				break;
+		}
+
+		/* Vote AB as a fraction of the max bandwidth, starting from A750 */
+		if (bw && adreno_is_a750_family(adreno_gpu)) {
+			u64 tmp;
+
+			/* For now, vote for 25% of the bandwidth */
+			tmp = bw * 25;
+			do_div(tmp, 100);
+
+			/*
+			 * The AB vote consists of a 16 bit wide quantized level
+			 * against the maximum supported bandwidth.
+			 * Quantization can be calculated as below:
+			 * vote = (bandwidth * 2^16) / max bandwidth
+			 */
+			tmp *= MAX_AB_VOTE;
+			do_div(tmp, gmu->gpu_bw_table[gmu->nr_gpu_bws - 1]);
+
+			bw_index |= AB_VOTE(clamp(tmp, 1, MAX_AB_VOTE));
+			bw_index |= AB_VOTE_ENABLE;
+		}
+	}
+
 	gmu->current_perf_index = perf_index;
 	gmu->freq = gmu->gpu_freqs[perf_index];
 
@@ -140,8 +173,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		return;
 
 	if (!gmu->legacy) {
-		a6xx_hfi_set_freq(gmu, perf_index);
-		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
+		a6xx_hfi_set_freq(gmu, perf_index, bw_index);
+		/* With Bandwidth voting, we now vote for all resources, so skip OPP set */
+		if (!bw_index)
+			dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 2062a2be224768c1937d7768f7b8439920e9e127..0c888b326cfb485400118f3601fa5f1949b03374 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -209,7 +209,7 @@ void a6xx_hfi_init(struct a6xx_gmu *gmu);
 int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state);
 void a6xx_hfi_stop(struct a6xx_gmu *gmu);
 int a6xx_hfi_send_prep_slumber(struct a6xx_gmu *gmu);
-int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
+int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, u32 perf_index, u32 bw_index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 995526620d678cd05020315f771213e4a6943bec..0989aee3dd2cf9bc3405c3b25a595c22e6f06387 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -772,13 +772,13 @@ static int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
 		sizeof(msg), NULL, 0);
 }
 
-int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index)
+int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, u32 freq_index, u32 bw_index)
 {
 	struct a6xx_hfi_gx_bw_perf_vote_cmd msg = { 0 };
 
 	msg.ack_type = 1; /* blocking */
-	msg.freq = index;
-	msg.bw = 0; /* TODO: bus scaling */
+	msg.freq = freq_index;
+	msg.bw = bw_index;
 
 	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_GX_BW_PERF_VOTE, &msg,
 		sizeof(msg), NULL, 0);
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
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e71f420f8b3a8e6cfc52dd1c4d5a63ef3704a07f..f5d6087376f52c93648e136449cfd4f703ecfb7f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -559,6 +559,11 @@ static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
 	       gpu->info->family == ADRENO_7XX_GEN3;
 }
 
+static inline int adreno_is_a750_family(struct adreno_gpu *gpu)
+{
+	return gpu->info->family == ADRENO_7XX_GEN3;
+}
+
 static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 {
 	/* Update with non-fake (i.e. non-A702) Gen 7 GPUs */

-- 
2.34.1


