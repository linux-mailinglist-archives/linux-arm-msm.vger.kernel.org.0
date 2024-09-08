Return-Path: <linux-arm-msm+bounces-31230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA36C970A87
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 00:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29C6CB2134D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 22:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD6A17C9FA;
	Sun,  8 Sep 2024 22:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReUAei2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB3F17BB1C;
	Sun,  8 Sep 2024 22:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725835260; cv=none; b=cm1Sbd7HjcG+6dmH5tQ8cjd23UyJABuxQ1Qa+VK/nscq91TObYXOybgQJR6iYKqlNmXagJwjYz0nDXpizGVS8fVDvwDq7B9Jpo0lCiA8YMChJbTxbjNcJH0xQit4XMrUG+2BHAXdCdBHca8DCL5+x12GCz3Po5pkbl9qo3Ta3K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725835260; c=relaxed/simple;
	bh=g6GMtODJbQJNr+rNOvgyXhlI3yWoRxznLX6UL5DG/XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kr9+xyerE850DVnmv2iHHs4B+dFTLZU+3bhQf57GJzW0g5z1UNZTAvIyamICtGMSMsD0CJOWXuNF7N8MSEHwTSsA9inoONk2UaeOt8zvm9cjcZv/oMT7nzG0mXYGm/pSzS7jWeepzEvqG9+3ZHmSY7Tb3HdP809VDuIsvUhqGMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReUAei2X; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42c94eb9822so31490505e9.0;
        Sun, 08 Sep 2024 15:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725835257; x=1726440057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrlcnVv+5Ulph7yhU/sAN+Hzkp86na46W99x3mJudOA=;
        b=ReUAei2X3+FefS3QsEM1+wYq+D9mgbIFSa2BL+g+rNBhKvAucZ9TyybSLv6+upNFZL
         bmG8o0hAuxh5d6vhfMzl8orRuM/gpMoKUZljRozUzwyz/+BxqyVK/LhBfvNPntEv27/v
         SrQYOmbJ1jiCmn0G67qA2BA1PmhK27+TQB7zmfWCwq3wf8uzvtof/efFR5wS5ht6bEku
         C978v6/yVkZNWgEzFP3pB3fLy2+JP4GxLLNtN++j7YUUYosFAQjQCMIanXIscyTRcWz7
         Bdut8SZ2jWhE8Tb56b+bOMy90xlkkAPGvan4ap6VoL+dfDaKOT1QZ0YwLeIdHY8A4b/1
         0KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725835257; x=1726440057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrlcnVv+5Ulph7yhU/sAN+Hzkp86na46W99x3mJudOA=;
        b=JAKocyiDE6TfWHTbqCfAzxHkYmk5LhrefaYC/DDuyH7DBjPXm0ALsuOqgmmbN/g6oY
         TDELdH7qv39iwo+I0MknUUxRtRq3Fu580wq/T9ByCBkPyWqPM3ziEue7AqcDhDkFSPhy
         1ii1YISBnkSdctzHfcm1Ym3FLMNFOcMDm4/D8mhV3J6VDesxR7nnD3d7JLiuET5MSXVK
         H2Q02xSOpplvV12brgB2nTlqtwct8XY2sbiyImp9S6IMdgYdr5H0zLOHUeD7rokK3PYY
         A0w5ORVWt9qzTULkn+FxAfV1YdyFOCvy8gzzQjYTQa80pcIjt4UnCCEiBGOxWvx8sjNR
         35Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUDOzEt8f52IQCMwfz2mpGQ0t+UZeJMoPfqwm6tC53Se2My4ke6gvOBeojsMNtCTThLqpmvBlc/is7J@vger.kernel.org, AJvYcCWk0ejcKpzPSZu1U/q1Od2T14AkkX7b4XHHOZfMXQHcF2802vLE2/gKAwttgbRrgjpzNep1osNTRSbT/WOYHw==@vger.kernel.org, AJvYcCXlLK2L6T5UxKnZ0iSJdu+O/TyvkPD/gxfUvyhBBmyIQpEbsurhjaDDGv3VSGKpy3D+ihaQZDMs0c/A7Qxw@vger.kernel.org
X-Gm-Message-State: AOJu0YxItkkyVwr9U5P2WHJQgMIU1fKoyn4t9dUTXfmzY6nF+eFj9nZU
	5ggdlM8it9qSyQ+wEYXz9myOQPSDOXz6AaQKXOYlx/2ANuokcUE=
X-Google-Smtp-Source: AGHT+IFs39+OmYnUo2mzmFQVM4pFFhRF4N5kWSoDh/4ctO4o0zIby3uRQlysBw1ax3lJ1Di33Ihvpg==
X-Received: by 2002:a05:600c:4515:b0:426:51ce:bb14 with SMTP id 5b1f17b1804b1-42c9f9dcd6bmr61954295e9.30.1725835256836;
        Sun, 08 Sep 2024 15:40:56 -0700 (PDT)
Received: from surface.home (2a01cb080508df00ca9665fffed23409.ipv6.abo.wanadoo.fr. [2a01:cb08:508:df00:ca96:65ff:fed2:3409])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca0600651sm90883925e9.32.2024.09.08.15.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 15:40:56 -0700 (PDT)
From: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH v2 4/5] arm64: dts: qcom: sc8280xp: Add uart18
Date: Mon,  9 Sep 2024 00:35:04 +0200
Message-ID: <20240908223505.21011-5-jerome.debretagne@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240908223505.21011-1-jerome.debretagne@gmail.com>
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the node describing uart18 for sc8280xp devices.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 14c3b1d6ad47..1e520113db07 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1013,6 +1013,24 @@ spi18: spi@888000 {
 				status = "disabled";
 			};
 
+			uart18: serial@888000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00888000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				power-domains = <&rpmhpd SC8280XP_CX>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>;
+				interconnect-names = "qup-core", "qup-config";
+
+				pinctrl-0 = <&qup_uart18_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
 			i2c19: i2c@88c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x0088c000 0 0x4000>;
@@ -4957,6 +4975,36 @@ cci3_i2c1_sleep: cci3-i2c1-sleep-pins {
 					bias-pull-down;
 				};
 			};
+
+			qup_uart18_default: qup-uart18-default-state {
+				cts-pins {
+					pins = "gpio66";
+					function = "qup18";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rts-pins {
+					pins = "gpio67";
+					function = "qup18";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio68";
+					function = "qup18";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio69";
+					function = "qup18";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
 		};
 
 		apps_smmu: iommu@15000000 {
-- 
2.45.2


