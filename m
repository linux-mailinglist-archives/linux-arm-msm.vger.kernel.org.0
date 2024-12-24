Return-Path: <linux-arm-msm+bounces-43180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F929FB945
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 05:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 377E61885543
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 04:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5A917E01B;
	Tue, 24 Dec 2024 04:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V4l5xEQR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4651714CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 04:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735014333; cv=none; b=feYL6yU1tUCHr1F35LCBqIniaaK3+a4V40O9pSX8YuGN98JI98RNqtqgHiOPPn9E7nsgZbXHCdDsgpqXKEjXsml7tzMsshUmXv0plyzPSzFU/pp8jkPWnUWplrrVehlIP/7ecPlZLTbADnGkIyckTaYjJQec/dsq55/guRi6j74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735014333; c=relaxed/simple;
	bh=KMSI0SnihNz+eKL8svNhjt09BuUQq15nueRJ7bxyzZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSdu511YPrcnHZeeiAAJ0jHpKkbryn8CENuvNyX2tQD+marsobOyQUjqcda/P1XycnGN01YUR40bTho5KkbDn4A8Qzr7R/1/4DCwXZDGXS6pgeNMl1NVXWG/NrWYfFGWWdrGqXDyH4T5DWyCblQluvCStksbT2Vo1TDomHPqGu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V4l5xEQR; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30167f4c1deso45161431fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 20:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735014330; x=1735619130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIe3XSZSGvLB3f3/ujUeMlqecW7y1Be2ynN7tMKIjvQ=;
        b=V4l5xEQRvpiUODW6oPBnNW3vDwLKacGyfAM4t0XpclMbmtJ9tpO5VevzAIt/2Sn96l
         DjMWTAJ9bt6+K8CnB+x/w4WR+jlVp6ZRZGI1nKJjjPgkoPkoxTh4cLcSnL/IEHjl87VN
         t+wsJeJBgBv3wXYj8/kx3pHnwhJmcCHoZIHqLIAdl0ytl94h83/VnBsmIdjkOmwY2uSt
         G3ZJPY7x3U8146aBB7gH4UqKvuyPdlHsupK8hWcs/dCsb2t80XaS+dNCNlYRhNi3Vumw
         3ROFKTL+JGMnhzACImYseWbzmAHEG0B5aE2pp32ddCTJM8ZwTLVe9mPO6FhdmLgnAR5k
         7m9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735014330; x=1735619130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIe3XSZSGvLB3f3/ujUeMlqecW7y1Be2ynN7tMKIjvQ=;
        b=pqz5WvakYZCnwsziUHbpHwArCHAZe7I7i83xVlvGj1IXqIqZ6tyxuKj4fNW0MVo/g1
         XLBT1gdsyiMdIG/YabXR+tliAg+fuNvp8tvCOzeSzpdKSmmRGufH0fQDQrXwDTrU5QUX
         CnbbJQd+cHgruSgjAdjK4Gg8U6xUdHk/0sS9gQW78qkJlIq9lkBYouT5uoy21r4VqKka
         pACvK0wC9QNDYjfqyowX2sPi6MLGBKo+/lAsXSWlQQ27hXKQXBs0l5m4NC8yqSIgNcgh
         OWQhSbDJifojYixlG6/WmM4QRYUxcE5EV2Vi4UFWBn+7JRtZdTOyRNagG8Ou65FGTEJM
         ZIvg==
X-Gm-Message-State: AOJu0YwpSQ/+6YThMBRjliYyQF9NrK7nih8MB6xCXNcEXMkiryMj8EyU
	j0Imq3i5zxIDDH0sE/519dl6HFLIshOsPpgjMr+i3/EEEqeg4FtsOpWrizz3tNQ=
X-Gm-Gg: ASbGncscEKZK8PnZOwx8JhGWVORr3c4Uevdtf+rrTxKZTtefWzoVyCoR7oEmE/mGzKl
	gynHMb+O+cgT3rDfCIt7rLFNV2OY7NH7A9w85lkNSC04jF0jCh7yOwImKr15o/dpICSGC5q2hET
	ZxJLOFjYEKS4fdwV8khMj6BuZwD2cjLwMvg073mritGctIdtJioVsRleq3btExJSQwJiyqsjjQo
	sx8KANd9Z/CEW8r/FDdxCtkRjzjKeRFwp7TsvBYhfpMKibY8J70i/2yUFWkMzra
X-Google-Smtp-Source: AGHT+IEANYIDE0X04HPrjL1+BJxMZYcU3mesc3+IHhUPhdevtrVztipsqZxOVEXvb80N+0BF64sVBA==
X-Received: by 2002:a05:6512:1254:b0:540:1e7e:ca80 with SMTP id 2adb3069b0e04-5422953fe81mr4835327e87.30.1735014329647;
        Mon, 23 Dec 2024 20:25:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542248cc8e3sm1467277e87.103.2024.12.23.20.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 20:25:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 06:25:20 +0200
Subject: [PATCH 4/4] drm/msm/dpu: enable CDM_0 for X Elite platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-dpu-add-cdm-v1-4-7aabfcb58246@linaro.org>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
In-Reply-To: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KMSI0SnihNz+eKL8svNhjt09BuUQq15nueRJ7bxyzZI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnajeuAZgwTwxlpoXDIuUeCt0MYa/XwinZFH7Is
 V1HGOb4/tSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2o3rgAKCRCLPIo+Aiko
 1TQTB/0bM54Hkjy2bhX0sAcbFXZBcXjKgYPmclx0ToTMTOmZOCVUQu+HKRfrxZlGs+Wgin2CssV
 OeOzklzqRbDLuhMzuAWOa51oIS/qZmNu2C5vQKo1LpEKcjSy/6ooJ/HFYVTTvyktbOCv7rNYmAG
 HXDCJOXPw/Y9d8Y8wM2anbaJykX0OUBt/j78PUVR8fAl/LxURxOzEPqfrD3RzHgANycgVmN+vFn
 HP5KBfhFEnge8uBJnyYo34lwdkAjhWw9jIxqRCi1pODx5yEj2MuDJVGx+qNlIahAaRKYTV3s0Kw
 HEhtbtwAuYXwQ63wuCZZv/SK/jibpysJvmGUXx08XEllQsI5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable CDM on the X Elite platform, allowing RGB to YUV conversion for
the output.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index d61895bb396fb4287e9b41807a3bb0cdb25d4e25..e68f5e21f3bc7fb9e07f46d6b4e68eb03a825683 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -451,6 +451,7 @@ const struct dpu_mdss_cfg dpu_x1e80100_cfg = {
 	.mdss_ver = &x1e80100_mdss_ver,
 	.caps = &x1e80100_dpu_caps,
 	.mdp = &x1e80100_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(x1e80100_ctl),
 	.ctl = x1e80100_ctl,
 	.sspp_count = ARRAY_SIZE(x1e80100_sspp),

-- 
2.39.5


