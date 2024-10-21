Return-Path: <linux-arm-msm+bounces-35211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8969A6380
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A14C1C21DE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6118C1E5708;
	Mon, 21 Oct 2024 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sJ3YCqw3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478281E4937
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 10:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729506795; cv=none; b=r8fwwjTfFe428pitln6LZkMIq9Ws62sDa+l8tCJ1sYjDPANknW8YegHckJIvso8CPj+gmZfESNqOzbUFgjg3TVeT04RLrfh3/S+ZD7nIiLcqWeDF9RelP4gy2L5XZzvIlAF8N24bgzRS4lZrdVUv3M4goxojHDuiwAVhe6DdAvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729506795; c=relaxed/simple;
	bh=Vq2O95x6e7Hs1DzKvXYDscSROlBA9dAz4qml1ZBzo4k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XaAdYLqwJ4/eM5sj8oTq0XOYao02edeIx+Mi8iw65yGDeG0KZC/GeHmNWRH21OM/9BfQ9sfl2TX0QaZ2Fyv3I+kvaE8ocHcUlJueELMnmFNRKRP8WmaCltL0R/WeD0RQhy8PDIZakjvKKCFGfzh75knFrGkL3L2z0TNwGEgw44s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sJ3YCqw3; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e59dadebso5448076e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729506791; x=1730111591; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UTXT6Qy0j2/Ntg3Z49e6WSEz/eZy8Jlw8PKip8owHHU=;
        b=sJ3YCqw3amNW0osDV+u5MxV1qVtBJ4ToD9wymUISqbjYh/UWrvOdVvK0iFuBhGqoXK
         aWMVJi0YEOJ1d6rqr6SYl/JaXxOlU0L84HWSi4ZgMBw1C2LA+kOrRQ7UdLyQ6iI24edv
         woFZx+Ja2yvKP0yVkR4fdZ5wr4KOrnlP+Oer0ol3UMuO2dJYqf2jqM0kyk/3K3ipQ2Cf
         I2f5kOxaYuLSdF3V32k4YQCZ93+o8a5Wbrv27HrLEuPhlyVggu5CaqOgjuYDcmR3WA4t
         VDxMw3b0ofC2wMMiCQwMTHW1GNZm7fbbGVI8Hv/wH5awC5NoI2qkCu4nnVRYy0dM01Gu
         cqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506791; x=1730111591;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTXT6Qy0j2/Ntg3Z49e6WSEz/eZy8Jlw8PKip8owHHU=;
        b=tvjuNx/4adIGmztXh/inS8tspP4CczaVKXtqOhMJro8L3pswcEtZIdWR8+FdQGxg4Z
         11ef+tisMrt4vFWtI2JHx5y4vgyca3kAcfMDWBbUgf+wkZyaAmqcrEEnMhBIv114dN/e
         WvjsdgSSA5G+0HdFwAtKAAhGGfQkSwlfBQKiGcyA6qKLLdXNWAljoOpKeEK5ku2c3Lu4
         yuuM1meXF5SoJABj/yEdyMfPuB1ckpWA/rrk+oPCyavWLh79fpzG6pt08QokpGbSECRy
         z6OHVdbRhd3faHrecmovZEG+M2VUFtkkts07J4tHxnkchvoXb0THJlDIIiDermLtF+wO
         gEMA==
X-Forwarded-Encrypted: i=1; AJvYcCUF4YfcqjhxUBS8H3P217WZ2qauP4Frw30khGVyJnvDRL/vIzu6q8TXp2uzP/useH38ltcTAnioGCfax015@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfyuv8chVevVVlyfg/eVkDDUQcjd/zhtT37ZnNxPyKZQaLBnuj
	l4lXAK1s3K93KPCkJ7zOMiTaNPQG63aQrfvabSI6LDY+BdpW/dXz9KLEsmvuvZI=
X-Google-Smtp-Source: AGHT+IHGW0q2lwoRj7S3rf9+iiedFfDzPTp7u5cQ3yIox9lL4ddIvW7Ltn33mCs9mL8+x1IN3JIGaA==
X-Received: by 2002:a05:6512:318b:b0:539:de9c:c890 with SMTP id 2adb3069b0e04-53a1544c332mr5346248e87.42.1729506791288;
        Mon, 21 Oct 2024 03:33:11 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22420015sm454132e87.123.2024.10.21.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:33:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/6] phy: qualcomm: add support for USB+DP and PCIe PHYs
 on SAR2130P
Date: Mon, 21 Oct 2024 13:33:06 +0300
Message-Id: <20241021-sar2130p-phys-v2-0-d883acf170f7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOItFmcC/13MQQqDMBCF4avIrJuSGSXWrnqP4iLaaAaKkUkJF
 cndmwrddPk/eN8O0Qm7CNdqB3GJI4elBJ0qGL1dZqf4URpIU4MaWxWtENZ6VavfomrItHU9XDS
 aDspnFTfx+/DufWnP8RVkO/iE3/UndX9SQqXVMGkzjc5SQ3h78mIlnIPM0OecP6lZppKrAAAA
X-Change-ID: 20241017-sar2130p-phys-426733b80169
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Vq2O95x6e7Hs1DzKvXYDscSROlBA9dAz4qml1ZBzo4k=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnFi3jHG8OPQet6L+ETGmWNYD1lBj7VW+leaQvs
 ae5xw29CbuJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxYt4wAKCRAU23LtvoBl
 uI3QD/4nXKaITIt5aPT/aRcRMosbLmFThrHwNilqfCZp5vHXvBNhs1Ynyeh+7i2DifmIldNE+8d
 I7al4ryRbTYQUmzrcVV/mpTngLXuY4e9Qi1rAM2tWUBUP/2MGWeISmitd3tteL8NbjfspLN9ZBJ
 902lOqOy/oVWqMHdKdvmSWZh++o0tLCzTHNdwj7PdaBIk+WSmT8DKZiC3+/K+ylav1FJMBeT6g7
 +OnFN/+hpTWdJp3r9euV53zbxCuE/azbbUCFbGYzEsJGUFDU/icjA7XYqs/RDEcqziblQ6eLtrQ
 rCL1dI/q5KlX3+xiI1KEKtRHSSzkaJVeudpv+cRZcvDxfBJC9hYYACwNdObmw5fR4ld1rEpTyGC
 t+5C3A7vEAO2MQadKmnKbd90z+4hjhwB0rAxSgRcWga1oz46OKTg69yPCmAV3v23oJ2Ddr8WYBe
 nyCY8XLJyOIZksVTQS8xTzEPATuxPJ4PXD6XPgmusMSAJRCKb8lOMGhZROkwZ4lT1nFRx6Y5zCJ
 PL10tRQ0OY1nxoBYPhrqpArJlsY4+2oEfCQkAEtaofS3V2b1TCwezIGZTbYDQhMgj1DY3bFoTbZ
 vXtCX1nPn5+TNemkprgDL8GAdS79KqI1QhjpDhhF2EtAU6PsvhadK6ZpBoQwufQ5Ph+eaHQNGhS
 4XOEcZmRuEMj9ZQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add support for the USB+DP Combo PHY and PCIe PHY on the Qualcomm
SAR2130P platform.

The DP part of the combo PHY wasn't yet tested, but it is not possible
to support just the USB part of the PHY. DP part might require
additional fixes later.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed the schema name in the patch 1 subject (Johan)
- Link to v1: https://lore.kernel.org/r/20241019-sar2130p-phys-v1-0-bf06fcea2421@linaro.org

---
Dmitry Baryshkov (6):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Add SAR2130P compatible
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add SAR2130P compatible
      phy: qualcomm: qmp-combo: add support for SAR2130P
      phy: qualcomm: qmp-pcie: split PCS_LANE1 region
      phy: qualcomm: qmp-pcie: define several new registers
      phy: qualcomm: qmp-pcie: add support for SAR2130P

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   2 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 100 ++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 173 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h |   5 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |   5 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h    |   3 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h         |   2 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h    |   1 +
 9 files changed, 284 insertions(+), 9 deletions(-)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241017-sar2130p-phys-426733b80169

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


