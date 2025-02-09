Return-Path: <linux-arm-msm+bounces-47267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A80DA2DA80
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 04:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41C51165C4A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 03:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF3A243365;
	Sun,  9 Feb 2025 03:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UnN3QeKA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89FEEED8
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 03:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071297; cv=none; b=KShYSWmN+Zdr3jKKVbzhIvwxzVnebFlzcwNgxi9NNt9cMJoJ/Cn1MfpGe9/r0xzEZVQ9OMmt9fCOqGfj7AXzSdQU5ifR45ew4ZgVIuIQ2vf3SfBNSKKFuT6TiyGhAO5qp12oDxBEjYjDs2o93j/f2OOUSE5GgzV+b06K4YlDK3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071297; c=relaxed/simple;
	bh=AzzOh5VbF1xgAFQDr0y7LJ2KKNxSxWjiNvu2zCJupLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ERTjL0uo5MKVa+duC57CSdwqfD6Mk1Wu/9tbUC4gdXiB3Y5pRzx+HkPzg+Cwa72OpvWwYUZG+icKwTVHRj0Qch5nO07iHQY59Wadtl2Kvq4kiGs6hHHfTIr//7vM9OtoFs80v1V1xSTVOLz2D8/YaIgitZ5XCa4vCU/dy6u62IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UnN3QeKA; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54504a6955aso836780e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 19:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739071294; x=1739676094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YP4MdvoMBcZLNprvBXn4El+Fj4ia9ZTDKakpTuuOOAs=;
        b=UnN3QeKAHxQpc4qlfZKJhd4rim257NJXdOv10RFqVcaYKKmiKEMce7PA2xtxshRhqN
         sXVCYCiFxhgkad6+IQ+2EG5+qBmZToKjkTQQWpOWq8oM8JTTElcmo7qloREvktkGpRVH
         I9k6aHTua1k091gVIZF5oHJtvJLYw7b4wrhS/ljGoaz99hVpgbo9WTy3EuGnpFwirX+c
         r1F4bFrkrdrcV7dfBojmWNY8HeDBOtvA4c5yjvyXogYkU6202LDx9I/O5DLgA21lkG7E
         xLe2h1g3Z9gxCJSOJ+3HHE07SZEfc95iUyUhK0wG1iZ8eFBaPOocTQj6XxzYz97XoZcP
         8Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739071294; x=1739676094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YP4MdvoMBcZLNprvBXn4El+Fj4ia9ZTDKakpTuuOOAs=;
        b=iEgEN5Zi64hDoJi3SiY6poqciqIRE7Kkczp4wY6JIUFGxNEQW4VJyNACcMwgiUO3fA
         g9ZuCvSSI916NTALYRxGVCTWV4MriOPIklcHjyOZsiJR+ChwY7e9u8rC4DvzBAy5m3+9
         tTtfvTdyeDkPeHDc+gIUTn3Vnw9YLaH+Na4bOSSfNDVtMOLfq3w5RiohwJ3/s4ojh1Fq
         6Azp3R3gzqlh4DhmJAMhow2TILtHmZLYzE6mpybR1uz3paOcx+kY8JmrLOj5NMZ6Aq1u
         FpOtfhgYQMHDQrKs8h7iTpZYt0aH3Y8nIPHDJ2glGihprrhJ1aacDb3zYMg850yDdzDV
         OQ0w==
X-Gm-Message-State: AOJu0Yz1w2yRLpMniyLqZfIUHuB2gxxkgUGLL8CoiqP05SEa5alRbwL9
	D2AA8fZ/EFy4jJt8bWLk3qIAvkiXwcROuCNjOQ3DW75IXPWgBZT5Ra0zl+i8SKE=
X-Gm-Gg: ASbGncvl1OieebmCCVY5Y/O5XtF/BYssIuPggPebfmOaNl58tyvizH6f09Gn/0bNJ77
	waYBYdh0VoFTexJ6Jk0XB/BIhrFdAUKeNplToAKwy0jN0f4LxuXQQoG5kHBgdWuBdqOPUyyom32
	4deEIIyaHocUYMKjzIdRmE2a8gsZalzeAE0t2Fqs9hlKXxbkhvEn4zuHdu9bf8LnQhmG3hQehOP
	tPWzi6HFcTohprBxS8uqqUyVrK90f6V451OHVf/baIEP1I20/qKl70C0VWFLxB4DS3KUHX+9MaY
	u06X1JXwBm5YxuGZdjPwlmU=
X-Google-Smtp-Source: AGHT+IHT7nTiAdKWQeu3k8QQPa1bQZIcSiuifSUIzIIZnG12uYB2K3/4y4M3apFaH6OaUNsZa9MNBQ==
X-Received: by 2002:a05:6512:2316:b0:543:9a61:a2e5 with SMTP id 2adb3069b0e04-54414aa87c8mr3054455e87.23.1739071293681;
        Sat, 08 Feb 2025 19:21:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 19:21:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:14 +0200
Subject: [PATCH v5 4/8] drm/msm/dpu: make fix_core_ab_vote consistent with
 fix_core_ib_vote
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-4-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2751;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AzzOh5VbF1xgAFQDr0y7LJ2KKNxSxWjiNvu2zCJupLo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8wbEoQjB6wQCSSdRKzM+SCwM5gypX8YeKBP
 ui6NfvZgOmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMAAKCRCLPIo+Aiko
 1f1IB/9yXGycsTIgai3Ycx5zE0WAn9SRkd3ZTPGkvT6nN/1olXIWl0yfr5urQEcc/Z627VFf6zj
 4UOdY+5tBukXG79csVVpw2WZqYr8vk734G59APRvZgRCu09G/df3tCXXhks6jNzLzWdfU5i7oOv
 jzk2XQtIApk+SFZau1M2eY5Mf+AitQx5lUGi9DaGaIuo05S6VavA16tjhUDepElFQK2Xl34AbYa
 w0dszxG26uUR1gaDLxGKWwUvcoDzGE6ej2PNsTrjeHKrhEdrzZUDlNzTZ01OGb9R9C5nlBDpvra
 IrBuQRpBJvzpPW0P1LZ76Pvz4Pi14cy4xFMV9IIcLZc/Kkvm
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The fix_core_ab_vote is an average bandwidth value, used for bandwidth
overrides in several cases. However there is an internal inconsistency:
fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is defined
in Bps.

Fix that by changing the type of the variable to u32 and using * 1000ULL
multiplier when setting up the dpu_core_perf_params::bw_ctl value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 7263ab63a692554cd51a7fd91bd6250330179240..7cabc8f26908cfd2dbbffebd7c70fc37d9159733 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -125,7 +125,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 		perf->max_per_pipe_ib = 0;
 		perf->core_clk_rate = 0;
 	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = core_perf->fix_core_ab_vote;
+		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
 		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
 		perf->core_clk_rate = core_perf->fix_core_clk_rate;
 	} else {
@@ -479,7 +479,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			&perf->fix_core_clk_rate);
 	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
 			&perf->fix_core_ib_vote);
-	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
+	debugfs_create_u32("fix_core_ab_vote", 0600, entry,
 			&perf->fix_core_ab_vote);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index e2ab7b3a8246c11f844d25c64354526ad162e15c..d2f21d34e501e443ec89604217929eea476e88fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -41,7 +41,7 @@ struct dpu_core_perf_tune {
  * @enable_bw_release: debug control for bandwidth release
  * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
  * @fix_core_ib_vote: fixed core ib vote in KBps used in mode 2
- * @fix_core_ab_vote: fixed core ab vote in bps used in mode 2
+ * @fix_core_ab_vote: fixed core ab vote in KBps used in mode 2
  */
 struct dpu_core_perf {
 	const struct dpu_perf_cfg *perf_cfg;
@@ -51,7 +51,7 @@ struct dpu_core_perf {
 	u32 enable_bw_release;
 	u64 fix_core_clk_rate;
 	u32 fix_core_ib_vote;
-	u64 fix_core_ab_vote;
+	u32 fix_core_ab_vote;
 };
 
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,

-- 
2.39.5


