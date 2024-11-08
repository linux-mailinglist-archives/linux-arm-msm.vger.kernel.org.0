Return-Path: <linux-arm-msm+bounces-37296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE9B9C1300
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 01:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E2151F23192
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 00:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CB51BD9E7;
	Fri,  8 Nov 2024 00:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JJ9G7SV9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093232C9D
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 00:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731025305; cv=none; b=gkmsEMze81EL6VM5+TAmOv+cWA1gHEjuiYt7J18Am12icqw4e69/m7KBSk4vtdd8IHs5yoRCr4u1H93jnojxxjmfZjbqEKB/qjXHHYydncdZAg0k56ZtVpeVaSIIf15uBNG4WU9qHTfhYD7dHwy1oSbZj6yhKwCUvXccoyMLNwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731025305; c=relaxed/simple;
	bh=abn+V/VW2R04+ivG5L+16aCpi+lS1tSzUvuSfrCga00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6z96WShU9Xm6jRsw2ku9Sw3Q+xIdAifytYcIGKneTj6eQj5kq3zndHFZkoblPLK5GNQFj7BVE3h9gfDi7RVDusEAQD/PZqOLCerRImelMxk3pQ3vWCUuYsXeU7tcvA9JA+YyVxLnt6J06VcJj1fQu5nbUl79YN7dZi1GMZcD1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JJ9G7SV9; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f58c68c5so2599858e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 16:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731025302; x=1731630102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xY822JqISKSBvZvj0s20BCeD1NcNyIjNyABXPzWHxOc=;
        b=JJ9G7SV990NJxjx0lxK6m2Lacoau/XDcAeTDN/WvO2o8ysJwv22aGkUOcsJ4a0tjl5
         uzV3Mc+9qcS22a3iFMxYQSZRynPs9XuEqP3gpx1ElHjygVpVsijKA3d3g1/3RCEwvnpk
         XYYWCah7H4NEspXG+2XDy0yIZ5lS7WSwa0FydPnbVyS5RxPJTb9ma/Yfprdizc2bGm7y
         0TfDYnTFQ7KF6KdxIKM+tP7BStRbOa+6VOFOQEUgAmAh0AJTbPySUizz/CnNsdBwNhwT
         LyYcscVKT+0V7xENC21r5oYnmSgyQquaCWTM2ct7CNQZnDx/PXP5lFHE7oeWn7QknP6K
         ONfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731025302; x=1731630102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xY822JqISKSBvZvj0s20BCeD1NcNyIjNyABXPzWHxOc=;
        b=sTpQ/fVgBxWcbiZRsHDh9mZ8L6PSsw3fsdxs9Nyc++pZb9jLkGEYqx6IEcW7lwEKh6
         OItRYSZIC1dt56FTjHPLckRXoVZPm6Oxb4WSFc8ctSOqp1xXQiNiTPpxIOHCgjFl0Acz
         INRz2u50RXsDP6Aea4HC/bbfho8kEfFccgWvWPzItolwFxxVkvZ4sZe2BGjAVcaoJyqF
         FR281P71oF3ZQvTI9d99qFD5uF6OKCVNemLlBLroKs8r4on8g1ChYomgTmBQITwbuOBK
         ONSjB1v4y1tAtWRANyPqtcz4Oq7rFgfqMI3HF8zz8R+ic3Yx91AV95SnvFn1vkX8E/Eb
         6+oA==
X-Forwarded-Encrypted: i=1; AJvYcCUjuOU5DsuBdXz7ly5urJJ5yJXdq5HOdgb8CP5eb14N9+kSzsk8A2+9nVBKNlkgCvFBMHFD5WtUFzm9SD8T@vger.kernel.org
X-Gm-Message-State: AOJu0YwO6h6yIAggWDz8HrYHhpToCSuKHxem8kT0FywMbkX8dvqqtC/D
	bCPdkzKKXpszPmA19gpcxetGB87NPeWHhjmWq5es9XJcr6cHaCInNqMWvjvcOVU=
X-Google-Smtp-Source: AGHT+IEq6ivfN+wJwzSVr2+2EsfSbjnKIpmoB5DdUoek2Tpc2v2YqRfcEYVZeYyjXtOgbLpQYY7sVQ==
X-Received: by 2002:a2e:a803:0:b0:2f7:6653:8053 with SMTP id 38308e7fff4ca-2ff201c7cc0mr7133511fa.18.1731025302111;
        Thu, 07 Nov 2024 16:21:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17900a63sm4195191fa.47.2024.11.07.16.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 16:21:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Nov 2024 02:21:32 +0200
Subject: [PATCH 01/14] drm/msm/dp: fix msm_dp_utils_pack_sdp_header
 interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-fd-dp-audio-fixup-v1-1-40c8eeb60cf5@linaro.org>
References: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
In-Reply-To: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2535;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=abn+V/VW2R04+ivG5L+16aCpi+lS1tSzUvuSfrCga00=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnLVmOlTL82Q+yU+jTYQJ2nDrxLnq8YKm4nBQrW
 XWQ3vKXdO6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy1ZjgAKCRCLPIo+Aiko
 1aVAB/wMp1GUIzKR0e0Z7EmL6OhYO8pzNKgXmJzLpBJHGsb3lAkcVB8stTyd7yx4NyeObcSp0dN
 FEXTHPvI4cEqqpzxMjTMzvERHuhHalCM/N4bmNMEg9aBigDEDFFeyVoIOgrOVrYPe1PsFL6ibG7
 BxcCRw1Xe4T0Dzdcj5708UB0Ejd54RFOjX7lfeC+JAryOMN05sG3b+S2NJsOHi4fq/Dhk6HGu5T
 wLyg+ob9chEYbWjZvDgaixAMyFsah9l5WnBj4IFCcWOlbJ1H9d3cTnpnv+W7PG7VxzJFk3b+kNn
 tUJRuMx5kL6Wa/PvEsa2clV8XVeqacZ/osSRe8CjnyW1wkLD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The msm_dp_utils_pack_sdp_header() accepts an unlimited-size u32 pointer
for the header output, while it expects a two-element array. It performs
a sizeof check which is always true on 64-bit platforms (since
sizeof(u32*) is 8) and is always falce on 32-bit platforms. It returns
an error code which nobody actually checks.

Fix the function interface to accept u32[2] and return void, skipping
all the checks.

Fixes: 55fb8ffc1802 ("drm/msm/dp: add VSC SDP support for YUV420 over DP")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_utils.c | 10 +---------
 drivers/gpu/drm/msm/dp/dp_utils.h |  2 +-
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
index 2a40f07fe2d5e20114a7692d1269bb8fd5bddbbd..4a5ebb0c33b85e3d55eb974d74c1f54591301b35 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.c
+++ b/drivers/gpu/drm/msm/dp/dp_utils.c
@@ -74,14 +74,8 @@ u8 msm_dp_utils_calculate_parity(u32 data)
 	return parity_byte;
 }
 
-ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff)
+void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2])
 {
-	size_t length;
-
-	length = sizeof(header_buff);
-	if (length < DP_SDP_HEADER_SIZE)
-		return -ENOSPC;
-
 	header_buff[0] = FIELD_PREP(HEADER_0_MASK, sdp_header->HB0) |
 		FIELD_PREP(PARITY_0_MASK, msm_dp_utils_calculate_parity(sdp_header->HB0)) |
 		FIELD_PREP(HEADER_1_MASK, sdp_header->HB1) |
@@ -91,6 +85,4 @@ ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *head
 		FIELD_PREP(PARITY_2_MASK, msm_dp_utils_calculate_parity(sdp_header->HB2)) |
 		FIELD_PREP(HEADER_3_MASK, sdp_header->HB3) |
 		FIELD_PREP(PARITY_3_MASK, msm_dp_utils_calculate_parity(sdp_header->HB3));
-
-	return length;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
index 88d53157f5b59e352a29075e4e8deb044a6de3bd..2e4f98a863c4cb971e621ac24b8b58f035236e73 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.h
+++ b/drivers/gpu/drm/msm/dp/dp_utils.h
@@ -31,6 +31,6 @@
 u8 msm_dp_utils_get_g0_value(u8 data);
 u8 msm_dp_utils_get_g1_value(u8 data);
 u8 msm_dp_utils_calculate_parity(u32 data);
-ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff);
+void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2]);
 
 #endif /* _DP_UTILS_H_ */

-- 
2.39.5


