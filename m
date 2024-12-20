Return-Path: <linux-arm-msm+bounces-42883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A54F9F897D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 02:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BD001885A1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 01:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCCF12B93;
	Fri, 20 Dec 2024 01:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cWa2njMI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04752594A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734658118; cv=none; b=pYE82/4oku6oLlBMQR4/v6xrl/q5EOseU7f1iOjqBMN1k54fIT5T48SPm7V3Ng8Dk9i/mQcfdarGyxrY4ekbq5I9rlfLsnmzeGvQvcf8sB8UX9j8TD1zRhiCziowN5lcRsnPhwf0aFh/7kUs+FGOEU8xY7sRkWQuo3XZU82km48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734658118; c=relaxed/simple;
	bh=8xOZo6SIWZxsw847lHaBi8XDboA4fhIU/Ie9tsdlCGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1YMb/4aW2Pl2KnY+JdzXQT3/Gf6PAfjjDFqmU8usAvJVaDrb1gN8d7s0OAMHWskDdxKznYBABICsGWFCHK/8jhzI/ojBQc+OGKFgPLbVZ6892RG8M7ikKycyZ9FK7ZmtZs9t0C93sdFshlgMJnLmxL2RmxIXPti+gJ+wjM8ee8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cWa2njMI; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401c68b89eso1572554e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 17:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734658115; x=1735262915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bHjE0IB/vPqzg640QI5Oh3Go2fZYjsbzOVZvfoGOak=;
        b=cWa2njMI4AwzqIxC3vnJlCZlK7QeWDuIsYlgwi0pe9+Dq18XBxt69o6fYGSWXNtlC8
         quVvOrhUQfofflXPLffGI+eabKfxviux6irTMcCutheO5NggcBuOnRvX36yp47cbB6VX
         GJYjm7NFHNPqvmFtYxc/aiqYwaIRvuQRiYLtCLRMSyB5e0JXb6f3Z3U6z+sqAbV0+sfO
         AAkxKO6gF36A0FTGzZumExz2l9Nm33SyWzoP/kHADvCzRfC2aMlgxxXjsnxzEezaY+aH
         TV5Zc+7suhxdIT0wB/905QAASEJgswzZwfwV1uf3J5TRciVhgfAn9jD6EkiKlDmMONgp
         jyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658115; x=1735262915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bHjE0IB/vPqzg640QI5Oh3Go2fZYjsbzOVZvfoGOak=;
        b=Kqn8+xX5696zOE3/gCYsilHzuPoro+wYcU12HGzP1RXmFHk2cxByS3UebyYlgof1+6
         e6dhjNQpwo5UNWza4h+HgV4Gem4MWMk4EHJyjkKG3lj0I0i8q2c/paj7yH4XZ/nJ4rmm
         lK4scL/xKAHlvNj9GbmTS2nOyUSg58WSKjjOMAYQILOIW0+8cb05Cy7Ud28gJxMePMZN
         yPZeZVsskp0o8s9AHhuYp0SknS1rSPiWtP/JGf1KR+4PcVI2wn2yi4fuRaVgPkUaDHAN
         SDPUzWSZVuVvqEItet2xzepNVWqe5PgxSBDTgMNun+nwglJ1v+70J9z8dLeUjog4OjLE
         Pyhg==
X-Forwarded-Encrypted: i=1; AJvYcCVl3993d5IRtkFO+i550TWXXcJ76q/icZjxYfwrXNrn948i4Pe0V05Wx0GUuH7m7tkH5ligdIPFA6bPlaal@vger.kernel.org
X-Gm-Message-State: AOJu0YxAw+tnfGXZDh/HvFrte9DJVEuMh2U4w2i6ro48u9pWj0BZje99
	C7S+vUOZallQHqot/xL91bhQC3N1W7O3R8r9Uhq7u37tao2qtM0OLYlCGbC0IwE=
X-Gm-Gg: ASbGncsaKtNBAF2vDezicqwNBcjPq7m2CfiPtI9lofjE7I4ddBsT3OxmTdrbCqe2N9C
	+ziS/a68tYtHrujQtRhgqiIPC0r0HKgkYF7NvQg8mRfbxAY5KzaWuQlMq21B5+WtKOPAGPcW9Nq
	y/dJwKtUx5D+Eitkll6aoXW5TrNBYD0mJN0MX8MLM4J9mW6MosdN/Iy7UlQl7m5ODuAqPaz9kQo
	QS37r1v6K9LXJQfsUTfkWnFAvUc5OVOPNROy9rZxX32yiGHK1EKujgekdIuO7an
X-Google-Smtp-Source: AGHT+IFkoQ1wDgLQWAyIiR/AcniX2onayOceXrfk5sMzc7gbQE21NuoTAbl5Sm7gK6XKGLR3lUJqKg==
X-Received: by 2002:a05:6512:401b:b0:540:2247:ac4e with SMTP id 2adb3069b0e04-542212e1035mr1554510e87.7.1734658114788;
        Thu, 19 Dec 2024 17:28:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 17:28:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:29 +0200
Subject: [PATCH v2 1/8] drm/msm/dpu: provide DSPP and correct LM config for
 SDM670
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-1-38fa961ea992@linaro.org>
References: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
In-Reply-To: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2719;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8xOZo6SIWZxsw847lHaBi8XDboA4fhIU/Ie9tsdlCGA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rKCbumdReXcE032tvX8uVtkUq/Z2LV+d0SUiebi6Ndt
 m7iKJbqZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEPudxMKycxy78X35p3YJn
 SvLzV++eevbUwSP9647Uss0yfqXNsmPyhwdafeG2B+yaGHyYRSSMjRXLrqi/1wqU/i1ZqS3AHh5
 kH76Nm1P6Z+z/eI64ZQ+u997bPGt2rtkE7pd2oofu5GcHOVt8sVA9JsXrviqvzqp0fwCnTsrzxX
 PzU6oW3LVJF9nUHGIRb9VTLpUVJKAdbn/J63rnt/iSE2Uxa6Tr94SeOnJJZm5SvZ1RltjEQ61Pe
 N7PSz35y6DthOZ23Xm/T/yKiFlYkK0494n26+SZivk/6t+xsAmyW8RN9T+hWZ5vd/7bi4mTXG6I
 9Wnoqd8wm250y0tXSW/NF6e9mX/TPlhJiVW8dpTV4PIEAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On SDM670 the DPU has two DSPP blocks compared to 4 DSPP blocks on
SDM845. Currently SDM670 just reuses LMs and DSPPs from SDM845. Define
platform-specific configuration for those blocks.

Fixes: e140b7e496b7 ("drm/msm/dpu: Add hw revision 4.1 (SDM670)")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h | 54 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index cbbdaebe357ec4a82a3c3d950aa13792a1fb2d6e..daef07924886a529ee30349ae80375a324bbc245 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -65,6 +65,54 @@ static const struct dpu_sspp_cfg sdm670_sspp[] = {
 	},
 };
 
+static const struct dpu_lm_cfg sdm670_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_2,
+	}, {
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
+};
+
+static const struct dpu_dspp_cfg sdm670_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	}, {
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	},
+};
+
 static const struct dpu_dsc_cfg sdm670_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
@@ -88,8 +136,10 @@ const struct dpu_mdss_cfg dpu_sdm670_cfg = {
 	.ctl = sdm845_ctl,
 	.sspp_count = ARRAY_SIZE(sdm670_sspp),
 	.sspp = sdm670_sspp,
-	.mixer_count = ARRAY_SIZE(sdm845_lm),
-	.mixer = sdm845_lm,
+	.mixer_count = ARRAY_SIZE(sdm670_lm),
+	.mixer = sdm670_lm,
+	.dspp_count = ARRAY_SIZE(sdm670_dspp),
+	.dspp = sdm670_dspp,
 	.pingpong_count = ARRAY_SIZE(sdm845_pp),
 	.pingpong = sdm845_pp,
 	.dsc_count = ARRAY_SIZE(sdm670_dsc),

-- 
2.39.5


