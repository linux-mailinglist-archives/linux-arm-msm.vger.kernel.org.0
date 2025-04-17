Return-Path: <linux-arm-msm+bounces-54632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C7FA91ADB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 13:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01B9719E34EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 11:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AE5241693;
	Thu, 17 Apr 2025 11:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zr4dOeTW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F30423F41E
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 11:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889235; cv=none; b=M1iCt5bCA/t4KqWBXBalkJTD6hMav9fdOcrSGroHybZijzdF91KK66zBzrZG8Crlo1Of9ZtFFX9zaZBWNW4q2c82t2tPNndSCMjWRHbyS24l8B6WAz2UzGNlp0/2Ni3O24Pu9VSRIAO7pSx+zODH78wsgI6HUTzrR+B6BBw+m2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889235; c=relaxed/simple;
	bh=NcriGYMZwRZRM1Qw6vuW4UuCPYe+VfMiyfd9EF14yzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbvPpJm9L0SLLdmxeoF9MMKHHFbjXQekowDlhkYhEpEpcIuhUtVHaCtiutnqOCOjjd142j2fy/zjX7qSM6MHlUzLhDFgsiF0WbbtGPm+YZVeV4WGUWdUYXN57GvjMCBal5HwUIiq0QzxLVat28ExEtsSAkawzXcRJQ9snGDPplc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zr4dOeTW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf257158fso4626895e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 04:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744889231; x=1745494031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcZh3O74YpUyGxnBpp2yZbicwq/KGRckATMaGfA2GkA=;
        b=zr4dOeTWbXHGv/WSI1kV148Pl/EjZ2k65+XUgNp/h8XxtTjG1WN9VA2uhR+zahX5+z
         qNUGpNw/4+BOb4Zi9NmnblJT9wfklKrxokcCnTabKPxuBrnjQkXz6qPnBLKvihEvYLZR
         Ae6OefkkDV1V2OhJQDxLIxph30sOCs8LCtrwiUfYUpaxzfUznquKRv1wrIvxnM5UepcO
         m9z01WGZ1WUDWA190Hh+3kjYTXR/dOoqBOTgyotXYHt7/ZHfFtIcGu1d1nxnYHC0DKQr
         IMatADvBVsCUGNyz6s+lIwLdK/AwlXIpwW36E+9JGZXURozkt4J9l7qa5I/g+iH7WSUH
         7vXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889231; x=1745494031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcZh3O74YpUyGxnBpp2yZbicwq/KGRckATMaGfA2GkA=;
        b=pPb2B/GiAlDcnVW36qmxqLn9UWar4WzBLLIpMQqk6JrjrTLDKTkW+CFMBNMIluXL55
         vgHtN8GnUAX3FWdfMgVsdbQ749RCpdcmFIKnJW3iLRCGYyxlb07HpLBKboWSLChv0wci
         Rk4RrL3EPkjXW7mXJv0hhHXIu4mKiQPT1X7ZDSi1RkbBhwKvy8zfXtpxi0NqTz676MrX
         jroS8qd9ipGandGIUyV2RnFfxqtqjmsXS4alU0GjU4AVwmqckQeiBw3xWH0gFOfT4V07
         EyaMufbt3SS4+gNB3oh4zbyHn6GBB7qypV76NrlNXd7QBxtoxEBqK+bBi290/0/XCfAY
         BPEg==
X-Forwarded-Encrypted: i=1; AJvYcCWPo+KYFod+XgxWwrTdohBVdOuFG9IC/V1Kw8Emewylxrb8Fkef7IVV2ZEUL4Vdc7AnLjnj0G0iqDnAXImF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2kzCkzdv7L/6dGhsMQE6Dv/uLhCxXXGF0dOIoAbgDtzqNkJ5Z
	2mD8F9BXL9I6Pn/ILgCAEwklV0YS5kcsyuGgvHZPsYNy2OTJASmCy3gVPak1eM0=
X-Gm-Gg: ASbGncvOWTb3uCiP/96y5YkyTOKYbxZkKvLtSSgs10ZTwz/6MZY8avKH089titrMq2N
	UH828LleDY+FsLJ1PVAtLXVuFpjQ2lt/f2G32PkoeXIugGCExgNRhxr9tp/Sevkd3G3YQV+lx4r
	4kIaPmLvRHFyfwf+IfPiQto1/n0F/TR+e9KnW64FOFiCq8kgHqaQtZqkFrwV27L16JrgRXXrGOv
	NhNlwwn2V+dgXGTgjNOfbTeaBOE/n+VXmztYMTkurp0mZttTM/o5jMOJ49RLD7ImDRgf0CqCaqK
	2x+DDvqRvO/UzKNDcZYd3zSuqSXMCWcyGH4yiADalxIxaFm/whOkLOya/IGrYz5LQO1xN0+8a1Y
	DpSVxoQ==
X-Google-Smtp-Source: AGHT+IHYDrL+8g1EtW3z+xAlBB/JWa/n5mlaOnthkSWN9ndNXgNcV4bD3PEl2KB/vdDssbFxhpK52w==
X-Received: by 2002:a05:600c:1c22:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-4405d62a53fmr55768145e9.17.1744889231465;
        Thu, 17 Apr 2025 04:27:11 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96400dsm20144063f8f.11.2025.04.17.04.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:27:11 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Apr 2025 12:27:06 +0100
Subject: [PATCH v7 5/6] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-5-3fd4124cf35a@linaro.org>
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
In-Reply-To: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index e2f6e342db7e2f7cfbda17cbe28199546de5449d..74bf2f48d93522d3f5b7ca990c06519ca664d905 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -858,6 +858,36 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vrer_l4m_1p8: ldo4 {
+			regulator-name = "vrer_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p9: ldo7 {
+			regulator-name = "vreg_l7m_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.49.0


