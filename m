Return-Path: <linux-arm-msm+bounces-50613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 289A6A560CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 07:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06ED13B3386
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD931A2564;
	Fri,  7 Mar 2025 06:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbAXzbP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05991A23BD;
	Fri,  7 Mar 2025 06:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741328704; cv=none; b=Xv3F5lGNjihZReg1FQdCGnEJRM4buE5wW7qJ4tQ0S+ksKMQydIbOi7IOL6dio9mojic9kRhv7NZAyZ/vu+cTFMzqH/Jhof1EykwQb6ghYzWK7iTVMRi73b563yGkg7eUu5Tuw7L4ysqHfGNaOGULnyC4aNn3Q4LGOFC/62PkPb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741328704; c=relaxed/simple;
	bh=nJoWHOMQ8q8HP76pYfSPuPBQ6x3qxxqKS53pX2IDBLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EWRrefpOPfFeBAYnOsVuy6BTCdt+gS6+sxo1n0muk3J/64ILVpMmDQBZfvaDKkh78WNd+cnoTp466sHt96k8ADrsqGipHwzPyB9AgbUQm2H8ZzZ2YaSYtTcHyfgROVAMDAGqO+7b/GpZdb3fB5mLxMqO7aXZESiaypTp8poxJi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbAXzbP4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA8AC4CED1;
	Fri,  7 Mar 2025 06:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741328704;
	bh=nJoWHOMQ8q8HP76pYfSPuPBQ6x3qxxqKS53pX2IDBLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SbAXzbP4PqqfXPNpC7j7AaLa0fIiaCe2lm52upDJmU7dwS3uhbWFoi3EYq3vgByqO
	 Uy3RAsdmRwosVmumzSKSOgQp/az7VL1dkMPTfF9XjqL2n3QJ/9PgB8IW+A5j/CV8bB
	 S0jbAIgkNtBuPnejMq17PrRXjrn6xYh1hvBZHMTuue0asJhrIzBSdsryZpu6fRFINh
	 loftolThnJxqhYsJ9MVY/48Xn/2ugzXH5LmPJlhdTRPKJh8k65YW6bv0N9jWAEMmI9
	 6ezsItBolOTEgvfwY8ASUgA9+/4ZQcY7xWcX1gwop7CHbVBFEU5XuldtUrLwYmJ7KT
	 ksbuDF/xGiUyg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 08:24:51 +0200
Subject: [PATCH v3 3/8] drm/msm/dpu: pass master interface to CTL
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-dpu-active-ctl-v3-3-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2026;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oVfKOWmTPH50k3vMdPgIIC2WrqXf0n9e3Mps/0OUaaQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypE0/QQLLH8Tc8Vq3wDQPyBTwbI1ZpZuH9xQC
 qFLLhWC556JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRNAAKCRCLPIo+Aiko
 1e9vB/924ommEply1S72q20YfRcBAI1r6VU6QVp/4u0zddnvilukGQ2rSvYuDzpdVxvTKTmu2V+
 c3RANegzKbWxA83T6XesT3em9SoGRDpgxyFcy4LW7Xcpxnq4iml8jAoo6SgT86zpTrNGCBQalkj
 7MDFs0j/XiefmeZ2RYy7oTm4vhHkWLzGgpidDiC4jcetNRM+ya+RuZfqxyo3M05F1+9FvuVcTJ4
 qjT2+UqCMg4MnJgH72qux8ia2GSU5Z7MEkMmoQM+LT6tU0NmmavAGpV42gb9fiXT983LJzsK3OD
 p1TtBPQIbIWsTho3ybni6vnTeL13PDRi9+oONMjgp3N/UjvS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Active controls require setup of the master interface. Pass the selected
interface to CTL configuration.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index da9994a79ca293ec0265680c438835742102db2a..a0ba55ab3c894c200225fe48ec6214ae4135d059 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -60,6 +60,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 		return;
 
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
 	intf_cfg.stream_sel = cmd_enc->stream_sel;
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..232055473ba55998b79dd2e8c752c129bbffbff4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -298,6 +298,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	if (phys_enc->hw_cdm)
 		intf_cfg.cdm = phys_enc->hw_cdm->idx;
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);

-- 
2.39.5


