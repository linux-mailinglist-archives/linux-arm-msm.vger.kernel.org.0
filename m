Return-Path: <linux-arm-msm+bounces-2751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8DC7FFB1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 20:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 700DA1C20BD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 19:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93A25FF08;
	Thu, 30 Nov 2023 19:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZVdptyq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B31910EF;
	Thu, 30 Nov 2023 11:21:23 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6cdcef787ffso1323756b3a.0;
        Thu, 30 Nov 2023 11:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701372083; x=1701976883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FNcHli21vir5baYj9ku8MMNBlCqv0AKIpWf2Lyqz8B0=;
        b=MZVdptyqLtkcvQKLlmAGPE0/pLxv5Gnje94wA3qFn7urap5mGjj280hhluwjO+zGJF
         BPLteed1crWW7syB1ff26BJP/8fEFVIEwWmQF6ll3VOdmUqFIw9DPs26GLxq3IWHmMlZ
         9BILz4kSJpt0zrhgFuK7Oyz1SdZbKUqZP7jxqrUUyyNkrdA6IYxYEDQRVibkqe59ta+O
         N8X557gQTSRpBQIOwRR/PWG0qozzgT39ED2+vK1ASQeHixqmAvhzxIAxMWwyVNCU5Ejx
         NAUsYjH+/2cyR1jGApBFNlpWh9O6M9krQar14UMmSMJ0gONHkrsK/dw28HaxQyLdrj8y
         2niA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701372083; x=1701976883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNcHli21vir5baYj9ku8MMNBlCqv0AKIpWf2Lyqz8B0=;
        b=W57wZRDzFyYJGSS6cXVzEBy7mWWhsrPXzBav4d/2dZaPAut1Sf539H46VVZlmm6Rdw
         KxfRt4+axuosUiPEQwdyqxZzq4uq4U/49jMhnBTIlDx1yJ/2Ujk3AzGL17TSB2N9uudk
         4+k8mocLeSQFMN0eZC8cP3XZGZfLleuIMkox38SUcobOIPjVNFVVEAqwUxo51tEN3A6V
         OfTH3THFF2vy8ubrzRzONbcBRjJ9GbxTbCgMbBEO0N2Tskw6Nqql79Hn9BknJ00Ag5Oe
         9gcLFP909OGUWqEejg4R3oQ1cYsv6r12AVVJWhaBUUo5kBs/qthsFnOEAky+NT/6wV5r
         GPiw==
X-Gm-Message-State: AOJu0YwYmirVvTW27+7sM7ZoAyFRcGEEoth8xoJnzhYskr6LuFt3FA2/
	HWE/oavRppwUz6PRlW4ToHA=
X-Google-Smtp-Source: AGHT+IE2f9qp1SjvrsRN4lxzgsw0h/B5/kyMl8ci2BReCokFmvVJMt2wKJZqfjD/VXwiZhodFeQ39Q==
X-Received: by 2002:a05:6a00:21c9:b0:6cb:8ec7:ad01 with SMTP id t9-20020a056a0021c900b006cb8ec7ad01mr27603366pfj.10.1701372082809;
        Thu, 30 Nov 2023 11:21:22 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id y63-20020a62ce42000000b006c3069547bfsm1628882pfg.79.2023.11.30.11.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 11:21:22 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Steev Klimaszewski <steev@kali.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Danylo Piliaiev <dpiliaiev@igalia.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/dpu: Correct UBWC settings for sc8280xp
Date: Thu, 30 Nov 2023 11:21:18 -0800
Message-ID: <20231130192119.32538-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

The UBWC settings need to match between the display and GPU.  When we
updated the GPU settings, we forgot to make the corresponding update on
the display side.

Reported-by: Steev Klimaszewski <steev@kali.org>
Fixes: 07e6de738aa6 ("drm/msm/a690: Fix reg values for a690")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6865db1e3ce8..29bb38f0bb2c 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -545,7 +545,7 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_dec_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
 	.ubwc_static = 1,
-	.highest_bank_bit = 2,
+	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
 };
 
-- 
2.42.0


