Return-Path: <linux-arm-msm+bounces-33294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C2992179
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DC5AB210B7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129261482E2;
	Sun,  6 Oct 2024 20:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2LSRqMe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B902EAD8;
	Sun,  6 Oct 2024 20:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728248271; cv=none; b=VzceKHO0PzfmdEPcecpSQwpGVvM8Lok0dBxZSSIib25P0NJhs2FKod/y56QfhyUIN8naKy20ObbLqXg1c35VcuPA4JIzHbXmDreZmiT1p89sJMNjHFHF7VQ77SAAnw6kA1C9KA8FcL2bL0Hfo37jUIhNEIqQrmmQM1CZ7INX4kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728248271; c=relaxed/simple;
	bh=9k26v9n7uWvM7DAabG5+dgfZHDOlxCvPXYF25rHiFLY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jFY4sr8uPakikFq8no2Ffab1YqIwHv269ZDKKRW0jD7Ofvd3r4BxsOHDF1apwy64AeqWTIh6GsivQ1AfuCKK8p2rgnI6+UG41f/Db/fnEmQvPIVYEmpjZBzPVIA91isL3JpAyUHVws4yE2wj646Sb+G9coE54ROUm/gZr2Wl7VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2LSRqMe; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-7a9a7bea3cfso220630785a.1;
        Sun, 06 Oct 2024 13:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728248268; x=1728853068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PnmB+ZQHx2VRbqXrqnFk/p0zOAvgwQ1BHnY11BPXuhY=;
        b=i2LSRqMeeP4YeoD23WG8+Ql2a/tXoeK1P/hoiZhOpuo8g2qPKJdmXmzzeJ+FfxH+ea
         2/zDqfIu1OoU7xGPkfYMV4BuUB92PPTVd+CgFlmrQ+HYpmUi5y2gCNY5qw0wyIuza1mY
         01igesngfzt/Sup7mhM/bfA9qo0QcbKo9GhjzD2/hj7A6VBdH9xHN+B5GuPQmdg9RnHy
         nvh6soYaTaMehC1/fbh7l5IhoiunOoqbL/RRY0V2Q87kGAtvG4txGdOvGlM2mZrEj0tM
         FuT2/utsQ9yOpDSGQNjick/p51IxuAJsMBhX+F/o+1ONLVYoqaxglHSE3Wkx3yL/DGmm
         CAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728248268; x=1728853068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnmB+ZQHx2VRbqXrqnFk/p0zOAvgwQ1BHnY11BPXuhY=;
        b=qcdcEsefeNbiLeaMNZi1TJk71mnnPfOazWUTC8jQD2kUP779fXcQ95XOwmIeAwDvWV
         aPE9VXFm6sNpqa5HA7n/iU2nzuWjxJjN3lJOZCIDNQjKW5rR42OJdhUfZ1WV/2JnwL6B
         lGn0PHsvoSAHOx8avwb6PT8TsWRwShwXJEviD5B0oU3ZAR5zHlk0EcztQ8+T2KVHadOa
         2g8ddKAiLTfoOZ/ECPv2nixYmdrwp8e7aquuHrKox1R3ijE9UhL1o4Z/GJ8nheqVgHuL
         oFdJhSMYbwzAeccPWGyVTKe5PtZdmfjEOfveflZKhNkSLOELfV9HBixYyp264H42Z/gA
         j8Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVaK+WWgLWvDxg4vNfULaa2HjPYyrl51h35XG9XfDs8r5KqNXF+t9Cq+1rh+OrUNs3DPSkHMWZGvKqcHWpB@vger.kernel.org, AJvYcCWEYujRSq55Lw6PNqzk0XfWQTRMWkSSgU4P5hzRM5G8vQZ7WdTM8gom+scPMA1nsQvkxoeBO2N/@vger.kernel.org
X-Gm-Message-State: AOJu0YyXwVYXIGU4nN4fAciCy7/pdo6OJuTy0DYjEA6Ss6WAsgYGglG+
	b/cB94aBRzK9ZBjQ93jPbQhmj91S3sX0aNhaczlEKcsEgYE/8042
X-Google-Smtp-Source: AGHT+IEDrQ4cpe6u1eaulg32wqYdo/IErgLQDzGzYL/7nLTp4wfVTQNvuokBIZBhTIBZIX5rF0MlBg==
X-Received: by 2002:a05:620a:3705:b0:7a9:bf33:c17a with SMTP id af79cd13be357-7ae6f44cd13mr1634916685a.33.1728248268355;
        Sun, 06 Oct 2024 13:57:48 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae7562c677sm192360085a.31.2024.10.06.13.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:57:47 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: srinivas.kandagatla@linaro.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rohitkr@codeaurora.org
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org,
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH v3] ASoC: qcom: Fix NULL Dereference in asoc_qcom_lpass_cpu_platform_probe()
Date: Sun,  6 Oct 2024 15:57:37 -0500
Message-Id: <20241006205737.8829-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zichen Xie <zichenxie0106@gmail.com>

A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
possibly return NULL pointer. NULL Pointer Dereference may be
triggerred without addtional check.
Add a NULL check for the returned pointer.

Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers")
Cc: stable@vger.kernel.org
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
v2: Fix "From" tag.
v3: Format tags to Fixes/Cc/Signed-off-by.
---
 sound/soc/qcom/lpass-cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 5a47f661e0c6..242bc16da36d 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1242,6 +1242,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	/* Allocation for i2sctl regmap fields */
 	drvdata->i2sctl = devm_kzalloc(&pdev->dev, sizeof(struct lpaif_i2sctl),
 					GFP_KERNEL);
+	if (!drvdata->i2sctl)
+		return -ENOMEM;
 
 	/* Initialize bitfields for dai I2SCTL register */
 	ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
-- 
2.25.1


