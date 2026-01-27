Return-Path: <linux-arm-msm+bounces-90722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H6GEXiaeGk9rQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:59:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B595B93422
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A070030022B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD70F343201;
	Tue, 27 Jan 2026 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngkREVgu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8911C2BE7DD;
	Tue, 27 Jan 2026 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769511540; cv=none; b=LOyD5OkjV0ZInDB7z0BhJDgbeOTc79pOkWLCL+Sj9OUjG8D3qbHduLtP37SPWBQvsCY9aAcgkVeKZ6/nKxJMXJg00Vlj+yujIyCdX4gF+gQuz14zDPMwYTkOY2ZBEepQwvIodwrL+IgBLSPTqQs7n7x5FK+jUf+elDwbNme+HcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769511540; c=relaxed/simple;
	bh=0i2nH7Z+Jm/vbR+qFCnPX1IGIFt8Sm49hrVD9er0bwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dIQxIG5MC+h1ZhT78BIEcYcmG48e4iKLqioSm9oL8ReN9xtJu0N32y0nOHQD/1a23poQX3FjsBB2n1OkCSYqF8/gGZsL8vhmuik3B3PPehbck5KnCa11LkLpJ1YjmG/ttNBW6rMupv7/w0l0PzGoyQI1DBNyNr6gR+oKPoEXK+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngkREVgu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E71C116C6;
	Tue, 27 Jan 2026 10:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769511540;
	bh=0i2nH7Z+Jm/vbR+qFCnPX1IGIFt8Sm49hrVD9er0bwQ=;
	h=From:Date:Subject:To:Cc:From;
	b=ngkREVguznNQxpEPFD7I0KcA64CARW4APVYOrDA020nRlXk/HW0az/2EPEQqWDEux
	 d5C0cAwJIyDDDr7YJa27ybtyal57cyJ4oKbNQD0n2sW7ryYEUc81TiCN9O4eCW7ME2
	 C0XkBjgQSKBcyUrjBeytEo/tMX1sIE6KyMxx6zR6E4OUnfhmSRvY73tjUo736SWZsN
	 SXeGFpu6ju723AnyxQLhZfap4I1fTTo2+tSv951LiR58jBNPgjvWWjRBUGbhIKT3/9
	 vlqtZW1BkZDwkzt6vUXfd6BKqi0uB2tc8w/4OfXqlpgfIxURIIBVRejho6szKir08e
	 mqRziSvZOiCOw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 27 Jan 2026 11:58:49 +0100
Subject: [PATCH] drm/msm/dpu: Fix LM size on a number of platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-lm_size_fix-v1-1-25f88d014dfd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAAryL7naB+2OMqEVK61UJZaEQk3j3pc
 wZmEkQMhBE6liDgTZEOX0BWDOw6+gU5ucKghNJCqppfx0mWb7uJ9KKZ6eFOo1VCT41zLZTuDFj
 0/+yHnD8UlASrYwAAAA==
X-Change-ID: 20260127-topic-lm_size_fix-d6ec206b8dd9
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769511535; l=11008;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XB73+kA+RbsS6hWgZGE1XQzO2Ccd74+TrD3sPEdK+pQ=;
 b=oJ9UZ6Twim06vzNiQ8eGdESflArxxuxfEv69tO04jYL6MZM+QAdbKPLi4JTsmhJEyqNr5erBl
 sgqgLmIiHS+ARHk1KgXmLsSAoRFwKw5hBSqsaQ7CVIJTjg5qq2Te8SB
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90722-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: B595B93422
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The register space has grown with what seems to be DPU8.
Bump up the .len to match.

Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
compile-tested only
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
 5 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 303d33dc7783..9f2bceca1789 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -133,7 +133,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
-		.base = 0x44000, .len = 0x320,
+		.base = 0x44000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
@@ -141,7 +141,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
-		.base = 0x45000, .len = 0x320,
+		.base = 0x45000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
@@ -149,7 +149,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 		.dspp = DSPP_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
-		.base = 0x46000, .len = 0x320,
+		.base = 0x46000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
@@ -157,7 +157,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
-		.base = 0x47000, .len = 0x320,
+		.base = 0x47000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
@@ -165,14 +165,14 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
-		.base = 0x48000, .len = 0x320,
+		.base = 0x48000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
-		.base = 0x49000, .len = 0x320,
+		.base = 0x49000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index b09a6af4c474..04b22167f93d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -134,7 +134,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 static const struct dpu_lm_cfg sm8450_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
-		.base = 0x44000, .len = 0x320,
+		.base = 0x44000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
@@ -142,7 +142,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
-		.base = 0x45000, .len = 0x320,
+		.base = 0x45000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
@@ -150,7 +150,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 		.dspp = DSPP_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
-		.base = 0x46000, .len = 0x320,
+		.base = 0x46000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
@@ -158,7 +158,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
-		.base = 0x47000, .len = 0x320,
+		.base = 0x47000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
@@ -166,14 +166,14 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
-		.base = 0x48000, .len = 0x320,
+		.base = 0x48000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
-		.base = 0x49000, .len = 0x320,
+		.base = 0x49000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 465b6460f875..4c7eb55d474c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 static const struct dpu_lm_cfg sm8550_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
-		.base = 0x44000, .len = 0x320,
+		.base = 0x44000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
@@ -139,7 +139,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
-		.base = 0x45000, .len = 0x320,
+		.base = 0x45000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
@@ -147,7 +147,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.dspp = DSPP_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
-		.base = 0x46000, .len = 0x320,
+		.base = 0x46000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
@@ -155,7 +155,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
-		.base = 0x47000, .len = 0x320,
+		.base = 0x47000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
@@ -163,14 +163,14 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
-		.base = 0x48000, .len = 0x320,
+		.base = 0x48000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
-		.base = 0x49000, .len = 0x320,
+		.base = 0x49000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 6caa7d40f368..dec83ea8167d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sar2130p_sspp[] = {
 static const struct dpu_lm_cfg sar2130p_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
-		.base = 0x44000, .len = 0x320,
+		.base = 0x44000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
@@ -139,7 +139,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
-		.base = 0x45000, .len = 0x320,
+		.base = 0x45000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
@@ -147,7 +147,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
 		.dspp = DSPP_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
-		.base = 0x46000, .len = 0x320,
+		.base = 0x46000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
@@ -155,7 +155,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
 		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
-		.base = 0x47000, .len = 0x320,
+		.base = 0x47000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
@@ -163,14 +163,14 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
 		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
-		.base = 0x48000, .len = 0x320,
+		.base = 0x48000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
-		.base = 0x49000, .len = 0x320,
+		.base = 0x49000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 7243eebb85f3..52ff4baa668a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg x1e80100_sspp[] = {
 static const struct dpu_lm_cfg x1e80100_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
-		.base = 0x44000, .len = 0x320,
+		.base = 0x44000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
@@ -138,7 +138,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
-		.base = 0x45000, .len = 0x320,
+		.base = 0x45000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
@@ -146,7 +146,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.dspp = DSPP_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
-		.base = 0x46000, .len = 0x320,
+		.base = 0x46000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
@@ -154,7 +154,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
-		.base = 0x47000, .len = 0x320,
+		.base = 0x47000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
@@ -162,14 +162,14 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
-		.base = 0x48000, .len = 0x320,
+		.base = 0x48000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
-		.base = 0x49000, .len = 0x320,
+		.base = 0x49000, .len = 0x400,
 		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,

---
base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
change-id: 20260127-topic-lm_size_fix-d6ec206b8dd9

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


