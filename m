Return-Path: <linux-arm-msm+bounces-65663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CD7B0A541
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 15:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 124E24E2C56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 13:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0751131E49;
	Fri, 18 Jul 2025 13:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0MeVwhr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFD03D984;
	Fri, 18 Jul 2025 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752845681; cv=none; b=VjdZD4OEb32/DwFJoImby5vEiquYKcdFHfMhDUoOA6MK1ktGS1eac8U2BsdW12L7Yy4CWY4mQ/B/W+XN/kxgCM3ulQJ2aeDmPLr1xkYRGbTAtmOhuro5jmy5fYDDfQbFORimHUXppA1uYvtioEGYs1uBH2sHamRA3wNtJx5YJkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752845681; c=relaxed/simple;
	bh=fB9sK9WnpK7WTdp6Z8RFPMm9JysBENjo7+9wivVnRrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BhzsjyoJnm6tjwjWi3v+krVfISj+h3vtvzJJJohwT6p3rp/LzxPRIRG8D8v0P77bVv+AssVhOaGrb8cM2Mc2t95Gm4lEOMhPO4FfXdm4S4yopvHzv/fhQgR+jVJ3dUlrEslgK05Y5s/y0fb49bWs5GStMyCdgY/1Yrh+yGXmFZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0MeVwhr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso5996645e9.2;
        Fri, 18 Jul 2025 06:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752845678; x=1753450478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s3S2nH3iIBSHOnkJfrSWN1lV2Y4g07swQAw5eWhlmnw=;
        b=K0MeVwhrCOPkephMSQV3IwhgiIGRfmzdmi6SjhqouW+jknieTln38+9KGqkCuBJJxs
         xEFUz0f3kQpDnzCtFfJBOBrSGAb+H2y+MwEihRRAkcqTzfo/T+vIylbmaDYNaytzHYP1
         YqyBp6jkSBRE0nlNNoqKFDaXuMCg2piF+YnvWihdau3j0aK0NmTM592pB11dluKR64eD
         oFYrjMU7R0Xi83V+2S+0TH2HzpqKJQZ0I8EGEkupQI8vwQJYZ9pMlctFojK1pH749Mcu
         zM+CHCnafoRjqIsvkhi2EKljjUsDyPqyWfLRDb06GboBVKUDcCiQi+br0nxhgnUtqh1x
         4SiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752845678; x=1753450478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3S2nH3iIBSHOnkJfrSWN1lV2Y4g07swQAw5eWhlmnw=;
        b=umS2K7SbQGTfvJAPNKTOubx+ytWjc7/dPYiYkHPiJKRk+Vl8p7db8V6n84zhEh4OLh
         ytr0i0DpEyQzUv9Yp8whi6umBg7tai7BN9m8UDo7BOLPKm0wRTKD6mcIngR38Iamw2nz
         b0B+dv5TlDgJH7ePBDIuWVDA1WKGyEqkjRx9hB74M/5M6Y6G7mF/0Re/wYNv7xxLZzuH
         /AQ4uCyTUc5AFKqQs2XYALxGdkxsYGPo2SUSRRCBXTyjNSWwF+mnUhTHt+j31dcMacP+
         PtvKlPpOx16PDVIcCE6p/tuOc2sVRzuxxkhYkObfS7OtBb2BtGQS1TSJ3rtR8BO33yjt
         28Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWeEjb5qax44o4eCtHHAyh8sGjoOm7SNPqO56HtoCbIJUysGxYo2VaAS4m01sMLRCb+wRn1kHblX1Dtxbis@vger.kernel.org, AJvYcCWs20UQQNBzXax37fjvGuMbOl7ZEhysQilTKloXfuV9qGwivJERhgoavttvp/5l9/a2ufWlXUld3j5s54Ev@vger.kernel.org
X-Gm-Message-State: AOJu0Yz70wZ8cyCq3WhtPB2ZyIlKEuNQOMOfIitF175/8uA7kuPT1L3E
	E3AM9hDrTdgxzFlHpcmxJCWucAuA4pJThjbRaDFeCWpvfNMQPZdA5xpe
X-Gm-Gg: ASbGncvbifLPz+vr8lalI/ObiDrIHgI96kHEvqU2EKjRyp0WOnvqJ3uVwqI3noUu7Lm
	21Uk58N5R87ghkxhijAqSQUGrS8Dh6+SpFQF1bKMIEVY2fLmSEwTM8kJ3nwJKKsaprA8FUDgNvl
	CIY6+7z64xVHB/pQNJev+i9FJCq4kYTGGAm24twRupQpbnXJuKGPlIr67kfglPsV6MvMzFKdUAX
	kPA1o9c/TluaWtR64e8/eCex8TOyEHh2CdfKR2VHXIlfRJUZjRY9a++bptKHyQC3uhFh6VTafcC
	9D3WSigAx6w27SDrSgyAVq+IGe0AMe/v5RlhKAjyKr4YF3qg8aYOoez32cNKmkdOSpNcLTY/nmd
	ePoWFToDsuG/IlAkyQYc6
X-Google-Smtp-Source: AGHT+IFi/RrqmGh+8qREgha23rb51709ZRw5wTatIKiwddXGDcKLuzvKzv//gZCwhev886dyqBjvmg==
X-Received: by 2002:a05:6000:290d:b0:3a4:d53d:be23 with SMTP id ffacd0b85a97d-3b60dd731cfmr9611083f8f.30.1752845678170;
        Fri, 18 Jul 2025 06:34:38 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b61ca24219sm1811269f8f.15.2025.07.18.06.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 06:34:36 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/msm: remove extraneous semicolon after a statement
Date: Fri, 18 Jul 2025 14:34:04 +0100
Message-ID: <20250718133404.2047673-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a statement that has an extraneous semicolon; remove it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c317b25a8162..33caefd0f877 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -304,7 +304,7 @@ static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submi
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
 		for (int i = 0; state->bos && i < submit->nr_bos; i++) {
-			struct drm_gem_object *obj = submit->bos[i].obj;;
+			struct drm_gem_object *obj = submit->bos[i].obj;
 			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
 
 			msm_gem_lock(obj);
-- 
2.50.0


