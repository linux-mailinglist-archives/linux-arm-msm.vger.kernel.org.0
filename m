Return-Path: <linux-arm-msm+bounces-12249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9525B860515
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 22:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B16601C238A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 21:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4945312D1EC;
	Thu, 22 Feb 2024 21:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C61kuCGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7301773F3D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 21:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708638476; cv=none; b=NLI5/sbhrTa8xBs8d6I0kpDbxsJ48kKcZq3tDB0rlPXJLoS/9jOBL44c3MactZEaWgcfIbSinbK22RN50os/nweqqLq6kENcFxtk+yjOnCvClM4iaaKS3evU2pSQ4g21jTDUIH4RxmGMvqy6eFqIR9b1RflJ2Ffly1SU+8XgnFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708638476; c=relaxed/simple;
	bh=Mlmw0HVUAhFZVbUgUT+SpXowG3yNg4H4nNZdYPrO3tM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P4T+v0syzlKTtb51j0QaIpLITfM6JLrBAbWj+s02eSj7opZFn2yUwU0UtvMqIUlCV7Erl3i/0odNQHtuXMYSusB3jfd6vpfxu0EK9LmBLJ04Gcc+Q7zrpcOJMGQ0xZKmLLW4fCBsa/o63WG3s/ZCjhUGKQ8wlvRW8/scq7r/aao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C61kuCGt; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512e01b3da3so333914e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 13:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708638471; x=1709243271; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=27JArFoy7FgcSAJAKndgjFV/Dxo1giUsa3CZ68xb2WY=;
        b=C61kuCGtEeObR/m3IWsmkA+DDOYsl7ozG+2bG7ebb1kBNYfGb5ESF1s+1Z21Za8yL9
         0Ea5P07NCr3qG50gsKQd+MuHMKxUOxUT36HP6SRgSmdB0RL88r4AJTFOrFw62qkikKBA
         6I1KU2Gzm/uaYiktJPfT+fo3fFPIlekzLaB0Z6tUEnpHEr4BUWPN0R8KoofQKlUUu6uI
         Tnk6lJP7xxvjZ7WGznEDsabQVXQxa+sOhMoeeC3lhqPQ+grmlogKfQ3yNhGmHnh7Hd8s
         hUmqV2T915s8J5nT9QJoq3uSyyZQrxcC1iuIeG28MnRwdJZL2szDO8F4YUWNAPRV7OaS
         D72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708638471; x=1709243271;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27JArFoy7FgcSAJAKndgjFV/Dxo1giUsa3CZ68xb2WY=;
        b=q1s8uCnpdQUEfseb7Ao0eKtfZS//VZLCjy7kBriiy+5JuzFk/YZ9QWUKwV8Qb/RBeF
         OyF+82/eYNVn3m9TbZSz4zwpcMBuxaka5jcIQskQDO3WusNuc8arV+ugm0AniomA7eIz
         FkhiUsFhETzBXzaGKmo5AlKIE7dc0JRWOxcObjP0Mi8fjtrzPx7itA5fBFS0WoE5YmTk
         x+lXee1MWQZPjhKmNw5RPUDUnJiei+2m5PqZtX1qahm3/j40vUbkqOLDtDtVKhJ70VmK
         ZJAEZebiZOTHTW/WBko0YCZJTTl6pW9aUVaqez48EPtAgZuBtjLR0wqj+Z0UfX2ACuR6
         cwfQ==
X-Gm-Message-State: AOJu0YzcZIHDvIiUDKTzIuC7AWS6zNol4eqHzBGU83cM7ra9tmdSGvLk
	Mn8VK4R5fI5Q0tpMvDlTY3XwEMXSAvLoSfabveHhr0w3ItnsqkEvawZijijuffM=
X-Google-Smtp-Source: AGHT+IGeTH/W80T+tFl6ii56yNpwnGORtLpMr2fJHrzihvoDvLmDGgS7QqhvQECjABGJyan2PjHAIA==
X-Received: by 2002:a05:6512:3e16:b0:512:ba3a:5368 with SMTP id i22-20020a0565123e1600b00512ba3a5368mr318345lfv.48.1708638471403;
        Thu, 22 Feb 2024 13:47:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r8-20020a19ac48000000b00512d4acc9f8sm744918lfc.254.2024.02.22.13.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 13:47:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:47:49 +0200
Subject: [PATCH v5] drm/msm/dpu: add current resource allocation to dumped
 state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-fd-rm-state-v5-1-4a6c81e87f63@linaro.org>
X-B4-Tracking: v=1; b=H4sIAATB12UC/23MQQqDMBCF4avIrDvFhIjaVe8hLqKZ6EBryiSEF
 vHuTV13+T943w6RhCnCrdpBKHPksJVoLhXMq90WQnalQdfa1Fr16B3KE2OyiXBySquub8zUdlA
 eLyHP71MbxtIrxxTkc+LZ/Nb/TjaocDKtV4a8bmd9f/BmJVyDLDAex/EFUKuVaacAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5724;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Mlmw0HVUAhFZVbUgUT+SpXowG3yNg4H4nNZdYPrO3tM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+r1g2xOlnsjm6YY9fj93OnVP03Ys6xi8qqp63z27J/dV
 iftHFfdyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJhG9g/2f8Z4XE31kfpnKX
 Cp6JjNqhdiy3lcfz6O1PUr66lVoVUzMvXFx2tb3QpuOGYfjbXwbpKV05O5zjJy2f8OSYenPMvY1
 FQhpsTlnHHau4AxXOPWL+lmYp5GQx2XHjjjMqGtMD5Du/Sx5lCuEoW8DPc9bgZcUT7pLTC2L36p
 wv/e5llrXo+l3Hw15vrnBw6QQf2v+gKr7D/m7mvTZ53UJlT7/mu4d32FqFTmR8FRobxVy4kYs9w
 Tpn4qKiBQFOFVvUxRIOu3TVGZlo8kmxigsES5u/Xp50ZnEBV1ne7SmX/Ku38rodsNu878yNBeFv
 Js+c94v92XSDpjdmChtqC69ri6yJ0RCSXG+0XjTR81YXAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Provide atomic_print_state callback to the DPU's private object. This
way the debugfs/dri/0/state will also include RM's internal state.

Example output (RB5 board, HDMI and writeback encoder enabled)

resource mapping:
	pingpong=31 36 # # # # - - - - -
	mixer=31 36 # # # # -
	ctl=# # 31 36 # #
	dspp=# # # #
	dsc=# # # # - -
	cdm=#

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Extracted the common helper for printing RM state
- Changed the code to print '#' for unused/unmapped blocks (Abhinav)
- Link to v4: https://lore.kernel.org/r/20240219-fd-rm-state-v4-1-b47f14ef27c2@linaro.org

Changes in v4:
- Split the patch from the virual wide planes series
- Reworked the output format
- Added the CDM block into the dump
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 56 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  8 +++++
 4 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 723cc1d82143..9f3697e1eacb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -353,9 +353,18 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
 	kfree(dpu_state);
 }
 
+static void dpu_kms_global_print_state(struct drm_printer *p,
+				       const struct drm_private_state *state)
+{
+	const struct dpu_global_state *global_state = to_dpu_global_state(state);
+
+	dpu_rm_print_state(p, global_state);
+}
+
 static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
 	.atomic_duplicate_state = dpu_kms_global_duplicate_state,
 	.atomic_destroy_state = dpu_kms_global_destroy_state,
+	.atomic_print_state = dpu_kms_global_print_state,
 };
 
 static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
@@ -371,6 +380,9 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
 				    &state->base,
 				    &dpu_kms_global_state_funcs);
+
+	state->rm = &dpu_kms->rm;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index d1207f4ec3ae..2512c9bd08df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -131,6 +131,8 @@ struct vsync_info {
 struct dpu_global_state {
 	struct drm_private_state base;
 
+	struct dpu_rm *rm;
+
 	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
 	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 724537ab776d..1a56ddca536d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -634,3 +634,59 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	return num_blks;
 }
+
+static void dpu_rm_print_state_helper(struct drm_printer *p,
+					    struct dpu_hw_blk *blk,
+					    uint32_t mapping)
+{
+	if (!blk)
+		drm_puts(p, "- ");
+	else if (!mapping)
+		drm_puts(p, "# ");
+	else
+		drm_printf(p, "%d ", mapping);
+}
+
+
+void dpu_rm_print_state(struct drm_printer *p,
+			const struct dpu_global_state *global_state)
+{
+	const struct dpu_rm *rm = global_state->rm;
+	int i;
+
+	drm_puts(p, "resource mapping:\n");
+	drm_puts(p, "\tpingpong=");
+	for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_enc_id); i++)
+		dpu_rm_print_state_helper(p, rm->pingpong_blks[i],
+					  global_state->pingpong_to_enc_id[i]);
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tmixer=");
+	for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_enc_id); i++)
+		dpu_rm_print_state_helper(p, rm->mixer_blks[i],
+					  global_state->mixer_to_enc_id[i]);
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tctl=");
+	for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_enc_id); i++)
+		dpu_rm_print_state_helper(p, rm->ctl_blks[i],
+					  global_state->ctl_to_enc_id[i]);
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tdspp=");
+	for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_enc_id); i++)
+		dpu_rm_print_state_helper(p, rm->dspp_blks[i],
+					  global_state->dspp_to_enc_id[i]);
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tdsc=");
+	for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_enc_id); i++)
+		dpu_rm_print_state_helper(p, rm->dsc_blks[i],
+					  global_state->dsc_to_enc_id[i]);
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tcdm=");
+	dpu_rm_print_state_helper(p, rm->cdm_blk,
+				  global_state->cdm_to_enc_id);
+	drm_puts(p, "\n");
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index e3f83ebc656b..e63db8ace6b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -89,6 +89,14 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
 
+/**
+ * dpu_rm_print_state - output the RM private state
+ * @p: DRM printer
+ * @global_state: global state
+ */
+void dpu_rm_print_state(struct drm_printer *p,
+			const struct dpu_global_state *global_state);
+
 /**
  * dpu_rm_get_intf - Return a struct dpu_hw_intf instance given it's index.
  * @rm: DPU Resource Manager handle

---
base-commit: 41c177cf354126a22443b5c80cec9fdd313e67e1
change-id: 20240219-fd-rm-state-bd1218954b78

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


