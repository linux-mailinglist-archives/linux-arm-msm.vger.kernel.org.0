Return-Path: <linux-arm-msm+bounces-40519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BEA9E592E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E46CF169BB5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 15:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632E321D5A8;
	Thu,  5 Dec 2024 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JRynJ/2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E821C9FD
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 15:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733410885; cv=none; b=gdXYUsvgFdIT45f24oLNddH+4yiCerZT5hOycJIiC2PJKrcY2is/ZmVSKILihlAQ5mYPXkTXoh5AH64kNV8pM5hQhgq13oiNjWAKuxYqVi/qftpI1+YNTPhVOm7rnqWeHw4imO1baD7R+HDUD300AHd5D1pAXxh6urno5pdUTAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733410885; c=relaxed/simple;
	bh=/vvfdxnrBoRZ8tYl8FRklALE0KalVmA2J6aZIhuf4/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPbNfPbB9nNFgPyp1yarBEOsikrqx8hyZZ2yS7oFD0bsYp8cWx0QbMvNAoiig7SsvSCE0EijXKupPiu4SmPP/E9u063PNOfpRjykQVZ+PzQ7nebPTVi4RZ7aoRDd7EN73PYk3sJiwrY2n/mybr8pcUeS0h68bcsooWfBhG6fZxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JRynJ/2z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a766b475so10294405e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 07:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733410882; x=1734015682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4oP5izvNF5OOtr3Waf88aH91OpBFvN5iR6It/NxVU4=;
        b=JRynJ/2z30oMlGr1X4jDeCnHrTnZaqIdMoI1xxF1D7Zp2vuPXo7bdfUYGv81fQgS+v
         7Cn2YcOBiGd5TicQa/Ea2C/vxduexND88YKXjWViQ1UibMCMHTaam7e1CZz5YXIThDT1
         Jbvn6v/M0wx2Pj4yevDUIYRwbdoXb7NeN31Waa4g8bcCUPy/i6ZpjX8eMKc9OQaRsdxo
         uhLwnZH8j6DlF3TFZrTo+TeJdfuO7d+n6vMaygZZ15VELbMe3so9x5ulxuTYm9TtwIMt
         vZdX39/m9u5Xli14r4v3M+fbwpatSW1cmJNyZ6N/NNEXJSDKP40esqyunQKH5ohOgwKd
         nlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733410882; x=1734015682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4oP5izvNF5OOtr3Waf88aH91OpBFvN5iR6It/NxVU4=;
        b=Bum9ZFE1XLPWEARFqinmWJsD0YLJAcyYENK4lGQcjr2IrFNDZPC8gkTHYC2MJyojlh
         4WpCLMXS8m4vXB0H5wkA8E9N9Gac6xT9q34fCBjR7o5kgt5WLO5CC+LwWWVRlNqnuYzq
         zOmftRhmBbqipLbtH0BMuj4M736/XN3Am+0kgM+bBXhF58b0761FLVYyqd+vYvTp8RmC
         0ZnhPFY/370rUP8FJt57lUORPOkk69JRbQQdhOecC8cfTABnr3oL2B4Z8k2Ani6tPT5m
         qXGsqMjsuzfGrcsBeNldtPyQh9w6JOC1TpRTR9xIdT+J4nocWJooTkA4gz6sqXuNAQ0u
         5tXQ==
X-Gm-Message-State: AOJu0YzjyCravptG+t46Pe7txuZdocSxt5hELWy2BeiuT/XVruDhFUXg
	uuk2zxUaw69dhyJA7mvso5itkf2pqTFdgU5tfG/rtNKFge5nPAHbESKv8tRilXU=
X-Gm-Gg: ASbGncugBCOi8bH7y3h7vwNbmmJtDO473kh0JGOjwjsmKz8uXFb5TmHU77X7Nauqigz
	ur/97mta4hq6uEs7S9VaQw1F+rDI81LauwILZRX+es7gIq0N5e6thJ8ZSYrYdiPCwY5SYJo232R
	Cym4ZxfauUVfLYKMeGHO+dDVnbQD20bVSyB4mPfhv++oBbmpSz4QDlXCNW86sJO1HgRfmIUy8Oy
	DtAElFqsN4iLhEsNgc8fYFliBut6PjN0pgBPI6T1C5weg2NGvqluR6jKn7t83QYN8vnqbU=
X-Google-Smtp-Source: AGHT+IG3n3rheA8zko7qp1b4VyWBqjQnC6L2ZIjk3x6yI5qCJphyIylEY95jPMeS/SIWqqrgwJ70ug==
X-Received: by 2002:a05:600c:4f87:b0:42c:b5f1:44ff with SMTP id 5b1f17b1804b1-434d0a07e55mr91108605e9.24.1733410881161;
        Thu, 05 Dec 2024 07:01:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0bc7sm62830795e9.35.2024.12.05.07.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 07:01:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Dec 2024 16:01:08 +0100
Subject: [PATCH v4 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-topic-sm8x50-gpu-bw-vote-v4-4-9650d15dd435@linaro.org>
References: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
In-Reply-To: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5830;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/vvfdxnrBoRZ8tYl8FRklALE0KalVmA2J6aZIhuf4/U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUcA4ffp2G+r00yspMOON4TPqISXjmk5DodVVlf2F
 H8WdJpCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1HAOAAKCRB33NvayMhJ0fddD/
 wMF+R1NR6QAWBxUcL7E/VOuFvVHeL7qSzhnc+eC5gdjLdR26WoI6NC8CcWf+9LPmHXcz/Mz+Mgxk/A
 PSNdYkxunfSeJqU5KGBAlHRVbJgno/BG+iawJWg9jN2NM4TOZF6MWF4HFDqH567GPyg0u8ZMfBpCcI
 HgmAQINM5DGWIkdlVDSPsFTgcSPvy7aLEHjMr47xbxNoVvHRHhJMuqOb0aVL7oGZTPnCLZHea+50UE
 h+CB/cxDC7gSIZ48QbXGr6Im7AUnlYMI2bCM/rP+oOK+uJA5snrVVG1XGzrMAbihAiJhAd8bcXz/JS
 iOvizEb4ZjzdYgfLDJzi2Z3SfUfNnYHSSunl8rXt6xZ/RAsDySoocW2jRtiRzJ84k3GtcjawR3zy3W
 JtsHOfh8RpyxaOMbTATPAZ8GgxSPqML+Xcywv/iDNgYVcmmNzs5KH8aYW3/Zz8Y7Hz0mdx85QOZKZm
 VwMvCsDky94NoQhyaQhLtTrifNCieUjDaoWjZ/cBnsAuaJD6xSvR67pF5iNVsMaFA6OtgGPThGMWIx
 lTzt8j/S3diqSHlXUBESbW4OENOA5geXascNO3nSZtXdpFOU/4OzCPy3QYpMuGo3ZuVTCP5AyD6Q4t
 JhbL6EVYTzJQ1b8jXawuL0R7aa8JAdn14KLTZWVKkLu9kQJqIRdygm/3I2Rw==
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
quantity of bandwidth we require for this OPP.

Since we now vote for all resources via the GMU, setting the OPP
is no more needed, so we can completely skip calling
dev_pm_opp_set_opp() in this situation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
 4 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
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
+		/* Vote AB as a fraction of the max bandwidth */
+		if (bw) {
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
index fc4bfad51de9a3b6617fbbd03471a5851d43ce88..5c566ce6612ed25763337d20de90d78697dfb801 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -765,13 +765,13 @@ static int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
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

-- 
2.34.1


