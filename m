Return-Path: <linux-arm-msm+bounces-69730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FAAB2BF41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67780521A98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B2F326D4F;
	Tue, 19 Aug 2025 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zO5b/FNT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBA1322C8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755600339; cv=none; b=oE/hLFe3Uw8jZpW7VTWX55/8YXUWuo8Ye85c5f1WkM1O9M9WRD9PRk1O4jrljxSGcMnJzy6U+jo+qdvgD6HsYK0TEU0A2eyrSQj3dCKB20wrO3puL5jJbebk+WrnQKBNghIQjPL8tbpK6l8mUKLVBzX+pYO/rLRmqP9v5punLLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755600339; c=relaxed/simple;
	bh=x7zE6RyMG5SmYkscjJboHkA/xd9epaIl07B119p3nJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZkhZ1kUW6smtovkJCgGjdLAmhwiRdNcAEyK1tABAlWNIzIfBlW6qx75Q1Zewyegm1R+Z0tmwt/oj6pZdej8pvNBiIoF7fVUiS78N0RuGRVCy1lAwRhhQObhudccnjlChed2AbpeAVJ+uLq1SctwoBXEmI/gAIA6QP2HY2E7EU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zO5b/FNT; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6188b5f620dso5699053a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755600336; x=1756205136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlgDGE85YBp2j9bhgXZJumZoSN1cJSrjsFNnN/m97uw=;
        b=zO5b/FNTC7xce1tyD8qDp5D4oDIAErJZzk3WWxzQgXMIoCcrh9TDzwN2pyawSNOdDg
         RaQOuakjLT9tKMVG5H9+SW8yeD1/WEki7+ocuoQPmf5LFpkB+mDR8Z+o/n6dvvl5XGAC
         c8bI1vmku5VKL5kI/v1sBQWN1tT9ZqpI+zwPrwKFrC1tj03z1Cz2qN2srmMLVK/pk876
         WRwSzQUT/14fwIE6vI1jY1RkA+LN6iMS+/e4DolzdUdhjtgevR3FoZrvaSHEs08F2ZqL
         fFX6nMlGc+6x0QPXtWsEQgScIUY3q9yZ1nYnZFNau0kyyPnVm1sci1BKsqN4JXwN9tsb
         utMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755600336; x=1756205136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlgDGE85YBp2j9bhgXZJumZoSN1cJSrjsFNnN/m97uw=;
        b=I90bCoddPX02aNHqaT1kCSHqC3FQn1FDlIFV7o6GZfL3cS6jNzfFLo9kLAbrKmom/b
         cDODmUyb9hOYkwmsrKmRBOKRVeie/8G+0B+rRGDt9eUQ3vWzCaID0YmddMWUPM7HOM4Q
         2WQj4WqSJNzhrpzR/ZnUquRYD3qDDwBHCjwFdgV0NpNoFkK4twcavelu0rEz+Vq9Jg7v
         6aP542FSCCPQdNOqCyB8ZhYjr1ORu+XV2UUjilK0e5uhcwlOef0NPCKgRcsqAqAMIIZg
         jMfqF4y6mmvIgP/NMgNsuSBRlwAG96xHTbKdcVBGKAO0l+9Syz3mi0RjF3/aPXcce0fS
         Ud7A==
X-Forwarded-Encrypted: i=1; AJvYcCUpQsmy31+qlfCLnLYU9sHKZsbIAjtyaHbcD+lcqS7iB9Eey6wARD+s1XtcwitUqINnp1k1GPBss0lt4w95@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiwlqfmh8fu4wY8zXvi9iRmnLmhPpYLrMwclwBHzSsDW+sD2BE
	05rswTzUWag6vYNPFwjfBG9HaS7akRspTKudhfIDpLfOBFqWLEadaUWVQ2oL00AbhvI=
X-Gm-Gg: ASbGncsxJcQTLaAjqa9TLDH9ABHhwqpbu1TfaUZqyzHToK2rGZP2p/M0uV3NDWOUkZ8
	fDmlLWtMmvjyJJ/6Q5R7H0ylXPpbJAGmULOfRHAocMSP5jO2u6PFU+qg/pyizZj9JdPqrDKZuUS
	ZfqyODXwOPIpk/OwOWgyEEwpKSJZ+ZPtj3tFXINKEILYopTd21GCBpy7QrkGPXvp4zwF2Ioa/4L
	2vw0yhQDsqk/7D8DP3nAqnPkDRWZG6xbyR+K4TqDohCP2+sCLf+6X9v+DHcMq9NsGW2/uMdpAZ6
	glid5Tdc1yPZqKZc07cqjxY5qzWhg4BEgd0SzlSn7gNyXfmbAJoH9atxhval5vofTl8GcSlkp4i
	zHlEBtTZSk7ABChohp1WntKp0+nvndD4q2/Hg5PDMy5V6NXxM
X-Google-Smtp-Source: AGHT+IEJTLHyh0N/3ZjA8OKmxUPpDwP3GB0LJkHFUpf5OZrWH5pLrgfrVM4pyeZ8cSQdbw2CHOt10w==
X-Received: by 2002:a05:6402:524d:b0:617:dc54:d808 with SMTP id 4fb4d7f45d1cf-61a7e6d99b2mr1532953a12.3.1755600336112;
        Tue, 19 Aug 2025 03:45:36 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:db5f:8096:4609:9b24])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757a48e2sm1469787a12.40.2025.08.19.03.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:45:35 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 19 Aug 2025 12:45:23 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: x1e80100-qcp: Fix swapped USB MP
 repeaters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-x1e80100-fix-usb-mp-repeaters-v1-4-0f8c186458d3@linaro.org>
References: <20250819-x1e80100-fix-usb-mp-repeaters-v1-0-0f8c186458d3@linaro.org>
In-Reply-To: <20250819-x1e80100-fix-usb-mp-repeaters-v1-0-0f8c186458d3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

The &eusb3_repeater belongs to the first port of the USB MP controller and
the &eusb6_repeater belongs to the second. This is obvious if one looks at
e.g. the CRD or the Dell XPS where only the second port of the USB MP is
used: They only have the &eusb6_repeater and already specify it for the
&usb_mp_hsphy1.

Swap them to set the correct repeater for each of the USB ports.

Fixes: 9f53c3611960 ("arm64: dts: qcom: x1e78100-qcp: Enable Type-A USB ports labeled 3 and 4/6")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 9369b76c668b5c008fefd85d5ca18e87ab9ce93f..b02a66f0895e9c91e5403553620615e0a3bfd7a9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1507,7 +1507,7 @@ &usb_mp_hsphy0 {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
-	phys = <&eusb6_repeater>;
+	phys = <&eusb3_repeater>;
 
 	status = "okay";
 };
@@ -1516,7 +1516,7 @@ &usb_mp_hsphy1 {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
-	phys = <&eusb3_repeater>;
+	phys = <&eusb6_repeater>;
 
 	status = "okay";
 };

-- 
2.50.1


