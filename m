Return-Path: <linux-arm-msm+bounces-51462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 382FEA618BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDD9F17A675
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBB51FDA78;
	Fri, 14 Mar 2025 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCZeqH9x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B272520297B;
	Fri, 14 Mar 2025 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741975112; cv=none; b=QCh336TuurnhBVAnHNvbsUFTAXmyUlWM5CQjrb/acnHpSL86RXslZ84+Mvs6ZI4OWT5XfRku6PpOncjjfju0jmiCOZ9dSWH6fUbdjJvY0OnVGVQvJziUwxt4tS/hQnNftzDz/3nqOZmG3mZClXdu0n9v9bLcXcGYJ9D5ORJ2PO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741975112; c=relaxed/simple;
	bh=x5hWKuWxbPdAKVKQKdaQxLlT/0xhENbBoD5c1ixw4rc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nq6XNAJH2Sa5j/bJvmkLaOdBvT/AKI9HiPK03miIpLrYiPVZwPel0NWaVKzzKZhmOdyP1qZ8vPWdaWunBclRfbcX2Z2YZTStT54+dXKUJ8UkWEUKT42LFXW1CALhAEj03JbAZk6xpxXPEHjezOvqXO3LxfYoELKt5N4n3IH0fGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCZeqH9x; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22423adf751so39042305ad.2;
        Fri, 14 Mar 2025 10:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741975108; x=1742579908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/nB+EprANSiiLTLvezU1vuAXuyjHhh7tXywCPXdMdU=;
        b=NCZeqH9xNBzLr/0D6FL5VRhJtGDCCNAIbe1VDccYwm9w3JlBPECRpEwhfSIb0NCtTG
         E4X+uDhjy/WTiSy41a1OMElwGdqS8x0bJt96mHw3CSoHChqMmDBLcVnC4loCEZSkhcIP
         zmz6XsDS81/7cUln/A6Ef0RctbunlitubH8wzroF6glHGnkVvu2b88C15aJkOjFlfJRn
         khPaWXTfHLaRX3OuXcdQn9lV/0GyNelxnQHoC6iBU01MIwz9A17J0WEfi3b3oQPXrGs8
         zkVhMue6ipg1aYeE8iP9Feii7hQp3tr7gMneN92G0ChtlXuNK+tlgDDXPR5PSa/oA6Hi
         OUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741975108; x=1742579908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/nB+EprANSiiLTLvezU1vuAXuyjHhh7tXywCPXdMdU=;
        b=cJMY+FqjbA1pzrnqp44SHODpFrO8fHmyUI3XB1Kpn/WTjn3oR0pOuzvtphkm7IVt9c
         UGJJOcnRW62PPxmeMEZq5mvjZsBp1P8MnISeFJJCYy3jXD6gX6FPNEcxw/jX2+AiWknk
         gtmQcgBk7GBaXWVUszALa560pVt1OhHmrTHfZmK7eOFKnhjrJFCR4s7RmOTYDYNzlSm5
         utsNv51t3VyOdwhEoP6Fz8vg3i6roViG0HLrhpxnrG92WltjA2ai2Xh88dZnmU2Sz3YJ
         1NFPuYGCf+lEZ9GkdtzVqoBS6qTkF8PIkLedj9hw0PEyStUxgA1vDCzYfhXksEIAQH2l
         S/2w==
X-Forwarded-Encrypted: i=1; AJvYcCXQgFxQDVadATrT0nPtvGyCWPoAIspIw8zq0SKGgyF3ihByJDwg2lR/2QM/NJoPEEaLAeXBT3ZXD0GnACU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzII6hslmn/IPW9ksyXgPX2ElKBMkKgMCBEdJLTb7cQNH0sa6y/
	jiDtI6RqnQoVgXIDXsiqU50raNJBYTuRVwyQSSkMyMGdU3dGxfTK
X-Gm-Gg: ASbGncs8zVPJtRIdpdhxVPjZS0XYBKFWVaiKbMrG5bR0QuGOIapNPzkzU9OqzBbzq9a
	D15iw3pGrgywN0h8a/2vYHvSJwlq0JBVvAqnPQUH6yTkc+hnz53oPUMtoh5im88soglpydA21fH
	i8rqI7bhoQNHU98dxOenATMWQKzL8js24hsrPX9D9LPGErC+x9PRukQjOpFyKHTuwiOEt0nGp6/
	LgbZvXaG2zSAoScuqXF3vFQPQaW8LFVlwg9ZUbVVGX73PrsKrz905xONua2G8eTrTGiV9i7t7Cy
	c2YSyYL/lxQ+/3akoL4HNREc9bXPbnm0jQ6L8Ns1CRg0ulO7YYVhg5gCFvDBEmMvMtdzQdgqtHn
	meFIQjZXEWKhS7JTcgTY=
X-Google-Smtp-Source: AGHT+IFboGzFCFtY2YrWd36M9O/xP69dJrRf4kY9d1YlDpQIOB21fIIEL0GCNbPYS4EL7EjpGpHCPw==
X-Received: by 2002:a05:6a00:21d3:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-73722470508mr4728372b3a.21.1741975107715;
        Fri, 14 Mar 2025 10:58:27 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371152938csm3243466b3a.12.2025.03.14.10.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:58:26 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx+: Don't let IB_SIZE overflow
Date: Fri, 14 Mar 2025 10:58:19 -0700
Message-ID: <20250314175820.112340-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

IB_SIZE is only b0..b19.  Starting with a6xx gen3, additional fields
were added above the IB_SIZE.  Accidentially setting them can cause
badness.  Fix this by properly defining the CP_INDIRECT_BUFFER packet
and using the generated builder macro to ensure unintended bits are not
set.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Fixes: a83366ef19ea ("drm/msm/a6xx: add A640/A650 to gpulist")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Backport notes, prior to commit ae22a94997b8 ("drm/msm: import A2xx-A4xx
XML display registers database"), just open code, ie:

   OUT_RING(ring, submit->cmd[i].size & 0xfffff);

Prior to commit af66706accdf ("drm/msm/a6xx: Add skeleton A7xx
support"), a7xx_submit() did not exist so that hunk can be dropped.

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c               | 8 ++++----
 drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml | 7 +++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d3978cfa3f20..ea52b7d0b212 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -245,10 +245,10 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
-			OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
+			OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
 			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
 			OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
-			OUT_RING(ring, submit->cmd[i].size);
+			OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZE(submit->cmd[i].size));
 			ibs++;
 			break;
 		}
@@ -382,10 +382,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
-			OUT_PKT7(ring, CP_INDIRECT_BUFFER_PFE, 3);
+			OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
 			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
 			OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
-			OUT_RING(ring, submit->cmd[i].size);
+			OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_3_IB_SIZE(submit->cmd[i].size));
 			ibs++;
 			break;
 		}
diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index 55a35182858c..16848259af51 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -2259,5 +2259,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 </domain>
 
+<domain name="CP_INDIRECT_BUFFER" width="32" varset="chip" prefix="chip" variants="A5XX-">
+	<reg64 offset="0" name="IB_BASE"/>
+	<reg32 offset="3" name="3">
+		<bitfield name="IB_SIZE" low="0" high="19"/>
+	</reg32>
+</domain>
+
 </database>
 
-- 
2.48.1


