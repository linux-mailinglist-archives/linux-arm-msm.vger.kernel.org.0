Return-Path: <linux-arm-msm+bounces-43223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F33F9FBC1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 799501882D1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A111AF0CB;
	Tue, 24 Dec 2024 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qa5RSMid"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220A0192D76
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035434; cv=none; b=n3E20JiRi08wpnMa+P0+ySapGIz2VFs0thuB3map6khNhoZLjfW2qNy5uk/QCYRs/mwM5ACV1EnsDez++zeVIw5goWkDOQufetBh/9jPC7Ts7tiOh5TeIADwQl2aTzbNikc6J/n+exzyemlOgdco7rmJ6BelXPgUVLznzee4l6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035434; c=relaxed/simple;
	bh=bHUMlVVUIqYUKxAhgUPFopVezLFM2pjiI0w0VKzBVtk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JQTf+n49t9xtmhERil8l+wpvcw2HjWQt1cj4gazmIUCJ/vrVgtv9EvEfOjNXncNnBB1yi+hHgPsGR26MOl1OjdRv4sgbsajbzEgaBkGsxV7FuL85pcrDDg26UukuFRvGqJekie4wXGAT5JsiuJaDsaqoa9qN2hremvekD1HX80Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qa5RSMid; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e399e3310so5950992e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035430; x=1735640230; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYjmRBq/4XH/cL1I6wGmugZF6A/m6XrFItxvu/qlOtM=;
        b=qa5RSMidTqym3zo7Woq9GqNHy3QPtJjXPlE1dtjgcQzV5bur/3GGoc9ss4iWxMRNOP
         lzOaoX+cZXk466g1VqbNquBlf7vQ3DCGLhW8PDfP5Cxz8YBCMDR03azb4XsucVD6Ty6C
         XDtbp/lBPd/bIpEf+ymafIl79kHz0J3ZqyWeAlm0suf6BUOTJ8U1Y3oimGmkcxNoy0k9
         F74DQBabSH+YGvMnQI3qEG/DtZQ/+vLS6X+bGFeJoiy/tJXpgcx6ZUbODX5i90A6PtLY
         BGWcSbVwqS+aKZdzIHBzTbtfhGoqYve0YcrYTXf1HirnUsn8PQN2P9TR2a0m1SHTK5RW
         g5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035430; x=1735640230;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYjmRBq/4XH/cL1I6wGmugZF6A/m6XrFItxvu/qlOtM=;
        b=YTw84ObmUaVB/9i1cWybB5nwL0toYzGDxFXOtLBNho19hIDiX46IkAlHsgznHlP2i2
         8sfBaCXdB2/EUhDaBS3c3XPCkyFCZ+mLbhsp6U5iNNXXqOrl6KhQwfAdl6pnClmB/BYH
         jn4sEfIva+bav/G9Wv8RYQ6MKn0UGyM91Zo3x9S8aOVoXiJM/F70SL2t5jPx/8gWBVsY
         GtvTMz3dsDOuEI8wQ0GvJduFpARJM2/UhHse6j0ZEdyCSSxRGO2osUJgdir2A/hAPzDZ
         9qvdCCfefrW7109/8QDHdO+Dh4eIXkrCFAZq2WfqHntu84cRmEYAnIhoEPCILg12Jw5D
         G25w==
X-Forwarded-Encrypted: i=1; AJvYcCU/btsonaYMUpgKk6wn3owEXG3LaA2ihbGg1w3GH56LA+bQXnEPD5Tc4lcFIwlms2JJ5naFSGuscUiK8He/@vger.kernel.org
X-Gm-Message-State: AOJu0YxrxxLE8KX0fU2fnbqkyahXRo7xieavkb4YnKHsUGXiAn/3nXPP
	Ngjp7xpdH44znD42b/kvT/onArnDgB3mfU3qjpeBkjG48flHf24o9N4VOfCfV/M=
X-Gm-Gg: ASbGncsmhbp1Gtl3Ey/g287YS1SCCSBVOBBjQsE/+UAux6/Hq9DkrGxEv+UymYZ1bBj
	KtUcnMUf7l/Jmdpjp4f4qGOu/m/mQzLJT5maiM0AtoCDPvQ6X/jGW7+IcKZtCe/yw4bImU1aGfd
	gGEtotrodU42z+Er0XlEzX7XEQu55uBLK7v7Avb3pMwOcYZgKMa+29nabNJCi4zVuU1d/cYLC3Z
	7qu3y0Q3luzAMW7Sb8tX4DYG9aivN4hBoH/GpNwQletdEx++xYRDAGsbcNP5Eag
X-Google-Smtp-Source: AGHT+IFnaK4NWBMz3aMj5Du0Sz6qM1+ETmAMtqo/zne22jpNYdVabdxlAiO8L+hsOgqupDtPm33yJw==
X-Received: by 2002:a05:6512:a8e:b0:540:1d37:e6c with SMTP id 2adb3069b0e04-5422953c42bmr4773614e87.30.1735035430226;
        Tue, 24 Dec 2024 02:17:10 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 00/21] arm64: dts: qcom: correct sleep clocks
Date: Tue, 24 Dec 2024 12:16:59 +0200
Message-Id: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABuKamcC/33NwQ6CMAyA4VchPVuzdQzQk+9hPIxRYNEws5lFQ
 3h3BydNjMe/ab/OEDk4jnAsZgicXHR+yqF2BdjRTAOj63IDCSqllBp798TWm9ChvXl7jcjK9Kx
 JVFRbyGf3wHlnI8+X3KOLDx9e24ck1+kfLEkU2NhWCFP2urZ0urnJBL/3YYBVS/QhKPFDoCy0B
 6N0o5tK1/wlLMvyBpfJxfLzAAAA
X-Change-ID: 20241115-fix-board-clocks-e3afe520627c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shawn.guo@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Zac Crosby <zac@squareup.com>, 
 =?utf-8?q?Bastian_K=C3=B6cher?= <git@kchr.de>, 
 Jeremy McNicoll <jeremymc@redhat.com>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org, Stephen Boyd <swboyd@chromium.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Max Chen <mchen@squareup.com>, Vincent Knecht <vincent.knecht@mailoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4726;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bHUMlVVUIqYUKxAhgUPFopVezLFM2pjiI0w0VKzBVtk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaoogQjUIfCjjEUcauxTACeVoFZF9/P8RbUJoG
 Baz5yrOWwKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIAAKCRCLPIo+Aiko
 1b1hB/9761DrLKZ8R+DrmbOpBAmO11qH5+pkLuN5ALUhkce0uvB7D00L1Dk//G/z2VszwRd/uDb
 BoUUGnqLlV9yA5Ux+t9NvHAA3ylKbX1n80q2rdW2lgwWMtzwj8YMYS8WlMTnabaGPJ8DVaPmq5f
 es+zGwzv94r3TUfZ5/Df5WSvN4ttLyOuh1wm+FO/pMFKrr7oVRHxI6+rEOhQW+Uq9O+NsEbUU2y
 k00BIOt04qDAdeVOtokPv2wHkuwEx7jv/Gw1SzRAk8cpYWz2kzjTdm72Eq1YUtJWpC5O+I2OMJb
 RObYWZfqpXw1xwEXwLN3MUSEbbGj1RFpkNTrgwOi8oEUsgRM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Correct sleep clock frequencies. For several platforms I wasn't able to
find corresponding document and as such I didn't change defined clocks.
These platforms are: IPQ5018, IPQ5332, IPQ5424, IPQ6018, IPQ8074,
IPQ9574, MSM8953.

Also several MSM8996 / MSM8994 devices define divisor clocks at
32.768 kHz. Most likely these clocks are also generated by dividing the
19.2 MHz clock and should have the frequency 32.764 kHz, but being not
100% sure I decided to leave those as is for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Dropped the patches NAK-ed by Krzysztof
- Link to v2: https://lore.kernel.org/r/20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org

Changes in v2:
- Move clocks to SoC DTSI (offline discussion with Bjorn)
- Link to v1: https://lore.kernel.org/r/20241115-fix-board-clocks-v1-0-8cb00a4f57c2@linaro.org

---
Dmitry Baryshkov (21):
      arm64: dts: qcom: msm8916: correct sleep clock frequency
      arm64: dts: qcom: msm8939: correct sleep clock frequency
      arm64: dts: qcom: msm8994: correct sleep clock frequency
      arm64: dts: qcom: qcs404: correct sleep clock frequency
      arm64: dts: qcom: q[dr]u1000: correct sleep clock frequency
      arm64: dts: qcom: qrb4210-rb2: correct sleep clock frequency
      arm64: dts: qcom: sar2130p: correct sleep clock frequency
      arm64: dts: qcom: sc7280: correct sleep clock frequency
      arm64: dts: qcom: sdx75: correct sleep clock frequency
      arm64: dts: qcom: sm4450: correct sleep clock frequency
      arm64: dts: qcom: sm6125: correct sleep clock frequency
      arm64: dts: qcom: sm6375: correct sleep clock frequency
      arm64: dts: qcom: sm8250: correct sleep clock frequency
      arm64: dts: qcom: sm8350: correct sleep clock frequency
      arm64: dts: qcom: sm8450: correct sleep clock frequency
      arm64: dts: qcom: sm8550: correct sleep clock frequency
      arm64: dts: qcom: sm8650: correct sleep clock frequency
      arm64: dts: qcom: x1e80100: correct sleep clock frequency
      arm64: dts: qcom: sc8180x: drop extra XO clock frequencies
      arm64: dts: qcom: sdm670: move board clocks to sdm670.dtsi file
      arm64: dts: qcom: q[dr]u1000: move board clocks to qdu1000.dtsi file

 arch/arm64/boot/dts/qcom/msm8916.dtsi                      |  2 +-
 arch/arm64/boot/dts/qcom/msm8939.dtsi                      |  2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi                      |  2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi               |  2 +-
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts                   | 14 --------------
 arch/arm64/boot/dts/qcom/qdu1000.dtsi                      | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                   |  2 +-
 arch/arm64/boot/dts/qcom/qru1000-idp.dts                   | 14 --------------
 arch/arm64/boot/dts/qcom/sar2130p.dtsi                     |  2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts        |  4 ----
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts                |  4 ----
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts           | 14 --------------
 arch/arm64/boot/dts/qcom/sdm670.dtsi                       | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/sdx75.dtsi                        |  2 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi                       |  2 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                    |  2 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                    |  2 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                    |  2 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts            |  2 +-
 .../arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts |  2 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts                    |  2 +-
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts                    |  2 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                    |  2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                     |  2 +-
 31 files changed, 52 insertions(+), 74 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241115-fix-board-clocks-e3afe520627c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


