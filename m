Return-Path: <linux-arm-msm+bounces-4356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1400580E6D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 09:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEE411F22249
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 08:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3C24CB39;
	Tue, 12 Dec 2023 08:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vS9Z0w20"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5AD1EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 00:54:35 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3363397426eso232558f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 00:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702371274; x=1702976074; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ilaiMPnzGhbPFMbIGSi8UClIniui8pOR3EQmbzCOGPc=;
        b=vS9Z0w20yzWWX118sDf7hRvkw9ubyMu4c6XZai8TUCYVlRTo+GFYkxab8RMsiyHQ8J
         qj1P6IBu8Ql1iq9TC6bCNj3gpgpYaT4Wx/2cgB6mEvzQGCQjEfFYKuoRz4q68JSVJzFs
         pLmuSGqscPdQenthnfxLK/rpxQdgzOHTcN0vkyo3e84e5uX6WXqosUbIafOTZ/v6pQPr
         IrHI6SsNDaHGWL8Aw9lnX6/qfGNVpWXHAQRdkZbdn5P4BNEvDTPqRVnILE1sXeorea8v
         uCbEJD55f6jCUwdwKJVjWq7Q5wAQcKJia1Inb8RaQKJCy9I6fOdpkiGppoNxC9+pTGwL
         1KRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702371274; x=1702976074;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilaiMPnzGhbPFMbIGSi8UClIniui8pOR3EQmbzCOGPc=;
        b=mya9xdI9PWxh3K/9tZxq0X2ye/r/tqwcoSdBSUcyjFI5ZZYBLMouIkaJ14ddx2tqXb
         opvhQoHPFCozqyvd7KJKRrqDwqbJjbuikqQjgmtmGtSAi+OeYppXntBMxnBZA+OKWIiO
         9cjouv5bmyY8QBWHGztSgK1I07Oh41wGeZAEcVsUy6oc35NhTBEH7Ot8BvsVIq6kr+Vt
         SCH/jVpMEiW5Ha343bCm9+124pgN/LcJjLItiFBkg9tMmnZj+Cw8GSlcCopJp4ZTCUY4
         RbxM+Sd5Hxt6dDGB0eO3K+hQu4/TkDvfgOe8hcnC/LQA7vn33k+Y0o7cnHatVfdS8ehp
         5HMw==
X-Gm-Message-State: AOJu0YwORFIglUQF8aenOb125aL8896Ht7AmAsmLC/iX8hLMmLUj1Y3r
	gfL7okGo3eHDu4FaaUzovdiuVw==
X-Google-Smtp-Source: AGHT+IFZX+KwkEQPJe49hAJ0gBfZN7gkkZ1S8+9WAy1rH88CmvlGYdxKPriBVnSJB8Eq5UYnF08WkA==
X-Received: by 2002:a5d:4bcd:0:b0:333:380f:2d2d with SMTP id l13-20020a5d4bcd000000b00333380f2d2dmr3864996wrt.92.1702371274060;
        Tue, 12 Dec 2023 00:54:34 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j4-20020a5d4644000000b003333bd63792sm10312155wrs.117.2023.12.12.00.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:54:33 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] usb: typec: support Qualcomm WCD939X USB SubSystem
 Altmode Mux
Date: Tue, 12 Dec 2023 09:54:27 +0100
Message-Id: <20231212-topic-sm8650-upstream-wcd939x-usbss-v2-0-38961fea5867@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMfeGUC/5WNQQ6CMBAAv0J6ds1uiUg9+Q/DoZQCmwglXUAM4
 e9Wf+Bx5jCzK/GRvahbtqvoVxYOYwJ9ypTr7dh54Cax0qhz0ljCHCZ2IENZXBCWSebo7QAv15j
 cbLBILQKYo0MiS1c0KpWm6FvefpdHlbhnmUN8/6Yrfe1//ZUAwVBDtS1KbD3enzzaGM4hdqo6j
 uMDpCJ2ttcAAAA=
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PRCXducUL6l/rbIAApzfo9igDnLtdpieNL5QLqC72rk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBleB/HrgyTEWEqe8/9moT+NP8RX9R4hJyy/GAyN3RQ
 UPv+nkqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXgfxwAKCRB33NvayMhJ0YHID/
 91dHpW34MIeJCTI1Cd9t0bk8y+F0WTsrBPKdVPedYZDDnWqQK/W3XCVwI0VoUn9AXMUG6rhdPhawfS
 8yynTTL5Ksg+m+Zx9UWC4CbAhPoa6gFLvG7SNRIP5H/QnDlEwvgZqgy+rEpCtAK+n8ORZgLbkrgzn2
 kwTdOIevnX+5zTMeFk9uN374+EhLOgeI4SI09Fa8PqiU1FPS+J9VHwcs9V3hPJ/rLj6m/40aFjviFg
 dUZo87S3HEbQnJ/LnxAnuRB/4oHaxNto65z87z84WmXXYBrxlLqa3lLYpCmiM5fK5zGEPBHJDKyQTi
 q46/vQUfsHugQvB7tkMSbzDQ3Kie42sXARv+zliBU2ieawoltdJlxG4TgNb/gKPD89uokf4/a3azKw
 O8JksUoob0VO3k5MTuYeNr8mvyS7s3N311+e5dRyqJ+WVzKFiFhBngazc4a0Z3rIM9cY80dJnbuycj
 9mc97a9E+9zx3xaq4g/f1NWX/yzc87JKspFsMmddwhBU2/GIvdcGlbFZdPjNwcWed4bVRhJ4SH75MI
 Ln29h2/vwA9R8Zz3JTSCMngQSf74ISm4C0AXEol+jZoV31ClpiooxMaqzYUjYkXLf+oHXlB3mZi3RI
 aa9L0+nWfrCytrSVDudsatBW2+dHyDKSYaJKyCEQL/RP4IMNRG4Mpbvw3m4A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Qualcomm WCD9390/WCD9395 is a standalone Hi-Fi audio codec IC with a
functionally separate USB SubSystem for Altmode/Analog Audio Switch
accessible over an I2C interface.

It provides switching USB-C USB2.0 lines between USB and Audio Headphones
speaker lines, and the USB-C SBU lines between DisplayPort AUX and Audio
Headphones Microphone/Ground.

The Audio Headphone and Microphone data path between the Codec and the
USB-C Mux subsystems are external to the IC, thus requiring DT
port-endpoint graph description to handle USB-C altmode & orientation
switching for Audio Accessory Mode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Bindings:
 - Limited text width to 80 chars max
 - Added maxItems: 1 to reset-gpios
- Driver
 - Added missing bitfield.h and gpio/consumer.h includes
 - Fixed double typec_switch_unregister()
 - Added missing typec_switch_put() in remove()
 - Removed useless wcd9395-usbss compatible & device_id since wcd9395 has wcd9390 as fallback
- Link to v1: https://lore.kernel.org/r/20231208-topic-sm8650-upstream-wcd939x-usbss-v1-0-91d1ba680fe0@linaro.org

---
Neil Armstrong (2):
      dt-bindings: usb: Document WCD939x USB SubSystem Altmode/Analog Audio Switch
      usb: typec: mux: add Qualcomm WCD939X USB SubSystem Altmode Mux driver

 .../bindings/usb/qcom,wcd939x-usbss.yaml           | 102 +++
 drivers/usb/typec/mux/Kconfig                      |  10 +
 drivers/usb/typec/mux/Makefile                     |   1 +
 drivers/usb/typec/mux/wcd939x-usbss.c              | 779 +++++++++++++++++++++
 4 files changed, 892 insertions(+)
---
base-commit: bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
change-id: 20231208-topic-sm8650-upstream-wcd939x-usbss-030c011a1709

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


