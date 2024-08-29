Return-Path: <linux-arm-msm+bounces-30005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 767279643DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED7881F23D31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612F41AB518;
	Thu, 29 Aug 2024 12:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MC4Ha6/I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4469F1A4F2E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 12:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724933030; cv=none; b=PvmiOEVKN5NBwtkdCK7zW/HvLvw61gio0suKTuUpWiPUT9/46fU2MUmp4vna6196Es7q1IZRZfygl3atAWDI8uyqjRYc7vm3cvJHAYKP12FluN1ZW13XQbevS3XY138lBNfEIBaUZxk4JvZo7mdrb5pBS810txEdEWbQ8Eg80o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724933030; c=relaxed/simple;
	bh=IiT/7XdGpwOAYkfqzZDNl4dNAydDKPXTLIEuORrxYhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NVXByc2ROsDdebaMU4QRGdUAMjtJs2F/6LXmLp0jQ2fTiavsZiYKD26nB0xHdoZRRygy3zOREuiD2cX4bSljHTNZDrDpyATuTSNVI8/BtPn6M+0fEV/leHYZEfVRQ5QpH9lIEYHbEcVYz6Ng0WW3EQdqgK6euDwYa+kQzj0BlGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MC4Ha6/I; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c0a9ae3665so543227a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 05:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724933026; x=1725537826; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WFVzg8S2FkM/1Y3tdKbJ56OWov2xX96GR1Lfbg8fec=;
        b=MC4Ha6/I/+klpz3Aa3rVCz8CRGtwyhELZJGk3tWUft05gB54/X6SWjmPwrUu6Sa3BI
         p9uOtXirYoY9ZTuxV8ZB3WnVlrhotY6d4mmJrPz3QEKxcUyI3a+J1FnMy4EVMBLe9CnF
         8TtLu90fMLzSb76Ec1YntlbsI7gWVZSq/x6Xw4o7rfOondiSsps+Bq1a62qAve5y73Ow
         Vw7ddxIYiC/jGmSegcs7rZDc7hYYRgTvPRogMguKZlEFu73Z0o85KcCiZP7xoAczOU+/
         P5V0BnxbeEte03DEkrBiKB+1RoUYbqnh1zCZSJ0jdRXhLWQTBqNAyBz1jdb/zTmk7ot9
         3eZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724933026; x=1725537826;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WFVzg8S2FkM/1Y3tdKbJ56OWov2xX96GR1Lfbg8fec=;
        b=tLch9awar/wRjbGp7S9BbE/aL1GaHpCYRdO2/JrzUZLOVUhHnnoKSagEcnROkUVb38
         KRSyXX0TNQKXnQC7LUogjPte2CQkVqolEdOg7/LbpBfAxv9RSyOEcPZi3ZyWPRMQF21Y
         nmgnuFEEeepYKtp0bX/fRSa3TUoDeYvrDm3X9yBg6D3Yrmwe0fkLr+9nIwdba4N+6IEz
         wmVFvZZW3yd2sZx8Kh5+pXk/WIZlpCCH/3YMMGMHormBGPwGEAD1Gu4HPry0SIQG7azG
         bsOlIsRIrJfu8QYfZXHm7S0DyARSOYicymO9BaWpdLVCwU765IKX+UWZolq2K7MpwNYY
         4kXA==
X-Forwarded-Encrypted: i=1; AJvYcCWhOIabme7u5X7fjhZP3Ce9+BC+hsGP8rK4qvKYOxdd1Pw8TnOSRF0ZX/HnbQeGmv7vYF3fXAmlszZA91Sf@vger.kernel.org
X-Gm-Message-State: AOJu0YyID+1wUj8YLsY/AqGzYrxcPm99qY0XFjHtMSvMqECDUnA/lKzG
	Yuw3OGZUV5scj/L8n+EohLLnCVWy4oOtifH8DqsFtBeBBfu84I2/xJlyzpNhJjk=
X-Google-Smtp-Source: AGHT+IE4jYrN5qNJdIEWQ9cfqJ0nV9CeNwDdJdqgr8BDx/r8cyuysG9jf28++tcnzqg979iJuIA10w==
X-Received: by 2002:a05:6402:2690:b0:5bf:1301:84cd with SMTP id 4fb4d7f45d1cf-5c21ed41db7mr2265735a12.12.1724933025307;
        Thu, 29 Aug 2024 05:03:45 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feaf1esm71455766b.7.2024.08.29.05.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:03:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 29 Aug 2024 15:03:28 +0300
Subject: [PATCH] arm64: dts: qcom: x1e80100: Fix PHY for DP2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-x1e80100-dts-dp2-use-qmpphy-ss2-v1-1-9ba3dca61ccc@linaro.org>
X-B4-Tracking: v=1; b=H4sIAI9j0GYC/x3NMQ7CMAxA0atUnrHkuAyBqyCGkLjEAyHEFLWqe
 neijm/5fwOTpmJwHTZo8lPTd+lwpwFiDuUpqKkbmPhMni+4OPHkiDB9DVNlnE3w86o1r2jGGB8
 SfRyTDxygV2qTSZfjcLvv+x+z8EF2cQAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2027; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=IiT/7XdGpwOAYkfqzZDNl4dNAydDKPXTLIEuORrxYhQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBm0GOXEUZrTrvQFJW8jT+U2HIkjX7DATO58nHCH
 OXgRpEMr0CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZtBjlwAKCRAbX0TJAJUV
 ViI/D/4+ugElrcNjA9rT9GWrMG3EgLtGC8J05PGh+sITG8cmptByrsZZGT26uMHjui+lFygjYEO
 TTCmLTQHcwhcOC/O8F8t2bCHiCZ+zo+O48W6pejBPUiqSH3aNoJB6UI50FMNhSeiQwzpUYCIzkr
 edZUq0qKjqNGcVq535hKInCejCxbt+EsXGUY9KdQdxsehTgqdbXj9Ioi8FCfQPqATs2ceLpvUY4
 hsfSX7ax2RZSoQoX4le4K8W7KjlZexwlGXxAvpDG3m/FepN/qoC3kfNFVw6tx2zwnj1EXUTWHHQ
 vmIo0lFqH+Cm/l/lZkSAJtTH+p69fa0YubhGnEl053zNcAbKzletXRMMnw48xPW+nfi7nkfM6tG
 c00dZL1AXsQa7FxWWBs+XEiw3wP72Y8xgpWrobsphyeobPeV4X37osx09IWBvVzPO6QqS0XelPS
 f+J6i+9Tc/thj4toMNaPN+X4bV7Np/k4fEdcC+vyEcp3FJ/Cvs28fC7ZtoZpejjgcw4hVQywWrK
 tpdPKNJkyuBYwrkLp7jz4bu7aEMGS8kVXeeZa2OrTXjvq3ctu8gCE2oMR32YmxNwyyzwzmy2aVS
 0tq0LacPLBsk1UpDVluVqHfiiyvoOpFxQ95BvyCfeLrl0WJYSsQqGy/ukDWLDc13EGAHIOb58bG
 Q79jFyt3RJFfowg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The actual PHY used by MDSS DP2 is the USB SS2 QMP one. So switch to it
instead. This is needed to get external DP support on boards like CRD
where the 3rd Type-C USB port (right-hand side) is connected to DP2.

Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 6abff8258674..197f9028de31 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4715,14 +4715,14 @@ mdss_dp2: displayport-controller@ae9a000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dp2_phy 0>,
-							 <&mdss_dp2_phy 1>;
+				assigned-clock-parents = <&usb_1_ss2_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 				operating-points-v2 = <&mdss_dp2_opp_table>;
 
 				power-domains = <&rpmhpd RPMHPD_MMCX>;
 
-				phys = <&mdss_dp2_phy>;
+				phys = <&usb_1_ss2_qmpphy QMP_USB43DP_DP_PHY>;
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
@@ -4910,8 +4910,8 @@ dispcc: clock-controller@af00000 {
 				 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp1 */
 				 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
-				 <&mdss_dp2_phy 0>, /* dp2 */
-				 <&mdss_dp2_phy 1>,
+				 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp2 */
+				 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <&mdss_dp3_phy 0>, /* dp3 */
 				 <&mdss_dp3_phy 1>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>;

---
base-commit: b18bbfc14a38b5234e09c2adcf713e38063a7e6e
change-id: 20240829-x1e80100-dts-dp2-use-qmpphy-ss2-cbec8c3d8a2a

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


