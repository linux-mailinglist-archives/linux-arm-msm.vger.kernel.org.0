Return-Path: <linux-arm-msm+bounces-30180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4A9965A0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 791721F247C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 08:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56D6166F3F;
	Fri, 30 Aug 2024 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="auy1iR6n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB5C168C33
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 08:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725006052; cv=none; b=m0G+ddCltRoKIu7CQyIq3gMCFVteKfpSduoLJ9m/eoiBbLaWo07jx/8sA7+H1PHUlYyLczC+eIO0KuiPYW4QyPAnBC/stqVfRps55G9vPTFwik2QZbDnrp+dpP+GzkSjn1UDOgEw2v/sXkklyi+J9ssJaPFi/Uk0Mgkx3OZTm4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725006052; c=relaxed/simple;
	bh=YucLZiKtcTOQ2LZLPspdYxYZ3G8B0cZuu5cpOrrY3uQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P+r0y3iNLZygJHtaspkc9z794ZY3iaxb3dVeDjFnCkYTfpFbMQhtdZXYFu0j1TOLgmZqChzJZ+NXJRA1trzzzneij3FsjBymRdF4gdmyd54SFFKThAgr3CRNMOnhhqNySZZd4mLRmwD4RTHrbd5ygiXLmAFo4tILASkyFswQu+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=auy1iR6n; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53349ee42a9so2093032e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 01:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725006049; x=1725610849; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tNNx6R/CTj6/etPLMLqRbZQLDDYvh5RRNyVtz+9vczA=;
        b=auy1iR6nAgN4MAMiDIS//8NevZ1DQ9es4TNVR5G2Jb3GLvoRM5eiVqRFEfrJ91kxmU
         IdgeoSuJyTumklTkobPkw+luRyvX/fdQ1gZSMd0+pvdk9rgoUMKApwxz0rtEs3Xx6fEb
         8FgKlGjRg1dV1R02O7uA/Y/iUp9p1VQ2rfnCKat+jiKju+b7/Rlpzujmbqk1gaS3cCkz
         zi22oqW1Lp9IeOXMMmE3rvbxYYdhi6ZZbJHoaKBF/K6nY8/QYaBY2KbOj0N7MRCiend1
         izCJygK78o++GOYj679cgaSqI4PLYnuMdd9rPDmC/Jk4+K9WTWQrX5DBVlAmGAAbnzvo
         lq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725006049; x=1725610849;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNNx6R/CTj6/etPLMLqRbZQLDDYvh5RRNyVtz+9vczA=;
        b=M1bgacaroYd8JWGlrBgvyaFUaNYo081Qstfm3bdxjBF/fasHKhFTS3DKIPuMSp7Rw+
         1cYpwlhEfnKj4z1Mbufu2mwtR5ZAg1Y8q/MxeCTwpc8jNu2QwG0B+G3CKdp81M7tTFfv
         7vCybT4pGbS5I6zPC+qtVZkb0H6DOpagxAJItU9qMmqNBzmr61tmMlL2ZqQNfQiLbyKN
         ZGuUC4HMHvsu7vcGK5Pa8+xDVeSEspJsl7PaZCTwM7rmoVM3tKCbpFdoXVSt9p0H8W59
         fsRY5p0WYMBIfGa5pLl9VfCP8IrF7svJNKNrqNlAIkoNVS9aJ/JIwTSbEUTNAD+u9bdj
         qzTg==
X-Forwarded-Encrypted: i=1; AJvYcCWtAH/lsYWmT9k+1O/HyC1MzTpyblR03mlyFDE7GoILlxjAUGkEktTUZCejiSy+sWrXhzROMmp4ME2gf8e9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbtl6MsRKvytwJzVXBSFMJd5S1/7nQIGSxz8Sa1NKBQWZVXoTx
	8dk2NKCwgIevd7AjO3Jp16RGhM1ZTPOkwhWIWe/6+XhzYZSFLjkDMcgaXskMxnk=
X-Google-Smtp-Source: AGHT+IHGG+kYAl7eRrAUxIf40F23jCJzii6dmVx9hrJqP30xeomNshfKUkKgkv4Nshm5utOmgZzdnw==
X-Received: by 2002:a05:6512:4014:b0:530:daeb:c1d4 with SMTP id 2adb3069b0e04-53546b1920fmr784708e87.12.1725006047931;
        Fri, 30 Aug 2024 01:20:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084e00asm482623e87.271.2024.08.30.01.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:20:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] phy: add NXP PTN3222 eUSB2 to USB2 redriver
Date: Fri, 30 Aug 2024 11:20:44 +0300
Message-Id: <20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANyA0WYC/23MQQqDMBCF4avIrDsljkGTrnqP4sLYqQ6URBIJF
 vHuTV13+T943w6Jo3CCW7VD5CxJgi9BlwrGefATozxLAynSypBFvy24rL4hImyUc87UbI1mKI8
 l8ku2U3v0pWdJa4ifE8/1b/3v5BoV6taq1o26091wf4sfYriGOEF/HMcXvrYvI6cAAAA=
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YucLZiKtcTOQ2LZLPspdYxYZ3G8B0cZuu5cpOrrY3uQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm0YDeWPNA1ymm+x1qxspVMU3+Q3+Fx3fQb25KX
 4Q+J63WS2SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtGA3gAKCRCLPIo+Aiko
 1Z6xCACpSleZDi29XNNeLJF0ITh7C8B2OkfchPfTrm6NdUvhBEjxCYDNGMX3ZhwcSIrF8un6aE+
 J8KHfMlNPvxDcEp8fAXNlIaXOeOz0dfLeyqHEFr9r6cg9QBpLyRTx/gtVTa7RkkB/7hxxeck91x
 5WT8AlsiA57Eg2Smn9wAliucD34zabwPJ5sFFsLhA//fAC/0poK74gegTk5o2LjNqlTOckXSuaF
 Np1o5MQ2hP+yua/DpT0HK/fQ4Zo6Ln6QvRRg4gLdsl3A2PNnkg0ubw76WbKB9Db++ifmB9oVZZO
 5mbCLcBLnA8qJhvN9jqqDeRBgM1CzsF9KPhW6pi6NZttt2C6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that performs
translation between eUSB2 and USB2 signalling schemes. It supports all
three data rates: Low Speed, Full Speed and High Speed.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Switched to devm_regulator_bulk_get_const() (Neil)
- Link to v1: https://lore.kernel.org/r/20240829-nxp-ptn3222-v1-0-46906bc4747a@linaro.org

---
Dmitry Baryshkov (2):
      dt-bindings: phy: add NXP PTN3222 eUSB2 to USB2 redriver
      phy: add NXP PTN3222 eUSB2 to USB2 redriver

 .../devicetree/bindings/phy/nxp,ptn3222.yaml       |  55 +++++++++
 drivers/phy/Kconfig                                |  11 ++
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-nxp-ptn3222.c                      | 123 +++++++++++++++++++++
 4 files changed, 190 insertions(+)
---
base-commit: 195a402a75791e6e0d96d9da27ca77671bc656a8
change-id: 20240829-nxp-ptn3222-30bbb81e984e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


