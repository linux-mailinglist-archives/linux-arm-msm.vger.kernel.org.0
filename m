Return-Path: <linux-arm-msm+bounces-89423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F168CD330BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B615031397F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AE639524A;
	Fri, 16 Jan 2026 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="M/KRtbmx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6BD3933FD
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 14:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575055; cv=none; b=ArnFzDIaHe1567OSZKj4Wty5iFP2bmTotUTDR2pVrS4J2o3+qn1AFiJUcjWQrFti5A/NiUVZ0Eie8qJM7x0W7+ufBSlXLZqYWMjgDKzlaBhfsJ8pIH9jamP7GRm+SNaZJ8FiXUwkFgIVcDsQaePhmybi6P5mPhqwVbNRlmlsBr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575055; c=relaxed/simple;
	bh=gjhNyyiXPMwDxet4wKDSHV0d9wDjmHjHxnL5eNbp+F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M+6s+p1lOOgD9MVZ+vPANugQqkueMaygHGV/cgXwMnhJcHfKTNBJrwpslT1G+Va5FzGeC0HH56SHEE26FietgmItjXNDOlauyghvaVCW5QPjha4LMH29tQHxHQBZRbPRGyWksCQ2jusce6DNalfrsq4Vz4e5guJsaTaPd9V11LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=M/KRtbmx; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so3249021a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768575052; x=1769179852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjx8cp8u1zTtz+8HPO5dBG1VmcVVPk4nfrHWtFsxXSs=;
        b=M/KRtbmxY3K3nTUwFVbNEsKQliOss69ZFDb7zTwda8rwFtHsq1s0XjqPu9tS602ski
         W36mjZLIA6U7YXlYRSB4ijpJykNVPOZ8Bq1acWrkwV/wzrC4low5lnlA/45me8Edfgom
         ISXeNBoTYnwiH9Na9IioySD4Qn9L19wd6xG048k2Sw0xOOcko+ZTzg3FOrx8LQVON6ZY
         M41HfsU/UbXCs1XdL5HHGbY4BXGhcWk+udSxsSOPT73E4MsItanaxnffuhYGyFs5zU4W
         1KTF2qdMUqOG69HV7aez5ql4o06yFEuAWcicusIskDPstQ6ZoZu4H8UunbZ8iRv44kbF
         KBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768575052; x=1769179852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mjx8cp8u1zTtz+8HPO5dBG1VmcVVPk4nfrHWtFsxXSs=;
        b=GbBAukYegC7CxGGLY1ZnTWiseEEiKDb1nNaJW/pXQg9oVxHBNzg1YtmEXF4X0dJxhc
         FAno72+PkboqDb05rYtUAh0yMP1I8pgL0dv8OkjtKngiBb3rteYyBSiRAeDJwZ2xvEUV
         VHjd8HiKwQSnbb5+w9pQBYkaW3zLWlNjtycxi+8thMSpChzJZKHRcmRtpm/3uUbJc2wp
         EOQSUkcHjOFJSK9jG4hHsjDJiUQYhMxpIe5Rg+kECDKdeHegTWemquhD28MPOKNiIzJu
         WKYDfAgXWv4SECWuFLu2G/TzQ6qxh5M7CG2qCs8bnDb1ZSEtBW/EmYtIsM82Sr5mpQMV
         y6Wg==
X-Forwarded-Encrypted: i=1; AJvYcCW5r1rTPz8uCR+psCxoGl5j39IV/KbjoGUOoqlErVprC85mY15uHQyD7zHnAMvfFWkwI0HDH9A+CIiIqvED@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0T4DZwUcfyJ6TPKBEmneYhgKvIqqldbmP/yXeKU7n1wSgENNy
	d5zVMMdR1pbO5IrgaOirjMu2LnsGejgidtaAppBJOMaQInlg3+in3qFtOqbi4zpO990=
X-Gm-Gg: AY/fxX5UJxA3HgylnMbpbKZGbLDQ/u6Rr3f2a4zOWEfRiwTq/9+9UpNOkskQH+VB+mO
	Zq4HJklPXM/575sqqHMP+dieFDGDf7jZNd1gpIWQlfvu21gaTGnlNTo9s9B9atH2G7yMNfuAkLk
	Xc3u94ydkS/A2QXjhoUI+Ze3x4OPjLlRGRpoIJzgR8uxst6WWk06jeyphT3HiAJa20qSduHaezL
	NfeFHHmgEooSP8rlIH02YoqxiAmKuwtXt5u/3UwJDoOKrlTM4kAByYv6I1z7mKuii00gpY/JnA7
	gORh7HcTzwZcv8duQ8acAqGHB/i67IQKA9TdoHoZDPCruiLdAOvUKejuSWeJT7Vs0s42UXbqBQO
	RkIADcSaon1MJlgmn7o1HqWrXms/9Tjavc1EEmP9M7qcc/3nsV2KN/cZtyKsVEm18bMpahses2Z
	LPdpDkpoMFmRdm9LSdh/MjLali4I6Lyrmz8w9aahSUKWzWF0jvPw3VlGDhaIXLJmNZ
X-Received: by 2002:a05:6402:1ece:b0:649:2347:e15f with SMTP id 4fb4d7f45d1cf-654bb61af82mr2022241a12.31.1768575052026;
        Fri, 16 Jan 2026 06:50:52 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cdab55sm2699427a12.10.2026.01.16.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 06:50:51 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 15:50:48 +0100
Subject: [PATCH 2/5] arm64: dts: qcom: milos: Split up uart11 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-fp6-bt-wifi-v1-2-27b4fbb77e9c@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768575048; l=1821;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=gjhNyyiXPMwDxet4wKDSHV0d9wDjmHjHxnL5eNbp+F4=;
 b=9aCWGUk70yj5LCtl1yQkbB+PuccQDjLr6m/nWRrB15aM5nCuUYvR/4W9Y8+MxDkkNrS7kb8u2
 C+9KiWmMFacBR25AAZ//iePt3boxN4/eIxF6O2AZgcmfclRZmZWZ7i9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

In order to set the pinctrl for the individual CTS, RTS, TX and RX pins,
split up the pinctrl configuration into 4 nodes so that boards can set
some properties separately.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 0f69deabb60c..024e1c9992fe 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -915,7 +915,7 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 				interconnect-names = "qup-core",
 						     "qup-config";
 
-				pinctrl-0 = <&qup_uart11_default>, <&qup_uart11_cts_rts>;
+				pinctrl-0 = <&qup_uart11_cts>, <&qup_uart11_rts>, <&qup_uart11_tx>, <&qup_uart11_rx>;
 				pinctrl-names = "default";
 
 				status = "disabled";
@@ -1835,20 +1835,24 @@ qup_uart5_default: qup-uart5-default-state {
 				bias-disable;
 			};
 
-			qup_uart11_default: qup-uart11-default-state {
-				/* TX, RX */
-				pins = "gpio50", "gpio51";
+			qup_uart11_cts: qup-uart11-cts-state {
+				pins = "gpio48";
 				function = "qup1_se4";
-				drive-strength = <2>;
-				bias-pull-up;
 			};
 
-			qup_uart11_cts_rts: qup-uart11-cts-rts-state {
-				/* CTS, RTS */
-				pins = "gpio48", "gpio49";
+			qup_uart11_rts: qup-uart11-rts-state {
+				pins = "gpio49";
+				function = "qup1_se4";
+			};
+
+			qup_uart11_tx: qup-uart11-tx-state {
+				pins = "gpio50";
+				function = "qup1_se4";
+			};
+
+			qup_uart11_rx: qup-uart11-rx-state {
+				pins = "gpio51";
 				function = "qup1_se4";
-				drive-strength = <2>;
-				bias-pull-down;
 			};
 
 			sdc2_default: sdc2-default-state {

-- 
2.52.0


