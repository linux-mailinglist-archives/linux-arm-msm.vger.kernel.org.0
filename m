Return-Path: <linux-arm-msm+bounces-60785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A570AD37A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 15:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF9CB18967FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C522D3A93;
	Tue, 10 Jun 2025 12:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7GQc7RQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8989E2D3A8D;
	Tue, 10 Jun 2025 12:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559817; cv=none; b=itUfc+ObRA+92A14R07rAPfowzBax8PsNRP71WlB6RChhiiJah14QvP3OI2frHc4jAOQUYmW4+VNsCLK+pCYz5r2txvDd5Wc+gYoGmiV0Oam9j25Rwo5MMm1xvd/largAbeWr7Pi4FPzxHmg+4PMcIOMywFVpBBtiRQiBMa2jLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559817; c=relaxed/simple;
	bh=7QpkMQMXtn6bcXn+GLCixu8zGcxbjjq8un/lPEBMnVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A0bnHLyUB+WHOVNc718lhIeCJI7SSrtn94UrqwO94kbIDuTXlKG3BzxDc+z+EJKAXbhpcGAfZ1WgRzhSMu1z0DS/sU2D1PoDDrM/5ttOchx7nHueNWy5IMDLCkaXQ/b7865IfVLoT4GkvTUnjiCr32u77nK9UCS1LP5ZHGSHd1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7GQc7RQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35285C4CEF1;
	Tue, 10 Jun 2025 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749559817;
	bh=7QpkMQMXtn6bcXn+GLCixu8zGcxbjjq8un/lPEBMnVI=;
	h=From:Date:Subject:To:Cc:From;
	b=F7GQc7RQ+F0IJCdqY94Kv4ovWFYpciWBNBN3n3ToM1BxxreW8XTNXdwe+ckHm8Xww
	 T7IJkYouR8gd+16bN9SOt+mFg/BBfT4RiDAhEeJrtuCeRc7/QUiourBnp4xWvFn4mj
	 QE0VQ1vxJq9lezeoj3KXQEC4HzFlX1vK6wFKOX4Z6nIpURA5lILlEYUc1WN/r08hn8
	 6d4ha6j40uuJhkS7zG0Z+7s77vuR+Cyd33mjYGPIV2Hs1Vfq8pnvtngi6IVPcxXIVu
	 ZJ54mptB0ckWWz9y9wvnbFmXxlFB0kLmjqkBcwNlcZQEsULOX8+CtPH/FQ+vUaEJqV
	 /WzEIkVzWTOvg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 10 Jun 2025 14:50:03 +0200
Subject: [PATCH] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPopSGgC/x3M3QpAQBBA4VfRXNuatdHyKpIwgyk/2y5S8u42l
 9/FOQ8E9sIBquQBz5cE2bcInSYwzN02sRKKhgyzHAuN6tidDIrc2VptsV3dokpjjLXcIxFBDJ3
 nUe5/Wjfv+wEw8pW8ZAAAAA==
X-Change-ID: 20250610-topic-dpu_8180_mpl-933388eb0ddd
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749559812; l=1066;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=iE/yOryfr8u/J14k5vdj37MOoWRLYDlk7LCl9lLaqKE=;
 b=/3ym+TuMMf6qgrZEIiGeqXTPB8s739mqTCyW2nxcn3cXJjZHUCFEee6La/zDxv7RuGt7gJz63
 8iBtDMZZ6PEADjErF4GBzqzz8j7nVQW1dwSyHNPfIOEMYE/ncI4qhkn
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Based on the downstream release, predictably same value as for SM8150.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index d6f8b1030c68a428a144428b422b63b960c2fdba..6c04f41f9bacc3be2d2259d3b3e2099934f473f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -383,6 +383,7 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
 	.min_core_ib = 2400000,
 	.min_llcc_ib = 800000,
 	.min_dram_ib = 800000,
+	.min_prefill_lines = 24,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
 	.safe_lut_tbl = {0xfff0, 0xf000, 0xffff},
 	.qos_lut_tbl = {

---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250610-topic-dpu_8180_mpl-933388eb0ddd

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


