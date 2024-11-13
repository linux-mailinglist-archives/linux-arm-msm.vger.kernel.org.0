Return-Path: <linux-arm-msm+bounces-37823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9E49C77C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 16:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A4ED2817E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 15:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DB61FF7BD;
	Wed, 13 Nov 2024 15:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ihOtFX9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2685167D83
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731512927; cv=none; b=fedqKJRt81kWzGiflQeIjA3cv+YZKZWhUAH5HAcEZRcU/5LIUhvspV+vYFR/Acpv0TQttJ0ZpEj0jcCnK6HADeylvI+4yqTe0Nb2mSoRV6rkui3D48T1AsRmzW9ZDyRlG7YWU+H3rk6QEKw53yTGcBUU99STnKf9WfZ+avbm14k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731512927; c=relaxed/simple;
	bh=65gaR48iDlCaSN/dZrfU0ZqdCSj7lSYwGlD0L3sE0nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=snjd/KzujXriVqyj34M2QNRbpk1Fmc+IxLbhhbh0qever1fdn8yMNwOiyuGSZG3fGWwXrtMSASK2bhyuNOiJ1LIyflw3wUXehwZ40e5rPH6tazG7llOaJ8og1SWu5JUAVPv69qX9yomwZbx5928KhfgXDzpL1Dc8anYxNPDSyc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ihOtFX9f; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d3ecad390so556045f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 07:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731512923; x=1732117723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqlUbnru8MHjTNBk7aASJ7XvWVfG9WxsRtwV6R296is=;
        b=ihOtFX9fjN5GLmslY9HFQcfJ8fgRJewv3a8fF+ZBcw8idiLBqOURf2XXCSPDR5KOz7
         jA33fOAuYppDIJBbsvO4LZom7ua7VdflJc5PY7tk6xBrivGVnvPiZI5IMotk2KH6e1Ga
         dJy3ROZBPTDHXrBqkHe/iS80dAYeHXbIAWPSU72GFOP4185rNTa0MyfSYZWlpGCppoOe
         nyNoZXENHGDLZ2st9HfuNwqY+FtpXtnUwDxZL536Y6MQfXCfJLzZUYAP5uzkBftNQKFS
         6Z1ILxetWybqm5jjHXptNmarToeys/zD+ud0bKVZSEE27uBfuuHCR7rWFR5Jz6RWR0av
         ewpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731512923; x=1732117723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqlUbnru8MHjTNBk7aASJ7XvWVfG9WxsRtwV6R296is=;
        b=FDm6BRhLr/O7ODADxgWWBmd4fBcz3KSMYalQg6cO++CVzKea+Y9vk3inBqmY1qLwHo
         0/bXZ70+h+d4Smw+n9VSXn+Ue/ZS4XnQGySD/I/NpQMqkvGzRr5LQIk45V79KN4oiAPN
         mDsR1yVn6ryxoUE8RjsQe0034kF96JibehL43Xs3Tq0IXt7iS6aMb7EvUC3WDNIeSB67
         MubZ5MsazDQt5hS9ToXSMN3MmJ5pPqiAWGjEIjN0/uALLqF79zdDZ7JdYe6ZhpVBshJG
         +61zONyHHWQtaf0u2kiDbgZ4xe4ljxYuNfywzRV3o14JabvFC6yQ3mcKf6Sflq8WDSbu
         M7Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXb/LNQNYNlkH4zF468ZFqec+o70Cl6YDlAX7k689YhosPr00/QAhRR9h1N7+3KGgBksQTZZDk5doqi7GZp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx50RR4H/keXbEEf3k6V5Cu3i9clw4/6mK0cc708oMNtDzVWVdn
	hzNHOlpOuy9xryEaT1AjmLiZUHzUCBPc115gCu18eP/CbyHA4xVK7ZR/2dJ0IYI=
X-Google-Smtp-Source: AGHT+IHd93ysBYVWjFODiBqFI35dmPs/QszeNHLa9JBAo6jqks5WP8f4ScVz5k1wF0jc3w6yRrAe6g==
X-Received: by 2002:a05:6000:2c3:b0:37d:43a8:dee0 with SMTP id ffacd0b85a97d-381f0f5e363mr19614019f8f.17.1731512923197;
        Wed, 13 Nov 2024 07:48:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54f772asm28445345e9.18.2024.11.13.07.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 07:48:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 13 Nov 2024 16:48:31 +0100
Subject: [PATCH RFC 5/8] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-topic-sm8x50-gpu-bw-vote-v1-5-3b8d39737a9b@linaro.org>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4058;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=65gaR48iDlCaSN/dZrfU0ZqdCSj7lSYwGlD0L3sE0nw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnNMpSDQhnMHBPX9kx7CqxEIv3SDeF15/q8PlO4sr9
 mxC0hxOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzTKUgAKCRB33NvayMhJ0dLUEA
 CPLX9LnmcOcIP028enFzfwAnEDpiHdQKDyNuhDBaF7xw9mvmWZiYEPXXIvCP2NhC8SsqQdGRxX4JnB
 2Tk1o4ms2howRSNrlqidrzgAbPcRhsR1oz9FMb4iQrgw45Tc5COMaDjHydL8f8gqpPH2FbweYIEwWG
 ZwQj/uPEpkIU2iLGEdRs0FptnWEQYRu4mbntUkl0OTVjC0CGzSyeoChRk/d5PFhKk66A8BwKPMTi2A
 5D0i5Q+PmbEKJYeGFJmOR0+AWVnssBLCTT4jNHqMZuBpB5+6nfxj0n+4wTTeTRkzOJvQGKrT7KQ3y5
 zdjfuW/wY5lENLd+m174Ci+AkP3bIBdy3sSq0cUwMBIdd8MFp9DyBF8aqzwjj6DFHXtqLafNaFn+Bg
 QWBL+cBohIk37oGacXfss5rYqs2RgSv1bCTlprl4xqVsIOFnHO1004ft+8BQTt8h76/bcmeeJCU40F
 1ZIdDLBGVY3uus2OoviTqnr79kGKO5rOYH6wtFDuKkLef9AC4BqI9cFFd5UOHWKkapTpKhW6twgHz9
 cz69MuDSEWWckdtAUeNgHpgpiZ0H1RQmsDE74LsDg9K5E6GTSzeUYWbc/y7R46Jd96eYpFRwBkcxhL
 bO91HMk/9612ox95KNsrJW6hexRlTZDplrLDi4yXEqlvPbjCWanIYdJWu4wQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Adreno GMU Management Unit (GMU) can also scale the DDR Bandwidth
along the Frequency and Power Domain level, until now we left the OPP
core scale the OPP bandwidth via the interconnect path.

In order to enable bandwidth voting via the GPU Management
Unit (GMU), when an opp is set by devfreq we also look for
the corresponding bandwidth index in the previously generated
bw_table and pass this value along the frequency index to the GMU.

Since we now vote for all resources via the GMU, setting the OPP
is no more needed, so we can completely skip calling
dev_pm_opp_set_opp() in this situation.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 17 +++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 504a7c5d5a9df4c787951f2ae3a69d566d205ad5..1131c3521ebbb0d053aceb162052ed01e197726a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -113,6 +113,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u32 perf_index;
+	u32 bw_index = 0;
 	unsigned long gpu_freq;
 	int ret = 0;
 
@@ -125,6 +126,16 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		if (gpu_freq == gmu->gpu_freqs[perf_index])
 			break;
 
+	/* If enabled, find the corresponding DDR bandwidth index */
+	if ((adreno_gpu->info->quirks & ADRENO_QUIRK_GMU_BW_VOTE) && gmu->nr_gpu_bws) {
+		unsigned int bw = dev_pm_opp_get_bandwidth(opp, true, 0);
+
+		for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index++) {
+			if (bw == gmu->gpu_bw_table[bw_index])
+				break;
+		}
+	}
+
 	gmu->current_perf_index = perf_index;
 	gmu->freq = gmu->gpu_freqs[perf_index];
 
@@ -140,8 +151,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		return;
 
 	if (!gmu->legacy) {
-		a6xx_hfi_set_freq(gmu, perf_index);
-		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
+		a6xx_hfi_set_freq(gmu, perf_index, bw_index);
+		/* With Bandwidth voting, we now vote for all resources, so skip OPP set */
+		if (bw_index)
+			dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 95c632d8987a517f067c48c61c6c06b9a4f61fc0..9b4f2b1a0c48a133cd5c48713bc321c74eaffce9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -205,7 +205,7 @@ void a6xx_hfi_init(struct a6xx_gmu *gmu);
 int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state);
 void a6xx_hfi_stop(struct a6xx_gmu *gmu);
 int a6xx_hfi_send_prep_slumber(struct a6xx_gmu *gmu);
-int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
+int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int perf_index, int bw_index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 9a89ba95843e7805d78f0e5ddbe328677b6431dd..e2325c15677f1a1194a811e6ecbb5931bdfb1ad9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -752,13 +752,13 @@ static int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
 		sizeof(msg), NULL, 0);
 }
 
-int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index)
+int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int freq_index, int bw_index)
 {
 	struct a6xx_hfi_gx_bw_perf_vote_cmd msg = { 0 };
 
 	msg.ack_type = 1; /* blocking */
-	msg.freq = index;
-	msg.bw = 0; /* TODO: bus scaling */
+	msg.freq = freq_index;
+	msg.bw = bw_index;
 
 	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_GX_BW_PERF_VOTE, &msg,
 		sizeof(msg), NULL, 0);

-- 
2.34.1


