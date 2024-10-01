Return-Path: <linux-arm-msm+bounces-32906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 283C498C73F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 23:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B24D31F278B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 21:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3531CF29C;
	Tue,  1 Oct 2024 21:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1P/u8i9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7473A1CDA0D;
	Tue,  1 Oct 2024 21:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727816564; cv=none; b=rr9/X0WBw6uPEIsyJWrANZixB4inwTgPejW/82DokLSQEtmub9sJRG6iwa6DuDMGqH8jrIyM1Y2igjTCJNpVay+TudVCyeSp2OnIg8KbDK1yojqoJb8SLL+i7UeNfPCmRwBmfH8Nn1pdkInzW5B6t7tRqN34DiXh9susNbFwXCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727816564; c=relaxed/simple;
	bh=j9nKdkXSYWiIqZC/EjeMLZoVdFKq933DP4Fk2mYbuDc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CmRKbN73ruUf8CzsSWgVi1g9+yLsCEo0YVEOiFFfIszrk6/ZfTsPWzs8dX+bsz2ZSs4SsEbdk8ZgTjteRJ9dLrGCs5Yy6kgtoG9ChXxwrxqriB/CfGiyyOzcqPNpmgGMYKvJLLvwT/iyyijbcH9myE77jb4H1XkKsu4Ga+PQeac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1P/u8i9; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-7acdd65fbceso493604885a.3;
        Tue, 01 Oct 2024 14:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727816562; x=1728421362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+jYH5NvXI+E7Di+eslBeYdYxG/YksuIt7qvi8S1X1cA=;
        b=A1P/u8i9w8DH84ZJYr9Oc8ig8TdqJ+VE7yU6co5YApx2zCQr84Wm4OY1IgX2SaLNQh
         9JUwt+CSaefuQC+VPVa1hGrYIxsYy4byfE5A/WKw/Tvgl8JRClvpskCk0nUc8wzWh2Qg
         VC0dWEWqw2UfaXXl+c4P6YhZx8UmV8Ms0919FlFVv1+zMddB8iRviFpINur8ZW6ByTAh
         70zBsqUjjLgoADRxFwRoRU178966FDSIzxsO9TkoRgwvcsJqnq/aCJ9yw/ELa+fl4P3d
         RQK0O/+Sr5yT07ohhVX711lf0KTpQw781qXeqUaeVTE+0GWx6uLk7nfAZ3t6JJIvafbV
         lfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727816562; x=1728421362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jYH5NvXI+E7Di+eslBeYdYxG/YksuIt7qvi8S1X1cA=;
        b=dOmBOPGyLojjD1wQ5Vvfhvwe7V+oECoq8gkeCV6PTRxtYOGy7cr698JYkUSyNZm88R
         A8C6PFUI3YsE7ztArhja4Rbc52gKom3SZVrRKRuGP0ZcPdA4E8n+r8GrGYglUeoiBBpy
         Z7jwXFVfHqDiXLTYDmWnC89GxXYVURUAXP8UDhU0RVrus3jUohH7jU5lyeqTdEl7TZVt
         bopNALsmyTCMFKeT7Bd02WXTnfiomte7XL/2aZihy1aOqafJL1yjE3wsoYqSsE3UFRdB
         mpl/a3ndCmeb7ken06o42J2Gk1Af51V0zijdSpCkYC4WKJt8V+DDFPXu8xgrg7FdmpYT
         jF3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsBNYUNnTodirSSxp3ZTAWP3vTSpjOwx+K6LnLeCnV+FtsPOaN7RELcHRIzZN97cwv2QHSyS2Z6NpK0vr+@vger.kernel.org, AJvYcCWeiidxs1963OfEOh88GSxg7I74rPmnQA4GGs9Yfwswto6mg2CVPPU4MrWcGuku7XuyaAy/8xTv@vger.kernel.org, AJvYcCWhJ0vmR7Gz4VeKjKvtq6rBdMG6G2Ixhi8Sgd3hikd/XiMJTh5p8czO88n/4EBjJ61dQ0q6RhK1p2aZZzI=@vger.kernel.org, AJvYcCXuIU1tuhDYb3LavJPMgDHgf1Wx8q4lwa12NxKtf/WoTkTACQjhP1ZRLdPA+efu8BoCq8ePnH7GsCzmaCXB@vger.kernel.org
X-Gm-Message-State: AOJu0YxASC7xnpSFoXvg1cCS4rr5bsjlH/u8PGABb4LOEjqb3vd7TNut
	+oeP0UTL6E3kLOTizb/fFrVyyed0iCyUo/BLy29pnq59OEU9TQoL
X-Google-Smtp-Source: AGHT+IH8uerN1xuIll5+jKNYSNyQKKRV3hWcMZLGc4+dVp70EfVbpJdn2EImWBYE6QoIIu3JG79n3g==
X-Received: by 2002:a05:620a:46a4:b0:7a4:dff8:35e6 with SMTP id af79cd13be357-7ae6274f7e5mr123077585a.62.1727816562236;
        Tue, 01 Oct 2024 14:02:42 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae3783d269sm540615685a.116.2024.10.01.14.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 14:02:41 -0700 (PDT)
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
	chenyuan0y@gmail.com,
	zzjas98@gmail.com,
	Gax-c <zichenxie0106@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: qcom: Fix NULL Dereference in asoc_qcom_lpass_cpu_platform_probe()
Date: Tue,  1 Oct 2024 16:02:10 -0500
Message-Id: <20241001210209.2554-1-zichenxie0106@gmail.com>
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
Reported-by: Zichen Xie <zichenxie0106@gmail.com>
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


