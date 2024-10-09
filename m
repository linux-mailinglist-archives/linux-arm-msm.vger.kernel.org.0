Return-Path: <linux-arm-msm+bounces-33744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 137CD9977D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 23:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93EF8B22E53
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7061E3DD5;
	Wed,  9 Oct 2024 21:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="In4MECCV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6BA1E32A4;
	Wed,  9 Oct 2024 21:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728510536; cv=none; b=bBsOBXZN107ASIRf3a15VaO/jl/NWI6y1YB3WZiYeh3yBaGw9K/wJd8L99Zg374T2Tjhz4ouUAmSzmi8vHe3GscNoXNbudEfwxkOrjsgKClV7J4pPDyBO4FmKZLcFoVt1B9rGGo5/LgCwiGj926c5UXMpSfiQ3Ks4enfygLvHTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728510536; c=relaxed/simple;
	bh=8W1ncdfuUr/pmKqqzrfdU2GbcujlsBW9bxCSyhfwVQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SKwJSEtKUMPBplD80pnSJoFoZkrwrlZmWFhoQHIqWCuFvDAPLoBxU2qJAMHBcFNifJ9AHsRjsvrLIDgcAkKdvgqWtLB15xXV8tNDu8pj7R+NmxJP58WvRShIW71gteyKOKWSYrTyNYMoBsHw/kgWi7HZQNPdNw5xUNhp2Fu7D50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=In4MECCV; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7e9f998e1e4so192464a12.1;
        Wed, 09 Oct 2024 14:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728510535; x=1729115335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DckmO3GetrEG9p87L1DNtWdqDrBGlrP6K5aSd93K3po=;
        b=In4MECCV4RvI3b+RDkgjC6OIlObnvFduMwP7024uHs06rWZmFPKL5I6Rbya/xj8dCe
         khc7EUw4PXxNnbAYlrBtcVzCd77mfDqomRfTRhynQdaFnKVaCEgrnyn5/vaHLTGl2lMY
         jjKYtz77EDu+3asKJldG412Pv+RnvhmCOuq7Jc7Nko1yvonJRNUW18HQnN3sW/sTccGf
         nNAHd7OojOy9gKB/3+5KZd6RED+GHTCpm2q19NWfgk5GZM4pr3A4vJzPM20e92iJlPAg
         kLE12suBkosFBd7OVQkyymxKRn8cYrvC/q+ippgi82oiDnBnKxyjzkcMl4osSn6Jsm3z
         lUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510535; x=1729115335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DckmO3GetrEG9p87L1DNtWdqDrBGlrP6K5aSd93K3po=;
        b=hwqr2tJbGrs1wXuXcUt+OBGo1i5Eg0tzcWThLBp25WJ8W2ZKVKGdDDh7kLJ5xcCFnu
         VLS3dUtjV/LtHiRvfNFHJQWzbGqM/+O+AS3rAHv4YEHsOWOtpo33kRNPFC+I7nEKtDt1
         vXcwTflMwErqkeRr3vA/UVldcEYIgaLFgbrDYK6ZedyOKkNRWQ+Cfigq7JL9z013NdpL
         t3hVRe3Ue7YbMRdWJI/7qNgH2Gm9FncG4Y/pcOmgnKxZJ9RRzjZeDo6M/cu4oihZxaVQ
         MAkqJiy/CWwK3/c/zwOqgjjPMkevahfbaf2/r3tx1emoTKchfgNBhnzaVWJJ0/2K2Rrn
         0p8A==
X-Forwarded-Encrypted: i=1; AJvYcCV5XrxAEdvVY5BQ8d639uYXU87ocV1nA6CDPu1GYSK3QsxnkUvCFYB8r1L/E5IdTNSMWQXryjkZ0nKCxwqE@vger.kernel.org, AJvYcCVFOegdRrFDNB+ddCkHv3ohds7fyxbBLnWkTxEcpCSO1pnsyyiawe7dh53D7BUHR6QyCbznNX5I@vger.kernel.org, AJvYcCVO/YCcgk335aBgfJF4oLXa4mErepRyW/OTI2E62tL0Mq3FIo3iGUc/2vjCx2Bd1kHwIKfpJOt8i2OWyRdl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw94f4L0bITVgas7UQ05ZN2fU0OD2aYL3zMbWE0pkol5MpZ9m3/
	SrqNqRYpz3Dmw0IiLVbAwE4avbJy0qiVaGXv5G9HHxOwX7tSm3HrqdE3Kssd
X-Google-Smtp-Source: AGHT+IGhwngumyAYyqZ1symFrdRfFaXP4R+sFpGQBU93XFua+hCTTIL0kqZrLusjEuP0mO4Kr5kc/Q==
X-Received: by 2002:a17:90b:347:b0:2d8:8175:38c9 with SMTP id 98e67ed59e1d1-2e2a2476181mr4650725a91.20.1728510534600;
        Wed, 09 Oct 2024 14:48:54 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5707cacsm2250091a91.21.2024.10.09.14.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:48:54 -0700 (PDT)
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
Subject: [PATCHv3 1/5] ARM: dts: qcom: ipq4019: use nvmem-layout
Date: Wed,  9 Oct 2024 14:48:43 -0700
Message-ID: <20241009214847.67188-2-rosenp@gmail.com>
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
 .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
index 0d23c03fae33..a6d4390efa7c 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
@@ -166,16 +166,19 @@ partition@170000 {
 				label = "ART";
 				reg = <0x00170000 0x00010000>;
 				read-only;
-				compatible = "nvmem-cells";
-				#address-cells = <1>;
-				#size-cells = <1>;
 
-				precal_art_1000: precal@1000 {
-					reg = <0x1000 0x2f20>;
-				};
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					precal_art_1000: precal@1000 {
+						reg = <0x1000 0x2f20>;
+					};
 
-				precal_art_5000: precal@5000 {
-					reg = <0x5000 0x2f20>;
+					precal_art_5000: precal@5000 {
+						reg = <0x5000 0x2f20>;
+					};
 				};
 			};
 
-- 
2.46.2


