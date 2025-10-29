Return-Path: <linux-arm-msm+bounces-79472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81891C1AFAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16410580CE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAAF93559F7;
	Wed, 29 Oct 2025 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLt9FAw2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40453559DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744716; cv=none; b=bLCOZiR0dtDGEqh6chmxbp7MYfQ/Zu+NlXCpvG0+idB2vwi117fgTGypbgOCNBN0R8ATURXkJQfyPfEyh+Ffe7nSu0UU103FNGZT2jY1lpAVtQRNRCfuPxlTUCIkmTjfxkDF+SXQe68zmiTx66a+Pd42cM/vVGy+0Ndku9sVGIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744716; c=relaxed/simple;
	bh=KPHt1suJLdA9xJbwn2KTdFAVkwcQfxRACwyO17/eejI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIT83pP2By1ZEl2AbmH//x1e1hHg24Tfz1dBmdnQerlHlrCj052hwWHAvsCxMQjziY53Eo7h83nXZluiMqDsOlLHNytoGp8WgcvdUsDS8pKoh2Rg/U9kh6CHJ5+IOreOzSpectGjBeIo/xlVam0izHxDXADJhggTl0hQkJ+cyKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vLt9FAw2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47112a73785so46354545e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761744713; x=1762349513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxFx9AVopbicqvEHjs4lmh9jOTKVKMn3jkGcEi+fwfw=;
        b=vLt9FAw2eUHRYdCwsWxckB5hsRo2HYZuAQ7aEcIZHEeNpYVdcu3m/dbllSGKtM5ZuP
         qTSRfHatLR0ttH23LyL5x5U09j3gQ2hKl5bUiaCEZgR82xGMXQ02byZlTdpAToaoSNbL
         yYB6EyybRBDRWxqLtZMa3u4ExQ8HcYdvkUbSBmhVNKVbBBlq1QI5G30R6+rhsy2A9W8i
         OiYU/hWB3YBeHirrx1//NfBvQklD5pBlrw5jt7dBULy7gbWf8GjgFRoybysmxqBrLPcc
         5GsDElrXFbjwerpw0/rCm3/9zBY+syDCZAOCrkMMyI8jf9xMvqWFGcGH6Sty+JZw4QAp
         UYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761744713; x=1762349513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxFx9AVopbicqvEHjs4lmh9jOTKVKMn3jkGcEi+fwfw=;
        b=gjXPa1mF1AIvcWeuUnZQOkhTdMDWnrx2HEUubBBkX9SxCC1F8+dvo+m+UcNrwoqgsd
         z3sqCvvP+no+nkyNVg7Xzeng9DP8Qgiug0TdO8pSWe2hyypvrjkrmRZUtvAc1jm818US
         6oP2/xwpQSWaIWceRZ42fSt+fVyuY1+z7+hw4FT71WQx1iaY72wFUQEkdurs84n/Mp+L
         EWNE5SYdZuBlUc3wr8GE9eYPqoR4YjK3fbAzKU7IRWITGo53bvsYrLvaZgcggX9YnjyD
         xvMXTOtR5Im22wGtaT5xniuJhcZuqt828RQl8R56lgSWHyq0qY6+D1EaffBGk7bu0g6w
         OWvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFYzgRaMdpfzSBGZpK7sJ7oc1t+r7WtZSCRp3+uuMWTanNtSjxK2laerVc37ck81yCNeIOP412l7abEVri@vger.kernel.org
X-Gm-Message-State: AOJu0YzEtks8WjYZQBXsqMslogo60kuRJCQtuAsY7KIpSWFklmmSw/Iw
	Bxl3OFH7LeWb5gtGkGaebzlz9AXbkrjjXEkmckb2J1519UGNfDinyrlKPN5OdIMyhco=
X-Gm-Gg: ASbGncvuhhTeBuJjmiq1winxbIcCDDfxtS5xgr85HgZpSnFqVAQV9/MCTRf+SWj6KnO
	AV9QYbDwboTPxdX1Q3lduBgAKXVyR+WOIuv5fSFXKv0TRThugnlfpH/nhcVPBMlIX1wuA4VwrnC
	o3M1IG5D/hpY7c8sk5Ro8Q00uG71IRjcQzz/VEVz5CIsbuRT4xauT15lGjItFi/zOQsFjZUCBuB
	WAFifh+2lUrH2AMJNv/2Wuyg7c6V7xet2vo6Pzf2L30ECJve8dJrRo/rHppkT8rnuAekCp++gaW
	utV95pPMvmROhh9ta2bSE6rEnXKpH3BiajSXetcFbx6UccI19VQtQpoMoBvZOU5l0MLmympZg3t
	gdFUDwbxL5XNhns66P5AjER3ZeC77+zYlwTBhtVSVcadU34OLoqOhVn/MOiJqciWBG5BhRLYctw
	==
X-Google-Smtp-Source: AGHT+IH0r1cHcYhclN+lddpFSTpYRQm37SvwBdJsO9ETQMGuuRIVJvR1BxyxAyy4GGcFpYwjtQMFpQ==
X-Received: by 2002:a05:600c:3509:b0:477:da4:364c with SMTP id 5b1f17b1804b1-4771e316d15mr29213535e9.4.1761744712875;
        Wed, 29 Oct 2025 06:31:52 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b7cb9sm58273015e9.15.2025.10.29.06.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:31:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 29 Oct 2025 15:31:32 +0200
Subject: [PATCH v4 3/3] arm64: dts: qcom: x1e80100: Add missing TCSR ref
 clock to the DP PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-phy-qcom-edp-add-missing-refclk-v4-3-adb7f5c54fe4@linaro.org>
References: <20251029-phy-qcom-edp-add-missing-refclk-v4-0-adb7f5c54fe4@linaro.org>
In-Reply-To: <20251029-phy-qcom-edp-add-missing-refclk-v4-0-adb7f5c54fe4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=KPHt1suJLdA9xJbwn2KTdFAVkwcQfxRACwyO17/eejI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpAhc78Huk1DUxx69JKQSG5U4czu0+QGuk2fxft
 ec98SugJk2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQIXOwAKCRAbX0TJAJUV
 Vm/+D/9CM974LmK6eWlkBPTFJajwpYn6wuv7c739h4bugBgRVu0GzJ30jM6vHpkuKcg3VwGflxw
 qDNk31xmb15SwWqmZc+iFO5SRgKTbq25gECsaHWDJ8ErmxvR/NNKL5WkLE2XkgfLGqr2xsSijob
 NFsToK94sSWO+86qgY8VTmvOwV0R5Uxm29EZG/4cBOPKleO0jmIh9HAlXfoPKI0w5S4x2zSoStm
 OTTFCp+sMFVYoZwdYq35GCiVom/y14FwUregArwG+Sq63JRy7r8xiWTg8XiKi7JmAcKfERiIA0e
 P7jpf6jT3sOjVMjv2J7Z8/nYAMdqUg1zq9eJlTGGlKnE1pPvz3PDvVBwscjJh6OhY1umkI7nwaP
 xnTGCAJZ7V20qXf1kuccr/gNkRpJk/5xm5+ZywkYuMW3h/J1qlOUNx0bAZfa6AZfVI8AdyxOjlP
 kNzjhzlIvZFKSH26uKHmoTcwYp2MKqkpHHq3/eQIrqpjb2tpgKU2slJJFfdu4FYNarVrVRXq/ad
 7xTkEJfPUt5NGMAZmX2dqg1lm8tDg3KxRuYipdxii7RfY+OKcjYAcPpxYIrf/MmsDZ9vusThXJH
 oo/0C+OQ65NUi38EqEnlPl1IXa9FSZ5GLSrilhN+83R5Zm/GPN75Xn7lPsiDUaU22mOmwhJ2oga
 0k7P0GxytieUtEg==
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


