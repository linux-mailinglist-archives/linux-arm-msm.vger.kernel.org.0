Return-Path: <linux-arm-msm+bounces-29920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A59963E3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4791B1C20940
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 08:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75ACE18C02E;
	Thu, 29 Aug 2024 08:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUPBTci4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D7518C023
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724919680; cv=none; b=WdMcUDpFBGkkrvlQ7a1elkiN6Rv0bGF6ImemFRSLk9658PrWw99kCs2yoWXB08VMp1vvV/Be8gA/Ld5IXGVlHJmkrKgPOOZg/C20PDmyEUKmk0jqKVme5xJeWUmzzyqE0MLSX7OwQSG8AF9FEot8jbv0tdiGuoJ3uKmtv1FIKvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724919680; c=relaxed/simple;
	bh=K04IwqvP4QHiJEyRnXObSNOLM29xMbSAUjAHbtkAsYI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G5zJhelRNTjhiHFC2KpRwa+mo2JVm9KhrdACBZMsFd52R70jzZyKEMNA+YQJoCJBd87JXnSZLpQIOXIAs+cfXKqhxto3ogvEqZczqaDSGBimK8uZJRt5tRDFDtWILgtNuHcYhqrF7fvtkrb3hd5pHrGi06CTiGZewiwSc4MG86s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BUPBTci4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5353cd18c20so475411e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724919676; x=1725524476; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFe2h6mCzOZVtHkC8fLtufQDeRDZfA2dn2/r0ffaHpg=;
        b=BUPBTci4WQ5xBMLDPt2ESwhL6Frxnj7OUK6Ac6rqWLc46k0c/XeZedQTt16AitvD1t
         9uWp3KAbyqIlYiAxn8KBSCQjoQZc1fdgLrYnKaOGUxD5epZcFmxiG5KQQM48jzXZIFZY
         kadRaAgT2Sxi/upvaDq9upyq+yxWzGEUKf/9dK9E2DeEcmlLjG4bQNliQ8R76wC1H3cX
         tuGTkmjqyMeEvZGhhBOTqZ2U57TFsMYncyOOJFrFpZzsUF5mQ/L3Wz47jpQpicTM1yyI
         wbnCc0fjlsIE0XOjQwfGvYrAIt6SMfDOHKZ7p24X70lDmPh+4c/RQ0x/CEIEu4iDXD28
         ZC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724919676; x=1725524476;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFe2h6mCzOZVtHkC8fLtufQDeRDZfA2dn2/r0ffaHpg=;
        b=QUJeCMKEzKmbYlLw1kw5ZBh3kpkHFk0Xgzc/vrufsPpZw5EUGsbZ8Y63qDTmTt0ewi
         pZjEA6ni7KIdngrPm3v1oLeZg1gJi2WQiDjCYEY4w63aGpoAky0R6RoiehKHcQrr8JpF
         TNOd/KXw5MnpyNl/2xkM5F73rG/dpw84BWB0bQYRliBAkBvO1WBlBu7V8pHN4NaQtVZD
         QRbTMgdBl3v0AqkCQ3CJxnARUWWDb0vZ9LlNcDzs87ebz9fOZncTcEEPZ8bqt9/RIhBB
         LUgBvF6vYYzrl8Qu/p/W0jVHO2QYjk0Vh/QnBr2iYl94DYY8bmBeD9zUqQBuWwyVIWLD
         T+DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCIIPeWcSZHyG8MRVmNSCmnQQOyBXQk3MimBWM1A4LK3Yu/3lantIYMRVWiw7vpyAcKIAl9wXgG4nVgAnH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7XoSy1/+g++wnX6RMzC3ovXY0DorTDsVaAIIOr/6Hl4Wm1zvq
	hX19dh+lq4VrmWxycbN1QnX5JC4mj29K+vk8c58YKW7balpk9PvaYFiprIMWFFo=
X-Google-Smtp-Source: AGHT+IEPILolNaXIOtWPkvXuhIpXtzFYlASE1vDaxS6koISyxcfo0zqXADbPzOyD6IgDr8l2GxgKuw==
X-Received: by 2002:a05:6512:1047:b0:52f:368:5018 with SMTP id 2adb3069b0e04-5353e5b8400mr1383456e87.43.1724919675693;
        Thu, 29 Aug 2024 01:21:15 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ac333sm90243e87.70.2024.08.29.01.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 01:21:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] phy: add NXP PTN3222 eUSB2 to USB2 redriver
Date: Thu, 29 Aug 2024 11:21:12 +0300
Message-Id: <20240829-nxp-ptn3222-v1-0-46906bc4747a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHkv0GYC/x3MQQqAIBBA0avErBN0dKFdJVpkTTUbE40QxLsnL
 d/i/wqZElOGaaiQ6OXMd+hQ4wDbtYaTBO/dgBKNtOhEKFHEJ2hEFFp6760iZw1BL2Kig8t/m5f
 WPumVoaZdAAAA
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=899;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=K04IwqvP4QHiJEyRnXObSNOLM29xMbSAUjAHbtkAsYI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm0C96KQtgq+QiXli2xwJUwFJy8O7goNK1HIODP
 lY3r0kLuBiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtAvegAKCRCLPIo+Aiko
 1ZMnCACDncFx7nCwNWfmvqHMShy3DZWvjWLncWqZDdAO1QUzJKiblMhF+iGdU6GZBmgsByotc8Q
 JMy/HDJ6vKDhZgisrtSOUtduyBZeqVrGKsA+THoHnXLLKN/+v2CZX2rxIf4j/02ihV/WM0fRlNu
 SjyDO2bfO+3fI+PEZChomkscaXBHIfr4sqlCvdvBPjCLAw9we5ZcN5UxiUlE+zv+lEo0ESehC/s
 1zCJyYiCoOZ327Na+V9X7uCm081EMRSxz42mtCBDZQ0iJmsP/tqon/XrNXcb6vHdVXLH38pa/Hs
 hcZKkszSDJhRFw8kRw49dLrXg7OMTydk4dLXHX8ATT5l09tK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that performs
translation between eUSB2 and USB2 signalling schemes. It supports all
three data rates: Low Speed, Full Speed and High Speed.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      dt-bindings: phy: add NXP PTN3222 eUSB2 to USB2 redriver
      phy: add NXP PTN3222 eUSB2 to USB2 redriver

 .../devicetree/bindings/phy/nxp,ptn3222.yaml       |  55 ++++++++++
 drivers/phy/Kconfig                                |  11 ++
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-nxp-ptn3222.c                      | 119 +++++++++++++++++++++
 4 files changed, 186 insertions(+)
---
base-commit: 195a402a75791e6e0d96d9da27ca77671bc656a8
change-id: 20240829-nxp-ptn3222-30bbb81e984e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


