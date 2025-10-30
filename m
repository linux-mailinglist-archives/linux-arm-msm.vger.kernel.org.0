Return-Path: <linux-arm-msm+bounces-79699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20527C20983
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 15:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 208551A20FB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 14:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5E0275AFF;
	Thu, 30 Oct 2025 14:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VXGqRoTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8156B26B2DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761834534; cv=none; b=W1h7bFMgMJGgV8EjGu3qjfKyoxyR4Cvz5227M7rfNleMan8pzkj+g6MzbBHwjK1MVmw5NcAXnUbHtc6ut6jHdpk+m5FE12gt80tVyHsC35Nlpxwk61DjpttUkSvLLgdgXXlv8mXTM/oBlRG/1fA4YiLgLz/S9CR/bZmGhu3JGW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761834534; c=relaxed/simple;
	bh=LwKDeDbaB/qNO5GHXE665iLTfSrN9deeeAEkKC4gPHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AFnBWXQZSspUvc4uNELFuX/zjQoGBderoJmgV6iekQPrLX8UFef8c7o/yCsitr6rGUNXZLDo0s5dzN3WfZixwD6SxKtVtACpCpt5hCbhI2fHwTvmuzmCp7I+mNBl6soJsRU3ZeJ02PJIfA3K14M0nAHwErEyk1C90I9cSblMxSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VXGqRoTa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-474975af41dso8394925e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761834531; x=1762439331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hky9aZYZhqPebPVWCtl7ijJ819/bzTMDH0Hz4vsdJA=;
        b=VXGqRoTatioBvfiSylTZoqpcCh0xpgKQZ05X0Dj2CiTKifrQCs/LwOv6Hwjghebcaq
         G4VGEYfhXU2SqV1MdVrSZUEs6edtyFytCVYJc6c7eUHXGbMBzf0GHykHw235azN8O5AG
         /czhuEaLcXC/kfSkNVPGQylXqee1gB2GD8YCR5FMw7D563xhBk/NnfRTbWdL3JPZvgcv
         tyMUr6nxBgLgTWNq7zYEY2K35w5dUWGVOJa5+6XMWEqrEcWjjhzyo9g7z1E0nyJIb472
         1gTUxZJr1z4+6wu9N36va42UFCixxzlV0ma9/ie48bu5ezsHaZ06fp5iw42nuwO8bFsy
         CIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761834531; x=1762439331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hky9aZYZhqPebPVWCtl7ijJ819/bzTMDH0Hz4vsdJA=;
        b=Y0t+3pPDq6a8J+eVKan0RXrdAMIQCFwr1Jv1Eucdv2reYiYrdKM+fXG4O33CLEMxlM
         JFqPL0tuyKf3zfGa27SJlCVidia+jb5iEdR0cpDWoUG/M1Tfsp3gRqLKYNEBqWZKEMFk
         YsFkHBNtZnZXnma/wo5NpKv4EYry3RudQz7FPu80mZZCkdZ3kJUK9mDvjCBhz48QnIVv
         qoc/P5KZEEFMQ3WvWGJUGwMDAwYNAELCCT/f0zwfnVRiYuDStqElpImJ6BdnbVRp3X5V
         EHVlitOZHevtk1ncntWWjuJvySykKiScvwyuOzsd2p1jsvRU1x2roKQSSFWCtS95IN4M
         p+fw==
X-Forwarded-Encrypted: i=1; AJvYcCWMp7/m3a704Q6hZU5Vj8QPhXCPfc0ujcLdyuvFoREO1zsj9+RM2m6XL3+jkuqGygKaBageWKNlj4IenUKo@vger.kernel.org
X-Gm-Message-State: AOJu0YztB39P2xniKwYSwLjwtqbWWQn3i8o3mGGrlWIdNnIj8nWmMVXk
	oDvhAPuvW5FdtUPB1+gB+rHeeW5vaGf+vmZM43jlMwDdeN4H67qNu83JzoDLFf3Vofs=
X-Gm-Gg: ASbGncsOQJ6iB9NniCqle0BSigPpivxuz2L/H7gqSqqJjUF9jzCab3C4o86NevxqonO
	IXjG3DdziNukFGbhBz74LllB1Q54t10oi3FJfFfvUUjMfCi6e1Z7/MwUu8KG8FJxZnDLObRH4io
	7QrhOovL2w3WuemoXJb+I46mJm9nSFYigkJdcuWncJJPjmbbrG2LFlZ3d2kcw0iOLGarePUQYsw
	V9OR31sqBrrWxhLRbUWmcO0W2TffK8JOjyNl3jLmOzrmooxij6m28Pu0o3fA+X9kj34tCWfrRYO
	ZBArdI2XZmFVODcAl8KB1O7lfzzIXQRSyYjGayb/w7fQIK4yIqEs8N7fEtuEy9rPxWa8J+i7hJc
	YEuFn0bEgmNcgijUPgNP7MZ9mVnPKC7CVXlTQQQEoKJXXr25KySDaFcudkSztVVfpB/5RDyChoJ
	FFiNb7DLVd
X-Google-Smtp-Source: AGHT+IEQ2IyXRDcnIR3RPu3dYi/RV8FM42o3crX9ZDsG/wo/02yDOOqeF7iZ59gxjUjBQUJ3Gx2uBA==
X-Received: by 2002:a05:600c:1c1a:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-4772673665cmr31213715e9.17.1761834530750;
        Thu, 30 Oct 2025 07:28:50 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772899fdfbsm42230475e9.4.2025.10.30.07.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 07:28:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 30 Oct 2025 16:28:31 +0200
Subject: [PATCH v5 3/3] arm64: dts: qcom: x1e80100: Add missing TCSR ref
 clock to the DP PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-phy-qcom-edp-add-missing-refclk-v5-3-fce8c76f855a@linaro.org>
References: <20251030-phy-qcom-edp-add-missing-refclk-v5-0-fce8c76f855a@linaro.org>
In-Reply-To: <20251030-phy-qcom-edp-add-missing-refclk-v5-0-fce8c76f855a@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1887; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=LwKDeDbaB/qNO5GHXE665iLTfSrN9deeeAEkKC4gPHM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpA3YYkG+n2s2QP25YZJkhRj+64fBjigIHVQhOr
 ljmQoEGuImJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQN2GAAKCRAbX0TJAJUV
 Vn/4EACEkEbtxyf3mOVY1BDh7gwSldWCpPcz5fLbcP4lZ0hYKcvvQv7C0o1MXscxfkbbye6riSx
 WMvFfaAbGEdlLocol1aGWy28k6ce81iMXlqhQBJZX1YnpC22dBvElFdFk6KHpM9Y+KY3m5GEkv7
 n9vC6MGwZTXoZDtd6ArJxHl0PY2+YT1+qXnypTvy8DMdqrQmDykkCN5SJQA5gmVqn3VgS6VEWCM
 fum4bTQOeRJ5ZO9/AP11QROQ+MzQeUJ0hTR7S/wphKlfG/85M3eWjvhFfNOi7ZncmLUJ50j5cKj
 UGk4Cc5Q9neWb/YxmvCCZSzgKDAK17HKw4TOmdwGV0iyaRQiHjeP1JAr1/APS/ppprI6GbkDQdr
 KsJcvWMH1C/Sl7uzRoWL2Eb1Q70Hs5c9rUWxvjEBwQUjFglk1gQNeK3AaV1/Hv6s/D0Za6aqGP4
 FKC2yza37pZT2NL1sZKqF3GHIPuCDztT0q8byzy+ntPrZbntWPuYhtkc7EfubOTBYA+2uI89CGP
 ffx9zHhp/cChkCDL+nYjDRtJ7Wq5LfvCPaXxoX86n4g+kd0/P27xmQsPDNCWypCQXTA4xSYenT2
 +wGylqHHFIenX9+uhCB8EmJ+AXPjFAd2lZVFq3HzSN5cU5AUUe50q6XjgIRtNWK3OGhJh8PSkv/
 /PnBWeCfujozQzg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The DP PHYs on X1E80100 need the ref clock which is provided by the
TCSR CC.

The current X Elite devices supported upstream work fine without this
clock, because the boot firmware leaves this clock enabled. But we should
not rely on that. Also, even though this change breaks the ABI, it is
needed in order to make the driver disables this clock along with the
other ones, for a proper bring-down of the entire PHY.

So lets attach it to each of the DP PHYs in order to do that.

Cc: stable@vger.kernel.org # v6.9
Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index a17900eacb20396a9792efcfcd6ce6dd877435d1..59603616a3c229c69467c41e6043c63daa62b46b 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5896,9 +5896,11 @@ mdss_dp2_phy: phy@aec2a00 {
 			      <0 0x0aec2000 0 0x1c8>;
 
 			clocks = <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
-				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&tcsr TCSR_EDP_CLKREF_EN>;
 			clock-names = "aux",
-				      "cfg_ahb";
+				      "cfg_ahb",
+				      "ref";
 
 			power-domains = <&rpmhpd RPMHPD_MX>;
 
@@ -5916,9 +5918,11 @@ mdss_dp3_phy: phy@aec5a00 {
 			      <0 0x0aec5000 0 0x1c8>;
 
 			clocks = <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
-				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&tcsr TCSR_EDP_CLKREF_EN>;
 			clock-names = "aux",
-				      "cfg_ahb";
+				      "cfg_ahb",
+				      "ref";
 
 			power-domains = <&rpmhpd RPMHPD_MX>;
 

-- 
2.48.1


