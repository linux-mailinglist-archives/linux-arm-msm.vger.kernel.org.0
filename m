Return-Path: <linux-arm-msm+bounces-16917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6202B89DC3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 16:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CAC82843A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 14:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888F0130AD0;
	Tue,  9 Apr 2024 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RCRMKCBL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A342C130493
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712672899; cv=none; b=JnAfsLgKB4nYI/H1y8czLrZZ0aaTFqrXdTNrJwBIdzV+lforVz+e1YWgQIwzzXkiKD6X7ZmMxnDGHPCepIkjXl4ovnarK/fBYpR66j9WRw4+Es9jwNa7j5AoMz+cCCHOnoV6maiR9xWxivaH5mxQ4BR5xGFXX+WHTSw/QEl3pvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712672899; c=relaxed/simple;
	bh=MrRma8bXJiIflCVU3n2w+pWL093vD3VGBihielJk17A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2aK/LFHDvKHjcX9hFcZANMU3WZM6jFILAFRbxb+x5X9w0iIuBRHE842EMzV+hTWw7zAJi7ZfhGz6FnaqE+6J+7rXKMyZMFm1okA5JlQ67ZQJkkPyG/8N6mou3L9CZLfVrm7+XhEP+M3M9zXHc6/fCAiuo+k44CK+q4wSGxfXLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RCRMKCBL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-516a01c8490so5574597e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712672896; x=1713277696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOQRjwUPOwicZ0FyUJunEbCwB+UEOoMXhllX9eZKJIk=;
        b=RCRMKCBLctou5jiR8ckn6ANJcOlqfuDitADd++zgGfU5bClUA6sHX8OMooygayYH7H
         wJq3Lmzc/YyQ8NjnSBhQwHRhi2HOnZANNWN583KEd4P1H0LZQKSpP1KNYl8urFq5aLJP
         1y7wIzU2nG5GZSMQIKmq8SUwpZnqV3wf7QLDDg95d3dk0qoUAD20kPil2eezptRccO4n
         3YZLKfxnyo/sR0GgoNkEDbKChuyjuyZTqStHQbElAETnv5iBuJy3CwAaX3rzd0q1jtGk
         6cyF7RtMvS05WB3ScFcGEBAdVWf016lIvmLX4vi6DhA1djiZAGFOP8V/umn3OGSOApuS
         rgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712672896; x=1713277696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOQRjwUPOwicZ0FyUJunEbCwB+UEOoMXhllX9eZKJIk=;
        b=LKnWbdIIy9ZHA+ukYBTavAGH1P1TXFBv1Yo2jVGy92dOBMXxNpKamacWI+w51M/Yo/
         DnhMWqGXnP6PVaFFjU0bIrZbPS1rFDYBte1tg/YgrM9gjx9IHv35actkYFyA5/KANjA0
         Pjm+EJgiIgWXWGkfXLIegcCTQgYllCJ23TvE99xdlV5TYnzhXF8gComwMeNLnVS4kGkV
         j7zygKq8i+HkPjmeuLlJXicmfD14/d6ZtuqcqdNdb0dBu4tEfkBT5RJLlOLkiO4rDEXS
         XhkFI/O6iLY6zk4TDAz9eekprsAhya+Kk7apO88R187TMc7yfwvRsF4SYf74ACZMSt6p
         TIaw==
X-Gm-Message-State: AOJu0YwXVrRhlZBW5mBYLT0AjZJlH8i37kT2E33BvWpIiALDjloi5Du7
	21/7ncWQ56PuMqqLgF2OSUWT7L8i7CxKdqKXu657yFhD70AJ8uSFRe9ImHbUn9v5xDHbafg/Mbt
	k
X-Google-Smtp-Source: AGHT+IGHaL5kYaO//u9Awm3ADtqNVLe45FOtlM6gvqMFdUFxfnQ363lw5i4O+iuxEmY+3t1+JGdTRw==
X-Received: by 2002:ac2:5a03:0:b0:517:d14:c0aa with SMTP id q3-20020ac25a03000000b005170d14c0aamr861908lfn.9.1712672895794;
        Tue, 09 Apr 2024 07:28:15 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020ac25ec9000000b00515d2ee5b38sm1556445lfq.48.2024.04.09.07.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:28:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 09 Apr 2024 17:28:13 +0300
Subject: [PATCH v2 3/5] arm64: dts: qcom: sm8450-hdk: add USB-C orientation
 GPIO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-hdk-orientation-gpios-v2-3-658efd993987@linaro.org>
References: <20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org>
In-Reply-To: <20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=788;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MrRma8bXJiIflCVU3n2w+pWL093vD3VGBihielJk17A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmFVB8pVPxpZGcE1AEoOTiZQ0kneKvWySLSZ0VK
 Mat1S7z5kmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhVQfAAKCRCLPIo+Aiko
 1UgYB/0d1RziNRXYshX25Q6Q1iomfG3rDVcqj9xrym5DAaGd22ORidf+mw5gzHQ06/vuYX5p4Fl
 5GjFv40r/UlAz/wbQjNHXmr4EM3otKZ9v+wjWbZt9JRZo1KrGkFa8de/kplHwMENcaoAcF9BZmz
 peISB7mGOFpnI1hZcCGjyzB5RGr/ASs03uF0oPsclAqo7apbECPwMipZCv6MXtrHh12cZ2l3Vv5
 01PKDP2kpGfhi5HIRjSIFxbEiLQXvOufKkNAiTSoqZ+veH/DN2T4IRbbQK++wRR67y7xuoncWxS
 jxSMNIBrOBRhtmjsVi2ECVZetR5mBno5TPVXfnVR0nSwlLoz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define the USB-C orientation GPIO so that the USB-C port orientation is
known without having to resort to the altmode notifications.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 0786cff07b89..3be46b56c723 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -95,6 +95,7 @@ pmic-glink {
 		compatible = "qcom,sm8450-pmic-glink", "qcom,pmic-glink";
 		#address-cells = <1>;
 		#size-cells = <0>;
+		orientation-gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
 
 		connector@0 {
 			compatible = "usb-c-connector";

-- 
2.39.2


