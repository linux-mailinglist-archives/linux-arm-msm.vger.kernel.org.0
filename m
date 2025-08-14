Return-Path: <linux-arm-msm+bounces-69260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5879EB269D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 16:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDE795E714F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 14:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6567B1C5D77;
	Thu, 14 Aug 2025 14:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="i4EX0dqD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338E81D63F5
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 14:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755181917; cv=none; b=danJp6s64isMNZ7n1wDVEJnf/SMB877OUK4/PBKHls0A3OMoBMbIrRbtHJbs33q3nEfmkjAbV75LDnqpxF53A+6wRs+E9VWOb1iGpzMaRa0JGRd7gF2XtY403BDsPRj99fOHmgGDrGQ76njvH6RMdXnIHUgU4HuCxhlbgI6QdxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755181917; c=relaxed/simple;
	bh=DhSXH5X/MnMSzKpEZ4Sb383iahpmcRMY2QF61lP6iQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJIjslPUai5g18OyqhORU+LV80/haM5/GgxFC07J7kfJkyOqwMITrYu7LIiJ26Cc7vfgklsHgjHvlKHt/yjsb0KBM5Nj1Kbj7wnOtIbalKl9HRgkHI/E8ZYP7AZXahHE9d+Fso29YDqSxF9tiX5P8lXqDCUOqe+E5Rs9iZEBQ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=i4EX0dqD; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb73621fcso143207966b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1755181913; x=1755786713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMvQYBfsoacMumg+rF9fJxblVybPFTp+y3sBY09KX/4=;
        b=i4EX0dqDMx6D3GL3u0fymmiQ2gtuD/7PB/i7aL8LXjhAgQ0JBiBnTEaGxVcYILnwy1
         fzn5gsMgXHbuWREZZ3x6QbD9vtGdGKSwsnBEWRjjVcn/hNwV9YpCPUpsGtV2x3aOqWEf
         Ce2E9k8EBbFalrzW/1mZs1bJkKqGsaEAIZPRe+hCiX5L7AV+hEq0Vr6QN/Thc5fj6/Tr
         4CTOrgRtupR8vdMVLdGtmENvuq03/pXYrV48P/gNgUH1PrG/qmztt2G7pVigaMFFGvYA
         xUoycP258w4v5Hc/3wjccp8hNExC4kslsloj9FBVD5G3biL1ULXngL0AyTJIT3boj0vO
         +SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755181913; x=1755786713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMvQYBfsoacMumg+rF9fJxblVybPFTp+y3sBY09KX/4=;
        b=iETJEgLuPKdYVQqD0GSfiOMuLPmobZbbzBMojgoT+B4XpSvTxDh2Rbc5oxReQI/caT
         coI7HyE/Z/6Au5Beo9F8vKePvjNXA0aidKOOcQNDzoOw92LUC8bpMtcqzPO6MpYYkLno
         l915LS1eoc069rhOq7o92YO4MwVPrJxQbDDhl9Qi1Kcg+KdhVDQtuGcI1PKEKDpP9jNc
         wIxRPRSMMfvT7fVJ7YdFkHX/YwM/KEymVAFVd2+W151TsGfzHFWEyKapPf2TYxmw7FQM
         97J8v7znUJFqOn2FgjOJ+mgUHxQ7AE4icYAHLgUbBSvv20r9D67EiLit+0Dzy4dEcR6w
         ifdw==
X-Forwarded-Encrypted: i=1; AJvYcCVX6sMwqjEZ3FqQkArsn6xZSfwi3sS+Q+CKYr66mjfUHz5w5B9BsPGu02ARZ71/jbzX2pa95bOVldPLz5rP@vger.kernel.org
X-Gm-Message-State: AOJu0YwBYeGpsn+TxpAgAcg0SYMYSgGscipQuGY4l8LuFXPooxa8ogmX
	h67oS8+WHy9orM2wFm4+KIL49XVSbPqjZ/YNOk8DjXSejmUa188MkWNeto/7L4xQ8pu9e55/J1H
	xICgmKsM=
X-Gm-Gg: ASbGncsNZgajAqO5sE4XCqRGLdtac3+BFHTZhrSaGbSSz+rl7jYECbo5Va/JFTpoxNQ
	jNKkKIzBi52OFyU4fePGemJgthk0sGT4E2ygQ9kPKLYeJQLzWr6IR9+4AhU9Ihc+qQRh+8PiQzz
	rHyFXaxkjQrqMIyxxvXuI5vgh8QXVfWGOcIfisJb2IstogWLJw21A/VIfCA90MwvDXF0D0NclPN
	Et/dHE4sGUdnE07ByNg5+oRwp7RFEs9XNBpJy+tHYmaT6Oz4AwIsEYcDvVoT+w1K8uJgUa7Jlgg
	FPRFupQADw8BGsX0nfefbtfD9t4m7b4//3uMgBZtZRU15cjkzPvg5PN0Pbc5ayD1UOYLvwWA5+o
	RGkJRCL1RgobrQyuJpIdjMvKi0MCmTtAjT6g9r+QQ+aZchk2uBvBP88iC37KgxtGqaSWh9SwCuG
	ysJHE=
X-Google-Smtp-Source: AGHT+IEpDMl3bfkZteiiPPVcvc7b/5mISGkuZFWMxDGLxGwbf+rrygSrZ8ELSREV1Oqg8RPpbuYWGA==
X-Received: by 2002:a17:907:3f0f:b0:aec:6600:dbe3 with SMTP id a640c23a62f3a-afcb9a3a917mr317894866b.56.1755181912991;
        Thu, 14 Aug 2025 07:31:52 -0700 (PDT)
Received: from [172.16.220.71] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a313esm2609421066b.32.2025.08.14.07.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 07:31:52 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 14 Aug 2025 16:31:37 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 vibrator support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-aw86927-v3-3-c99434083e6a@fairphone.com>
References: <20250814-aw86927-v3-0-c99434083e6a@fairphone.com>
In-Reply-To: <20250814-aw86927-v3-0-c99434083e6a@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755181907; l=1292;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=DhSXH5X/MnMSzKpEZ4Sb383iahpmcRMY2QF61lP6iQY=;
 b=QPyR7vmm/q1jEnw+7pvkm5NHW/TE9mIdQwCqN5nSjgrcQ1PhHSdZfRB40DOgz9Izj4zpqXswJ
 GCCHy9nz+KtCxR8ghCwu+dtaVSWYeVq+YQhfqkZJxW7/VZDaAsutD6d
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the required node for haptic playback (Awinic AW86927).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 4c6cb4a644e2..9576efdf1e8d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -866,7 +866,16 @@ ocp96011_sbu_mux: endpoint {
 		};
 	};
 
-	/* AW86927FCR haptics @ 5a */
+	vibrator@5a {
+		compatible = "awinic,aw86927";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 101 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw86927_int_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c2 {
@@ -1415,6 +1424,13 @@ usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
 		bias-disable;
 		output-high;
 	};
+
+	aw86927_int_default: aw86927-int-default-state {
+		pins = "gpio101";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart5 {

-- 
2.43.0


