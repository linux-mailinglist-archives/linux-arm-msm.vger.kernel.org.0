Return-Path: <linux-arm-msm+bounces-50452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C9CA544A9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30E4C1889A60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915281DDC18;
	Thu,  6 Mar 2025 08:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAa4vXbj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DAA2E3386;
	Thu,  6 Mar 2025 08:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741249362; cv=none; b=VDhkcnVsVXf5rvCEaAQLta9XbmCVYAohSLsfpruUDNlgZy/kvOl6P9EDVSKoG7Z9C6mAxQIpy6QSrfRPBNZEbmmNDV9Bb2CrvG4ldBwYYp16X5f99lZESVDiJ5+NBBnr0v3Qxb76ONhgDZVvHYR84o+kdLhNEMzc7Tri6y1rgwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741249362; c=relaxed/simple;
	bh=fT03+6G5rTucsQWnUyxVVl43dK+hKfqe4LZr7gl7Kb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mT5VxkX3/n5cGwwIuBVngEaDMSIGGO2+a0ZK78sV4iE7icKJIkbdFkIbN40Cj69W1Hm/mC+mkCjhkVEs/DAHw9CfdYBCUD5aHkdM/YNlvyn0FT0RJmtFZli3PUa5vGpcRiPHPvz060kcLkSgSDpDaaWdFpnj9PXE/ijmFtRl5jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAa4vXbj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C6EC4CEE0;
	Thu,  6 Mar 2025 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741249361;
	bh=fT03+6G5rTucsQWnUyxVVl43dK+hKfqe4LZr7gl7Kb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mAa4vXbj0l7wHS1jpYZEoZxVCa/1hhXmPkSBeCVNdJgaOH2H/0cvEtH2vfaymKScb
	 rE/cUkwiweXf9FCrq2/1r6q60Jy/fMDOc4L89wsSXsmcDxYi2QwwSMjFT3jYW9H12F
	 PlxbMd8F01b6SbzQfyVuksz0yK+AiJvz3sSIMu+Vi7Ygi5EO/evF8zoHlglal7UWCO
	 hU57TWeNdKszmSDipZ95PbZY9qGi0u5MtIffekfHxUxzcKd8Swy+2MMyVGUsTuvfxM
	 hh+gvw6bmmEUE2voZkKOv9wdbNoUhies4wV7nDDxD0yduUX6DS0x4OBlvcE4CLjGDG
	 kbMY12KDv8+ZQ==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Thu, 06 Mar 2025 10:22:30 +0200
Subject: [PATCH 2/2] drm/msm/dpu: correct struct dpu_encoder_virt docs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-dpu-fix-docs-v1-2-e51b71e8ad84@kernel.org>
References: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org>
In-Reply-To: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=lumag@kernel.org;
 h=from:subject:message-id; bh=fT03+6G5rTucsQWnUyxVVl43dK+hKfqe4LZr7gl7Kb4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyVtI7mRqwuVVjTWP/aMe3udqwy8sYNoLG1duY
 pSclayXg/eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8lbSAAKCRCLPIo+Aiko
 1UZQCACIB6mll0aSulvMTwV9aVTAG6d8mbAAMUuuaxASi9Po0bRXGeRh5TaZPo3zQj5EKbmONBz
 ENodmFfUO2nU3lfJfdropq64aR4apsJLbf3XwM0emXy8jZmrTWEpJx5R8lKeABz+9OHfTh41py+
 slx2MBJdah2BEzh9SokdpBqY3mQKun1eewIifUcHYx8Lifa8Fdrha3ZIGIREy/G2DHt8jlVQRWm
 F+yTpM9bTmTGxxeKE3bTr9yWYQZXNCDHyFojqouK8VF9gIuVdJgWIcq0gPl3D3nDDPIkuQ/BUlI
 xzoVD4KVs5wyhhsTgHibX/M3Kb4lrnSEx9GmsRO3nw+prRPZ
X-Developer-Key: i=lumag@kernel.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix a typo in struct dpu_encoder_virt kerneldoc, which made it ignore
description of the cwb_mask field.

Fixes: dd331404ac7c ("drm/msm/dpu: Configure CWB in writeback encoder")
Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0eed93a4d056beda6b54c0d20f027a53c84f67db..0637be07eb293041a350161b39a6276eb44bfb42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -140,7 +140,7 @@ enum dpu_enc_rc_states {
  *			num_phys_encs.
  * @hw_dsc:		Handle to the DSC blocks used for the display.
  * @dsc_mask:		Bitmask of used DSC blocks.
- * @cwb_mask		Bitmask of used CWB muxes
+ * @cwb_mask:		Bitmask of used CWB muxes
  * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
  *			for partial update right-only cases, such as pingpong
  *			split where virtual pingpong does not generate IRQs

-- 
2.39.5


