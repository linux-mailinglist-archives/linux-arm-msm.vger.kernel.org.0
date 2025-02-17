Return-Path: <linux-arm-msm+bounces-48150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2752BA37C59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 08:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C73A5188774A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 07:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7192F1AAE08;
	Mon, 17 Feb 2025 07:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9KU0cwi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76FF1AA795
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 07:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739777540; cv=none; b=t4hDnewP8jOzsisKik+V/DK9v6JQzxkiVuwla9t2o1NFrrTg1ZGfXHEq5C+sgNSYaeet3DxbPfZbLBut7aP1ZS6PB+bGmubFL0wQdAnoHfDjxRAxF6+9dywlfcxlyclKNSwLSy518HeAH0TSlVc7AJN8wfncPgtULGB9AlhEHO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739777540; c=relaxed/simple;
	bh=D1P6HRkRSuWuGIyFa3FIxyItrNqE/YBTIxKXZkYDpZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WYaFC2gRJHaupIqoDIT1gL9Bc8PofG+bTy3FXbfDpV22gYOa+3DC3HHGhF1lKlddvcgPeZbx+jONNWI8K3rIWneirN1WKSV+Pc2Xwjg1vn7bqYyZYQTNDs0gVJt8Zo1fzrN7KCOmXxEqlGMSqIFNIDqIdbUVLbxbY07H7QvbhDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9KU0cwi; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abb90f68f8cso174397666b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Feb 2025 23:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739777535; x=1740382335; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hO2J1j2m5X6qQF5wOtrAqeimkscPDnsoO2uRIRbK0t0=;
        b=m9KU0cwiicIeYiizaiCHFyu2MmbjQPk2nn5VQp0Mdq20mf2kJ+F+9Lfe2cKph/Vo+R
         z33sb3x3NZVYSPD0d3Ab85S/88jJn1P+rHuRSSe+u2RO3sQ0//PPS3N/hu/9SajP6+6g
         MRrwf66gM31TmiU5RWwv7Z1GAU08Xjc4yXIwQtnYBO5IiCy3XDBlQbvR17I1UQL1ZHKn
         H/K24yVfO+v2RdkdcKC3MUJKfvbslQhc2pjwT6p0g1Itj9VVv2PLx9RRzc3PeMYa9E9+
         5fnGcrGldDNKaZbJfgmFrLP2ENhoxluMuHwk00katDPwEqUKZMlEMvQd706geiJZsNLB
         y1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777535; x=1740382335;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hO2J1j2m5X6qQF5wOtrAqeimkscPDnsoO2uRIRbK0t0=;
        b=LT3J+kzcccd3n/SBfyGrpnQmGC30VYdfF2OmOnzQGPpeteeLi53zTmbgVcc9pzQswp
         VBa8etNV7wSi4R97pJ4OUgZmdmrvsG0nziN/UpJx8x39kJUltMa75rMoyo2ZDo2uUfPl
         k2F8AxEe0DoDfDz7ULPGM5pewp01MVumljC/LhgQLCcZweP6tiO+ROw+IeYtgE/Qz1Vb
         0YSD5ys3NGi9s2Pr/Yck4Y7UYoPq4IKqsnC+mLvXfd78E3Bf0I7sNmN9N7Wr1nugJSyA
         KtqGg1Xu3xBhcubc2C6CRDdHiTe6s0+q9RIGojzCGIAZvtirC/ICBcunkM+RJBM4BvPg
         buFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrPBBXz25eBeJ+jWPf6eglsAH9N8X5FYr9y2KjFkbkBgLk9jrtLEhOFh4BZLnbEvdOtF3pxgncmBKUF0TU@vger.kernel.org
X-Gm-Message-State: AOJu0YxuXHpee9VLHFEoU5H7RoWbwKnLpGGJATncI0cOfcsswpn6+rH1
	nXNARTuC5jiF1A6bjHlm1O+xr04L2rLGo3ib+7JobonvZJPssC5QdeO5LKkuh4E=
X-Gm-Gg: ASbGnct2uK1kL4Lyr2fVs7EBDh58YD5xIkAx3djtSb28y8tH9adstxUDWFzfv4aQtxu
	Rujm24I+Y6iLRQQhDk543w5rsfdt7R1zs2sRkvVR0eNajM24C1nXU9IStn5OdESuw+TK/BQ2JzV
	wEwyEt2W/FJgM3x3Z1qV7e+yITfTjBo3J7EFjP/BHGaKZjjQ1KU2HbgDXXMnUIgH/Efo5O0phG/
	7Z/aZxuFYGNWL12Eb/ajU8Bat5KTfXj8ceX872ULx5nnqhNZ7PfIGFZTfcOvUBTzMdFHouxGX4R
	alZ6zRm3Js40+7PNw6Ua
X-Google-Smtp-Source: AGHT+IEXChx9P0XiKZoNkZiSog2lL7kqWeWWaA+fbxmQW7+pyPDaxfCj2UqyTeAJOchNetAsSy3KVQ==
X-Received: by 2002:a17:907:c1f:b0:ab6:8bc1:9b5a with SMTP id a640c23a62f3a-abb70da2ad5mr751573366b.41.1739777534951;
        Sun, 16 Feb 2025 23:32:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aba910e8b11sm556516266b.21.2025.02.16.23.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:32:14 -0800 (PST)
Date: Mon, 17 Feb 2025 10:32:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/gem: Fix error code msm_parse_deps()
Message-ID: <75a78610-281b-458e-b703-57c7e7de573c@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The SUBMIT_ERROR() macro turns the error code negative.  This extra '-'
operation turns it back to positive EINVAL again.  The error code is
passed to ERR_PTR() and since positive values are not an IS_ERR() it
eventually will lead to an oops.  Delete the '-'.

Fixes: 866e43b945bf ("drm/msm: UAPI error reporting")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index dee470403036..3e9aa2cc38ef 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -509,7 +509,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 		}
 
 		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
-			ret = -SUBMIT_ERROR(EINVAL, submit, "invalid syncobj flags: %x", syncobj_desc.flags);
+			ret = SUBMIT_ERROR(EINVAL, submit, "invalid syncobj flags: %x", syncobj_desc.flags);
 			break;
 		}
 
-- 
2.47.2


