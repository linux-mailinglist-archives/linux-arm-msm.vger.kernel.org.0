Return-Path: <linux-arm-msm+bounces-54116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36A0A86F7F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 22:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D3593AED1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 20:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F9E231A21;
	Sat, 12 Apr 2025 20:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwa6ZwVx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51116230BCF;
	Sat, 12 Apr 2025 20:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744489629; cv=none; b=R3NMFdtMxA7Nh7V8QdCyRVZSzlFUR4l/9MBKGkigD83ECplEy47RWdUVYYTB0UKLWDDxGsOs3370Iyw9JjrzLxee9s+YerNDbelmnxE5NXWAy8Fsq7Alfp125DogkQqFf7tfb0rFXvzdLQqnhPsnKv4JwoWkF+uOvnOSLPaBJws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744489629; c=relaxed/simple;
	bh=tTlRXxdg/HE/Xx4UoLaC/7E8D2Teyq2hyKBHoUvS6Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2nfHlShMNNynXdBzUpENkDYTfdH1XbgcHwd+sOuMfg9xNv12DXHNmvXz059dBjEjlphe9+QqY5suLDRKjJZe/QPYOPDJFBwTE0SNhU2x/AGtqSsZBW4OYLU5K+iEz1mWj1o4e2bCBv80BKoWFkE66Pbv7TWtc8uMSt3p9LL/to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwa6ZwVx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso14965055e9.3;
        Sat, 12 Apr 2025 13:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489624; x=1745094424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mVbqwsxzgFPfZ9lDdnu8dfGQADmGRwdt2QEaF4tnGI=;
        b=iwa6ZwVxilHfUi3ktLl28USW55015ijymAqHih0AcyP0sbBI56coPC/f9V/7ZOb1HQ
         k2GkHQXJr4BejfbzVoUbIdUDxNf6amnaFvS1JkXW+t37kHefv8FmFNYvQWmJSLZ0CldA
         YWNp4BO9gLqBKC01OGrB87lahI0oYNfZLBBnCGYAJr0QGcyu+QPn/NBrQX9PlZVwH+yC
         pUVtDQUyuwfoPGBd8PNG38HdRr3StbLC0auAHXb5+CxH8M7PnD6TcfBQ4Vxg6KY805Wn
         BT7KTaqo45ZIRnaLIVf/mi5xDUdWcb+OiLFSwLfOP8ikUx1orourSR4nPPFyqTfiQOOm
         ZQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489624; x=1745094424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mVbqwsxzgFPfZ9lDdnu8dfGQADmGRwdt2QEaF4tnGI=;
        b=SxNz6Yaj9SoCQhyswRhmUf9jgLHnB1i8huhi7FEyQA+CVcu0X/1y0FRgK8qJ2ccJPc
         XI2GqbwbWNSccMJETV1xzE8ElVg/AJ866/pNVA9xdxxthZSguoVTRlBfu6M3CRBGyHia
         g7Bj/ndusQVMoiXQFQZg6PVSDqStb4ojT1lEaWrNF/r8+ThMyYlGDG0dOp7uVQHaG3xx
         b/wrUhNgltHVxjYeyYXWWrAOJ/5D/PqeJE+qyOXWPFWKILgXLRNtPpn9ZpYnia5QmzVo
         UGj4heNinPDSFIH3CFMOptTgJd9Chuelhp9P23SfX7bXoEGHDwusCALtM8rBq29ni0AY
         rfzw==
X-Forwarded-Encrypted: i=1; AJvYcCWBXhinQXJLeTOo/gfqMsYFdrUZUxR6nYEA52HASl6DC+glEkpb5N4QUf9lFISAY/OwTSaLN9YSTNKrUnrANQ==@vger.kernel.org, AJvYcCXXx9ovXsNZecazu9SujLF6UZZqDe0tRzUaoqsUHxkTyNVOyyu5wgPh3jKSEV5eWVgYEhuFu6nGuHYqa2zL@vger.kernel.org, AJvYcCXuhOns3X1KsLN8hmFm7hSjjSk4hMxlK/6BwQEqOri0B20ZL1e9b5kyZx3dSwyrxAHxRKVaYYkP9HUu@vger.kernel.org
X-Gm-Message-State: AOJu0YzEF6unhJ52xOG5h2/8I6ifwgrIhTUJBB1KT62kyirHb4PKbpjv
	beX47E5GxuTniF6KiAU50B0QLHKd9o4lfPQ0bqq4InVZO1wPs53g
X-Gm-Gg: ASbGncsxRL45rbZRnu+BQdSHtPpah4GONa7ijdBFNLQKJtdQ4KjegzKPmMPgewjF7n5
	QLA8fIT3lygdYvszN81eA/ghFPLsTV4tUlcfv0hr1+8N83gufB0OtSael0FhNBNrtCMvtvWnMwn
	Rk99ltlHFw+xlD2OLOVOq9+wQYJgFD2DQXHVoxU4wnctdtImpHQYWfIcArEzwdTLM6O9JLeFI0k
	9ves3Ixu9jCXeUWJjU2C6wi34XHhBlcK3vc5S0t0b4wBbz7oJ8F0nxxi4iaK0z7kuQsvwH/MVjH
	bWmN9QmmmvJDBXvyaTz8fTbjaeHRgpWgtd4Xt5TJP4tgsFxx2l8ziMJzE2QCOHrYB2YOTQs88FV
	dn92FDnMZ0VD2puxZ
X-Google-Smtp-Source: AGHT+IEsgvtrWdgSeL0DlLpKGI9k/yst2bpThSyr13W7zdJuj6gazbdG6ZqfVwdkcHDp3Ks5PdCzxQ==
X-Received: by 2002:a05:600c:1e18:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-43f3a9ab06bmr50489615e9.20.1744489624337;
        Sat, 12 Apr 2025 13:27:04 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:27:03 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 06/10] phy: phy-snps-eusb2: make repeater optional
Date: Sat, 12 Apr 2025 23:26:16 +0300
Message-ID: <20250412202620.738150-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
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


