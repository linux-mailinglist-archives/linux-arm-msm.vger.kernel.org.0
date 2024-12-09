Return-Path: <linux-arm-msm+bounces-41015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A08B99E917E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C06118867C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516BF21E0A1;
	Mon,  9 Dec 2024 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rgnOiYsA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C4821E0A9
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 11:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742174; cv=none; b=sS1P4HSuJ/R5jklmfGP2QrIzsP3OJLMC9uuG7ywhhCL/DaAUa6NjVfaO8JQjrVmNTDfCDLj8e5zD10XOwvQ/7ZSrNSZuRRrnSWZubMVEiONXXQomtMI+YkSprJg7m+ytOObmxSNzWvEBtQ8h8kzw4hga3N7SX3WzDXmnMDCEFQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742174; c=relaxed/simple;
	bh=6XZxsV9HGdMYh6b6lt6opUPGyGrjrZgJYmdsfiTOo0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oDdWDatGtNKZs+zKNaTVDqTmgcxlCsSpb2Qxq6vNkrFzKbU5zhwW5KgRn12nI+IJZ2ZNu9bORuwXdiAmpbLl5RXSEWsKlj+rHQ9ilp89wv9aVoL5x3wV1/ugy2G7DjykgXTdQ2TNEV6glTfa03hFKoA8CRdEJc44poZni0QzaN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rgnOiYsA; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3ce64e7e5so296017a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 03:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733742170; x=1734346970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1SW9jNbrG++U9HvTjA6UTT+HPesZkjoe3s35+KnesYA=;
        b=rgnOiYsAHp6EUaqY409danvhzphglM3DgCXKnznggztiwP7/iQ0TMLRjs+NZibQit4
         ae3DvfMm/3179ODh0m+niGIECAFi65niLht43SDWe8gwOIZhV+XRXiOKGjpOXynPzepP
         P44F/zjXVeeUeGluFeCN31RGfo5Twp993DDdHSFpPI/qWOgEHt6PQ/JC1mVv5pJRJl4U
         UF4KSvlIom8HhgcCTp1pDmYYp7zHbQ4e7RokYlS/z5A3kSfS+Uoz1MMx5+BaDuCl1EHS
         KVkMZ7kKxbLvDwKfMGWyMeCo1pscqFb9YlZ2q3CIaGmA06AE2UGedB3zk6UeCdXuctMy
         30HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742170; x=1734346970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SW9jNbrG++U9HvTjA6UTT+HPesZkjoe3s35+KnesYA=;
        b=KsrmHOgpW9e50JVt7hkh6wggF6qJa461vPSGqeXa39ndGut4dU4M4CKlOA5n4QAx3Z
         LXs1Fjzy/iNKZY//2o3p/TPEp/QgKQ0XQL0055ee1MpdrV3wZBUZ5WN0+5CLRT3OHPR6
         kXfYs6rsh6vhKQZZJJovcdjDUHwi0xaDVetbBqHvBsDmjIta5D9z7ZnH9qoq1FftKBn9
         dRi+cnc5KvSxc7gAVB01vjY3P6tHPExiBZMsZYc0y1k+NlmB1eazhqhWNz8sjioVr1dp
         4TGm1jhYuzB/R0I7qqhb7gtX26MExTjeKY4hzvuduTE/5NSYjL2JOPMrLlqqzqqlIwRP
         fTQA==
X-Gm-Message-State: AOJu0Yw3ycfg+Az5OjV7Xkt+DvUjusr88yR3gVUV8DJKHcRnstWQKxO2
	eVhwvbZw0JmLVcHeu7VAc7FhoDhRXJVsfYn2cfWm1jw/fEMwLS9tVSnZz8UBs4g=
X-Gm-Gg: ASbGncuvWkHnDTjqmI2+VgB7QUczhnCWn99IIZ9EkBlETFVeurElEsqrefAx79sYzI8
	kEsOQ4zfz2ph36lswmAD8IkiH8UVQRngwO9YdpLrIGWun6f79CIvxXvHNgRqgKmUFLiNhXiIKBH
	SlvvfGyygL5B8PuOJO8MPSlZI4SPlArKDDFi3gQiH+MqxKtfQyM6uDOzxG5cw6L7+z0gHIiGAC6
	1KNa14ooZeH0XVxyofz4IlukoLm1mkOrNS1aHuaTeOop7+7lhZD7wn26qu0EpaeeQ==
X-Google-Smtp-Source: AGHT+IEM9iOWFs7aVrRxAZOGJxHSeU+PPDL4E966vTV6eI0BLw1hRNuM/zt+Np7Pt0YGnu2rup92kw==
X-Received: by 2002:a05:6402:2681:b0:5d0:8111:e946 with SMTP id 4fb4d7f45d1cf-5d3be6fc185mr4231557a12.5.1733742170001;
        Mon, 09 Dec 2024 03:02:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3dd4f641bsm3348818a12.51.2024.12.09.03.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:02:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 12:02:17 +0100
Subject: [PATCH RFT v2 12/19] arm64: dts: qcom: sm8650: Fix MPSS memory
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-dts-qcom-cdsp-mpss-base-address-v2-12-d85a3bd5cced@linaro.org>
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1339;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6XZxsV9HGdMYh6b6lt6opUPGyGrjrZgJYmdsfiTOo0k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVs472ahONzx6hR1aFG7ldca7/lNclULH42iOU
 2VmQD8c1cuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1bOOwAKCRDBN2bmhouD
 16AmD/9D5iStZffp5knlrji4lqqNnNsO08yoA+5W7Xij8mFKkqpxSkl/5qSmk6RkhLl/acBoiCQ
 8VXrelRW0VMCk0i0CA4NQNbK0v5LhH6mWcVztvjOF/ucCV0lvm1XJg5Buvz9oFwwy8LNCv+SIa9
 SlwxTs/FjABILLffD+4lofBhmdYZ7W7mlWKVfKw9kfYphRtVAZK6NM4sQrUE6PXg9+CN3UoMJJl
 HcS2v71gxiAw8Hz5Cf9wnsLO1i+YMfQ2gpCbRll7xWzY7g4UKiNYHfASBUV2GvXpAbd/Drtq+Bt
 8MA8y6nwAhXG/ca0SwqrFppdI9w35Hm/tKz6g9Q3nvNnKy+ZDBZY68YQNfUGpY2ncPnh5xLHQB3
 6WJ9TadNfpvPNhfKqdViFdpuPWpG8Y0N0dIo+MKcv6nGhTNa9lHq8hO/xVGI70JkH87OtK4mdAI
 nKarpwJmcMtPNbnHvi4muQCcwwpXohC0dw3WJfXvB1GLkbx/l/RmF6MU8eDlEFI3fpaIo0GXR+a
 YWjF0bxhm4NsFQhERdqm+x3h0nRLualwQzSND8T2pV4v2I5GCBioGW1gqRaf+6xsMdfYgoiTVKv
 DDlszPwCZqXVJPJEWdmuA+RLxpmr0tyWOPYtuMU9NzS5gGVrKlc6CsbkTKSjjOrb0LBun7GacmL
 NygHJeSCqjKo7AA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in MPSS/Modem PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x4040 was
copied from older DTS, but it grew since then.

This should have no functional impact on Linux users, because PAS loader
does not use this address space at all.

Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Cc: stable@vger.kernel.org
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1d935bcdcb2eee7b56e0a1f71c303a54d870e672..6ae81c191fae8f1788adb399a364886d3fc2dfdb 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2853,7 +2853,7 @@ ipa: ipa@3f40000 {
 
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,sm8650-mpss-pas";
-			reg = <0 0x04080000 0 0x4040>;
+			reg = <0x0 0x04080000 0x0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


