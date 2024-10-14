Return-Path: <linux-arm-msm+bounces-34349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A599CC88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 16:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A5BE282D4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 14:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0851A76AC;
	Mon, 14 Oct 2024 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZt3Ldo3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588781AB508
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915308; cv=none; b=LYgHFQmnn8MICXbSmvG4/Z04yXX+xF2HcFbCFy44RbRrD2PKWqEpD0/q1k7Et0fxK0FvgFNosf7BlQ8xQ4Hc1uRnbG7hksEIMqfVX3F9yoLkXp7Ym6rUbLyVTdRItrw2Iw03yhc+L5SUySl6J+5eJbnyHzoy6zQiO6S7sP/GuBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915308; c=relaxed/simple;
	bh=K0bOWEC+HE1kkNV0lJmyf9eNjeLakCtO0ersbpJzOt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A+bUIraBPAwn5xTZtLU+XzHnmhLP2wXsI1gMg6mMwW+qryCb8vTHq9shOLF2iFHSEA1v9DBHyst4dcZ0GJsRV/nCbDB+GtG1BrG1xA+leJvaI4R+MsrgC4vAVKvw+kE2DtFmI04cJXR18evSLPYBILNO1/SevYhJhj+MDPyttE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZt3Ldo3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso3049519f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728915304; x=1729520104; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mW2Gu00UK++/xXWN5E2WTl/GlqCg0a99qal31mqPqL4=;
        b=pZt3Ldo3Q5igYGdD5d6kOkQM4YgHnT/yMpn/afw4SfpNWRzgvmU+DbW5ijw2iIdpbd
         p2R1yIn+M1pL5iu888FjcDT6bDQTFrmjf0mZzDHef9phcchrfrdWHcfNu+toKvlsOXFe
         13JXSHfY8D6wV6uuxb4bhHPYwj1zSoLxqMJBu0GZYhIjnmyvRiQuqFQCpBlVuTn4k1Oq
         nvaoSSeyWLuhBTR3j1IxvQ8NfhOrVSC6S+LQztfK+Gb5k4wh9i0N94WvRDwuZ76Zcvz3
         ZXDJhLtBs8NvpPz/SK9LQMoo+faHOYAJIXV4k+P717yMEuRYJu52gA9B2qnMJ2bOJd69
         n2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915304; x=1729520104;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mW2Gu00UK++/xXWN5E2WTl/GlqCg0a99qal31mqPqL4=;
        b=myG200CKuSjS6VEF+ts9O0KaNFjnwc0FeLNSWnHiEE2uDQ/DSri6YvFE1GS6hmFo8F
         T7SwMi/aZBJLiLObgCrVgN/EXpsVIzj+XXLPRvPBcA8k2qhY2vlFfNdCSsrozukBnrq9
         sV+SwMs6Eu9qRB+CTnZPdNupb2jyPe0b50lumgi8tWf5gLN9G61M3NYrNE2kExp8o3Jc
         xYyJaz6rcCb0aQrgZcqO2ahMvD11ohM8I54Evx9kT3VVYYuaZF/pLHEiDb9fyXYki23c
         mFEHHkh2BnKT2jlreMDwz1S/7F0Y5TGE94JEFVUnsd1dq9TsCtPQ4ITCuVNnVfq0nt9F
         F3XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjUZ6BVivc/sWeupUDdhV2sxYu2hu9a9nL7ASzEgDG3O3wpBbY/UpH462eKn9PYNMA0EhGGQHixDPapiI7@vger.kernel.org
X-Gm-Message-State: AOJu0YxHj3CFWpFCTcXASr8QuDis7ZtuPCHtcN9q/gSSopngXiizRY3X
	YkpxJHnwtsHUalII6wZlOjHy7kJ8XhFsf5CnNPoM3PDie+N5Vskf7iGOH39kNFA=
X-Google-Smtp-Source: AGHT+IH842xmdL5bgstxtrmHRDZldATMix1NsKVGEEADafMqa0y/TCecTEVTp7Q6EJfpih1E+b+IEw==
X-Received: by 2002:a5d:67d2:0:b0:37d:492c:4f54 with SMTP id ffacd0b85a97d-37d5518e02fmr8134392f8f.3.1728915304493;
        Mon, 14 Oct 2024 07:15:04 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf45d49sm154135035e9.12.2024.10.14.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:15:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 14 Oct 2024 17:14:51 +0300
Subject: [PATCH] arm64: dts: qcom: x1e80100: Force host dr_mode for usb_2
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-x1e80100-usb2-dwc3-set-dr-mode-host-v1-1-3baab3ad17d8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFonDWcC/x3NQQ6CQAxA0auQrm3SdiAxXsW4EFqkCxkzRSQh3
 N0Jy7f5f4ew4hZwa3Yotnp4niv40sAwPeeXoWs1CEnLxC1ubFdiIvxGL6i/IWHYglrwndVwyrF
 g6hKLskrXC9TSp9jo23m5P47jD07N0Bh1AAAA
X-Change-ID: 20241014-x1e80100-usb2-dwc3-set-dr-mode-host-35312d1d25b2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=K0bOWEC+HE1kkNV0lJmyf9eNjeLakCtO0ersbpJzOt8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnDSdhH2/cZLsXmymGJqy7UxGVRgwXHjFlNiBcS
 P0vJuqejsuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZw0nYQAKCRAbX0TJAJUV
 Vt0+D/90zb+NBqLdICEDlaiQgWoO6WnVto3rxw2B497MTfOCFvx4cnqbaoEGTM9o3NC85DvL1ht
 0TG/+CA0kqqkUdFggDHf5RuF+xc87v0sVQrkL2kqV3iFLlXgpcNXWirQHeWyAMNj66EVMh0KuUt
 1xCU7Rk2OyamOSAz+58yRhqBs5zEX0gksWOFL4+9bf2EJeJuQu2E2NdIYxBGFtUBvL45PuZYEf6
 E0d1Bocj0eHvKsaw93fVhQ+4LAPvddYhYb1Ilcf5Lz0Z6hHtBk5tBua8pBlPkYabhT61Lu5Ljx7
 Tp1B7RTq7kzgMRl8NXTzZ5P0aBPHhqaG2tUdULxkrG5y0M91/v/0FWkG0hocnm7Qz0JntSWSaDO
 yElIkHDnD5lUUjXcPcAFbbRrYPW7fXv3PoOjCTWAVwSIs2a/x8MhAkZjGhsjqjJS/VSPlYzzvsq
 SZLAEL19dkuaRoHSB4jeFTwshdMp3Gmd6uAvrcbjKhpTJ18LeCbawVbVjpeWfTzKZ5Wajoqwe0A
 qQw8sa3iXWujHWHVMUYvfrRFU0uwGVAS/OSt8FAqJJTjzpKEfSt25mLSj4PL6vtW/7EqdNNZZXm
 jZEAolQB+IoD/dxNm11eUsbkuu0mUiMtr8sM9ORb6k/GLZJAdBVL4IbicJ3M2H/KMbWkXRmGndl
 091ciVll+DrEpQQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The usb_2 controller has only a USB 2.0 PHY connected to it. There is no
USB 3.x PHY fot it. So since dual-role is not an option, explicitly set
the dr_mode to host to match the hardware.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 0e6802c1d2d8375987c614ec69c440e2f38d25c6..4da13c8472392d842442193dc740027fa011ee1f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4143,6 +4143,7 @@ usb_2_dwc3: usb@a200000 {
 				iommus = <&apps_smmu 0x14e0 0x0>;
 				phys = <&usb_2_hsphy>;
 				phy-names = "usb2-phy";
+				dr_mode = "host";
 				maximum-speed = "high-speed";
 
 				ports {

---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241014-x1e80100-usb2-dwc3-set-dr-mode-host-35312d1d25b2

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


