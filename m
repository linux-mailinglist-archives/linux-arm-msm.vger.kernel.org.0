Return-Path: <linux-arm-msm+bounces-46627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B914A247E0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 10:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04DF83A817A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 09:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD18013B792;
	Sat,  1 Feb 2025 09:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dxs6qfoK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95FC38FA3
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738401505; cv=none; b=g5f4NM+jv4pNDRZKtQHjf0aICkwHplyPO4oizVHws/rTnMpP+sunV0NoQ5MkXDDq87o4CxMOPo73niybZDzVJr4tR5gc5TcGSrXfqFgaI5mMqxdp4SCQ+qgaDuNIothYXiVnzaTUlelfVYSrjs4DMka2VtJBRTbbbiGz1cULKTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738401505; c=relaxed/simple;
	bh=4qP1R4QL7a2XCzsO9D2B+ppmsFIePsnOmtMp2m3zHrg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AGw8k8iaesL2eOFArQe394eaiMas542kmobnG27ySVB332sjxX5QrmFJ1GCIUsxvzYtOmd6FR0y0BptjeFbUJgOgm10RIno30q6LQM3oSE93lm7jfbrC73RY3PdS5fMv8+aRKe51s/P0aJ+xQXsDpujQhbx/i+Z3taU71sEGIqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dxs6qfoK; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-540218726d5so2610423e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 01:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738401502; x=1739006302; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dzmrjdR0yHCLpHq8/GHmK7t2cRCAh1HvefbrwzlazCI=;
        b=Dxs6qfoKd4IaVC7JQ/y49jS9UraL0NV/paZo3N0ZKmFHbJYOhjy9Zxr5CuJa/nZrJt
         YcxHUOM+3+a+DPnD2/cMVF1vf7yTf426L86aQdumNpCiPHYQAaW6yaEOLe70D8qB0qs5
         8QKV2b6zagea3Z2oqzVyZsNo4Gj37FQYiT+zjUQKf51fXgpykr7ncmMoxEn7yBhH6HbO
         Q23HCk28ICfyE8SXVr4/vDZYPkbO/dmzBjGU9K0YqB5Y5G+wbYJN/C7wIUGmg9xZLXrr
         FSpZA26O+jgyqwv5IKcbpn0v+YiV0k4rKHF1DTvn0xOJjTXcNYTdgVDHy6odkBScMUAu
         YXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738401502; x=1739006302;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzmrjdR0yHCLpHq8/GHmK7t2cRCAh1HvefbrwzlazCI=;
        b=raOIt7+E9QdSZCRTd07oXIj7gx0W4+y5VD4JZgEL9MfVHXedbJorqC5Wj92gYkIx4o
         Z5DovMtAZGfjVcAOOQaq+PChNKUvEd9b688AM4EhwUYV7S5117ZYc7TT3f3ofG/cp2BO
         ESSfV6P9AxQ3csc2NVy4RXyAiiIVxnq85SbZSHWu98CTgrIW7YFn8PgVMGo6kOv3FVpL
         phf9i2XrhzWJAgz2u82cXwnsRhnJvziY752kWimUj6Msm08o+SY9bQhzLG3Ow2lodj+T
         P66ifoJCORPd4llvvbkEHzOFCOQcCgpeenCNzoJqICqtdFBeqrUbrDra6rGVf2SwYIl4
         sLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAVyZMYXbqI91k7gUpL++BV6kZ7QksJ/wXYkv5SEIwpTwmdxDCNqokJQ7+ehN1Y12QXbORi9YSoNSWjTzw@vger.kernel.org
X-Gm-Message-State: AOJu0YxGnjpMpyaDQqclnmiOWKygtBO+CJgLoVukSXEaxEfAYMT53NCr
	6S/alT2uzc1k5dSVG2IxQWooQi1+llKSTprwfHRrt57XzvhxTFDthc8MGdWxX9Q=
X-Gm-Gg: ASbGncugU4LmohMzmGfYXf1fTxjCqLBPWN/VNRUU+wi7H/x+QeWkvlYzvrNCatahiYX
	lhJGuZ3xqxEVr7Jo9+guD9xdTgkzdyT4EBrfwQbDDOV4QlJV/I7qMYW+zB7yYAVQakv0Ru2Bmuf
	A7q4HzUMkyysMLcHJ0CdOUhy0yCAr+mRFfSF+06x2xMVPMZWQ3n5RhsWYDl3doy6GVUVxbH4w7c
	aw6wCuWSaZ9mLbGwsm9hgrF+0OWXqqr5Ah+SQFn3pi7XEMJ89/Xdxj1qsxiHKBmBjSt0pEY6eGX
	eFuQTf+0G0oc61g5V4wMnYo=
X-Google-Smtp-Source: AGHT+IGVbi1/vJeJZWONWsavIaow1nP64zjVv/L4qoDCyPBTEHnkS/T9hx2T8QVksVHMBre6z5V30g==
X-Received: by 2002:a05:6512:3b26:b0:540:1c6e:f040 with SMTP id 2adb3069b0e04-543e4c3c355mr4857407e87.45.1738401501922;
        Sat, 01 Feb 2025 01:18:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe0ff47sm711234e87.93.2025.02.01.01.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 01:18:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] Bluetooth: qca: add Qualcomm WCN3950 BT/WiFi chip
 support
Date: Sat, 01 Feb 2025 11:18:11 +0200
Message-Id: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPmnWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwND3aIkQ92kEt3k1GTzRGNDE0tLwxQloOKCotS0zAqwQdGxtbUAUgv
 G81gAAAA=
X-Change-ID: 20250201-rb1-bt-cec7a314991d
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4qP1R4QL7a2XCzsO9D2B+ppmsFIePsnOmtMp2m3zHrg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnnebbtNjOJgirn/5PLm6n0j45AEUUDo2C+tic5
 6NH8XK5JgiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ53m2wAKCRCLPIo+Aiko
 1ayfB/0QH2dT03oTJ6DN4/zrzi+DPNgB3ZgIfqZ5dB8phqZQPBtPlaaE2H06julMFthnRdGyDED
 5HJleC2c7WhaW5CsgUikyj00hB0fHbSKZsObxKcdi2epEIWaWW6lxb1yv4zfP5SCOkhkjBHEcW/
 D1Mxu8Zq3ixhVg0H89H7DRD3J0S0L4O0X1/ZnVYehCixInevwXk3qsBFWAJh2Ryw1whxofZM/Vl
 iw1Xnqnib4v+bKGOIFDAelHkUXNzFrnzPtJjAupV6vg04OnAgFYJKryOqqbWod5wjy89GUiaUBK
 kyDaKQXag0RkZrjgobJ13pIqMGycu5/VmtP8eSyl1Z0aYoVa
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Qualcomm Robotics RB1 platform uses a new member of the WCN39xx family
of BT/WiFi chips. Add support for this member of the family and enable
it to be used on the RB1 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      dt-bindings: net: bluetooth: qualcomm: document WCN3950
      Bluetooth: qca: add WCN3950 support
      arm64: dts: qcom: qcm2290: add UART3 device
      arm64: dts: qcom: qrb2210-rb1: add Bluetooth support

 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  2 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 15 ++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 81 ++++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |  9 +++
 drivers/bluetooth/btqca.h                          |  1 +
 drivers/bluetooth/hci_qca.c                        | 25 +++++++
 6 files changed, 133 insertions(+)
---
base-commit: 88b6bfc04cc5f60ce79c25cd27fe83f7fb4468bf
change-id: 20250201-rb1-bt-cec7a314991d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


