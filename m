Return-Path: <linux-arm-msm+bounces-12472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFF0862AA3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 15:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB007B20E67
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 14:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B72114A82;
	Sun, 25 Feb 2024 14:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BOuBoxCs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CDA13AC5
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708870375; cv=none; b=hc4YAZa8iyn+IZikskzNB6+b9O6fOozdmLot38lgwbjk7xqau2DnK7iFLlc74gw5bTnXJw1nUALKNW4cDZMjcUhnviM7wlj237mdllwqZ9EulzySnX5T6iyEjFaFQ/xlwybtewVLQSXBQxo21T3WgwM7cq7VkNe+dyTGOkm3uKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708870375; c=relaxed/simple;
	bh=kq1wMGjAFgykNjnALUOfiwVmAiWVNLEAtKXn23jQRrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u3i7+MGbQiKqGvMWUVIPv/LJxTeLiXLxDXEuc0/asn3zKo39NR0hPt2+dqgLAa2/T8PyI361bBFE7530laloPrzac2jrKgJt69aXLaOGV+dJgKnQU3ik3X6cocJeKCEaPsxBt3N6ItMGN+if1iJ5QJ7XLlOHl+qZTyqbQQwYV3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BOuBoxCs; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d0cd9871b3so18291581fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 06:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708870372; x=1709475172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1EgeiS53bZU89cWnjtfqhJ0Xbfd+zvllvWyAXpOfzo=;
        b=BOuBoxCsWGVQvmsi66WqX9fJIewAxtDUUJFBsxQvaQJYC2wUiwly2Vmh7e82LmMzjI
         6Yl/TGelB1E5ZzIYnMVmWfl8EjmqC/BetBPg3tYhZcSQZZRkd4sS7s7qHM/7MNMnkDuv
         nxzp1LAuvI1okCeT4qcKxlw9jrjpQZXP7Z4gvZCl0bpxad0/YjH31kfAAJpP5H2RvDDO
         ZeZLfy2v3MhaGwwyDdl/vipsoOnzT+dvn4jzLyHresgUxHdYbZaj5I9Lomv0W1dKcJpX
         OHWZOYf4AXIWiNPtaVBd77zQhoKqnl54eI/GSoVzmcRI8YZSmM8U96orRd8Wlo6xPp48
         mnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708870372; x=1709475172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1EgeiS53bZU89cWnjtfqhJ0Xbfd+zvllvWyAXpOfzo=;
        b=ASDO5u7mgxir2+7RUr2xtgIm6hrJeTkmrhA0YsPws5brDxJwE564e9CeRqOlP1qBaP
         kdNSZVEJRy3Ifsbz0n+kFZnzZDPnchB0+tu6nMbfLhTYErXOGBAM7uv/Ml1ZGeLe6pqj
         jo4iL7tBxoFCqvY2665JBb24m1RL6SYRvwGoWzuOn6tVCPPgS5Z9BclCQ1VWbCkIZX8W
         7xpMJg1WCq0lvN8tAJm+pcLJNRE6ftSy/rDFNh9+osw+tMUEK8+PCFNVp0qhloeU2jYm
         PIBqwnI/T/iE+ynYOP0cwM5XgT5nnSL6CDC9D5ARHhJIE7nqGo+gxK/mnKdyFqNMrNYE
         xs8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLENJ6V/e4RGhcJtSXLdcw73XftFAcdbIjqf3YlBTdNC+VdMyrKaodYjGvTWLJ4ZT5/yVhoXc/QO4yOLinDwBGwSyvY111/ArVt8Lvkg==
X-Gm-Message-State: AOJu0Yx9n8rpKIjGU3hNZdd6sBLc39DLbR/gCaqY0jVrgu6unLBNGB16
	/FfRQHhGXtsluD93Dv7/c2mmiiGd9YKkZZWaPuE7vs+8X91BS+NqUmlEsIa/+JA=
X-Google-Smtp-Source: AGHT+IGDF5gFZnVV/AVUsZV5OqBJcSJBuROwG/Zy/8wkdCAhfxPNJhhBt9WEw3y137XfIL3bJJFROA==
X-Received: by 2002:a05:6512:3087:b0:512:d7fb:8c8d with SMTP id z7-20020a056512308700b00512d7fb8c8dmr1562188lfd.23.1708870371781;
        Sun, 25 Feb 2024 06:12:51 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id w13-20020ac254ad000000b00512e5bd2296sm522931lfk.217.2024.02.25.06.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 06:12:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 16:12:48 +0200
Subject: [PATCH v3 3/3] drm/msm/dpu: capture snapshot on the first
 commit_done timeout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-fd-dpu-debug-timeout-v3-3-252f2b21cdcc@linaro.org>
References: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
In-Reply-To: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2131;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kq1wMGjAFgykNjnALUOfiwVmAiWVNLEAtKXn23jQRrA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl20rfZatQwbsnIGDdcoW5gLJWbqK0DBCsltFny
 PS9SGAxgeOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdtK3wAKCRCLPIo+Aiko
 1UitB/wITuYU5p6dOOSUv1JzfYEmwL/GKKF0SC4IbGLssbPmSgUySdE9DqjlCPM6rj5vaVRx1Bk
 p+/ypYmnmyncdrYoAno3IJVFcBQWctCe5DyU6JvmrLk6gHLN8r+cKk7HyvhoFeH7F+WB1+S+NAt
 TpOAXWCqaCGaCqzPgN+J1h3J8xbsKPKUqymyjbnVtdrjfIfGsFqA79FJpUi4MFpCzEJMfiZod/J
 G2VBYphZ86mzY1WNA/wJlD6UN/LU9J9UEfCF0l+qulZoZ3SES+Tz369iyyFMAu2HjMlPBv76zGv
 mUzVOA9EOlu5Yn4BVYOLhdWQOd3W4KpdLHpA3kAbEB4eED82
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In order to debug commit_done timeouts, capture the devcoredump state
when the first timeout occurs after the encoder has been enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 30f349c8a1e5..3cae07bf0b9b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -126,6 +126,8 @@ enum dpu_enc_rc_states {
  * @base:		drm_encoder base class for registration with DRM
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
  * @enabled:		True if the encoder is active, protected by enc_lock
+ * @commit_done_timedout: True if there has been a timeout on commit after
+ *			enabling the encoder.
  * @num_phys_encs:	Actual number of physical encoders contained.
  * @phys_encs:		Container of physical encoders managed.
  * @cur_master:		Pointer to the current master in this mode. Optimization
@@ -172,6 +174,7 @@ struct dpu_encoder_virt {
 	spinlock_t enc_spinlock;
 
 	bool enabled;
+	bool commit_done_timedout;
 
 	unsigned int num_phys_encs;
 	struct dpu_encoder_phys *phys_encs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
@@ -1226,6 +1229,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	else if (disp_info->intf_type == INTF_DSI)
 		dpu_enc->wide_bus_en = msm_dsi_wide_bus_enabled(priv->dsi[index]);
 
+	dpu_enc->commit_done_timedout = false;
+
 	mutex_lock(&dpu_enc->enc_lock);
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
 
@@ -2436,6 +2441,10 @@ int dpu_encoder_wait_for_commit_done(struct drm_encoder *drm_enc)
 			DPU_ATRACE_BEGIN("wait_for_commit_done");
 			ret = phys->ops.wait_for_commit_done(phys);
 			DPU_ATRACE_END("wait_for_commit_done");
+			if (ret == -ETIMEDOUT && !dpu_enc->commit_done_timedout) {
+				dpu_enc->commit_done_timedout = true;
+				msm_disp_snapshot_state(drm_enc->dev);
+			}
 			if (ret)
 				return ret;
 		}

-- 
2.39.2


