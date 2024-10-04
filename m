Return-Path: <linux-arm-msm+bounces-33070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925698FB47
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 02:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74DF81F22AEB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 00:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB651D0BA7;
	Fri,  4 Oct 2024 00:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8rDE0JJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7931D07BA;
	Fri,  4 Oct 2024 00:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728000029; cv=none; b=X5QG3n+/L+b6mdxCuH6hVfbIhA2dg/u0vvp0oLf+mb/Z+9bSvupa6kmxpFO+mxkIdkkupsBZsd35SfxBGpJBRkKoFSxyVOe6lF9XbpmeaBdFvjs71/lT4tZe5tmiqnokDjMTSNLGxhOm0rchOlUtqkYb4I6zq1LsJenK5waUn0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728000029; c=relaxed/simple;
	bh=HWCBJH4vlO4UTqoBAE9e+56a00lpQ9+VWXRweVrTiJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nesYt1svO44uZBJ+E3Beftbbd4jaMSWbIeLyO+b4cZnQJcn35W418PLRTgAZOjn/hEtudMhVnGO9wi4Otb6KuwP9FpJjoV3DSVI8lOHk7ESuFKa7fBIqf0+0zapA9MLcapAHdE4YPSqKRzW0hXhh6x+o7sMl+FwDgXPdfZaGi+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8rDE0JJ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71dae4fc4c9so1351997b3a.0;
        Thu, 03 Oct 2024 17:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728000027; x=1728604827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsYC/7Jtn0r0x1yjqgQrRZfLX27SForPWBD0tqCYg8o=;
        b=i8rDE0JJx/BpEtubm87ssr0kk6FmCXioWfNVY6hoevHIdVyJ5HsonDh0wvXIf6vzL4
         FGtIv0dVTnwsxzbwepxDGsqQ2EMPbTuhsXQs7HX8t8KCv8fJo+FjNDU5x135PnZIWpBy
         iswlm6XuOAPxA+hAg1/rEMHpn4rfk2sZIPhHcakL/oTRjLbwq/w2KrBD6guheyYgmxEG
         G5j0bTV17Giz2YBE7A8SGtJlkK0bx176MKp/8BMnUVw3FtfhUX0n43McaoxH0BqpRkdg
         M1RfFkrocDVem3jgskQ5ws4d3NnnGmGb6fzkZsVjxeLOKY6Gu6N1V27hbpDx44/jeeD+
         N7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728000027; x=1728604827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsYC/7Jtn0r0x1yjqgQrRZfLX27SForPWBD0tqCYg8o=;
        b=kf7VES+WHIK+Y/aFErBP+Ke9qvEFqdPw+Kt1R8tTZUf1Yxs45Dr601zNEJ1H1GHwm5
         Gt2sEBp036CFyrHlcckYvU38m9b+NoJ/QHgMDCw4MdT0UpKhh5qMLTT/91hD0FreGejs
         S8Sy25SyOETEvFIARBkM94yb3HJijmCQc8MNO038PkogjUdAXSzJmoWonkZfoRl1y39K
         oDleGARKPnwwAHfOmIdAiure4ciyDsnukqmxa8ZNlr5lRtjnUcroHF4w4mQqN4gvicx5
         UT7bhnBz5HhxiXxB2DEwXa8RuUYOBMQPsDMGh6e0pNGnsCGTrdephDBWALgPnXCNe12o
         hdfA==
X-Forwarded-Encrypted: i=1; AJvYcCUz5usmsQbgGRY4AUoHxwvQgMSXUnK7VaGkhcCq455M+SksYuq0u54n3Dot4JW2D+F6l6umMPRuBRaFC0YB@vger.kernel.org, AJvYcCVclSUb5w7uwwjDC/kmsDHCsO1vEmtNUluwHrOz+hg4yhQ42F/k6s+xq3/XD/cgY3UZhcCZxELELem2EY6Q@vger.kernel.org, AJvYcCXP6QoGPHeUdjp3kausf6wpI8mjnEEABFBfhwEpqvzIpr7ySY0ystu88yxsUXsGow5YwROCMkhC@vger.kernel.org
X-Gm-Message-State: AOJu0YwixwRQ+oL67tooa47Hw2DYkPUAqnW/xDaaChC5Wx2NqWTM1X2t
	LLsOMB0ynzUxYiXPMofs1cqWdbQVtdWna6RpCfhYCwY7YwRMEV+0PRKoC/7p
X-Google-Smtp-Source: AGHT+IFirYSitUaPcXPvdVFW+sI34fhLOYlzJmIShM+NEy17p4CN90ldDLXW0bq76BW0YT7QsOaESQ==
X-Received: by 2002:a05:6a00:3cc4:b0:714:2d05:60df with SMTP id d2e1a72fcca58-71de23e8e50mr1190663b3a.15.1728000027633;
        Thu, 03 Oct 2024 17:00:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9cb0b28sm1983047b3a.0.2024.10.03.17.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 17:00:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 3/5] arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
Date: Thu,  3 Oct 2024 17:00:13 -0700
Message-ID: <20241004000015.544297-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004000015.544297-1-rosenp@gmail.com>
References: <20241004000015.544297-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvmem-layout is a more flexible replacement for nvmem-cells.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/marvell/armada-3720-gl-mv1000.dts     | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
index 56930f2ce481..7b801b60862d 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
@@ -98,10 +98,24 @@ partition@f0000 {
 				reg = <0xf0000 0x8000>;
 			};
 
-			factory: partition@f8000 {
+			partition@f8000 {
 				label = "factory";
 				reg = <0xf8000 0x8000>;
 				read-only;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					macaddr_factory_0: macaddr@0 {
+						reg = <0x0 0x6>;
+					};
+
+					macaddr_factory_6: macaddr@6 {
+						reg = <0x6 0x6>;
+					};
+				};
 			};
 
 			partition@100000 {
@@ -221,17 +235,3 @@ fixed-link {
 		full-duplex;
 	};
 };
-
-&factory {
-	compatible = "nvmem-cells";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	macaddr_factory_0: macaddr@0 {
-		reg = <0x0 0x6>;
-	};
-
-	macaddr_factory_6: macaddr@6 {
-		reg = <0x6 0x6>;
-	};
-};
-- 
2.46.2


