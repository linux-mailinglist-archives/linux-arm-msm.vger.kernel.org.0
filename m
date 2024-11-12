Return-Path: <linux-arm-msm+bounces-37610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E19799C583E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 13:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A377D283DB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 12:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BA770817;
	Tue, 12 Nov 2024 12:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwcBxAhX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC981DA5E;
	Tue, 12 Nov 2024 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415640; cv=none; b=HKz6kLZSdaVCvRFwNDE7yMbFkgJ8O5t0HROBw/QrvUP58RSZFf4ghT8sOjpdQdTANtLgk3J1bSFrcUI1bIkDAJbBdH7l07o2WfKf5ct7Z7xM49v80FwxkHg8BIuWv6vpVVUsbbHDMlCbM5MMmS9bURaTOwZmlDdgIE9wEuIil5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415640; c=relaxed/simple;
	bh=X+jLQfoGRtei2d/QjhR/7M+LmZaJ/zvfk3jtFKfMIh4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dg8cEkkTdO/6duBVGvfuOD0sj+2n+GSUgXS7AlLhWDYlL09CFeBBqeHxeVliUYEi20syhZUhJXa7zexlkBbP7pnTPzBErsQr3RlTily0cN5t0y+zxR/ANuu6jG4ZKAy8i8biFm/Sz8cQZKHd7HhggJEsoV0UUCFOf58Tzo8PivA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwcBxAhX; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e7e73740so5247528e87.3;
        Tue, 12 Nov 2024 04:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731415636; x=1732020436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1l/8zIWx9ByG93a85cgLjNVvi5N7DhTgRSp0I+NsBNo=;
        b=HwcBxAhXHIkvv5RN/yC1dkdVAuGyYPj4mnrY02+UdBi4Lq26f5hHFC0TE6YrI5S7cF
         V17587vsDKgAoRcix8XYH7JGNRzMBDnPvVAzVE2t1RXXDI6Y6ERYC6U+g+zlTF7bS+Qt
         9cvgEd2OXdsy45dUa5OVhRoWOTgsrKe1T7TcVoc0lwEo7n9owZtjVgDCfgo1ZIEK/cBW
         uVzfxhgGOXQELeMCfKt+5t/sMF1bmjdkfrj8bZeB8expU7MqEbkyTnVbjXdQUxnCEVCp
         EC1EwDf9/O+FZLcmWUDVLJ8arxpIAu7JKZq6iB7u68kQf3NR3hpbESTd3f1+wllgJnw1
         ZjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731415636; x=1732020436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1l/8zIWx9ByG93a85cgLjNVvi5N7DhTgRSp0I+NsBNo=;
        b=w1DJdm7viEOeEUn4EexmRsb1JdL/Qvra9Z898AYUSaP4eoI9ZNgbQZRmiiSK2k/ZTX
         vGhLG3gRbtVH2K3k6zPosKCgqPIy80Cmb1ukTAG9bUwZSjvWTBCtpm0vhKUUlJcm5kLO
         mqNQz0pNrY0HxxE/eL/fQpQ65l1TDiwi3Vyvik+d68CxsJze/7WGODW2u5bUxmcbFR1e
         4BJcUj8FicXBBO7zaaEJVSNHdhKz0ORi9VLPs3LklzmzsuH0yOhdcgQm5Ht/fj5AJs42
         j3/1/hFJX5WFle4gf9CaMXb5jf8G+u7WGOIv6NQEx4BB1QOskaeLBS00fk+jUje15irH
         ODHg==
X-Forwarded-Encrypted: i=1; AJvYcCUnFvPxbpMNijGoSNUpU4JTyt7cHa7ZeNaTP07xX694kwk2xuIXEkdaRqUc5k5rbZnof/PXw4ZrvaJg@vger.kernel.org, AJvYcCVFZFQIzVOMX/MIlQiAw9JPjMF5kfUflmRA8DUirzCmdUKpUExOinvwXXyPTyoY6iL2kivpgdIDrDneBzWx@vger.kernel.org, AJvYcCW2QAPAP3pbS79GW+WkDh1JS5lDuT8Rys8kvPyr+KZdu7pZDcKYwPs5nDcAwU15Vq7r4U+vC371x3hgFjXPgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGq+fUbq2vRRgUR+F3VWUdpzR8l+xaevY+hjUBPNcb6Wc2kFQ3
	duVABDRnoc86gA/PWmqBZ68XVvs/BbH+oIJxWx205qFkv4vOuyAX
X-Google-Smtp-Source: AGHT+IGlnKKltAFgPKq1ayj+s19oGo3VkeizvwN9Pm+xzjqpVaZGBKH8G8tVYcgFXRl3ErD1m+9Qbw==
X-Received: by 2002:a05:6512:12c4:b0:539:ebe5:2986 with SMTP id 2adb3069b0e04-53d9a40710amr1412217e87.12.1731415636223;
        Tue, 12 Nov 2024 04:47:16 -0800 (PST)
Received: from T15.. ([46.175.113.10])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-53d8c3cbf20sm1142577e87.132.2024.11.12.04.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 04:47:15 -0800 (PST)
From: Wojciech Slenska <wojciech.slenska@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Wojciech Slenska <wojciech.slenska@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qcm2290: Add uart3 node
Date: Tue, 12 Nov 2024 13:46:49 +0100
Message-Id: <20241112124651.215537-1-wojciech.slenska@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add node to support uart3.

Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 79bc42ffb6a1..0fae49d6ff16 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -550,6 +550,13 @@ qup_uart0_default: qup-uart0-default-state {
 				bias-disable;
 			};
 
+			qup_uart3_default: qup-uart3-default-state {
+				pins = "gpio8", "gpio9", "gpio10", "gpio11";
+				function = "qup3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart4_default: qup-uart4-default-state {
 				pins = "gpio12", "gpio13";
 				function = "qup4";
@@ -1239,6 +1246,23 @@ &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 				status = "disabled";
 			};
 
+			uart3: serial@4a8c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a8c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart3_default>;
+				pinctrl-names = "default";
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				status = "disabled";
+			};
+
 			i2c4: i2c@4a90000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x04a90000 0x0 0x4000>;
-- 
2.34.1


