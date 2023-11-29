Return-Path: <linux-arm-msm+bounces-2348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C42F7FCCBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 03:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E4DE1C21049
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 02:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB09D63A8;
	Wed, 29 Nov 2023 02:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdg+6nBB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72791BD5;
	Tue, 28 Nov 2023 18:12:40 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-332d5c852a0so3936031f8f.3;
        Tue, 28 Nov 2023 18:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701223959; x=1701828759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqztXsVlNAA/oHXKEIc5e+d17qatfadPPu7fc10huNA=;
        b=kdg+6nBBPrqHsAJczfz2GVioXt65XyviXgzeGp/F7ZVnKNhll3WbEonxi5rD+QRGvq
         yZb+uJ8l4sDoZaEThivmrRups/8CgIKWguotdCA0qu4enmgtvR1U62JQAM6+LSCVNVPy
         bCdNal8ukoK1U7XUK+nwIRn71mYqFhhRYmsDZ7N+m/QsqCksGw2GzYbO6T7ub64KGqej
         Zhchpt2buROJLSp28JV0ncO6jL8AtcZEHydz7be7mJPIuYCPiqUuUkRzb/CmnZ3ySu9y
         KuVS5NXohY7x6MRpxbk8FHOvyugI1pLbN3/pdmFjbengzVQO87sdkCZq55MgvtlP6P7I
         NqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701223959; x=1701828759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqztXsVlNAA/oHXKEIc5e+d17qatfadPPu7fc10huNA=;
        b=J4pFHEArQZmL2FjBLDMZ3L6G8/byinws1moQwNq8EY2b8tQiSYzcYBAUyFdBZQuiUG
         +NRuvjLv3Cu/zSDz5QGVf+Xb6FP1uCHO7b+Qgs0d67hOShaLNqQfNBysdeMznhoP4r7j
         QZZEVfihEKo2iMkmQeB8Rtq16ZHAc+mg6FqROUzKwLfXjKlBm7VKm8WI3D3H4yF/P5ZD
         cSV8nj8mlmbV8IrLUQ5PPWbKnlhSibBjgWQH6ywEwcvOkVV/kA8oc0DsTbQffUu/si4E
         saXeQZ1z6ztA6hSOf927d5aLkBNxQR300Icc2kIUkrb56WzDu7f3Mb+4LKIxZxTvsTUP
         opmw==
X-Gm-Message-State: AOJu0Yz6Vq0afMtxpUAsRllXYnnipRGn44zP+NnZ139SkS5KizSXdDhc
	z3T8aoxWq4s9dT6kTsqg9nRqqx9SJgY=
X-Google-Smtp-Source: AGHT+IGlFUJVDXIDtMfstnqAdLiV7vgNS4L0UIvtOCldz9Gl4AE9pFHDWUcx1bm70GxhXOlufpe3eg==
X-Received: by 2002:a05:6000:1149:b0:333:94b:7fcc with SMTP id d9-20020a056000114900b00333094b7fccmr3357386wrx.23.1701223959136;
        Tue, 28 Nov 2023 18:12:39 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id b19-20020a05600c4e1300b0040648217f4fsm321406wmq.39.2023.11.28.18.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 18:12:38 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 10/14] net: phy: at803x: drop usless probe for qca8081 PHY
Date: Wed, 29 Nov 2023 03:12:15 +0100
Message-Id: <20231129021219.20914-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129021219.20914-1-ansuelsmth@gmail.com>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop useless probe for qca8081 PHY. The specific functions and the
generic ones doesn't use any of allocated variables of the at803x_priv
struct and doesn't support any of the properties used for at803x PHYs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/at803x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index 475b96165f45..32f44ef9835b 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -2387,7 +2387,6 @@ static struct phy_driver at803x_driver[] = {
 	PHY_ID_MATCH_EXACT(QCA8081_PHY_ID),
 	.name			= "Qualcomm QCA8081",
 	.flags			= PHY_POLL_CABLE_TEST,
-	.probe			= at803x_probe,
 	.config_intr		= at803x_config_intr,
 	.handle_interrupt	= at803x_handle_interrupt,
 	.get_tunable		= at803x_get_tunable,
-- 
2.40.1


