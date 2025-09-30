Return-Path: <linux-arm-msm+bounces-75590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AB2BAD1DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 15:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D5287A9FD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 13:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD93B3043D9;
	Tue, 30 Sep 2025 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ii58swwd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888E227B4F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759240641; cv=none; b=sM3P4ZpaKkj8RGDDqC30g6Wm+Hg65YrSNAFnCXpq2Fyh55Uv+G284ZKM09YhUdnKFGf/kYn9rTF7c2YMNh77xYC7a0cxOYwOd9j4Fo79UHQ3haJKV+IUTis3AlcF8OB3aWJw2E6DKY1qHmrgl1BForMFqwpArxRfm19mA76CFXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759240641; c=relaxed/simple;
	bh=tzYiBi1inoE6AQKDp3BZER5u/OgLXaF5Dw3TSJH/dpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VICc9efsfKCxS5hcsDUo92NqSFyF8X/Cjx7XF9wfU6qsnYKis8hSWM6yCn6s4KPu0TgQgT7QtZTrXdJna1xqOf8u6UvQ6H1D/HAFwVD0goSB14p+WH3VVBcLrAQSZkOv6bO3ywjxXpUYn1SOmtrCMp4unCqdUhZB796E7wfRqKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ii58swwd; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62ecd3c21d3so10868025a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 06:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759240637; x=1759845437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVfHh0PGJNCeCUt53q0MGqTcrE5zWwJY78oS+k48p74=;
        b=Ii58swwdeXSxfwH8WC/n4oK0hwSUPc+khTuCyt3sHvSpgxgDK6AHjmPa4x+JUa5bfq
         d0zHSFSPDbTTc3OGGYmUB4VSINSRLuYcirQj3yuatR5y8OfIseqqflOqc2zFJcac7GNR
         W09Ou7Lri4x80uwK6d+OfTR9/VU/h43Qsbj6het5Ron1cCQTnEzMF86OsxmnPFwb7hZt
         ko5Zb25w01zd74XgcfpPS3EXmgUz851QEvwO01e+537Xe4ygWIggQHUsfc9ANYcP8XaE
         7mnk36AwdM1BGFHqBgHi5WbvJaIYqVka3sL4vcp17JPJ95w8ZdNtbdgwVz3OI19nd0mr
         nowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240637; x=1759845437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVfHh0PGJNCeCUt53q0MGqTcrE5zWwJY78oS+k48p74=;
        b=bLOe8iyHdIxLGTE/wIO+teJ+F1bSD1IZjEt/R0O6Wv8uqcbptgParu9EKM3Gh3aOHA
         i0db5/os0Akgxcjv+pBFFCXncsPRASirAaU6B8a3FAtCfBA4Smg5EPOir4BUGRSVRGC5
         hXz6fA7oc5v7wXYa4vdnrBMnvufW898htbOZWcRV1gsSLCiefxHBjpXNfn5VhjvOjdoC
         AzGIfvNKcMwUkarRiM5ZKGbxNfbAPeUkhNq9n3/alG9Vh8yo/fSN7tOcWmn3plJkbTdv
         kDvb1R13OIeofunpYVLP+c2InhBi6ULP8lRIHBnttRPXOTyedPecHBJSfcP/GOrIhrZl
         YNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP19wwU6xqowSst3Z/VQekMrYqIhDoqARIY6pzPLn0tZOBiQWpmbIEGp27XvdS3ubKk6Kk6+x36/8AWv0k@vger.kernel.org
X-Gm-Message-State: AOJu0YxUuEHn6qujuWrBB9PzzJrbWfaF7fHY5rYjIXm4AMFrs5rGguqP
	mXEV8TdoJM1tqqZ56pTcCKRTkpVX5LTlZs4Ay954K2Z3jJuwC04d/2wqICG33vc0he8=
X-Gm-Gg: ASbGncsVCCCS2M8i/9oDMukDIRnvIs+KDWE+m/3AlHjZXKFVye4wPLUArvT6fEuhHAd
	l8Ma2OZUQG7LHM3ce0jKQ5/RtN/yjPM7LZjItSE1/KCxhkf+v5XkeFEoibuyMTjV1GSpXOWUtfC
	kTzGi/MsGPN5F/87mQte5i2rXISEHp3fe/F1J1QRlf+zHpUtaigrvmWpEqkweEOIkNeYsEIaLRZ
	L7mtWIvdfs98Bmj+h6By9XtWAarMftrtO3XkcGjlokwxjov4kxycexZq5w5SFgft7NLtVFhxrDy
	QqvKasSclCuVc7XMaQnBurcLJ3wyKD7RD9eNh1DQ9APL7yjnNb1DdRAY3RjjoTrSwbL3Re7svFD
	7GNf42AJY+JN3mgzifp3KtGWrVd9EZfA98ZIspqiJHB/BzRZlh97EIb5jWx/+xa9JQUmJ8CRKgh
	SgTQUisUgzBfx+BL5M+Q==
X-Google-Smtp-Source: AGHT+IGYpOyuHrV3NMYdDmii+YAGqD9Cnpv6UIS+kz/yGdm4TlrhmHWe/hPo+Kke8kFGDiqYhnt+MA==
X-Received: by 2002:a17:906:dc95:b0:b40:33ec:51ea with SMTP id a640c23a62f3a-b4033ec5d68mr618735366b.6.1759240636824;
        Tue, 30 Sep 2025 06:57:16 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3fb818fb90sm370234866b.63.2025.09.30.06.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:57:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 15:57:01 +0200
Subject: [PATCH 1/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add supplies
 to simple-fb node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-sc7280-dts-misc-v1-1-5a45923ef705@fairphone.com>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
In-Reply-To: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759240635; l=966;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tzYiBi1inoE6AQKDp3BZER5u/OgLXaF5Dw3TSJH/dpk=;
 b=yTOVqbRldO1E+tGjFjGAFseABV4r1qByu1pbbAcH2yqG34o3vjM4uLWD1TvE2y8YIsU+8DoO2
 G4hPBGFUKpRDRrmcoYfv2t1HJ3SL30mFEMGZegh79iZKLBCX4mG/+85
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the OLED power supplies to the simple-framebuffer node, so that
the regulators don't get turned off while the simple-fb is being used.

Fixes: c365a026155c ("arm64: dts: qcom: qcm6490-fairphone-fp5: Enable display")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 519e458e1a890814e5135450c60e5c71c1b75a81..36d5750584831d66b4c2faf6042e4cbb3274eca7 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -47,6 +47,8 @@ framebuffer0: framebuffer@a000000 {
 			stride = <(1224 * 4)>;
 			format = "a8r8g8b8";
 			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
+			vci-supply = <&vreg_oled_vci>;
+			dvdd-supply = <&vreg_oled_dvdd>;
 		};
 	};
 

-- 
2.51.0


