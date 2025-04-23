Return-Path: <linux-arm-msm+bounces-55082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2783A98117
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C91F1B63717
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 07:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F30274FE0;
	Wed, 23 Apr 2025 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZK2NpPu/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCED22741A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393444; cv=none; b=a2jTolyV4AxONxz/h2z17Nt12rW80OtW8QiurA/MuW/WhBFwANgXiPimW5H843fPZLbqaA2qg5IYCEPofalxQShAGg/T9chu0Rf7kp5uruVGwDO1V/3RZvCbcvg7bqOdkStuyXUlZF4LOtCIBIZTnlbkpqw2j75JZs7T55r2tPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393444; c=relaxed/simple;
	bh=7HQlkprq76fUgPo7KHD3p5MDWCGUHBE5rv7Apl3+wLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZfnTIAHF3RmDB1/932FvwkeRQQYrfCy8sonVyqWdtqliioEERivp81jhfjzMTTG1YvJnODAOWvfd5Oo5yietcOM2pgXTlXgGuOEGnFw8k/t74C1BhN0sHij2guaZAGm+ofLBZMKowYu5OPF+TERC0pyqbKwkhvZKdvN2HtN/46o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZK2NpPu/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so4791359f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 00:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393440; x=1745998240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fs9MzmNL81A60l3iuA54wmg1x6vTbax/gqInUkeJ7D0=;
        b=ZK2NpPu/gpKmVR02zco2Ob46PsKcl83erFD+QyN7rAlbYtz81p9224SOLVNW1WSrYQ
         sRpMG3cTfgL/e3lZZh+MrbltS9dJgiqH5Z0aLMN4L96Qj0vThQeCQjQp5Qagn/fkH/kQ
         iqwZZjm9tbgCkGmCRwzoPAYLnLrQFgQ7hauVFWnszAK1aqZ5dUX/c6wicuroAoSRvAVQ
         44jUH06KhgcwcEDoPZrIpYN09PcsmUlbA+RF6YPWjLF0CubU3JNc/q5CpxygKMQ1jFVV
         ETtKtKokPkdBLnNPPkftSTb7mrSa54vpmYVhBOGqnP+hEUD0/IIqJOPQd8cVYZHu6H+9
         yQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393440; x=1745998240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fs9MzmNL81A60l3iuA54wmg1x6vTbax/gqInUkeJ7D0=;
        b=bP9rFQbA+MGVBL2S6VZJ2DFuBUBNCclLhMVa2AWIwvJ316AK55ezO6jZjMaGCu3xww
         sFMgmF7HL8L6a+3N+ulbKg1LtfFSOQamvy7LWdNOvCoGTpj0EYE9FUkVi/78vi/vM+67
         fILSh98TqQ5A8RWoTQsnkbboldpylJk2bqMbdD1qH3vrQOsy82l59o0t6EzH7jDB4LX3
         7ya898YU3uOG2P4IBbtt0ebtWl0vkwJv4XMK6Mx+yke9VfA3z7blJN/jucX72NY1m1Dq
         CF9/xnIQANzQmBsGlMmuo4jKsicixnnkFSYFonhvc0X/519dN0vJ1/6uRSNZxih5vunK
         CjtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3YL0Y04MXvjyQfOUluAMKAozX/jGxoQ3jg5M/S0RhqPjqEKkwD1xA5i/UzZK+poIW3Dm5hgxrbvzhW2m@vger.kernel.org
X-Gm-Message-State: AOJu0YzqQtBWfb9gQ5nceBVvP+HCqLubHJb8znG0ZZO0Idlj446y3mZJ
	J4AYqH7daHeKA1qsKWg43JatwhcM5DUcKF3izH+ExWJrdorOKIlg/q7/U3sT8SE=
X-Gm-Gg: ASbGncvEC8I7/bwK9O9rLqqK5reJKwYkr/4XCMg9pj4/aUwhJlWly+QmshZuyHRghJR
	26h8V03TKtllEA2k6J+QpAoOdf4JQvBSR1YPOw7o+iLVBxSDgDCtN1Y3oGd3GgZI+emTNxR0kke
	mlVfV54tjjg+E9yTacQcdRVXbEEho9ul5bv5hPmFMaq0Hent6hbKMfsmM2M11IhLWhXC0a/ArRs
	1iHDIE6IF9X1IdEEurr/LJv3GOv9hj+AnWg+8DMwCPZ69Bha+bf+XUt9QTrbur21qpVehBg9g/0
	eNJ3xF4Xdigsw+CSItu0hTb4Eb8/9WtSZkPttOEFXtcgFDuhC/xWcDA=
X-Google-Smtp-Source: AGHT+IF085Bi1ya3FOXNa+3yFhq+7vRJ6CjTrUbrgCZxpZbWxZoaUVpqRhez1nOFOdgLjh4jCBDn8g==
X-Received: by 2002:a5d:47cc:0:b0:39e:e588:6735 with SMTP id ffacd0b85a97d-39efbb1f7f8mr14078560f8f.59.1745393440014;
        Wed, 23 Apr 2025 00:30:40 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:67a8:3ed8:e19f:5eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493115sm17761699f8f.78.2025.04.23.00.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:30:39 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 23 Apr 2025 09:30:10 +0200
Subject: [PATCH 4/6] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Fix
 vreg_l2j_1p2 voltage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-x1e-vreg-l2j-voltage-v1-4-24b6a2043025@linaro.org>
References: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
In-Reply-To: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is configured with 1256000
uV instead of the 1200000 uV we have currently in the device tree. Use the
same for consistency and correctness.

Cc: stable@vger.kernel.org
Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 1a187dc3684a967b42817e44ff0df10202fe3362..199e256743521de82d98b38699f96697c5570e66 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -873,8 +873,8 @@ vreg_l1j_0p8: ldo1 {
 
 		vreg_l2j_1p2: ldo2 {
 			regulator-name = "vreg_l2j_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 

-- 
2.47.2


