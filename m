Return-Path: <linux-arm-msm+bounces-73166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE46BB539D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 19:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA6971735AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 17:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFE43568E9;
	Thu, 11 Sep 2025 17:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbgY6OLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE8E22AE45
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 17:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757610140; cv=none; b=NkpudEpiRx721qNlYEkJkHZ9YUWpyw4mgWb7MiOKVxHO1SVIldaJL5ikh3JSOLPagjESBqRxsySJiQMG1iKk222XpdNsaBSs0cKYQZfnTvljxrsvYf+VqV+ZgYAO31Imr8wnffLsL1hKbqNr3hVAMgNpWjgUhUO16+goULLt49c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757610140; c=relaxed/simple;
	bh=8R6+RH+mErEiPPdYOOstKc0iqhFv59uOICnzE3FZ1Uc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p59yjPR7EnPofUE2HJT/fEWFbCv9T7QF3Btue6uoCeteG1VspLHFHZ2lMAg6PWm18bONS/HPq89ut/x0w9F0Y03XulPRiOMuGwdB52s9RWqc03mhrpQ721snkfJc43nfbyrHspDWOjUhuk11D5h5moJJxm0FMlDSdkjCAymcXws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbgY6OLf; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-628caee5ba2so3830485a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 10:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757610137; x=1758214937; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RSnllEdABgmRcLsHtfpUL8gI7RsqTdIWFArVq050vuk=;
        b=WbgY6OLfqLdDd/PnqcGDOegxagDsMiHcHjMBhJlpHjO+Ax0+3ftUJBazdAKaGwOKiV
         3ubcTV3tgojFNWTV5xnJyydkgjncU1iR+UK1Ggv4CUK7j8J0ir5vw4p8WLQtphKIGI+c
         wlJ/JKZuGUOJCggvN7FULGK+/BJ7GDdQeO+5tbN5fsM8SygOyh+FzoddCbJuDwWiniU2
         5LGeH86H2rZpaJxNgIWqJ4AgWrvxLBIrtUg/Z4DxuIVS6w/33RjmnI8REZdluDz0Or1J
         rUhYwOb/VbLoEThZsdMZfex985ybyhXn5UGt0DaT7JB80ssWcpqsKd1dmPXvQ25FBbpx
         k7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757610137; x=1758214937;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSnllEdABgmRcLsHtfpUL8gI7RsqTdIWFArVq050vuk=;
        b=d+q/i3NOvbBHE6dbi6EJpPnAeKgcHdi2JsQm1qhHGsj9FJ/6b3w3wzr4oh59mRNVnb
         m1jgc2WLu4baEkpL/IDxv2XSwYlwMDTwQ49YDdesu+OWBddiniDrw14/3A2tdTuAEDOt
         /WKtWIPb22RJAsPvPQ+Gwpd6w+zh2+yBEEmJcY47m50B+oUtoijCd1xWJ+sridlkTWAu
         r+9v7JRc7QtgKu66BPA3yiFG+bqXwFUy/5Hykv/t8DZaZwgns4ak52CwxPiIP58S82/U
         NiZlkFtDdk1KSqv3iiPE+mcevdibSY3x8nroBk5UF2SqYc7vy7QgW8p8Tpp+Vn1mOee9
         wxvQ==
X-Gm-Message-State: AOJu0YwxKutptYty5bd+fPbUArm2b7vdV0QJWwDp9zYCE0PvfpoiVfqo
	C7HvtXizLusMdPy3xdg2YkCglqLdJThxL/XPyWCnePp/db2QCsKu1Cg=
X-Gm-Gg: ASbGncsnClKj1DEGhQTKbnTdemJbDmqk2lngXocJfRAZdv9eCJFPMYH50snnSaRmsDl
	uvQFhwBkVC7E68LwGnYBcNSAMZhONaefd7m2QYnidMQ8F9W0C+XgqquHzC11WHX95CVF3OjBvC5
	iiwosL+rhGM5XmSTAzpyeKmN+rF6NeDu0LGVquCdu2iR55ePFKLLu2e1rMVxh4PFe5I5AgUOyoL
	IzeqamlQmNIekyTWXUk1kCyrb9qWbJnT9ROk4Dll1DGh6ON3/wK8l0jH378VAFR/2Ue6gC+uCXB
	qcRePsRFFHzJYuq45LnQOtzDg52JAzuIU5B58CUtzy7Gz569ca1x9jbvdfuYMQihEAYMwe/0ZVc
	sDstOTA1ncxD5rn+8lD0nvS6S1K+QC2JfkllsxIHVOB4gn6dv0El5ppZbfqqsIIsJKx0Z0G1Tsp
	6XqiQXMxqgpTcU4FLugJ6i
X-Google-Smtp-Source: AGHT+IGVr9IIEZr+8Z2efkcqBDn+wu417ZpSCDs1Qv8LcIf/zr0I3mWUWCQKBCdz8daDEq9iNNIPEg==
X-Received: by 2002:a17:907:9623:b0:afa:1d2c:bbd1 with SMTP id a640c23a62f3a-b07c25b5bf1mr8227066b.30.1757610136353;
        Thu, 11 Sep 2025 10:02:16 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-163-148.retail.telecomitalia.it. [79.12.163.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da43esm166632966b.14.2025.09.11.10.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 10:02:15 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Subject: [PATCH 0/2] Make hang check aware of preemption
Date: Thu, 11 Sep 2025 19:01:03 +0200
Message-Id: <20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8Aw2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0ND3YKi1NTcghKgsvjE8sSi1HiQquSM1ORsXYskyyRjcwOL1LTkZCW
 gAUClaZkVYMOjY2trAfxZh5lsAAAA
X-Change-ID: 20250911-preemption_aware_hangcheck-8b9b3708efcc
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757610134; l=1269;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=8R6+RH+mErEiPPdYOOstKc0iqhFv59uOICnzE3FZ1Uc=;
 b=pxPb5b9aCV51Le4kGnwLMyZIQhK3o8Ug+ZnmnU6U5fkPwQolNF6qcJjTKzmy8b1c8ePzdfTmi
 FM4IB/E95smA3LI7KRo9fVl+MPFLaG0croAd8N0tJ33O723VIYSQ2nd
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Ever since we added support for preemption hangcheck has been somewhat
broken as it is not aware of multiple rings.

In some cases it might not recognize that one ring is stuck if the gpu
switches in and out of it.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Anna Maniscalco (2):
      drm/msm/registers: Sync GPU registers from mesa
      drm/msm: preemption aware hangcheck

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |  3 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 28 +++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     | 25 +++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  3 +-
 drivers/gpu/drm/msm/msm_gpu.c                 | 51 +++++++++++++++++++++------
 drivers/gpu/drm/msm/msm_gpu.h                 |  3 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h          |  6 ++++
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  1 +
 10 files changed, 103 insertions(+), 21 deletions(-)
---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20250911-preemption_aware_hangcheck-8b9b3708efcc

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


