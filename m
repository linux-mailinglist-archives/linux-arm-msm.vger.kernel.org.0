Return-Path: <linux-arm-msm+bounces-48913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B9CA3F8AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AE5B426831
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844E9217F4E;
	Fri, 21 Feb 2025 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D2sAagTB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF742165E2
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151515; cv=none; b=CTfhp37N926xw4Awmb2MQIN6389y442SfMpqExTjdm0bm1SOpuV9YRRKZLiyDgkLkAPgHcfjx3dxgDEJuAursHb6xKK2mFji1pXp32lbpzSDkiM5uwrCh6vNVylioZwUiVz1yyQ/5irwvfoNVS29UF/xPhSaJcsprdpIbY2wjqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151515; c=relaxed/simple;
	bh=NJ45LgTQlJolZGsxJ8wwShr0xgq7ERrenJp2LNxaJOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pRcJntBsC70pmZZfJcZlnR9C61LoRlsLuFvYGDVd8zGKoC8QV3Lh3XfvA5QacXIJxQ/ZY7996z7s9P/r6z/mHcy1TSNJmyJx4REyoNSQRBFGj3dFh/d41YX3kWD7DLukZ7fBldyUD7aRYw4Tsq4kE59NH4f0BeE5sVOa7WcrTfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D2sAagTB; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abc28af1ba4so3136166b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740151512; x=1740756312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uETEnzxXsrcxJw343miABNyaWXgTTRBWJcaHZGLuMIQ=;
        b=D2sAagTB+/DxqnYC5UDKN0gqug4Qf2c82Cg2z1DvcT7/XuHZgR7/oJKVIg/6hcviUF
         Eq+pUfTIEh4/SM8Ga0tl4OtO9P2ZEEN8VTJtuVnGXMAU+qrhwqvtUWZ/Lj8QH5DYomGb
         Cor9S8vSjnyflowh8z7cyDGX+YQgawEeFsD8AO7OSQwtr8SBKaH550T4XZbl5RzhW51q
         zpf6bYuzvR+CNCTtPTuRYSwlonF1ChXSc1rh7SAkrPlkMicklqQfVzISyNw9OEoCHJNz
         4Gf7etNI+P5Xrdf2AdGxGvOUwcwM3GHZ1HbapjwcoV5l38TySkPieFF3RnylkyeiPgWl
         gVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151512; x=1740756312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uETEnzxXsrcxJw343miABNyaWXgTTRBWJcaHZGLuMIQ=;
        b=I44dLM1iHswdNCKz0XOQzFyhkAHMyt4rMGGLZLius4B6hHiQJe/BXDV5xlfgGNcVxN
         GkNyAkdnQFg6vqYgHP42v4aIBOB/JFuZug5lX9zTCnYcXGk0DQ8gMgXYErUVl73/Ln7f
         xhmOSdiXZH7EOH1EVVn3JWn3DiCEZZAq/NYC4e/U7pWK/2rgezHzB2V+NmYtR2IbG18w
         kt8EQWM6N4IUD3LuIsP3WVtYbUYKH7TAXwgIgenV0JJt/mpM4T0DWLoGOhXuXwkuexYz
         uMwAFS9GAwXPk+EEwOxFaEAsrrKqNwNy3zMDrkVwlyWOeQuBrE15456rz6BYYWIKEObv
         aFZg==
X-Gm-Message-State: AOJu0Yw9HWluGoEYpEY1aD8gqztfsBwXLjhNxXHBL+JyCpk1+l7yOXL1
	nj71J3iv5OTA3qThEdBuB3c/HBW42fncJwgJiV5+CwUe+2w4r2SckZzY60rr7TA=
X-Gm-Gg: ASbGncvVrSRNZiejstRzyKPRNn4r6/A3+Uk+1XQnZZ1sd51N1gNli9i62gi1GGa7xJc
	kidvvNK27J8jZYdnlfn9yDcMOIUMSLsPUnVQOzatMQwvd1U422bugNuKQi0YL4yr527Le7Lpo8c
	WjSBCsEYO/Uk087e5ZztefzjixWuwn/BiuzEDCcV4dHUogLRF3z1o00JNS7SxgqplNK8a9TQmOR
	CNsv2OdcYG2+29yf6w6p73SrEr10PZbMT63HQnQB2h1OB4htwdG2OdlDaYDDqobbFtoWga1nd0Y
	LfG7kW/EWBuc4/xj1TlPjT41bmUmkOPBl6IoBhH0wrjnY4eQiz0k05rIodTQ6UzbqgA0OCBk59Y
	v
X-Google-Smtp-Source: AGHT+IH4qsBfcQ7xDFrHTtbwLWgEqC44pOLn8YYlo8rp3jDA5EwfNRoEqrdJZ5UAhQ9qdC2UwE14hQ==
X-Received: by 2002:a17:907:2d20:b0:ab7:bb4b:aa49 with SMTP id a640c23a62f3a-abc09a0bf7fmr159539766b.5.1740151511708;
        Fri, 21 Feb 2025 07:25:11 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:25:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:21 +0100
Subject: [PATCH v3 11/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE before
 blend setup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-11-3ea95b1630ea@linaro.org>
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
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NJ45LgTQlJolZGsxJ8wwShr0xgq7ERrenJp2LNxaJOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq1wq+sYpAfoG/91kYlqKkVWKgKfdeCiyeml
 U2xRmgpmwCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iatQAKCRDBN2bmhouD
 13daD/9FxXVjsQ4sx3at3aoeugF5KncoxC4kdwXt7iZz0vVgikqQmmT2o7fKhuiUp58xlvwJPKd
 OXzHkaaSFAriAt9bUjBuLbS4kqcY7CzD6Urq6LhSBM5XSYHo+9aIiPsGs5D9nhRAwJvYqrzbcQo
 G/Wqj0kmKQKKrUVSYui/43d8xF9IdIK3TbP4NAGbpguzD4q6EGp6C1cyErOPA79RUYxwdBI9iHb
 eCmpo8a9BqhGdYSOwkIZdXYoQ0Rj358UFgQbdIA0juFM5VlveKmAh6Q0K1yloymrAB+7/Kr5/SY
 VP+sI/IMKXollYlz1LRvVUWjrUC/T1xQIVcvY8LXCXpc6/jqb3WmoWDrjhTTfsY0cWgBTVOfwih
 VYg9SJB0xkPs/3xEVPjWzUvPl0yilAy92+2gv6qEY8vEj65pUHvDX/8KbWEau0GRpFH67COjpWB
 NonpnVCJyz++tyaKmeXrAdnxzp44jgvqCZDX9U+xqk5Rtm1F3nhWCityY/ukOGWDg0NbES2iC7d
 gz1vN186niRKeN4tD3kZPMrXdxFaeCer+Dm07Xeuz6LMKk6ZOc91azPPZvcU+Eog7khK8zIYKhz
 V0ihmfOzeT3/0JRGTD4+ZtYkXHhIUAe1K34SPjlk2ygPq7ksS/897vcbLH+sQWEljWDv0YBPH7a
 +6yzFQf/3wbpHNw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Before blend setup, all existing blend stages are cleared, so shall be
active fetch pipes.

Fixes: b3652e87c03c ("drm/msm/disp/dpu1: add support to program fetch active in ctl path")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4e630d3ac7effca2c2d4ff8801465c7a8d3ef136..b9fe3a7343d54f6f8b5aad7982928d5fc728bd61 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -519,6 +519,8 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 		if (mixer[i].lm_ctl->ops.clear_all_blendstages)
 			mixer[i].lm_ctl->ops.clear_all_blendstages(
 					mixer[i].lm_ctl);
+		if (mixer[i].lm_ctl->ops.set_active_fetch_pipes)
+			mixer[i].lm_ctl->ops.set_active_fetch_pipes(mixer[i].lm_ctl, NULL);
 	}
 
 	/* initialize stage cfg */

-- 
2.43.0


