Return-Path: <linux-arm-msm+bounces-7459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C47583077A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 15:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 616C3286D20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 14:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831752031D;
	Wed, 17 Jan 2024 14:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XYGC07rN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FDE20308
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 14:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705500268; cv=none; b=OADu7vHctqoRQudRVbx3ozbMzZsl/T3DZcoYcyyhanSS8z335p6et40dRjaRQvEf+xJnOGJhyJO7hO9x6HruGVcu8W8wDo9lLRYj4Gc4t7bstIDgOtk3f2E404diEFtWUSIFhJrPH6hBtGJpVHx4IgQYQ1ZkrVQ0+/3oTMpcueo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705500268; c=relaxed/simple;
	bh=x81CLncY/hIwp8vTAImj73oz1jLkJ9NlHddtBkJ5pxQ=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key; b=FzTWf1/rkDaG7xwXjvDFJcLApB02BZfGF0zwJqcZVbZKhd8HkeFYd0mGE5GU43MGz9Y4NGgC33zWIFzdXqUZzCE7johWnHDZEG7KKDsEU+hFyLXWyJb8yCkSCQC6GBM2/cg2EpoA4Vts9IM6EKr1vBaXKsojc6ml0sT4p0ZCk/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XYGC07rN; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cd0f4f306fso129286841fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 06:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705500265; x=1706105065; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5/B2R8i2UwNaK6kv0GcOo8eHMF4ro6wVFkh1Kz4AGgE=;
        b=XYGC07rNWGNeygnfthdtlwQo1VLHIdjAqFr1Dwnb9VWyzEirYtcM1FBvnsNSytHuPS
         xeONhi2d4HgUTvWe1pATwNuI8lw+hEqSDm6IMY4pm1lOP4bZK6LFpEkVC9fc2oYOdUuF
         awLUQ+3TGJDk6PTl9eE6wwmvTAkP3wwXiPiU44A4RnAP7/gXhLSa4FAu9lXeLfaN5CdK
         pB7SerXmlBf558fYSSTOgD2edgJasdek8oOBlnZliUYZHCRhVbb++cUUmUX3rq6VNDmE
         /i4CzXJzQ5lelKhguyYojXCP/PlWwdtl6HoEAis+W462B5IpoJjizYDJLS2/naS8T9PH
         C/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705500265; x=1706105065;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/B2R8i2UwNaK6kv0GcOo8eHMF4ro6wVFkh1Kz4AGgE=;
        b=j+fxM3WRBEV87Q4pIxb8tC5dRNlduo/rofABWPYcMCDRZlQoTfo0I9DyLLsKH0t+14
         0W3AxPfufvJQo99MOZcRPI8Nkz4KLUdcGu509nv0jxSGnlFt/JXnadiZGPvIen8rOl7q
         OBfxS0m7psvpjGYL/gLqn+kmjPskq/n/6AnuTyb9XhdWX2mrJD4t75cMZHu6F0TheCNh
         JuL0bZ7UbUQTQ2K/bx7B4DxEB0LqZZIDDVOGeu9tSoB1m1LUHeJQWArq3N8i/JxDhqEl
         nXJznv8NeUO15A0WAfIoWLlWwzVxVeDCH1u5ELWFvodTYp+JZchRVPjV7zD8UiGpLhlK
         01cA==
X-Gm-Message-State: AOJu0Yy01qKWruUwMZ+Pt3p2+uLF3pyMvaa0dccaT+p3ZZxr3AO2CN8e
	hgWDpNFkcvz4/hCqF5QiuO52LayyOaQaSg==
X-Google-Smtp-Source: AGHT+IErux1sMeAqdhWkaZXehfNGakmpthvwi4xOe9yPto2lwcwykC6xj5+JSWU3lu5Nh2w3eKdPHw==
X-Received: by 2002:a19:8c58:0:b0:50e:812c:1acf with SMTP id i24-20020a198c58000000b0050e812c1acfmr3853287lfj.113.1705500264642;
        Wed, 17 Jan 2024 06:04:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y29-20020a19915d000000b0050ec7a26420sm269711lfj.204.2024.01.17.06.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 06:04:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/6] phy: qcom: qmp-usbc: properly handle the clamping
 register
Date: Wed, 17 Jan 2024 16:04:21 +0200
Message-Id: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXep2UC/32NQQ6CMBBFr0Jm7ZhOVRBX3sOwKKXQSSptWm0kh
 LtbOYDL95L//grJRDYJbtUK0WRO7OcC8lCBtmqeDPJQGKSQZ0FU4zv1GoNdMLuE2qlnQBJ0bc0
 46JEklGGIZuTPHn10hS2nl4/L/pHpZ//mMqHA5tTLQTV1S/pydzyr6I8+TtBt2/YFtBg4m7UAA
 AA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2555;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=x81CLncY/hIwp8vTAImj73oz1jLkJ9NlHddtBkJ5pxQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlp95mMacSd+CX45gkjTa81604OBU9Jbtyvkuyk
 r/u2D5gRKiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZafeZgAKCRCLPIo+Aiko
 1UHdB/40oZ6ZQjoG9rx7y2T6f4ugeoDywqi7KNkuDTEmJaRcLW/YG2rqMrB0/KUC2Sla5Z9suks
 A0EudD8KkMnCBVDo6TLI/A9fmfCJ9QeFLTI+sXPfsEQLtHDj6nGDHv4QXEiZnX818kRb9ToDaZ1
 riPwXHI4MHSv8sTdOqGtRWJvqPJZIMmpDEoKQl4xt9cm/Cf6Nikhxh9FGwfzo79w2Vq5QOUMduW
 H2HgdzQKXhs24gNbkU0mdQp6i43dZcmGTffjqjVwZGg9PheyS68Ngann5uzk8d2+R4qVb+tfQLr
 dD37J9lHnK0kkumwhsR3kfaWl0L67h3lB7H3ojpPSjli4KK5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The USB-C PHY on the MSM8998, QCM2290, SM6115 and several other platforms
doesn't have built-in PCS_MISC_CLAMP_ENABLE register. Instead clamping
is handled separately via the register in the TCSR space. Make the new
phy-qcom-qmp-usbc driver correctly handle the clamp register.

For backwards compatibility the driver treats these registers as
optional. They are only required for the PHY suspend/resume. However the
schema declares corresponding property as required, it should be present
on all relevant platforms.

At this point I'm not sure whether having a single TCSR-based register
will be enough or whether we will have to add more TCSR registers in
future. In order to avoid repeating TCSR handle (and having multiple
instances of TCSR regmap in the driver) use qcom,tcsr-reg property
rather than someting more exact like qcom,vls-clamp-reg.

Dependecies: PHY-related changes of [1]

Note for the backporters: if the patch is packported to the kernel
before the phy-qocm-qmp-usbc split, the phy-qcom-qmp-usb driver needs to
handle both PCS_MISC_CLAMP_ENABLE and VLS_CLAMP registers as optional.

[1] https://lore.kernel.org/linux-arm-msm/20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed the TCSR region definitions (Konrad, Bjorn)
- Link to v1: https://lore.kernel.org/r/20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org

---
Dmitry Baryshkov (6):
      dt-bindings: mfd: qcom,tcsr: Add compatibles for QCM2290 and SM6115
      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: add TCSR registers
      phy: qcom: qmp-usbc: handle CLAMP register in a correct way
      arm64: dts: qcom: msm8998: declare VLS CLAMP register for USB3 PHY
      arm64: dts: qcom: qcm2290: declare VLS CLAMP register for USB3 PHY
      arm64: dts: qcom: sm6115: declare VLS CLAMP register for USB3 PHY

 .../devicetree/bindings/mfd/qcom,tcsr.yaml         |  2 +
 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    | 11 +++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  7 ++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |  7 ++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  7 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 48 +++++++++++++++++-----
 6 files changed, 71 insertions(+), 11 deletions(-)
---
base-commit: 3cbd23fa6ef85801574a4b0d3f81fb365e06b2d2
change-id: 20240116-usbc-phy-vls-clamp-10189efdcf12

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


