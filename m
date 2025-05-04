Return-Path: <linux-arm-msm+bounces-56691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50789AA86E3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE8F63BA84F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 14:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA9C1EB18E;
	Sun,  4 May 2025 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgwSYyTE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09631E5215;
	Sun,  4 May 2025 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746369951; cv=none; b=LkDDp+GMXkH9zQnxcW6OU3bAJ+oi2gOybcqGjawRdxJFVmwOJKAAhdPm11P1ZcpTg8lZgPZ6EUEC7r1fLRyz7EyYv7D2RlPoNU5uhPk4UHN9+E3EDWBO6RK/2zL4V0zDsozFBlazMFAyLWU7C+oxBm+H0xtltQOuQUHI4ZDIcuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746369951; c=relaxed/simple;
	bh=9jGBgw7X4dT0+5FklcYtTpf6XdRbcwhpMrfLuBnypSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzLtgtoLXXNVMCHLzO1oOHyYnZ1wk3oQ1z3IfNwGyGCO43Phqhj98m3uBnN/8q67WZr1/JlEUiJ6CIIdcj9uQzxKOHx+Vp5Jv9ISVXmY3T1kvUM1cRdvnSMHI38TgL6kE24sR+gsPo9a8jVEzRVbZhUUPTJfywkrltNhnK5ygNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgwSYyTE; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso5095937a12.1;
        Sun, 04 May 2025 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369948; x=1746974748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbJk9bz6EFQthks8Ev5pNh2F644o6dRNVZmRCAlT3D8=;
        b=HgwSYyTEUY1CmQzmkz46r+rbvd3+zFZm/3fX48L7G87K8i1hiKDq8ENOiuX4W7vC1T
         hG4U51xbqofIN9QFIqqjt7CrH63WE6CHvdY4m18FER5xrgfB1+SZNKMnDsubJf5wxme6
         o1PPV6KReghIPKX9vHGAPdg91RP9RPTVZC2RifMrf6GDWSHficNqmUP2A7rQ+KlG2H0j
         0UeIDs8BSYNd072TJwcJnO5BnqShAAf1qQNTCGCvO1qHMbX//lyeRLXXzJL1WM6Pq4Iy
         ExJj00yyBP9srDLEOdVQKkUBltFJc9L9Ah5GMKbEQO2tBMCQNNtzIPRlYwZtBVk+YkVo
         fTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369948; x=1746974748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbJk9bz6EFQthks8Ev5pNh2F644o6dRNVZmRCAlT3D8=;
        b=EWTnHKWSbEeuzB+rydXj0W6dsy/RRulH5J1OeLAmMxb6GpiklGo93kq5e7lGHz3V0D
         M75ZsBHtrJAMuR5rURKzI/ddmr6x28LmeXILZS7TrcCbJj642uDXMroHoxUD8Rq4zG3J
         dWwtPpSxzLpR1YtH2+t8cg9RYhc0Jk2X48CxNfL+yaiZCWxQ5PeAZNtCF/2NWAAioUJV
         Kng0q/xWeFBntzDcFXhyid3h55RXJfsG6g3RGPJXjXL9VKp36sVlScQMdx56/b2NgdUq
         xFMVd/If2JKawl2wovdumuOdM0fPoI0jzqk1F7Mgvc/G0PSUPro9qm8yBOqP+Fx/C58F
         NCCA==
X-Forwarded-Encrypted: i=1; AJvYcCVXQRXtlWtFrrOwItynewl/LFMs478rQTpY7jh6LiMrnoS/Bgelir3FRZSE2K0xQVw1eYbWSwAVt+Gw@vger.kernel.org, AJvYcCVx54LnzNuX1YLRNCNuAcQAvIbVk2rsabT0wdKGKtmJ5ehBsuczZTJLUyNsPz0rhpRGQzuOjb5P6MrHHGSRuA==@vger.kernel.org, AJvYcCXD7gtVr9dC4H9qZ5udYNYxmvq5TgBrB3ybZtvkeJ2LCoi7uMOEkTGNb9SHS2EhR/ZyCP9tZmw2NXhNEcDU@vger.kernel.org, AJvYcCXM6ilhd0EUo+sTTjVI1d9SbritDNknIaLea+nkvs0bkRa8Mj04/I2t3uUH1b9HeGEX43yAspRETtw3WkSMW/jU4xE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw72X2222zwA3AKjfyu03Uqpl+QMSHGUN39XpM4qFILkKWurQQW
	bVJbi5StgGtwYj9IFnhG/08NhI02OTRt4Flc1MpJ8LD791y4hi03
X-Gm-Gg: ASbGncvb0e05jb8TLS+LJifpL4Wi+vkM9su/p0pXs2DD0uhlqm+txCh8dQvY8jW4FKy
	GdpOyWARRWZ/nSUragyuSoKpAfMcr8Pi+DTm+tvVXW4nc7F+013DikiWMBmMp58RR7eK5kCtY8n
	ZEN+5i24JKlNz8cIxn3csZ5IMdqoQPEIbwin+dn0n88MNVKCZzyUQr4qE3uB78YQk48plTcaeIO
	2LNXJr+VplDdWGnMn+hLSsKl5ODzyx6AcEOPhwy13f5A5X3HcpTa87MNXisjWNo7u4u61863rZE
	79h8O9LECWIRaYWNESIJGaVjr/o2FyleeMJEggn2PE4EqIhXppjQObKy3j44HIOS3nVOahZhsoO
	lBZx2ef1EBJ1pM2hn
X-Google-Smtp-Source: AGHT+IE7vTq91Ziy5tdSjRautreu12/lKKGXLd23gtOnTMb42Z27SvBFllDzeWoPOC2edcZgczXudQ==
X-Received: by 2002:a05:6402:5250:b0:5fa:afe9:848 with SMTP id 4fb4d7f45d1cf-5fab0576388mr3103899a12.9.1746369947837;
        Sun, 04 May 2025 07:45:47 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:47 -0700 (PDT)
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
Subject: [PATCH v5 07/10] phy: phy-snps-eusb2: make reset control optional
Date: Sun,  4 May 2025 17:45:24 +0300
Message-ID: <20250504144527.1723980-8-ivo.ivanov.ivanov1@gmail.com>
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

Not all SoCs expose the reset line controls to the kernel, so make them
optional.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 4094786d2..f05333901 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -408,7 +408,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
 
-	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
+	phy->phy_reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(phy->phy_reset))
 		return PTR_ERR(phy->phy_reset);
 
-- 
2.43.0


