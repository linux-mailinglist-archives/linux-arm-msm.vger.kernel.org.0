Return-Path: <linux-arm-msm+bounces-1777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B45D7F6BAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 06:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F98928174D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 05:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1104F3C0F;
	Fri, 24 Nov 2023 05:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIr/cvKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE36D6C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 21:28:10 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-41c157bbd30so7814441cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 21:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700803689; x=1701408489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+g/jSytR8KV47uGGJN5Pp83HT1uHDIXM+AadWQ9RdY=;
        b=jIr/cvKXSnjOsuNB56dW8WWkLeWhaHW7kKupAXjtuK8mSHzI/VBAHSEbIjggtxZPBL
         cQ4/WC5xaJBnk6UVq7Dk+KMIHALPJXsjN8Bvutlud+/kZ0y9GCTr4L6Z5yQqOyQmNh/B
         8vwPbgmwAqfwVHHx/Wj3cqR7mhqMZvf+xVITB3T/l8mmaIMQI+13sDu3/DZ8KB6u1gt4
         L5Uu7/XnsPCGwzBDcSZftw7DgMqnem7LP/UhdYMJQ1S+Ech/pwgP3pwhhlHjGQePjw5s
         AtUlJeJiZaeuyv+h0/KDsyuKTWflB0s4j2xR08ZKegbQYVw9MANkkb2M6KBGrItKn+tK
         KarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700803689; x=1701408489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+g/jSytR8KV47uGGJN5Pp83HT1uHDIXM+AadWQ9RdY=;
        b=dpz1o8xOvHmyEyGjnVuXU76Wry+mfPFQraevSTOO6f/j5vjo/9RcQCLPhcGm6stpsU
         ZV5QzOvoBQzXv9cvbLETpfrxf2+t3OA9rZKapAAZHF2HbfiXz+Nvs/4/5n1FYCBTYcGF
         OuncF0MpHBHEz0hCGkhP3/bAiU/ZjVvnfqNlXaiERAhXwb+PNEfxtq0t/zKLt6fnB4Jn
         FGKayyY5ElxBT67UiiqRPKlcUEkt5TpNCsgobj8oKjDePKrnlyEo+q/8c/LiOIg95zyv
         nv8x3J8FRtVgfhfRdlcpYeBDsMafaoYQXQkzr9dg8VcJbqH8T+PNZTB7lHoPVhzVJABd
         GD2w==
X-Gm-Message-State: AOJu0YxI94Yf+mi7b2mevbkyv+UDyXf6qTTOKEsJJV5KGxh/o7DrWr/G
	qYVpi++9CSESixlY1/tcO0Q=
X-Google-Smtp-Source: AGHT+IGm+xtyokx8k4hy+Buxm8YsDEwOmKBEc5pdNoy78fxzknvd/uWSJkc4U3i0/iWZVl1V2Y3C7w==
X-Received: by 2002:ac8:7c4b:0:b0:412:309f:c0fa with SMTP id o11-20020ac87c4b000000b00412309fc0famr2158332qtv.64.1700803689185;
        Thu, 23 Nov 2023 21:28:09 -0800 (PST)
Received: from localhost.localdomain ([76.65.20.140])
        by smtp.gmail.com with ESMTPSA id g11-20020ac842cb000000b004181c32dcc3sm1017819qtm.16.2023.11.23.21.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 21:28:08 -0800 (PST)
From: Luben Tuikov <ltuikov89@gmail.com>
To: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] Make scheduling of the same index, the same
Date: Fri, 24 Nov 2023 00:27:53 -0500
Message-ID: <20231124052752.6915-4-ltuikov89@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The first patch renames priority MIN to LOW.

The second patch makes the "priority" of the same run-queue index in any two
schedulers, the same.

This series sits on top on this fix
https://patchwork.freedesktop.org/patch/568723/ which I sent yesterday.

Luben Tuikov (2):
  drm/sched: Rename priority MIN to LOW
  drm/sched: Reverse run-queue priority enumeration

 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c  |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c |  7 ++++---
 drivers/gpu/drm/scheduler/sched_main.c   | 15 +++++++--------
 include/drm/gpu_scheduler.h              |  6 +++---
 6 files changed, 18 insertions(+), 18 deletions(-)

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org

base-commit: e4d983acffff270ccee417445a69b9ed198658b1
prerequisite-patch-id: d0fec7c91768937b5e22ce9508017e5b9d462000
-- 
2.43.0


