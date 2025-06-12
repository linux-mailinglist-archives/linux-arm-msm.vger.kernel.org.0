Return-Path: <linux-arm-msm+bounces-61030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E3DAD64FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 03:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43FD13ACBB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 01:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444AA7DA82;
	Thu, 12 Jun 2025 01:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tV76yzRj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6445F15382E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 01:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690952; cv=none; b=bICFoUJ60elAm5oO2N6M2RoKjbDkWRikXOi06WsUIUynRlFOX3IS0TPz4HroaBEjGnps5xV0gzs5FYLezHiSAkj9gIfaviwfkQXRfqDJ1N9iY7qLVtGXzrEFaUL9BV2mChRmAfhiGdjkP605WMELCtZ6OLsPbNHd9WFig3Rwz7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690952; c=relaxed/simple;
	bh=Br2+sPECo0mbbnRGjEs+gcJ7Da6KTtHQtd0Iun2iP4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+LDXk2IiqXqUXRXyBCjwWCR6x7eHhc0ryXgcBqLjLGlrI2Synaq4/ukXtyPgE1IKNCBOskYpmOJVtOyb/07drsVLATZ5b9pCypbwwvGhc9Z17ziptUSN8cKn++nyuNsTuC/2PjKDkPaDWW85i/YNwd1zJKqblcLffooP7E66Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tV76yzRj; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32ae0e2e4daso372881fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 18:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690948; x=1750295748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBPHq117dWQljJbOWkWsV8bZPt4ezjyADVBAza4ih8A=;
        b=tV76yzRjD0AcIgQ7aCrkcn8omiQifxA7P9fjX9C4rrRaFik8IXARUiOxgVoOFEVu5O
         wUEPSN3Io9oIWJKqiWMPWeaJLcWtulHZJy80aS5TkDGob7zDdc6OwQiHC1hrdpHwvLFU
         amHPNHzeaWAU0UUKcoLnVnfh5fi2a882nZdNhe/7Da/rtM9xhY1UAGjF90MPBmm1GU9B
         THJhUh7qyJcWiHu/Dx/TguFGUgHSh4TkDAgNQVangT7k5aY5hPJ5sJ2s0Ha9S3qVS4BP
         CTHAxSiAaFYBh/KVJhgkDwPcFBkml4niFaoLqSUWz/8HqGhjS/Wb6o6QJJJL9PCPqJWS
         nLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690948; x=1750295748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBPHq117dWQljJbOWkWsV8bZPt4ezjyADVBAza4ih8A=;
        b=f6qNCh1Ic4DNS1+K9wOClkNTi/1NDWGHcPk2sGzUR5FPJTgyAsmDXCV8hwZvq17YPy
         +feNFwDh7Lu/yaSDn24k8yqheAuzCUjdT3tWIyM92pVcDEmqr2xgBIhdU6WFLL3FnIe6
         Y4QXKvp+G5/2gmSgDGWIZ+SgtRoUpYXGcwNFr4g8DzUk5xZ8MLUgbj2YS62OZctP7mG3
         EZWdhoWf/UXt5F49megWK1woOrIZDM+DEjTMIfUs5WcnsiPtWpeej+AlkhIkTL4AJNgH
         BuEAD1dn2QuGdJWPzcPIrWySRwRvAHxJx5Lkx/1OoFgWu7dHGTXxtu8cgSE42jGgFvwF
         igpw==
X-Forwarded-Encrypted: i=1; AJvYcCU7/rJRdVbLwVEm4X6hkw1EeI3Q4l0LGoEsDgNzG0uFluK37c2g/zl1Wo33a4dGw1y3KlNogA9s3A9b4A9j@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0hiahQbQCAOLfUlmxS5E5CQW18/mv4MVpbRxZ3uIu9MJhEr77
	4cdDT5G5Yy4Pv3D3XYNCEiXEv1Ax1L7EQQ6qtcvufmKfNcXYfGOF9/I9vcmNgYRuBqo=
X-Gm-Gg: ASbGnct/xqdEmKFM+9gIiXNtN2GZghhBzuNhomhtltZjj1RPCxXV1CbkMUfgRQfiJD/
	vWHLelRpv8Rco4qr7iUsFm7r/Mw1ob8BiYWNxfPSlYLP0rIL8ie27UUX+B7rMsXfvGhIfTE1dZm
	jNVwXdFY1tj9dASMp+UeUGbKcv2ylc6lE5uZJ+kAKzRc3kJfsQn6DRUDOeLAZcZqwn9GzNKHDpt
	KiFjIdY85/YwBBKnxmVuTwHikZabp6gbPona9ACPIo4Ra9ppGcUgUmu1RaahbWZQ4aj6e5NbNUK
	cUHxLYq5+vgOh8Bzs38RjXmAUIMosIlIOqf0uoRJ8fl/HwU6vOdRoyLquO25rbN4a7TTmXM+XSa
	j/tmVcyR+A5TaEzgvNn97CR8g/OJDZxTEim2Hyy/c7d2acAX3w0g=
X-Google-Smtp-Source: AGHT+IGjvJjUSGUrBTNd9Gheaxu65cY98U3D2htsFy57efkcRMWJJtiq8QTKRbMHsaxIiIbQ4v6Wfw==
X-Received: by 2002:a05:6512:23a4:b0:553:a78d:2c44 with SMTP id 2adb3069b0e04-553a78d381bmr36548e87.7.1749690948390;
        Wed, 11 Jun 2025 18:15:48 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:46 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 05/10] media: qcom: camss: unwrap platform driver registration
Date: Thu, 12 Jun 2025 04:15:26 +0300
Message-ID: <20250612011531.2923701-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To be able to register new CSIPHY device drivers unfold
module_platform_driver() into module_init()/module_exit().

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 71a37447e17a..e03308d7a366 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3953,7 +3953,17 @@ static struct platform_driver qcom_camss_driver = {
 	},
 };
 
-module_platform_driver(qcom_camss_driver);
+static int __init qcom_camss_init(void)
+{
+	return platform_driver_register(&qcom_camss_driver);
+}
+module_init(qcom_camss_init);
+
+static void __exit qcom_camss_exit(void)
+{
+	platform_driver_unregister(&qcom_camss_driver);
+}
+module_exit(qcom_camss_exit);
 
 MODULE_ALIAS("platform:qcom-camss");
 MODULE_DESCRIPTION("Qualcomm Camera Subsystem driver");
-- 
2.49.0


