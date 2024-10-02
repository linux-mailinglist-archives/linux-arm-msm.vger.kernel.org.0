Return-Path: <linux-arm-msm+bounces-32954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DF598E053
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 18:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7B522813F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 16:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52FD1D014D;
	Wed,  2 Oct 2024 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNtG9yC5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547A31D096B;
	Wed,  2 Oct 2024 16:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727885597; cv=none; b=SKOC2F7qm9a9i57/erL/AdF31FHHDd+GLtbf5Lqr8ou4GNorSt1MkquHDNp5/k+4P4AvcuJcO5Q/8tN1+7ccUqHo3EvwUyWYPQYUldfbXOfhzvmk4XsF6ykvIrkx2h6jVx1yAkVC5A6jtw8j5XJu572a2artraKTqvscLsyMs0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727885597; c=relaxed/simple;
	bh=PFhe5qkwffgB5AUaRLfTYJBjKYBOL3NW5GVEq2FjsS4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PMV9TCnE33uHucBP+udEPs9sZa8bV29Z0Wm5F/lZdS/Kk2NTDIhmGFmZk4K4pjRwpIgCyiIuPhpNzb0PMBvALYkx/qr+lsJQ0kuaJczczlxfFuSUuri2V6rznZoky7WqHV9mVCzMz5YEC0yEAxlqhzhs9cCuLxK+EMjF8CwWQoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNtG9yC5; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-6cb2c5128d5so244456d6.0;
        Wed, 02 Oct 2024 09:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727885595; x=1728490395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YaAqXYOrs+Q0T3ILVjOtUUUJDGq2kyVBWsgDISQYgtE=;
        b=UNtG9yC5OmiLAET2H+seWY3/gRLrDEfVkDf3WkcAX3d7yR0ztJSI3x0cnc4NQiDxep
         JJe/gpn/11F3+exiZ9mEQkQ+wurthnHIMR4z1Mw5UzjIP4/o4xPygj9y/87p5fAtW6Bo
         l3PpSkg01vfID9T9AbBHmzi8VXsZrTCXjmD31d8O8wlkkh9L844F1MXtvyrYxRabspol
         oeD1MLrdVMAm053WUfs1RKI/ahuZifPi26APU5EAMrsoYzgJ07ZQn4O/FA5Ea3457nE3
         bfg/4yMeRXsXIZbgSKYihD7E9hasXVyQ0ALl8u2qRUVWXX0AQlYipV+0b7424GfPe/Mm
         AG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727885595; x=1728490395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaAqXYOrs+Q0T3ILVjOtUUUJDGq2kyVBWsgDISQYgtE=;
        b=aPvdMzktW8hvBGGqfP6/OT7wNJ5BOA/2C75mQNTnFZ2BYAi7hqJewKAwPbJkPao0Qv
         69ulbrLQkl0qA4iWO1u0bUqzVpQC8WhoN674LizrAe79LrsOAmgR2wY5hDreFCe8k1Oa
         YQR1g9qcIRfDTG7IyvQki+/GL9IpfD1vBOI5kBGxvL2XN1d0yOXFDQ/DZHh5JT1ih2hd
         m2EPoXLYPBURL9o0I7IpkflRw/hIah8WyCpTHek8D84ICWCZIh+bUhatmLQmPvMLdxX2
         S/Ls7j6JNlYSoMvbFGshUqc09+5jznktlVUNSPmUNjKoJnEe4DRsDf/WIT2NNnsPxQE2
         Chvg==
X-Forwarded-Encrypted: i=1; AJvYcCUMo6t2Gv96koCPMSsBzPRRFAB6lTecZm4IEVWtLj0Q0WOSWNJjQzyJECWGlb044PlYZZ6jVgP9i6wPFHKZ@vger.kernel.org, AJvYcCUN5kX6vzsNQL1ZML7YY2RcNqTmCv2hIkoG4YXo6szL4i8iow5qrbrDzW3W6a9Vwbv+bzBtnGwh@vger.kernel.org, AJvYcCUfodkmpWgPZOgZI872pttubDSKtjMVV+WKqEjz5x5fOj+wcnkPzDgbnySMwh6HJZeHnONEISUaCpiYOHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YySdwH2UbY/LU24Rs7V1TaHggIiXbrtWRv3tB5v/3EL6XS+hhmR
	mXk8UGzSyBwIwAXgWqAfNiInSMjaFJvtqnSPjgZKGQXkd9Gx9GC/
X-Google-Smtp-Source: AGHT+IEY7+7GGtRvAHmNqZOUe6gPQT/dKtSnV0a8RIReYrDmnLzNoqQ2D0+zzl9Wn9F5tfQBERjB9g==
X-Received: by 2002:a05:6214:2c08:b0:6cb:3da9:f3b3 with SMTP id 6a1803df08f44-6cb81a852a5mr60575526d6.38.1727885595011;
        Wed, 02 Oct 2024 09:13:15 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb8811233bsm7339106d6.41.2024.10.02.09.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 09:13:14 -0700 (PDT)
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
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	Gax-c <zichenxie0106@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: qcom: Fix NULL Dereference in asoc_qcom_lpass_cpu_platform_probe()
Date: Wed,  2 Oct 2024 11:12:33 -0500
Message-Id: <20241002161233.9172-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
possibly return NULL pointer. NULL Pointer Dereference may be
triggerred without addtional check.
Add a NULL check for the returned pointer.

Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Cc: stable@vger.kernel.org
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


