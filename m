Return-Path: <linux-arm-msm+bounces-47178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DDDA2CE3C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 21:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD39E188F483
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 20:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8137A1ADC7B;
	Fri,  7 Feb 2025 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="crUAExUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5A01A5B98
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 20:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738960886; cv=none; b=LxMZLXHOBxHmV83CNotdwcvQi467zrUmLFOKbLT4OytRSGLVvgZSBrgjs7TKGRz53tBpQ/l1byZm+TXq+uy/wWnQ6ADFN+LLJJHmVFtwE1DgdKMiIyAWnRDpbyOsXbZMfGY/K6pAAQvqaDjMLnOC6Bud0P8rmL5VSD3raZwFfg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738960886; c=relaxed/simple;
	bh=qiQogY4nWHYMJ5BN+x5c7UGCpSpgl8ehDDro3OyQnYE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=irzqc9GUM6QQRYknhfQvLFx7HZHX5DmJ6CruFLclQRDBACPFLmbMX6Afb2yNS0xKQMNCr7IOa2SZb08cDCbrxeopUyX+2dzAakRgZtbMIXoWCzfO3TKjIda4yJI2FKo7GVLP8dQwbCV2KVjne5dW4pxfOKtSb6bB7r38r0/z+9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=crUAExUj; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-307e00d6b09so17807791fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 12:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738960881; x=1739565681; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AxTbsKhJE4yee5eNW0RBl8yAXgK28pIKigb6T5Yer0o=;
        b=crUAExUjEsoYfPXVt7lBlim9CkNitrIHAVnT5p/deBwfhReuOog4iAspBlhHaKbt0T
         1ezO479E8oG1lIiOTho9+hvmCXZ05NUmBPCIkK8lTOExhAVTv69i6xEVzRZvh4j/StHG
         dXdMtieRUekahPMsOD5IhfAC+fUvTvZp72G1vjeTKdyHbcXFrUiX+KkyCgHbu/AyVUv1
         IJlj2arHnpZ/fKNrrmWWWmTl8ll80qBY1LL/FG3/WUh9eIhyhTk/1AUkoVmlEixOo1pi
         mRLYgKJuDleW1YWaHBF6C84gn1A5DGI4FtOX6h+cD5wmqBHh55nmMYn9N+g7aJrRXsLX
         ha1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738960881; x=1739565681;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxTbsKhJE4yee5eNW0RBl8yAXgK28pIKigb6T5Yer0o=;
        b=ux9FsXKCQgrsJWA00CLlMkVetbJVyXbIOZ/I88KKh5gLIb4dJkJ9liKIzuPuECAl9u
         RpTUQIlvR1cai1mt53riDBD/flMFi2wyWJNFQAP0b5/zl/PDJemO4XYbw99ts3C3PjpI
         +bnAJJtaSvYyuB8qoeaY3Has+8UkqvmoduN3Cv0PPjfM74hRvlXF3pOG5gMheqpwl6Y4
         BBPMYpTIq1PLWJplnnMseVque+n2cLawjFIq28GPl5wM1W3p7jl00K3tgWfqkFt+E3ZW
         viPL62jIjfKo/pvD+Uo3cAtfrqBaRCGPXXXkJglujt9Ni3oZZMAj8AAQ3pHadYmKli7z
         6bkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWMDoBRwKc2QZ6XOUexmE3eUn3+/+dp39gymmZd7T+pMzV3hxbeUC4xM6a+7Df53KV5yZaXpR+VWX6yHYD@vger.kernel.org
X-Gm-Message-State: AOJu0YyJLBTgiSMaTXQQo2Vn4+/G25Lv2Z3FSjeROt/s3Tksi3aHi0u8
	A1p9AAcVyqYfxQJyjDNdZW8v9a8rpsi/kb+Hh2HTqpQAGlitHsrByySLcOB70fxlJtv0Jk0sMU4
	ac7o=
X-Gm-Gg: ASbGncvCm0DbqHOUNtFEgue2Ti0cP6/M59OSVaC+BjGPFplMt9f0ewJRaEblVnL9PS9
	mdGB4aWT8WiXS7K4QJNtEXOM7sQ2dFQYfNwjvxDs3NX5xXSkI+5bM4GxiUQhcLnEl9zpbmle+U4
	ayA56M/7hgO+o6/BsK3KYuftM3rfp4kUavQeU92cLTQ6ztg0B3UkG0ChLVymn2LBPA/PR7gsTfS
	b5dxjkFfXmW/s423y1IEe38ni6b4DIFSKis4dhPDrCA8l7NgybcqmmHbrmh5i8/Pz5uK0jDVKbl
	q/noo5EZ3aAEG53P3ufQDzo=
X-Google-Smtp-Source: AGHT+IFW7Wi+qx6pPTX7V3zT7yPLzOOq54XAmuBFxAdNvG6EcqWrudwijkyuNYxTfyXx/zQlqlOKCg==
X-Received: by 2002:a05:651c:12c3:b0:304:9de0:7d9 with SMTP id 38308e7fff4ca-307e57fd306mr16769571fa.21.1738960881315;
        Fri, 07 Feb 2025 12:41:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de178628sm5343811fa.10.2025.02.07.12.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:41:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/6] Bluetooth: qca: add Qualcomm WCN3950 BT/WiFi chip
 support
Date: Fri, 07 Feb 2025 22:41:14 +0200
Message-Id: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOpvpmcC/23MTQrCMBCG4auUrI1kkrFpXHkPcZG/tgFpJClFK
 b27aRei1OU3zPPOJPsUfCbnaibJTyGHOJSBh4rYXg+dp8GVTTjjJ8YZ0GSAmpFab6UWgEqBI+X
 5kXwbnlvoeiu7D3mM6bV1J1ivu8QElFHtG1VbVFy45nIPg07xGFNH1sbE/zteXOsQGYBEZczOi
 W/HP04UV0slNWItrXc/blmWN0yvH38NAQAA
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
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qiQogY4nWHYMJ5BN+x5c7UGCpSpgl8ehDDro3OyQnYE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpm/tYXWlo4SnQJGUzZQ8nYM1MuZaf9S1YOcAj
 csbfBBW7GWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6Zv7QAKCRCLPIo+Aiko
 1ahpB/40yzVZal2uwoGmtjui0KAWyW6I89DEeVMcNHyOrirx8Ff0ghNIjjw1VeABQLQpeS7XvVN
 xlIHUaRBg+cMxj7Jkc6lyLOzqBrVpcckcp1ir46nGXucNrQH3vGQmb5eXDejSCGmh/L9Vr5YmlM
 FVxquuEHz98oL68adwZaGjiKRn9WOA5vt3x7R9mk5PW+zCveBOvp3aMG5omVUZ5iUMtAnP6vjXA
 3bfCWa7aEkibpngAMIEo6MLte9BoC/7nByW68KNrwUt6hG6aCLWRMiUq2p2J4Gq4ohJujhukHBg
 DB9Poye+ldSNB7YusTxFCrVPxE6Syl1nDvVLbXPCBCSUApmu
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Qualcomm Robotics RB1 platform uses a new member of the WCN39xx family
of BT/WiFi chips. Add support for this member of the family and enable
it to be used on the RB1 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Added empty line before status property (Konrad)
- Reword Bluetooth commit message to follow linux-firmware changes
  (cmnv13t.bin and cmnv13s.bin were merged).
- Link to v3: https://lore.kernel.org/r/20250202-rb1-bt-v3-0-6797a4467ced@linaro.org

Changes in v3:
- Mention new firmware files.
- Link to v2: https://lore.kernel.org/r/20250201-rb1-bt-v2-0-fd44011749bb@linaro.org

Changes in v2:
- Corrected QUP interconnects (Konrad)
- Added /delete-property/ interrupts and an empty line before status
  (Konrad)
- Enabled downloading of different NVMs as required for v1.3 of the chip.
- Link to v1: https://lore.kernel.org/r/20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org

---
Dmitry Baryshkov (6):
      dt-bindings: net: bluetooth: qualcomm: document WCN3950
      Bluetooth: qca: simplify WCN399x NVM loading
      Bluetooth: qca: add WCN3950 support
      arm64: dts: qcom: qcm2290: fix (some) of QUP interconnects
      arm64: dts: qcom: qcm2290: add UART3 device
      arm64: dts: qcom: qrb2210-rb1: add Bluetooth support

 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  2 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 31 +++++---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 83 ++++++++++++++++++++++
 drivers/bluetooth/btqca.c                          | 27 +++++--
 drivers/bluetooth/btqca.h                          |  4 ++
 drivers/bluetooth/hci_qca.c                        | 25 +++++++
 6 files changed, 157 insertions(+), 15 deletions(-)
---
base-commit: a1d1e1f2fae5fcb5f2e43b81afa9596c606e683d
change-id: 20250201-rb1-bt-cec7a314991d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


