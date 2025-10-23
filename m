Return-Path: <linux-arm-msm+bounces-78432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0067CBFEF7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EE73C350A4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 02:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1379722068B;
	Thu, 23 Oct 2025 02:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rR87PXYI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8822045AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761188366; cv=none; b=j5h/f6G7jxBHm5ed6B9gFTVY1b4vOgtvXTjuNIz+xrSk/ya9t5UyziXjSsIOMhJgXOqaj/yC1Ilq12vP5+JgpCu5qT0k8m0UTa+JKb+mt6Wux3twAYm76gfQGaTIaOiusHnSjcxF0rHZH1CNzitCAv8vBBtg+t2sYeZwuHQmxYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761188366; c=relaxed/simple;
	bh=geeyM3OMTfDjPfzDBYSianuZgGUAcEsr1MJmNCZlbMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evo9r9yeHRUdjGIgXOHjMTeeNQ9mps+snRhrIAJSCIrijRv97a2/JHfWj93eZsLqy620mMcnrKPwH529hxuP92EC09GnoLVpT8N0rJhqe0ndXToCLJPVrNyU9e7bezDDRhRXrnm4abEN5GxRKvCnYzslaXbkPrDVajDBHIynVdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rR87PXYI; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-592f0102eceso51534e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 19:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761188361; x=1761793161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/eXxd5HWhdyu0lw4hYwNFJCVblfs3MWehYS2hRN1AU=;
        b=rR87PXYIfhikJChhrr44V/eY7A4tpSBYz8NftrhYLWUXzFUEEdAqMHrfYja0FMiD4i
         ptMjY9Io93eee/azIQ+tdSdDiAB0qBkCTP8e8OmcSzPo7P9TGaslJR/ayXLlEgk36Vnp
         819nzqsWv3fw+jR7miYO3yn3/OlKkrXIcKfWVLear515CxosXZ7SjAlGCXicgpAG/ngG
         Cwt9P8F9fP1tEFysmyw7AWxna+vX0AGaygnnkNBuAvSOgxkYizOgc5Yutlrgk6yuX+25
         /OhZTRYIwzODL4gwlhA431XjXDStcE6Op4mMZ1QkHLd3LQg2u+9YBa5oz/1YC4wPgSRB
         X3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761188361; x=1761793161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/eXxd5HWhdyu0lw4hYwNFJCVblfs3MWehYS2hRN1AU=;
        b=nuQfKlzIbsm9naEC67XPqfMcPngq0kA2qP/77kvvEF64ohjcx0TQg86Cdj9lelY8Mh
         Wtta7Wj+HGn9EaO6dgioSHWsaofOSWdKOgiKwCd9rGE9JP/FWLevcf47+YRaj3Cgso6v
         FqXjsG2e/16HSkP/dF+ggXQqX0dkSqyNIUjenkksTKZRc/dJqtQFx+FZH4APh5qTiGXH
         PYtnWPv3AO292TctuZYJXX2lO1KTeahj6+SSSgW1kmPD/ia4VxIPXNADGe/strgSHdZM
         dLoU9qhwVjWxpZNo5Zb64OMKKoOBHFDptT1hX4l4D4pDFbWBvUL4mZ/Qlbs3K0zrijWM
         zT/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3IZ/ErINYViT6VDDqKpOxxUjMpMQIytJ0g92CaFRj7DalLCFxrXwqHsF3HTcKVXJLfUkmCAZ7FPuffHBC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2mz+jKFPG0aUFXER9ONT1CX/Qu9aMewLabf4tPbnC4f92NrA4
	zi1wipyvvU50mtApYjNhfUgoVA82Mmu6eN9jjEgIIAbkWASVHj2X+ZPah2VH86VjS14=
X-Gm-Gg: ASbGncudeDC74VUcTUq2yz32dz0CVePlPWiwLdyIpP4Ipqi2AK99toFuqU5DHESHGB2
	vPmfSoRVZxEh0Q4vIqDSXC2xSD5kvZZR6csSr9EVUHWrDhbgIrdLy6bXAl679eUjzTa3rvVXS8y
	Kp+vvZGXJtFYqG9ZIBAsLKeiI+JrSao1rbx1pDDuDp94VHLqR79E+KFh2IHqKSxpx7J8QYDsH/2
	QvAH26Jr5wS0SlOOPERi43sizes57UMI7jNtpdxmif5luR/6tyf9NincMaam2IwFSJQI3Fx8vE3
	NJnxJ22zXVD4gOsR4ysOip6jc934iPYbnfy7HdRunN8LQPkK25gmr+9WDC5xOEpvLqKHPLmJYyJ
	SOW5S3IUO4+2QI4R1U58nWCEl9fkOVoLM19mqJw2EPaigfsBPMwl2p+N1KLtFm2mQ8khPRzjizL
	3lJnww92ViUnZHrz4lnKUklxPYC8b0WXvZ1EzpZag5d7GOf7zp2XP/ig==
X-Google-Smtp-Source: AGHT+IHJttEdQ/IAj38B+Ud31qMScWCRKeXBQa5Q3Lty28zvVXC3xaBWyBL8GYgHtDG8IwWWYTE5CA==
X-Received: by 2002:a05:6512:3181:b0:581:8db3:d5fe with SMTP id 2adb3069b0e04-591ea2eef26mr1767045e87.2.1761188361428;
        Wed, 22 Oct 2025 19:59:21 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d16a15sm334471e87.58.2025.10.22.19.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 19:59:19 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: sm8650: Add description of MCLK pins
Date: Thu, 23 Oct 2025 05:59:11 +0300
Message-ID: <20251023025913.2421822-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023025913.2421822-1-vladimir.zapolskiy@linaro.org>
References: <20251023025913.2421822-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add fixed MCLK pin descriptions for all pins with such supported
function.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 144 +++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 555305c1c70d..8f934d94d359 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6065,6 +6065,150 @@ tlmm: pinctrl@f100000 {
 
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				mclk-pins {
+					pins = "gpio100";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam0_sleep: cam0-sleep-state {
+				mclk-pins {
+					pins = "gpio100";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam1_default: cam1-default-state {
+				mclk-pins {
+					pins = "gpio101";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam1_sleep: cam1-sleep-state {
+				mclk-pins {
+					pins = "gpio101";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam2_default: cam2-default-state {
+				mclk-pins {
+					pins = "gpio102";
+					function = "cam_aon_mclk2";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam2_sleep: cam2-sleep-state {
+				mclk-pins {
+					pins = "gpio102";
+					function = "cam_aon_mclk2";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam3_default: cam3-default-state {
+				mclk-pins {
+					pins = "gpio103";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam3_sleep: cam3-sleep-state {
+				mclk-pins {
+					pins = "gpio103";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam4_default: cam4-default-state {
+				mclk-pins {
+					pins = "gpio104";
+					function = "cam_aon_mclk4";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam4_sleep: cam4-sleep-state {
+				mclk-pins {
+					pins = "gpio104";
+					function = "cam_aon_mclk4";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam5_default: cam5-default-state {
+				mclk-pins {
+					pins = "gpio105";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam5_sleep: cam5-sleep-state {
+				mclk-pins {
+					pins = "gpio105";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam6_default: cam6-default-state {
+				mclk-pins {
+					pins = "gpio108";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam6_sleep: cam6-sleep-state {
+				mclk-pins {
+					pins = "gpio108";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam7_default: cam7-default-state {
+				mclk-pins {
+					pins = "gpio106";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam7_sleep: cam7-sleep-state {
+				mclk-pins {
+					pins = "gpio106";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio113";
-- 
2.49.0


