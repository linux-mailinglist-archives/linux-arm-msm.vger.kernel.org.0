Return-Path: <linux-arm-msm+bounces-77832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 183DBBEB6D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 22:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5077D6263CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 20:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEA125484D;
	Fri, 17 Oct 2025 20:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfJzAwrs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3AD248893
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 20:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760731258; cv=none; b=E6+UqVavnUK0g6UYBOlPziC1cRs6oVsiHnh8qn5opFOcPYYOpSVD9rKPXMltwkhFUAF3hIij4KSYJwF2KP7Yv1eCbRgIa6hd/eqEn+GcJN4upUHdu8zpyZstw2Gd9011xLdLXNBsSQmgr1dz1Ay5Qk2JRumBxXiMhPgpeNum4U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760731258; c=relaxed/simple;
	bh=knh/HEr6cHlCZELVAiS5ohJ6Yl7S9RjBxDHyiwEz+aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOFPBru3xxTLRSh1NwOvOxBgCpBsr+R6gDAzsh+0uocUdiN/VF06wI5SUzhVjdCn9cwzpMlVhvJj6EwLKcLc5dO7QXrR8HUF5EbAP/JfbJKhooDsgSaqp6g/zHdVddXvnqk05/iaAhXBOdKT220SB1fD1q+HVuNp+QbPZP5Z/CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfJzAwrs; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3637d6e9923so22490831fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 13:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760731254; x=1761336054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6uQHUW9ChgQjFk3rZ7rRlcJ/k+AJJTDJCwK+JBs0nE=;
        b=JfJzAwrs9Ld0x9V1GMpWf4iWNzb4WEtCUlUuF2V9I/x171shRXRB1ioKB6xUxomY3C
         uwjIWslSaZ9J0OOnOWAaY7d5tMEyZrupGO7VQDQbHitxMUWBAIUU8OCmQA5FjqzJiENE
         r3zqOEgpsfRjphaANU7l/egU4Vb+BNBEBfwOyMGBnCwW2+As74D4bp7NEIy1cs/Pb21r
         t22xNQ3bXQr2BCNFDTlbb0SPEcM0KYZPkNJPkokHzLV5J/wgvSVmF1w+phPyQBTNKMWt
         ImmpMAceWM0BroqMwLU/aSebFkB2KreUHufTqzVoIhh7DOh7OSv5FsIgdACrdcuGyt3g
         UUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760731254; x=1761336054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6uQHUW9ChgQjFk3rZ7rRlcJ/k+AJJTDJCwK+JBs0nE=;
        b=TEHiJBb1wiz3xN3Cvp2s6H8h93DszHFfyHdEy66/G8WD+UY29F75/BYIrscCS9SuYo
         bbCa6nrlSq9zyd+YS+yZy2iLdAQESD35fyV/1zoPakFMFo3eoVqRCq+fColf+0KwmPfi
         MMaf8sQwnD3TVflFVIZEebbJcNM64NYa0bRvDonWW0wc9QUw16NJ6vf7oO1zHCX8kLZG
         XFPQhNppPozXsMGarrenVfE9+KOZINLcTEGTSXWl03kseGpRO/AfTSocRwLTRWrKii0p
         nnDX0MGLg8+zc8wVwEFfR/NBRPVYoX/EAVnwJ5Ao1j4PHUzWMPnvbX9KJOtynRSuGe2y
         tHqg==
X-Gm-Message-State: AOJu0Yx/orNUUmBphqvEwqIsy2CUvr6Cny/5+zOHJQf9LZuypwcuf2rG
	7ltZutSyinQGRVdMg4380t7d+uPDJgoSNWFr4G69BHJKr8/PGcvMUFw7
X-Gm-Gg: ASbGncvS0zpkDUtUSs5B7H6tjbf+i2qxJa0kLmN3jMR/2vX1CK5Oq/Mx65V6lqQmhZE
	9h0T/2Zaw2EP5vxn5KUINfbbDendxPm539y8cR6Z19iUpO5WPBW3MUOAqopgV8mwHc/z7PD0IiC
	W7NQ5UcMI6DRYxDkB2dWSPh+AflyWaLJiA7wm5nQeeitNPrQ+ALc4VcsSqvq05KQzd49cwPNUYb
	h4taPw+JAXsVu2OuI9qnXrja6WP2Y4nU+VGcPUI7UP2ljWt0aFznN6p+r4ucJhxbfkapWGJ3Wz9
	Cf3Uj4zjeLLzN2LqvswlG0HxxT9DXnlnbP3WQucU9D9TH6VPgxpXSWS7dVpQ2IzNPrYqZqvd/3+
	GqYI7veoUmmxFg5xqhmZlsq5I717e2h94nHGg1k7n+bbHjSWeKQUjmEbctZg3xsEV7A/E5YeuEc
	b7Btf3+W/wTNOq3q3GMGg2CNNfldvmKKYVU4QqenAz3gGQ7HAKL1j7NMV5JJY6Sg==
X-Google-Smtp-Source: AGHT+IENQjN/CUYsH9VFFm4pVHWkRuMc9LBZvX1RWDo3Xnsvi+JcACMpM7wNhoU7fWK1Lo5cRQfMcA==
X-Received: by 2002:a05:651c:1586:b0:36b:5945:d3e8 with SMTP id 38308e7fff4ca-3779796dc35mr16004461fa.39.1760731254333;
        Fri, 17 Oct 2025 13:00:54 -0700 (PDT)
Received: from [192.168.1.244] (public-nat-13.vpngate.v4.open.ad.jp. [219.100.37.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921d99bsm1580861fa.22.2025.10.17.13.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:00:54 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Date: Fri, 17 Oct 2025 19:58:38 +0000
Subject: [PATCH 4/6] drm/msm/dpu: Fix pixel extension sub-sampling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-b4-dpu-fixes-v1-4-40ce5993eeb6@gmail.com>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
In-Reply-To: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Vinod Polimera <quic_vpolimer@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2

In _dpu_plane_setup_pixel_ext function instead of dividing just chroma
source resolution once (component 1 and 2), second component is divided
once more because src_w and src_h variable is reused between iterations.
Third component receives wrong source resolution too (from component 2).
To fix this introduce temporary variables for each iteration.

Fixes: dabfdd89eaa9 ("drm/msm/disp/dpu1: add inline rotation support for sc7280")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6effe0fa4837284a1f038e4907c4c91d239aeb8b..905524ceeb1f192c093f1be7f571b29eb4b53379 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -500,13 +500,15 @@ static void _dpu_plane_setup_pixel_ext(struct dpu_hw_scaler3_cfg *scale_cfg,
 	int i;
 
 	for (i = 0; i < DPU_MAX_PLANES; i++) {
+		uint32_t w = src_w, h = src_h;
+
 		if (i == DPU_SSPP_COMP_1_2 || i == DPU_SSPP_COMP_2) {
-			src_w /= chroma_subsmpl_h;
-			src_h /= chroma_subsmpl_v;
+			w /= chroma_subsmpl_h;
+			h /= chroma_subsmpl_v;
 		}
 
-		pixel_ext->num_ext_pxls_top[i] = src_h;
-		pixel_ext->num_ext_pxls_left[i] = src_w;
+		pixel_ext->num_ext_pxls_top[i] = h;
+		pixel_ext->num_ext_pxls_left[i] = w;
 	}
 }
 

-- 
2.51.0


