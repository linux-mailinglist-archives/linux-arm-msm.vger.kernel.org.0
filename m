Return-Path: <linux-arm-msm+bounces-33058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F07D498F95E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 749901F23545
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 21:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFB21CDFCD;
	Thu,  3 Oct 2024 21:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQAYS9Ma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604F11CDA08;
	Thu,  3 Oct 2024 21:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727992681; cv=none; b=aLXuUSX0rloSWeT6OWRqLEajZOHUTlB3PkLQB8l7lHEDvADUFHfy2eYOWoD0i5L5vr01CgZg97MRAyqCTYnhElhu0JyStBs84bwER+hlONh9XgVQF+QALJ6X98iMz1WpybRazuzT5VRlIk+EfjRFQJEkBxeC9wo+pR4VotQjvZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727992681; c=relaxed/simple;
	bh=HWCBJH4vlO4UTqoBAE9e+56a00lpQ9+VWXRweVrTiJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=flvCHU1CjJ6Jx4gfgjkVHGLup/ViuUGW9MobcTAaiNCTX1Q76kwHHxEJDHCtc93Xi07HjnlIXwNF362MIPQrQgNYyA7ri+54jueIrkzcRTeQaEMGWk+K6ckm/bxmpJOCWZhn6aq9SN34uS0aWBQHY3Xd5OgZHC9AnPskYrgVqbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQAYS9Ma; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-719b17b2da1so1176004b3a.0;
        Thu, 03 Oct 2024 14:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992679; x=1728597479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsYC/7Jtn0r0x1yjqgQrRZfLX27SForPWBD0tqCYg8o=;
        b=HQAYS9Ma5nw1VHxNxwIDVVFQB55pSx0qr2RukZQkuGGryMWs5SQBC8uGsqx2Nj5RRW
         XlBoqC53lrKGNXaxvrqDl3tlPHq1cOeNur6fkpjD1wssvbR9YrqO4oRW0VPVFJihPnpC
         uvXyAoEcemznBADc9wxUX5Enmt4k0AvVkbnWHDHDcMzlDO5Ci/aUeiytiY270ARvC1of
         zGjVpGmc8AGD2V3P2gUv/t1WlQYecBXVkDH5aIKBTMwcg8reeYpEvQnDzN41kTPGIhB9
         Gq5lkNiqkPXlsMQ1esTaBoNkMdxDgYmubR+MGytPf+NTy1lqY6sO9RGUhy8tEP6wMkHY
         0QZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992679; x=1728597479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsYC/7Jtn0r0x1yjqgQrRZfLX27SForPWBD0tqCYg8o=;
        b=dQ6D6drQtzxJeOWjAZdEv+Oswld6EajOWnZyIIzkXVjiiXHy1ufcsQ3J9FHujHXFhI
         ULoW39nm9WACMSHjmwOHqg3/iqhXy9SQRtrt2xX5KkvlUx0DJ1E2LHvlMbBZQnioiQon
         UdTpA62Xw2AoisIr/8dFpluxzuJJT4HG7N9Kj0vE5piCl/7efSffw03LfVS/21Mbc1bi
         EAUK6SrnnntalyvKrFEx4jya5Kf/KEnm7HLmjBzfIXxwLx3oGUn/HR5RmcT6T+xMDKl8
         AonWkoqKyD0+OqMRiJ7lWL5mYpQg7djt+e4FAVcO7+0Hlqzi+SHn+i7ExfFFiWj1PZF8
         ewnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6nkJzJzA/7oZk8ZfyQCDp3qA1Ulp6lEF6Uby0M4tQHC0xHSlmSlRzOSxSRrkSU1X2UND6OgiIqmC35cDz@vger.kernel.org, AJvYcCWweaeM63g5GhGrPRgyEP60jzifb1Tnx93jAW9qd4Zez/paYm3fQopb9gELcX3H5/d2boy9zMBKZt7jD/uh@vger.kernel.org, AJvYcCXaoSse/Lp/4k/HJXDJtGb2u7VrynM9cs2hRk5dHJAuXxVKRrZtRh43FpAICDrqjpczsBdBvj6j@vger.kernel.org
X-Gm-Message-State: AOJu0YzlbzFcDDPhybbGehH105hpDyL5Emp+OvvxVPxI1rVIZlp1FLaI
	1WMBZ4XmcmQpSkAXpHr9GO8vJMu1B18IhYVHgfPsxN2Mr6zxgQWYgQtws3H6
X-Google-Smtp-Source: AGHT+IGNMbuIWrbIujwDABmLxc7Xkn9bDyXrwfmLiE2AMdFP+FxMPt8AB6DnXDiuWAiw72FyjSuYTg==
X-Received: by 2002:a05:6a00:138e:b0:719:20b0:d041 with SMTP id d2e1a72fcca58-71de23b6c4fmr898223b3a.10.1727992679452;
        Thu, 03 Oct 2024 14:57:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e67esm1863026b3a.39.2024.10.03.14.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:57:59 -0700 (PDT)
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
Subject: [PATCH 3/5] arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
Date: Thu,  3 Oct 2024 14:57:44 -0700
Message-ID: <20241003215746.275349-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003215746.275349-1-rosenp@gmail.com>
References: <20241003215746.275349-1-rosenp@gmail.com>
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


