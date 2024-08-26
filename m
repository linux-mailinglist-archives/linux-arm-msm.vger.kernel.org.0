Return-Path: <linux-arm-msm+bounces-29499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D0095F403
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 16:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 658861C21D00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 14:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EC5192D67;
	Mon, 26 Aug 2024 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGL1BGto"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D23718E032;
	Mon, 26 Aug 2024 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683098; cv=none; b=ZMd0rIoU/qtxva/g98VDyeEwqluCb66xUA0CmL9YJ8jry4J8+ZELB/I/1twXFvafQz40dU2OS2w6ZqV6ZTrJe3V6687GcTZWnXhnhX54ul6bzFmIGmOuIwVk9Cc2MmSHhX5aAZRoq7ywSl2I3t6qjGj6xc53UYnyV1Nn+D77Xhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683098; c=relaxed/simple;
	bh=0u/G6239J5ZsRNVdyaYxnQNxxZost1xb9aHVMzK1sqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WntoDvo4mc62UNEhXSK+jqLKeHrnIoAjVb04007RdD5zZGOptJVP4C5+t7eaLp/TC+nKbVWO3eeIIodBNdKuP6iqBJyHnC3PcvMXPLBg74O4iXgcoGDJVXGtX4i11erj4QNcmIJLSM3Bx2jnkBg7aLOO63xLV9s7dUQheZEUkto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGL1BGto; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918B2C4FEF1;
	Mon, 26 Aug 2024 14:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724683098;
	bh=0u/G6239J5ZsRNVdyaYxnQNxxZost1xb9aHVMzK1sqA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HGL1BGtoprjcVo7pz5pEqgDrxMln42FQ1B7lDzhx1TywYtt+NWu1bG95i8kwpUPRT
	 UZCcDBdZnw3OK0MDQ19gYNVcNP4+EsGIQpJyrxernoEupG7VwPOcDgDwClEKPBedHC
	 5oEVw6Lnzs4li8AbmJpWOcU72ZwQjDjBT7hC4Y4EJM3zndFdY2EcIRlqFAjlhb9DqE
	 4+SbSmRSBAOGpCeE7ruJQ62HSOIDr3r+8Hr99VoPmo7SRXtuM9KpYR0HIkg/sCYaVe
	 d1I389TJhUo5vHMu6r5l3PS9SLNHO6FkqK91IFf5akbebrV7UgPK7awNXXxMg6uHYa
	 SmGSydB0RymCg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 26 Aug 2024 16:37:52 +0200
Subject: [PATCH v2 3/5] arm64: dts: qcom: x1e80100-pmics: Add PMC8380C PWM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-topic-sl7-v2-3-c32ebae78789@quicinc.com>
References: <20240826-topic-sl7-v2-0-c32ebae78789@quicinc.com>
In-Reply-To: <20240826-topic-sl7-v2-0-c32ebae78789@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724683080; l=744;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=EnJ2V23ox3JcT0mFqgzd1QRPlFj5Hc3GfUrlka+aLag=;
 b=uQr9qHENf+AA6TBxTDEshiO7VJ5V1zz1lFvU3t21yuxL4HbjAZJ/vcaPFNbpxDrjCGXLlTD9I
 zQCdQJJfvlHA2MpfxXOlNgzxZQdQZCpjeygHRDqEAjUjTx2xZYXcfyU
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

The PMC8380C (PM8550) has a PWM block, describe it.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
index a5ca0fa4e5ae..5b54ee79f048 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
@@ -249,6 +249,14 @@ pmk8550_gpios: gpio@8800 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmk8550_pwm: pwm {
+			compatible = "qcom,pmk8550-pwm";
+
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
 	};
 
 	/* PMC8380C */

-- 
2.46.0


