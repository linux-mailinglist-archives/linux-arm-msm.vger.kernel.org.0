Return-Path: <linux-arm-msm+bounces-73173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42513B53BB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 20:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEF00166C12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 18:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C3F36C067;
	Thu, 11 Sep 2025 18:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SXSyy+Bj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6872DC779
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 18:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757615931; cv=none; b=nR70yavAKDVDK0V+XnD/Ldhl0n9loizDRRTgYYhK8ANdWNofV5nnc+27f1k6fHg/XXA4DhngVjZqFOWIjjOj0Lb6K5FWyFECkOvn5v9CeA2rQRdl3Z+/CVgEFBPN4UdccdeF5/Aet02DBPl7ieJHJ03U4JCBEc/h3eXAp+nbMsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757615931; c=relaxed/simple;
	bh=GkJ7M1IZYdSsPo+i7feYGJCc1WqaRmYrlPizjbHaxNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SzVZOFICW80kNDmzsDMIVhHW9zaVM4adADGMyjFFCiU1Bds1dTUuscq47PuHizIovxHO1qIGbs0Dca2oGHOUpWmjxsbzwoqSwPypbwAKrL2tAf+f6X7a1L+JutPVSc0G2bWw6dmo33M6N+eltUtXThZ6A07/nsJI6J12UGfYJfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SXSyy+Bj; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7322da8so205861266b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757615928; x=1758220728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbF8zTx95VP3sh7yY39VofhyD/D+G5JJGtohf6m3u/E=;
        b=SXSyy+BjO6HOLlaNq1NHTyx6+WBEcKg3dm+hcDtmUvzvoRRyweIqvl7vV8FANkjdNp
         6UrW90C7ywI4rFE7wGC42pLo080dYHw5tgOchVCWSBwiwJqvlhJv2pi3DcbIp+Aj7zNO
         ye05Ym9aA96DhWRvw2Cfdg4HqhipareLeGm17ZL6w1Mp4vyePlnRRqHpP1hrf9VUFfou
         6yeJtq/qKBUg3iTJsFUywzLBSSdFfh3qZO1b7j1LiujC43S7sqqhgOIY8off/Yq3VnWD
         z14Wdgg7p00ee0u5w95xADOhLWZVMuqW/W1xWdurXPCQfl6xO2adrm+mxFAtUl/Ewdvk
         Nhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757615928; x=1758220728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbF8zTx95VP3sh7yY39VofhyD/D+G5JJGtohf6m3u/E=;
        b=djIZhMInPVTvGew3SGftHMUY49MMtyAV8xTsmLu623J/HoIpZ2EUYniks8HqVbY+wY
         9ahwR8NmTvA/kMYbyBLcVGOuvJUYKLSSmWkZADsm7Mc2KMc0FIaFPVYOveoiGknXm84X
         YS2YYFm8n1ju1AC4VOOQALx6y+4KJ3wxtYtgMa6pGezvAWB/cNktDxMrNN9+u3SdSsy2
         FiXIlryWe/X0qN1rNdVQWTLF15x1/GaWFIzXMLIoTTNN9umbE7Nz9pTEMTvHM5zScg9d
         qk3UKYigtOH+phLQJa/bpXAOuRTPMx23a4yrHPa7SZ2385mau+DIMOpViinq3kLeokwF
         ZwbA==
X-Forwarded-Encrypted: i=1; AJvYcCVHDZ/Ph5APaiDQb9kZleVEHllTMrzpajUEPv2JLxrWG88DyNBSL6BcEXqdkxZH1AyDnp5iRkxsZOVll4ne@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4MYO/hbW2M3MSqDe5CkrGwn73GDD+A5YL2w81rqNlhLncYbgk
	AjnLkCVHrc3GRwQzMnCobyKw9agkCFJp4+kfbPSd+zKsHoEK6dyK40cWJz8oF+u90ns=
X-Gm-Gg: ASbGncvH3iLmNPEF3en5nbKRCr9iwy59nHL2wc/yM2hZa6NdIlKWBbqniNBSVj/ToqW
	8XX80DrrPN1nRMLeSuQCyW7qbXLRYe2k88YfrRNcDWDfWR8dsIQH222OOUidqLZdeC6Dd68aA7b
	lcVJYP/7SAWOvJQon1b7FydeHmTjgy7oeFg3evYE/+dQ9ub4OZC4JhJxpw5DHHX+yC++zoKnhPg
	jr28yhbWZsqi8D1V99NffTn1igxVpDBchE1d8JPdjAgfTDICCaBzuu7AEMEEmOVVABjFQ+Zo5hI
	alVsAwOZorJ2ksVZo9jFcOVO/7YEW4lxuUWtq0T2YDF3MwucEn3d0exMjFm4o1f5/GNCUFAE2gG
	y7ulZwqsONT9F4u1UowrOn7soEWPr5jtutg==
X-Google-Smtp-Source: AGHT+IFfRhww7baU6csHq4GdVkirSCrU/VY5yd0yzK5ef9Kv/UEII2ozzsptNvTG8NhJiOdRuVBr5g==
X-Received: by 2002:a17:907:2d1f:b0:b04:9460:c4fd with SMTP id a640c23a62f3a-b07c382915dmr12549466b.33.1757615927861;
        Thu, 11 Sep 2025 11:38:47 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:725:1e09:bed1:27ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31715fdsm183999166b.49.2025.09.11.11.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:38:47 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 11 Sep 2025 20:38:27 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 Enable IRIS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-x1e-iris-dt-v1-4-63caf0fd202c@linaro.org>
References: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
In-Reply-To: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

IRIS firmware for the Lenovo ThinkPad T14s is already upstream in
linux-firmware at qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn, so enable IRIS
for the T14s with the corresponding firmware-name property.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 23213b0d9582822e9503e4acf18c62d5c8c7867d..0a989e9d3d23146cb9689b68ba6c5779283b3c98 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -967,6 +967,11 @@ touchscreen@10 {
 	/* TODO: second-sourced touchscreen @ 0x41 */
 };
 
+&iris {
+	firmware-name = "qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn";
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";

-- 
2.50.1


