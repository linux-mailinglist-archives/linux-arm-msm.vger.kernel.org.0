Return-Path: <linux-arm-msm+bounces-28666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCAB9539FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 246D3285BD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E661494D9;
	Thu, 15 Aug 2024 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRlmaKSA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4917B13C906;
	Thu, 15 Aug 2024 18:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746469; cv=none; b=KRr3CuxS2cFJkJfhIsmlgb8p3icnoE1LtTsohuIXcZbBqiIEnWRNom0hRDPA+b0s/Rp4dYcxfSsjBm8TZaZaPiUwiKZonFytiM2mSLebBQNXucYt6pk+dFbIr1Q6t0DysVeUrCdf8Mu4LU8KuRiKNqNfbmxq4SdWucM2dP9EJC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746469; c=relaxed/simple;
	bh=F0OWbgiTE8fXGsmJh+q0opfj9AJfdT04FvOWvOdcCSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LRojz0M1l83WdMwXVOgb/sU++7qVaoPAMBE9I/svnllSR1DXqY77L5KLBHSS2EF4kK0Q5vscGjEZ/j9B4sxachC/LoJb1fHEnRrTQM+3ZX4Gri0mTpKKfFvvPhBUUOf2b7rkHvYMFykRbG22g6NFT+Vn8vqYTU1aQd9xHh7RpRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRlmaKSA; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7a81bd549eso117741566b.3;
        Thu, 15 Aug 2024 11:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723746466; x=1724351266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIguaDw6K3AjrU3ab+I5U80CnBvjwafBtu7HcwHufJ0=;
        b=bRlmaKSAsxP9RPyDalSS1uZ3ahXtLWejGJYQtEAKIeuueZlnSa2Jk2Fg/xHiqp4HC/
         nv93dCznVdBZ+ZiCJrezPWqjyCMk15buzNshf4mPB8oyMK8Km2DM9X1z/1mWguu8f2gU
         X5GNEGzuUDrqzq/MsE8eMuuIP8v3v6kS8Jy0E0w/Eo+CCfQCW0nHQiFuO3rxHWUSMN74
         NXQpr8uwC1wPCqT7QG4/70kMX9AjscEjpZt8C1RJa5qYW6v3/RQgGOYETX7jd5PKOEjd
         n+YiYYhzj7Uug2PuUKNjSvPz0QYGr+WXFxgwO3MlQ5X2TIuFwDYsBzjdLsznNe0Mopua
         6TQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723746466; x=1724351266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIguaDw6K3AjrU3ab+I5U80CnBvjwafBtu7HcwHufJ0=;
        b=h8er9ltYvdmpvM50lF8eKMfbI0fJZX35or++YcNG1iSzgHewTtYfRgAhuuYbefgGEp
         7PSMZH30xiOwP8T5adohkcczGjq9KExXq22fO+Jcat/26crfyFoYPSJ7nTZ87E8xTd4Y
         GfQD7UuDuJ5zwq9RuD8oTpGV8BLFtNcBEEhQZTMxO+jU+1GA54WEB4T6g8hZHzzIWFc5
         rSApZ3wqvvbeXfhM2GRQie1FEgqxu0SqFThm5/xaKrz1GOhq8Z7ct5dBn+0JH6aZxM3J
         9sv7JiYD6qENEHivkMiRpsOUZAIy5cApOzyGJ33ZdgW3ZLuQcuIRn9oBJ1JAvndij1g0
         IgFA==
X-Forwarded-Encrypted: i=1; AJvYcCXnSM2c4ibEmgaeEyhi2boGcIKYjbCJz7tWz5POTekaUXeVF0JV8Tex1/XXr1iFc53Xv0ZOtUE4jgcLxae1Dz9F83sXF/F/xZdMgMGQ
X-Gm-Message-State: AOJu0Yz3K44nS/dX7OvL+THyj9TqdKfwcECNBLelmuFDGlsktbm0kKJY
	ZAGNc99jkfk9CLv5vqx3dQzdugh9HALgJLEBbsVQqgSE4B/nirtd
X-Google-Smtp-Source: AGHT+IGwoWk5WigfEZ1u01jT4wrcamE5rN3NcH4p3UsMjt+Xgy/YrHe3X+lScoeKehIQ0Q1UjZVh6Q==
X-Received: by 2002:a17:907:6d2a:b0:a77:d773:54ec with SMTP id a640c23a62f3a-a83928a35abmr32107066b.8.1723746466408;
        Thu, 15 Aug 2024 11:27:46 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it. [79.35.172.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 11:27:46 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 15 Aug 2024 20:26:17 +0200
Subject: [PATCH 7/7] drm/msm/A6xx: Enable preemption for A7xx targets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-preemption-a750-t-v1-7-7bda26c34037@gmail.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=810;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=F0OWbgiTE8fXGsmJh+q0opfj9AJfdT04FvOWvOdcCSQ=;
 b=BFztRTD/A4FOBfCMtIL+mnc65TjK9/VuvpVb9pb+7bPx7c+q5F8Yozv2Fh++miUCLueSfzHDl
 jiVeUjL6PywDxlHahr7xKLG9M5lR4H+maEVZooy3X2FuQINLuCThaxb
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Initialize with 4 rings to enable preemption.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 86357016db8d..dfcbe08f2161 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2598,7 +2598,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	}
 
 	if (is_a7xx)
-		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
 	else if (adreno_has_gmu_wrapper(adreno_gpu))
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
 	else

-- 
2.46.0


