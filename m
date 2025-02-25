Return-Path: <linux-arm-msm+bounces-49252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC50A43A93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1545318977CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D54267B12;
	Tue, 25 Feb 2025 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ObBrCYqc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E99265617
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477560; cv=none; b=gTDIZwgr+SUIDbiJOFpU2Pk3rsdXBdNY5aFOsgSMEX6yoM0WUL1JFD5xYs/qSAx7G3PJc3Qn8HWq8yoJCIe1nYDeKgysZaufcZLBfWsMcCiQC2HO6ntjmjsIkrqeVzTa9reTImJ7PBUlzj8kRBLj8C8BNMyBG6n8tGwRI/igIcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477560; c=relaxed/simple;
	bh=MUGXBiVnIGY1MT8QYBDyya3ZpnHbf083QIObBWfqJXw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lrCN1roDwLuHahBVpmZh4H7mzQDdt3oQFbeYPjQBT/06BhyUgAnUpp94xKK1ewBx4jrR93jfUHCE/nxn45LgcdxPpewFTT54yzNDA89lAfR7yACzJjo1yirbRonWVW/W+5o41Ex9TmyvDvQ9+h6G32bwlVASn9uX6vP0FuKONWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ObBrCYqc; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abad214f9c9so100200266b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477557; x=1741082357; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GtmskCdb/iQ5GUNmqz9p8e4yoK0c/+1oJ3xektzG9mg=;
        b=ObBrCYqc26tayL6HhMkNY+gHqWK2MkF97fkeZuRpmIQ13CGNmlcqTEdxFKougcSePW
         3KzM5KkVdCgU+Bnfk96lZX4VUjEmAis9ZzPf4EYZ1bpnvtaoE8OMGbarzs+c89YFvmpL
         I3tMHZ/4WI8gjq2Lnl98hqsGX8hazLW+E/McrbqEQptztWHrVl6ggWiRkR+ZP9Bev/zY
         Kk4yU4F526JSdoe5NNjnk/GGvfdWUXx5uz/jdvvLH+9Q5Nut1sH7v5oiQJPpDNQyk8ql
         P+NybMiLLu3A5iM6yZ9dRW1fjIdX7WistIFhjVPbYsjSyA6h7C42ltamdUXaKJ6eALJX
         LnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477557; x=1741082357;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GtmskCdb/iQ5GUNmqz9p8e4yoK0c/+1oJ3xektzG9mg=;
        b=UeospOm/iS2NEmpN+aU/oRHEp3eguYzjBJ8TnpfWnL1arT/gDrQBiOG/QoW4uQisQu
         mOhUQ07vkA3jGM4UIc/Lt6QbwvGBS7eXYne9LHk8z262+ubsvZMXKLjc+N4GJVT3w+kp
         fp46OVnwSwhqtyc02V0Rx2Noa8juFW2svSbISbC5qaH++HMH/OnaFEUD9PywnPxZ5QwI
         ptlcjtwPsYMJIe9ZDhddaroG45X9buc8CIGOn8NGpzYq0rQeAT8gIyiamz9dWc2ZAAqG
         LfPDnfLfpsyu01nIDC+vYsDuwql5DXqC5/Z3S/Swq0d97HC2UWRAAKAgcPT+Gx4mw033
         RnpQ==
X-Gm-Message-State: AOJu0Yxyo4uOKhD9PcZDPT87jS9w8XOgJlLlYG6nCehiHrfZYUyNdISq
	5BgBIHqLPMefRPMGHntEsQyqVrhJn2hmtE+oJrDa0GPwHooKM5wRkkpegk8NcTQ=
X-Gm-Gg: ASbGnctqhoh+q0QC3ip/gTqjkVmzogzp5giXsVY6UKdtaStsiXKky+XLMNbKgPaA8XJ
	0dLafslS9sHygSFToARJ1l8bjDPhH3CE1vvpw7UHA3Co23hYZtrbD2NYxSP4WVH63eIqS3Jifzg
	9stsdrbOeVQgMv3xW4Ars2BD9O3ho8nQZT4B9tXBR0TLjB/IepQ0n1TdrgTANt84IgY38nT8Xv/
	IBR1DLdLDmI79/8PiWUPcRlsLsa7tgKnkNNEgJ6fquzsksWfvY6D7HglKq9qD/Dj6e/lh6/FjDS
	R5XZVQ8nLau2XWoyJlp7Dq3D4GcHGluO4m6NxLZx2mxdHSVdpiH//iVaEWlkijGtFnJ9Xk3aE14
	I
X-Google-Smtp-Source: AGHT+IGDjCixQUyWlzIQLqe3gqzlo7aQnUb86K/bmLCpIYFi5mYm2khOJB9PgtIT1SeuhmiIo1Mu+Q==
X-Received: by 2002:a17:906:16d5:b0:abc:37ac:6e6b with SMTP id a640c23a62f3a-abc37ac700emr359930266b.7.1740477556598;
        Tue, 25 Feb 2025 01:59:16 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d59391sm115164266b.56.2025.02.25.01.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:59:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC 00/13] arm: dts: qcom: Switch to undeprecated
 qcom,calibration-variant
Date: Tue, 25 Feb 2025 10:58:57 +0100
Message-Id: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGGUvWcC/03NTQ6CMBAF4KuQWTtJKaIpWxMP4NawGGDQSZSft
 lYTwt1twBCXbybvfRM4tsIOimQCy0Gc9F0M6S6B+k7djVGamEErnSutc2y8w7Hun/iWVrCmh1S
 WfGwhZURKmT0fsxRif7DcymfZvsLlfIJyPVoeX9Hxv8/GFMmGVOv64vwTgaxQ59FoUtqYnI05F
 CGFcp6/3bM6scoAAAA=
X-Change-ID: 20250225-dts-qcom-wifi-calibration-a3aa0094e731
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4217;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MUGXBiVnIGY1MT8QYBDyya3ZpnHbf083QIObBWfqJXw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvZRmd5HI1MARMgl8zz2aBH9HbWofzZqU3QOVc
 otd4aOJbpmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72UZgAKCRDBN2bmhouD
 14RfD/wP3KVKCDKm4roFcw0y4f2OntDqw7r5AJiTLKQeTUn06L4cpAEny7TUMpZr6TR3U5Hnc2Y
 u5BF6wu3ZTZkBhzgmt6ABwJEGaAXM4zP8/4WfbwZUm5oqx02PtWrj2guOeLQtXXmbQNMD1lil/X
 jMqPjs5At0M80k2xHvZFlk4v+YDr71Ej4QlDmqhaOSjbRPqADeDSzTZTreV3l2x+4USoeTe+TFj
 +NF9iir2a8VRMAYrRflYYj5gk0uXw3C9ZVDSF3lYewoKXl0gGlz17v/XJRIdgbyQdvJx3lXkqkk
 Qh974aYnbabLIekkNeZj4s4+2qu80ojHNH6qK6Ng2EYd/pA06cwBb2UCHkaO46SvElcxofCSJXH
 8I1jOx8RZAxBvkBN6lTnoKZ7LGcWdm91CgXECSqhvdBkNaFmjjjIlzSszTbyOwCSjQQNNothsxt
 V1svPwCQsNAgEmPw7Z/RiN/l/ds0vw8DpJ5Yx4AUgMKMQChnZX680loQFgLRWiuAPIwW38b4Glm
 vPrASCx/u3gkUfziXooJBxEjHbiFn75s+qi5kyuCHIqqs0IYCCqbcAUjKabyNoem40s5RQPnX17
 /FN8PPSSyISkq2qRSiR/lpnU/Jz0K65Kh2Ug5M+OVuIbIcNtW0LUIPB1lM3+DS+X+niNG7yC+nI
 DNmAsRLhdLXROcA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Dependency
==========
RFC, because this should be merged release after driver support is
merged:
https://lore.kernel.org/linux-devicetree/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org/T/#t

Change will affect out of tree users, like other projects, of this DTS.

Description
===========
The property qcom,ath10k/11k-calibration-variant was deprecated in favor
of recently introduced generic qcom,calibration-variant, common to all
Qualcomm Atheros WiFi bindings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (13):
      ARM: dts: qcom: ipq4018: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: msm8998: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: qrb2210-rb1: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: qrb4210-rb2: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sc7180: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sdm845: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sda660-ifc6560: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sm6115: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sm8150-hdk: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: qcm6490: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sa8775p-ride: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sc8280xp: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sm8250-elish: Switch to undeprecated qcom,calibration-variant

 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi         | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts           | 4 ++--
 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts       | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts                   | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts           | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts               | 2 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                   | 2 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                   | 2 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi                 | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dts     | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi        | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts     | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts        | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                 | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                    | 2 +-
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts       | 2 +-
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts            | 2 +-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts          | 2 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts                    | 2 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi   | 2 +-
 28 files changed, 29 insertions(+), 29 deletions(-)
---
base-commit: 0b711700b3e432d036512ecd580d1312707a11da
change-id: 20250225-dts-qcom-wifi-calibration-a3aa0094e731
prerequisite-change-id: 20250225-b-wifi-qcom-calibration-variant-92a02995e996:v1
prerequisite-patch-id: 3d5e2355edb04751d04c86263d1aadba0f309fc9
prerequisite-patch-id: 939f220d1859ffb79d2d74d38b8ebdafd5e11925
prerequisite-patch-id: ccc166b6ad2f1c967750b06bf6ab543f22590776
prerequisite-patch-id: f05f46fc9b19b4b48114950c9c86c849e52fbfca
prerequisite-patch-id: 3c61783975dc22358e7817c8ed549334135a2d2a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


