Return-Path: <linux-arm-msm+bounces-33024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1C298F280
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 17:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0713D281735
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 15:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADDD1A0BD4;
	Thu,  3 Oct 2024 15:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+97ZQ+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76211A0719;
	Thu,  3 Oct 2024 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727969265; cv=none; b=nOk3YUswPX6BDpPnbwCAp1e5qDttfjE1AR7gQ8kGda6ff1s0VA9SIjfK13L2b98WX3lUSW4JXLojsDre3oFgttYUPc9oKaU5MtdrIjVHhxxkgCBIFsGgG7186BZllEiaynF25PIymdIpoZ+Zzqvh3aMC3vfd1Mvesx9EskSNrdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727969265; c=relaxed/simple;
	bh=qsa9Tr36UghnCP9lXSpaAMsZJLGVmYl72voh9q9E3tI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lezwjKzLMqmzkRLBG81+q9/miRZsoQcJRDkVASAxOi3GEAJOTOQt4jhertLa3f8KD/F3wpcFUgVerHWSX0mpHaaVku9SfCJu4aKY45gLMoyWCzjfkIfQWr8eXP3cXcswrGcQZ8pLdh+Yw4hr4HQWX+M0Aoj2JYjkU6VYi3FVUDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+97ZQ+T; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-7a99e8d5df1so111091985a.2;
        Thu, 03 Oct 2024 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727969263; x=1728574063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/dGEqQC57GQUROEFrRin+HCPiuYX6M1Xji3KrbNk7A=;
        b=D+97ZQ+Tf52/T/DzntL5nI5tkC9mkuytA15IRhbfbCyWmarr02HFxyyfVu3AURnSrl
         0BJA/Gr3tlumDYroY+J2RLrs0lJ/5x5WO3h+ju4bVBfDqEYTUzYav9Z9z8TPisgQ7b8G
         9A1apDOX/Z+Agw1QprYxuQBti3dz6XPeT21ySHLJ4dOV00NEDs7Dr/BGyUGSzHp3wqog
         yfXCagXrzLlXasUdyqCwnII0Es2HA81kG+E0ubS02FjLhdzFys4PsoEOUZR4BJwoUhHW
         wHUZimu4qjZsPTiBn62y83XiK8SC32MpN2vhOIAcWOC1Z2FCghK3QOfA8ngexymOT6FU
         aVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727969263; x=1728574063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/dGEqQC57GQUROEFrRin+HCPiuYX6M1Xji3KrbNk7A=;
        b=w1o43lQhtSoHiVE4Xealv/e57zf+cWjDjtfw6xFKdg9t3th5VnTLdyip1mICxerW+a
         NUt+Hri4SD7x6GqSLwmCuZIPjB2bhGj99/9dF3JuJjaPr0g8kq6VO49JZ/ZlIMKQRQSZ
         QWhmEQv0NcOUhltub+ts/nlJROxY8L2YQGo5PxuzdGK7EADEBwZ+fJc53HDFKD3YdGUO
         naWc55X1XUqh59EG3EKVL90YLfoA6wN7FwwRb4XfvJrjIvmzC4Si1UgTjAj0xwTcqblp
         li06Ngh8s3ldnaY/dhqKks/lx0JFTlq3QoLLgk8ScbcaqJaROK6vJw9daXewcStphrRg
         +5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCU++kfiX1905Cc22FgrgaDvcw4vb+ukhJ4yuAwcmAsL6zffuvJSLSNqHfijO4HGIuvTFMNCqdwgalEVp8s=@vger.kernel.org, AJvYcCWCIEd7Txvxb3iqk0+EjzNlJCmB83ya+xaDDVACg5+2GkO/OY1vhHovNKKNTH3uB80a/rUr0lapgivh73iX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4MnjKa5B5iukCGh5wz2d+PfRm+T/SEuToI9jem9q5xLKq4Zax
	DV0jrWvL2wus76TtAPFUruvUB9Q0vFZgqNu7aryVA+e2ws6dWCGH
X-Google-Smtp-Source: AGHT+IHusAAhgTINbI8Xq6hjYClvjuFgNYxmnMzHJ2IBsHBLKRXVnOAN8u7Rvx6/ufQVetfS4EI0/w==
X-Received: by 2002:a05:620a:1926:b0:7a9:bf31:dbc9 with SMTP id af79cd13be357-7ae626ad92bmr1144156485a.4.1727969262543;
        Thu, 03 Oct 2024 08:27:42 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae6b39b674sm59232685a.34.2024.10.03.08.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 08:27:41 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: gregkh@linuxfoundation.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rohitkr@codeaurora.org,
	srinivas.kandagatla@linaro.org
Cc: stable@vger.kernel.org,
	alsa-devel@alsa-project.org,
	chenyuan0y@gmail.com,
	zzjas98@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] ASoC: qcom: Fix NULL Dereference in asoc_qcom_lpass_cpu_platform_probe()
Date: Thu,  3 Oct 2024 10:27:39 -0500
Message-Id: <20241003152739.9650-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2024100358-crewmate-headwear-164e@gregkh>
References: <2024100358-crewmate-headwear-164e@gregkh>
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


