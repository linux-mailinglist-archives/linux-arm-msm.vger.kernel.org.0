Return-Path: <linux-arm-msm+bounces-76683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DC8BC9890
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E36163A8BF1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD3D2EB85C;
	Thu,  9 Oct 2025 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FWGAsSwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6652EA473
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020530; cv=none; b=SVDce2crn2LxTVUJfWF/SJNul2l5FFfJiyHGTMpqJnjLqAHfQImnZ2GojL/0kqlyEztJWG6692K1NQdeELg6oplm9v/ZOmxGhU+FqtTfXY62dAzGoAQ+kxVzpoHcusXwxDasjsNePWPANKRjiLLhBA5lNahcY5ozCImvTTUJz+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020530; c=relaxed/simple;
	bh=Tm5EfTqaC5QMSjBI6EGvo9CBBe5CgOuV/UJUlgWJ3EU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LmMY3zjyH0I1ivtZn5RYLmHMoLQApx46o/23fNEw5vF+zU1ogdPOOteCxK+KQGrWFn2vy3lDchAj1TGnWGH0UqRXHRAyZGa96+CMvapEVS2VTlRBDaB5B7PPxSLFXp7iePSx/VIdFYL+t+l6aYkFZoV87mKMK19XKPVLpknI3yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FWGAsSwJ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso2162243a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760020526; x=1760625326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DHPPLmhygT7LvJBN57iAEhxLZcu4AGW0vEJ/bXem0w=;
        b=FWGAsSwJ3ha8UBWVQv4NUbw2spgvlyISDgiNnytekBK6x+iRxmEcsZPy6Cca3Igftl
         4Ni6eVw95BhWjN6WASYjUpkzl7cfyGwcizsPV3c98RVkATctQHQqd5HFuxTfAzbBl0OF
         sCIKyKmBi1jkgUXm2JUkEFPyb4bwdIMCWllRQEvrF+6ESzRLKA3yZItBGKlCEH8ZzRj+
         yMoNEH8y3+/xHaKZkKuBcu3qKHgZUp3xNfyeWIu8y5vNjcHUeFQzdngdyRw0K3XemWzJ
         3pvQmhOgV6Nhcy92dZHQcB8tMRtfnUhu7Dn2lWLx8U4um4OKOc7kdK3qSUhDqiOSDVmX
         wv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020526; x=1760625326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DHPPLmhygT7LvJBN57iAEhxLZcu4AGW0vEJ/bXem0w=;
        b=oLekSbybL4SJJsoubzyXBtVohubZjGlIzJYKKPfuF50vsnTHDrMUm/rfE0w4d/LE+H
         G7jE3IcBUJDPj5dXD6uvYcvzg13cKZJaxVk9+2ZILsRfruJ1Vyj/FeJ1Sjh4T86wcDI6
         VI4WLnQOhyZrjwQvPpkqzjvPe5EJZMq3ci0FWORtbxh0iDiXVpnDCaxuq1OH/YdbqFxZ
         HfTZU/1mS6YotarGpKZ1WQ6jjEn8u/zVOfcKlUCWIaTEkp0kC5T06VVppdoYLoJjBvmZ
         hLmY1iNgLi8OZ4H6ZKT+XNQepQJFQYmgQYwxd3ndFmPf9guOf4lg+jLAp2Mr7iZb4hVl
         zF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgu6ToMO0noiUlrRcpL/KnoIa5wbItnusmAqa5MkpNl9ese/Ztd4sUMqz6N7Zf70xqGtX1SX9o+49hxLae@vger.kernel.org
X-Gm-Message-State: AOJu0YwErcO7cV0pp/HadhYzbJa+ASDOIwuTUGAkKSW/RiWohVIRdYmB
	3Qbu2SGOBFFnTxZ/HkrBDsV/hq94rkpBbaPeE8osTAC8U/d65Af/BzBkgtocL01jBZg=
X-Gm-Gg: ASbGncsy/7qWxoAjx9RwKksORa2aDyChdPEGCjfYW8Nzr4a0fwCkK+I+wZ8kbjC42b6
	9VZytDWgnvReLA/pwl9bqxcSHEs6+JwInn0RaBVAU4+TBNvJp+1M6kRqnq5BYVLicB84RAa6yd+
	7YIvdpykoITgCOBpljFssIyYSGUa6W+itxog137tQ1H5IWPRIO4+gqNErfMMdU72Twke5/93Igs
	kGf3KmRxApFJb2fRbyNrvkp5nP2JPUYFNo4N7IjA3jpwDVJfbSlDbYcltRI4ZJ1JPzGsGCrPIz7
	3QQ+xsg4T05jxl7sLXAJly17DsiAWvhXdOwn0iBzjmonk5H2lZSEtf1hXgGAf3Eb1fRMXA3Sj4K
	249rjYcSjTesJCO2QWUqIp119+liIMgq/Qu9HLJom3UpluYzw5qfQapa/P5NZ/L5tT+M3qPuPp6
	OyIxvfrRRAhkyXW3N49bOJriLXS/Jz
X-Google-Smtp-Source: AGHT+IGpvCBf/6AFoWh0ryKjV63PoQaWy0iA6WnNNox2AMwgEWvefm4/UWZWVAqH1ctSB2lwwtUAdA==
X-Received: by 2002:a17:907:809:b0:b45:b078:c534 with SMTP id a640c23a62f3a-b50ac5cf768mr908616266b.45.1760020526492;
        Thu, 09 Oct 2025 07:35:26 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606dc84sm1885797166b.45.2025.10.09.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:35:26 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 09 Oct 2025 16:35:09 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI
 pull-up
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-dw9800-driver-v2-3-3c33ccd1d741@fairphone.com>
References: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
In-Reply-To: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760020524; l=972;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=Tm5EfTqaC5QMSjBI6EGvo9CBBe5CgOuV/UJUlgWJ3EU=;
 b=MhSWOCpqJXGxUUtwnLCjRnSXLNXuk0uH/IvCO/kBKSyHfHxd6pY7k98vC8oLKyZhywKKumTV/
 Jt2jzAYz2tFBY0G0R+MUbdpyJQCiZtm2ZXzcXrxBIT6qg6CP9LTR11j
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Enable vreg_l6p, which is the voltage source for the pull-up resistor of
the CCI busses.

This ensures that I2C communication works as expected.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index e115b6a52b299ef663ccfb614785f8f89091f39d..2dd2c452592aa6b0ac826f19eb9cb1a8b90cee47 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -749,6 +749,8 @@ vreg_l6p: ldo6 {
 				regulator-name = "vreg_l6p";
 				regulator-min-microvolt = <1700000>;
 				regulator-max-microvolt = <1904000>;
+				/* Pull-up for CCI I2C busses */
+				regulator-always-on;
 			};
 
 			vreg_l7p: ldo7 {

-- 
2.43.0


