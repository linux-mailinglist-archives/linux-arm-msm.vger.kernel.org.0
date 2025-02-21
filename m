Return-Path: <linux-arm-msm+bounces-48916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5BAA3F8B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13B0219E0CD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C26212B06;
	Fri, 21 Feb 2025 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pvxX49Mt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E6A219A9F
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151520; cv=none; b=L9ZSsY2fN7QhaOGNoyW7B7m4labGYYeTd7mSTYqBy+kOTEACvzU9VVxtfNcpcLmVQ8srGIILZ71krGfpyK2y/+/7QdHZ6A8eKVos5kD3OndHDicZfJALxkxBzTEJ5VbDFFIMM8TgE0uD62Gv/S1rybCSB3xJFaJVebKLdKsGg/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151520; c=relaxed/simple;
	bh=JRqovq+Rdk4ORXpGPmhXUXGU0PwNM6eotWnKyHhO04g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwwZQa4GeAhV64Zs4eGLZUA2zwxfrXmXS/jjL7UhoeBAc5QZjf5h+6xmjuhM5FmDKffMJB7U5JVRRT24zpiCj2FJyiYpdPG8nn2W/ZvUQBL4Nn1BxGYLS7rsMGMGt6ioaA753Pd8A/ERjrUICCp4OmE5RY2Yy62oO8XoPSOJPr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pvxX49Mt; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dc191ca8baso450462a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740151517; x=1740756317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MScxPmftbdaB9C7JfNjmumigE9RQy6JfuyND1GmcrGQ=;
        b=pvxX49MtuQeD0D7NWEnc8eDfhaHzKXPrZL7FWKh8p1n7d4sMT8bn5vYLrZvmznVJFj
         4+LKWScUDuKJVs4jkH/nJn22Mej35g7FcbkWso7OqSDT6HJkOs9UswWup1xB+EstRjN0
         Qi2Tc2pUviYJJte7zq53xRNDlbt7gwmMukGcUR3x8XVtKQMjMCzud7+PpGauIhKiTHUT
         VRm/1TW7ZVHCqQJuwBvNOU3LjUaynNyxK1zVy/F+AOZU4VU7AFOc1kdFPYb036LrHWSU
         0P6r+RLvt444yL6EOUIOQzljyEmHe2peDVBMR2Bdd+6mTYvEbJ9aUp8hhu/XaHGH4Af+
         n7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151517; x=1740756317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MScxPmftbdaB9C7JfNjmumigE9RQy6JfuyND1GmcrGQ=;
        b=XLVClR68Ouf/LoKgq0oNo5idk4wLpIRsYjyxv67PBzxoU3nWFHr2OXHeNTVuB47uQb
         4NwYnOHE2JHnaAQ63hTkfKH0mOOw7eyqqh/151s95KTYpQ9dUX2CZgt5ZhZRUEOSO29J
         s4m+YfkK5yrxZqJPh55Q6mTBvmQApuMtvzHhdT3wD5lCGGgpZLMYhnfkMtNnGmA/6tHR
         Spui0FUf8Swn8zB1KgiwComKIA5baKg7mEnFiyfqg/yvqTQDL+8DmoS7BJe/MIJShb9F
         zYUjO050Q1MF2YK6Ci0lpw8+EU5gTHMOzmQTjXVhnpBR/932v4Hy9BUVfzjp1aG3XHAF
         vS/g==
X-Gm-Message-State: AOJu0Yzq6W0Qj3Zu7enjk4ZJ7171tmQQ9BYFlEbS5j8rhupwo9TrNnvD
	Exfv8dlGjKan6Y/4ymRhmsRAHaVbrl8QFHy5cImvYy9d/DGA0eOeDka132L5eUw=
X-Gm-Gg: ASbGncv/IyzXp8Q+gKzqIMSyQkSNglPhMlYBlB0pWboXtpoCq2mIcWyz5kcvw4X8C9P
	bGHWBsGY4ii1jjDx+Dha24j13tT8Si4V087Oqhs+EHLQY5pExy8GhVYkVMouwZPkSuktXPhYjwJ
	B5XUnERdUqazcoWNwYzfyPv2lebUf1iZ2DBzXS0qWNBEGgO2wJXuvrXNFP2iTQUYYbOn/S3DaE/
	KVbYexaEANVwTDea4XtnqeVCOshYwLlO/RLLz8t9R4jJUD9ygA7ksaGqwp6IAXN7PStQ91o2Ba9
	kDtTNxTSYm92uaw0NC81jcmtilFc/pzP5jWsb+vewS1Xl51HQWVB9zGt2IVCmVuv1cvo3xv/ihP
	J
X-Google-Smtp-Source: AGHT+IEZnVvREUQe8xdsdj+GBrgqQ7C/qFngFux4HQwA1pzTqFUf21THE/JmZxJqitoZlusB8jqZIA==
X-Received: by 2002:a17:907:7f17:b0:ab7:63fa:e35a with SMTP id a640c23a62f3a-abc099e1dafmr140825966b.2.1740151517355;
        Fri, 21 Feb 2025 07:25:17 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:25:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:24 +0100
Subject: [PATCH v3 14/21] drm/msm/dpu: Add handling of LM_6 and LM_7 bits
 in pending flush mask
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-14-3ea95b1630ea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JRqovq+Rdk4ORXpGPmhXUXGU0PwNM6eotWnKyHhO04g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq4bVJFnsyb6JXH0wvrNs+g4JuM+dv4z0uK/
 SXpuDXh5ZCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iauAAKCRDBN2bmhouD
 10+bEACS/6knRONeGRMXYcJCR0RdF1lHQo2wynIQXKhVTCF0F2KMsTDrqFOiGs1+EXBtyp+tM+Y
 xe/+bWynGqwKEbRNdt4haJT50d6v9mHfR09hzbVuxRzX7gC2dZvG3xyUbGSDTrn5kO9szHGLOgO
 9rRxycM+wrNkV7Lslr5FvhgjYdePrmrTBi4lV393VJZzH7hoFmQKBqXTyQCw/MD3kX6DGF9X7n6
 XvCe2nXpjelkmztT3j/HGLqpmSQ+fctZexywB1ZSQaTQmf686BIRnWLmvcwAIxWH8Ei07pQEeVt
 q5U0PgQw8KLGkR4YE8BNUJzS7qXpA/SAxq5wbwbClFKC2mMBtY4611wdvGD8oSy7Ueqby8+qeTc
 8wgarJfbYY6LmmB065D9QNPFNFqYh27BoHRsWlO18FBcubQHO5Na18sUbm6QSkUC+TcIyXmsD5i
 rXHpZltfdZg8DTREYZQdwfSIg27i93Xm3/pWicS8Zdk+koiRbiJAZVjfBLMw83ePDbaM6tGmSrP
 enOYXotVh6DXbn+cXfKpHuCnIiibUz/M3YlQXUIVwhYRAD3HLzXJKHFDR3hJc+w1yedmB3yDxRD
 b3Tzo0zzHml7BZtjxeYwGv9jRO3QI3XE51h23/N5R2OMnmc+hrTg+N4t9MI6hc68pAZpJkz+84+
 Yuv0917jW4WdbvQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

MDSS/MDP v12 comes with new bits in flush registers (e.g.
MDP_CTL_0_FLUSH) for Layer Mixer 6 and 7.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 1c14770865b4b5f83a95feb35d8ca6b0c87fdb53..43a254cf57da571e2ec8aad38028477652f9283c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -254,6 +254,12 @@ static void dpu_hw_ctl_update_pending_flush_mixer(struct dpu_hw_ctl *ctx,
 	case LM_5:
 		ctx->pending_flush_mask |= BIT(20);
 		break;
+	case LM_6:
+		ctx->pending_flush_mask |= BIT(21);
+		break;
+	case LM_7:
+		ctx->pending_flush_mask |= BIT(27);
+		break;
 	default:
 		break;
 	}

-- 
2.43.0


