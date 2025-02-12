Return-Path: <linux-arm-msm+bounces-47795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB79A32CDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 18:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6D2A3AC312
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B03726139A;
	Wed, 12 Feb 2025 17:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yoeZePFy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F134C260A5D
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 17:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379866; cv=none; b=NF++7O/xE0biYb1VOabKvcJDy/k5gq/ZYmpPTD5RZeeuQbDdMh4Fw5PLa48jNN+a+a/2bI+bkf/USAjCCpH0aUkPSv5q8TMxefskoPcZCS5l0I2bgbE8QHp4ElnuCY+hu5SzyiCrYk45YM4LSEUB4xep+2cGqycmum6NyNynD/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379866; c=relaxed/simple;
	bh=4w44mTqF2bkyVc76fDw8rdR5cONqNjm0mBoDtJiF+zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxAccy0Ub6mNxHRQfQVkJG/LGJxXWX8LQQ/rEsGeduHEHiLPV+9m6M1wtzVbYiWNZc765TTrVvZKL4MUqB7e3NT76tHJC7xsTUwqx3Bdrr5zNZDTSTCdW97NGzIjGPxSTvQ3ESI+urE1SI9QDlXZpygqqhST0sUQ68FhPmYukRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yoeZePFy; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5de6e26d4e4so8072021a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 09:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739379862; x=1739984662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Now2NkxuPWvV2DBMpvY1YciTmYHo1FaB4LpFzdcs/7c=;
        b=yoeZePFyngUDYFlyXaXcVIXsoebUkK864jzr/WLOgZLCa9T5EgYxBQXi4kTrKMoCv9
         ZuL9yasOSRjxWUKm4yMd2d+CAE0x7k629nMtIT0IY0mj3soFhlWZygOJVXrLYuvKY+Gu
         tNBV3UtYB+0xpGUbRkwd0HiDGSSA31403gvflaRhKEL13GxNxGnM42H9unEVKcX6TG/k
         +P+d4DiwztfoPJlz+ZCq5SF8vYhWWElOaFi+7UtL62OswWLAueghX0tZ/hixQVaFQNUc
         zgHtJ3Q/ho54SWRGzLT/NFTQzkTo9mIo8r1Ph7cEyvpiOfLt/jb0oHrM0gkxd5fnP72c
         zbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739379862; x=1739984662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Now2NkxuPWvV2DBMpvY1YciTmYHo1FaB4LpFzdcs/7c=;
        b=MZuW0Z9s8EYOAYviTM/DZrOUGNIsLFjMxKSBN86MdlRHuzttUFRsbNM25WxRq4M2TY
         J2/dZZJwOF+evSX3GPz9clwD4ufdYbkg9yOiSMK2yAxQzrwg+wGo6ntd6zjkB7465TKy
         Hqq/MTydBjoVChb38kUrcxw2ndApTa/9wev23IjvUR2duC9VxfPpD/kh57YTy+EryKVf
         phaKjbLxX3RMPlXk9T9abrAjn15+8Q5m4Ipz4Ac5dW5lg2oVYDMPNtYZFLoHWY9512xb
         jop7B0uQRohhMM3WdyK6rnPHILpjGoI4NdNWegFjDJuRjyZN0fQJUZ7cMfdS6sSH+dGD
         nMdA==
X-Forwarded-Encrypted: i=1; AJvYcCWZZYoNVNImkSc11hmgimYnYQMzsdzNyo6ReOOfiiTPrZbht9feZKelR9xD32PXIEj4aUPE7GP/DcNzeyTP@vger.kernel.org
X-Gm-Message-State: AOJu0YyVEYyQoG2+GwduDC4Qe/G/c/LD0bCKWI9smnkpfoxI4dQ88R67
	+sZBGPHRroaC45TOvXN3yLEIyjyHHkjzv6xivlWt62Z1IgSipdEtVi7w2LQ6RVY=
X-Gm-Gg: ASbGncvHDqOYzZuhsGE5uWhDAaYqtO0Gd+rlnBPBDoTSnvqoVeT6YuFEXR501dkaH4E
	YcOgYyArllcmTe/Zjqcq0liFkp44RKzhROrIp70JZobJ7Az9TMMm163hQ8dq4vjdGGfqjvND7lH
	Mq4WG51JULMmn/W+g9opDG0o1Z2svQBi5Rw8H0dYZcmzJHZId7V3CyIc3gXxCYRUMkkOl7nqqAK
	w2aToDJi0Bl8qMopLSKt2rQcnPVZd18iRerSx3WaPYGjxgPUnzYB06kdpH3kd5rfVRlBQtxjud8
	0n+l8mnQou06qYSjUwc1x/OwmuL1
X-Google-Smtp-Source: AGHT+IF9uLV5BjL7W/hlLhRIgJ5kaxpUOWiXIwYcgEvXKhAZgDqquhFUvl+Ya9kh98It7qH6hh74Xg==
X-Received: by 2002:a05:6402:40c1:b0:5dc:1289:7f1c with SMTP id 4fb4d7f45d1cf-5deade0a57fmr4072086a12.29.1739379861924;
        Wed, 12 Feb 2025 09:04:21 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:52e8:f77:3aca:520e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5deb9f6e46bsm819230a12.71.2025.02.12.09.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:04:21 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 12 Feb 2025 18:03:51 +0100
Subject: [PATCH 5/8] arm64: dts: qcom: sa8775p: Add missing properties for
 cryptobam
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-bam-dma-fixes-v1-5-f560889e65d8@linaro.org>
References: <20250212-bam-dma-fixes-v1-0-f560889e65d8@linaro.org>
In-Reply-To: <20250212-bam-dma-fixes-v1-0-f560889e65d8@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Yuvaraj Ranganathan <quic_yrangana@quicinc.com>, 
 Anusha Rao <quic_anusha@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

num-channels and qcom,num-ees are required for BAM nodes without clock,
because the driver cannot ensure the hardware is powered on when trying to
obtain the information from the hardware registers. Specifying the node
without these properties is unsafe and has caused early boot crashes for
other SoCs before [1, 2].

Add the missing information from the hardware registers to ensure the
driver can probe successfully without causing crashes.

[1]: https://lore.kernel.org/r/CY01EKQVWE36.B9X5TDXAREPF@fairphone.com/
[2]: https://lore.kernel.org/r/20230626145959.646747-1-krzysztof.kozlowski@linaro.org/

Cc: stable@vger.kernel.org
Fixes: 7ff3da43ef44 ("arm64: dts: qcom: sa8775p: add QCrypto nodes")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 3394ae2d13003417a15e64c9e47833725ec779e6..8d7d157ff2f56a31a97121c882e3e0336356eda0 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2413,6 +2413,8 @@ cryptobam: dma-controller@1dc4000 {
 			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
 			qcom,ee = <0>;
+			qcom,num-ees = <4>;
+			num-channels = <20>;
 			qcom,controlled-remotely;
 			iommus = <&apps_smmu 0x480 0x00>,
 				 <&apps_smmu 0x481 0x00>;

-- 
2.47.2


