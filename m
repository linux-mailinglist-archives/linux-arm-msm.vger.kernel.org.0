Return-Path: <linux-arm-msm+bounces-41428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3D9EC73B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 036A1167A19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7AE1DC9A9;
	Wed, 11 Dec 2024 08:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L2wUZ75f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A5C1D9591
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905804; cv=none; b=EBGZF5F3O8WBFllbpIa3MWrKg+ZCnZGp5lQWYhkURDUcOcpJv1yR9CrdnywV4yipGEx5M7KmZW95Xv0c33QJZl58i/2NSYEWz9xXYDeFXKKF+5zsmFtEiuQyFt1xhxS3DLfRmG48BByzHUkqcXLblv2TLpp0zPTRaBvz5ErVu2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905804; c=relaxed/simple;
	bh=uvbHEXTw+a2tX2idu+ViK6cwh2GKBsinSbc9Nbsj/3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=notv3gSjzEa+z5Fa3LnepRD49hLSSfBJ4AdmsVo/daz23JXh6JjJDM1SrXM0aXW7F68ObLSGgDAjfGee/+5KDqTevx9cYyF1Ss4ZQvIB1rarCEqqUsvZ/b91gNdcQcj+1CQK8XdQ6HP/obxkc707Ek7L9vaTMHi4rRIV7px8U6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L2wUZ75f; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361a50e337so7347635e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733905800; x=1734510600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GT6Ffu6NHkparOWH1yazIoGcxgWe1DmTQ9OnbymmN/0=;
        b=L2wUZ75fSKZGeEcl1scbNmKjgJQDIJkrMlRsrvz0nHF9SCtxja4l8HMxgy4tHEfUUz
         ikbcF4ZKIsYYOoecMcXOAOu0eWEpxek3tbEghAJdKeZB/Qptyj5OJ1C3G5og3oJdqLv4
         BkmVNz4QSMflERRXqcwemX2waBZ6wxXCIWgmjg+yN13uWHdBMDPGHT0unIu3w1IyH12w
         HggB2LszdZUIXr8NyYMYfcZ2OYCg6G2Ihf3hvwc94e/q02mSL9NsAQFPtyIkLYx2tnWg
         meKYXFVMbgpadKRxiBugwdZlJZlXkWfCi9pjkJnSKP+Un5fNjRn1SejNHahM8OH5zOGq
         dY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905800; x=1734510600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GT6Ffu6NHkparOWH1yazIoGcxgWe1DmTQ9OnbymmN/0=;
        b=QhmGB6WPZN1G1+oLyI3wDyg5zxVGl6PYG00Zgl3MRMi53zmTPf5sJ+CBsHy1Yza/S4
         dWwWmatqE9sl1/yi7wRlush5SXk+KXiZHDPMhrg3arhBIbc2U1DWHH7X1mdowLqfJSCT
         jPJviHQCQi68iySAsN+tT3UZPluhSocgQfXJLEWCOQEfa0WQ+CpgjxOoj0PpNCH+MXBD
         sA0zJ2VFP5ANKXSB+8z0tZyU6pp3+Y0KSydwtgv/ZT6AJ/rXd3wJNyaOZcShb5Hk0SRe
         /hR55L0WbrXSvzSWHdhHPF8t12+upgPRQ6pfWwk+lqkJF5jLFucIPFsEIVw/UiE3AXhY
         b3MQ==
X-Gm-Message-State: AOJu0Yzd6ZQzG9i1Vv5ABLDVogdbb/ZbFhiwzGpqIrf3AUUqx49S3T2P
	73gt/1csB06714/3aSJCZn1Uvx2PU7ANHmCnkdSGD7zGhc32aYDs97m0WFVU9GQ=
X-Gm-Gg: ASbGncvPonkjsitYXYCDkLenoI7C3tMPdFjYT2DUnDZdqBEH1TQsxGpc7/g6n8TcZys
	qgW7W59DBHFmr+BsMiDNw9XN80jsmKpZvIJ5ZFB+F60xdhR2GGAd3NJhc0zMoT5OGnwGThtTFv3
	jpLggJeucGNpHTW4kAkZZ5aU8uw2/SZXyg3PGhxF2fTUf+VFbndJym3MPRt+S0acQGMjmeLt8z1
	1faeyVI58Swjk+bQWvVrqopotJYtfLpS2MNr2ssGr+j3zNBh8HCBmJnIgxKbsOy94jPKRZW+rE=
X-Google-Smtp-Source: AGHT+IF7oHwnm8rIiEG12aOaCAXXwee4iH7RzxDw44Dh26ZuhO0Z1q9I0gkOLUHLoDLf9lIQrU/4qQ==
X-Received: by 2002:a05:600c:1d20:b0:435:9ed3:5688 with SMTP id 5b1f17b1804b1-4361c3d6ac7mr12286655e9.18.1733905800503;
        Wed, 11 Dec 2024 00:30:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a3e38sm735687f8f.23.2024.12.11.00.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:30:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:29:51 +0100
Subject: [PATCH v5 1/7] drm/msm: adreno: add defines for gpu & gmu
 frequency table sizes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-sm8x50-gpu-bw-vote-v5-1-6112f9f785ec@linaro.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=uvbHEXTw+a2tX2idu+ViK6cwh2GKBsinSbc9Nbsj/3M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWU2DzREykEvfRyTTeu2PJL3doUmLN4VZtaUtdXPl
 KCE67taJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lNgwAKCRB33NvayMhJ0YlyD/
 9n1F55iW7tro2Ht/1yZuYHXbYF6L5n48SpHNqIT9F63uycOIBIA9C4UMVOHyQqLuGLrQxLQynDpIxe
 mpwriIFAbvwCOBf55h5iC0R1iVBnhTDaAHMm9sjNVGV0PB4PFzWtGwSDpfrqMWA40iHE5foCF0P40S
 biH0o0BEQy7iUbRjL0WRxybwkrQbAsOF1nqPfwpuqEFuWM906zWyZh63dqYLqrP7frbdiqD2oHVxXw
 Fd7rFTVBt695oaYLAKXvlqkmq71pOi6hxEy92dB0rmCFrr5fd1brrl3hqr0L8MZS3rdA8I646n0Aop
 eODmDQyX+Mj2aLW2Y26OoJsz4sAspQ1pksIsHc+rMwRL5MB9+9LsyLXHa/IP0eiTq5BAlsxdXvxtII
 JTlwvcFp04nKV6lGssJhXBFR1BFE1IxQG5PV5ZVJPoZYJMejeyiAT1T/2LNNXjNIBH1fNqUmXrTFpi
 rD5yzrQRZHF8vWsT70jtPABLg4uUmtvXsHuXkT0VLOLVIIJ8EEs+a3Q2zjcUgZAdtiHIlX1ZcjdQLZ
 Qfcgp90wnmg2KWS8PvxdI8A1UWEHnmBRiNUjb322vpciOOyKxrKyTJxPoB3y9jN49tkpOuvgY2xoVd
 LMIiXMhznpNbE3Xr60+5UbPHUnR+358wuB0n+lAOgxyt7MruKoawUvHbRAgQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Even if the code uses ARRAY_SIZE() to fill those tables,
it's still a best practice to not use magic values for
tables in structs.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index b4a79f88ccf45cfe651c86d2a9da39541c5772b3..88f18ea6a38a08b5b171709e5020010947a5d347 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -19,6 +19,9 @@ struct a6xx_gmu_bo {
 	u64 iova;
 };
 
+#define GMU_MAX_GX_FREQS	16
+#define GMU_MAX_CX_FREQS	4
+
 /*
  * These define the different GMU wake up options - these define how both the
  * CPU and the GMU bring up the hardware
@@ -79,12 +82,12 @@ struct a6xx_gmu {
 	int current_perf_index;
 
 	int nr_gpu_freqs;
-	unsigned long gpu_freqs[16];
-	u32 gx_arc_votes[16];
+	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
+	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
 
 	int nr_gmu_freqs;
-	unsigned long gmu_freqs[4];
-	u32 cx_arc_votes[4];
+	unsigned long gmu_freqs[GMU_MAX_CX_FREQS];
+	u32 cx_arc_votes[GMU_MAX_CX_FREQS];
 
 	unsigned long freq;
 

-- 
2.34.1


