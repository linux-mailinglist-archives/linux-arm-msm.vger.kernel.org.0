Return-Path: <linux-arm-msm+bounces-50358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA53A5003D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 14:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41D6E3B5453
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 13:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715E424EF90;
	Wed,  5 Mar 2025 13:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J6qelFjx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED0624EF65
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180171; cv=none; b=KWz9u0mCv/oSCyxulgmQd7B8R2Jr4yazlxpo1JjFRMMZLMynYdD6/GC4sYpEiajFUh2dMxCUIuv9z8YWBmofAhREp9aKU08MBmKFKz8A7k2BdnsPvYwL5p/mucaCrFOYY0SPnTkTzim3Xi+A8pp0sZyg0mnIUL4LsnmjuJ+9CxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180171; c=relaxed/simple;
	bh=1lfv18zXpdxY8kZVpZlVeAwNtS8AmywOofVeGqzeOEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aiMwUebUO5HpmbfK6meJAAMYw1oQ+gDRP3OhrOOZ4zMsm9a8XCegFy/bL0CA4B7+YZovMz7WnTskBnu3y/WRz87cY6mP4KGDPzBLhWyffFOlmnw0xu9UfbjLB6U+FQ1PoIsfEcB019SolQeXs5dfpOhWCqwCaKVGkU81ZvbVWhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J6qelFjx; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e4ce6e3b8cso1315413a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 05:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180167; x=1741784967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcO45S/il2qWOt5c4ZNer6B5gyqfJVMeCB4pzlqBXPc=;
        b=J6qelFjx1/6gyYUNzM75bbEBjUA/ag0WrIF01NMXVXQ4nhz0PDh2Ezb4IVbjRSg3je
         GqSwJV8Jblym9JAE2YQn/zI+ROWpB7chOQOTKBcBHZOp0xOUOaDDz2amxVREPTy48o1m
         FcEKyWVd/O7bO/9pudoJXL9eUV6DzE0zy+c46vWR3t37+m4/EEe3RncNsjrZvA6ksOtQ
         ohXKNSWj+uyaJYZhZ3iwG3GIeU5tjo2jcMup/CqyJu/jLOzEtf2W1vEwUWkO5Pq6h23o
         eYvkne6wwZ2nLEOaix27w+9amghpJQ+opm8+Y/wJJmDe1mRkTp5H3yiEwZx2Tv2vvFdO
         t67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180167; x=1741784967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcO45S/il2qWOt5c4ZNer6B5gyqfJVMeCB4pzlqBXPc=;
        b=LMVv9SRy1DlkaK2yzEjn8f/JnX1G/+QBmoIm8fjQfD5Cg+/zGmQQqeblFfljiLC5sB
         Bnn6psuQ2BigSXrufAkaLd6CA/QY30kczmzNmWpGvPlkhJHXygQUOydftL2KUEsd3pyQ
         9SHUBHJK7lZBoInyh2Vw7kybVA515DV6yvxsg+SOJJOAyagRnSTnoxr8yBtc4QLAZVdG
         T5zujkrbbR1mASR1/QvrpiFHJnTK1rIeAoedE0UpNzNsI1Dwlgaj/E6Xcuzff0u1YBB9
         YOFvGbtOY/85y89PpgqjyaAVBYOqPVUSHDQLOY8HrOpppoFiK1nLYpXOr8TWLTaeRlIB
         sNfg==
X-Forwarded-Encrypted: i=1; AJvYcCWCsauXfvebAISWsOofE/fMGtFAXoWq1hZqidQsQvtraTJQCBvx+SvuGu7AjZB3M3KdU3FL/m8hrxpBTg5A@vger.kernel.org
X-Gm-Message-State: AOJu0YxJhupGo4eGAClBRhcpZe8oOswQh2wYOwEBWelvGYOrYtXdH40T
	LVhpf/sgGhdo7do1g7kMpYNzEAQ1NXUi5J+3J0tKDImWukJ47GXS37IXvW6i2tc=
X-Gm-Gg: ASbGncvzS7bb4T0FUGkjUUrfvtvVhwZP1ZQWhCcxotrozoxo6z9ofZOaYPF6W0k8dee
	f/m9PCt0fdMk+O0L2OYPjC79oco1UVB+EF95ERcOLMXN08X8dGNvaIOfq3pWUAsP32IT3WjSj7v
	RGQckEvHBnvKhLDdRbyJDBsUnHUnovi/r6bOcb5SDmNuVVqCPNS/Dk+mDNraeHCaBUVRtWwx5E2
	zrsMGVKCnTo+hwXdyWZc4SZNaXREL1jUaY3s4XvEU2b6He6zcZGeFhY07Td0a2jtz/ZwDGSdnDq
	IuBX+fnCBrgMAxe3ea1Wl7sTD1j0gNm0Hv7+vKY385o=
X-Google-Smtp-Source: AGHT+IEhPlA8syse6BxS6MwO/8ykIl7YX3VsOgc47tKf3pBFQkbkyjyaD9GvZYQWYZb90PvcAHhpFA==
X-Received: by 2002:a05:6402:1cc1:b0:5e4:95fc:d748 with SMTP id 4fb4d7f45d1cf-5e584e2916bmr6857202a12.5.1741180166877;
        Wed, 05 Mar 2025 05:09:26 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b4aa5dsm9627341a12.14.2025.03.05.05.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:09:26 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 05 Mar 2025 15:09:06 +0200
Subject: [PATCH v4 3/3] leds: rgb: leds-qcom-lpg: Fix calculation of best
 period Hi-Res PWMs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-leds-qcom-lpg-fix-max-pwm-on-hi-res-v4-3-bfe124a53a9f@linaro.org>
References: <20250305-leds-qcom-lpg-fix-max-pwm-on-hi-res-v4-0-bfe124a53a9f@linaro.org>
In-Reply-To: <20250305-leds-qcom-lpg-fix-max-pwm-on-hi-res-v4-0-bfe124a53a9f@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Kamal Wadhwa <quic_kamalw@quicinc.com>, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2202; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=1lfv18zXpdxY8kZVpZlVeAwNtS8AmywOofVeGqzeOEg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnyEz9GvsrtuEyjaHc+0jk69pgJbYcU3phTRWaq
 N4oAF9qzWaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ8hM/QAKCRAbX0TJAJUV
 VjNUEACcTE751zA3mWoqblM1OJYA48Kzok/TAGKeHouxbv4Rf/LdSP6eB3zkjNKKYLEgpRVsAUy
 LTIjXRTmTe3u/TPrdbuzR/8ZuSNoXW7GaPx18Hrgh5cfEhNZQY+FFVscVY7ie6xW9hXZeHGqGpl
 Aw7ZXNAvfnTdpwsxFn5ZaWQI2kgUal+z/exISqrPcbOhSYMzogouj1/nt4ZBYlPPfj49kxUYHVZ
 Z8PPvFXEAp7aWEXSAlffvZecuxHzJtc3IYlb1mNIR9xby3aRYi7b+Xb+GzA3dzcNfA9+h0Jcdfl
 KKQozdo11qANexEqJWTptXvTDyrjEg9IOHYXF5L8D/9iG7VNEC/Vt2iN2eks+Uwqn8PGWvSqNhQ
 DyemuYEMKCFdvQp77Fe0rNXttGzmZwqnMlJFizok/LrZFsS7eg9TTEYtgNBLTA/BM5mj1JEWWYr
 UFMUiOaBY0V1MfYkxs4Ay1ijK6+pRhtfVQk5XyrE1sy/FaRffUBxXvE7dM0nLBkyEg89a0ofk+t
 DB93pHIlBa4epkOPSKHFK4HGJOcyqvLEQQcTiLnPDy5d4xgtZKy33gSZHuKta77Wkj/4cMprSOJ
 +LCAPcWFOn6BHP/+1DPV+az+Uh5Fpyc6xaTIR7pfT0LQU1JtjjaZ8xUateBxVCRZ9PULctU/s8h
 xuX/yP4eD8HoatQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

When determining the actual best period by looping through all
possible PWM configs, the resolution currently used is based on
bit shift value which is off-by-one above the possible maximum
PWM value allowed.

So subtract one from the resolution before determining the best
period so that the maximum duty cycle requested by the PWM user
won't result in a value above the maximum allowed by the selected
resolution.

Cc: stable@vger.kernel.org    # 6.4
Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for high resolution PWM")
Reviewed-by: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 0b6310184988c299d82ee7181982c03d306407a4..4f2a178e3d265a2cc88e651d3e2ca6ae3dfac2e2 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -462,7 +462,7 @@ static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
 		max_res = LPG_RESOLUTION_9BIT;
 	}
 
-	min_period = div64_u64((u64)NSEC_PER_SEC * (1 << pwm_resolution_arr[0]),
+	min_period = div64_u64((u64)NSEC_PER_SEC * ((1 << pwm_resolution_arr[0]) - 1),
 			       clk_rate_arr[clk_len - 1]);
 	if (period <= min_period)
 		return -EINVAL;
@@ -483,7 +483,7 @@ static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
 	 */
 
 	for (i = 0; i < pwm_resolution_count; i++) {
-		resolution = 1 << pwm_resolution_arr[i];
+		resolution = (1 << pwm_resolution_arr[i]) - 1;
 		for (clk_sel = 1; clk_sel < clk_len; clk_sel++) {
 			u64 numerator = period * clk_rate_arr[clk_sel];
 
@@ -1292,7 +1292,7 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		if (ret)
 			return ret;
 
-		state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * (1 << resolution) *
+		state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * ((1 << resolution) - 1) *
 						 pre_div * (1 << m), refclk);
 		state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pwm_value * pre_div * (1 << m), refclk);
 	} else {

-- 
2.34.1


