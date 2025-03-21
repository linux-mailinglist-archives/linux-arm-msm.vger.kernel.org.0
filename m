Return-Path: <linux-arm-msm+bounces-52191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0C7A6BC6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6431F7A9553
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 13:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446351D6DDC;
	Fri, 21 Mar 2025 13:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGLi9Lzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE431D5174;
	Fri, 21 Mar 2025 13:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565550; cv=none; b=cuUKdpSPCO41425y/vDF7K7Fkndr2Up5lKE2iAtNF5rrTC5KCSmDnJuwQq7edmfDTIo0IGChF8TR0s1c3C0IMd7EXhnSDBMb6UOnSGXuWEb5mU41xsqW9jGLzUzIiAtRPz0ZargnoQYslyuwvwhf5Vl0j7DwG0P7Dgpq+NzZaVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565550; c=relaxed/simple;
	bh=/UBXs8B2ANn3JFt73DSb+86Bqqp5l0ecdRr9t2D0OTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hzIPW1+B6NYCOyopnRH1+StnhZndynRe9mUJw9GhgdKJ5yszabG2Mvr37AvqsA9Nsvi2PH0JcvrQYMn4s2QYbcAmssbQXyxmTWFSsQiptIp8mXAwtzg51MuIcGI9mckVX2AFxmvgmwHDiwxvSCbDkzNiSMVCb8oE59Y0BsNFlos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGLi9Lzd; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-399676b7c41so1130691f8f.3;
        Fri, 21 Mar 2025 06:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565546; x=1743170346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKyiSlNdwX7DjF+cflTvTcf4eOt0dAS41mN07rs6ryI=;
        b=GGLi9Lzdidbh585tnKTCtB4Yw4CmwPrp4JqxSFcKa9279WC7lVEYaqrPqzcL7wTNlQ
         BDM9fXWbn5mlyv9+E+nFMIfJntV0uF/9SwD7XCX384SP6G+KD6CdFlPYrQENuqmjHml2
         ycD9lYdAvCWfWTz7Z4c8c0oqhJTeBS/UEB4J2tl5K5P0Z1xd/yDTNFjZ5g4xocCAF2Yg
         hOd6uxl6EgaA4+rf8Wqe/uFWFjSQylPP7FlEhETyfdbcyd4d244t24yJ5A6Wrp8fE3zC
         jLML7Q0AQSYnEHs5pbLydH0NcXJJQ7clZyvsrwMUtZXSycbioQu21iC0Xw/MNF0ma7z5
         15Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565546; x=1743170346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKyiSlNdwX7DjF+cflTvTcf4eOt0dAS41mN07rs6ryI=;
        b=Jduk/lVbZEuacab7iixauFPuAHX3SrzJuNtJPTfI9DEyyws05djfqx5+yc5qMbQwzL
         ofETU6A1QHAm0QNlXDCVoO/DdqDdTd1m+AiCxUn2SoejJSwsUNnxObMXlF4cIEc+XXLr
         /X/yS+1wvTh0PY09UEN9bxlXRzjJ1C/VKtbG62mksRuSmv5mLz+e9kuyWQzUgyRwL0k0
         n59gHRP6WGc9NI0BbBYKTihYHGv53FTUBVoQ863BuF489vf4c7JOLX8ikS6kgsVZ5MK5
         spsIxNHLZk66hYdoxenLkyCm5wtkGc0JBWJ8gI6xAHwKbE8uAYDmAIGH4FByBx71qAtG
         xwUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpZSbF5Jo+7yWXTerhrSIZwzrinP0+HnwNpypyXV9RI4CGLc45miHm3ytZCXkG3SLUOmWl+eRt4pQs@vger.kernel.org, AJvYcCVfnmYMKYSIZIVPWb0AuWDQMO25tXAXQaI5YGsDPHSTsqFz3M2HTk0a3zNAUYeYhW0ovhBCIP/os4nojMurpu8CNjU=@vger.kernel.org, AJvYcCXf/SYZAeuk+ErLT6cXIMGp27l5d7oHnBYxp6LsmAW31kEOKvezEb0PLb6AMEy2FAYMhch4fyXL+ahHAlq6@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMgm6xZ9UKa8nfU9NwMW0W49emahT3Ys9Zr2XiWGISEDM6uo6
	rSsr8J8fLxjvbwKFN7VE7ZXpoaZDmBOtBbGILVcTv1lg5s2DJw40
X-Gm-Gg: ASbGnct40kqe2OuRNs7IgFWfu1Bbw/AJsoAUM6HYokQWl1lgLYWygGiaSsL5CQ6OVEC
	nDz5FtUMhR3QGLcjNtmU660yFzSikv8xsj0yGDmwusOo2lMCfh8e91rTKQMZC3sDM6HpAEB4xNV
	47QcI1NUefJnR8SQkkXjCZDniBnIFixfefzGLmh38UOVWF+w8aZGOIvZO9u71qQAX/cnwW6z3i9
	y3OGXrvZXDH3nYizXPnoNUYJJvjUn1kgP1a4JqTjI6wp1UpKfybwi5Gozg22qPllVqQJYw5BGLp
	uRFpW3V+qQvIyY52+MMAvm1hk1C8ByGamUb30erfPAButKcrzOcZb7T/j9BZxVDuW6/LfosHZiu
	DUWee2gOYnt//IrOu5RxD
X-Google-Smtp-Source: AGHT+IHKCNFnqK6pDIgCowKP73ucm3N0R/ZSYYNAOEojeB9gyAuveeAPgC5emyHRkRJvTkfkUr+V4w==
X-Received: by 2002:a05:6000:1ac8:b0:390:e853:85bd with SMTP id ffacd0b85a97d-3997f9371f1mr4236408f8f.48.1742565546499;
        Fri, 21 Mar 2025 06:59:06 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:59:06 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 06/10] phy: phy-snps-eusb2: make repeater optional
Date: Fri, 21 Mar 2025 15:58:50 +0200
Message-ID: <20250321135854.1431375-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
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
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index fa878389f..8ccd432a0 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -428,7 +428,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
 
-	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
+	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
 	if (IS_ERR(phy->repeater))
 		return dev_err_probe(dev, PTR_ERR(phy->repeater),
 				     "failed to get repeater\n");
-- 
2.43.0


