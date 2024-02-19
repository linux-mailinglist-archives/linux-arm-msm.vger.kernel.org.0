Return-Path: <linux-arm-msm+bounces-11697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9788785A51E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 14:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4389B2159C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9811A381C2;
	Mon, 19 Feb 2024 13:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T7kygmmS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E8D381C1
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 13:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708350536; cv=none; b=JNbocPml8yNVG6ydEcGgMSWSjh9c9nQEPMmTkzahkco4Tfzqgozu4T/n6tEtsWoWExmNcbiPth6Z5r7PAxu2rLWE+S03Jh0jXjupdQfOx8b1LtcjEUi6ykfe3DgumQBIRo8iq+XcRRx6TMfqPiR7BoIQG6V9HsUN0pU+I/eMvrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708350536; c=relaxed/simple;
	bh=VxnAyfR+APi608UKnfr/bM0ytrt6MietQpC+Mr0o9kY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hFkvI4Ij7PXVBrvJEOiynsMDckdHYOj4eqkFCcvGaEhsxL0QV8VfoXVV+J0vRkUpNEV3uhqZmZ3k6nhTdCKWnK8RfJrwC6d0rHPyfiq2a5MJfX00L/Ms7Av/asj1Qnvnd5uve5Is5PtxnZoyq7IWqcg7PMGzvi+5tQarVH7xTjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T7kygmmS; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-512be6fda52so372745e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 05:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708350533; x=1708955333; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41jhgkJJnbHhFKY32GcChRuzAwAisfLrI12T03vWSOI=;
        b=T7kygmmSX7nujzMB+v0yK9i1WC47RFrZN9DtAi5LdOT+VeLEslsk/OZiquxf6lRaho
         UlHbnTbTJ3ZZXzKR7U2S1JqhWGyDMO3cMcjKMETMLFVwYR0R4Jn5Cf9hF5wzRGs0EE0W
         HsAPrD9w30WGpqdrPI6SZxlgkLKcgvh08JOwfMiOjnXu3Ae1snnpS4/qbbu6GHQLyTT6
         3C/ebnX/bjB7gFE5mMxnTNn9PVXDxhpJA3RftRS6k05B+syybUa0bn+6ho+H58Y3wCBI
         GOtb8g7YWguND8b7DGbrZYeVZL0R2T6xo+yPLb3F999jgPIOCbaL39/jLwcqi0yw5mE2
         F+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708350533; x=1708955333;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41jhgkJJnbHhFKY32GcChRuzAwAisfLrI12T03vWSOI=;
        b=HQ0xZW6Z4hJj20NTxOrvoRhJ+ixX3obuCctUB2ier+//qz8jrtpN4YUNBjRDD3xAKe
         Wv1k6MuXtrYVoPz5mF+Fjcl3JWdX5tTiwdIsZznnXEKFa6s6/BP3nNxCBynM2hYbUe/J
         sg/DsIVt5hQq5U8YZXrYjzgBcXzdsVDVPnnewOp87JGF8lz/oTZ4VWPtVUq1RNkV5IjO
         rBTTgQRDcGFJoj+DEo5V56eKCxN3Wy7OO7hBs3pvtOtxv6f7qTWZW2zMsqen4s7qWxZC
         Ehc5fFCGb+xpRJzHSaDU4KDJxcqDwShW5QJL0l21KMeP2o9ZN9sthjGkwyBAK2/paZmC
         gB9g==
X-Gm-Message-State: AOJu0Yznhmdbt08x3ZxopvdVYTx6p3qkrM9ZTpanmdKQWU/dAq1x3qDY
	QLDBzBCDWH7RDJ2OPljJEFq74opUhduL4ZCl0l7fz2sLHJD9CRbSJAAZ3UOMNbk=
X-Google-Smtp-Source: AGHT+IEFlN2FFmNK5ETDbGZnhFmF7nAGdxZVUIsrTc008pmqF9SIV9SESU9HSHr/Zpi9woiM3mXFQg==
X-Received: by 2002:a05:6512:1290:b0:512:96dc:ab50 with SMTP id u16-20020a056512129000b0051296dcab50mr7821451lfs.20.1708350532717;
        Mon, 19 Feb 2024 05:48:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s19-20020a056512203300b0051172bf4e66sm925365lfs.74.2024.02.19.05.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 05:48:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 15:48:51 +0200
Subject: [PATCH v4] drm/msm/dpu: add current resource allocation to dumped
 state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-fd-rm-state-v4-1-b47f14ef27c2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEJc02UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIxMDI0NL3bQU3aJc3eKSxJJU3aQUQyNDC0tTkyRzCyWgjoKi1LTMCrBp0bG
 1tQC0YenDXQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5375;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VxnAyfR+APi608UKnfr/bM0ytrt6MietQpC+Mr0o9kY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl01xEY9+WxUIUMmCJx3D5K3r0cYYidT51fB5e1
 J+8mwY9usyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdNcRAAKCRCLPIo+Aiko
 1QnrB/9aLpcHx3ftsfHhlZa3upe2lPXy/KMYQQjzHbS9/Sahk3Huc1SVUSiKmjEJrtdi5JhmT/z
 Xb3ZFJtcYa4I4qZ1OfS77/ycyNfhqjp0KRAJde8MdIK0+aNGcqfAbHUQD9yij2bmw0592opV+mh
 uePr0eDyx1X68MMNk3ZsWf89K0h2mNBLREcerBhS51yDVdiB0vZwa6yicTqIXSoodqYsqDmkVGX
 zfvDN9xW0cQzg/5c3OiLdqd1hrGxQmMBXpCN8B9ubfCxGiIH3IIRD4U7oOWy9cpj7+8DrKlwGYX
 AZLUL4OvzYYNbMlmBVb0LH2EnSN4azNAeQvfjZ3UhnF5n0rP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Provide atomic_print_state callback to the DPU's private object. This
way the debugfs/dri/0/state will also include RM's internal state.

Example output (RB5 board, HDMI and writeback encoder enabled)

resource mapping:
	pingpong=31 36 0 0 0 0 - - - - -
	mixer=31 36 0 0 0 0 -
	ctl=0 0 31 36 0 0
	dspp=0 0 0 0
	dsc=0 0 0 0 - -
	cdm=0

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Split the patch from the virual wide planes series
- Reworked the output format
- Added the CDM block into the dump
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 55 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  8 +++++
 4 files changed, 77 insertions(+)

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
index 724537ab776d..08dd38d336a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -634,3 +634,58 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	return num_blks;
 }
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
+		if (rm->pingpong_blks[i])
+			drm_printf(p, "%d ", global_state->pingpong_to_enc_id[i]);
+		else
+			drm_puts(p, "- ");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tmixer=");
+	for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_enc_id); i++)
+		if (rm->mixer_blks[i])
+			drm_printf(p, "%d ", global_state->mixer_to_enc_id[i]);
+		else
+			drm_puts(p, "- ");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tctl=");
+	for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_enc_id); i++)
+		if (rm->ctl_blks[i])
+			drm_printf(p, "%d ", global_state->ctl_to_enc_id[i]);
+		else
+			drm_puts(p, "- ");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tdspp=");
+	for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_enc_id); i++)
+		if (rm->dspp_blks[i])
+			drm_printf(p, "%d ", global_state->dspp_to_enc_id[i]);
+		else
+			drm_puts(p, "- ");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tdsc=");
+	for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_enc_id); i++)
+		if (rm->dsc_blks[i])
+			drm_printf(p, "%d ", global_state->dsc_to_enc_id[i]);
+		else
+			drm_puts(p, "- ");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "\tcdm=");
+	if (rm->cdm_blk)
+		drm_printf(p, "%d ", global_state->cdm_to_enc_id);
+	else
+		drm_puts(p, "- ");
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


