Return-Path: <linux-arm-msm+bounces-35135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B52979A5062
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 21:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E3F21C219D9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 19:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD3E18E340;
	Sat, 19 Oct 2024 19:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jau/RVHS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0607DA68;
	Sat, 19 Oct 2024 19:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729364591; cv=none; b=sSL63I9xnt/2oo8goQ1REClbdB8h4qnkVHZCqVNw2u64QucPyXBQjLfDIK7Q5mBCB0W4nXYC9++GPeM0h4O3t5VogwuiWWhh1XvKklAwvWALZQD4uLcb4g42K5gubca+9gnhfbI5z+vsLv4E/UOKShvgO7owk5gLJNO4UipnjSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729364591; c=relaxed/simple;
	bh=jH4u32RSFUNm+YD2QqJ6p7d11UHEJDkb2T/r6BNhRGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e4Abm5UHtKLXyN6+/1C0vF37w/hFf6eckBmuwRBtKEKoYXNC9qhCLVB5LrwGR8B4NwtMiVUTy+Jey5a3HYMBujd0nykRB0MhRCIzL6d3G/3QiU5QtrtsFnbHFTmmonrbAHmfHFQlENvWNl1xZTVw2Fmsbu8HXsck0OHkqUbSQYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jau/RVHS; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so3651808e87.1;
        Sat, 19 Oct 2024 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729364588; x=1729969388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=79kPyqLh2zEwTMD+j8/MFpAmQYB2epf/WtlkHCaRqSI=;
        b=Jau/RVHSPyxegfiEn/QPyn6XFxiORlxdWXFZilGNtj+mLSCCv5AXc1fYJJMrBKYIyB
         iFhevpjF3kCv9aFwqRDGXTYLZahT73jKJhZB07DSNujix2+vJ2FTuE1nDmK+9QA5/tkd
         WorXTdON9s2BKM5hT5vf6PHLn18DwTqe8fd9egg7IL8YuFZBGW7FoasKg9UPXuiWjuhi
         Qp1lsFNQmM+xLYv0PhPjF4sCpx34MUoyBYXWb6wbowhJvGjgQKeXmRfVQNlxyYWiSqSG
         kv/fgGJ1oxp5jl4NrnHY4QR2AYu6mme4VYNZXOztuwlb5su2YKJxOX4zu5dcEkZjNTgF
         1jLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729364588; x=1729969388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79kPyqLh2zEwTMD+j8/MFpAmQYB2epf/WtlkHCaRqSI=;
        b=W2oU5qyqpF2uMzmyX//4eDTENyIqDt+r6aNAlb8Y0E1rSut1GSaKcu5sCnBTzKkU6m
         l9wqkKtuxX+OS5wEIjHFCnuSJR7r5T8OB3/LPRXpEgXkEiHoaL80NTfiLEEbsHQHF9Fn
         XlMSK+SOEPX2QlDkPMSpKLX1zwHJciZwn08uQUh6yCltEDG0HxdHArHgIonajRNaXUf4
         RMS7aCZEXJN5B+SE2E5pZLOVp0EmAzfBaFyyd1mH1BeEGEPbyOXZby3KlhOdadshju+2
         rSR9KQKVqcxHkprZ6hOoTtvtgFHZ0ZWGPFK8bekXQg6HpCMq6Atxmk3sGLcWgd12Ae68
         yYgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWaZ1yTM43sNzHOovqv3id0KMGgkRmh68i5Xg/57u9dI0mS+shz/k2zAIbAzdSbvjjKXRAdIwkRKWA@vger.kernel.org, AJvYcCVSyPpmsqG9rytK/PhXDhKRZPZePUZXO4TYvkgX30tzWF785cvNdTZ/EzXDiiiGdI9Gpsx2tUSXUiN3cI/1UQ==@vger.kernel.org, AJvYcCXJJDHpRuFbDVfrjZjvztalLFXcox93KIuG1sq1JtTBLZl8r0PpVWFTh93wroHFyDP++yLqMqa1EH4ql/Zd@vger.kernel.org
X-Gm-Message-State: AOJu0YyNSvjugc6RbAeAG8K3rTUOib4kqdZ1jNPjAE1uZffqnNtbw5qb
	BGhrlrTPRWCrRG9+qUtPHEWCARUrPOuPFsfS3IY3WzwwFdPF7w86nT3aihZR
X-Google-Smtp-Source: AGHT+IErIzIdf4qvDgdzkOKWc2GGHw0Jt1dEjgYflhoSkB+6edzwHy6hovrUFGuS8H1Xc7HJa5z9tw==
X-Received: by 2002:a05:6512:1307:b0:539:ed5e:e224 with SMTP id 2adb3069b0e04-53a1520b1c7mr3579748e87.7.1729364587181;
        Sat, 19 Oct 2024 12:03:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a311:80b0:1c80:9433:9060:39fc:2954])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223e5556sm21514e87.8.2024.10.19.12.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 12:03:06 -0700 (PDT)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-crd Rename "Twitter" to "Tweeter"
Date: Sat, 19 Oct 2024 21:02:15 +0200
Message-ID: <20241019190214.3337-2-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the name consistent with both other x1e80100 devices and the
dictionary. A UCM fix was merged already and is required in order for
sound to work after this commit.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 10b28d870f08..004353220dc5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -177,9 +177,9 @@ sound {
 		compatible = "qcom,x1e80100-sndcard";
 		model = "X1E80100-CRD";
 		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
-				"TwitterLeft IN", "WSA WSA_SPK2 OUT",
+				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
 				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
-				"TwitterRight IN", "WSA2 WSA_SPK2 OUT",
+				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
 				"IN1_HPHL", "HPHL_OUT",
 				"IN2_HPHR", "HPHR_OUT",
 				"AMIC2", "MIC BIAS2",
@@ -933,7 +933,7 @@ left_tweeter: speaker@0,1 {
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
-		sound-name-prefix = "TwitterLeft";
+		sound-name-prefix = "TweeterLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
 		qcom,port-mapping = <4 5 6 7 11 13>;
@@ -986,7 +986,7 @@ right_tweeter: speaker@0,1 {
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
-		sound-name-prefix = "TwitterRight";
+		sound-name-prefix = "TweeterRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
 		qcom,port-mapping = <4 5 6 7 11 13>;
-- 
2.45.2


