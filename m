Return-Path: <linux-arm-msm+bounces-89424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD3BD33066
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 725C33117704
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0571396B66;
	Fri, 16 Jan 2026 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="0SFatcjY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125AF3358D4
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575057; cv=none; b=L+VbBmhXcj/udGbsPfLj4UIN9FXPQ1puWVlfDc48yD3dok1S/GdvbVAAyT751PNmDz0fbymZ30yAZxPbbyNtlGep6+txb/1HA6sUF//Ag01lnJPlbS92ym+YP3+1GYf9fim6Wa4ikgFD/6WLviDV1JaElusNsRXO1X2nzUq7Qro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575057; c=relaxed/simple;
	bh=2CfOZ78hBV9+dHu19uKPlUMI7Hfcd6Rr3JDeE/DhNcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EWAQxbR4h9/ighOFHX7rnla66QkBVNjuy5HMjXTAUziwOU3qS5jMqOSY4AQCyXUS9ksiKaY/fQF4aD2lsqJPWvclrK9UrS7UJu/vvtisLKruKdC4nNrCK/ndKNw7UqvQ/JmsTCol0gg5LYSfBivy3WN3lVWQ/j6VA5Yv2GbDkO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=0SFatcjY; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so3570975a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768575053; x=1769179853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSuuMCKvaQeP+4C8yNmtEG/K5qzH1C/9smH2j3SBfnA=;
        b=0SFatcjYC0d/O9qIkMjTR7D222VQLJ6kuB8VRrOBqdFbdYarMgcnfzeP4VciZoPiXM
         xQE2KX96Fp2JZZy+t0+ZGtdCxXDUFGkCFv/F5Z1Z0F6GqT4QI4TBWiZquZ+gIne6bNez
         KvWtOWTakzyQnRFrGMUNLailFgeGkQhMUNkwD7aGu6FjK9+gU8WNRl0Bk3AyjoGej0av
         PVszdxIv/az2sqssnuyeuEDnqTGHf9aWidcSei5hVTJhRbAmXKIcdi91q0QXLBwSkAMp
         WvPOZv1kkLJ4c20jYmslsg2wTnNLlUJICGCTcqtPcH0IuIACEWWyoWKPrubwT7ejlUUw
         Itvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768575053; x=1769179853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pSuuMCKvaQeP+4C8yNmtEG/K5qzH1C/9smH2j3SBfnA=;
        b=vNGPK1QjpxpVdXHjv79Vt+Z/+AV6YB7CuvrM3ykIec3P9dFnOC67yJnlViwnoDWJLn
         qmyG71dNKAjxMkxLhmbzv2wIsgNj7sKkB2jC3o2RIvww8mfvm3CIwjijXZjIjg3EvatM
         ik0woRsExbo6ztICOFh7yf056jYMiezfjX4DkZFqwE7k02Y8gGOmYrcYTQ3p6AfHEXvF
         t2kcpK6Ks8sfkF4HCbpMJujlaV9s1B5/lQ32QOS0OBr0aHZ2bbkWN1IODQ3gcmDLIulM
         NCMoG49EpMxcPwdbzadLI9u+48nNcwAtzqzQNiKKDItqEKZsjjWi8ATtE0TU5HoOCgS0
         TxsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpYfMW5oYB+tSQcsltBZM5vXp/EPwskVvKqRonX299WRdTcoD4KJVjUX0jAs4KASgW65X9eUxw5ykdKFAZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwiQfODb5HdyxElO5ZLkwwXjtzXPv8hRBKN/kkebV1TxU6Q9qiN
	WRdCcyaSNbGYpMmv/CshjLO0juPRryC46AhEdCLnJt6dp29wNI5PGuAYjuMKAG2TFsw=
X-Gm-Gg: AY/fxX7CtvRnB6kCpvso90gmGGbfn/iMzui+WULkRYw0x1ICjqud/u8757YKewmhutj
	JHylK4xXaIyHwDmeQQGpcSKYVzyo9RNND2SoMh8Lzo3uvzde/p4dPk1ooF5tSIc1rWFRpO+NWlM
	8a7HTUEc9USxUYJnU14dW+QebDPadpPrubVvRkXIup22igJ/37vjde1xSyl6QTzzZeovBaDpdVI
	xMbZFZvXt26cEglSonhvjIO6VkcwYl5LfR06VgVdehbDTS2pcXXWJ9yyXJEqn7ZTWDsu4JUmwVa
	eygZU9UBG8B4l71HEJgpjgoGZWi4EOqFc1sslys6xnkliA9ARL7rCgaTvNWCqUhw3tIP1pf3IF9
	Gl9XmvDB5CHfExuuE8Z51rtldHcPORmRHItL0PzACk0thh/18nFpQKUjTc9ihANiIQvkC/WItlc
	5TI/WWMi56Nu08MNjZ+UpAKm4+188mTFA3/DYRlDOJu1gGWCdG6r7nFyIcWfwqvl/FDzQND8lBZ
	v8=
X-Received: by 2002:a05:6402:26c5:b0:64c:69e6:ad3e with SMTP id 4fb4d7f45d1cf-654bb719874mr1986771a12.33.1768575053118;
        Fri, 16 Jan 2026 06:50:53 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cdab55sm2699427a12.10.2026.01.16.06.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 06:50:52 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 15:50:49 +0100
Subject: [PATCH 3/5] arm64: dts: qcom: milos: Add WCN6750 WiFi node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768575048; l=2541;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=2CfOZ78hBV9+dHu19uKPlUMI7Hfcd6Rr3JDeE/DhNcI=;
 b=LuORNtX9jTSMl8tOyAcfujMrrd7rwFYnZKcbLT1sOnh/I762nvu+9vfCVWrPFcMEZ6D46aTFR
 8qkFvr9z//mC9xapVnjkET6h8G1JK4cKwtmIFWUbslD+n9DduazghT5
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the WCN6750 WiFi found with the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 024e1c9992fe..80feb3e9d3e2 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2043,6 +2043,52 @@ gic_its: msi-controller@17140000 {
 			};
 		};
 
+		wifi: wifi@17110040 {
+			compatible = "qcom,wcn6750-wifi";
+			reg = <0x0 0x17110040 0x0 0x0>;
+
+			iommus = <&apps_smmu 0x1400 0x1>;
+
+			interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING 0>;
+
+			qcom,rproc = <&remoteproc_wpss>;
+			qcom,smem-states = <&smp2p_wlan_out 0>;
+			qcom,smem-state-names = "wlan-smp2p-out";
+
+			status = "disabled";
+		};
+
 		timer@17420000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17420000 0x0 0x1000>;

-- 
2.52.0


