Return-Path: <linux-arm-msm+bounces-33059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD498F962
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31AFA1F23537
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 21:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978471CF5C4;
	Thu,  3 Oct 2024 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dg2OrVoo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262A21CF296;
	Thu,  3 Oct 2024 21:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727992684; cv=none; b=MeDEv/Yw7sErr1u2kw0lHtjHt7XuVuTB0g8zq8Y9i9iIlMJSxov5ot1xxUFGL01d3B3i222FGjnEmvu1ar/NuDX2TEt1M5Gu6OkmAk3I+weB7bjPnyZAWcLUuyoHe6fKzt3vX3AkksNTx1YAy+ouS6h5sBff80+klsqMHE2lcZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727992684; c=relaxed/simple;
	bh=shHER4u0OAOXldgRE1LJnGWQ82XScGlYljOXINFDXdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvXxsRX3uZT2pJMixYZx5hujMHYJGS/QbtAUlNMKjt4Tis7EdhAGOZ54anDLjEvpX6pIyc/VjQ4Tac2keuUxFtesTbVQ5VzZmSx/VB/gc0Ujh/NsbyIM6zmvyLL60EkEWZk44NJ20ckC5rrezH/fsiYUxgC+m8w+uZGsiitTGRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dg2OrVoo; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71788bfe60eso1222930b3a.1;
        Thu, 03 Oct 2024 14:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992682; x=1728597482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pFqfOh1/PbuJMZ1ovEQo0qGXsKUQzTf4DVIM+oOnHQ=;
        b=Dg2OrVoo/eowBw/JZjGDHWr+4u2bNI859avz0yoZKAhg0Q871pmO5Bx1pqwULXZARu
         7eIMaZJ7GPbjHAINgYStEe29jsjHv0o2QrywZ8cbx+0tjp3/GzfY5IdqK/lLV/sk7FRM
         kTjuFlcqY4l7wbTPft5ewvcytQovvaw6DDWiWBhEqom5+Yt53FXJh9Yvd7kut0eCjE6o
         JpsIgYpESD/cx7Hii0B0cOutFFUDdJslq6++Xdw/3RtBiuLeYqMO9Z0rwWDMrDj1PkMc
         Jh20BD/r0e2e1DF+TNAazgPT5VkW+yPLVa8a3xWbr1leY+YA04/Zr3l1zbrafOOo+KVA
         7u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992682; x=1728597482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pFqfOh1/PbuJMZ1ovEQo0qGXsKUQzTf4DVIM+oOnHQ=;
        b=cSOItNE1I+4uwf9MRW+bqXT302LX1vjIct8P4AHaC3Oy0Z71UNcTr0Xzy2AVrTy9Xx
         DF1gos5WA+rxJBzyaadJBOk9jM6RBsETdcRsnjmVHGL8sVvmrPydbOi5FStWztGvwIgt
         3uBpOIePOBjQ36SW4piB+x5mGy7kcYT1hi8GPAQt8Saz8JDg0CfoixKXvA2torO8zNg0
         AuRD/qB0ZuX1iheHDyg1dc8yh6/hEJif3AZ6o7Ul4dSgW/xF+1onHL7wOrBk0fAoWPDT
         opMl1Zq48Qe6CSnk3qAV8egt153hrLroV+GJTKsg5jhBRJclH/8nfGRPPCP//GbMy+hz
         CdWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVDJS3WtUoAItEruJ8pSr3q0hxmgRNeXTiHi0znu70IywDkuiaDm7K6DhlT11/7dJXL0K3EtgR@vger.kernel.org, AJvYcCWt1cvwmWHzkiZTjqRxApPApZ1VKXG9i8CBCKCfohzM+tZPJMpQzwqOks89yq+kJ1NrtzkkR6Maxw5lqtcC@vger.kernel.org, AJvYcCWwLYUMZ7nCOa0HqUp6ArSEDwyde0v6FVdnW5J3ff61NhC5BSHr3eX9u+qS05BROlMqnHlwncMWF/ANLZk/@vger.kernel.org
X-Gm-Message-State: AOJu0YyLyc+4QyjUbzyC5bIHoDI1CuYvriX94awrvuHqjfbokd6ZoOsz
	mBcHduW7QmU9u7I1czk4rJZII3CYfzhY0CGTnKgSoWx7h6hdxBYp6U0qcCzX
X-Google-Smtp-Source: AGHT+IHJqyapFBKOON3QyW/aCDKnHFR5P5nYewm7xCRhQXhZ3/cPAH/NbBXMeDfGtFQLIxdmZOQT6Q==
X-Received: by 2002:a05:6a00:4fd3:b0:714:3de8:a616 with SMTP id d2e1a72fcca58-71de2449f43mr796517b3a.19.1727992682109;
        Thu, 03 Oct 2024 14:58:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e67esm1863026b3a.39.2024.10.03.14.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:58:01 -0700 (PDT)
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
Subject: [PATCH 4/5] arm64: dts: mediatek: 7886cax: use nvmem-layout
Date: Thu,  3 Oct 2024 14:57:45 -0700
Message-ID: <20241003215746.275349-5-rosenp@gmail.com>
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


