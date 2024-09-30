Return-Path: <linux-arm-msm+bounces-32724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2C69898C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 03:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D71F2284D2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 01:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A1115C3;
	Mon, 30 Sep 2024 01:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRJao4vt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F5D137E;
	Mon, 30 Sep 2024 01:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727658963; cv=none; b=GvCFxPBkeg+1S2/AcpLYZNIOhRFcv4fO0nOcqhofVjCHTZB0m4r/Ue+mRVR/lYRguK5UrwrivJH15i4EDXh8y+Eo/feJxtbRnNWBXmQK8dvQjq10OVMVctp4GSxK/kUbUOeQisQBd6sf+xHb7zVLiR/9afZY1ohUx1KKu9tbFqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727658963; c=relaxed/simple;
	bh=pZBBO8OTpmOP+7nbPeLuWP7ms/KMEjDy++NOOuPuwLk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EiLyz/thfbbHLfeZLRHwkymFLreFVYokd2IyHbqOOwTV8EbJ+G6RQ9BDd54dU7hfO5LU/ELNFnguRiBSZ54KuqOYzX+SlxHF3CuQrw0NOHQxu3+z8DCtqad0d0Hbd5QYYlsDfNJjTMYWTZEBV90Qo/d+itFCxYMUvjzughGFQno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRJao4vt; arc=none smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-6c3603292abso40528226d6.1;
        Sun, 29 Sep 2024 18:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727658959; x=1728263759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XeEoQG+Pvg6ci51SvJDb0G+G8SkJPaDXclm5RHYYhP8=;
        b=iRJao4vtjT2I3GhkNVCyNqy7JSwx/zpajy8IF60ASgq7p+ea2l9OgQxW3Nr03ksxu4
         pOmQMR+LYhuXaQZtUk8aKm1L5adt+x8bAQcX8qDDek5SPhUcUwz9h/zyMJO8QEkgulBh
         GP8n5CL1WEq3BL4RTfva4Kzt11/2qJ7279gPaQxJZl0mjgThR3YKYF7FBNcnim701+tG
         q3pNVmq3nFTciHeD6cnDIcyfmXPRNFHQj/5ZJzM1f4haNBYRdvJolzcOTNK32HrJ4p8t
         9lqH0nI89jQzy7gZ/vGL5pUOnwIJimtTRPIkY0fAp2VHDFntdxvszID6GHKRjpIH8Ct+
         kGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727658959; x=1728263759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeEoQG+Pvg6ci51SvJDb0G+G8SkJPaDXclm5RHYYhP8=;
        b=kmpxYnaU8z+ri9yTREVcsQip233zDOES6PWWvADYMAjwsy0m7XfupM9xy+px60Ue3E
         bB4nX01WvrTLi4FPw7jhRdIuysn/FghuwdR1GE2MV/k0Cxp3LR6kCOUpxjnyo4rEu+TE
         nsC6ZrvpDHP0Cu1Kn4hE48L2+dnWmtKd7B7Nki1ZsGpe3Uq+D0VY5f2H8vtvVDplj9Ia
         IoiEDWVuD4Ikbcriiqn8jCf7httFOU7ByRj6IXSSj2bbEKFNEsKrVN2I6J9mebF1pP9+
         bBtA/mWSLftUDhK+NLlmUeznvM0WKpmg/q21e0BQ6XolOwYwSjalB4OKwWaXR5RotBOS
         Q7OA==
X-Forwarded-Encrypted: i=1; AJvYcCVzXPwtN7kNw/yfa4Cf1/DMS8GF0WLBQ0q+LCYyDGJykzjJNdHgHjFjlWRkikxAgH20H8VkgrjUdTybwWQ=@vger.kernel.org, AJvYcCW68BTbNHETYR7iL04Oa07AgI/GQsc1C7DA/M7v2NA+P6iPftSqaspQILFx0jFk/hF8ZR5pGOefz9m1qpiu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Gq81Q1UFXRybZj00mLJtc5TwFBbl6U7Gu7pz0q6gYAqFU+Ck
	BwCChi3OaI4trLX4PXD59PncY1nlft1+BgeVu1CUexhusgDjIi68
X-Google-Smtp-Source: AGHT+IE1dpA3piB+ipRduIUb/gj93dPastsENChqKZq6mad780d2qFEIKkFKLh/ZJY7o2T7Z/ot/fA==
X-Received: by 2002:a05:6214:4b11:b0:6c5:ab33:5244 with SMTP id 6a1803df08f44-6cb3b630fb0mr160430726d6.31.1727658959474;
        Sun, 29 Sep 2024 18:15:59 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b62c057sm35251886d6.60.2024.09.29.18.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:15:58 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: srinivas.kandagatla@linaro.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rohitkr@codeaurora.org
Cc: alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Gax-c <zichenxie0106@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] Fix possible NULL Pointer Dereference in 'asoc_qcom_lpass_cpu_platform_probe'
Date: Sun, 29 Sep 2024 20:15:22 -0500
Message-Id: <20240930011521.26283-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A 'devm_kzalloc' in 'asoc_qcom_lpass_cpu_platform_probe' could possibly return NULL pointer.
NULL Pointer Dereference may be triggerred in 'asoc_qcom_lpass_cpu_platform_probe' without addtional check.
Add a null check for the returned pointer.

Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Reported-by: Zichen Xie <zichenxie0106@gmail.com>
Reported-by: Zijie Zhao <zzjas98@gmail.com>
Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 sound/soc/qcom/lpass-cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 5a47f661e0c6..a8e56f47f237 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1243,6 +1243,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	drvdata->i2sctl = devm_kzalloc(&pdev->dev, sizeof(struct lpaif_i2sctl),
 					GFP_KERNEL);
 
+	if (!drvdata->i2sctl)
+		return -ENOMEM;
+
 	/* Initialize bitfields for dai I2SCTL register */
 	ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
 						drvdata->lpaif_map);
-- 
2.25.1


