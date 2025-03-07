Return-Path: <linux-arm-msm+bounces-50610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA28A560B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 07:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A83A3B21CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168D5154BFE;
	Fri,  7 Mar 2025 06:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCjYjSpC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8EC33DF;
	Fri,  7 Mar 2025 06:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741328698; cv=none; b=oPGuGI3R11w5dgV5G/rynCds71X6HpdawwbmROR0S3bDPUkwCHC3KLk+R+uiDQL38XLd/AWdK9v90q/T1f05H6fQAWbP6Ihv2qcSrhgInN+MP2auG2JCEHEiaLno/suB4rEWSzGtr+u81tXmq7SwjsWL7HDpLNehvyfbI5m8YXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741328698; c=relaxed/simple;
	bh=OhnevS0yjPAh9IfYEi70Vj0NzmzZFYRG0Y6dMvvdbps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jqfYWASjnW4N/Z8r/rotXwNJVIVCKEiwmuzC5k9lKNVmc3gf3+At+52rtEffVZAUAigbbiUlNqi61S9QSyR9AC9I4zoLEG6TqujCfAF+40sXMswAGmoC3nzNr904PaVh1z27z6NSA5UlZDEC7mCeTbXwhJJG+Z+sVN9Qs8NNMbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCjYjSpC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04933C4CED1;
	Fri,  7 Mar 2025 06:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741328696;
	bh=OhnevS0yjPAh9IfYEi70Vj0NzmzZFYRG0Y6dMvvdbps=;
	h=From:Subject:Date:To:Cc:From;
	b=gCjYjSpCBRT24c26wKgBDWgcnZGUIBIKSWF7ZlQFkzehRRTsxIDCJdayC5eDUdyXr
	 sR0p6eIh4P4bF8Oq1fhXs39sXDc34uI45LUR4+ktKEIlsU3XyuOA45JwTzipGBguE3
	 N3z7rwLfRmmRZRPtLj8a8k/jejeNQCiSuPiAkHTCF0VmxYEdk7zW2/V5DxPt6R14hB
	 51bYnL+9wXlhK+S2CrRmGl3LlGqJt7lYIpJCyse4nyy/diTR43WXGdVfCw6iZeCXzg
	 dy270sgObU+vEiBHQkR0kBbXlZyQpYsxFilbbwDFXCJKnMM4QpHfvgyvTKK72uEA9j
	 MFseUW4gwutEg==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH v3 0/8] drm/msm/dpu: improve CTL handling on DPU >= 5.0
 platforms
Date: Fri, 07 Mar 2025 08:24:48 +0200
Message-Id: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADCRymcC/2XMSw6CMBSF4a2Qjq1py6t15D6Mg2t7gZsQIC02G
 sLeLcSBj+E5yf8tLKAnDOyULcxjpEDjkEZ+yJjtYGiRk0ubKaFKoYThbrpzsDNF5HbuudDWQuH
 0TWhgKZo8NvTYwcs17Y7CPPrn7ke5vW9KiV8qSi54LS1UNZRV0ehzTwP48Tj6lm1WVJ+9/utV6
 g0Y1yjEUpr8q1/X9QU+FoOx7QAAAA==
X-Change-ID: 20250209-dpu-active-ctl-08cca4d8b08a
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2793;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OhnevS0yjPAh9IfYEi70Vj0NzmzZFYRG0Y6dMvvdbps=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypEzq6PX4jb0sw/7v51d+IYnAFNlX/ooVBZMo
 QxDD1ov8qCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRMwAKCRCLPIo+Aiko
 1X5EB/0VUG/MQqtatCn087kw0gnuje3o8i4wDbOrn2aUdX42nH0lwpnBkqJf3JWGv8QaR9YmzvS
 9iaFVIFlL6d5xqad+e6C/WkBoz45HSzClQGRomaVQ5KpFuV0FIHHEbLxVKMkkvW7myesC3Skzy5
 Yga6pCMm713rDjL5Gv/Eks1mkfZC2Zb3MMY33ZmWcHnDrXt/4eBwZQ6FxSkaX4cYBrAXr0GhHoE
 QBLgtC6nkbTUC1BdA6GvituMDVLBDRrC7g1FNzwJ3JIlcZPGsn7PXXfU9kQFfiJWgmUoJgVQsXx
 GS+elem72JzaVcC2jzEkvRbfQziRavJ94Ad/zCuHWljmYpNH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Since version 5.0 the DPU got an improved way of handling multi-output
configurations. It is now possible to program all pending changes
through a single CTL and flush everything at the same time.

Implement corresponding changes in the DPU driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Rebased on top of msm-next
- Link to v2: https://lore.kernel.org/r/20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org

Changes in v2:
- Made CTL_MERGE_3D_ACTIVE writes unconditional (Marijn)
- Added CTL_INTF_MASTER clearing in dpu_hw_ctl_reset_intf_cfg_v1
  (Marijn)
- Added a patch to drop extra rm->has_legacy_ctls condition (and an
  explanation why it can not be folded in an earlier patch).
- Link to v1: https://lore.kernel.org/r/20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org

---
Dmitry Baryshkov (8):
      drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
      drm/msm/dpu: program master INTF value
      drm/msm/dpu: pass master interface to CTL configuration
      drm/msm/dpu: use single CTL if it is the only CTL returned by RM
      drm/msm/dpu: don't select single flush for active CTL blocks
      drm/msm/dpu: allocate single CTL for DPU >= 5.0
      drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0
      drm/msm/dpu: drop now-unused condition for has_legacy_ctls

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  5 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  5 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  5 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  5 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  6 +++++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  2 ++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 20 ++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 25 +++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  2 ++
 18 files changed, 67 insertions(+), 48 deletions(-)
---
base-commit: 565351ae7e0cee80e9b5ed84452a5b13644ffc4d
change-id: 20250209-dpu-active-ctl-08cca4d8b08a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


