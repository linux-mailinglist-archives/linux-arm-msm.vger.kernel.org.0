Return-Path: <linux-arm-msm+bounces-55077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C702BA980F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04A5617A6F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 07:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3801FFC59;
	Wed, 23 Apr 2025 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TICk2Rj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31DD26B0A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393440; cv=none; b=bLIlVmLXC9vOPuElMO7gAoImIDhuXb2Di9nbs+66R+jE8kxAGTTWXjqBgknRLO1VJ4f/zBDSM/01nvjekZ4G6TZ8v3o06SZxMzo77rB000jQDZfRPQaomwfy6z6wedgymnqw+9shz6s6erBN0hN7kDIyogspnIgnDy+ZtWUbzxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393440; c=relaxed/simple;
	bh=ugdh0Jwg8OtNDnnvSXX+JcwFs/E/9kEcCZ1PVSsw1oo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CPWIUdY+s/CGn0kVPdJIwN/+QsAZFPIkpDSq7J+ukwnLfSg/z+IZLq0OwsKNbj7sPgEBT3DQlJBHCR7jGyOliT7oHc0UYI/TEzsHZXkH3ZGsj+BPtPfykbx+PLAMVVbbGu7bgIA4Si+bwlJE19hV1dmC8jdrR0uPULu4iTPs3uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TICk2Rj1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso64766995e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 00:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393436; x=1745998236; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IAVOf9WwZt5yb8GSwQ0W6u8pvseS1B6MX+loQMEGJLQ=;
        b=TICk2Rj1l2YRJmLdqOz5FZwY43nDW2Lk32jG8grGPWZPJneWLq7G9cL+ffkwAclNsE
         Rz/0Atm00/xafJJfGnHaNe2rSY6AuE6tjc6Hhp6UM0r+MK++tJP+rRntbBXwS1lHPtt8
         lt8rGmFOCk2ElOs5VUEHS2Ck+7AjbUonhJ+FfhBLyIqSy/rd33MVj5M/rEMGbmfrRThA
         KVgbXeR2QkZA4ixX3D616vpaga9OH1g9mPyV4hVBiG2tgX6+WxByuzPQ7Qp12fSl8wLF
         RJAcoGFUTMYnfDVXD0ZCIGw4xWctHP9TbMho/W6aqwt08gDbOWBkSWuNmFab3/0hgqIX
         fOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393436; x=1745998236;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAVOf9WwZt5yb8GSwQ0W6u8pvseS1B6MX+loQMEGJLQ=;
        b=nE30XiHvR/wrVU+k0Jj5JjGBXGcfZpRBbyFZmeG7vRe7/4Gyzv/3RKTi5hpemIMyjg
         goY5bM0YAd/rOGzz1b9q+k1OFRTyBuNwUDkqSz/jqKo+sT4tXhGdYS6gO/Maa5JCdxVU
         t+haTKw15qC5MhpeNHw9n6TIzg/+8VjMVeoNGj79KzPFbtAgsGzLyDUEyTRKSRU2BJ25
         ptJGKC9WRrlRUnMf+TgPNsb7UHXFK8wuYlzHw/CT9PowVI2NsUVqU9Qiwh2HJBuK2EvL
         XQpsFlOYd5JDUKtzMNeL9Q/I1SXlrC3GkvTWWm4gt2LgvHdv+LdYgi302XHtiOGwYhmv
         w1EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIvRG0k0YQjr/LiAPCkaSYXeCNzRI7m+ncTPpGwNltywf6eKb8tNpfax0PZaPCiJeMA/xc5XpmNsQgphJ4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6HqWN/IXpP1CTMLf8awtW6k85AqaReXTAZonzCMx1qbbDi0fh
	yBOF+227/6DGVc+Gm69517tjKYKc3tb8KON5ToM27Uw0Wl7BeshfwdUddwtF6os=
X-Gm-Gg: ASbGncsxbxAzT4kpbEPn9auYmqmvNUwPT/eiOh65BOc7gvhVfQVKVElpuxJPUoCfzjx
	KlZjVP6Ni5Lf8Jrl3qwzeOEtgF6GLCqrKtKmd1/049mkNnmX8WjLSzpSC8GednbqPnO0473Jjsy
	Q42Qp2hLXnJxifnYB4sY9IGdpkr3Zsn7PpzuF6jFT3KlSCY3MfdMcdxGtVO9Py/VgubFHPC+PGc
	lvnyWS5V9vwexktQmNZDL1fooUMCkmOcHuSxTwYNdT4V6YXfbqe2PJlnqp29UVONYPs6oD/cOFI
	2b2vuumyuvEa+Z/OnrwvXg3b5n+GVWYrXEeKvngX8Maf5fEtSXRXYkk=
X-Google-Smtp-Source: AGHT+IFDeOQJ84DRhqUsU2I2qejWhkxN7owbw0EAeDx/ORw4YLo17BdfeLQzG90l677GOD8n8erpdw==
X-Received: by 2002:a05:6000:438a:b0:391:298c:d673 with SMTP id ffacd0b85a97d-39efbade41emr14796194f8f.40.1745393436055;
        Wed, 23 Apr 2025 00:30:36 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:67a8:3ed8:e19f:5eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493115sm17761699f8f.78.2025.04.23.00.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:30:35 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/6] arm64: dts: qcom: x1*: Fix vreg_l2j_1p2 voltage
Date: Wed, 23 Apr 2025 09:30:06 +0200
Message-Id: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6WCGgC/x2MQQqAIBAAvyJ7biEXw+gr0SFyqw3R0JAg+nvSc
 WBmHsichDMM6oHERbLEUEE3CpZ9DhujuMpALXWtIcJbM5bEG3o6sER/zdUx1GvnrLFke6jpmXi
 V+9+O0/t+/insk2YAAAA=
X-Change-ID: 20250422-x1e-vreg-l2j-voltage-4281dd747278
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

Several of the Qualcomm X1* device trees upstream specify the wrong voltage
for the L2J regulator. In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is
configured with 1256000 uV instead of the 1200000 uV. Change all affected
device trees to use the same for consistency and correctness.

In the other device trees upstream, the voltage is already correct:
 - x1e78100-lenovo-thinkpad-t14s.dtsi
 - x1e80100-dell-xps13-9345.dts
 - x1e80100-microsoft-romulus.dtsi

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (6):
      arm64: dts: qcom: x1-crd: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e001de-devkit: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e80100-hp-omnibook-x14: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e80100-qcp: Fix vreg_l2j_1p2 voltage

 arch/arm64/boot/dts/qcom/x1-crd.dtsi                     | 4 ++--
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts             | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts  | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts    | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)
---
base-commit: 39155a896925c3af2156ad61e821aa9fa5a1dbdb
change-id: 20250422-x1e-vreg-l2j-voltage-4281dd747278

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


