Return-Path: <linux-arm-msm+bounces-61034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4C4AD650C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 03:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D64B03ACD45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 01:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EF317A319;
	Thu, 12 Jun 2025 01:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K9psXQZ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED4015C158
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 01:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690959; cv=none; b=FLP/X0pJJSaMXwsbudPGWSG8gdz0y6UxAZmp0PPlpE5cvG7Jm/knIxeV8awuVFMpuVJcg7a4niKKEd2WLcAhNyFDOw42WGGnnMvzRd7LJVArly9+A9jXMdlurTNOMwu+WLIzqY7i9/BVVsz10yqapkftHt1M/BwyIopvVM0O7xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690959; c=relaxed/simple;
	bh=lRmpab9D7U7Xj9Gg2kKMV8W8QS5flFvrcHN5YkABJeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oivNrmdg83sX2QhSlk4Jw+aXSFgr4iOD5RSnIPGVOnVhA75o2RMSqTmjw75/KQVUMyP2xFO5MAZKHNiQWQsixzVzY1bDBb5SryIqkRd1tPlrDgf/BHdX2YD8wxUyEkqyN3rrRmIjFz6TMSR23g1j7rI00/znzK9BbHlR6QpicV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K9psXQZ0; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32a80cc8c88so688771fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 18:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690956; x=1750295756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0iMkhzgEkgnzNz7VpgQGchMjTI01cfv7nEZTNImKIA=;
        b=K9psXQZ02X3RMtr2K1xrRUDPgchcMIla3HHmz8pgvDjpNouEInPDvXMsq7MOIuGQal
         LxswlFnOdpelfJEnXlaintvbtleAHzn+1X9/4wYF3+FFjcM/eW51qt+gY7gQDcSfhCid
         1ad/30+6INPBZKmoqoFGy1KvNUSiIH51eU7FbMeuBdp4GZg/C7KtNoDNP18wHQf5u36R
         a69cJK+nqpc25GT7CXJSytIXEFbn9ux3/YeiyRO8kt6sUVHUg3iYfBZA+6ki+A69WpYf
         0C9wlU+YmXw/9hvTg6uGuqi0CfpTZuTEa/bniRYQfxPdNOPBfparSvHvLPio/jHlQVdE
         NUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690956; x=1750295756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0iMkhzgEkgnzNz7VpgQGchMjTI01cfv7nEZTNImKIA=;
        b=rNxrT2kFM2gkvlSbcJEbDNHQXQz4WpDH4fw/E46MrM1HO+OKgyVsonewnuoGBJgL4G
         qWM4FRf7bmCp1IxDd9Z4HalqpJIwp4BypkXBQ6F3Eeq4pvvJBk9IqWkdkSEmj5YiHtro
         OAHUgjHmMPCktLII5RpjKCsfWdh0S4KI8NIUPAQECsS0guaXIiMbvQ+qv5fiNnE3Iuhj
         SWqMeKThCfO93lKnu1r70NTXKK0NrxhvHu0MpS3bH7d3eekhSW6XZzdEszlQLDQIB4ZN
         6Sjoi0Oc32BX7YH3GhwWHWSTmv7zQDqDOob7WlY2c2nfFHapJxo5PFcgOlbuI8vAJPC1
         vkLg==
X-Forwarded-Encrypted: i=1; AJvYcCW5ysgUU/V0PCLh9sDlK2zTVvSeDXmVN/ylIp5G2IxTcliRp5WuQGnRnA8Yg1VpeOOrHdkGJQXVJn7Je65K@vger.kernel.org
X-Gm-Message-State: AOJu0Yxag9mnhijSeJtVxxx4ye6H8I1Bcf7Qw7g9tq2sX+GzPhVYWahd
	bJ3+aJE/+5idm2OVdDccsRc8SjqI3OP6wGjb1OlE4eAlAF8kILIXcwWSZps4ah7pLao=
X-Gm-Gg: ASbGncuHqJpA/ZJi7OZiv7EmPVV9HqNaRdw+aK5lmITfuaiQ6qiY6abECB8r8kJO7Q5
	1oo91xbZnLwG2OdH6F83J+c4gdfxUIgcSQZYCmzMJ+4EYnXJ+lauOwvZe2eqAx570TjIadhrVls
	pYCHuD+yPYiVCXPNq4b3WHvaN34Niawf2VlagsdGEzRVrHoEG/SiSULTun5VdWLHxRant8oTeR9
	o08SAFuTwdBYXD/u3QepM6Pm3e33Y7g1qJiWwGHK14MqY17JwDMNeoOvBNZF4dnFljzerubbYjs
	R62y+4sKjVxbrJtFF/wpkmFFQqpmsdFMHA9f4UoQlRPdHTFLwLHIxu549QVEHFPWGfA0Kl26PNC
	PLRSncCzG7PekzUCfBqm2NiTYI+xHdgOocS8p7Z4wrG4kSaS/j54=
X-Google-Smtp-Source: AGHT+IH2ZVcSy/XT+P2sjhcrkyYbmgicFFUm992Rw/xmvLwsvTHEafUlWtKGMTeH3cdMFAbAsWhVRA==
X-Received: by 2002:a05:6512:2206:b0:553:297b:3d41 with SMTP id 2adb3069b0e04-5539c140937mr563611e87.8.1749690956123;
        Wed, 11 Jun 2025 18:15:56 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:55 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with new CSIPHY subdevices
Date: Thu, 12 Jun 2025 04:15:30 +0300
Message-ID: <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following the new device tree bindings for CAMSS IPs introduce csiphy2
device tree node under SM8250 CAMSS, which allows to perform camera
tests of the model on an RB5 board with an attached vision mezzanine.

Note that the optional 'phys' property is deliberately not added.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
For testing only, do not merge.

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f0d18fd37aaf..401a32679580 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4613,6 +4613,10 @@ camss: camss@ac6a000 {
 					     "cam_sf_0_mnoc",
 					     "cam_sf_icp_mnoc";
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -4641,6 +4645,16 @@ port@5 {
 					reg = <5>;
 				};
 			};
+
+			csiphy2: phy@ac6e000 {
+				compatible = "qcom,csiphy";
+				reg = <0 0x0ac6e000 0 0x1000>;
+				clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+					 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+				clock-names = "csiphy", "csiphy_timer";
+				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+				#phy-cells = <0>;
+			};
 		};
 
 		camcc: clock-controller@ad00000 {
-- 
2.49.0


