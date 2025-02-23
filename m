Return-Path: <linux-arm-msm+bounces-49058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBB5A40EDC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 13:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB9E41775CC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 12:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D8B20AF78;
	Sun, 23 Feb 2025 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4gH6UCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43089209668;
	Sun, 23 Feb 2025 12:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740313360; cv=none; b=KBepivbaMSYU7yEXVYBDcEPNo0OSJ0TygIg3d/yDxZATA1vqFnTq4b0TJZwqSBI9M7SyDhzKNad3LNeWTXrqkGiO6ARdd5oMgUvCxk1lVQMQ9LvViUINNOmZH77E58TAk2kYNhoCl4XWsM9eV0PFz1E03UjpQfKV+rzYQas7nL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740313360; c=relaxed/simple;
	bh=UP1sx0YglB7Nf4opNcMJsVMo/q5R/lyn5TBkEfrHgWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ioE/Qcd2ad5ptPBr+097DnfbwzsxL8gUGiy9TBMusun0Keum3cniSXn6G+eBO/U6ZU27lprs8Vtqyhfxi33C8hju7EGdTJ1bBThHrCxZ+v3q1cibbAmYATHO4NYgYpdCG2hTgIT5Y5sVa2QP7wENYrS3Lzwp1sBr9po8BaKw3mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4gH6UCW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso20681865e9.0;
        Sun, 23 Feb 2025 04:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313357; x=1740918157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0wQhVsHeKChXXBl+h2UsEWEersbr5rCyfY+lWbHqbE=;
        b=X4gH6UCWiPDQZbIS9om8ArzgZeYPohdwtEy6GJlf5NWyFBmE98YZrbDNOEJPYvrOUN
         yd6rQyOBdNQ72AEj2TG0mCc53RLKiMDf6XlHzA89oziFKvmAExPqR6qgkzxopNst4xRj
         hSz2QjE9NhFggAas68Xq3xsxyeGIBV1Qttes0TO9KMfvPYK+oV4Euj9PuLsAUvufPqCB
         F2iuzjeCElB5VG2XAtUUybCqdrKkZOt/4WvaSEvsxvBCn6+CmHCEkj6PtYUWwMddXrP5
         s6mU2rQbv9pt5hWgLXwcE0n8Dgu4XwsVdFVR9/YVNiWAPzYyb1iLldXC+eI+sqZmk3LH
         oJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313357; x=1740918157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0wQhVsHeKChXXBl+h2UsEWEersbr5rCyfY+lWbHqbE=;
        b=svOZDw6LX8hPT/D/PRLIArD1sLAhujAAcihOMBeiVHh6wT2es/a0EULVd4VXOkUF1P
         JIdy5tBb13OAlVWJiU+M/BZ02pKAT5qaIWMX9Kdm+IRf60wVlXfgy+Q32EZ+PYjuiCIu
         ZOArW+5RWM0u1NFFUNLo2BTQuWF607dPBnuCo/Tcro6AouZLRFAWwsh5tAfAxJLhneja
         Shq34B64DxnJ5J/LE3GyCCLQF9zk1fLiAbYY2KkszNkl+q5RFC5s6b44DDHEDzmp101D
         1ZWd3lvmAKFJCHw3cHcQ7gFiyrYhzluRCLqnqf9/uDY96Td90pI+wttl8ez7XtUGY2G+
         HWvw==
X-Forwarded-Encrypted: i=1; AJvYcCUw1LaJDcwLTeJL2NcC64mGOWXw8dRYyq4wUcOTggymnSgls/3JgTO8dx08mwIajkW3f9cwgJbdCwgsWYv0@vger.kernel.org, AJvYcCVKzyoDmGbNEyupx6qgx3NUZ2M4aD1CEoU209OoMSDZIjKRBuMrnb54F0FNev6HU3zUfZmobYB9TodO@vger.kernel.org, AJvYcCXMol/mwqtmRCRRRrT21Dh57SYnJ2dIjyBQ1rlsr+ilCebFHoKRiYhQh3dCh2KcR6VALjzicXyzcgrsmkzpGn85j4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxISGwBfw7+WWpj0t1Z4rnbO/kUhl7PL50NrEjZ7x8eZlPMq2DW
	mKLqRMJi+zuPbrEyG/su56n6nkEikop7AsxtPFWZFbgRuM4lv8M4cNIrow==
X-Gm-Gg: ASbGncsxAMhbUV5h+luPNj1FfTbk9IBxZQ8//zgb5J8lidLuZhBslAR/VLRlJZWSTVH
	s3/9YRimxIehHKjbmtHQyGN4e07KfOxTJdREKpMG5vgxGK/h3njBxtx9imCfdckchFfmIbR5IJs
	HinwNbqHniWVFZ7F9fkPWVw82N9bJwg2ZqAUfzmTYjIF8T8wZdZIsgEW5BNNGR17MHnTNfDkxW9
	J1DVTGiTP9LnUovHyS4YN0IQ2s3NGRMUbm1gOgYpeJOdeRZc/t+jzjj65dWqXixBaLLU5XtE3XI
	CLcwiFqnvvWyWxtLDtnLCbz3mFR8uP3TUfs1FW2Y1APU3KECIv5eXL5QAVYljgVUkTkUN1pfsMg
	FGQ==
X-Google-Smtp-Source: AGHT+IELhxBegLSVK0u+lmVP1P13Q3bXTlowJFOfv8B2pMlO46HBtKWfy8VmtqQKECimk9UdAMZdXw==
X-Received: by 2002:a05:600c:4511:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-439ae320687mr67074255e9.12.1740313357412;
        Sun, 23 Feb 2025 04:22:37 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:36 -0800 (PST)
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
Subject: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
Date: Sun, 23 Feb 2025 14:22:24 +0200
Message-ID: <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
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

Some platforms initialize their eUSB2 to USB repeater in the previous
stage bootloader and leave it in a working state for linux. Make the
repeater optional in order to allow for reusing that state until
proper repeater drivers are introduced.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 4e5914a76..dcc69c00a 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -461,7 +461,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
 
-	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
+	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
 	if (IS_ERR(phy->repeater))
 		return dev_err_probe(dev, PTR_ERR(phy->repeater),
 				     "failed to get repeater\n");
-- 
2.43.0


