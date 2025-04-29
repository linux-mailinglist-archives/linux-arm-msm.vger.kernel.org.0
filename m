Return-Path: <linux-arm-msm+bounces-56041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D682AA04C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55CF37AF689
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4874D279327;
	Tue, 29 Apr 2025 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BvADS5XI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AA015B135
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912586; cv=none; b=JNdVKoLNtyqxiZl5ke+Y/gmnMGp9qxoFzDY2n6F1ujRo2QVUYcfhdfLoDPh/hpvNiQkeGK9B4QFcq4PP9d8KzoGAHAqhBnOPkZNtiryJLRziLaLq0kf6n5HQ5x9gkrY1/f/I8cgnHt8y5MVtdbwa//PNncbYNwE+twEzdL8knpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912586; c=relaxed/simple;
	bh=TQSKcrZq8FZHQUtBFJcAEZX0g0mzLQVbvusMXK73yFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ar1+23jZ6kHjnS4aefi5UXmGt5zpWi+M01LyQUzhBSAX1ziMaY5febqdMShiCxJHFjemAJqIX9HJvTw4VCw8Iv6KJNk8W1yom7mUiDekXq2eAOZaXwc/bAEG0fhtdz0cxf47LU0Z0z65TWfZij2IAN2MrkaLO9lDR8+FTsBAJ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BvADS5XI; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso10944953a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 00:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745912583; x=1746517383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4cFdboSivb/Cets259EYOhBYwLTwuN4KJVQ3c2p1rw=;
        b=BvADS5XI8M/A2eeaXbLxyXKKxv6YXw4H0cSYPNTrsHmMl6AO2DaoiBgYBQtMRmo2XE
         GbfcXX3uFLWQYUbpLvXRBC8r2DG+aFpU0nHfl9/lDOZSw9XoMrpSKSIz6WYfXfVQnIR3
         TzsFXwcDRkQIyIUMTL4D1DPoK2XE+ZhvIaN80AzG3Cp+kszPUcAxYLTaYEU3z0mA75Rl
         4TuHrGUzAxAq90H4QwRrq2m98c1d+n5q6gCARX9sA1qYR4Nmao8oQnAAf/Kvg2k/dwlW
         hQiroEEzKRO/49zGE26MfOECq6WY4MC5WHUjk1YuArqSZM11uiepQIWENGPD2P3n6HHc
         r2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912583; x=1746517383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4cFdboSivb/Cets259EYOhBYwLTwuN4KJVQ3c2p1rw=;
        b=ALlS7dwP8Gpag2FmQsebimDd6ae4wrRofFvG1ITLRb5UlmkWATe/7xHdtRRiTl7mvN
         PEn+kMieUvnfn0mstWWOKpxr7dOm63kPuN4dCU2nQ4Kupbb0fkxUtvf3rDRfsIeUFGiu
         fozY1nLdxDMbrInnxNWNBo+7hFJmr8EIArn7wcWa0sHSlhnMML+6lXQVNrPPrQ+VYt9n
         oZQzpura6AMaYdGMJESdQUI9IKaxc0RLWZNd+0Zy94yHMZPYdFoX1OULxYipzz4MuUJ6
         gkIBjBibacFP5QP0vAwoP+IN5VU+M8whY35NAqF5ooqa2uvg9/tQhZjCySyOEZfZ7AmJ
         Ae8w==
X-Forwarded-Encrypted: i=1; AJvYcCU/Lh5ixRKQygulViuiFTsoZki88wvhl5hWRR8l3g9514zZNGEkSJDtTHHIJl/NQGBa+81YcA5XQfWsZhtE@vger.kernel.org
X-Gm-Message-State: AOJu0YwVEkrrDguLYC9c78AG+jY6rWxmzpYrPA3vN/ePRPxAaFf03yRK
	nU1MgCOHsCBb8ehJjcuLB9YpSnMlVnLJlhcyiUUViDsP75yn5P3/M6l6/iqHEXY=
X-Gm-Gg: ASbGncv1G+J+Ink6FmIARObE2d8wjlrevaUmouF4pDSQNRuFCgVD+62u83d5y+8fIDH
	/BLPWDEz8j45zqAb7JstktabvkQSsidG561dTI4YIxv4Fkcw96i6AdqWTMGwDzM1dHS+VESirmY
	igNyI9fLfwlEFduekT69SQN17/Gly/l9+j86/7TzWAr5iqwPVmN5vNrza7UWljwRAuI/yGHOpOB
	onuAHWI5ldkZzNBoqWav17sfWKrthysiLt7J1fFJNqxpAtTbaK+qavHPDetnxiX7w+2ej/lfiVm
	WO+BMqbn0LeLPkiEjJmougNCfCbYxF/sNqyTbrg=
X-Google-Smtp-Source: AGHT+IE9EYJwZrPvBkiskUnfX3n2dFlbcpRIRdp0O+Mx1T3YxM3n0hnShaT8+k0xNe0AZ287YErGtg==
X-Received: by 2002:a05:6402:254f:b0:5e4:c119:7ff8 with SMTP id 4fb4d7f45d1cf-5f83adcb70amr1529000a12.4.1745912582693;
        Tue, 29 Apr 2025 00:43:02 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff4e7sm7048114a12.22.2025.04.29.00.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:43:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 29 Apr 2025 10:42:29 +0300
Subject: [PATCH 1/7] arm64: dts: qcom: x1e-crd: Drop useless DP3 compatible
 override
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-1-058847814d70@linaro.org>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
In-Reply-To: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=TQSKcrZq8FZHQUtBFJcAEZX0g0mzLQVbvusMXK73yFY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoEILzh+f+Z9cQpDsfExa0nmDsUFtks2WHb1Uw0
 ztLHKlw8KSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaBCC8wAKCRAbX0TJAJUV
 VnllD/wN5pmqOYwK5XPiUBhWXm9R0QCUJHla9smxeH23Fxw3TAG0v9Gy5zqCZy2PGC9kL3jTWv9
 ShulEupjDPBTEUhCumrDRK9wElSmzjZguEWnDzDBflHj1EE5hw4yfctNw5Lai8GNYojuTfYpLgS
 hGB0zLQBTEBXTd2LSmRgjIvy+Zl2z9+C8rmdqlmbfsgOrP6GlZn4Wb09dxy9T/p4jV7Qz/trCcn
 JOHUqa8Udakug0Gk0dToo0b02aOvuK5kvStNJOAPbPP7rjFr5jDkpQKdp5T142R/Wp3IsVuC8vv
 UHN946P+GL2N/1LiF+aoB91/20bS79tuY0x0MyLUwfkYbUrGxLv8zMhrS/OQnX7SaW6XH8DAPEQ
 QOdvE6/CDMauy0Vj4BXVY8K1HFsKyOXgA9n+UKgTX6nGFMW4ezoT8eZzEFSynIIWjkqUPJAyJ/W
 I+dQ4+pOU1+m6q3Ss6iO7aCeyrhoqNXenIRaYlaHqTzEZaBRH6wpERD+guBFPDUeSMyJsjNnH8b
 7UJJHst+k+45fyyv4YMlnwIbpPQhadJpP1ImpAVwK0QYztEL15dNnTVQ0t6ig11xOT5+Ln7OTN6
 q/U0zF7pu3cvtGkMV1a4fIVkJRnHn/MaIOPzfh47o1hc74UtwYX8fQFvsvxX4wkfCzrEsyH0Y5A
 NHforLf456E2YGg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Back when display support was added initially to CRD, and we used to have
two separate compatibles for eDP and DP, it was supposed to override the
DP compatible with the eDP one in the board specific devicetree. Since
then, the DP driver has been reworked to figure out the eDP/DP at runtime
while only DP compatible remained in the end.

Even though the override does nothing basically, drop it to avoid
further confusion.

Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index f73f053a46a08d875acdeeef9ac195a9b857ae3f..445127e8d07e34916695c7b79325370644b90341 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1148,7 +1148,6 @@ &mdss_dp2_out {
 };
 
 &mdss_dp3 {
-	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
 	status = "okay";

-- 
2.34.1


