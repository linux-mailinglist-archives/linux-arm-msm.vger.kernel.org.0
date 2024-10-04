Return-Path: <linux-arm-msm+bounces-33068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B616E98FB40
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 02:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3BCF1C22C64
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 00:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EF617A932;
	Fri,  4 Oct 2024 00:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jn70LPp4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5425288B5;
	Fri,  4 Oct 2024 00:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728000024; cv=none; b=gQIg5312eYY+CFVZuCm6/GQ0X4I+xQwx/mgHJ/IYxX4vAmML8Xej60Zym/XU0PJyEuNtxI7rfoMDFFh0m0ZvofmmKzLBd/d9m/T5KP4hK3H80sokX93I8L67D86xiTu79hxOqJbdJS7fmcqJwRGI+Y/wk39frMFNlzVUuCVpiXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728000024; c=relaxed/simple;
	bh=8W1ncdfuUr/pmKqqzrfdU2GbcujlsBW9bxCSyhfwVQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIo6pCaQxYSo/myM0cbPBzt3jvJPrpV1+fgpPY/Rz2JqRv8k4ANnLo1H1NKN+NsULPeuIE/lYFfPjyS9whjvwDao88D8SDdEGIHrfuHvXku6TFc6BilfDLpJwul0cnmF1pT+YAozJ9Tx1qO/gG9bF2oQGh4mwMuXTd2Iw9iqL0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jn70LPp4; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71dc4451fffso1557188b3a.2;
        Thu, 03 Oct 2024 17:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728000022; x=1728604822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DckmO3GetrEG9p87L1DNtWdqDrBGlrP6K5aSd93K3po=;
        b=Jn70LPp4isi2r8DIeBOZHWDVMyhRIEq9n/4gfWGJGpYw9hyoB1orUUOZ3+Yt+wRjGQ
         UUzZCtL0YyX54olgglUAFn9d3+rL9sZvEAe4UoKGoFl9NyHbt5qU7nwMenWAusCbcjCH
         hsIBkXezCmBDjwgHr3dMqaqPyOoG/Gi6pRi5O+8rbmTFPAd5EIuYh2iKUudBaFoazqS9
         9wgq6sou5jGYxAF51hYXyDeCnlLXPZD0ri/ADEIMZrzgwinhMyjHJsnk9vvQaMi3CNvd
         G0v27bJcZ06ITsTMJBJDg1HSBHct+O2UGk2L/ju5C4slO9WH0uDhdBKJdTMxfuIqpvaR
         QImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728000022; x=1728604822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DckmO3GetrEG9p87L1DNtWdqDrBGlrP6K5aSd93K3po=;
        b=V2czhvag2FnGArvRGtexZvzoInU9EMq3+YPr4aTJKK4DOHAbRj+eY8Dbj3unO9q4s/
         VCJ7vCoiQMY9tO8PQXMVMJrQI+kHMYB0mdyCRmC8tu12MIoVSRt0iiE4q1LGPv2epIHf
         J8y6Ta+yWT3bkTF7umM9WrkrybDac5lBCt7wjd7+i1ITw6c/natqeI6Zuj1xQvFsaCTU
         eWy9vgnIhv4hgsAH/J/EfmNxpx04Jd3sqw1MqOZNNdxlpp/bcy5hNGusbfYiY9fd+aaq
         aUQPYV0lUuyt+KvtGJFdzt+S2f81eW7pLw8HP4x+PKbiPLmVH66i+3dP665f+/9NxvAe
         KAIw==
X-Forwarded-Encrypted: i=1; AJvYcCWVkimpTOCbj9/ymSXYM4JZLlhgTOHs0T5H7GbpOw6uRDWptkYlp7pxxMW45zSjQxziWnn4TBJYSfmTak4k@vger.kernel.org, AJvYcCXAvrDuN0yto6m5theideaW40VwldW/TTL1qg/yo7kgw/UlaEeSQf6RmGYXQuN+v7rzOPJjGyaP@vger.kernel.org, AJvYcCXFmpzFs4MQ9rND+hb+F2IV01hzi3HmGjQ7seMMT9mDY0QfcUtLBRxUaGf8h4qnXhBoXyERBMjC7OPS0LWR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx67dTgqDvA3PZNrkxWc5ogdENzoxwwfFRsfL1IGp/6K4zM21Kn
	oLMyKuVYrP2NfWgKYk6RYanJlzn00EencaII2IvPRWib0+NmW5tmZSGAiN+n
X-Google-Smtp-Source: AGHT+IHm2GUKSAgOZ/HpAD61qlTLptSCf6b1ehUZaaZSY4WZ55Ktmo+s9wq0ZVPPshsAPAeA01XKkw==
X-Received: by 2002:a05:6a21:1583:b0:1d3:2923:e37 with SMTP id adf61e73a8af0-1d6dfa42fc5mr1511911637.30.1728000022072;
        Thu, 03 Oct 2024 17:00:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9cb0b28sm1983047b3a.0.2024.10.03.17.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 17:00:21 -0700 (PDT)
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
Subject: [PATCHv2 1/5] ARM: dts: qcom: ipq4019: use nvmem-layout
Date: Thu,  3 Oct 2024 17:00:11 -0700
Message-ID: <20241004000015.544297-2-rosenp@gmail.com>
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


