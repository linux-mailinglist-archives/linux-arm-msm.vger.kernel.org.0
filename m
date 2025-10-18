Return-Path: <linux-arm-msm+bounces-77872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C56EBED2A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 17:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27DBE19A6ED1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 15:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73C92036E9;
	Sat, 18 Oct 2025 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qz2XzfAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0425C18DB35
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760801606; cv=none; b=KeTBkQ8tpeBykW0T9Lx8D+2QhS1UJaQbmlLzhS4Uex/dNu5A4PEm3tgj4vJuQf8BRNuaHsStK5wmuXwILyYitHk3/Uer+xmRj9fMkBJzYb4gm9teXDwMAOKb/wYkXdHrmBAQcl7+TS5pJBAU/CZIQqBhmHE3tJted3panX5P6hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760801606; c=relaxed/simple;
	bh=Qc5FDyxe5YWtLm0XuQFXvXeE2CU4zdKg88u3qvubN2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7U2jK9K2tyCIixpRbgtEZIFAdS6U/IXJQbG6kaBRtGiHdUW3L2Nr9Xq6RctAb93ZDSj+gDzZLB4CMx4HPL88fKuByEMoYtn9Gp5Kpf3vlTJjZLvrWcqbqZTpcVRcF1pnpD9G8S3sBHWYE7Af3mNa5Gm4iRNxytogMnmZ2x5YSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qz2XzfAx; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-58affa66f2bso3583246e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760801603; x=1761406403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JI8wqflBoJeSVeIoguEa5qYxvXUp8LZtN2UpxTSv8wU=;
        b=Qz2XzfAxHxhw/R0P99YCKttOMDBl4ikZHNa+7AUDea64Y2/0DjgCp3UG4avEurdW68
         DjX4aBuM0HkYO/fW+3ITsZ2gLfoApRLoj32FO255H9J+rgdLb/6rl+vF0aAy2qd/VtOj
         HXh+xjADbCDf+WLkQaZIiiElRLTmD4aeG+Az+KJzwrA0PyAuulxlZuZ/q5dln6Ea8L9Y
         jv/xo+8z2r3ztbRQAmoXxqvhwnG+z7q6yoDN5EsT/buxvNLjJpGlPHl1gsdeocfkQA/u
         6K3YKa9gTA4o1kI90yBAusyCBbmtgPOnKck7h5j47Fi46sz71bguYzpw3Qj0ulfUa4Bx
         LKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760801603; x=1761406403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JI8wqflBoJeSVeIoguEa5qYxvXUp8LZtN2UpxTSv8wU=;
        b=rRpEH11GL/0LVBxC9OL2jhrNWbX+he75wlyIJogmwspsOhqPuavbwq9dZ4XI2Wiypw
         ZieTCu6iHClSff30bIm6HFIbhqevMPIhT4N/KWsTYg3EsMpn7L+sUJablQbHh5VqmvEe
         o5v/ARxnrItmmNDldrF+eKnR3QREFvXNPYULWjcmN1askknM/Ahbt9/ixv3ezO36LG68
         EZTlgHubE3KV4vPeo5VB8RLok4nbWFOas2K2nsdROTx+hML+zmdD/sI43Isq3HM64kQ+
         E54oRc8dwf0Zox3XJfUkdJAbg3r+Jm8PsCFeTocYbpFWPlYJK7nJXwC99GzqzMNZU7Su
         HlKw==
X-Gm-Message-State: AOJu0YyTakuX9e17JLkkvV0mcfa7K/STKSQQlN/axMHFbysOMVUe+tRY
	yH/eAyAW10WmMwZzPM8pSg01aB0j2oxfJ5CeKlGkMskPphVICzKtXT53
X-Gm-Gg: ASbGncsQMnjFvi3HrKg1A8prd9WOdFHjnPAds5JAoNdSxS7577JImFklR05DM6WqgWt
	67DT0RK9JUOPDhyuqX6DLG3DGjN4rsq9Gjp6ThMLXQUE+Zr2QBS4/eyfvXMexZ6BuAMT73taauT
	AO27Bww9cr/NUOV3TXPkPYTozALmr/V3JP6x6RLg4ahJhCUM8PYfxCka9LbGfvlDjGNALoiKoHD
	yIlWxJZWchXy6mdJxl7MhDQlJUJ+A/M03IXrWcrw6Z1nasYSULYkEByyTOirn1k5bG1Y5rjyWq8
	eVJdKX2sVRMDJikuz/B3M9J004k3TRlkt34F+sLpD8VU6ayQk5NaRQwx9I4NrU2DMphjY2Xiq7m
	ghU9AQI2BHECU0evscScsx1YYyiYTvDPe2POuacV6CDGblhzKbRTS9R5t2LnpSl+eVrQQNNMp59
	O40Qmo9f9gbUUAx/VYp9vfCbm18F9QYOQsxp3yso3n8eUApHtZVsQaEGMoRogCoatW
X-Google-Smtp-Source: AGHT+IHNJGLhJHT1HKOGPxf4DSdDJIV4Mlmc7c1/MsjKbF5l/T+nMmFrzXfeEG2XR7zYb9PwANEW8w==
X-Received: by 2002:a05:6512:1154:b0:591:c379:69d0 with SMTP id 2adb3069b0e04-591d850d2e6mr2429125e87.5.1760801602965;
        Sat, 18 Oct 2025 08:33:22 -0700 (PDT)
Received: from localhost (public-nat-13.vpngate.v4.open.ad.jp. [219.100.37.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def272d0sm836014e87.108.2025.10.18.08.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 08:33:22 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Date: Sat, 18 Oct 2025 14:33:43 +0000
Subject: [PATCH 6/6] drm/msm/dpu: Disable broken YUV on QSEED2 hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
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

YUV formats on this hardware needs scaling for chroma planes. However it
is not implemented for QSEED2 which breaks display pipeline if YUV format
is used (causing partial and corrupted output with PPDONE timeouts).
This patch temporarily disables YUV by switching affected sub-block to
RGB only format list.

Fixes: daf9a92daeb8 ("drm/msm/dpu: Add support for MSM8996")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6641455c4ec6a2d082644f1488ea5f5605ccc208..9f8d1bba9139a7e09ee321cf1b6f30f96890918f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -267,8 +267,8 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x200, .len = 0xa0,}, \
 	.csc_blk = {.name = "csc", \
 		.base = 0x320, .len = 0x100,}, \
-	.format_list = plane_formats_yuv, \
-	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
+	.format_list = plane_formats, \
+	.num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = NULL, \
 	}
 

-- 
2.51.0


