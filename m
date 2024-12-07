Return-Path: <linux-arm-msm+bounces-40880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 817C29E80F9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3D8C1884822
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D298E1AF0DE;
	Sat,  7 Dec 2024 16:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nb3L3veM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7AD1AAA23;
	Sat,  7 Dec 2024 16:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588301; cv=none; b=rt8icnEVHUqg3KvMR2b05iaOnrl/fewCPn5V6Pg5aM94zr7T+Me5EHkvqwLVjHFooE5cZ1KLQ+fgQt0GCcQrM6K6a+GJwUd4QzF36sCoA23uJKRkXCOVwjn86TJzQI9t0xRcWb/5C4dOQdHPHxlkMB7+AZewFQsEeZIzFoqWE/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588301; c=relaxed/simple;
	bh=QXnpwEVCLXghIrOPaleLII85eJmHZ8XOt/HFoWM7A30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8CxWBAy9Yo+pdkItuSm2uekAZb45vZhAN4ZPnxYDFvYjsl6MNjHC10NewLQV01S6ESCFr8b9HrGrntCdsj2ikESF4VQpa4MkS9IlA8Efk96J43WnrdVFAVTFMr5yRnIev+qJcxf1RMBUHCD3qRn0dbkyVp53OJjHbD5BvfJjpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nb3L3veM; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7256dc42176so3399436b3a.3;
        Sat, 07 Dec 2024 08:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588300; x=1734193100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKEc7pfcoe2pEfex+pxqSNNJz1K7IYFf9h97WA1H0CA=;
        b=nb3L3veMRDCRBry6l/KxKI9IKH9b5NkHDPpK9mtgboom3NSK18jRtzg4HuMEk4oS0C
         WvjjWSvGIGTSVbAn4KUAP+SCmviHYL2kqEqBXX7X/OYxnZ/TeTxpG8JfhZStOVzF34pS
         u0M7QdgIp2DbwrEYaEY90a2MYMJQN4+S0ZBceyLtNNvcp9ytwkOdEmaxT8Q3Ivndg+qG
         QpIm5M+MHTomKYJxSqdWtijNourIGkRwJV82BL3tZqU94acpDY7hdQpC3eDIDnws8okf
         UW3e4U2QtAzEaa0kRlHUc0P5l3Px3VUm2i+neSuAL/XbJTTtGLMGJO6+1/B6nIWWhRPL
         QTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588300; x=1734193100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKEc7pfcoe2pEfex+pxqSNNJz1K7IYFf9h97WA1H0CA=;
        b=utReVKFn00djIRpQUyoPOH/wKICIKeTvmEFpBJKbUcEjvS7A3KVPSJZxbSal0+fJ+B
         j2XzeZXc35YnOOkxh1/w/VdADeGr3sPoTK5OzkqhOLk4uW/RE568ptJ8NqrtkOIcPTWg
         PrNGIB3raTOwmd09UJoTuBQSlcwFxCfqNXPsdp9bnQsvPDy0pCNDfFwwl4lSL/3gqt2L
         mXRBxsehdO5xp0ZdiD1XOECkM05w0y2hW5aZF1Y+A11MhrxHGvEQm2P+Mbe4C4QQnlpl
         KIkCI38n7ah2MklI5sMWu8Q2Cec931WOVDD3RK5NH2cDdAOk/Mzycc8lnKs6e4Bhsae1
         FJAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMeUGaBlT/pgZxPbIw+LhGaQYwYiCheco2NkhkAHvB4ZpV/+YQFZId+7rHLnBaXbSKhS/JZjzBY0HbZd+W@vger.kernel.org, AJvYcCWOt9rsM1c2w7nLvnEKW5ijuKGES1R6WQJQpsr8Sj4t2sIPIIbLulKNYFUcPlfwTSx2DedP1MMyZiJZqikW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6NyqOqer6XHaJ4WG73l4vDmeIRy22bttQtGL3flPH2NyaDDxJ
	MPjakVD/Q22HgfQBikGd520TllFlzI/7RLSjpG39D1yFryGfQLhn
X-Gm-Gg: ASbGncuLezGkMO1nhu5n7/m6mRaTn/+aoeIC86lIHY21G2AxwGtcJkdIgBM7kA0Uc+R
	Ve0F/ESEOmk0Zgpivlu7cJjVm8Bls5k1+ZxlabIdtW7Mi80nh2/jQbkgJGpOTl/HyvOhz0fNLSO
	13EftQhPbQOUz6Lck6drgF0gK5RZAxfeJfludf3bRs4PnL8jOp+ciAuubrb5vTYcLxBYBRlyWss
	7wQqJ05arcaG6bCzLz46KjBF24OUvFWD2e0wYSXf5HEYfrWRWil1ppsCDr2sW+sFvhE/91M2Dkd
	5qzyuqMc
X-Google-Smtp-Source: AGHT+IGDDW73BrrybWnhgDLvwKJyffdiYjbRHUUDZGdP2yCEnF2SVu6E9reKoz8edCA+hBCTjpoxkQ==
X-Received: by 2002:a05:6a20:2589:b0:1d6:fb3e:78cf with SMTP id adf61e73a8af0-1e187156a70mr9628465637.41.1733588299724;
        Sat, 07 Dec 2024 08:18:19 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd2f40dc81sm1874742a12.64.2024.12.07.08.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:18:19 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 24/24] drm/msm: Bump UAPI version
Date: Sat,  7 Dec 2024 08:15:24 -0800
Message-ID: <20241207161651.410556-25-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b31ec287c600..dc00781a099d 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.47.1


