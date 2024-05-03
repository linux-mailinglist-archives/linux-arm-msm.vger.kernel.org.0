Return-Path: <linux-arm-msm+bounces-19188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 449428BB273
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 20:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D93BC1F23446
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 18:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74810158A28;
	Fri,  3 May 2024 18:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUO9uFvU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A759515887E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 18:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760110; cv=none; b=S0ZsR1Y0sikGpC0/iKetxj+WMAJgVEU4TXoSh1eBgrLxPg0X4QCpDRAt8OjxNTu/FS/amAuaAOt0dPXzx7JmX2+v3nzY4IzVDevfCUf91myRwf+i82Xb4j9x1e8687AyIaZsTzrwqZ1kqKcr61f7JXRqf9NdtT0Y9yDPY1/L2OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760110; c=relaxed/simple;
	bh=xF5XC7k5+A56fzWGKfMqVYu2cMBJwZJ6BmZnpTYRInw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KD6TImhtMbe2atduKPjgXxZBSS5vJ0EVq6tO5YYNCIkqzPqf7rLmUL9ehleq0zrztqZRC3hTPDUEzVqxXiZ0rC3T+YCRIs5UzraMl4eLAyfvbUPdlER96k+Yo866b3dC2bC0N/7+V/UaQWZ508xy9yl4NpZL3rWVncIkttHebCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUO9uFvU; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso35008421fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 11:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714760107; x=1715364907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVuYQnC+Oejbh47K886v7jLhxbV/LX35eFvPeTAUoM8=;
        b=iUO9uFvUtzvz64+kWoGD1LJqahdzouWIS0OcABIVn0JXmVYmC7DQaDIVF2LrYVjGB8
         Ea74ur0RUi8GSyM4IqYyZxGp5GFHi9H73sjPFHGpjpwqPqNl5CZ0EiGRGB4F54PrWEzF
         Z8J/gc+Dhfzg7OF73YoXMuPV1TdgIp7IZ7brPm61Sg/XpAmDHAxQuCWpHPwBuBOpYCKq
         EnvY7rWoMZJoBTgrwcD4yEjvHlxS8bO95naFlWrnwO7hX3O4U/qs1bGLPQiy5h+R/eYm
         XsZedU3BkKErWTTyx7JNaInuDgQmOVH8sM9+pQtBUZ3fnD25O0wSFOw57br8NSpPaemz
         S1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760107; x=1715364907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVuYQnC+Oejbh47K886v7jLhxbV/LX35eFvPeTAUoM8=;
        b=ZGFFW3UxDJq0gYJuZ1k6L45DYXxhidSasgysW9Vg3JLpRCmmOhA01J9458vNYGa6AZ
         ACIc80Nfqi5QA/7dIpMSgwkfc69h6YB/RcX5RAUFvNcapbVV+iiQN9mD7kb52aDfOLyQ
         nLND5jzsU/TBpD7x4rVGO4l4PjRpMmPpqs8NkiVb7ehsHlbVAGUJQJu4tMmgtJoJO5ap
         FUBZn3xr0HtmMAk2gimM6EfR4xvhAYYc0DGdv72dBjX0C/sAdLKhBFp+KIARXsiPIryT
         Ais72AnnutYh42p2sypQzRvqvgkpBQJFQIRjfjDqlC/hI9J+qsBjDrA2ar/YswE7UXgG
         A++g==
X-Gm-Message-State: AOJu0YySh7P9H58kXKH/et2ObtLhMBN4lUU5F5gAcg9AcEn/wmdCWAnR
	0iZRm12Pl3w/6vChSKQe5jjugivexRTBHrUtdgHEkbeBylrJZrL4WyfETqjevo8=
X-Google-Smtp-Source: AGHT+IHH4MMFG5SQdw9yShhta2QBkdZvrkXtrf2jPCXHUI94xQ/Viajl3IVbjwM1N0fQaRrEeSD36Q==
X-Received: by 2002:a05:651c:32c:b0:2de:c912:ec08 with SMTP id b12-20020a05651c032c00b002dec912ec08mr2716085ljp.16.1714760106823;
        Fri, 03 May 2024 11:15:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e9c07000000b002de118decbbsm605548lji.53.2024.05.03.11.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:15:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 03 May 2024 21:15:04 +0300
Subject: [PATCH v2 2/2] drm/ci: validate drm/msm XML register files against
 schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-fd-fix-lxml-v2-2-f80a60ce21a1@linaro.org>
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
In-Reply-To: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xF5XC7k5+A56fzWGKfMqVYu2cMBJwZJ6BmZnpTYRInw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5qp5gr5zfPn2wYJGjr99i+4soPjH8vCom89UzzyHvzYJ
 b/Djjm7k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT4W7kYFj72pOzIq69xrLi
 Y1M7e4/uPpv8THaleRnLchu4IiME9Zwu399uGXmNj4lHdMWOkjUmjhcfGwn7hJQfLxRtOXo5aPf
 c+VNtfoe1JATubJvzk/mEl4n9jm33Na97W++OjohYbDnt1XO/yK0lx1ouqr2sa9k8+ahDgdM10e
 n37dbO3pllYn/Ka0vx5z0aRlwzuATN6xeYqUqYu8jpfLvwdlsWj+RvxlexXmopDDWCL9951Jt4S
 FjE+Mn6LlC7/Ef+TFN/2JLslxcXx3Gzrn70aa8Y84yVnA+nTVPq80/yan9yWWwKZ1Pr8mdvXdMX
 ve/JrZrf+mm9laHWiX0zPI/JcGbFOPW3915bocuwicEOAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to validate drm/msm register definition files against schema,
reuse the nodebugfs build step. The validation entry is guarded by
the EXPERT Kconfig option and we don't want to enable that option for
all the builds.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/build.sh  | 3 +++
 drivers/gpu/drm/ci/build.yml | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 106f2d40d222..28a495c0c39c 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -12,6 +12,9 @@ rm -rf .git/rebase-apply
 apt-get update
 apt-get install -y libssl-dev
 
+# for msm header validation
+apt-get install -y python3-lxml
+
 if [[ "$KERNEL_ARCH" = "arm64" ]]; then
     GCC_ARCH="aarch64-linux-gnu"
     DEBIAN_ARCH="arm64"
diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
index 17ab38304885..9c198239033d 100644
--- a/drivers/gpu/drm/ci/build.yml
+++ b/drivers/gpu/drm/ci/build.yml
@@ -106,6 +106,7 @@ build-nodebugfs:arm64:
   extends: .build:arm64
   variables:
     DISABLE_KCONFIGS: "DEBUG_FS"
+    ENABLE_KCONFIGS: "EXPERT DRM_MSM_VALIDATE_XML"
 
 build:x86_64:
   extends: .build:x86_64

-- 
2.39.2


