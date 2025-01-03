Return-Path: <linux-arm-msm+bounces-43862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4D1A00858
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 519D5160A49
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBF41F9EDF;
	Fri,  3 Jan 2025 11:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="x7SfxGNA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2913A1F9ED9
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902732; cv=none; b=KvOH3gQ/Iacm0KZ6Ia8HDS50ZjoNRWUcJ8zeie89w5tfPRvQ0bCYkxYyzy9VmzZoF9qoGzTL5xYNuoQ+1kklQigcvmgS4X81ol3zIyaWdErhHmO/QoW2YPNDJA54BndSGoRDEvF7cvYWStyLnJsjI9LWJe7FjtJXnmVz+Pf9r4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902732; c=relaxed/simple;
	bh=hFrxBgJ07NatLLy+nIK/H0Io113gN4/rPtmjVt9wEEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kF4+K9nOycoptGQvIl1ihcE+/NdXA0RYIYeQGWgSX1DxcIn+M9fVWiJZrTn8y+j+jDHc2wbx9cv0J9puzaD2+0MSw2q182GJ1GD9YVFd8chAdPFY079GerTU0/XEdHzCVtHICmHyVoeHlq0s1kx/NeyN8maaz8PTfD8TE+VsnWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=x7SfxGNA; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaeecbb7309so1315563966b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 03:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902725; x=1736507525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHOvMibGbyPBOPoFr5QKh/wTDy8ZFQYsWy6HgvhHWug=;
        b=x7SfxGNAuWCxuDecvpbjVDbPrrcHCJ/4J9ZqjFQ4L1iqfYBzFejVby5DJb6oXpnVnz
         IG4hb+o/0q/tDsnnyu5jDgLZxa9dBfS7bRbZjaujRCo/4dj74BX36B4G8Tu8pv9XZg3k
         nHOtImYW8byr+VfvKNP/U1Twy6MloDqrwMFnsX53Y5nUfglAhVlN29051RWVU8AutTeL
         ZQCc8MlgM4pKg0Pj6XcBOkX96bPu5Nz4s/7ZOVd+DeC/DcXm17t/Lie8KnVnvd7Qk439
         ++PaHkVQXPY9kNP4X6qX2Yt+H083Z5a9JhO88YXsb1QbQosa3DujL/qJu9jfF+EQRAtN
         32Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902725; x=1736507525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHOvMibGbyPBOPoFr5QKh/wTDy8ZFQYsWy6HgvhHWug=;
        b=YOWCjQE4asAGwSDhx7yrdUOV/0AVSzChxTeuvmUnG110eFUbD1M79hJAPMDOc/swbH
         I6KbyQt8hbEPLSN5YPCB/soGiGacgdpgAhlWt8fdN3qudL+l08Sp/C267JuRpb+aQ6Uu
         g0F6B1tyZZFbZ3Mh2fPG/m0OLZn8n8iMe7pqY43mwJ3+iq/VVqsIvUxaez+mHAnkbK7m
         45fuRFPueFGSF1plHQDqTBorVwgUsKnr6Yoys8ji9cGwQRYFTp7BnF8jvUAIVDP7fJHp
         BZI7tQCeRpynY5iTIzT5gQ3mhPwZaoAu03mFLxXWOVevMZWUiWSmpMZdKqyo9q6qY/UJ
         Gzjg==
X-Forwarded-Encrypted: i=1; AJvYcCUELlk0rZo+8nrhOxbK+NaoaRQz1zk0NyjvkqN8b1fju5OBs/A/H7bqXDFIP6VX/tqSzyJzcaRRonAa+rGg@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZcujRPyL/i9nleEqPw/BfERuV6rms9icjSwWAhMzvM6UEOBh
	RFMvpc5F6SxbrwD2S0My3X/IqSH/uo5lDLqp7N8+xuV0V1UMxXdiwxca00n1CX0=
X-Gm-Gg: ASbGncuyakHsLJrJWKkEfueExVP93G3cXBRpH+4zFykAdQjtCj+W8+dpBkXx5viG76C
	1/4yjYtqb0j37jOsMVLR/R6E9D6K53X8Mr6FL26QzzUUBciJfwq2NuTRc/v6fvWzBEe2l07Fp+w
	5qC1kToTurKtCEoxjZjewbdOEanPm714mdLhMeE34KLWyve+RT/DJhJdWpAoFuJ46EfHq4ywKOM
	1HRYQxunvRWilZpkkX+im870UbeEGsCMlH4D7JeNHmJg4L9s3fagiOYXMOtD+xYlu8DC6MZLr2g
	J74V2OZOf/x4+i23coq9Ozz1OA==
X-Google-Smtp-Source: AGHT+IFd8bCOiprfe2Wzx8rbAxGJwtv5TEfV+pliUKXxGJMY/Rwo3+ia2wgDHt5fi12mELrWPAU58w==
X-Received: by 2002:a17:907:3607:b0:aa6:5910:49af with SMTP id a640c23a62f3a-aac2b6611c2mr4470650166b.24.1735902724669;
        Fri, 03 Jan 2025 03:12:04 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:12:04 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 12:12:01 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable camera
 EEPROMs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-fp5-cam-eeprom-v1-5-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Configure the EEPROMs which are found on the different camera sensors on
this device.

The pull-up regulator for these I2C busses is vreg_l6p, the same supply
that powers VCC of all the EEPROMs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index cc1f89a4015218b0ea06811d2acd4ec56078961e..769c66cb5d19dbf50e137b3a72de2e36ec4daecf 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -556,6 +556,47 @@ vreg_bob: bob {
 	};
 };
 
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	/* IMX800 @ 1a */
+
+	eeprom@50 {
+		compatible = "puya,p24c256c", "atmel,24c256";
+		reg = <0x50>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
+&cci0_i2c1 {
+	/* IMX858 @ 29 */
+
+	eeprom@54 {
+		compatible = "giantec,gt24p128f", "atmel,24c128";
+		reg = <0x54>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	/* S5KJN1SQ03 @ 10 */
+
+	eeprom@51 {
+		compatible = "giantec,gt24p128f", "atmel,24c128";
+		reg = <0x51>;
+		vcc-supply = <&vreg_l6p>;
+		read-only;
+	};
+};
+
 &dispcc {
 	/* Disable for now so simple-framebuffer continues working */
 	status = "disabled";

-- 
2.47.1


