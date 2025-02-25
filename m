Return-Path: <linux-arm-msm+bounces-49259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A15AA43AAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52BD11889563
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A7E268FCE;
	Tue, 25 Feb 2025 09:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QGcT2MlQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A885D2686BD
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477570; cv=none; b=QpCiR+zRQLNhWPjwpSPBZHW1+SJFca/NY7W2bwfbE6ELU/RCO0JglUCMud5NsW9/5ght46/vu/U+EGpOqvEk2ef1cOzkt8rvk1aL98lDtE5P6cFOj9BBlOWTuXxfSvkJKHr3tnmYt1rlm6aJ5byWpU6Qwjd0qeBwOgDtF+gnYjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477570; c=relaxed/simple;
	bh=67V1UZ5je163oIRGK8VHBL/lC6kfzMUCzZZv0swusmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X4RW/TLcBb3CiNvTFm7Z50mJFfrYaPMVXHQvkFYrEQ3pnI7rowRczmpgtoJR368cMIGftu4fqNpoWx7/xtz5cdFR1mFWj2HDqcxoTRJuBwK9ch9GgwWRBJg16YnMG06QCjxp08+HpydEu21DrzLF/VR6lderd71yujnV7QN0+kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QGcT2MlQ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abb88d2b67eso62648066b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477567; x=1741082367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNRBwUyyiaQOQXyGOlqtxLAExVtyS1NxlvJ8en4/bhI=;
        b=QGcT2MlQ8YvKTdd63pqAVbhc8LhoW00VXaUlQerWBxfTx/ynPcPohIGU2cZu0ty/YY
         wURQ9ITPRULz7rvIoGUDpMCr+n5LR9k4+rDSjL8S0A2TDXkVbgtBWLAo5kECD1R1ORb/
         nLhMG8p5cg3GUbnqEEbFNiyhcatQUvEHOzAwmE1veWuhtRtqII3/cOqjP/vgV+7+4eSe
         SP1wBh8tQd8tvs9MBWwfCglh8Xlkh+/Gu4CCehwv0v1Yhx37MUu7ERiH9f+Fezh/o3rV
         +XbFn+MZ+9gOHuPW0qT1/OSWnceHcBUGMhnsVC9ENNTlXgU57MjsHCnjiljwYN1qi78C
         HXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477567; x=1741082367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNRBwUyyiaQOQXyGOlqtxLAExVtyS1NxlvJ8en4/bhI=;
        b=X3NU8pf0W8+0QLclHy2wi42hB6nbf90vzQBr51Lzkf1ZI6ZgRCP17NjTeZBHETinVp
         L9cxRp+7OBdkWWB0hWzxPYPWQbpKZt7Fam9SHzh1Irr8TsSu1xhkBwK+KsJLmXriYB+U
         N/3LSXbcQQVJsjeDcgKz7MvAVnNryUybabvvRBxjHUiPHGe6Gscf+AtMnW4ftMsUQFDY
         mKPwMjpD7c1qjt0ta3KOtiN9pFLc5fA6NxbDiMcsFK2uwb+Du2FiJPGnBH0qFCZ4HKBK
         Gc6LW4BJhYazHzAibG+PMcB9YVMF5qz2hjd3LFeb+7JvbzY8dorFvlUawW1axEuE+mHT
         WyqQ==
X-Gm-Message-State: AOJu0YwF8KFj5LAMDr0tSHJNvljhNRoTf8HjLnvvCaleOOKI5X7oyh5q
	JFFBGC9z5lzjXcR09jlNCsAvTUNaGLUrwwT83yUEmMn30/B2xBFb950+Sq5WudI=
X-Gm-Gg: ASbGncv4ruRAFsTsUvS9HiYV+b+Y0cEPUMoWW5Q9yJX1Cwz39r1tc5rkFd80+A/nUlF
	kr+62zr1lrEEdIgSSogW/iX903C9FeMpiFSSq9JeNqNFJlKVcTwQhxns4k0mc2ItEFLu/P+1daw
	LSpWpLyMQJ9a/i0GisvULdvoCIkKu/sI0g/0BTSFRl3ZYGSwHeUr+jBqlg/stjLvlmaXQFK3Cbi
	l7LYnQwZqoicpgKTHxipTHB5vvxnbOgZ6YyP2dJIoTd7d60Q3OFCYsd0Uy4+rqU/1RZyIVdYbUF
	xQUQtmkD+MoLnJ2lHtT9D54eZMzsU/IP5KSOSs22g/M9vKclYjV2tkWUUchuTQri0/tDe9u0tx0
	k
X-Google-Smtp-Source: AGHT+IE2RuCZBm00JOgoZXgMthpgNV5BBMI0rbdPxwD1Ti7ivMzAn5TwcRdBQONc6VSuVqGeRAaZiw==
X-Received: by 2002:a17:907:1ca0:b0:ab7:63fa:e4a2 with SMTP id a640c23a62f3a-abc099b83bemr654595466b.1.1740477566766;
        Tue, 25 Feb 2025 01:59:26 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d59391sm115164266b.56.2025.02.25.01.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:59:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:59:04 +0100
Subject: [PATCH RFC 07/13] arm64: dts: qcom: sda660-ifc6560: Switch to
 undeprecated qcom,calibration-variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-dts-qcom-wifi-calibration-v1-7-347e9c72dcfc@linaro.org>
References: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
In-Reply-To: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=67V1UZ5je163oIRGK8VHBL/lC6kfzMUCzZZv0swusmg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvZRs1Ihd964DJcEaX7biRqppqmzMMhBMo9cnc
 PV8E15ZEB+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72UbAAKCRDBN2bmhouD
 1/qAD/9twUiJO4M3SNeggoEZioHOnmueiPAl52+U52H+kXid9CAaEMmlRs4ROrfNZMCtKomscbt
 JxZbORXQlHnC7xxKkKwzsXBlajblfsipvj9uxTdHe1NLH3EFAmWzm3cBHbdqKxXWpTrxMtQQF05
 BvXkJgJWDLV1Jn7gywqTDJuj4zTN5FcXA+A0GMaezw3J+HWWdSeQ39Z2pXQAHs1rVFSSd0guyH1
 J3XfVDwvMCf0Q9R9QKW97yWLPCNPiTfsKLI8OQfzKs10y6M6bR9yPC2lOSh6sO43xCNjtpjmxMG
 v8DPGjJSHELB6pgKgT+a/m2/jvTf8jf4d3Rxc5+9OYXUz6qjAEZCOEMeezUXkyEauYDVg8cBBET
 ajIaQyst5MbnYPH0t+qJ2IdcciEjiWHBvkPnEBvC05cCanHRJJ2C9qjVttdYE2SzhDAzbxrxbJg
 Us4JKA0snr1lF2BfUVopdY0vIuMCEuz6azoSsz9YGBlKy9oON4aabj15rVW06zxh9O8IwsqBhze
 smQW2sIIE2QRv3jU3NGkqgWDFyoCGlswWtn/8ufdqoDijtYpD70pjZLCPkvIc/sqfqaH0VNs7HI
 OmMte7zidHkXT6Jr96AQkU4yc2j9Qvm5Q8xol5yobTNBNxJ33zjH+saHDX61nTOcLFdewHbLAV1
 3M3MhKbDnceQkLw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The property qcom,ath10k-calibration-variant was deprecated in favor of
recently introduced generic qcom,calibration-variant, common to all
Qualcomm Atheros WiFi bindings.

Change will affect out of tree users, like other projects, of this DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index d402f4c85b11d17dde80d17964d1f45767645ff1..4a51076890694dc96c4a328ca1d35bff8f0fabf4 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -507,7 +507,7 @@ &wifi {
 	vdd-3.3-ch0-supply = <&vreg_l19a_3p3>;
 	vdd-3.3-ch1-supply = <&vreg_l8b_3p3>;
 
-	qcom,ath10k-calibration-variant = "Inforce_IFC6560";
+	qcom,calibration-variant = "Inforce_IFC6560";
 
 	status = "okay";
 };

-- 
2.43.0


