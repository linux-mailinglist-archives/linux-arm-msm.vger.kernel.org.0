Return-Path: <linux-arm-msm+bounces-744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FF47ED781
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 23:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 393981F23CD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 22:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191F443AA1;
	Wed, 15 Nov 2023 22:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvr6X1ZY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01DF01B1;
	Wed, 15 Nov 2023 14:44:19 -0800 (PST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1eb7a8e9dd0so71178fac.3;
        Wed, 15 Nov 2023 14:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700088258; x=1700693058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x+9rvLvdX2lnfyBf2vZqm86qvEOYTf/3b77ELh1X624=;
        b=bvr6X1ZYQtDjBvoOu7MgKyONeMF6dWAxg3AJaO0jTNF6GPTJV1ff+k82O9u3jXIOqk
         6bI/7q94cHJwqICOtxIMAoHHr5JJ7ea1jPRDEIjZh6pMM2Pta6q6nzZLSNgcJDrqV3n4
         nMs2iEWM7EPIwexaZG9tv7Tk5aq6fTx2RErH3N52Et9WnohImnj8X0eCrMMohQjGqez4
         qFDOQbYBAHQlUi7MQf75c490SYYgdKwEwbNf8uLjNbl3TVrtXUPfFmfs1zDnPwQEM/nw
         SvHyeDLZ9UMJW9b7rdSu2ULkmsauvbtNVDfNIGlgnMuOgCy5taKoQxVcBy1EdYA6A57n
         eRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700088258; x=1700693058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+9rvLvdX2lnfyBf2vZqm86qvEOYTf/3b77ELh1X624=;
        b=s4kJUBi4wiwIBamx8ZVI8a7gPjm/r0oD8iItTAXSrquWOSJK+49FG7FolSgA/7O5mD
         4wi5+qSKnH0PXy7MTVRqHNZoRktpVrWASbhl4QUyCdJde6/KjYwptcv676DgquchIP/K
         CJPLEvMvo8whLcvDq0TqAkSBLSXdvHWhw964jz4UwKleuNKB6yWDjhjGbanW9pJ0tWem
         EN6U7pH8fovh5iLcrHcGXsJw4HOWO+iy15Q8aX2u2c1Hl1M02M5n9CTaztnGBO1xCz81
         d0PT1qPf7pwzlcMW2M1McbAu6/mgJJ10lvvw0YPXtutzfBxKOg+MtRqAI6SSuV6qfO+Y
         tsdA==
X-Gm-Message-State: AOJu0Yz1GGsS7KG5MuWiYxV0cniO7XFSikxXNZ147+75o/A4Sn0fiZy2
	IkoMDDEsH8QmS2M4+W4dvlk=
X-Google-Smtp-Source: AGHT+IGGu9YvLECkiUq/lUX8OxBjWJ2MyG6XyX8H/OEa527Kf4K81t3xUlEcdPUh+ltOWMuaIPKgcg==
X-Received: by 2002:a05:6870:b48e:b0:1e9:8182:a29d with SMTP id y14-20020a056870b48e00b001e98182a29dmr18474426oap.41.1700088258174;
        Wed, 15 Nov 2023 14:44:18 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id r4-20020aa78b84000000b006870ed427b2sm3358092pfd.94.2023.11.15.14.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 14:44:17 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/gpu: Move gpu devcore's to gpu device
Date: Wed, 15 Nov 2023 14:44:09 -0800
Message-ID: <20231115224409.240935-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

The dpu devcore's are already associated with the dpu device.  So we
should associate the gpu devcore's with the gpu device, for easier
classification.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index cfcb4317afdb..3fad5d58262f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -292,8 +292,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	/* Set the active crash state to be dumped on failure */
 	gpu->crashstate = state;
 
-	/* FIXME: Release the crashstate if this errors out? */
-	dev_coredumpm(gpu->dev->dev, THIS_MODULE, gpu, 0, GFP_KERNEL,
+	dev_coredumpm(&gpu->pdev->dev, THIS_MODULE, gpu, 0, GFP_KERNEL,
 		msm_gpu_devcoredump_read, msm_gpu_devcoredump_free);
 }
 #else
-- 
2.41.0


