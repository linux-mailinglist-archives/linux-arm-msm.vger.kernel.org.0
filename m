Return-Path: <linux-arm-msm+bounces-9432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CDF8464AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 00:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 455D01F24EAE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 23:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A767F481CF;
	Thu,  1 Feb 2024 23:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qvi+9qpG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DFF47F70
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 23:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706831720; cv=none; b=eWQhdEj7AEjTMqy21oQeO9FOMuMVDGlGb+7cH1gTQ1FCRxGyPhlEPsswfxaxnYWyfrflYf2IoH37zS0OGMgwM0xGjckhLTin7SsAOIyXtukgopNjR9HaSujjz9ab8AouZ64B6FuneccxiyLNfO8E2dh7TfzJzyH9iLVihhfs4f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706831720; c=relaxed/simple;
	bh=4jNJtZnPI95XjT3oDDrW0h7IQ11rNS8ceBCYEyg4pag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uuMKZ2Lj5hFGRlIlniSTHJ4tIUB3Uu/2Q7ueUCeGQVbDnTO6Fin3pl8rihzzcn317ezBX0EHoXzdOCy22Gq6rW0F8jj9iilWkuNgoOsOEcPtD+WeeX8RMmyP2cptSoUVnnsww4lKMDU9hfzGzf3QHtPeIt6/nmQwX8wgA0LnyLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qvi+9qpG; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51124d43943so2378412e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Feb 2024 15:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706831715; x=1707436515; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6T3MqInwvAQNNy48W+etABzBeRrCahm3edLe7dCeT1c=;
        b=qvi+9qpG4A0U8Yef7EqwUWlYBCZw/HHoVzMzxIHqFnOsMmqKZa6ghp2K/buJwiWlkN
         HS4VmITPwxi5jZWLVxX+CgvTUwdpo6QnPDwSzAJmf46w23sv4yAoFBpm8FXhZcOvLT27
         7SJ6X4/g67DWX0m0MLugWyZLliWXL06o0aMBBprgqbF52yk4KQxRVz5JQ/z+Dnd2YuMI
         wNOmwvV0quaukl9sqb3MyaNmB8v0fFtOs2tVUTYN61xUuy0TYcfGdfzh+L73NOJ6/v97
         ffSKND1FCwX3Pa2cknzyZ/i5QHz9ygQfM6kGtsZ1jfWuoH42Jxl1y7DxOlqGB/4M0Chg
         Lmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706831715; x=1707436515;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6T3MqInwvAQNNy48W+etABzBeRrCahm3edLe7dCeT1c=;
        b=nAPEFkLC9pEtYNT/79DQQC8jKgUuPeBu8mQ7N3PpZzcEIdA+xQrieln1jwqQlRibkk
         FV5yXVYd+vJrndHyRtmhRlyx2NO3/S3yDP9Mj8t63mPF/NLRn05fiNNK9u9CaziP1Nmu
         o9H1BKkNaXLWj4LdeKUaOrg5GsjnSVlbO//U+kQ6ESBs1sWPZZSfIsrD40oYU2KkWtZe
         eQQQvjoed6pBKTu/2qhBb9ZTOS4d0tPquc7FraQrKbwgaJNctr0dfw8iipXcRf/7idoA
         KNOIofp4Yzn8mYEXdjiuXT8sFUiK1mUdU8bdJLXEjV75QT6F0/HOkRKnpX8HO8gMtayN
         46aQ==
X-Gm-Message-State: AOJu0YzYV5u1+FXQifCtsZteMCpDIPCBzDQxj4vD6PYffaQtRyUgFuIz
	eBwn1MxlKbMO3oMtV+d0FxgeZboWLJYVUncT1rVT8PJwosIDPze81N9Tt0BACBYpRJc5bhJG/FH
	s
X-Google-Smtp-Source: AGHT+IECNYN4qV5NThcfu+WLmf8Ps73qcn8L3IBo9f1k/ekHTZ0yyeryxpvDzjUmgBGYOpQBV4/AkA==
X-Received: by 2002:a19:e052:0:b0:511:1dff:f61b with SMTP id g18-20020a19e052000000b005111dfff61bmr252770lfj.5.1706831715195;
        Thu, 01 Feb 2024 15:55:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVJw7F3Y/EIejONVZPHWxrkLsi9360V14iBlj3avHyp71C2nbhLM/DezEyJvF1/iEcaK7sZ6Avnbr8swAT2OA60DcYyoOD1KFBcm1NQglI1KbZa3AgKaGPStNjme6doLC9wZZqro1AlZCKxYPmT3PP3R7nmqtBJxDZ9IhcO/4tx0zIV15bep2mic5disdds9oqzcL99x21hLZTcpUlc8N1aJDSGgnQQ4WuPKCjxVIDLqasv0/4it0nNj87MQI40xREceZKsMGTLTplSH0rG3XJHsY3wcGUWR3NVAEQY1Dl61TQMvdpFkzH9WewbmB5b9eqPkFEBXGJTuTN+MYQSI9B99gImcQ9+ZZSFmyyDj/wE4RCKmzgJfOX3ApmSr9lTgw5dd6z3hyVVUDMoaPWNrPN6I2lLyp29H2jsVVOzJYUwWD4vcGZ5+jN0cvLfwc4Hwc8LGJROOtGhvuy0QZAWKJ8/sCGAlSs=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u13-20020ac24c2d000000b0050eacc0c80bsm106754lfq.131.2024.02.01.15.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 15:55:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/4] arm64: dts: qcom: qrb2210-rb1: enable Type-C
 support
Date: Fri, 02 Feb 2024 01:55:07 +0200
Message-Id: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFsvvGUC/1XMQQqDMBCF4avIrJsyk1pMuvIexUWIUx1ojSQSK
 uLdm0o3Xf4P3rdB4iic4FZtEDlLkjCV0KcK/OimgZX0pUGjrpGoUfOrJn1VyzqzV8Yg9tajdey
 hXObID3kf3L0rPUpaQlwPPdN3/UEX/IcyKVRsekTbsLaW2qdMLoZziAN0+75/ABgBG+upAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4jNJtZnPI95XjT3oDDrW0h7IQ11rNS8ceBCYEyg4pag=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlvC9hNGYncRbWs6Uw18ZfM3Y+mYzfksq6c9+rA
 uNYU/5QRAaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbwvYQAKCRCLPIo+Aiko
 1RxWCACKNgxBFKoo3TLm0wm/vgj1dWiUCdk85v7FE/oAEXAjO8SjXnnDJWZCM0pthw+wbyVUaXS
 RzncNUVv1/QDt87TPBazta0bTCaa62pzDH0zrPd+rYaTOu35l697Vo11ntQHoKI20daLG3ZgCWW
 9OFU8TVFVFTJU229Lvt+8Dqd6LD1iI6BWpLU+oxI8VzDbtxHUABiYEF0rih98uW1F4B8/p7aHoA
 P2hvZ2IqpBz6snnl3aJgd6ha//yjBJ8Za3zf2CtXdKIU8aZwWIFmJpa3cSKFg2WDzx/AWuX1XYO
 kD+nWpMGC4rF8z0xVyFREiWh4+6Vu8K5M+DOMCOHurbgDLDi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
Robotics RB2 platform) and implement Type-C handling for the Qualcomm
Robotics RB1 platform.

Dependencies: [1]

[1] https://lore.kernel.org/linux-arm-msm/20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Removed unnecessary conditional expansion, covered by existing compat
  string (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org

---
Dmitry Baryshkov (4):
      dt-bindings: regulator: qcom,usb-vbus-regulator: add support for PM4125
      dt-bindings: usb: qcom,pmic-typec: add support for the PM4125 block
      arm64: dts: qcom: pm4125: define USB-C related blocks
      arm64: dts: qcom: qrb2210-rb1: enable USB-C port handling

 .../regulator/qcom,usb-vbus-regulator.yaml         |  1 +
 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   | 12 +++--
 arch/arm64/boot/dts/qcom/pm4125.dtsi               | 30 +++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 42 +++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 60 +++++++++++++++++++---
 5 files changed, 134 insertions(+), 11 deletions(-)
---
base-commit: 10fcb85d581e1d7e592a5db0efd45c2954a262b1
change-id: 20240117-pm4125-typec-8800d9c09aec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


