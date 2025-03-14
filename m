Return-Path: <linux-arm-msm+bounces-51463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB5FA6198F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 19:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B815419C237B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD23204C38;
	Fri, 14 Mar 2025 18:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSyp237W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5DF43169;
	Fri, 14 Mar 2025 18:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741977308; cv=none; b=OFnDqG8sSxa9UrXukjbcJXCwQ2o16IznqRraBgWNcbPSgO0gAf9NboZBC+xiarXGhY9J2HunvnfSjWVz8zrNbRoEYilmsmLlQ4uPi/kgVK25nQvpTz/GBJFUMW3zUR/btilccI/ISCAsPPeF01hOI2I+6rq3Id/7w7drYqKPLAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741977308; c=relaxed/simple;
	bh=VScq2fw2bpujBQWsv35LjmBtGERbWvzezXJcennzOYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4apguiCMR5meuc5TJW4Qi0AAssYe7/YnP3hbY9JBe0lAZ43fkaXyGdkcCDyyeJhth/ZZdi1g+gfHoxhGMqD5vD1uYddxH7j4YTxbg9ztR6a4oT1Sw4saKqXtsxb5bP+CrhiJHDRA64JMZWjd+Dmc6yXyu+zsZNsmWW34pF22ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSyp237W; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2239aa5da08so49626245ad.3;
        Fri, 14 Mar 2025 11:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741977306; x=1742582106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KOGfE1bp0apHOUPvuww94GVOY0/BGeOxjq/fkDzIXwE=;
        b=iSyp237W2HYZAQHGpBFwpWU2WAs9NkSfN7cOFZrwKGRZwQ7k/UPTE+48904tM18qEK
         NXKbo59ZqVELcdjBAEGavIXg2EmftULio/RbzI4wxAyFWZ2ockF/2l4AR/XIqqDO+9V8
         aNj9M7MEZeli1lRUsYVu/VOY0htov4Xczk1Q/vupiCNlTj44myNFNUKmX42jMqmO5tr+
         PM2Y/sTmUuwIhVEupHQzOmoBNvSAY8eiCaNiFoWQIMu57Bi2C3nHRYhRLTooOM/pOknc
         3E+BQPoNIYBBt/SE9YuDHXhA6DYr2TuV3UK+l7gQsLEO7iomXctUGkM8adKBJ+0KBOT7
         5b6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741977306; x=1742582106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOGfE1bp0apHOUPvuww94GVOY0/BGeOxjq/fkDzIXwE=;
        b=YbOc3MQMFakQI5yta/f3JhwIjIk5ZPpVxuKzkS1K5YYbNW5H6SlbWG+YDfIDd7gwHe
         P/hHbHahm3Lxb9nHJmoCbv3N4IW+vP01SFNvj4sZHcojHocrGMbfk1Hx1tYU+wRKM5ZN
         a8OGbgpZoGAQmS6e6PJmpgooztXySh7qMncgS/PGtvG35j9LgFhKPMA90fy4hRQ68MRu
         Loa7IuGbx+vxVMm9E7qduO+sA68pRRUmf4iNhuriBDyOCQNCNrvu+7+FDP5POFQa8i+Q
         l+73nG3JC8qrRsr1BoyX/Utli8wCscno91F9MRg2gZEP+q3FWGFuQWYSAZWl3Hg3DgGT
         U5eA==
X-Forwarded-Encrypted: i=1; AJvYcCVIEYaQa8q9Zq9Vb+tVTGZQJn6hjUxOXNnfG3hubvt17io/W79fnRHAwvKYYuz/NEv4/iW8UZPjQIdeE/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Xg/xyD71LZ2tNZgopV91CVbMvjFzeaClxNcN7yI+LA/zWn9Q
	wnGOQFLiRu5VlFY98JiGS5q6MeARIhJCPbh6OehtebqYKh91KCa1
X-Gm-Gg: ASbGncvZ+DPrhVXowSTtKFhiBgISpI0ZxPsCYK7PgIsih7nRfbEBasmeDclVubATDdL
	fd8bcKNStTcdK9jY7Fat3wr3ZCQIP3B0DWaJTlHC8+zQxyMtHAoEF1LXof6gllWO7u0AQ7MoANm
	IWxiK7PU6REHjf3dS6cU7EjzVe4kf+JUWO+cGLmQGkkV+q6adhb/rEOAylnoW5VVTj5NOpbd1bY
	T4aB9GZVwZdhxK0ssULFYzpW1W453QSvuBbcKn+d/bM8nYNwow0dnMwow0ADeEc3BmOyIHfY2Wf
	ESARvAq1o1eMIzNTalNcfMj7f2/b0MAM+YrCw5U5tBjHlH/5xvkV80Q+IeUpGcCNzZ5nliSrNAu
	sqYUyBdIvaHsc8NNSvsk=
X-Google-Smtp-Source: AGHT+IGyHLOiEcz0CUx+B5T1oc0d5NEOsRtR01l/PJbeEXJcQ7LU9JwYgvAyRbB0tUWON/7rymzn8Q==
X-Received: by 2002:a05:6a21:6d97:b0:1f3:37c4:5005 with SMTP id adf61e73a8af0-1f5c12d7458mr5644246637.33.1741977306172;
        Fri, 14 Mar 2025 11:35:06 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea9489esm3071103a12.65.2025.03.14.11.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 11:35:05 -0700 (PDT)
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
Subject: [PATCH v2] drm/msm/a6xx+: Don't let IB_SIZE overflow
Date: Fri, 14 Mar 2025 11:34:54 -0700
Message-ID: <20250314183455.120824-1-robdclark@gmail.com>
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

v2: add missing type attribute for IB_BASE

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
index 55a35182858c..a71bc6f16cbf 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -2259,5 +2259,12 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 </domain>
 
+<domain name="CP_INDIRECT_BUFFER" width="32" varset="chip" prefix="chip" variants="A5XX-">
+	<reg64 offset="0" name="IB_BASE" type="address"/>
+	<reg32 offset="3" name="3">
+		<bitfield name="IB_SIZE" low="0" high="19"/>
+	</reg32>
+</domain>
+
 </database>
 
-- 
2.48.1


