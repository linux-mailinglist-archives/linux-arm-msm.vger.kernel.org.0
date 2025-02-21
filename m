Return-Path: <linux-arm-msm+bounces-48911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D11B0A3F8AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 584EB7020CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0BE215F6D;
	Fri, 21 Feb 2025 15:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G2vwxtpA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FBA215787
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151511; cv=none; b=IE2sY/E4OU6DJ0mewVKFe2ou3Lu58ycHA8QKaql55GZ++LaVXG8zH28gcjmcdhfR3TXK4YcDpedQ2r89bS/71/cxJ0Cf2ky0IX2KNSmYyd/9k4UzmxNJFMHIh5MX6efTru06KKKyXCvEi4Ku0emdp/OFTyATGRFt0NrZSAGkQuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151511; c=relaxed/simple;
	bh=9VwNmNeCKWvrEI0E43BuyMfe52M7P67PLdAG7OHfpN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ENSoaueYxzALqvGNRQmVfsvk9MQlTq9VM/kEsiKztYtHqeSuoyIirBrVcbXS5xdMknUJ0wftgY/RddO+ONEEjT4BNMBHcA7ff6Co+zttISuti9Q5UhRDZ2sjcPTYMpeZ/vIaE/omMAyxDWvCeW8CuhnJ8hnqgapkWjUAVTlR5so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G2vwxtpA; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7d8953b48so33260066b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740151508; x=1740756308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxNPRrxR3UMx3sFuHZSjQWUIyV+Refeg1tW/AVVJ31Q=;
        b=G2vwxtpAVHHXntDZVx7ivj5nyeg6wN7oc/afh2qi+ht24s4/PpfM8o9zBnV84XN3IF
         Ooq8JFRlJOhAR/OHk5FxJRYA9CHYjKZy1EmWIgKUNniZFayiONlPx0T6HNcXqSCzq4CJ
         GThhC2U9z9P2aPfobRr2LYe2kCyhRvEY/xd09lU9wD7rvqY2WxH23ffLE3LQEIvwY4J0
         qolhfZQADB9NNUpQ+90KKezzycw6+PyUB/dSgxgmVKna1uPA0ObA5stPYNSXdBSyJILQ
         QjW4Qp4zaF/Sunx6kYLYN4/8jygzfP+qqgaVYxCODNTo8ii2x28iU0LJwk5TH86xe76a
         6F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151508; x=1740756308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxNPRrxR3UMx3sFuHZSjQWUIyV+Refeg1tW/AVVJ31Q=;
        b=H9SsfI8qapZwvTCzMBP+/nNmrENEq2PVGPfE64/rxs7EKvi3ctLDg7K5ksuyUge/DI
         RuE8P6meZAshoz2HtMOOIYhZy/fSH5L6hVM8vvXf50/5XUi9GIw3aSOALddcgF1iZrZN
         fc8Iw830uT94OEjuWDGf+cMBYVwJqGAM0vO9uDxCTOCSeMf821Cw5nUuaxn/GGjR3fQC
         jkIbNJS4gnKZXh9LhSYSd2G/TXSCUFqXblJXFydzSQ8YkikDYm7z1/SPn16/DbippICS
         ECGaq+Z45rG4NG1Nu+xAevWxA1VL6IWHjUEaur/K0RODJSe+dnmHAPoKsdhw4R9flG0N
         aQGg==
X-Gm-Message-State: AOJu0YyX70KWjs6fuzSKPMgqV6Ie+1KT/vKLTbtDejCYfN9D3ScakfuW
	N/9Tu9rhYQciNx+NCYOGQ91w8KtqxaOhuJWJY3kmAJvrnntqXhQGBGbIMm2wbAA=
X-Gm-Gg: ASbGnctwn2UKsj44igqQ36jC/yPpRj/qiFaLRJBXU/ZJkm6+rAY4glxnGebfd53iJ0l
	Ck2yNMC339FKJ1t4I2x5rgj9cg5LgpjDIgGXxj81Tp7QYuXLFgISx8RnOzprrp+dSCbP5ZVzQbm
	Kd75FHoZ59M2vPfRy147p5X5x5DKHCxlPnPB20DeY06TLWGSTpC+p2y8b1d0uM0qcht1zkeVOPy
	aX09vrWVjGNcRunr+5rNaOr34luiqP7e7cm4fnP3EsqnLm+UT5gGp/dsjTaGWcqT9OvvgS1UPGz
	3a3tslWjU2b7BBKe2eVgdoWcMBh+jcEpYDHgIge3gINE+eGtQmysuMOXtVkpUqvKeSStG01riOI
	7
X-Google-Smtp-Source: AGHT+IHh0fQaTyfAd7x4CiJbEqFqx/Echs59QFfVMAyNt0Xg9z7x/W4mDeJ4QDQAi9ApihkTQ3yXlA==
X-Received: by 2002:a17:907:7f8b:b0:ab7:cb76:1ae3 with SMTP id a640c23a62f3a-abc099c279cmr142429766b.2.1740151508098;
        Fri, 21 Feb 2025 07:25:08 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:25:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:19 +0100
Subject: [PATCH v3 09/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on mixer
 reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-9-3ea95b1630ea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9VwNmNeCKWvrEI0E43BuyMfe52M7P67PLdAG7OHfpN8=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGe4mrSg/e3xXqGoaof807wjPY4hcAiqoJ02A2Y8HGAKoTAAS
 IkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJnuJq0AAoJEME3ZuaGi4PXsFQP/Avo
 A/CWck20edK9vihNhad341ZvUbBaUW4Rc3fw7DvnDOXT+MOopRGMO8GyCH5s0e7MVVIWlQYv9ph
 kyzUpzOo70C3ssipW7zJU6oJkMP2j8Ydvo7i6j4F2e1OD2WlcfY40bZ2pPmOtbXNdeR7iCuoAk7
 p80XegXIlzPE0Fc0VRQQCzDP2xIH96/iyRw/7K7rCFxv4AIKZq/7m8d7Tuwv0DnfeZgay+N1qa5
 cy9Uz+sChIr9NjE4dEQPadqXmR5TnQrSrJqhSNl7JRxs5O/TScaDpKRDRGeM1zeRoxp7QIXLH9W
 8vX0NjfRqE+htZJSH1yFlUoLH5+fJQF0A9d7rUQlZjWXrhrLexCUjH/eKp9RXtxX2772utDlKF/
 TwCPhN4MJS09C3XTQX8xdowMHI5siFkrK1FLCn8OGtrYgdihNtIi3YXKolbcWNe9Fi5JoAO1Kpf
 9mkSWz3pK1FtqcTuadbKvwlSh8ADtRkWcc8NkoE6jx4rLi/K3lT+uRCiPg309UmSJcwXloBPRUD
 lpABBINqeAk1K7W5KtNOH5eDxE8SOJJbww7Mro/TYEoHDivtuO5dph/J1P1QU4sk3hjQ8BFDYtX
 QtCIE5m1xHmtz1O2TmzObe/M6yiqIgw1Lcp+zge2SEba5w/2IJ3khamf4glL3S0I0k22chHL90D
 OUtJ8
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Resetting mixers should also include resetting active fetch pipes.

Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 48e6e8d74c855b1fcf13c8f42516437039fc27da..090b2aa5a63b4797169b24928908215e2424e6b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2199,6 +2199,9 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 		/* clear all blendstages */
 		if (phys_enc->hw_ctl->ops.setup_blendstage)
 			phys_enc->hw_ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
+
+		if (ctl->ops.set_active_fetch_pipes)
+			ctl->ops.set_active_fetch_pipes(ctl, NULL);
 	}
 }
 

-- 
2.43.0


