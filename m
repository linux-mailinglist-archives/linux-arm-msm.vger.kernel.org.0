Return-Path: <linux-arm-msm+bounces-48912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F28DA3F8A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 588D0426248
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2972163AB;
	Fri, 21 Feb 2025 15:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p6I5c41R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7935D215F5C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151513; cv=none; b=XICGSCuH+GMy5fzV19b0p4RQhvUiB1+37ws1ogxYANfaPnjl+RWhjJorANJoa5QHKBW+IeaOhruW/pmjlJ0t2nNztQWedhPal1T85t2RidMNtSf6mz+/FrhZBXkp+5ng3pg+667pMKovi8bqa0jW93QO6Hp6bjJoH6Z8cU7ExCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151513; c=relaxed/simple;
	bh=ESNFAo0W8bIcHw5ZPbGGU0/A64Vmk44uaAkW3dodBRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GUW/4rkitWjw/sWyVe3JfpiLAogKaH6/t34K4TV1u/TwXAfJZ76imi0uXclEU8Q6JHybKTAvHt7dInWnx9pE2OG4ypHCrNbEgEPSAaNOOg8vc03SnTgkbqxK8gS2MOHhlqTE3pwYiN/Pvr0jcFkSqRaxPzQ8apoqWXCRIGefY7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p6I5c41R; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abb9e81c408so38727966b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740151510; x=1740756310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEw8TbcK6Q3ctC14U9SOir0rvTkUsaIx3mimKGEmrWk=;
        b=p6I5c41Rj4YINB6fwUWEnhKw4h4N0EeNS7CjnntG1zSxAPqFIBjzBuTR0liS/yObNs
         oeA7eoZoryuYioA8OI+UZ114XyEYurknIlTtlIJeRs5C0vSvnmO2i2G9yaUmA3zo2so4
         6mqj9nGg0y+mdTxIMxsqu+wqf9LGOjTB1amAVNtGDHeCBZXVxXArmHH119XUsyUD1XEB
         CdAySzRqKPoHUGqH/wpU63CtTWo0grz8zO5Y510f5KdKoqIkSdxgFTgSW9GsXQKQexRl
         HYpVpeiR9KHP5MXiA5ukO5zREixl9BAzRXNiC+uFr1IWbYYSnAs/CuUXgFnHkWXI3J9d
         Xk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151510; x=1740756310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEw8TbcK6Q3ctC14U9SOir0rvTkUsaIx3mimKGEmrWk=;
        b=l/fujaGySj5Y8RzDGEbt/0aDNBF7H4wdwmSBL3hc1pHhuFsl5wgYybEK7pwVAJ89e4
         gXee96dNo63Pzwyt9Em6TqbF6qzxTVIONeSu09TRRvIt60xC312QN2PRNME//wYR9y6A
         CDOR6ANrXwm3wu3gLT+R3zCgXO6i0VvDRnPJ3KaTfJRiBkr/tZLkaVjPkWnC8LKBOxmm
         wcTfW17ReFpZsjahqkHlyXlcmgUsooDs5e3jglm6jVYIwsf3pNH3APYbJDHj5Ef8cdWq
         h2dxzdGPtEuT+KAPMDzIAw725kEUlN92wYSp6L+OVqueRMOoodtujfHx/yQaPq/K5Ebn
         zmhg==
X-Gm-Message-State: AOJu0Yx9peq6Pv5iGOtMNNl/9kE5EgwQoNasDaA5YRe+DWBpeSX+/Wln
	CBFQd4CAW5/6gNQ717YMW9iW5Hcbg50pMBWZGEr/tVS8mvb6y6iZFaKHpjQDrw0=
X-Gm-Gg: ASbGncu4MyPZPR/oYsTSinDoekI8r1XGPr83XO19N9ISVvwV1jfmxx46qZEXfBqie5e
	VA6WnwtSoinglWTYDxAK3xPZo8/YUDg31ukDaS9BNrc+c45GU1iASL/AeyGpLAEuN4wZ5n680Zq
	N0V8ygjtA3ejiWvrwGjK4u/jEOofK0Krns0WXsTWHCg2UBgBO3iMhEAYRtp0x9BN+LdySPWabpd
	OrPbM5LiUXZMBr63VffzM/tnaJQArUjz3rkQ4zbxaEpGmqYi/5R4WVO4MzcI2GScPsBCTqM9QOR
	PWUSD9QFHPT7b6EQLz4Svn6AiwIqVPm2nsYUoX2Sy3Z5wM2dgFt2E73ASdQqybddd6UJ1JRdBmX
	P
X-Google-Smtp-Source: AGHT+IFMiyoijhhsN/r66rGa3gdxIeiogjo+gOS8owC4awJmR9PjmfqBaix2rAFdUv1+W8Bs+pHTyA==
X-Received: by 2002:a17:907:2ce2:b0:ab7:cd83:98bb with SMTP id a640c23a62f3a-abc09a3c1c5mr142336366b.5.1740151509961;
        Fri, 21 Feb 2025 07:25:09 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:25:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:20 +0100
Subject: [PATCH v3 10/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 ctl_path reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-10-3ea95b1630ea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ESNFAo0W8bIcHw5ZPbGGU0/A64Vmk44uaAkW3dodBRQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq16yN8kEhw7drJLPUlvodxfwFeC/r2eVwDW
 WjtMKuMWWGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iatQAKCRDBN2bmhouD
 1/+sEACGJReGDn+b3f01/aVELZif6yYJJ+SA6Yf266CzmM/U9rNv6xCkX1jnrgfNjDVdScFkSCT
 +XFtYc1C5WkoH9zVGxJ6e8nn4tVBnUQQ6JTseswL1JEW/U8tCd0JWZdiC110M2dDTt1FERCNH7/
 M6jyHhX/wgenyGMGn+vS0IrVWlGmJyqJal/7zhASirLtsF5svm5ARV4kUpjuPmM1dGaNWIli+pz
 sTgI8Cn2Pu3pf2ZODIfaoBlWGvREKN8BnTsPTmU7luLLe+dThw/9ujQBU7WRUIKEaSA8BsfoLe8
 ZFI1ZA+0J4foWj6zw3JVu9F0rgKby7wF56NgVssD5AYlydwMNYvMhAadjAanmm17MoXituoBwhE
 B1Bwe8H29yFG4uXSemzj5Mw4/VvT0IOzcK0TzuREtFjdKBmY20nLrM4ZjLVrRB/Xeaic458aPjt
 1QL86hQ8sl0ZBdFw19JRUbmIsZVBktJBc9QewRnURgDJehfrvUO5Ti4UID4l/w2G8MH7e7IzyYP
 sU7zxSLb4n393BRm1XV1KzHgRFpG52hVnOuNFcJIuEuvVpVIjZM2zo4QtzgQFzd8eEu7vY/TRM7
 +odudo4ZW8C55I/iXdluEBKSUBLFEnVYhr/fNPoLhoRmb6rVVITxo1qF3zG+C3jT0lkPwN1SK6z
 28cs2UOTVRqOM5A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Resetting entire CTL path should also include resetting active fetch
pipes.

Fixes: e1a950eec256 ("drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 757411f8ecec2eb7096b323a99894a5d0cc37fd9..1c14770865b4b5f83a95feb35d8ca6b0c87fdb53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -644,6 +644,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 
 	dpu_hw_ctl_clear_all_blendstages(ctx);
 
+	if (ctx->ops.set_active_fetch_pipes)
+		ctx->ops.set_active_fetch_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);

-- 
2.43.0


