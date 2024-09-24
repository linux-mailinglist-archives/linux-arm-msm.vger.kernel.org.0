Return-Path: <linux-arm-msm+bounces-32277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D123B9844B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 13:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 518001F25E94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10EB1A4F34;
	Tue, 24 Sep 2024 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOuUE+m9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4C213A896;
	Tue, 24 Sep 2024 11:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727177444; cv=none; b=YzZRCkfvBateV3hH8PsyVH5oVycxcC6PXc3vARwlwxCkR8rjNmjaMUAlzU1i5lh6QOfYoj7nboiDsjmI6ZmbtzmT27T8btKZE96FyTrCPwssSyyvElcufIojOKqZ8NCdKuZJgdheoCENnMAXNzJkbEyU7z+rhwNgFkH8HHxx80U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727177444; c=relaxed/simple;
	bh=8ChbnJhsvl1xm2NLNpkzia7Mqz9GSrQ1hXSsZqycXm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=szCa+DcdcMk9s9//X0AztBQDfFTrULiuCIt7M8hEJH16NJ0fVHcg9esRRxjD8rb8jma5vrUQ0gP404WKkmnKvhfQ88oj2zjRobqRCkuUWv5bY5fY1h6tV7+E9+Xneta5W1qnrfRtj6cOnenO6eF4pVPhVk+f+LfLDsyV0jxt+r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOuUE+m9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a83562f9be9so637341966b.0;
        Tue, 24 Sep 2024 04:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727177441; x=1727782241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhEk8RuEr+Jxg4Bk7Vc0/8COm679tekr0FDZbumhOZg=;
        b=jOuUE+m9Ze/e7J+WBSxna65MlxQz6D4eon1skg5ZX62C6ApEHZlyYn//qAFCdTa+PX
         Nmfu1S2OmppzA80CfOI9YVT1t4op+ZiF0vnEimtPvIYS/JZ+E839xkSv2goCbd6CGwAy
         dMuvpeVqyDlqi/YfgRyfW7vbrVquqG0zv+YMVZ92Sll8QAVJUhqGf56jcOPSXCf8/eJ9
         TXCfl31yt3MgrKFwkYtExMlqg52QZYJDBICZjQVhAX5i4U+2QMUw2kKDzb1UO4KQTekw
         E5mt2CNz4OKQXTigWPlCR9oFESwOhNcIUc88C0XblYnCMh6k2tej8F/i+MtmI+tRTk5g
         kN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727177441; x=1727782241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhEk8RuEr+Jxg4Bk7Vc0/8COm679tekr0FDZbumhOZg=;
        b=FZ0lQCUn+FkwNNfWHzvNbE6WGdlZktyG/Cbq/qGJTsnTSPYGUx5wbqwp/kK5IJm+qS
         zSjc7VCnQ1WTUFJDANJMESrXazTzLKgzzkBXuoGQGOa/eYyxfIuPXXk3zww7SRgHH6id
         m69DFwTtcrVDBr85UTqYCFQUP9H5Nv4p18qdH8UVD2kpXTZSlCZeNvYh16Mg30dhVus+
         J7S9gy1JZzNpe16B6jIEiAEWdpFnRk2vkfoALoFLfVwhG38Mk7YpunNtcctMUyDc1/u4
         y6LCF/ydi3rjAAVN5FDtLscGqp0N7oXe7JqL+cn12BONOmaLepfK4F75wbzngTriVgqy
         tFkg==
X-Forwarded-Encrypted: i=1; AJvYcCUP3oITWugxQjmGvjO/FVRCC4op5lCYcqJZMW/gn3aEV7DZ7dVFg9KRuOfhdXrL9UNeJAAl/J+KIWA=@vger.kernel.org, AJvYcCVh7dbqA1cmUro60U9MVUaM64HYRC1LA2rO2fbkupNWD4EUpWQAv1Oo0eT52e+P4P6jKSDRtz96Ztxn5hQq@vger.kernel.org
X-Gm-Message-State: AOJu0YxglZ7PVmR03LJWm0Tkob64ORePm7A0z1UmnCk6iYsD9V3Qm71/
	v++vyGwoo3uaHVPaUtS/tB7K9He061QnYASzyjIb0re/Shii0QLC4AjQ/5aR
X-Google-Smtp-Source: AGHT+IEB47FudAX7JCNJngwPYk4kmzjf2LR7tylu430I9j9S0enEL/QK/s1vCTKjnY4Em8rQP0cTcw==
X-Received: by 2002:a17:907:d2c9:b0:a8a:7e24:3230 with SMTP id a640c23a62f3a-a90d5003939mr1192917466b.28.1727177440995;
        Tue, 24 Sep 2024 04:30:40 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it. [87.7.171.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:30:40 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:36 +0200
Subject: [PATCH v5 01/11] drm/msm: Fix bv_fence being used as bv_rptr
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-1-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=1818;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=8ChbnJhsvl1xm2NLNpkzia7Mqz9GSrQ1hXSsZqycXm8=;
 b=NWgR5bqLwe6ltaDjj1StTWNAv71dJDpvuM6gIiNO6ioLjdgdOVLhG9ge0SJ0flA/Y3Yfqq8G/
 YtoL+8e4er3CEWz5Eq2WZZw8Xy2J83SjWCYle5m3jtY9U9sQffjXlNu
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

The bv_fence field of rbmemptrs was being used incorrectly as the BV
rptr shadow pointer in some places.

Add a bv_rptr field and change the code to use that instead.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bcaec86ac67a5c90544922372cd46fbdd8cf359e..32a4faa93d7f072ea6b8d949f4dc9d2a58cec6b9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1132,7 +1132,7 @@ static int hw_init(struct msm_gpu *gpu)
 	/* ..which means "always" on A7xx, also for BV shadow */
 	if (adreno_is_a7xx(adreno_gpu)) {
 		gpu_write64(gpu, REG_A7XX_CP_BV_RB_RPTR_ADDR,
-			    rbmemptr(gpu->rb[0], bv_fence));
+			    rbmemptr(gpu->rb[0], bv_rptr));
 	}
 
 	/* Always come up on rb 0 */
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 0d6beb8cd39a7b297e73741d2018915246a710d4..40791b2ade46ef0e16e2a4088291a575d3be9e82 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -31,6 +31,7 @@ struct msm_rbmemptrs {
 	volatile uint32_t rptr;
 	volatile uint32_t fence;
 	/* Introduced on A7xx */
+	volatile uint32_t bv_rptr;
 	volatile uint32_t bv_fence;
 
 	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];

-- 
2.46.1


