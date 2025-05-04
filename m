Return-Path: <linux-arm-msm+bounces-56690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 129F1AA86E2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC5EF3ABA08
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 14:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DAF1E7C05;
	Sun,  4 May 2025 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ne/TrnWa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6996C1E1C3F;
	Sun,  4 May 2025 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746369951; cv=none; b=ngXFD/iP2uQXE/VO2sbhs1Cl9yW/3ghB5mmVxJdH4s6tSirU3VxkRxjzYMBpGaf/LNtnBSBT3PDTIOu8SEFbPCL55KtlRViKKMMALUvD55eQzHoVuKrP0VydaKw2Vqsp2Qsb+2JKAWGG0kOFmrt0QITtBcPFAeisORcwUNFvC6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746369951; c=relaxed/simple;
	bh=tTlRXxdg/HE/Xx4UoLaC/7E8D2Teyq2hyKBHoUvS6Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ej9nl4Z1mhMYz0BusNWugSzQwOyaKvbJBFcQIdUy1a2WdYmqJ0jIeQNHYI9nca7rhF/VXSG7X2qs+XVVO5hXZoSE9wbJTbwGrBRgGj+f87aT5qokv0qJ42fNZN3Znct7FX7RNzWhHymIpic/QkWtzDrnwfbzKrgfordy9GYII8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ne/TrnWa; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f728aeedacso5155373a12.2;
        Sun, 04 May 2025 07:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369947; x=1746974747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mVbqwsxzgFPfZ9lDdnu8dfGQADmGRwdt2QEaF4tnGI=;
        b=ne/TrnWaWc9b6Rdo7c/8GzdqbH+2sra81uJ7pIrZ8YGKTQ/krqH+oCw6s/M9lJrQUn
         opZnGiS4ZNnrEaX/js2cHNhC/z5md9E6czfWSxgkXbWX8lSbyZ0ckbPbXI8SRZRffmsK
         Nmd/lyXrszHsuUGwtOQ4U/3MbQOkQuBJcWvdioJmiLY2rxq8GIvQtP3jx1VonxXvW9bB
         LcCm0P8enyoCdDtwawNVt5CEo2NBqv879nsoC/YRQT5LOYPVDcvvRz591WwV8clbb7Yg
         J714lVj8QodWBrX5UzPBKTJRtHlXK8kDQTqZ18f989apW/NErG15DNg2AIHQWB5Fx6ei
         h8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369947; x=1746974747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mVbqwsxzgFPfZ9lDdnu8dfGQADmGRwdt2QEaF4tnGI=;
        b=swbxQZ/G18ZoaGMx/WzE3rdQAn5ABt9vUKJkmyT6VUkozyE8umcj+QnW0YXeiAMo04
         4pVAsJff4IIoS9udrJO42vd3cJfUf8UaoXkoJExjDPCn/8GCema/wcs5LwWkXFPxQ3iF
         1YzyOtcuPsV6aT3fa+vGSEos6z2tTaoQFHUR/oLQ0ugARGQd6s/OUizyvIJCwNG2d7Hs
         Cm7B+h4jUauYu29gzCG063d/FqXh3hP6Reg9ondD7Ti4J2TzbW6aSKJ23iCI23XuoPcg
         osDR3dvXVIPUMs6rJpbC9AUVLq0mRl8KNZ+Xh73FgrRQyjM3h6LeIPhSmMk2zQoBtUj6
         WzzA==
X-Forwarded-Encrypted: i=1; AJvYcCV/WT/DPXOJHDc1xNEJYdSA6Wbw5TivikjVoL0AhigmnzIvmcC1u5neGPouvn0ZIL8eqjBsWYgrWkJy@vger.kernel.org, AJvYcCVnERHeKyYTTarqN8iE+AEhlfoIz7naFnSDEAQu5fIxCpHz1xrJchtFYFaStqLj83BrBrTm4+SYW2FyPwXQ2g==@vger.kernel.org, AJvYcCX5NEGtruNVSkDGw4V6ZUl5337B9oZoAmC7ZG8Fqe/eP2/OOQHpaLIS7zmaCILHyvFrrm6fFq4CR1mlll8l@vger.kernel.org, AJvYcCXWdrcE0b6oBwhf/KX1VqWOsc+jGUcSUScMgjXvg3JAet0tOmDgjf6IFScvgOYm0EwSd6ldlxfhxQ3lWdiKGbrmjHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIUSSOqwZaxwOKCTwFZt2IGDhQtbbQpqcifS/eYHjNJekv/K+
	pDZPKc16wV/m6TaqE3EiWoIG0fHqW/mMX7xXFY1ny8BaLGDcNa8u
X-Gm-Gg: ASbGncsmG1Gpk6bygeoBzqj4ed9/Teod2ATXhDq6EtAeE2hUSKQRxgnddSuOyk5qP9Z
	BrcevLFWLq++nxuaD9FEtQ3Icf5WTOECfd3zcT8yiNEg//AvoQTPJ+taIwDs2N38knP+wTmJeY3
	cZKrkognLnzViYB2vOW5Cv1XCI0IhJpyYT4JvtB64s54DaYuEf+LM3y6mTapMxu+mpqhqcu1gLQ
	SnAaP8B+v17XRx4UrNGofAkeVHCZLuFmPCPL9DUpNs2b9a5P2Wllqk6fjwszctYCsfKrVSxo1Tt
	Nv5dfZmdtEu8+I1+BSw4oCdWkBoL8Y8QchAOh3CoxIgmkpPTt+rkkMDJV3aP34Cqbzc9RzJqtJU
	Wq5bJ1YJRzvRIxCN/
X-Google-Smtp-Source: AGHT+IHjuIKWNJgawIjtwOkw8F15EvBzNiKAf12L7CVkflrKlhADiuEJeb1zBKuZ3rg6km845Z0EJw==
X-Received: by 2002:a05:6402:2707:b0:5e7:88d8:30a6 with SMTP id 4fb4d7f45d1cf-5fab057dce4mr3636267a12.20.1746369946576;
        Sun, 04 May 2025 07:45:46 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:46 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/10] phy: phy-snps-eusb2: make repeater optional
Date: Sun,  4 May 2025 17:45:23 +0300
Message-ID: <20250504144527.1723980-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As described in the device tree bindings, it's not necessary for the
SNPS eUSB2 phy to be connected to a repeater. In configurations where
there are such instances, the driver probing fails and the usb
controller does not work.

Make the repeater optional to avoid that, which also lets us use
the eUSB2 phy when it's connected to a repeater that is not configurable
by the kernel (for example it's missing a driver), as long as it has
been configured beforehand (usually by the bootloader).

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 1933e8440..4094786d2 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -426,7 +426,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
 
-	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
+	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
 	if (IS_ERR(phy->repeater))
 		return dev_err_probe(dev, PTR_ERR(phy->repeater),
 				     "failed to get repeater\n");
-- 
2.43.0


