Return-Path: <linux-arm-msm+bounces-49060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F512A40EE2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 13:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5E7C189A58C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 12:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C16120B80E;
	Sun, 23 Feb 2025 12:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQ3fkW1Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1B920ADF8;
	Sun, 23 Feb 2025 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740313362; cv=none; b=kxu9LlfAbFX7BMQIJisgaKm3uTwxaqbv01xDC/G9GYJB+YaAK8Qij508puA4fOZqTN8Lt22mHJEKXzKfB2O7vtxzJF8hpf37e5Xpa20sCU1E97RClZW2jZJkvEKDX4Yi0nvXdbXxZQHjIe1sr3vfsB12acY/TVoCzThaNoYpRGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740313362; c=relaxed/simple;
	bh=MQynf7HJpEJmrgwX3ZBNVINk6p8B6UBnCT/VBeNHOHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVQY2ODXxriYtc4wWZi4/Y2nMxxTKgdFm2dUISgitDJzSp6uUkSNbXe/5bjcavkTdBD4bARhz/rbSTc+MpGnIToDvmlwEIKNehALjIeRY8hnWHqt4gTi/MY/HWAHjUVF7SoeitsA+N1U4NxgP7hzh5ua9e2l/OeGQOpi0XwEx2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQ3fkW1Y; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f24fc466aso2679961f8f.2;
        Sun, 23 Feb 2025 04:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313359; x=1740918159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C92cg9pDirScfRELIv/SYftxNY7no1Ol/6QVuJ3MiRc=;
        b=RQ3fkW1Y4EDdZOfCs0iQTWAOJDlTAp/M+b5BgNawN8Gf+E40cyc3aFCG6AhpNOZoYA
         mhPV4oFoni03BblbHCfEcT/4MV/J/nGE5wy8fVQtfxyKXVfjBFwOUWOQ7u90HZt5m7Cl
         J23k6nc0yzO1uE2tsMNXGmZl7BKN+ivTzXsTK1GBCdFmhX0KL5XMePFoZr03J2TPyR4j
         bKpneStCylAo2B4gmgMQkRE3m9v71Fzal2I1akWROJ1+iwEQf7ZAMLyv20avmKh+W19U
         42FGGqkS/vfffsakBpzB2BexPlP/alxRgiw8b5dTbg5x9xdrP3jbkraXLU6o/+isEucM
         1Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313359; x=1740918159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C92cg9pDirScfRELIv/SYftxNY7no1Ol/6QVuJ3MiRc=;
        b=UsODWfXO6tXWH2zxh4cC/xe9ojj1yl+UK4WeCdOQXRgV7oSVfv2/P07x7zSuZXNTSV
         fmvhWTHoJBlu9S3plqTwTEfWWUe8DMMmnlWDeMNT7/UiQVf9rWJWQFIZTiX3EqvDKEAt
         3DKmcGQqVf58FQ5TcZEw2tLqi+p9uqWn8gpN9m0gepv6v5fhn/v2DGvdyGScyzAHYoBQ
         5IdwSqAOanq+NfNdo8zgcA9VNR66ZSzu5+S+Ez5UOjt4pqVbe7y6Avc7MZw4kAJ0tq7I
         gHREsf9b5DPn5Zxcpf3Z6RSPfpRo5C1CF+HDrYXZj7oXNtj0VeN+PTDKreGgCKYuOT4x
         vHQg==
X-Forwarded-Encrypted: i=1; AJvYcCVGcX6wCjeeagD3ByDmQQFtVHlCwRZrbHXeecpGXWk6vzAXTBd1z8KL8n26mNy11BA/0rAEFGfheQe9@vger.kernel.org, AJvYcCWSqdgV1hWaCB6easApRUo73mCzsrqdWJBNZa4JVu9iveDwloI26vpsXdiKkcZwKFEMtSuHXe6RbSxroFMR@vger.kernel.org, AJvYcCX6hu4S0ahOvnJDz/j8BTHPVU//PYUlzT0OxfdhyUC+G77ZFoX6to5geYTpmNAcHLzaGsjMCA4cNjYKjV61sVccSIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOmdVQe76vJaa1DmPAh6yeYXH3omozknrb8sNI7zd2otPpq+kp
	mmauECQGU3lyzIz75FKadl0WA1R+SyDGWUfBnktKOTBoLBYpzdZ5
X-Gm-Gg: ASbGncuWIJORYd6l0fP+5XkaNTdFQY5oUSnj2dylWBALxBS3+nUMMQ6B59OywrJKCvP
	jhtwgTq7I2ZTli+EUfmpG57G4GKl4v6O/4CMXDAAHnFQf2RmMyG7Ma68VXFnmsT9N3+zNHOsl/V
	dbxwAhjMHjRJzOGlbn+gGhOE65HUaw062oGqGVFodhNiluvHLjqkjNHOvTOo0p2Xlj/ZQeaYhnh
	lOP6mRvC1ZKcdklH/h9eyxpoxqEXisq5jStTC3NSlrZReiz8a2vLeNhOHWvOHkeNzzBAeXuVvwe
	KUV4OLyGnsyWCL8ZrIXEQy8x6pnPaj35elZtubFqttDCtu9uVZ1f7LmIcIu7G80dR1gnvaQfjAM
	Jow==
X-Google-Smtp-Source: AGHT+IHD/1fKxNbRJHEqjlek+14p9mn6PKTF//azfEyhIr2/+Ub8gP0MUCWd/hcqjMmdh1I7H/WIww==
X-Received: by 2002:a5d:5850:0:b0:38f:2030:7da9 with SMTP id ffacd0b85a97d-38f707b0b87mr8586440f8f.28.1740313358741;
        Sun, 23 Feb 2025 04:22:38 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:38 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] phy: phy-snps-eusb2: make reset control optional
Date: Sun, 23 Feb 2025 14:22:25 +0200
Message-ID: <20250223122227.725233-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SoCs don't provide explicit reset lines, so make them optional.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index dcc69c00a..7a242fe32 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -420,7 +420,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
 
-	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
+	phy->phy_reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(phy->phy_reset))
 		return PTR_ERR(phy->phy_reset);
 
-- 
2.43.0


