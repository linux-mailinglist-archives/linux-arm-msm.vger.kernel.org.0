Return-Path: <linux-arm-msm+bounces-33182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E73991779
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 16:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46D8B1C215CC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 14:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF39E156968;
	Sat,  5 Oct 2024 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="AVCvAsme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3785E156676
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Oct 2024 14:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728139391; cv=none; b=C2fSIRx5jTbqhSUQJKeAFXhRSEWb1DmKyLLXMVyrrYs5ZvqYWgZat71JsVrnUbkBK3PhkO4kZe1VzB/BQD0MrTTvQ8H3PYd/oaaDPkCXaRdNJ/0wxWNUSTTvr0QCxHJGzB1Olho17d7doIQrmvJIF0mRxjlabQYOtQVqJGgdkY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728139391; c=relaxed/simple;
	bh=hL5LUAnF+UDbXaHFZ+fEtbiYCqaMDSrlvbOvYIhjGr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W23zJZs9aUtS36S++1RvnnEU+YpwXpAy40zmUJXT0IRSGe9rkUudMYv4vpVKarpFYifLA4XVMb5ih3dGUFSFQ6ieopAl8MeqYYsaYOBYHO+vFUY/EgM23+oxzlFu54BWGCz6KJgt/yG8ffdvQjV1G/IiPgUDtLb37q8pcqwGeC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=AVCvAsme; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4581e0ed0f2so33691651cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Oct 2024 07:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728139389; x=1728744189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/q3v6t9jn9wO97ckfMU06Nl7EyqPnybN5v1LXUZU22Y=;
        b=AVCvAsme6XL+0glebVeWx4C7uB4SEK5XTEr82qNNJEeAkEv7WTtgehdAPVfOJjhtPH
         sLPad5AJR2Vh4ZahifHQczaXiYsRAyfeeHlqCsqmmQBYgJoJXNJhZo+SFaQdLf74Eu9t
         zwPx00nSssFLmCnu/hsOiJWsCdkmmGnJiYXCbVr9mjXOgcaa+GJ2WzttFYW7cPxqhHCD
         KIJJgGn5UpWurWnnLwY/ssL82HY8JFYnYArPIo34kACb6ymvWZC29lxI+xe35mCsSqXP
         qE6+Cm1g5VEO0bN7R+LeKSsk2lHwMlT8mpxQYltsyESquau/oKwagwTXiSKaZMR1P/RO
         2kSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728139389; x=1728744189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/q3v6t9jn9wO97ckfMU06Nl7EyqPnybN5v1LXUZU22Y=;
        b=XKPIMKX9WzW19EV6StcguE0vEAhXhrKHIYbj2Z1m4SdunYL/vpHDMNciUdaiPlySUU
         Eexx52nS1Oi3jR2ehsXroPHmgw5pvm/mhWBzD15KR9smi/nOQiHxNbugIihf0IxAmi8r
         uKrbRrMBGnR/mlt5iUdi3cELetPo0io51FDFgclklou9E8kN2/258smIe7zyqQHWnya+
         Wv0IH9XcSNIHNHX5NQLnn2yZxi58NjHqYoJdu/W+bXyhswY/opf+nKitH/a5uNZ2oa2a
         /B0Jf/5t5616Hw+/GzBqF+STcEACmUnLhybhaa+5INrYi9kfyFLN1z3H6lluGLPE07LJ
         Hnmg==
X-Forwarded-Encrypted: i=1; AJvYcCXwVzHTfsslTWxCmncQcR78SkGDGbgEaoApNhYjd4anP9jHiW/geHK5SrqXlMhd5Macct52NX8cBN0jYVLU@vger.kernel.org
X-Gm-Message-State: AOJu0YwEY8d7L54DKSWmHW5QqjuE/Z/8Uqxth59Th+eeDnKzglLWxrUl
	ty3DPn2dRYV7b6MDcFykt4v8/H0OyXeNemn2whwj78GOLCAyNbX0r7yYqdI/eBM=
X-Google-Smtp-Source: AGHT+IEWb5+x3Y3IeQmM4IyDOj16+X6mmg0F0tQXBBJrX9v3mbYYdikTmesnSGEJYTvU+WKfBsip3g==
X-Received: by 2002:a05:622a:142:b0:459:a824:a1c2 with SMTP id d75a77b69052e-45d9badbcdfmr100318231cf.22.1728139389155;
        Sat, 05 Oct 2024 07:43:09 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da74e9fdasm9072351cf.31.2024.10.05.07.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 07:43:08 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display hardware),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display hardware),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm/dsi: fix 32-bit signed integer extension in pclk_rate calculation
Date: Sat,  5 Oct 2024 10:38:10 -0400
Message-ID: <20241005143818.2036-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241005143818.2036-1-jonathan@marek.ca>
References: <20241005143818.2036-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When (mode->clock * 1000) is larger than (1<<31), int to unsigned long
conversion will sign extend the int to 64 bits and the pclk_rate value
will be incorrect.

Fix this by making the result of the multiplication unsigned.

Note that above (1<<32) would still be broken and require more changes, but
its unlikely anyone will need that anytime soon.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 1205aa398e445..a98d24b7cb00b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -550,7 +550,7 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
 {
 	unsigned long pclk_rate;
 
-	pclk_rate = mode->clock * 1000;
+	pclk_rate = mode->clock * 1000u;
 
 	if (dsc)
 		pclk_rate = dsi_adjust_pclk_for_compression(mode, dsc);
-- 
2.45.1


