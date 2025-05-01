Return-Path: <linux-arm-msm+bounces-56357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA57AA5B40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 08:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6991E1BC5AE6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 06:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C3627A921;
	Thu,  1 May 2025 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fpGSdLwZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D037270EAC
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 May 2025 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082162; cv=none; b=iU19nlIAY74O8C3O5ekaDBr6Ix9D8hlyPauYxspqNcC6LhfuBVLxhQgBom8XDcn9UqMDMJg50vJsfvKoQsufrsxT3mmRGnFq1MSVpW7zsuCtrkDDgwX1kCoxLl4MKeGPVruHU2QlJBdKWB7jJpJhsXxs5MJr3xvRqI3b6ZPJ5QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082162; c=relaxed/simple;
	bh=rghWQigvYLWUQfqr8hQdbcQRA6mRxhVWRwE411z1tHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QTh/PdnjYYBfyeoz2/vwG1TX+6aJG4xGt5tw3FIsnvE85MBAKbNfSiJ8IarbKkr5cUc0okCvMQ5ouoIv6Fc6y0BFAsL+CBmHoKFm03MSzft6b3FbKhk1vy6aw2TUr8AAGDmm1Ve6+UTxAmYQxNcaWr8rYEGHZTHpMr8T1PKw6Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fpGSdLwZ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so1014561a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 23:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082158; x=1746686958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ScVhK4vOzBQ1CIEZ9VnoX8+SHxPZ1LsT0jvcBBvwnE=;
        b=fpGSdLwZ4lrRqTqsAJHu3Wb3SuyI5lqecGOkBqPl08SH2DIz6212b5D94gXI4egY6F
         aXxDGHshpW/ZiyDylxgsCAmv9BhPiG/6V2KV6R8CvDwnnNcj7HbcDhTmPei6W8fEE07Y
         mlaH/Q9smxXLPq8Zb/I+JoeLgdNGW04hMmlI5Aeyx4UbZpEA/XwbTdcmPQJWLqNEboSt
         vTf774hWuJzVlU5w6D2clUEFvg/fPX6QBlMSqaMm6LabCuWk/qZgjBP8pH8Gd+qFwZJu
         LCtalUbu7QdiehoUtAn7alfe1MfhQ4iJNHUMtaS9fr33A4K9uxWmCPAyftm233JrXy+A
         ir/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082158; x=1746686958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ScVhK4vOzBQ1CIEZ9VnoX8+SHxPZ1LsT0jvcBBvwnE=;
        b=uD2lrD7OaU0L1Sq071kJPnOCYjuD3lfptfbwYoNX2NP6a14EOT2VFCnGipPevGNEz3
         BldJiM8cyHQF0AdH0uKC4jPSC3vkAiLS8vMIhmAR2m9g6vatwGE6NA7WBEjIchpTK+Mg
         qF6BXGLXUEFUcu0v4lWUwyNAFtg9crYvO1IiR4L8mMrTTcWnVQl9cU0nl1fnek1b8m45
         hYNHWSs9VSmTeF1fXQ0HxcyLBkeLcFWHKZ7Vm2+0yb/q5PWtHZiwgadZT5dQ8Nw+zElO
         y7vwgNn5MsoQTYGEmOA051NH+rp78QYAzBH3j+TD0DciJA4X5ThRgKXAN3LhONkP7CsA
         Dyng==
X-Forwarded-Encrypted: i=1; AJvYcCXcrCD61Nmh1Ue9sWFXON1IjOM2FWJd1MFXhT0PEAdl+e+B+rpZ0PP4S5duLE17QT20+jOlA7+v+VntW1iY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8/QsU1crXwMW2EFd1gJUP4mk5FTmUuDs3lpFqK31/ZS0i6ZjK
	aMb65PzqJdPgPl0W7MPlBMSIexy+PPC+ZgyzqmNUATYHGq68q5tdJREcbwlNF+ovTdTi45lcgQq
	2
X-Gm-Gg: ASbGnctcuzPrd9xwl64d8YGw/UhO4ZJnmISFbXzyU8EkHmoCe7Jps1gqIZZlBt6SxXJ
	QDYvgRZGsCa8IWFfaS0wdrmamv6w5wEn9UWofGuHCTWtQTuICgvm3WqiZ3/Os05Gsw3WAwdoh2B
	lLTBijtFJlpr1HWT1CcMa1O2NhcKSwEOaoNYSb+/EVUgqXjwYwtlT03T8VJui8C1XKpUARPBAvT
	LFtZvR3mJylh7WhWTc2xXxd73W6+E0N3XHSI8AbPWv2A6reStrOsTIBoH2RL2MPVLRqaxeKyBhg
	jZE+NLZ3OOB1F3edbCxJLvaqkiuk4NIqJvFcfSBUH2IFFSyFNt8QJ9Sbuh1ydvc5OxpSv/bIUu2
	jXDN8YhvCImYx6w==
X-Google-Smtp-Source: AGHT+IGn1DKosW3qZ5ZG71pQb8j7xjgzFnvZgJA1ZxIYOO/C/7lE7rQ8jXX4h2CCFnk06YrC1/1f5A==
X-Received: by 2002:a17:907:72cc:b0:acb:5ae1:f6b8 with SMTP id a640c23a62f3a-acee215b8c9mr562485066b.7.1746082157735;
        Wed, 30 Apr 2025 23:49:17 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 01 May 2025 08:48:50 +0200
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm6350: Add q6usbdai node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-fp4-usb-audio-offload-v2-4-30f4596281cd@fairphone.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add a node for q6usb which handles USB audio offloading, allowing to
play audio via a USB-C headset with lower power consumption and enabling
some other features.

We also need to set num-hc-interrupters for the dwc3 for the q6usb to be
able to use its sideband interrupter.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 375f964e793626115609996aa25ea4e0fefe6c5e..92a2f6e0c3d856eb2549a89509486979a7439cd8 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1351,6 +1351,13 @@ q6afecc: clock-controller {
 							compatible = "qcom,q6afe-clocks";
 							#clock-cells = <2>;
 						};
+
+						q6usbdai: usbd {
+							compatible = "qcom,q6usb";
+							iommus = <&apps_smmu 0x100f 0x0>;
+							#sound-dai-cells = <1>;
+							qcom,usb-audio-intr-idx = /bits/ 16 <2>;
+						};
 					};
 
 					q6asm: service@7 {
@@ -1979,6 +1986,7 @@ usb_1_dwc3: usb@a600000 {
 				reg = <0 0x0a600000 0 0xcd00>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0x540 0x0>;
+				num-hc-interrupters = /bits/ 16 <3>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,has-lpm-erratum;

-- 
2.49.0


