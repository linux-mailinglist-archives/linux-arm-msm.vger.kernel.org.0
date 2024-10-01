Return-Path: <linux-arm-msm+bounces-32814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D685398B16A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 02:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C416B21B09
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 00:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7D3645;
	Tue,  1 Oct 2024 00:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8otNILN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2839173;
	Tue,  1 Oct 2024 00:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727742274; cv=none; b=Q/VbjaFJi1ppgPLNR1aHcCG4oxx0KG8OWlOr6TXvsvxJinWA8zQR/M7LRe4TmFe5ROF+4v4rTjCgNIfo0X1xegPazSMNwSHzxH734wQr4DLUdd+V/rgbdDAAgeZVqqZ2ByPLWO9JiiPMoixXbOtYFdESzdOtnaiu1JXrE6oxkT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727742274; c=relaxed/simple;
	bh=RR4YJEuiCB+s4fOTHaO2fk03o/BIx9b2dGauH/q9zfI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K86TkI+fkUkOcW5pwhIQdyjvKEXDXO6bGG7rWKkMiwAQ/zpVqnQZHLPS7iNIXX2P2rssQXYRwF6/dj/YetrelnlUhHoM7vq98IBAVQA4FvG/Og6N6dK302nMAUkHYZb4KGpV6KgiSuvvdRHN6RHc39IF47nj9us+mCNN6zSa8m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8otNILN; arc=none smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-6cb2824ddc2so39531606d6.1;
        Mon, 30 Sep 2024 17:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727742272; x=1728347072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXJNocpNHIaneGGPh7u0gkYrjLLyA3SxEfbfZIWZAYE=;
        b=P8otNILNZhG1P0cukcyh3sY5jROW69KKkCgThUI04WIqlzcsVPS/0CgsIY7YpYvLXC
         o7DgI9RBtshoJJrxTBtLk2VhPZH6euFRinmtCrCH34QfS4h3Qa/PsCZ3EETRolZeQfAw
         /gDGHnJjsbvWND1/J3/8xkMqNoq6GKiSQoPxF2PwOm86xLZQgAgy6w7J7z7J/TW2SkXW
         Y0hLQcJ04pou+/jk0up+V1bCQdBefXngMEmocWxAYgHQls6ff3T1PxOh7o5G97lqxNwP
         7oGMfsIgydieDVoy/AFuiQrQIbywdXEn0V2e0JSkRN9HHrdLznSBroYaU3YRK3+h8JW6
         zTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727742272; x=1728347072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXJNocpNHIaneGGPh7u0gkYrjLLyA3SxEfbfZIWZAYE=;
        b=wPg57s3BAIbPHDFDFOMlO63LUFA4mu9YIpKNo1+4ldbnxR8YX+9FVeiVwjSde3em47
         QS1O9JO2mGwDnFZFWY/zixyHOO7p2SMALzMxXHZy3FfpE7GV4Iyf6gbhUf6ASDcR0LST
         ASMikCgq30iNfD55MPD2Azcz9oXaPJZA3Zc9KntRYzhevI7sm/ApvfYQJPrhFxu7Mtgi
         cA1xKdAZqUNBWxyIMJhBmUisEMy23URsqVixpPbgZYKap6MZf2h232DBdf3FncjamHk+
         PjKcKA/iY/UkQsn0qeBnsvRr8ToIKjGyIAOlyUP2sLOqjZNIuyveTmiTSsJsBhyvPynM
         GrhA==
X-Forwarded-Encrypted: i=1; AJvYcCUjBi7QTHLVVJmXSigmeYk81k8LBKrctlr9XVLgrZcDFDt8VuhFTihRayRaidRSxLbDlssRFipz@vger.kernel.org, AJvYcCVA+B1lxVbiG1ZDgBpwHh+Sti8nOeCTv2XwmXicbdW88oufYrAzScQGKewdSCGWapsGhGd8eyauX2qc0/OZ@vger.kernel.org, AJvYcCWlcoqTcDgq4EtFLCTNgr06zWBFd7sJfJ8EITMnFM2caAxPHOkzEf/OypBdiSQQAGZ7Pox3zOCWYNHzCEA=@vger.kernel.org, AJvYcCXYIL8C0mWkBLAV39Yu5vfmea5bJCDnYxlY6jvymm2mP4FWc47RXjgRZlLUnAM0WI5KSvl/H/bhnGD2vGkQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyWZPndUtEXVZVmrNg1GxeZTuORofl51yhhB3GpB0Xd27aCFE05
	Ko7coOoFX2WG/onNkNqA7Y8AODj4nVbbs+PFMX+LmMgeqrXTEYFs
X-Google-Smtp-Source: AGHT+IFqcL3S9UyEKrwwWrFna24JxfP1Qfwil+sI6wQESX1DtQgsUOKRCkTwCI1uJWo3OmH6tjkBtA==
X-Received: by 2002:a05:6214:4206:b0:6cb:3ba9:b834 with SMTP id 6a1803df08f44-6cb3ba9b883mr186213266d6.24.1727742271738;
        Mon, 30 Sep 2024 17:24:31 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b66b5a8sm44361256d6.79.2024.09.30.17.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 17:24:30 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Gax-c <zichenxie0106@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] ASoC: qcom: Fix NULL Dereference in asoc_qcom_lpass_cpu_platform_probe()
Date: Mon, 30 Sep 2024 19:24:09 -0500
Message-Id: <20241001002409.11989-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could possibly return NULL pointer.
NULL Pointer Dereference may be triggerred without addtional check.
Add a NULL check for the returned pointer.

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


