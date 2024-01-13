Return-Path: <linux-arm-msm+bounces-7164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B718D82C993
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 06:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 418CA1F238FE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 05:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3230CF9E6;
	Sat, 13 Jan 2024 05:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mr4hvCWC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5455D12E56
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 05:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ccb4adbffbso83420851fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 21:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705124563; x=1705729363; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QOP792ToKBpSccev9vxQctAneEofXtQ960cKYhNIK/4=;
        b=Mr4hvCWCiUajNf729/E5Vn/k3efzG0WmCGVimtzItYaPoGoMXo1/IHSX0YXJ140baT
         QSD/dq1ZcbWedlAnmjI8hLeOZKloxiDxmRuozYiZUlTLExXV/7yEZlpFjLvRU+JQ3QeG
         +vTFYlNYExkPykN6FSL8AWZUUP7eTy7joL9xvVYNqaQW4MDTPCa/LJykemsEpjGVI4ci
         QinYhwqa7hAij7xKvE+MSe6sZKp4+LQHPHtZNBrgSTm0whjP1/QxtGh+3ub+8XqnKJ5L
         bC9+J2vP0m4WEQCYZsdLscA6KFCd5e4FGNG3By8qznqu2V4U+QQ17sCPcvxIDGxWHZDN
         bTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705124563; x=1705729363;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOP792ToKBpSccev9vxQctAneEofXtQ960cKYhNIK/4=;
        b=HVYXh3FRUg2+Ds/1xQW27FCvoRg3JIIF+f0I/TfgEKl1RkYIAdEN8RoUUKebrxP/ce
         SkBjtzen65Y3Pwxrpdyukq/n7fjI7TDvQvM8NqX0mapA1+VmgQFBEYjmu9wl0LqqW2P5
         7D2YkfBcoikjrJw+z2Zwq2To3ZuFMmHarAOOPAlCV/IsTr3uSACDMBLrY1msJE/miI2O
         gNlbV3t6Bl7CWKbusCg/25n533mvlXWaZo1QWnXC6tQv3eDLlPHf96rle1lpHVqFsGUv
         3uMpmfRWtKgdnBU+ZSPD/+V2hqlVPk53R08ezWH2/QcixEyzpizLSM5H/Ld9GZNEwqG0
         KDdg==
X-Gm-Message-State: AOJu0Yx0WlUCk1Wo36tgshu2JXA1jcwE8YH1iajOZdqHPwrF6IRYJoiG
	lNb76yOCVchd+aufDUhaj5jeTJHeo0EcVg==
X-Google-Smtp-Source: AGHT+IFwCgekZWlNnDV2eOTshKrBgIyOrcxe/8+NArIpcWWS5B+j6guQX/EDrLAEYzfxUnHQeW3aoA==
X-Received: by 2002:a05:651c:332:b0:2cc:e3ae:1ca9 with SMTP id b18-20020a05651c033200b002cce3ae1ca9mr1077711ljp.1.1705124563014;
        Fri, 12 Jan 2024 21:42:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020a2eb616000000b002cc71e9168csm677719ljn.129.2024.01.12.21.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 21:42:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 00/13] usb: typec: qcom-pmic-typec: enable support for
 PMI632 PMIC
Date: Sat, 13 Jan 2024 07:42:37 +0200
Message-Id: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM0iomUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQ0Mj3YLcTDNjI92SyoLUZF2TZHNTY2MDSyNjC3MloJaCotS0zAqwcdG
 xtbUAx5O2L14AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2662;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=khqa4i3wX3Fe7VocE+Dlxwa2qBKuZ4dGSNroLXygiZ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBloiLPI5DTQpVj1TOXfaIjSt8yYe7R7w8rWhax8
 hbY6NdeVouJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaIizwAKCRCLPIo+Aiko
 1RnWB/98WVdNe6uelq9oMopvGDy0u/89qtcIsNY5fVhy1U6G55QIXYGAY+5M7TWUXfKKtcR2wEg
 R5P+6xq/fw4oq+FyEBq7qeuBqhvLtFzJfNqBlml/zocmn2tixkoEhCgs595nNZ3EICZlPzV1mWb
 p8oxxslyBjFpaWWP/vv4kpkUjsT3k/L5Lghrrp2YMQhg83J+Tplp1Wh93XVxZFXJ0VVconT8X/4
 lKT82OiaMD2Gomhqq2Kx+3aVDY7uLQKKZJW1f1vfA5P5txoEJEatFnZKf69KfHdpPXbLWJe0wsr
 f4HfuukEb8flgwcD1/EbXYrsN/QyemNPxyklfkjnXojlAntx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The Qualcomm PMI632 PMIC (found on Qualcomm Robotics RB2 platform)
doesn't support USB Power Delivery. However this PMIC still supports
handling of the Type-C port (orientation detection, etc). Reuse exiting
qcom-pmic-typec driver to support Type-C related functionality of this
PMIC. Use this to enable USB-C connector support on the RB2 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (12):
      dt-bindings: regulator: qcom,usb-vbus-regulator: add support for PMI632
      dt-bindings: usb: qcom,pmic-typec: add support for the PMI632 block
      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: split from sc8280xp PHY schema
      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: support USB-C data
      usb: typec: qcom-pmic-typec: allow different implementations for the PD PHY
      usb: typec: qcom-pmic-typec: add support for PMI632 PMIC
      phy: qcom: qmp-usb: split USB-C PHY driver
      phy: qcom: qmp-usb: drop dual-lane handling
      phy: qcom: qmp-usbc: drop single lane handling
      phy: qcom: qmp-usbc: add support for the Type-C handling
      arm64: dts: qcom: pmi632: define USB-C related blocks
      arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm6115: drop pipe clock selection

 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    |  171 +++
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   22 -
 .../regulator/qcom,usb-vbus-regulator.yaml         |    9 +-
 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   |   28 +-
 arch/arm64/boot/dts/qcom/pmi632.dtsi               |   29 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |   60 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   39 +-
 drivers/phy/qualcomm/Makefile                      |    2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            |  323 +-----
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1202 ++++++++++++++++++++
 drivers/usb/typec/tcpm/qcom/Makefile               |    3 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |  126 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h      |   25 +
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |  155 ++-
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h    |   92 +-
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   |   67 ++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h |    4 +-
 17 files changed, 1805 insertions(+), 552 deletions(-)
---
base-commit: 9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
change-id: 20240112-pmi632-typec-4c7533092387

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


