Return-Path: <linux-arm-msm+bounces-33057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EBB98F95A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D575A2843DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 21:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9391CC8A5;
	Thu,  3 Oct 2024 21:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUipoY09"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B24F1CC168;
	Thu,  3 Oct 2024 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727992678; cv=none; b=sJhRErJWPuYkox+hZw0o7aGthai3YFspAT8HSJm0SMYDGmSi+/XHxFxhicQSWmIUtvhewzu+hhUkwNaqO2efBOAgVWAff2ZJfVzzOUcwrdxlzmiOrWnVqqkiHkTCiwPPSl4qonqS7BlxB4pNgofC2ucmV7WHafC1Ccy+BZDOVQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727992678; c=relaxed/simple;
	bh=6ZCWV9h3dqt4AGRHQWZ38vccF3lDlCUZEePHqFCzB8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEe8phpzW7YzslPN3NHkzT3HIbz4pRkmK2/HvWkU9g59ZtHfvLqrjUL7OGvPALvYfmdEJhlYD8l5jatd1fjf7o/HaAr7FK9KccXL65t+OMwjL+yHKKXDS5wMJpYMQ3Pwa8RK8Kd+VLdMiA8nzryh6441Sfmo9bs/Ac1kptavAY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUipoY09; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7198de684a7so1162572b3a.2;
        Thu, 03 Oct 2024 14:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992677; x=1728597477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhcJclvvKlTVpqudlmq/F4CEOdWcM7OU7+3pakydX7w=;
        b=mUipoY095hucE9hxZXK3Cciurilkz+TixOs4u6cogp8dYc1MQmwSvCBneC5hnF79SR
         SlAWZyV/7j0mHFX61zNGigohDAZ4UP7tjhHpXvONZ4Y+/nMHSgq2lOZND02vxTFOrt/Y
         /Jh0kj9I4PSbDrRx53/FCmHXc/D9LU6jsSygvi01NPqadzZmuX2dTAzGLSKVbsU58CmV
         wUtC4zIUpAsJjZhlD3iEKmpYCasWBKyPoEUJsNoM527M/nk0snR5vTSDgM4ASywSYXBI
         qWIQnPm7Sm0kAgOviWC6B9H0sYXFjxOzewlAe31OnHLW7d5j0+EKK8RdGsrzcIZcvdrs
         ZUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992677; x=1728597477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhcJclvvKlTVpqudlmq/F4CEOdWcM7OU7+3pakydX7w=;
        b=Mnef8fmv0kds/GOeo2m0IR6PUcJhVdZoQ+kK+yeX/4Ao2/jZgedwC2OmdkOH0HFPfP
         RFVnLy7lKKsjn79oGRbA3b4F6BDYyv1jJ5dxhta7qk1LetbBNFlt0T0jcbDnUpSYCmHv
         PhsNrWUodcQptuGAXGxtyQc2VEFUBbHQNDPUTIVPQKuHFsHA5Nm4KyumgkEfcatKNpfg
         tk0RduqppR7KaDyI1e+AcAYmY7O+4U8RaU4D271smkSEfJK677A+zzn7QzH9VgTx31fD
         2qbh4kM5y7s9Ewq1N7Cs7gEXdpHJvRY8wzzFhOgQFMnfcNp/kQdFuYaCaiFkTYJNbzXm
         Jkrg==
X-Forwarded-Encrypted: i=1; AJvYcCUX8bPi7cdCAnujCb0E9kgtIFgQjDyrkgpmaTAJEHnogHnxUV/uyuX8YQjrD72dN61tKtkP6eLfMgksmo75@vger.kernel.org, AJvYcCVZCNcmZJaEFySoq1LGRET7BGKSNY9d5GMoPSE/hCo3LeuVjPPtdo3K8mSYf/FOl4IyQAFxtSUe@vger.kernel.org, AJvYcCW01P+dQGtjYQjvolb1MOb2JdLQtXBvVp8NeuCDDp01cdJjTOk6VINK288AOsZ8V2AWHbTupa5ys+wcoX3W@vger.kernel.org
X-Gm-Message-State: AOJu0YzCzHoGSQZP8lG/+AgfNQmmdjPsrwq+vYb3tEMg1At6mHYiceHp
	AhlM/JM74UXb/8lRBzdGdcmKt1hpc364GU/BBb2Jo2IBuBO35XblcX5uuD1b
X-Google-Smtp-Source: AGHT+IF2A+OiaIcWGLxGd8MeHk5wY3Ar7PK8Rihzo/zaHvJamB//ytcahyJROu787wdayCYZ6ZY2mQ==
X-Received: by 2002:a05:6a00:181a:b0:719:7475:f07e with SMTP id d2e1a72fcca58-71de23a7b55mr858114b3a.4.1727992676621;
        Thu, 03 Oct 2024 14:57:56 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e67esm1863026b3a.39.2024.10.03.14.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:57:56 -0700 (PDT)
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
Subject: [PATCH 2/5] arm64: dts: bcm4908: nvmem-layout conversion
Date: Thu,  3 Oct 2024 14:57:43 -0700
Message-ID: <20241003215746.275349-3-rosenp@gmail.com>
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
 .../dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
index 999d93730240..df47fc75fa3a 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
@@ -144,16 +144,18 @@ partitions {
 		#size-cells = <1>;
 
 		partition@0 {
-			compatible = "nvmem-cells";
 			label = "cferom";
 			reg = <0x0 0x100000>;
-
-			#address-cells = <1>;
-			#size-cells = <1>;
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


