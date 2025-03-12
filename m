Return-Path: <linux-arm-msm+bounces-51143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39421A5DC34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 13:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04D2E1886BE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 12:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476752417FA;
	Wed, 12 Mar 2025 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jUEYxV89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679CA2405EC
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741781117; cv=none; b=Nry7MentPUFldN1LYekyb5MjbouHUcfQvw0VCoQVMRMAztuDiKJ2I+tVoeyGh7h9zzEVt8yKqqAjtTdfWJIiCflRg003TO3f69tKoFxIFp6GqUstougEEQhFd8aa3cccPUWucmZP/l4PzrJF6fmVGhHesrLV/H/RGHvFu+YRod0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741781117; c=relaxed/simple;
	bh=6cX5THqC6SB9r/MQ3znf5AsR5rUbbWbJXTQlgQ/Nqjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2Oo2t2e5ZIrSTqA67+JzyW56Oo4qIkVOCXJTN+orAZiHbGxnMYwq/NHVCCLqoD4FvCYYOx917MFg+thPR2xXFelNV4+34+ZyMQ1qXkZaKbYBFQFNzSFKUNZRaLyUrYXSjeAhiXtEmIeE8zF3+OnfY1PkGc1Y/m5WmX9zzSOmtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jUEYxV89; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39127512371so3703861f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741781113; x=1742385913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCeb1ULglGuh9XYKx2CHU6Na6xTURFvEBVoDxNzGMCs=;
        b=jUEYxV89keR7imtJY9IfCWeqsaVyYj00KMLe3E41pEckrOnNGETmtX+/sS1VKQgGOW
         x7Cv+0J8Y0trxcynk2C2HmIKvKwxSKvB7dfQkuay/EkhtamASXGos3go6mQZeK1D09iR
         SmsvtUq2dM8GL4lTKjBcBfaeikdlDIsUpuXlwK7DDMICBIGzxAzmuxQPJSx+X0/ek6qy
         2LbQwrxnhQmHVf9yM+9/Anc4f17x6xz8S3cBeRJ8SHEL1hhorEMrgveCu93e1g2eJWdn
         62oouNVNCGd6QeaJ6B+GRev7jD4umtSga29waY7nSQ1fvoOTgp58zC3EuRvNs/haqDJD
         u7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741781113; x=1742385913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCeb1ULglGuh9XYKx2CHU6Na6xTURFvEBVoDxNzGMCs=;
        b=cHnl3MbnEDgUsmdOWwHLqCV4qOTumNmKUx3rqkf1BB76NeOF3xflizvt5oHkIWTSuz
         P76JmB+Tv/PlKRMn38ngOzDrvnpBUiH91MGBn4p45aT3PmUfwDx8HDEEabVyH6DMIE2Y
         VCxPvvAAd9m385SWcF44uYhQn1zhzAElh2XPsNL6D+n1n8nGe1wLCPxS8wKlHlw6/pj7
         uGYzctXLuX2UHHuiYx/Ct0c08KbU/kiWdZ4RXKipSQcrcc6eJ9m6FVy3eFUBmqN0WT9/
         Q/C8AMqerlGAoN8Oi6UWg/P2C5PJRbnikQecFFvSMEfUZULI1sDIXxRQh2bXjVWVkAZX
         Yi4A==
X-Forwarded-Encrypted: i=1; AJvYcCVpycfS3yrY4dEal4sqwQnYrut3Mx1QQzBj/RI48L6Vkj5Ie3sOVPC9fjbU2rroYGpN7DUoWZ6bmNncH2Do@vger.kernel.org
X-Gm-Message-State: AOJu0YzIbMBlfG9ilt662KX6hS7MWvLTc2KKft6hQH2QiQUHOtFmDZrn
	9xs1qjt88LRegFKVFHSfICHi39jDVvy67cIY2jOFZBBP189AiiUsT+dPB5MwCFY=
X-Gm-Gg: ASbGncsNR4rMph8gw1T6AwWlf8awtx1ovP647hSEwpxwnHDgaCo8GC7iAqPjcU2q5mD
	5DRu2BJTg1gGiZUks78qrYrB0avP1JruH6tYEOKtw/LCuJmBkO5gvWfoEqxafnkyfs11KSzAlZm
	JOBWeerDNvX9v7UfS24oqhNVx+e4e76AEp8FJn9VUryunMHuTkLsq4z9eyhhwZATfYyIxn+/7ax
	TZTQ9vXFWbk5uwwuwc99jB25SxLnXvz0Cnad4ZHX9UphAggnuo69I1vLIjBEK9S7tBhCrzt1gKv
	B7+dmwL3KUukkfNm9tzbzNvY35ProL6gwsPYyIodd/tymLTZnMjqAMOnMlxJPRk6U2bciHwTNZ9
	iWnjTiFYlGs88tMT+dQ==
X-Google-Smtp-Source: AGHT+IFI0x1QPiyLI3WY31duJJ6H2f4cFVzC4D17zbYy5/vSinoP4DDZ+b2H7r9wwYkgkoxL/ETrNw==
X-Received: by 2002:a5d:6da8:0:b0:390:e535:8770 with SMTP id ffacd0b85a97d-392640c841amr9041223f8f.14.1741781113576;
        Wed, 12 Mar 2025 05:05:13 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb799fsm20810608f8f.2.2025.03.12.05.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:05:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 12 Mar 2025 13:05:09 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 OCP96011 audio switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-fp5-pmic-glink-dp-v2-2-a55927749d77@fairphone.com>
References: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
In-Reply-To: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add a node for the OCP96011 on the board which is used to handle USB-C
analog audio switch and handles the SBU mux for DisplayPort-over-USB-C.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index ea9f5517e8a083e37c4b7432322bd6d18fea84a5..e0470be9142caa4bac4285a191725bbd60e706fa 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -750,7 +750,19 @@ vreg_l7p: ldo7 {
 	};
 
 	/* Pixelworks @ 26 */
-	/* FSA4480 USB audio switch @ 42 */
+
+	typec-mux@42 {
+		compatible = "ocs,ocp96011", "fcs,fsa4480";
+		reg = <0x42>;
+
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc-supply = <&vreg_bob>;
+
+		mode-switch;
+		orientation-switch;
+	};
+
 	/* AW86927FCR haptics @ 5a */
 };
 

-- 
2.48.1


