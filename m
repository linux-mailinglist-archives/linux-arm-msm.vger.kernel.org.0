Return-Path: <linux-arm-msm+bounces-50578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EF5A55D4F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 02:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34E5A16DD86
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 01:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9839E154C00;
	Fri,  7 Mar 2025 01:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VvSupxeh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07748143748;
	Fri,  7 Mar 2025 01:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741312248; cv=none; b=IVr2nM7w/1uGg4fndazLwCX1MlkOO2iRfLX5rY8qTqWOpAisM5UKH44/5+TQt/0Z5bLaHaxvdBMBvu6vLUtTFZjKxDJQAXYw8LNJK4Fkdg8tZ0GcHFKA6jHyDf44PJMBoUBZ6oJxRbD7AhH+nmkMQaEiARbCr/U0Svj969p8f2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741312248; c=relaxed/simple;
	bh=SBPIG7jGFl35PPlGXciLwpGYDq5C+aqPbA9Zjunteo4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZNsDf0ZAoi3sDVzr+dcYjWIc+F4hmAR2+ELVk2yMIZ1BnQmxnuNsoNtZSPBJ9LEvH9i9xhCtY9iSEGMn4L0w6dryQAs5ut408YoIKXZyQPN7PBgK0syJXDU7lYyMjycqGfVa6iYcLRSok23fRqMfDxdv2CI6E9sCSJ+aVZN88Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VvSupxeh; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1741312239; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=rVR0/YI1qnfP9PhqbcZtPg5wmkc8O7eEXmX+qFp6sTQ=;
	b=VvSupxeh93VN5sGIvSftgk7TH4bB9QZ/P4IlJA3Q6Yd1ewOObCX9dxahQAi/9ReqOTyTjQoz+mujD7if75zY2sOG+ylrhCAJr7N6chkeGr4GiCj5cG+pMYMH+9UM3k7pimSutbNwnvtvmXZGwAtOO8Z6jQdzzCkyhD0jCcqmGHI=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WQqGnBV_1741312231 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Mar 2025 09:50:38 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: robdclark@gmail.com
Cc: quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/msm/dpu: Remove duplicate dpu_hw_cwb.h header
Date: Fri,  7 Mar 2025 09:50:30 +0800
Message-Id: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: dpu_hw_cwb.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19239
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0eed93a4d056..4d2589140426 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -29,7 +29,6 @@
 #include "dpu_hw_dsc.h"
 #include "dpu_hw_merge3d.h"
 #include "dpu_hw_cdm.h"
-#include "dpu_hw_cwb.h"
 #include "dpu_formats.h"
 #include "dpu_encoder_phys.h"
 #include "dpu_crtc.h"
-- 
2.32.0.3.g01195cf9f


