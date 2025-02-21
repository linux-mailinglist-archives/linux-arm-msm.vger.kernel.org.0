Return-Path: <linux-arm-msm+bounces-48914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF46A3F8B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BC5019C7566
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42100218AB2;
	Fri, 21 Feb 2025 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kbwhCQ5j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B32217F34
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151517; cv=none; b=Dl8stGwaV+0rbHfwBs81JkAMlEPpE9/GPTFMlSWTXQUzxA5wIeRSxb+EEGwFUsf8kQJIGuxL3fAF/tlAhWCXRluI0D1kR2odeL6Os0+blSUmouN1CV4FEDnu/d5EBCUYC8FpGWfRGd3ZtUzoyWYn2fUtjsYr2JWRmn/6ys5zaZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151517; c=relaxed/simple;
	bh=Rtqqvrg7pP9bsyM3YOU4Po/H2xEipMowzn5M0FXGvfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QcSqQceOlsunHnj+6NJVQDmdwSUsmIBnkvUchFWIjtvjw7aK0I/Yo6nulMvaxGE3utOv6lrsGmZlc2cot2ET3KBUKzu9QYLGhM9OV0kIjKu15q1S9OBkqcfvjmv5O0/0RsUlNDLwWjjTIFNh6TZ8uWFMy+xj4BbwRS+OHFdjsX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kbwhCQ5j; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abad214f9c9so37889366b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740151514; x=1740756314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aig57uYJrFI1rR0Npc+LI3qdVee6ZxW9yHVBFNwtitI=;
        b=kbwhCQ5jD7ZbYlUyy+Jrk4kEJOlOGnjiQOXH9ea31lnLtXFqJW5FJgoAcs1f+hOkJ8
         5izl8w/mSWkD5vg6UINuVlj62h24TyQEzIcKzxHoAas3prSfv+RYXLIPZlG0m9WUaSut
         YBB/Q7P21NAWwsTuv0PW/KN38Osy9IWnJPFDvD+Sk9xfQ9YZ6LSaAuqtK7f+7jWN79ua
         dYodBT8pBhTrjE8iVOXB66OZh+5eP3f+hOTGvuzgp/sCIx6zRFl/vSpeZ7vDt8UYxyEk
         5VBJtxS1Q1+H1sUv7LfH+eGmVl+qg8X2UKjdIGEn8EeyrsSGzm28gEwFzXuwmpOxIxc2
         5DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151514; x=1740756314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aig57uYJrFI1rR0Npc+LI3qdVee6ZxW9yHVBFNwtitI=;
        b=u1RAWKSrM0fVVGNbVjaVUgEK3AJvUxXa8lYFChlLKoBDaUxeC5fncp21E9uhk2Vslo
         BXbk2CbAbIuIaYUhORu7ocpizO1g0UnDy2mz3xPvdFsrMr2FaBPIS6lb8cxTTELL32fq
         dSKmKQjWwFgeZZwHyUB5h3zQHVyyj0oIyRWZq0WH1DraQfc6bc+yaEX/K6w+crrYv/YP
         CPymAxZfADRbk87kFoSRKfny69cMcdb0W0vxNQktkpsKYe4Y60QtywM0ZapeQMCbebDF
         RDEyqsrBL0sQUJRuo/UfqViyfRl3XTg8eV7Ya2FuSQZ8NXFLhfWANjMsPvxfAIExyWVc
         J4aA==
X-Gm-Message-State: AOJu0YzqefIuPU3gqFeT1LDzrMqhE8nuSkfEo8aEqo6OL/H/wSrOT8ei
	NyfaGQwj/gGEkImFluBWaoX9p4b9B/72C5fIxPvCGGTrq1rllQz9ylHl5LVBTJc=
X-Gm-Gg: ASbGnct2OUM2uc9O8J098NSOTX9Zrf7p216KwB9NmZf7OVy7nmWD8B81FPfWudtY9X8
	mPw13OFnKqcJMfNM9gRyfKkL6qVobH43iJ7MV0zbwJyKuJdghJPhZYIjYDVDZmR7PDMPkc3uISk
	9M6xOu4UJlWBQzu3q4R01dLw6Y/1yDPUiotlfRsig+rSpHhdgcHTkEBoSFRJV8+7vplRssW5hEm
	EF6U7hvtBAjWxSCkadsLllXRol6wsTUHTnZHNhtt47Tz3O3NdfiO8bz3Oz3Jdlc/vSMD2dDTLXi
	tq2XJ2oTnDPwlvV+IKDn7DultTZFt7SOXlM/I84OIU3j0BuLkT8uvBOFedW+VTCWP86Yz9NePag
	o
X-Google-Smtp-Source: AGHT+IHdJOjKrzQzkQQRCXSbAnLH5FFessN3GeskMAbLKgYrjEA9y24pcdZQtQV3lv+cDs99o+UQfg==
X-Received: by 2002:a17:906:dc8a:b0:a9a:2afc:e4ef with SMTP id a640c23a62f3a-abc09a97a18mr157000566b.7.1740151513561;
        Fri, 21 Feb 2025 07:25:13 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:25:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:22 +0100
Subject: [PATCH v3 12/21] drm/msm/dpu: Drop useless comments
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-12-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Rtqqvrg7pP9bsyM3YOU4Po/H2xEipMowzn5M0FXGvfw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq2+0BckVlsV5NQsH+fOOk+tgIU+W0cwtdk8
 5PAQ0lltK2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iatgAKCRDBN2bmhouD
 1989D/wNvFmmF2NaNbzyERRYlayAx59GBiMJg46dVMuecOeKpYw7e23TtYOBE9e7+w2dhIx2aUP
 J4cLUKshVRrUNa4/xJQ7R+qK5+CzhpVoZT8X8QYnQ6nevWv4GpW0L7gB2RPc80DT0lNDL7kOdeD
 CVY15jrscmSWYkScxCbl66kCdaxVMEa7cHpGcmKaZtEhwU6XSFsLHMvDOp1vlYuzDMtA0sVm8FM
 NK9lbP4oAfJZ8+rxi/0IuSpRozbwrmoOkXrO3uyxbEc9m3XFp7eZ7J21qmObzy2ThScv+QO/yIN
 6H7MRnplfjyV5QqKExYW0tYeW8c20GMFl+SmTQ/TnkVLWZV73pnkm4Z/HJgXd4ZCHoNJkQFZKjt
 cjieYatKU2V4CO8C1dB7eweIn5Qkunm57Y91nRDKWMLJIgFEuAE2PMiD4aRCEb4czTtyUOzZxEm
 A/eUZFbxkYkYMe55NEcdpybTwFeuouDPqOODoNFysGa6KBOkGtBZPqZusfjrnxEhEg0sq9N6cYG
 gtzArVSBRBjTfh75jckfEYuzK5NUaT/mfg0soWqaECcu/PbVJf6IpuqU9UvxW5bsku/BuklYAfH
 K3Dueo8PwMsy8oTnKJbqN36/Fm6wfp4wZ6iagAhFLke/sSx+MWlHfocl967zWudT6Z1UYYkPbzj
 KmVHudvaqT+tP4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drop comments about SoC before each 'struct dpu_lm_sub_blks' for given
SoC because it's duplicating the actual name of structure.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 7ea424d7c1b75e06312692225f4e888e81621283..4ff29be965c39b29cf7e3b9761634b7f39ca97b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -362,8 +362,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
  * MIXER sub blocks config
  *************************************************************/
 
-/* MSM8998 */
-
 static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -373,8 +371,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	},
 };
 
-/* SDM845 */
-
 static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 11, /* excluding base layer */
@@ -384,8 +380,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	},
 };
 
-/* SC7180 */
-
 static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -394,8 +388,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	},
 };
 
-/* QCM2290 */
-
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */

-- 
2.43.0


