Return-Path: <linux-arm-msm+bounces-33746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1060C9977D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 23:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEB9328235B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C0E1E572D;
	Wed,  9 Oct 2024 21:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQCrp/DH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA511E5719;
	Wed,  9 Oct 2024 21:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728510542; cv=none; b=U+zRlirL6cqRvBJ8gj/lDBLurXlq9XARAgiTuqvWDoc7O+ChTjL1FUEJzNf8XXlTUHRJCjqOJ+X47MzwNAwYucx+boIZrFcWbf4Nb80H9CeFTjGLZjltldDMs1cRAKYbHCHm+KQV/T8jdWTmu2NCR0sV7MU6AZb2cAMYdYRWL7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728510542; c=relaxed/simple;
	bh=HWCBJH4vlO4UTqoBAE9e+56a00lpQ9+VWXRweVrTiJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmAViRB7nUy2xYIhj2otglm2GhS6SzQlPJBq0g/zSB8MTMJ60ZPuHzXc/9FW0aTO94Dy/qmGn6lmwZu7f+eh8+dwV7KkRd+jW/IQrwVWBNFiMG9aD69yvEmuI8CI9PuY1AnjdCtTuA0rKXTU14LMZ10/kFnO/Lcq4occXVV6E34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQCrp/DH; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so1036847a12.0;
        Wed, 09 Oct 2024 14:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728510541; x=1729115341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsYC/7Jtn0r0x1yjqgQrRZfLX27SForPWBD0tqCYg8o=;
        b=aQCrp/DHXZckKtsOZP35G7ifJnarokNVE3tSA1caiHPMdXEqtNHWvPfH4LrPz0tuJZ
         /s6zBPgMx9AvThfAZtGTtgPBrkeru2D9NNKSYEvknXnZt0Jrs5V5WU/suQEHuLcpsEa3
         jO0cxTkzEQZitnWi2w9FnwEXnMXZHYY2D3pvWEe8tlr0uhJpb0S6szKoHB6rEB3F3jK/
         B6GdMMLSz8v0raNrzzsZixS9Jd1I7nsD370fgfuE6P2YlqW9npIPhAENMQu1gLGWUHL0
         IaoWASDxJ6oRY+9kHu5/yZfEQL83xeTcGXErjU2XOx6VeJNplFLgmZJMtY+qkTJfScqo
         uAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510541; x=1729115341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsYC/7Jtn0r0x1yjqgQrRZfLX27SForPWBD0tqCYg8o=;
        b=fYHqvVEOrUi3QHooQNsUNThK2qwkfXm0joyl7ZvS18sghp7XcuITaojsqxLBLS0bSV
         AbXBoKFohlxEvBa1kQkeKk1HaA3Z7oJ967otfzaqkI1WROcXPUeQIDZvKs0O1d5FvmsG
         Lq8+OzwzY8ksw51m4pf++DExMValMo/HhWdN0GLoWIB2dzGMfo74hkx14EqcQlutidF6
         EqVtc/fYksOdVmBBYA5Ltph2g/1VE2zil+EbxN+dM/gtGujqc8PJJurEqkEahdyxT5wx
         I3VAvy6MgVr6Gnr4/5eN/U4lBmY2tNdg+HOt/DU5plmvfxmLlY6Qa1MmReylLqtWWevP
         5ijA==
X-Forwarded-Encrypted: i=1; AJvYcCUp7rY4ZOBTA3NCKPGg2kINmzk3tdZkcju2ie0CrDvDGCQ3SkMknQbTEOkxaACRxJbUSTY2nftyiCOpPgmD@vger.kernel.org, AJvYcCVh/lnzgwMBTWyTQ6hd8UuCSjijT+qN6dKMTDYcerNdjjgoBu1RrH8uPCgq3lm3Tq9lWzel9Yib@vger.kernel.org, AJvYcCW+6IjwVF7bmTVOjqSjsoSNH7RLdZpGAkStzzZKMwcpdRRgitdzpEeqCupNpg4W/9yg+cDHP7A/2pPmqA0Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0m/r/0d0T/NKQSoCW7h3tfCyduBDM7PSt0lsGo9lkUmeKTeSm
	ts8+qSL5n7wtRmC5VXJSh+mRTSclr6yZXEkms8AEeuo8H+hvZfQRuIzl82uS
X-Google-Smtp-Source: AGHT+IH1PO060N+LN83MEtxQiIs1yeGS3MqDF3lj4wBSmoDLk5QqHdMEkb5sAG9gkJ8bgAD+wSlxHQ==
X-Received: by 2002:a17:90a:f40d:b0:2c9:36bf:ba6f with SMTP id 98e67ed59e1d1-2e2c800c77amr1697173a91.3.1728510540499;
        Wed, 09 Oct 2024 14:49:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5707cacsm2250091a91.21.2024.10.09.14.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:49:00 -0700 (PDT)
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
Subject: [PATCHv3 3/5] arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
Date: Wed,  9 Oct 2024 14:48:45 -0700
Message-ID: <20241009214847.67188-4-rosenp@gmail.com>
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


