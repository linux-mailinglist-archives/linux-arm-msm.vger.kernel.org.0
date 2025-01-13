Return-Path: <linux-arm-msm+bounces-44893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0BAA0BC8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 16:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2700118858CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 15:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DA317557;
	Mon, 13 Jan 2025 15:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4Hy5dgu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4D11C5D60;
	Mon, 13 Jan 2025 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736783327; cv=none; b=fHyGLngyGn9vGDTiWVTo4gRMAc5cfSXcXpdYBB5mhesIQiBeeT0kQ+KOQdICFVWJh1Hz2oMrx9oRYzhc+WelCu+z2ZxJIA3eN9pC8FJU0Accn4/pMK150+YdM71E+oisCii0Mqg9fZAqHgvMjq6CEfNub9cTY+KEKipJywV3dQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736783327; c=relaxed/simple;
	bh=JyI7H0++snNonmm6/PR50K5YxQCOkVVMqAlpjVp8jqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Do51zO2SztUPpMClAiQTcS4Y0249SZa9fANBOJOgIpGg4AuF8MUeraFbyPiZf3jE9xrzmT22Gj0U9JzPdtKGUFt/8ch8E4ka5TW0UqozKr2VtPWLvKO2nme31NjJnvxvrJ1go4TYAtHbuKZaGgnwzrXVvU9vttS4vLn+GIWSwqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4Hy5dgu; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so7479665a91.3;
        Mon, 13 Jan 2025 07:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736783325; x=1737388125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GOWQXV4O4PW3a432Gu/+8jRdielqIfGd4MIzjAae258=;
        b=E4Hy5dguNdh22HoqKN1dkRjlnXMUlYKpOq7F5dEpFRYFyGv9qnscC3M4tSdL2vuPLP
         aQCwsUdQYjIYaSa3fMOTYnAxHEoI/XKXxRhA+11oOIxZhAsSmZ+ZrV+1OvK21wtM6DKF
         kimwc7mnvV/7XzjR3NXGnFzJBrRuNW54sTKmughy3OgXkXa6r+0fi0K0rMLCNZmmOD3x
         ICgw16L5WbeMSSVnN8DkvkjaZMTgd4q5MU+dHb+rrxVqPRdg3B7BZBm9OiDlcw8Zj3qg
         DP9vb/LvgMDL1ojkEpff79dG16C9UUzv9HpBNbzjFw9+P/oqupmH14QfHOeLAjpkIPVx
         oMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736783325; x=1737388125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOWQXV4O4PW3a432Gu/+8jRdielqIfGd4MIzjAae258=;
        b=k6PK/891tiO4zOU8BZFT/D/sMXS7FN8pKxk3NrrxwTJigNWMSQbIfS7agwwIGTGtsZ
         iFDmZzymrmarVg1JPXcB+qc9t11beHVAMsnECvPwdnNO8CHGrOPfw3M2p2ebCu/2ory7
         Ly03+urfuDDlXnE3H5TIOEPSCcaG9ymxTrb7IZR9ZCfbT/XLK8iltUTZLgu+DD9eW0IM
         0ZrsfSyOrE31oilOh6PaBAVWxsKe02nuuQ35tY+RLIYjS3vChGYrQChEJITjXxcF4Wt5
         zbBtT9lTjnSZnrww08Vc0UUk8YD5Z8fAfyJMJMn/AxYxjA3XyJCjSMjCcW3J+VFmtOVl
         5v0A==
X-Forwarded-Encrypted: i=1; AJvYcCX74VlwfvVOZVsPFI4Jd5ohAIhofSOkuAFj3O1vANUPUty6Ub6UlbbCG3nXomv1O9TpRV1Zu+5huv7WAP5B@vger.kernel.org, AJvYcCXhDzhXBnmgWglHrWSBTv3RHuSFylcouG3lPNwNx6p6Z3tHfi117kPkVNrnwzYcXy7HjCoV+5KaZ5YoQwEd@vger.kernel.org
X-Gm-Message-State: AOJu0YwbUauvE67KFZGfJK5RDYoELIMdixDI6iEhDNNZyUe0dY/sW1N1
	DesfLFz+l2eslgY1c2baq7OKL4OLIgNOEf3Gy9gjTdJQiBORt+ZY
X-Gm-Gg: ASbGnct14yz9B4aSdGMFSEaEWv5Ckc6B0FStj7pywtpE37suUWEDq4oKkEyj29huYjh
	uTK+f8MkewjQ3x7J66VpoQaQ4l+8EYscn4WuPoodLu4tXEfCtY57AdlhzdARiI6fV7/+4fGJCWV
	YjnUUqhb2vFanvFwpn/yG8woRl+Ra6vyGplqbnEYj0YpVMyR8sVOW5dxY5P3eOjtqz4J/C8VINv
	FXxgrxe30EXK7MwguMQeE4KR2KQUlcu33c/oPO0DKpKVxkX/sJI5itECWEGatyXXiflWvXsl2Xy
	Mo/AIorPiY6fqzrQk3Yv6CC65pjupSM=
X-Google-Smtp-Source: AGHT+IEB4HRVmV2UtNPCt3Qi11rnIt16AZGSceKAxCUp6976MdfO5rkvSpatyjjYH6n4suj+mkjZ5w==
X-Received: by 2002:a17:90b:6c3:b0:2ee:c918:cd42 with SMTP id 98e67ed59e1d1-2f548ecf156mr26272101a91.22.1736783325480;
        Mon, 13 Jan 2025 07:48:45 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22ee14sm54595935ad.186.2025.01.13.07.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 07:48:44 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm: Avoid rounding up to one jiffy
Date: Mon, 13 Jan 2025 07:48:41 -0800
Message-ID: <20250113154841.129521-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

If userspace is trying to achieve a timeout of zero, let 'em have it.
Only round up if the timeout is greater than zero.

Fixes: 4969bccd5f4e ("drm/msm: Avoid rounding down to zero jiffies")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index fee31680a6d5..a65077855201 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -537,15 +537,12 @@ static inline int align_pitch(int width, int bpp)
 static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 {
 	ktime_t now = ktime_get();
-	s64 remaining_jiffies;
 
-	if (ktime_compare(*timeout, now) < 0) {
-		remaining_jiffies = 0;
-	} else {
-		ktime_t rem = ktime_sub(*timeout, now);
-		remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
-	}
+	if (ktime_compare(*timeout, now) <= 0)
+		return 0;
 
+	ktime_t rem = ktime_sub(*timeout, now);
+	s64 remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
 	return clamp(remaining_jiffies, 1LL, (s64)INT_MAX);
 }
 
-- 
2.47.1


