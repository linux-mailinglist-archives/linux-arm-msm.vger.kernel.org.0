Return-Path: <linux-arm-msm+bounces-41479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3108A9ECCCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A44E6167E40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 13:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8C522C354;
	Wed, 11 Dec 2024 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ENcVuwxW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D0C229145
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733922276; cv=none; b=Pjr7TrwRDHTeh4ZCi2xGlV/LSNycr+1Zp33Zh79OFruzRTu6GEcgGdlOQLNTt7nwL+u/sBptbnbQ4mCBYZU5KRhrLnWQxLx+A1fwpMoCYfiMLA1cQAjXKQq0flCA+gcElk9eQczxMpwJip9t7Kb4RSMjoBz4AQuo5as4jOfNU9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733922276; c=relaxed/simple;
	bh=+kjpSyZKMfYDv7GSGvBVLk0oNBwdg69xxssowfQbXBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bhmx/pOpHNPOnAy8BK7I/iFseUZMZcvFXMM8xwV8/Ff2uwS/KVx39fYrqzVcvFtcjJol67aLGHzVTixjUsxeIxFsUEt19qlH0kzB+j2njIa2RZrLSGPu7ARbjDRIjQ+HGxhEt/X3mwaqpkwfhA43aQdhB9w468Y8pYUbC9qlqsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ENcVuwxW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38634c35129so3221401f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 05:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733922273; x=1734527073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vcNvdRQck5PexrgH0iivqnvEVdJtfPxrI2rBVxQcFQ=;
        b=ENcVuwxWygpygZ7fbHK0Zw0hhyVlQ5X8Izs+U4N70ZAMeosjwYJQ6EAa/yVLZYpr3o
         idtIXaYt6uXdIGTHqzGNu6x3zmypMpufZ9Mbtu8HGXV/YgdZw0sD4XdlTXlPtsfmB3sP
         FGwHh+T/jTNE3p7FiZ1e+FqqNn87AJ7IWa+eaFEhS9XHa4lb92lpABPBSDCPJKfqmoW1
         Ahkk6OOtCPv3RQwzoHrcvVfncrqKrTWMVFNNI6TZWtPyqtXVCm/SgBAXiRjxJB6cEfdl
         4QQuobRz5JhHuvCqGoVcP4dSweZaS+/aSMcZiqEUPGHb33owbY61C/kjQf13K2ByvMut
         uV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733922273; x=1734527073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vcNvdRQck5PexrgH0iivqnvEVdJtfPxrI2rBVxQcFQ=;
        b=d/U4Q+HSPWvLYHuapuq2K7403XqD22LcQTOogdQbg/JKf69HYb2H8Jwl9veOdQIMsl
         8uW/fg2/LV7GfA6SGo+tGFUWilSJwKIBMvbJ6i5INuUYBJhHquxy3mJhWk5ZtmTXKeKA
         MKLbXooY9nyutnYo9HYq5cWcaibwJTDQGZSSZtbcPDtrlEwv4Yp3QV1Kg/OUkf31/APb
         ZQQydk+VI4ZpkjJwiSaKviYUmja2ZH60N41wLWZWsqQVUYaqBvVFDkzyhBhF4XBBvpT2
         Qop96EcVr/2PWyGnMY1vI7sVzYVyzXDjwWfeQ7cc3+F4sEmqiiHk24BxiGyrq7zvtwU6
         WSNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpYcGkK6Fxxk+2oyM0p4zQ8D4tauCNxvZKumlk7PIuNcwC8nWRbSKkAXAm2Y4x0awfsa1CFKdRFyi+Ccl2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhz9W3Je4E1+orvQREHgYiDes0EBxUFsEyUkewKrCgR1Vgncjx
	JC9DcIA3S3Lan0rBnHNngZPPNhWIJPzCI0mwdmzvu1/0iqgw0Pq6aD6Jjf5GwaE=
X-Gm-Gg: ASbGnct6sjbM8cO3pn4N+89y4t6bT6QL6DPkkMVzCs0IMN56WFyUZV0WIDWccNOVKDF
	B7bViCfG6ZzlXBCbXB/HQZW3pEAbbADyXXTlPdFIgIJp4I58vdNYU3dypsNZ0uhEpmEX6rfmthG
	4z+eXN+5EINz2teTHZUGN9earWHFnJuxFNY5eSWRrWGksEL0YBtrJIfqhH3Q/UgbMdqWUwYaUO8
	VZa636piheB7g6iLEFEoDulI+UkMgsIgjhaKiWSKPGePKA+00eGZw==
X-Google-Smtp-Source: AGHT+IHGNMAtT86/Ll/waDUhwZx90OxCs6KJuTJWJULw9nEvrDR6OYRpOHWgU0GB0l6D/LQb2iNCOw==
X-Received: by 2002:a05:6000:2a3:b0:385:f6b9:e762 with SMTP id ffacd0b85a97d-3864cec3a86mr2328956f8f.36.1733922272749;
        Wed, 11 Dec 2024 05:04:32 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248e633sm1288081f8f.4.2024.12.11.05.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:04:32 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 11 Dec 2024 15:04:13 +0200
Subject: [PATCH v2 2/4] drm/nouveau/dp: Use the generic helper to control
 LTTPR transparent mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-2-d5906ed38b28@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=+kjpSyZKMfYDv7GSGvBVLk0oNBwdg69xxssowfQbXBQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnWY3WaTT+6VyZh/3rm82/2TydUPnkTOBrLlbTe
 +haYEToEU6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ1mN1gAKCRAbX0TJAJUV
 Vv+EEAC/mhtx4BAo7l+Gpv7VfDJluKQ2IVW2JLA7gcOtRG3KrQ2/7TWoudUHdxCdj7ntdS+AnsM
 clIT7XQej+oMg6vOX1ZCXxtpgnAEUw6dZpkmhzOYWol6pF2ijiTaabFDaE4hxbjS09E5UrRZM7L
 E9wBLGyv24EGZgibP130Ecc9BM9ssTSQedas/qKUgRrrggCoyv2M4Jp6NRpSNuun+whR+CXSMT9
 kxLmdTXL2xT7zAKn2sZcwW/AmK4HYFCFvctGDBadMaiVeHuxGmZJ5iZ2hM1n7bJVw6YXz8p0f/C
 KxyW7r1DTixUkJgcrtKAkeiM+DmuWpfenRgJjbc7FlA6jh01UD/kbm1l3sYNjpmQpIML0BDirLI
 uZ5gbyQ8/zrV3uJpS9ZT5p1SontVtUSOh+PZhGnB3y8cYILLJbxLw1BiljIx9OtFy1d7gSUsJtd
 6MCwPHrB6gUSO608/zFBFJQTuBU4S/xPoKqtEJ1WORQ3QEsF5K5LGTbLeZWedVe24NDrFrKlqbl
 yI5lqEJ/KYUB/ecDm7+9AnH/8At1uJUrzKPhY+MCdOyZNR4zr56pMxHGPqyZWgvQPFvC3UibWrI
 PpQg/dk4ZYkrxuDOet/C0VL4bGZMh1CxyUhO5OyuCK8MP16O/ETSv+MgSpzUrkRtUS87sATbAz3
 05z8rijWelGI5Ng==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them, which
is handling the explicit disabling of non-transparent mode and its
disable->enable sequence mentioned in the DP Standard v2.0 section
3.6.6.1.

So use the new drm generic helper instead as it makes the code a bit
cleaner.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index bcda0105160f1450df855281e0d932606a5095dd..55691ec44abaa53c84e73358e33df1949bb1e35c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -79,21 +79,8 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	    !drm_dp_read_lttpr_common_caps(aux, dpcd, outp->dp.lttpr.caps)) {
 		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
 
-		if (nr) {
-			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-						DP_PHY_REPEATER_MODE_TRANSPARENT);
-
-			if (nr > 0) {
-				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
-				if (ret != 1) {
-					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-								DP_PHY_REPEATER_MODE_TRANSPARENT);
-				} else {
-					outp->dp.lttpr.nr = nr;
-				}
-			}
-		}
+		if (!drm_dp_lttpr_init(aux, nr))
+			outp->dp.lttpr.nr = nr;
 	}
 
 	ret = drm_dp_read_dpcd_caps(aux, dpcd);

-- 
2.34.1


