Return-Path: <linux-arm-msm+bounces-40857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9179E80A0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32706165A45
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F77614D2A3;
	Sat,  7 Dec 2024 16:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRlmhsKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEC41E4AB;
	Sat,  7 Dec 2024 16:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588239; cv=none; b=HzpOelI1d8nmuyQzzTySSnl0y9jC8YMhlgl9HFFjjAWCRh71OQYfNfo02blo/DsoGu0Xfqbs863pa9x4x9kFBNqhLRCsK2S1s7MPPMQirl3LJxlmJbBMB9hEnGk3UvtqtHUy/ApX76ug9b7avd8/aZaQSktGjKRk2q5nIJXt46c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588239; c=relaxed/simple;
	bh=zZFzwTWrK17rR7ZksTjm1PquAvjmpQpa0P2SQ+3Bcmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ka3VqZoDjCKim23s23lwOe2h8quTDdhvBBUE5xnlaYFCipuz4LsENF5ifTWRUPLWJH2ydp6TGr8lu4FTNkhz4fSKvRW5hbkdBaRShoZXvC/LjII5MGwOsuXi+R32teZgXgcpGHL5j+kcEkVfUqYQdC3JwrupTxtO54dJcMiEcQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRlmhsKs; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-215853ed047so30385445ad.2;
        Sat, 07 Dec 2024 08:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588237; x=1734193037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV+uCFA2JDB1hhyvgSiWVaEfg9viIwNK4A1DQTOi2r8=;
        b=FRlmhsKsh+s2qahVcuu/pu6avg3aJykj4NSWNyOIFI0VVXYlFam2814WnMc8EGkvc2
         MeDPDsS12+y+1Q+Z8C/NffglM83b529U49reqnDBRhGUe3w+wZMzqsa2J2t6wk2E6eVU
         TMc7/RNliJUfjW6Eymb3UlJNcbo6Dhs6BgQj1LIaJe2lF6z1bdtblOc/PIhUSIt9ZUIG
         ynkbNNyITLjkd/fmyAD24QWjDm8Ys0dNAF8J0Z6L/lpGMawb55mTui6wVdqcFfxHe/WK
         eyv036uLeMuoBP+f/4vuPZdyJgCVDuJVyoqCkCMC+j5gZ31lW2Q9LzW9K68wN0TrIU7V
         IUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588237; x=1734193037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CV+uCFA2JDB1hhyvgSiWVaEfg9viIwNK4A1DQTOi2r8=;
        b=ETPY70wTRYg+U4cyRn2Is/pRB8U3+7ay2jCej6APhRDmYphokPG8JaGS3WSJVLFUgG
         wCTG/SXnqHD5QcUZyvhSngMbCgRNXn9fmIlRkh01jeOw1WkUkz0C8hvYYQiP4Fe4b9E6
         5eLn/noVjdwLo8nPFH683DMBxm9B5rT5/nIT52nRp01UcqCRvMp5H2+dLMh3fwdxccAP
         Iqn5aqWelXEReul9AUJDrtu5MbU5TX1PDdbUn9JYv1hQZm0f0Gddil/kZbt+YRjQyxST
         HQ6cMq0m0pwM8jRbLMoAHUAJWQArWMYzy9wgCF/pdO8yfkuEFDotl6lytYpYqLnV8ig1
         9V6g==
X-Forwarded-Encrypted: i=1; AJvYcCUId0ZuHK/H69Q+bnPx7sAz2KsPDRIlVFwL9s/7Jt1Rc6aaiBsZpECNj7JqgboWM6wa41PUP4jhJ0W17wOu@vger.kernel.org, AJvYcCVfzPbTHYomXif9ysTRDlGxyATLrlyWb6gOgUOG681DaaniVCo8+m8MTqHXCQ3XbAUdEmn+/M+HCfLxVPKs@vger.kernel.org
X-Gm-Message-State: AOJu0YwXAfB51Lxz0au9fF2aB809hB7Iwvw2LyJCi3QVpwJmeJkr36bX
	bJQjsXxXAcQuAIIqQ8Bd8Xjf8vBgo0OUiLqxbi3HlRP8bDfWXr8N
X-Gm-Gg: ASbGncsmSUrKPtvSmfwUdrC5KPoWd/bkTOFDcxQk3kIvH7Ew62H9gPh7Lvg036H9i4C
	oId6OCBCWyw0qFVnbGNJvNwPguipwpfp6Q1RiwNoURlGj0SCQLrzSJK66nZWvrVjWpGtH/034DF
	9ic0pTTiUR02JwTn1OdXBku8EBqRO1x+eKx1oMN/yls+FwFgdRyW6xkiX7MMMpGCr8lq4h3f0Se
	AKPa1G2ovEQQpKafKaiIM24NYImvTqpoqOIYSpKYQXaCvmHdSnhmJlEIrDUZ1Yrbv1hG58YmEVa
	Q5cfzbPi
X-Google-Smtp-Source: AGHT+IGNSol+D/hLnPJGlFtYh26C30xz0pG81ohsKLL4K621B+zkYYXAaBZbDE8Vu91JRUJH2MTVhg==
X-Received: by 2002:a17:902:e548:b0:215:b087:5d5b with SMTP id d9443c01a7336-21614dd1b7amr107402935ad.40.1733588237059;
        Sat, 07 Dec 2024 08:17:17 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm10627515ad.269.2024.12.07.08.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:17:16 -0800 (PST)
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
Subject: [RFC 01/24] HACK: drm/msm: Disable shrinker
Date: Sat,  7 Dec 2024 08:15:01 -0800
Message-ID: <20241207161651.410556-2-robdclark@gmail.com>
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

The WIP VM_BIND patches don't yet support shrinker..

Not-signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2aefb8becda0..6bc6f67825ce 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -267,7 +267,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_deinit_vram;
 
-	ret = msm_gem_shrinker_init(ddev);
+//	ret = msm_gem_shrinker_init(ddev);
 	if (ret)
 		goto err_msm_uninit;
 
-- 
2.47.1


