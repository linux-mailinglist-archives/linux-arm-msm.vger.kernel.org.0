Return-Path: <linux-arm-msm+bounces-33747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 876979977DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 23:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31FDC1F25286
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEB01E7C02;
	Wed,  9 Oct 2024 21:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INnC7QOP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6451E6DC9;
	Wed,  9 Oct 2024 21:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728510545; cv=none; b=nVWCErCsEUkbelckjYd4AMBtWiY6YeWr1EybUB5J6pziQpvSXZdBiBEXzM5ImCEgN5q+EoGJ/Vnxr3I+VP5It8uGkuBamnifFfBrVHLgrT7pld1oj3CQsasctxVhjAK3zgIcb2aiQU8rX04kNLfmhR28m0bmbewP2xwxOkq53tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728510545; c=relaxed/simple;
	bh=shHER4u0OAOXldgRE1LJnGWQ82XScGlYljOXINFDXdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b4JnDvEcNYQ+XGH3LV+KlmnpqtSGuH1zurqdxYE34FynuD9hZOPmNe1G6Tu1+Fkk6BClOvHSQ7NinEfUDygTmQoMgLVUUZXKER3vg+Dz2sQcoEP0ST0BGNMAy0yQygNNBewLiFMBHdukTM1pkiFgx7fzkjfFc/RHPwZBPVEbkig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INnC7QOP; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7e9ad969a4fso154580a12.3;
        Wed, 09 Oct 2024 14:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728510543; x=1729115343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pFqfOh1/PbuJMZ1ovEQo0qGXsKUQzTf4DVIM+oOnHQ=;
        b=INnC7QOPuXqWdGdMOeYAkdSIff+PKEiDeiQJKKVYxRvaUbcWvByENR4aaQRkIa3GaF
         jsJsCq3M3OIy9txVtkd5/8ouRePyiCoJ5XOvkejSrtYoAyCYE33LLGiWNQUA6Vd7x5Eu
         CjHBtYfDCvn3XGdzMZfL6w5KRWLMnBNSGcbofLCmyVu0QsjiFQvpLMByCyUAlqHAB4Ct
         GUac6V3OMjeCoDiQpSpb/A4S3Evap8/R+sQgVFMxXaCMQu/5UjU49ZDh1nfDfQLv6SAG
         NP6YgUS+TGfRCiteIQYtTBkliNL2+zqWOlyLOqGW7QjngNQmBhs3Gcfk+wIpBb5/jrLW
         665w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510543; x=1729115343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pFqfOh1/PbuJMZ1ovEQo0qGXsKUQzTf4DVIM+oOnHQ=;
        b=fAHLf3zFkUad6Xxce5KZyP/8M3KNsLqLuyKJe0ytagTS4Cq+J7Zj6lYIBExZAYCV1c
         U0akoXMnabAnnhO79F7ZXOx6S2gmjwyU6f+GX4f6v6etLJv1+71MEr8TpwHgzn3FCFLT
         djBTYtgZ9hwi2UvR+5Fr0xtZJoRpiPgqLKuYgYxTbq9MCFJUAc1pHczzQu9gYeYjYdAQ
         THsiH1XsZ41C+VkWwWwnOjesEfzgAP6bMao3PzvnAPyoeiPjICoeoZCO9req0TNPm6bt
         78VIoE5pmUL6/S5M3od/7qc70HKyK1jA3rfcJvf+eyNG1EMCGP5NUlUM4OBZzuCVf4cw
         6jvw==
X-Forwarded-Encrypted: i=1; AJvYcCVIXP/na0ax2wQ3yc3nLNXMnheY0Cr9JqPtTr0nAjnY//mRjPlwv1bLBI3INXslZm/RGf3NcnwTGVa5sRpK@vger.kernel.org, AJvYcCWLvBMt0UvfCMwArxON7rrwoBAfmrMbxTdoyC15nJLP0C4lIFLfsJzyjx2q3LcNQQ+Kzd3zyRn4@vger.kernel.org, AJvYcCWjV9e3F8tnLNL/bFIEpWmn8INCPdw/GCpSsX9Kf0QL3LuwTDq2j1dZzmhHVNFsUuUbWPW7JDyYu6yMkdyO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc8fbj5wvFfrNz6cvkH7tMGa3L+GLXjd5Y6MBp2USSIj2fdTWK
	6agKZqg5uQzp2vynz9lOpo7QyQvcDO5fJ5aM4MEffyI1motut5YopU4J4t5R
X-Google-Smtp-Source: AGHT+IGMs1YOfwcLXnyF3f5oAEJht16GdUiRrrh5sgEZq7TMWIylXPioMMZpPWgcLjjmm8ho3Ji8YA==
X-Received: by 2002:a17:90a:a410:b0:2e2:ac13:6f7 with SMTP id 98e67ed59e1d1-2e2ac130994mr3869737a91.4.1728510543308;
        Wed, 09 Oct 2024 14:49:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5707cacsm2250091a91.21.2024.10.09.14.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:49:03 -0700 (PDT)
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
Subject: [PATCHv3 4/5] arm64: dts: mediatek: 7886cax: use nvmem-layout
Date: Wed,  9 Oct 2024 14:48:46 -0700
Message-ID: <20241009214847.67188-5-rosenp@gmail.com>
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
 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
index 08b3b0827436..9a6625d8660f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
@@ -121,7 +121,6 @@ partition@100000 {
 			};
 
 			partition@180000 {
-				compatible = "nvmem-cells";
 				reg = <0x180000 0x200000>;
 				label = "factory";
 				read-only;
-- 
2.46.2


