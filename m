Return-Path: <linux-arm-msm+bounces-43502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA29FD4BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 14:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FD621884A4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 13:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF111F4E5F;
	Fri, 27 Dec 2024 13:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uVPm62Hr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7E21F4720
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Dec 2024 13:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735305143; cv=none; b=mGd2hj7eKz12tqb/C538LMXuyx6XVbN5pZfrlYjvKDqlRgRyUSgEpJnhEjD1HYW84yC383ZX0rtgJ9xPbMpHRP9ZVD7/zv5HmdnMKC13kC+KrTrOC+QIhCru19sAEqWw+wJUVRhd9PSXZlGepGP6TxU6hPu5xSwErXcGftHudEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735305143; c=relaxed/simple;
	bh=t12v8zWCVM0pM+HRLfyIIOho0KIRne2GJY1N780c0Es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9O1I0ldCcsj2fUh10Yd8rtWZdgrB3hXsmF3EI0fd9y0WnXQCTfvNZRv4aF0x71xAZO0Nq8bHNyuT2kiTN2K9C/cRMYm9DDkzETMBlQvhznXFLi4hFGlNtFEBrN6IhVG1A0emf9tDSiJEQIDFMZUHKv0LogRI1jvpRmQiKJiwF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uVPm62Hr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43622354a3eso49761345e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Dec 2024 05:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735305140; x=1735909940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4jJgXbb0QumNcqO5LY7bB0qO+5goS+G7JsQo6VSzJE=;
        b=uVPm62HrvHznqBxatQTKIIkCuJRnlSu6P7rAM/KfplX7N74b3jZb5mG6eO7KJFXt48
         Twt6uzfo5CHRhixVkViMElsy+FHsA3A0Jt2AvkrZNReq89Vo42tMyvKIdhavCZ2qlWTa
         03QlkFCcWOXka2rH9iz2mlG2zXMG+u7WQtm80CliQjdaP/cAvnfbTg0HjBFtDe9HAxbt
         E4E8HnzxxHxG/gpTkVdLgKUXYOxBfStmIaX5xMbuFFCbTpLeqT28uNaXQM9qWjIo3c7d
         CiAzqbpjlnG4ZVzacjrHxBo9BD6G6ub7qL1KtQIPl4f/qqYdYAlWSV2P8lC3m5Mr+f4h
         O62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735305140; x=1735909940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4jJgXbb0QumNcqO5LY7bB0qO+5goS+G7JsQo6VSzJE=;
        b=GAQWChcw8paBpAxetUkFyPHa9wLg211DuYNSu7QZliHK0sfHgrZHUC4wfeRqk8Lo0p
         pn9mAcKy/t79GQaX0ZZuwyqxxLeKfFv15V/Z5X+sEA+Ki1IqJ20NQkyySbsCJPUZvdvT
         u/1dqHMBe2vnm/+sTWSCJHeYxX92nKQthK8xW9jI9f0Uwq0kJ3iDPwOHJmVAsAa5/Y5b
         FRyvMLlzqpzpB1dffjn4xTSSNSUT+nL+PdXwjE6jlGfJqpIXedEyMk/W40AZHUX9BVuC
         BJxcV/TePWmDq24H/QiHKQz2zSp9mu0Xugl39jyc4EfnYn9IsKWlfJS4ZiRLTupLjZ/t
         FyIg==
X-Forwarded-Encrypted: i=1; AJvYcCULHWLdomw50L5kzB+eDH43FuqmayaX1+1q7aO731qM/jZsd2ahQvqtLWFc+YmyludK3qYHjt56czaNAP+r@vger.kernel.org
X-Gm-Message-State: AOJu0YwwY9OyEYRkTl5cTPHWP1AoPvHODcq6s0o9feiWwqK8/TJ4Vxzq
	VcwdQESAEmAFkHdeTgOngOHS83p9YJZID+KgxPmAahtbzZ4GqlpWPVb4TyOdaCs=
X-Gm-Gg: ASbGncseO1BEbEucB1dSU29q3skM1zqgxeZY37amMkb8pHqTne/qGIsyXkSmCY7humo
	wa+Smk9nGFg5F8qUT3pJQmipqUl4pAyK9e8aSeYtf6vWaIUHBHBwifKw1I9llEMWZC4JSU+R0e7
	kAOZeCry6Au6eCYXjMzZ0D5OR5DzkE5yzSr029rHWlgbsJte91iRawPMtHtfGsOpLWHPJa1SJvk
	oc+aTqU7KJfjMQrPceRX+H6o6iJEgzd+bbrNrtQJspqZoCyVXoDmB+ImlRTVr62Sg==
X-Google-Smtp-Source: AGHT+IFuKgrDMjD8LJYmrq8SZ7oeOgIhejCHD8icwPYGEQQ5f+bQXKsTDAgkDjm1HSLXaarbXODohw==
X-Received: by 2002:a05:600c:5491:b0:431:52f5:f48d with SMTP id 5b1f17b1804b1-43668b78471mr244804655e9.31.1735305139203;
        Fri, 27 Dec 2024 05:12:19 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c42sm298899425e9.9.2024.12.27.05.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:12:18 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 27 Dec 2024 13:11:37 +0000
Subject: [PATCH v2 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-4-06fdd5a7d5bb@linaro.org>
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..5119cf64b461eb517e9306869ad0ec1b2cae629e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
@@ -4647,6 +4648,22 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			status = "disabled";
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.45.2


