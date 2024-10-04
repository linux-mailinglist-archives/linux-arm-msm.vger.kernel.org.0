Return-Path: <linux-arm-msm+bounces-33069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8156998FB44
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 02:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B312A1C22917
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 00:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E7F1CFEAE;
	Fri,  4 Oct 2024 00:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGPgoD7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55C41CEAC5;
	Fri,  4 Oct 2024 00:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728000027; cv=none; b=t/SJ/w1W5XeeyytbZhmMqECQiM1KZPqCBX03O0LDJMdSsaN0rQ18FRg6cvQoPXG0xiLXvWLPE+JyABSSwQjI4C03mCp2fXAXuySbxNzWzt3NkZsWXVHOmERIN1I6UJHxn2fJFaqYHqOiE3gg20FtjCFilIr2Ubn9hwuQYGpX4IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728000027; c=relaxed/simple;
	bh=6ZCWV9h3dqt4AGRHQWZ38vccF3lDlCUZEePHqFCzB8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LfrKm/QjdHX4vUllB+COOLLormYos8XmhqsUEAHAz6B6SrrYiuVB2WxBhcvWrAWfjpXM6yXz0d3H+ZsEIHudnZSH2dptZN4tlG4hdH8kywIwxwcajMW6jbBp6rIRLg2aUAP+19Fg8TL2mjcEZUBaZmz81jTHCEIpHKHh5mjeeHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGPgoD7L; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71957eb256bso1428973b3a.3;
        Thu, 03 Oct 2024 17:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728000025; x=1728604825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhcJclvvKlTVpqudlmq/F4CEOdWcM7OU7+3pakydX7w=;
        b=BGPgoD7Lzyr4RJoF+JUPDSqc1ox2uHeHEFRDCwgx5uvpT9kvUg4vF0fFmEWewtQ3SG
         pnbnQZY39Z+kCoD3YKMyPRwIGoKCz/RX5ReLLrWAnNuPJwdrg4B/LilSLv/DnsecER+E
         Oad1Fw5UAjElF/zNfjYX+LW/BtdgxyEPEe9EGZp9TArB2yPsWgDOShGeEPcDiGvTbc9D
         bnQ30symIIUNgPsNUBg61vFkh2Kgx09zabBZZ6ewo3hF8oJGbZKBNd3GhciSrebdqVZP
         /XfME5atL6xJn8eEZoz2UqZX5CNI/fDID01ckRjrlspo6r3jytXxelYnmq9W8IchxERM
         bt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728000025; x=1728604825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhcJclvvKlTVpqudlmq/F4CEOdWcM7OU7+3pakydX7w=;
        b=vj+yM7p4CJrW7cu6Jt1VHvEfih0ENIjfxmAa7GEaz3XUtLQGp3r7/2mUN24E1bn7Ca
         HLS3CxEi+e+Dd7fdG5eW0Y7dGsHuDaS9cN7xKS2xo8AH+04k1Avvu+S17H+mC15XlIbl
         DpoOCsCiq1u1TPQmv5ZUSjnv9rMyso7aOG4s8PEu336cMGHYaF15ujwp6cL9TG5T1mhU
         im614lk7JSpyiZHBdf5iq3Bh++GUpwjfNYiR0MbIGrk44Om1U6WCm6rhYrGTl5xWouC3
         smqFwBkKuWh+cqQKMywhTGKcsfd3FLZ/E3605Ah0T1qHbMIGSaFV/g9Gu6LbMN1pVbJM
         Grog==
X-Forwarded-Encrypted: i=1; AJvYcCW/zC9bXabYxp15NwccCuLOqiN5CFqV3eCrL7UJcnNy62ImjQrn4gZqPAY1WamqZRHJWBeKzmn/hITw4B3w@vger.kernel.org, AJvYcCWMprpEnyWfU5zj17eo93eEhbX7FosiJA64hFwGY81maT5v5TBA8K4RhFs293qDe3V+GqVsXRbZ2Pg5pbhY@vger.kernel.org, AJvYcCXLXC6X2BkWOnG5HRQ60i9NktfOBQBUf+4wSH0rJErR0ijBgCwUKdJLD6kvGma8wZK3l0m+FLqx@vger.kernel.org
X-Gm-Message-State: AOJu0YxjnsPUdxV70TeU23DbLLrMocr/pOU7Rj7kNMsHdn1czwOCI8zQ
	xqMC48JfPwx1YmkyhzXg+Ir3ghVmvj39iskrACOj9irX+6skTr0Jh/oLLcai
X-Google-Smtp-Source: AGHT+IHbZK38QJEukAZze8yEUquD9ve9JqDKgnu6Dg13ZkyRXwdNWpeQg7DPqKeFH5zR6BU/2QG0kw==
X-Received: by 2002:a05:6a21:10b:b0:1d3:292a:2f7c with SMTP id adf61e73a8af0-1d6dfae2978mr1585071637.49.1728000024877;
        Thu, 03 Oct 2024 17:00:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9cb0b28sm1983047b3a.0.2024.10.03.17.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 17:00:24 -0700 (PDT)
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
Subject: [PATCHv2 2/5] arm64: dts: bcm4908: nvmem-layout conversion
Date: Thu,  3 Oct 2024 17:00:12 -0700
Message-ID: <20241004000015.544297-3-rosenp@gmail.com>
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


