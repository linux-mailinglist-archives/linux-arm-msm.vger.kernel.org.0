Return-Path: <linux-arm-msm+bounces-33745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E119977D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 23:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 111731C227B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20251E47DF;
	Wed,  9 Oct 2024 21:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7e/+TTA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469EB1E47BC;
	Wed,  9 Oct 2024 21:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728510539; cv=none; b=XKQB2DAaptq0/NsY/ozUbe0Nr1CA9W7pDsr6SuPC5snnRyBWOdgl9WtfnTNmJcx+TkIJuiDaH4V1sjmhd4XgFTwkapw7z9jIFt0hzJPKWAEuW+HGbw23448dUXjzR1xZ2Di/4UnZSIjHyTPN0t3O4Sq1JRlozVJ1DZaVizVfcuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728510539; c=relaxed/simple;
	bh=gbCv8Hj0hrgFmiKZHVb+fygiodK3HtVEgN3izlzRLtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AS7DnNfANuWk51yiRuMThCePN77Cr5gDN58HYUh9FeLh9O6552vmPeiFsHhOdstLHkZPxxuUjp5AvPMuLSQID1RRUyAUZBIrFg+FSM6SeH4SKFhsrYZY1hpSGAF9dJw9sVfZ6KfB3NfN63vjrULrRfUNvzz8ijPrOx0XIO/Z7mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7e/+TTA; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea0ff74b15so139533a12.3;
        Wed, 09 Oct 2024 14:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728510537; x=1729115337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjMZ4asDtbZI1OpBAaaU9600/p3BCgdIVo5rxbXzhhs=;
        b=B7e/+TTAf2TNUWYTuR6kyBsPayeT9eoU7HJusfYXjfTSPQX5EtgH3s/wQWto8Z+UWz
         ZVg7O94xesQljlbaqxZGeUlgffLd2CBe787cWydqcZj1spFuBubko4Ob8eb37jsNZqJw
         ibQJFFhtLviL+K1caQHEuhUTHjWoiSf4vsebqvKUJbPhlD9bd9RRhokQvkvv0zft+fUw
         tEXTwBZkz+IMAFEk3x/4Q4B7llN96YMNrhPet044b/hSA1TL9hzx0JzgWUwCmIl3rOgW
         sgn2OLorOjsfZkjxbECWsofRcT30dfQWmoraUI/RkLTRTt+fnvkg292lE/mghtvk0M0t
         7bEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510537; x=1729115337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjMZ4asDtbZI1OpBAaaU9600/p3BCgdIVo5rxbXzhhs=;
        b=hdTmdfH6hO20n0fqqkILjnnRqm0VqI0svgdhMZo3mmPReQhpYBwZj0fJUZzCo+umBh
         3peal2/Jmcx08aYQlK+KwH2IqT1fW5w6fKwTJMmFDXsjbQUVNZrTm3DRA6vzvOE2N0j+
         bDenUD15Dn3LExTVG4701Gc1KKH0fljFKb/1QEhP0o0wVGPBLxzQVimQYpR8mDmJva18
         q8pocG733N7TS8UL64YLGOBmY8s05UvYuXKBIdLh2iRkrO3zdO6T+M/OtAKmMTnXKubx
         a+e0CHK39hQgs4m5aQFinM4WqpB8WLTafbhFO1GVEW4hRqNmfB91BRw7Sd0cQsRpQPpU
         Gdaw==
X-Forwarded-Encrypted: i=1; AJvYcCUAyqv9kYVKtSCmfMXKCfQbApiWKvfdqfAMCvoTdyNsXJ3IcAqXdkaSRfBTlnUyk+MOIR9U0B+jyGLB0kw6@vger.kernel.org, AJvYcCUOC0RG4KuVuPflKSF5Oy9EOcZofvPNXHDKkzky93PQ3N9uhzEIWPccu0mjYEHS8+4ZIxcoNOu/R1/mrD9Q@vger.kernel.org, AJvYcCXWyH2yHhm47AFm4WZObBgyfjkSw5mRwkr5Rqu8yUoaEKn+fva7SJORzWXi/84lutjmt8dJvnsB@vger.kernel.org
X-Gm-Message-State: AOJu0YyK/UbVdzghGcDpW23pPhjyL+LiXBfhBDAjXKJQNke+T55vpvbg
	xeMGSkxCzcRwoiWgws33WN8tCp5tMl55FP9LEMpXHKNGc7h2FZlcYD654RLx
X-Google-Smtp-Source: AGHT+IELYP0yGIhGAlZNDRXRCQNBpF6TBCDwk0p6CIeGBqN+IhhJq6fhE5zhJrcK45Fi8aeSvj9fuQ==
X-Received: by 2002:a17:90b:d85:b0:2cb:4c25:f941 with SMTP id 98e67ed59e1d1-2e2a2471edcmr4392095a91.17.1728510537440;
        Wed, 09 Oct 2024 14:48:57 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5707cacsm2250091a91.21.2024.10.09.14.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:48:57 -0700 (PDT)
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
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv3 2/5] arm64: dts: bcm4908: nvmem-layout conversion
Date: Wed,  9 Oct 2024 14:48:44 -0700
Message-ID: <20241009214847.67188-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241009214847.67188-1-rosenp@gmail.com>
References: <20241009214847.67188-1-rosenp@gmail.com>
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
 .../dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts   | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
index 999d93730240..a5f9ec92bd5e 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
@@ -144,16 +144,20 @@ partitions {
 		#size-cells = <1>;
 
 		partition@0 {
-			compatible = "nvmem-cells";
 			label = "cferom";
 			reg = <0x0 0x100000>;
-
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x0 0x100000>;
 
-			base_mac_addr: mac@106a0 {
-				reg = <0x106a0 0x6>;
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				base_mac_addr: mac@106a0 {
+					reg = <0x106a0 0x6>;
+				};
 			};
 		};
 
-- 
2.46.2


