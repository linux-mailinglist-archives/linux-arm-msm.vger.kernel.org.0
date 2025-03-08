Return-Path: <linux-arm-msm+bounces-50685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 219D1A57892
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 06:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFA6B3B6534
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 05:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5A51A5B8C;
	Sat,  8 Mar 2025 05:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4I4z4V+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A5D185B67;
	Sat,  8 Mar 2025 05:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412323; cv=none; b=FQXxjaVgDSTkyqQKkC2LicqlKAG4f7mTPZMZgHMfvYfmV+2mKo94+WwBhGjVTHxQcQyZ74My1GwPrDd4LnxWNqDTd0eDfmfQcYXCn7b0PICuW5J7MpPC7z47vrbuo+CDXdLBkV/guSMNcN4scbomAlRIOWKd41LnzGcaRJQ3Bj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412323; c=relaxed/simple;
	bh=FDtosoc8onqKNTJS3BmCyd4MsOqoUDDRptAoDNrSAWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OlmZ1u39x04IkT8OoMvSyRAb9HjRDhkPoU4OW2qx79kVo5+rxzveEttWAUkN1EiHxjxEybFx3EQ7jvWiqeaz4IXuzo+iUkRVfUDnQqEmTm8HAlnYLOGvtdz7LEt3jTVOXSbLsv800onoL8CnTOoRoFJHPjP0p8+Kr0F8Dn5T+10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4I4z4V+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F116DC4CEE4;
	Sat,  8 Mar 2025 05:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741412321;
	bh=FDtosoc8onqKNTJS3BmCyd4MsOqoUDDRptAoDNrSAWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M4I4z4V+fzKIzOu/PMwNo+1cXjj6k0A+k2c74E5D6g6nfZJAnJAileu3ik6zyfeoZ
	 fi56PFxaLCIRJPrQlSyXoNs2MVrPOK0xWSuac78fUH1Tee4e+QhS+EMdpXqJcDhJiw
	 HbCXAss3vTyYNvUTPP9/tJKWfL6Bi9r4ZAS4BMCCtUxD2VN33WjDLixoCJxIcRUZXW
	 dsFhA6s22MqxuvPY4HeZkZvmfUX7wOc9JHngsxUS2gAVVP12wHnlieKXuL7CF9P0Jm
	 HFXYlF9orQDhLAyLbyQG+1xZ6y3K56r3LDpETQFh3I9+IVmqlRcw6lDvWzXvH9J+Ey
	 XILyII4Em6/Ww==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 07:38:27 +0200
Subject: [PATCH 4/5] drm/msm/dpu: enable SmartDMA on SM8550
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-dpu-rework-vig-masks-v1-4-f1b5d101ae0b@linaro.org>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
In-Reply-To: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3070;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vsSWljJKqcGPYKBGji+J7djNw3+R9IwpvZxdugaBxqY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny9fTf2V6d5zYkpVs2C1OHP4UIhl/T3Xlv4AEo
 CaSs+7yAtqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8vX0wAKCRCLPIo+Aiko
 1VxaB/9EegACg1zIQI1EC2ClSM+LwXNU1Dyh3NQ+ZJFr8WZgJHFJUFjGZD8/O4p3KBCuVnhspsg
 nam4W284vzm/C/CEzGz7R4MroVQq4gNOZ/BG2dl7yDIFgUQ+0Za0cP1TCEmL7Ce8FqOV+8Oz7kF
 ipSL7IecXVwTI7t6WuLiN+1kA371teotB2aA2CwVv6CgtNNr41iv9fqrMvkEafInp0kNE1vH9Iz
 jx8OA/FXZBuCgr/19n4s9LpNwiO6Cf4wOE6xobYyN66uRqxNB9RlkkYmP3niQ4QphMgD0C1hXdj
 JPkXVg6w2KTO+fp2ihxv2wUBaeqy3Ggt23Pn+4HWAkHMQlgU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

In order to support more versatile configuration of the display pipes on
SM8550, enable SmartDMA for this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index a5b90e5e31202900c0bb5bc4a705a6b269005474..2379e119c8c5cb9d68cfaa4feea990ce7e24d569 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -66,70 +66,70 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_12", .id = SSPP_DMA4,
 		.base = 0x2c000, .len = 0x344,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 14,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_13", .id = SSPP_DMA5,
 		.base = 0x2e000, .len = 0x344,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 15,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5


