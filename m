Return-Path: <linux-arm-msm+bounces-57940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2049AB73FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D21BD8601B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C222980C9;
	Wed, 14 May 2025 17:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtczMpvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3849288524;
	Wed, 14 May 2025 17:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245454; cv=none; b=FXq6CyooUM9JUnnbqCl6kUfNyhCENRAsoqka1+bhb020LhyYyf9VAvoMhtvDQXfDgqSTE7S6b47OS5+HmTazDD1MzIGWZotOWHevmBESzaU787WljNbAWgtPDVNj18p13Awe/jJ0jNKN0RVASCP3xnSLE1O5YAa8q9veXRUFIMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245454; c=relaxed/simple;
	bh=zHv4z2Q3Jv4oPf5jd6GJH/LDQPxUZtdS3NmmX2/ISZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iO/wMJADSayVbaWvfOAnPqDuKiUxMkARv0EEBwZBo4OAVDzfLdlxwQWRSdlhoN96RS1cI13BwpIVF2tXNeLgwGhNkD29Z279wWQFyFBhFWRPr0LYVLDO44+cxtlaM2B3fgm2Fc39grF8Iazvbap/0J9ahTiW6VFhtV7BF9u03+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtczMpvd; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30c3a038acfso161284a91.3;
        Wed, 14 May 2025 10:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245452; x=1747850252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/hXTxlFJMrvU7CPa2JHrx2ogSsPgBPZqjeavvvUR14=;
        b=YtczMpvdht5rvx6u0XfiYvRp3/AOXDnpTUj9OhM3vQD9Nu3iykB8fCqfQrZd3AF+E/
         hXcWzVuK+gtGuOIge+xq7v3u9MyU6Ns1DZVsO/cQld3EINQNHIgmOndqUEkUVlBWJUkh
         ri24mcF4n/BI0hakSNKPfFvYLD+i6+Ww1lo3PUYYaVG7V0cT6b0jMVpbG1GJ3yXogdLO
         I+laglANdVQAzjiAfoIQ5pzOgljtFq1o5thutGrh7JM3ylElwhJfRXKw5SwHb15XGNNA
         y6c6mffOGl9bx1TGR0IWGeDXOIxz1bThNxX5nPhbXqXHTjR4ZtCNZSY4xAY6+JoClXqX
         35/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245452; x=1747850252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/hXTxlFJMrvU7CPa2JHrx2ogSsPgBPZqjeavvvUR14=;
        b=lzrIy4jb+M1r8q8ovXueI1wBJ8vrE295zsOqURgd569Q8NyZSsoZSLT8/5uMv+MbGT
         mUg2fiXGf2yOZLPu6RlgafSViY7nSfgLkbsDnPf8gauhwfflSfPaRTrRZK3u2GEaV9lM
         lpmnP6bhHesnfX4vmY3vmLHuj11sWta9BaGm285VCBvQw55M+nZAOM8De+yT38mYpZR3
         PwtobmY1OvpEZHhpMJvaEybcQ922sBqbCkGsQvoWZzXYRn2H84R0YISA0gVFd78OEBG0
         +KK0OGR3A5xsfjVwcj1Z5hlPNdA5hOmxR4Xfr0zQvuqtuibOhulbLH3goceOer7+4O1W
         jt+A==
X-Forwarded-Encrypted: i=1; AJvYcCUOj8fQsYf603u7g5HSRHU4hK8vjC0gc2eVnh5MMpqJXPk8izGNbLnzhfh3g40Em+A4VFJypODqvD8PuuVc@vger.kernel.org, AJvYcCUkFBwlru5FdYaboPyEWkQ6CdLtRyE/ChJ/gmrhLvzyOGZYfqiCf3aYsPewvyZehhUP6cfhbFoiOIY1iHZc@vger.kernel.org
X-Gm-Message-State: AOJu0YxhIFR3D4wnVRPXP8FlLpGFmoHpZntwAzWy57FVCKbC7J9j29no
	VXm5BeR3BVmS3i48+ajZjoa1CxI94AERT0aJMcIgXymMKd6Kwg52
X-Gm-Gg: ASbGncuOQ1esQL5JuGjuy0AHdcq4+CzLG1JNW+3d+UMnmV66raHjvbvvjT1R/hmNdMx
	t32tO0Hoso5MFTS+ZY/Q7qCH2IGl+lJVRr1nEgtdvahhk4p3aqNjdYRyTtCPu9ly60D0KuMTzBo
	UHd4laMoFWOHv4n3hSr7aUgWTxUpktTzQOtAqxbENVJQYFs+XMUqUg+aManKHcVtXm2xriX5qZg
	hmrpDYLjSF9hzqsPdV6oAJlVIqtpvJCYx0JmZ2UK6xp9IgREOfWI7pK2fEPsBFSXPcaPUaB8r58
	5zCQ439+QIWoYCermg4W1p4w/74DImqP6wFanP5xtp+M+mPCD3HqIy+c2C4Cm2C1BsKg97bRF8A
	m67diM3bxeG+UH6RVTneedN8pbw==
X-Google-Smtp-Source: AGHT+IHAxJdvLlS2EwkSbHFXeJ3TPDuCVzs7/JvyYweyaRi/Z5Yo4VbPzwpmGqdAQ5yMI+ogbPa0Ag==
X-Received: by 2002:a17:90b:2d4b:b0:2ee:5bc9:75c3 with SMTP id 98e67ed59e1d1-30e2e583ebamr6823107a91.5.1747245451870;
        Wed, 14 May 2025 10:57:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334256d6sm1885621a91.15.2025.05.14.10.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 40/40] drm/msm: Bump UAPI version
Date: Wed, 14 May 2025 10:53:54 -0700
Message-ID: <20250514175527.42488-41-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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
index bdf775897de8..710046906229 100644
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
2.49.0


