Return-Path: <linux-arm-msm+bounces-51408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15823A6123F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BF52462427
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 13:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFE31FF7CA;
	Fri, 14 Mar 2025 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QJx5I3WI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868861FF7CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958056; cv=none; b=FZyMBrvn89Me8Qr/ELF++hvcmdbFGGge/Ci6+96jJHNoFdxXfbQ4dJCfXwxi2HXOMvteKkcjspfcfwUemQnDyhA/jsHODFF5azof0+LpQjjFs8ME7/p0I4zGe5Wvm4eY6DKnPvsri1CuXQQji7pRv/yOYjs86BSHE7UKQQ86mVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958056; c=relaxed/simple;
	bh=CU+/XDQ60jyq3i9MimUs3kFmTV8jnj/R31j8nRU/h1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iYfgHXHlvX9e/0sYZ3BVNmFm/XM6kKObz9NUxNLgyjj2C7ePUMUmktnTYMulRv9MvBwKlwG9xCqcyS0tDMSj02+YB+xoo5Fi+SOI5Y1ZcLKm1abhjgef7IRAkSQ/FBT9HH6E5PtMl/vL17ky/a87iEOQN06SeAckSV+hXkCVbxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QJx5I3WI; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abf3d64849dso341810966b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741958053; x=1742562853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DObyF/iUzXjPpPEbY0w+cm8oMYW2eB7he9g871AEyE=;
        b=QJx5I3WIhysKc3fOhiO4N3zGklUXZIQhtCcJ01JzrnbmWLF90R5nqej5m6mROdcDhk
         v0cVaPOSYoInDRQUbQZXhVzGMq0TRxnU2W0NzC+g8uVjWlBnpOolJdLV5HHvrFQP2aIC
         ctDQ5JrHT7hF0XsTXpIWpZdt7pjYeycAu6rfbnq0+mYY9H0ZE39hYgAOanYY+KSBcqHA
         eN44rckluc7bxrEv1/+CjxqLYOcI3WDq8cgrJkbDdw+mQBJZH0893WK003kEHizuwc0z
         /ItByWB45osw04dIe+EGwJpJQbXGUNOzsTKZMmgu17usaymfjTLm1GovFQSdyVrfkJIZ
         n5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741958053; x=1742562853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DObyF/iUzXjPpPEbY0w+cm8oMYW2eB7he9g871AEyE=;
        b=Kpb5OGzZW4baiuQ1hQnAMnvpefPxVvgrt5dWToxHhGUhQopGsZKwd7Z+AJKqR9u0H7
         ZP2ZYDffCaqgiAK2tmHmF+Xsdp970ltATrpXp/c2UYn4y5gazRTQN8XmPBBnjsS+07q6
         ni/GzdhPBKGOv4dFybONegNPk/QeJoQURnMSn+Lxv79xy44aQ9jRB4r0kMYpCA4fRTnj
         AsWcqxgQp2owdVkLt5zQ6UPNiicRGQnj3/li0xF30leWylIo0gefDBBY5IdKzOt5uleK
         d5PEylucF9M0xRmmawvMRU2EyIKjCr6R0Vt91ZIyP1jrUgkzTzRhyA+0piwEGi0+sBej
         he/A==
X-Forwarded-Encrypted: i=1; AJvYcCXxkpIY91ghMGNDTOPP4LAktYJjYJuUiOzZ0gbF1a7QZ+o6+OaMADDdSOGoVgm1ZMPogIsCX81xTRE59cqK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpcpc9vctdrpMFfZh2Gjtq1Vg3FzxaxrZAwBmTM2bXe+RhJDbw
	iD8uw17dqVRcLrTddaH2oP+bK372EiuRw/eyN5hkjLjMEJ3GBZH3S4b51TQUYBE=
X-Gm-Gg: ASbGncseudRbW8dF9P6TSANYd/WckQ1tdukHH8A8WQDHPmlHr19vchp5czNwmEUyxpp
	YUqh+33bHoP7YyE7T3G1SDMtUefEeUGTQ25dEjfhbnSSW8Pjcf36o3JMfzYiVniTg8GuY6rJxUi
	cFcd32Kfzo0Jg5k0sudVpbZBfxKS8Oxcz+ehhJLxcfUgn1sFmsYeVP61PyG/ru7vvnVOsa2LX5z
	NL8yiUzmc0pRl8sxSdMYbJIuPW6c7olx3QywUjilgU/XpgHF+MbBrJhFUJOmUIbGtdQqWVfUjSL
	iSU9Vbm1j2UlroIPHxG3iy8QjsJB6G70tuWT3gfpKoqPN+/JRP6O3ZxMCYuQj3oJhL9iSESwBON
	mUzwJjEe73l9dNRqxqKhv1klQebeG/h4Hm52/LrP3aB/C5VyldPKhObpYdFDZARit4EFvDGdihA
	0tO1c=
X-Google-Smtp-Source: AGHT+IE6XOuB72UEqsTJNdvpZRBJmMnctkvfNijsse/zxvJ7jAiEAX/EBW4sazJg5K0fUUXfv75Z2g==
X-Received: by 2002:a17:907:7e91:b0:ac2:811a:665a with SMTP id a640c23a62f3a-ac3304ef297mr260778866b.57.1741958052787;
        Fri, 14 Mar 2025 06:14:12 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3fc0esm226008566b.137.2025.03.14.06.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 06:14:12 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 14 Mar 2025 13:14:01 +0000
Subject: [PATCH v6 3/5] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-3-edcb2cfc3122@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
In-Reply-To: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
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
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 46b79fce92c90d969e3de48bc88e27915d1592bb..065a219e69c632eca288c9ade001949e37b92173 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5116,6 +5117,22 @@ usb_1_ss1_dwc3_ss: endpoint {
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
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.48.1


