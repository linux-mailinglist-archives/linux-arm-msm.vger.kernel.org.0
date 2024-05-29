Return-Path: <linux-arm-msm+bounces-20957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8929C8D39DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 16:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EDDC1F24F10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C41E1836C9;
	Wed, 29 May 2024 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S0B+x+To"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4711836E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994037; cv=none; b=PUhfJaqyMzpBIfRFxYgk5L/meulETkbQBX6/2BbOK0asWZEP/6qAIUybXxffHeQlEmLG0veohtz/lcMvyZ0FQTawxlcwYAB9g79yg+8V9XiFLqUuyB3HOBrCp+YaNgElYch6UXbnvXKM1TojkYt/3lasf6b2X05gv+ZwdWetjfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994037; c=relaxed/simple;
	bh=XAt6DL1VR9hVvuY+93ZuaPQtdbqMKNXUv5SdCXSc/Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B2UxUcOg/i5EXKvhk/HrA6P51vIJAk7pwYlA40TVwOJzQiQCwP1l0S1xP20+Nh3bt2HDvB62/J0n8cJ+pmZLOPBMJg+xZXxh/W+gRZn8bQE1cm/71wvmQ/24qEmPUZxoNLns+wGEUZWSqVPr9IG9M7V4P2x8PsqvcDWMprwsA78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S0B+x+To; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e9684e0288so27462681fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994033; x=1717598833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVQnFMigylZLrd8REetB+leXaGU3JW+I/8fg5hchdrs=;
        b=S0B+x+To0RVDZf+621Ec0gPzGOz2yVz6OUZwKqrcIVbXkjT764ta4NLkgY3x6gpncy
         58Ub1lHlmhzLyKr2o6bT0gxH+iCJQ/Qhw/jraORDUEAmkyEw+Cw2HHPQks19Bv8+Uj3/
         pP+Sm0/sizEOf7nltxtquuMhq6ObX6ZMih9MH5Tilm3FlmjAYJbs3Ykb67ul8IbMsc8L
         KWqkkPE5ARbzJ/d0XSH0tMBD9KmF7Y5R5kteo1NL7qAHd7aYttYOMUMDaepz6P9nQAbK
         TYRzNpEi86X3ZZSAXoHsS9Nepabd1v8DLoAiTutY0EBCK3uHYilCwQUUXA0PDLLUtW3p
         Cjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994033; x=1717598833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVQnFMigylZLrd8REetB+leXaGU3JW+I/8fg5hchdrs=;
        b=ZOokQwFzm4aVC1LTCjX0VURNOf/5ndaHA8+zpRyd3Ixdj9SI/i6Sj5Ssw8Vcv0mzPy
         suvQ3C7w9g8lAvkZcbZOB8idickHbzLDjOGvQH+uruU1+VN3H5yjggmOy+Dr0NydtQU6
         NskL/IQrkfTmkkNvp/MCcpUU9b5+xdQjmMjMuvkEFoZSFKqci2zD+6XkuTeqBmI5/62S
         OTAFg4BNJ5ctgNYtJw0BesqC1aDIJPRpNhLN8o3YCgmW8tfb6WJPlWzeU3/t5JNhqlLH
         wHD6oCb2csWY6QTsCU7rRqanw8kOKHkDEBgW+MP5ygVZQTJ2s+DedAVt6b/6OjKZGbPk
         8Ndw==
X-Gm-Message-State: AOJu0YyR3OFnC5TbeupnpXNCRiTL0BXzFbAP9wYVwLcGZDywVW8pHW/W
	w25jhkx1F96Skmiiid5YkuhB/KlRDXjk/6H5TgxjA917UAdQWZpDxInAupZ8KFI=
X-Google-Smtp-Source: AGHT+IE4/Bdi8Yy3nlcB6YDgswdyud9MjVAGTsjoJ8cPyrSw3RlbHHrEBh1C50PvfGgu7jLje6LN3Q==
X-Received: by 2002:a2e:9bc7:0:b0:2da:a73:4f29 with SMTP id 38308e7fff4ca-2e95b0c57c4mr137659351fa.30.1716994033408;
        Wed, 29 May 2024 07:47:13 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:47:11 +0300
Subject: [PATCH v2 13/14] arm64: dts: qcom: ipq6018: fix GCC node name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-13-69c63d0ae1e7@linaro.org>
References: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
In-Reply-To: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=759;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XAt6DL1VR9hVvuY+93ZuaPQtdbqMKNXUv5SdCXSc/Gk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVz/mo7DOZ24IcjHMnwKdD9EIgRuh835+zXHuz
 8wUO7QPMciJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlc/5gAKCRCLPIo+Aiko
 1WoxCACd8LgA7msfrqZUx/eJhT15wHk6itqVWHjmgo9yCaHRjrdx7h/ObJ1Ns209J/6TlQp/PaT
 4mCCtbzMXocLGVq3s6Ht4YPYAU/rQTXSvbpyoXOsf1ofRjPAGB55X913pYeMsdIwr3KlMu7Yi0B
 LTzIEyZRd9WdvfRQKusxhpca0w5kCzgbx87/hlc6MXXmK9h97HrkP9r5CNxlc3yAzhaEeCDicpg
 7qZtPYxyVy/uvUbvdba+q22xF8BmqMgHTIR5TTDO63cE0xWRIH+Urj5TPCvFo6uVjpY42eJ9/Jt
 huISK9ewri28gQInf8iRejl5qZpWC56PulJ1RLtQh9oznIaw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Device nodes should have generic names. Use 'clock-controller@' as a GCC
node name instead of a non-generic 'gcc@'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 17ab6c475958..a84cf62d843c 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -396,7 +396,7 @@ qpic_pins: qpic-state {
 			};
 		};
 
-		gcc: gcc@1800000 {
+		gcc: clock-controller@1800000 {
 			compatible = "qcom,gcc-ipq6018";
 			reg = <0x0 0x01800000 0x0 0x80000>;
 			clocks = <&xo>, <&sleep_clk>;

-- 
2.39.2


