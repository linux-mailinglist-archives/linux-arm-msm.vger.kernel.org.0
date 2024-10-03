Return-Path: <linux-arm-msm+bounces-33056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0C398F958
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE5E71F23513
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 21:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0550F1CB519;
	Thu,  3 Oct 2024 21:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJPxkTPt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE9E1C2323;
	Thu,  3 Oct 2024 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727992675; cv=none; b=Z1hMfM1uIJ4AvDQG1ol7Pb7pQa2gtHh0ErQi5CjmzkGXb6PQ5G3Binbu4oyZ78XFN1/HVNJ+u6cRIfC7npigx8WuSkoGqWvxEqJznNX5vfko/Qc0crKrjHh1tF32sXEBvhAHRKgXYzk0FLZGKYghUfyjCWMDJK9rf95mkvhCzwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727992675; c=relaxed/simple;
	bh=8W1ncdfuUr/pmKqqzrfdU2GbcujlsBW9bxCSyhfwVQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BG7wd6A7ir4+UyIVM+85gDpH4O68wOkS6u3VO0lcNRqB8Z3gx9MUUMPw6Xsc/x8dLvwnaqgcyi+V/yNMt92qzJNDuSiBUY1BQP9VcNmFo3GmsD5UbV0YQlVfAv2mvhKseBHWGmvT/yFlGGJnRJudK/YG66RyYXYZYJR76gOAnt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJPxkTPt; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7db908c9c83so879096a12.2;
        Thu, 03 Oct 2024 14:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992673; x=1728597473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DckmO3GetrEG9p87L1DNtWdqDrBGlrP6K5aSd93K3po=;
        b=JJPxkTPtylY+Qz70qCSvPFbMjmXqQjEP9VNfYZZ4AE7xiexFffp6dt+SSOByYLstpT
         WKd3N5PHQ/LwlPDAq6qWQBbhdeuxv6yAEMVDFSJ40cCIg6CVMqSq9uEKr18Ass+nZ0eG
         NDZNfWycJex8g4ujxdHJ5x1BbGCLsGIqkJlTdSGv/QtapNNrCHxZPa+iN4WoWheD3Xk7
         QyJxBFZQSjONWhPvMuIPr6xPYS+uRu1UDw/34MhXRe/5o/qldf277ig4r+JmCOVWpnV6
         J+6K6tXWW4S1K5Pv842y3EL2b9XxL2Q6UkoqIPOnT2ro1jMeesisIjIhyb53xUFjKGwT
         7B6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992673; x=1728597473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DckmO3GetrEG9p87L1DNtWdqDrBGlrP6K5aSd93K3po=;
        b=aTzJrcOX/a3omlicXyyYzQtfTjgzkJ2Lvw81kHGLZspPOHl7AzqgZEr6+rN4MadqbI
         jdW8i8iAPWemuspHilhEKo8V4Y5+1LjaXktvxMrX8MUuyiTfwxZunJjv+suNVP0yiptA
         rfQYvmPpEMDSXvNGaMH9eqAVklN+mvCbJbxFQmGaKXkTOoTPCvMo7/DzbGgjO0fPfB6o
         lsatzGfhOQH4ABPagvqKql+vWvCQV1RAO1hbybIP1hOVjgLQ0o3zd/t/3cKA9hQu7woB
         yJS7WeKrcKxwiqA58JB/uHi0HcmPJvlXfbJFubQvMKVmiTaGA3nmmU1EbrkCNkBti8jn
         4wXw==
X-Forwarded-Encrypted: i=1; AJvYcCV22aSv13XQrWf16Tmt4pWej8BLqWZQh5QKTEvS5knC23DyHxLqCBzMdsurwPdqaOpiX/hc72Nm@vger.kernel.org, AJvYcCVq8r9N760Io8rkpxNhejKtmYroSavILWDrmMZmYTyGN0JSTHGlxlizlbADIeMpSddLJGdyCmGoDg+rNdKu@vger.kernel.org, AJvYcCXVikWhJ7v6eOVjnICEzd89iRelVZCku8i60MHYpQHISWuUhkuTkdeHfCvchKeQIz3VZ1It7rLn+L5+dGir@vger.kernel.org
X-Gm-Message-State: AOJu0YwJiiqjUSKgIuOUdpMf9GVfmcWXRQkQEBcXXa0nJUtidQut99JV
	CPzP4erukEXoVB4s2P22w+ZI7JLJX8LyleV2QU9i8alTn+Vru1K1Qp/u0PN9
X-Google-Smtp-Source: AGHT+IHV0ZruXNJv6AzhOrEEhOLFYJ67nUgRR/hs4aYDbbI5bNfk9FeWWoW2cIPBdRwzo2izo5msvg==
X-Received: by 2002:a05:6a21:a34b:b0:1d2:eb91:c0c1 with SMTP id adf61e73a8af0-1d6dfaef79cmr986798637.42.1727992673503;
        Thu, 03 Oct 2024 14:57:53 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e67esm1863026b3a.39.2024.10.03.14.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:57:52 -0700 (PDT)
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
Subject: [PATCH 1/5] ARM: dts: qcom: ipq4019: use nvmem-layout
Date: Thu,  3 Oct 2024 14:57:42 -0700
Message-ID: <20241003215746.275349-2-rosenp@gmail.com>
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


