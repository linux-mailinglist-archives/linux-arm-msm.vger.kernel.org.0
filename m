Return-Path: <linux-arm-msm+bounces-19734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6298C33A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 21:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 354211F21517
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 19:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359E51F61C;
	Sat, 11 May 2024 19:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUY7UMD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826571CA82;
	Sat, 11 May 2024 19:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715457393; cv=none; b=VwPtLs3h11Iu6Ch8SbTXOcdNVDU9fhiuh/cZj5G1TyT3ZqRRw32mtLYRjeRc0P0FeU+Nj9rvbIeaUjvzjvmwVTPPPDfTk8nfBqVDP0zZXfrrTa0PM5xUyyxBE1xe0+ZunBjjzLmz1noAOMyXFV1VFeqRh7N6ulxF9aAD3JRDMak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715457393; c=relaxed/simple;
	bh=k+MAjMj2wjU9VF/M8E+gsqgzopHilvL8N0NCA8TcfwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HuUhWOtKtq8Y9dnM9SFI+9dog0lORaCnoPhsGZI6dcQpiey08S4H6SK0+7xE+yjf5n+bhOXewFf+zQHRe5tSw/omZxuha90mbaitXEM4Aw93Mr8hIcW72z4UpbTovlR5pLUaRWbftk0+HqhUlz7mmrtHhOGNmq7Bvf0D8pzbjak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUY7UMD7; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a5a5cb0e6b7so7095866b.1;
        Sat, 11 May 2024 12:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715457389; x=1716062189; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NGvm3p9bLyz+wL65ct/g8IDZ6ekVX//stBZqTjD+xqQ=;
        b=UUY7UMD7kImgKoS822tiswpK5C4caVbx/moWEyjiqXDTIYYrPU+iOq5GWJvKcVF1kP
         NVoiO+MqmFWPTbiwjlFaHkAl0eC/QSFzpncejnX5vLwsOEpQ0u2GuxXMuerIJOlWQNhS
         aSZ2yt/cSCqXRBHMSRwn+tBo8xoIv4g3Rp7+FIo8TXg4F+69R1SKkbaQpVmFSWax8WKa
         g77O5PiCn+gh3QNYufXVFoKqBUJDB2Ybxr/Kr1DGpAJvfV2jqmIivZVeRfBjy046Ymzh
         7umgO92ns/kArtWD0UwkEdYrQthphYePg5u+SGDOQCCjxLsMghwkRw+iWWFoo6Rw3i6t
         S41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715457389; x=1716062189;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGvm3p9bLyz+wL65ct/g8IDZ6ekVX//stBZqTjD+xqQ=;
        b=XnEUJR70hGpKaWah9YvamG/h79zFrcUqvsDpCgSgx0jGVVBQ5ZJelyxx5cXmnU2lVJ
         84b/NabPueZXOeDDHlw0OnJEqjme6bsX0ip1SYmUKjDTj1B/qNdU0ZTsaa1kr2ij2Lz9
         rQJwbZRT5sPsA4/4Mle/LZwC30zu/3sNrGcWM4r3w7vZwaCp41aAIJs5U/VERwBJ2aFj
         x0rmnrXbn659rhei2hZSaekw8iffvzEYmzfIm5C8dnt6kP3Fazr7J7v8AMm0eU5sE/Gt
         X2Cfeibr6AZWiT0gtwD3xtFisOmfU8IgFAzW/tqjz7bx6AITjCv8y+inYNoK0qesH5pE
         UzDw==
X-Forwarded-Encrypted: i=1; AJvYcCVAcp/tdBTN538bV98AuDxv7oSUl9TZ8Z8AOpAkQhf1Od3LZSwUjvvYQRjntKGkBkGLrISP6idnei8kc81E2dRBoR1DdMq3UwbGOVNm
X-Gm-Message-State: AOJu0YzGZV7YvBRJwU9pR3Zv2IbtV8L5DOGcSvjpzXX6fXmfzwZn7G7H
	t8/yKXeQUU0mE2oEmrYgsFoaHuBw298FwFfXnhymUXqKX4lJVkZ1
X-Google-Smtp-Source: AGHT+IF8McTVHedPSuIB5wsij8lnSLuLWg+aOftSh+YKkOPAG0g0Grl8ZL0aSd4tj4HMdc84OnD5Eg==
X-Received: by 2002:a50:d583:0:b0:56c:5a12:ac53 with SMTP id 4fb4d7f45d1cf-5734d5e5066mr3799708a12.24.1715457389039;
        Sat, 11 May 2024 12:56:29 -0700 (PDT)
Received: from kali.localhost ([5.208.232.15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733becfe87sm3807787a12.53.2024.05.11.12.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 12:56:28 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Date: Sat, 11 May 2024 15:56:21 -0400
Subject: [PATCH v2] drm/msm/a6xx: request memory region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240511-msm-adreno-memory-region-v2-1-9f33f42e7b99@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGTNP2YC/42NQQ6CMBBFr0Jm7RimghVX3sOwgHYsk9iWtIZoC
 He3cgKX7+e//1fInIQzXKsVEi+SJYYC6lCBmYbgGMUWBlWrpm6J0GePg00cInr2MX0wsSsSqtG
 MZLr2clYERZ8TP+S9T9/7wpPkV6nvTwv90j9GF0JCq0+drjVp26ib84M8jyZ66Ldt+wKh85jfw
 AAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715457385; l=2298;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=k+MAjMj2wjU9VF/M8E+gsqgzopHilvL8N0NCA8TcfwY=;
 b=8s0VghrWWMpg7z31JDCVg/sR31wkqzyAuwh28K4fosIOnRkovI7Y2k1290HSp/JzJa8vLFzPL
 LSYW88pVFd2CImMLgi1L7Qo+HLPRU9qcyYCYui7I272Bu+pnYMGSHk2
X-Developer-Key: i=kiarash8112hajian@gmail.com; a=ed25519;
 pk=ehVBr28gPcA8cMB/wneVh0Mj6WGkqZoyYRdRNi5+aI0=

The driver's memory regions are currently just ioremap()ed, but not
reserved through a request. That's not a bug, but having the request is
a little more robust.

Implement the region-request through the corresponding managed
devres-function.

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
Changes in v2:
- update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8bea8ef26f77..aa83cb461a75 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -636,9 +636,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 err:
 	if (!IS_ERR_OR_NULL(pdcptr))
-		iounmap(pdcptr);
+		devm_iounmap(&pdev->dev,pdcptr);
 	if (!IS_ERR_OR_NULL(seqptr))
-		iounmap(seqptr);
+		devm_iounmap(&pdev->dev,seqptr);
 }
 
 /*
@@ -1503,7 +1503,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = ioremap(res->start, resource_size(res));
+	ret = devm_ioremap_resource(&pdev->dev, res);
 	if (!ret) {
 		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
 		return ERR_PTR(-EINVAL);
@@ -1646,7 +1646,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	dev_pm_domain_detach(gmu->cxpd, false);
 
 err_mmio:
-	iounmap(gmu->mmio);
+	devm_iounmap(gmu->dev ,gmu->mmio);
 
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
@@ -1825,9 +1825,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	dev_pm_domain_detach(gmu->cxpd, false);
 
 err_mmio:
-	iounmap(gmu->mmio);
+	devm_iounmap(gmu->dev ,gmu->mmio);
 	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
-		iounmap(gmu->rscc);
+		devm_iounmap(gmu->dev ,gmu->rscc);
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 

---
base-commit: cf87f46fd34d6c19283d9625a7822f20d90b64a4
change-id: 20240511-msm-adreno-memory-region-2bcb1c958621

Best regards,
-- 
Kiarash Hajian <kiarash8112hajian@gmail.com>


