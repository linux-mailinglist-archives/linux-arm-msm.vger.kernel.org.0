Return-Path: <linux-arm-msm+bounces-55980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB99A9FB79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6A32462A35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F76221F25;
	Mon, 28 Apr 2025 20:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBPJUQYx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B83212B2F;
	Mon, 28 Apr 2025 20:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873885; cv=none; b=Uk6bv1Ym56NSAvgzRHmURpahU5mBdnk1UkySn3npcI10tWorC78yk4PfZ9o2s7NWTGf6R2oSPNOVsz7WGMrfO5Id1Y/mU1xdPSTDX5BTDTwg8J2BJtB3c7AXktSLkcb/b7XgYXBnPxap2zrWnEXMX8H/r3G7UEfiRvRHRmWk2rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873885; c=relaxed/simple;
	bh=CA9LSwGwVidHkxrYbPV3p++j0BZJi5QUpe/IBeBS8gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ojzVjDkKbTbEe89MqKHnESBsPkTmCC4/lh9xVyPO9jAC2n+WGoo4DQKYgeqWmyEEV34Tccj9AnfffYWaSeTBctC9UYrGN6L12rJjkCelrId/MNHFI4bNCEDT2H5PjYS0LYAn0dMYmWSgSvrIxKhbDAYvBpWs5hWNQTPUFb/Xjbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBPJUQYx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-225477548e1so56166835ad.0;
        Mon, 28 Apr 2025 13:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873882; x=1746478682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldKiKXMw4E7/uFSSwgQ+a6OPkM5zfTFd91m8s/ysTB0=;
        b=UBPJUQYxbafDNU0XOfkUWFA07rNqyIFQhEwXxU3mt9I3UGlxBg4RMM8JIKs1A6IshY
         Lh34H6oOIsHz+gJABPCs1asPYii0xrBX0usrzWlNwwqR8VfIaeQlk9Dp0fIO9wd9RmqF
         HhsWj7e5G2NSr9m0SicigEzz7t499ZJ7F2JMmIJIUiz6NCmU0QFwNvaNTVx5FG96nfRG
         b6LXSOPikF6CAQAEhpE657WRlqw3zLTNy/V8NYJK6grR81F0X+sL6pEfTl2G+s9c5r3g
         C2+HOP2OCUhXlM9lJwtT7e7XqpaiLVyC+hY5N0wSAqqdYSa+gpXTDFdU7QxJqpt8H9lG
         5+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873882; x=1746478682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldKiKXMw4E7/uFSSwgQ+a6OPkM5zfTFd91m8s/ysTB0=;
        b=w/sLTioZNmidM90oRAwyVJ8hLXd1tc4fJCiPdO4tecqSdBtzz0pmJ0WEq9n0FMrtj2
         1oQ0BLIHaS9eMyRvOX96y4+nbYvGVieUj7jV8tky9GA3dOEuJ9V5AmDK+3gsfQKtEQqU
         eZi+Qkkq4uEs5W/RQLPNEIQwew/L8DxrjfcEyh9kzAK3hmiLwJPHJvi8kr0DP91yqQ++
         Oo7D9kJ3yT8aycHlXWki9NXzY9UwSwBuXq5DYZFnPwftW/nr+K9n+wSBxt9t4sned3oj
         5Ppn/zK0kjilAMS0owlH3mPfNu5WiNbN3dfFhvVLlRZBcmfGzJdrHF61793x20vRgkq9
         8VAA==
X-Forwarded-Encrypted: i=1; AJvYcCUtrkbajyTGM7mMy+IuXgZCLQPryHCY0/9ai8MZ9fGcUpMOCjsXXmRBFtTcBo4BzmQqroPOCA5lUIuGvI5H@vger.kernel.org, AJvYcCX933y7SWvlCA3fvOXhRcbY2OaqOY+eulCzibzQObOpDri63t9Qd58BI0jCArMDhwg+fQXMtNgerADwyIPd@vger.kernel.org
X-Gm-Message-State: AOJu0YzEPDQAZkroRW61whCShnXurKa9sx4Rk9Ek/Ra7G99rMiKs+9nj
	gpv/SaaFqgUu6zjYYTkexo8SlVrmiFLxKkVAHgveqAK92lx4v3Ne
X-Gm-Gg: ASbGncu+zKPPvAOWbz7JiNtADFc5lRWc/PFe4qVCxeA+8Kc6xMbhlqqtmO1Gmv9eC1a
	hBuurAj5CYFQ4zw6BHjE4kGaMiYH7q5mALaUol1acAF4WfVpjTp5EZ8Rz9siqOHgvC9wFh8oELa
	o59fQntS4fjba+Zg0mVn3CAcVP9lTOrPG9binfxof5viOMQzf6GTSW+JGMXfLUZgo8N/Kqjp98y
	aADdbkF6RVWymwIhfKqtc9zDoxvVEDgwjmZq5pFpLzq/TxOl5/YyNuKZm/KYqE8OYqXMAXF4vGA
	XLH1w0ZEwJ+YP9rIUIsRdHybWT0tx1L98In9JEYrSwHd3/c1qb0bbade5WH+Poweqca31tdAuMk
	qgHe/hQkZ8AUzxLk=
X-Google-Smtp-Source: AGHT+IE6Y1fcOD7teBZT2uIjq6ymsxElS+a5WqLYb6PxcGWb/RDRt49Ka1e9aDellQzGFACgV7MBgQ==
X-Received: by 2002:a17:903:8d:b0:224:c46:d162 with SMTP id d9443c01a7336-22de5fcee3amr11816975ad.20.1745873882064;
        Mon, 28 Apr 2025 13:58:02 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7754d52sm8607024a91.19.2025.04.28.13.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:58:01 -0700 (PDT)
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
Subject: [PATCH v3 33/33] drm/msm: Bump UAPI version
Date: Mon, 28 Apr 2025 13:54:40 -0700
Message-ID: <20250428205619.227835-34-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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
index a63442039e22..4117c866350d 100644
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


