Return-Path: <linux-arm-msm+bounces-67391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1954B18480
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FFF65649B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 15:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A98F26E6E8;
	Fri,  1 Aug 2025 15:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w/jgZmIG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42D726CE37
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754060882; cv=none; b=hWRM4mQ2/5dz6ezSnN2osYcF9sNjydeGKkAfJlBl4HCEg1CmCowCJ1flZuasMyDIxz5/6n/FSRhyAUvV2t6m0kzsDz9MGuBYoamYGfRKG3TtE8K8RL63JZL7guyXNieRcEm9dybS8afQnoOC4eD0MwHmGkGc0XY4ZOrLYoAx6qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754060882; c=relaxed/simple;
	bh=xSbmnUPPIXthlmIB0KVW45Mr6GQu0WXNqCZGA6y0yZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nU2JB7rhnFTxqxQQ/zNO15yhxdeed8q3++h+qdTbdH/fNy7q1iaxoPtvD0Wnc+FdqcTWADH02N1DYxQDtp+9Vcxzf1cti5ETKW/oLQv0FgQsbBOWy7KdhIh6mqFd2E4AY3yIv3VfGz8A9jXdXQi30KCe9PHBdVFjiIGumC3DIh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w/jgZmIG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-24049d1643aso14321645ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 08:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754060880; x=1754665680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
        b=w/jgZmIGM/72X977g68k+tvAro8SfMcjtb83LYbnXdolyxAWmL41CSywqaEG9rB5C7
         zAqs2tHkcQQWqLQPm/X0N0ci/3HplIP4MwbVwi3TCPVySeYQQN2t8ouGgpyHEm6qnBIn
         wRhW9ngc60X1HiWMTq6L2otBoceFyeMYNDLSN79YkWDULHZD7lYv+g+JTKXA6PIC4i8u
         LL6ts3HA38xCP0s76jYA1uk+F9hyTILqlqJEEnoTkPOPY2Krb99WhAIJJQN7pVQ1u7FA
         z7nbn4Ccqt5ftWVajv0+gmqbAYYZQ8gp7aEXf+Ow7z/NXDNnGjI+QzeEGkdvU0WscVyi
         puXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754060880; x=1754665680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
        b=vargZo88bHdeRUpffTegXNAJiqC3Meh7u9PXpVxlEjmfPS+UT+rPZBTDcTaEcvTPlp
         NllBUZ34tIm/vafRLNaTwb7nO8FbJWJaYZbTJSBIMCAtnurGhcyC4yP9ocrmHS9v5ABz
         qth0rULJUjxtPnH50cvBHYfrlp2K8zjihABrjGpNYnUtkE2frLdx01ybV3Phpt2Y6Nkf
         rAGVpFz7vHKgHet8L1P1mBRfFJbPoveyZp93EipNJ3I85ReNZkO5kFx51CiIqO64kJcF
         jjdXRbF/NSRBWA7mQQc2zNTx1ZIujgKLuh4iwy6bHB5Ksd/A8H3uFkveBCoGP86Oak15
         udpg==
X-Gm-Message-State: AOJu0Yw7lUH+4emOU1vxbYuXMGRyIei/gbkYBLoF2swwVCHJmMB8CRrn
	KuMiwq4ovEA++LxUZN6vF8jaZvn9NVJaQeSrQldA1cY9W/S5TCA6mOpNpewqm0OaUtg8LCRjyFq
	Kvqyf286Evg==
X-Gm-Gg: ASbGncvw6L30Rie7f0chN7L+UzE9iBE3hZI3ctQ9XjeVc37RXgJz3ja/f3jCWKbmNMO
	er6njGp7y1u+Y4odB4DGpjzWk8cAd09UMfqZ243wS1D2W8+jtzqaSwKI4pm2YIaavfsg4xH1Q1+
	SoQMU9YRpVFdFoYRGoyCuEakKquGdXtIu4bahB7sXrzDf1CVa8eYULJLXHsYcNbfqbNPh/GpCj6
	8wrmhBcNvikRsi9HHC/ydjNm3aNvJ0tUZYxS64AtTaa3/6kENznzRTsdc6bBiouFu9HXBm9rcHN
	G97nqq48zxMG0OPey8g/3Sw7ZHS3GoTYjCzqaITBAIn9WOsIcV5J/o94vFLD+ws0uPgFOlY8fHH
	8jFNf+ui2a31qq4ZGeA==
X-Google-Smtp-Source: AGHT+IH3qH1C2C/DUvH+RVcCZ2KshGNz0QCudBxgmDLP9cSlPWRBKjVKTxVWslYj7VJGc7sAdPEqKQ==
X-Received: by 2002:a17:903:2351:b0:234:f580:a11 with SMTP id d9443c01a7336-2422a44b2efmr47017025ad.19.1754060880024;
        Fri, 01 Aug 2025 08:08:00 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 08:07:59 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:26 +0800
Subject: [PATCH v14 02/13] drm/msm/dpu: polish log for resource allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-2-b626236f4c31@linaro.org>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=xSbmnUPPIXthlmIB0KVW45Mr6GQu0WXNqCZGA6y0yZ0=;
 b=uf55jKKnEF2lP7JtE+vnAiUK5b0V6GRdSs6zOt8Wg4FWSYO07vZYpVojDvT59dzvoc6lrnj5W
 14tQZKfsvBtD+dC47ohiCQYc9/Y7qa6qnvsoojWR2ih1yZn1HVbdN8/
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 25382120cb1a4f2b68b0c6573371f75fb8d489ea..2c77c74fac0fda649da8ce19b7b3c6cb32b9535c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -865,6 +865,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -946,13 +961,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		}
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to crtc %d\n",
-				  blks_size, crtc_id);
+			DPU_ERROR("More than %d %s assigned to crtc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to crtc %d\n",
-				  type, crtc_id);
+			DPU_ERROR("%s unavailable to assign to crtc %d\n",
+				  dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1


