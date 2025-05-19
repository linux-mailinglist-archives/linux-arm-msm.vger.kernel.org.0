Return-Path: <linux-arm-msm+bounces-58551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DF9ABC6CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B92F188D4DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4087C28F533;
	Mon, 19 May 2025 17:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4fklxbK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE2028ECED;
	Mon, 19 May 2025 17:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677537; cv=none; b=RDZwdR+LlnwD0DZxlK6K50q8Q8j6Gbi+NFzaELn/c/yKdLlTyaFET9ryHWQewfnWSNxEGtYJavGmJE9c0bNRcn9eAPBWawW+Eb6MPpk51qMpqJYVb3jB8sDx/M3rv1iyBxIoXpTRH/rdICdslNr1h4DMXb7rbS0rHl0C184eH+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677537; c=relaxed/simple;
	bh=zHv4z2Q3Jv4oPf5jd6GJH/LDQPxUZtdS3NmmX2/ISZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ALrjOrrbFeqYxNl39IC/U7iof1kFaPMg9C9Ve+09xYtc6Xg/6SIgkLNeFoyMDeBPBDwNZnBoJED+jC3toZAsfDuaJYEOulbIQWmIhvMooDjxX4m1id7YOJv5pVGpopjpX5I56kkbjJk749BcmcdIzxyrfnG4Bbp2ELXEBx8Q/wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4fklxbK; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7398d65476eso3775844b3a.1;
        Mon, 19 May 2025 10:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677535; x=1748282335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/hXTxlFJMrvU7CPa2JHrx2ogSsPgBPZqjeavvvUR14=;
        b=b4fklxbKIOiruO60b5v6TGyMlYe7RbPD45+gsmkGtrI7OsqvE7Hmuve+vvAfncWPg/
         u8WahXRJSFIELDHQtOsOwssd12rdSvuPNXeAnTNHp3ncdxv+T1jDVAIlCUhps9DJNc59
         6UPGAv1vQzbB/AUGTN4zNiOqHJU26bVEZfymPvhvs35ZsOBUVTWgbeXXQeCbddJ0MOKp
         SIbjuQn+cnhhUYkGh+QY5xtksxIDoLtYGcKYB1NEmb5hD6Yf1J51iZDihWXXqU6EVQiQ
         0KRYU370FbWP5Ujvwx5EZfkejdGh1CQH0cuUt+73Ui+J/0+Nmie33ybaznAEYi1+M5Ra
         6Mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677535; x=1748282335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/hXTxlFJMrvU7CPa2JHrx2ogSsPgBPZqjeavvvUR14=;
        b=hT0DLRK2I76/OEOJ1mnYE124aYb3UuRN/ZU13fYzbu8nW/1vJrhOW1Tan2vT4O4JwY
         QdClC1q+U9dCvjJCM0riADdEXGg9FG17al0i+B8k1daMPYEjYJqeT+Y6AmtdQxciI2fv
         yw4111CkK2dY+FEf93gjzWY4T0eJFLtahDwLT+T//4zsiCylN9FL351PHP+zOsiP6Yna
         asCTlc2xmazk4E/d+akQ43NLMqTJusjwdKvnyiAOR0+WVLEnJz5MIGaFGwY7IRb6V28+
         5oeHgyVFTZizYZnUjC2PzKVPFKgVIVKzcm9YhVora4qqg36bKOTjxLndWwob4Wf85hhC
         mjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpzLCRXNiynWcGh4c7Yn13pcOicuy+Iaa/sBSKdpV3Avi6A2bImigrpKZg3y3i2esP1pmfvJQArzs+w1rS@vger.kernel.org, AJvYcCXi4pmrgxlpSCG6KKvCMbTGwoNMFyvKlbCQPxtR1i+aSTevdluiTR2zBXFSTuFiRF+P/Vw+wFtmAjOw+JfR@vger.kernel.org
X-Gm-Message-State: AOJu0YwMyzON/XD9mpZbu6fTBphqW6+q1zGzi57migxSNMk6zISe4+aA
	mxr7OnkXdNh+b16xoc1J34F+7+RUfih6CtrSeMRwlVFVlB8JQFwWwja0
X-Gm-Gg: ASbGnctT9pWHQfzG8kfjLzv0ghtLW4zVblXbwCzMqUqXjg8K9carT8dYZQRRCDWirxk
	tkZqz8aTFSR+EZefOAff/SVMFLr/99MjFQC4RktT3PjSSdE680bJXX3TqkSpqRh+IeniiH5ap4K
	OXUYaHGUdcbh0VuD/7VWcKkH8F+Vy44d/5HRcO/mq/n1lMkoo0gZU/erN5lIVwfQh8aFIspStBo
	Z9GRTStEi89tafi8UFAZWVp6SIg1Zq/h1nGWZNbYV8YEAeY//9zh0p5FYw9X8XohsTw/onpg02Y
	wgVZmtj/p7k9o2H9MGDhPKs1KUCq79Mpdk114ArefhXLV3aTnzvWVrARXBuV00Ag1lCIscMI/IB
	LafiZMWMvF4DvANPPt+Gydxr27w==
X-Google-Smtp-Source: AGHT+IHO7vUmfXPvZMeyKDWjNf4LOGaBf9hXJlFDwffRUWBX2ZxfXn1HguqoFF3TkkZafBez0mFjWA==
X-Received: by 2002:a05:6a00:e06:b0:742:cdf2:62c7 with SMTP id d2e1a72fcca58-742cdf26398mr7819210b3a.4.1747677534937;
        Mon, 19 May 2025 10:58:54 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9709293sm6466435b3a.37.2025.05.19.10.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:54 -0700 (PDT)
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
Subject: [PATCH v5 40/40] drm/msm: Bump UAPI version
Date: Mon, 19 May 2025 10:57:37 -0700
Message-ID: <20250519175755.13037-28-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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


