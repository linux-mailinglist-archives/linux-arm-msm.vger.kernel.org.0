Return-Path: <linux-arm-msm+bounces-47984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01326A35711
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 07:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 649C11891DC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 06:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C261DF98F;
	Fri, 14 Feb 2025 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqPLzfZ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32A522071;
	Fri, 14 Feb 2025 06:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739514523; cv=none; b=mD/tY/Tyt/diLm++5yQoLsZOVPd5L8Q9J8gqZuvwNHQjDPVoTKlY8H9bKjGtYyJlNl6gJd0cDzISuLZ7nkTN2iZyMmKdErrVufZeN9zk2Jk0dd/8yAeTPuodebZTLfyBNFeF4mWi/iA/Wzq0sQ+DyaUVuIwardezhXWR7nJhq/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739514523; c=relaxed/simple;
	bh=47qx1ydYEzMXs6DoEUh9wHDFEAVnOccBF+VDM4L/lUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xos57Fx86OuciPjVscvxjPYjkiMtyyVhOJyvW2WS4kRjQ4Cr8AA+bsPvvVI2WW1mS6DWO5K/WVOwE0c9KMQvELAUXQCjm0a2Wqu7Otjoc6I6kiqmICg58/+4QF3N1kH6ojAAiRq5mKBmADtSJ0uaTz8UZwEceqiasul/G//sNGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqPLzfZ0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21c2f1b610dso39559495ad.0;
        Thu, 13 Feb 2025 22:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739514520; x=1740119320; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVGmeaGTz9AtBJup5q3xK7+XQzry8LR1zEoqK2c+Ghk=;
        b=ZqPLzfZ0++pKXV34q+NihVfQoylwqLEFwwFJ1WTMzOSKuWU/97Igq5VSpkTSs65Kvk
         WopV0lcvPq1tYlDm0DaZircmU3fxX7/FoMHDbp6ZCyK7IRvmVAEAjp/QiEaQIIm6bOUm
         oK4hg2mwF+riuVu5QuxVBa0Kr1oDoM4/vm47GbtukG68FTNzg2qnxvjC7qhhqzVvQkrj
         15MUX9WCh/jHyQ5GIcVCyDAkOPHP46uI6iEhWNbPs/EUm5VAmHYj3KNzTTPGwS4XCRhW
         9t5NCXBUSAO+VqdXmWZ2znUhqRIgf0A6GFN5sdXegsfoHEn7YmI1JG5afFuGf7BcTFrm
         bNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739514520; x=1740119320;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVGmeaGTz9AtBJup5q3xK7+XQzry8LR1zEoqK2c+Ghk=;
        b=uLDLyOTT2zt8Vg4wQE60+7Jeu6GBR4jz5LeD+h2P0vaE6QWD4HdpNnh5w0/kv4B5ls
         vKJ9LgrWIzZM5eay9TbhMZyk0l0avPtfbq/wDAZaLuVRC4H61v3QTiQe+OBzXIxozXex
         ynz5z819yRWTu+ZPV0M/t1Q+qmkXwepptYPdDmBU92Dib6Aisvmmpyyg1homOF++xD6J
         G8PyQXEPcY4YPpj+w1YOitCl4NMr8EhxIOXCRfKGsqta+FvRpEMeW2cI7ylJPhgFxfMe
         up9M1sOxgr5uDLUV2sExRPTbX3DVwzKy4HHqAkOT5AgCh9jNedJl413ptrx++9GuXZ0C
         KULg==
X-Forwarded-Encrypted: i=1; AJvYcCWk7sZIDZQ6iFWcl32BnUTHmKRwnQRAU8fQwL7KSy60mAI5DU8x3TLX8zisHaqOgzNCJWnQZ5qeO7sUTKNq@vger.kernel.org, AJvYcCXmbkXL7fx1t5RU9qI3TkxmsI/LexcJaWQJzNbHuTrdrwIzYEKOWj+agyjgCGwaY3eFGg+nEnQkQ2Oa@vger.kernel.org
X-Gm-Message-State: AOJu0YwjnbxGee3diMvEIr/8UV2wiRBuxwfAoZgOhJfu8tOtNvR7+B8/
	RouDu13qIt7APRCLy7TJ6l3WqvOpFg4OBkvKi95ACYqvKXkpR68KTJ65gA4O7iw=
X-Gm-Gg: ASbGncsEjsxZI/2N4PUnE0/aDT15oTYwCdQyky6pNS5ipvdR/6lHC6UlptlOlAR8Y4z
	bJGd5haLgK93GMl66sQAbZ8jcADu83LVqkrQAH1U7IuiKsnPlUVIQa+GqY+cArbTObalvUo3Y65
	tfC6LHjf0oEGSeTCcrDcmD06L7gtMPeqvrTOGTWv3AZ2FjLAuOPVANi7m23N5TNmVgZs/C8W+hy
	5X1o+NiVQLuuSfoIJl8+lSucz6f4uKSbh9tIkDDMSoIKpFG3rmP9wZiWBaFEGu7EXuqAsuGZ2vm
	3uJ6obYfs2DVxc2A
X-Google-Smtp-Source: AGHT+IFeSmvfTmxWPt9XSROvbn4nXKaKJF5igEnu/0fYb7L853tmf6/z/U745jCxay8jqyGw5Rpjxw==
X-Received: by 2002:a17:902:d58c:b0:20c:6399:d637 with SMTP id d9443c01a7336-220d2132be5mr105133115ad.40.1739514520611;
        Thu, 13 Feb 2025 22:28:40 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:119c:d54f:786b:76df])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13ab103dsm2328417a91.6.2025.02.13.22.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 22:28:40 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Thu, 13 Feb 2025 22:28:39 -0800
Subject: [PATCH v3] ARM: dts: qcom: msm8960: Add BAM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-expressatt-bam-v3-1-0ff338f488b2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJbirmcC/3WMyw7CIBBFf6WZtRiYtgiu/A/jAmFsSewj0JCap
 v8u7UpjXJ57c84CkYKnCOdigUDJRz/0GcpDAbY1fUPMu8yAHGuOXDGax0Axmmlid9Mxx8lpJUs
 jUUKW8vnw8x683jK3Pk5DeO39JLb1byoJJpg66YqsqsuqwkvTGf882qGDLZXwU9c/OmadpOXC1
 k6h/tLXdX0DaGHduesAAAA=
X-Change-ID: 20250208-expressatt-bam-d0ed9863a626
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sam Day <me@samcday.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739514519; l=2931;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=47qx1ydYEzMXs6DoEUh9wHDFEAVnOccBF+VDM4L/lUE=;
 b=gyGK8vgOzaIF2KJeScbf1R1RNco6n2f74XjfMtro5Q8DurMDU/Ugq3OakovqK73HTv0romD1K
 1tYXs9PHhaBByMGGHNaiOvMlOCBSGFfwMIPiXoW2jibNk39CPX0jzOF
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Copy bam nodes from qcom-ipq8064.dtsi and change
the reg values to match msm8960.

Co-developed-by: Sam Day <me@samcday.com>
Signed-off-by: Sam Day <me@samcday.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v3:
- Revert the size of sdcc{1,3} back to 0x2000
- Link to v2: https://lore.kernel.org/r/20250209-expressatt-bam-v2-1-e6c01c5d8292@gmail.com

Changes in v2:
- Reorganize sdcc{3,1}bam to be after sdcc{3,1} respectively
- Link to v1: https://lore.kernel.org/r/20250208-expressatt-bam-v1-1-8794ec853442@gmail.com
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 865fe7cc39511d7cb9ec5c4b12100404f77e2989..1a98a4a9a586164451e2777c53d978cf47ce3d24 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -279,7 +279,7 @@ sdcc3: mmc@12180000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x00051180>;
 			status = "disabled";
-			reg = <0x12180000 0x8000>;
+			reg = <0x12180000 0x2000>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
 			clock-names = "mclk", "apb_pclk";
@@ -289,13 +289,25 @@ sdcc3: mmc@12180000 {
 			max-frequency = <192000000>;
 			no-1-8-v;
 			vmmc-supply = <&vsdcc_fixed>;
+			dmas = <&sdcc3bam 2>, <&sdcc3bam 1>;
+			dma-names = "tx", "rx";
+		};
+
+		sdcc3bam: dma-controller@12182000 {
+			compatible = "qcom,bam-v1.3.0";
+			reg = <0x12182000 0x4000>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc SDC3_H_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
 		};
 
 		sdcc1: mmc@12400000 {
 			status = "disabled";
 			compatible = "arm,pl18x", "arm,primecell";
 			arm,primecell-periphid = <0x00051180>;
-			reg = <0x12400000 0x8000>;
+			reg = <0x12400000 0x2000>;
 			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 			clock-names = "mclk", "apb_pclk";
@@ -305,6 +317,18 @@ sdcc1: mmc@12400000 {
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			vmmc-supply = <&vsdcc_fixed>;
+			dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
+			dma-names = "tx", "rx";
+		};
+
+		sdcc1bam: dma-controller@12402000 {
+			compatible = "qcom,bam-v1.3.0";
+			reg = <0x12402000 0x4000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc SDC1_H_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
 		};
 
 		tcsr: syscon@1a400000 {

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250208-expressatt-bam-d0ed9863a626

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>


