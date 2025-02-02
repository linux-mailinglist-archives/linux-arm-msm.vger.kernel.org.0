Return-Path: <linux-arm-msm+bounces-46666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF5AA24DD2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 13:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76FD47A2532
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 12:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936661D63F5;
	Sun,  2 Feb 2025 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ee7hKAbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9661A15ECD7
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Feb 2025 12:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498567; cv=none; b=KXUUMStyYZYSGp18qoy1f5DzL5365TOEF5hRJkuv0fAdzvC0pYyQkaUcolcEpWD3dtcpAghE73xkN6vw9dk2h/BC1Sw2CiUkHDUH21dtTHWqIO5oQkZ/xflbVvARUbwBLAJjnQkM7vjjgS75CwasIHKAh83WY+EZIebbNd2u32Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498567; c=relaxed/simple;
	bh=EfZHDUsPcSnK5tXC58XOykRPo22t1YthuhBDTBInV4Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=usAsjEDG9ATkeNTtobb6AmhbykYUVnKjS/wiQHN6PShCTcmBJHr+UfZFCDVJEW2HiYUFEiXeRYrqgNAhenIVlIX+2VoZ+e5ySCTFsr+mV88GB1pwx/cDSIFm9bKJISgCqMxlVuySemLrbRkGHX4k4IT+eJvfc9nLNqbeRQ2KOi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ee7hKAbU; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-540218726d5so3239906e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Feb 2025 04:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498564; x=1739103364; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6LNdjOFUy9msGxetoNYZqZg+jBROeA3M9i1VLA/rJNA=;
        b=ee7hKAbUWEbkFyu+bGTGeFQvJlbNnCcGyJUzAchLlN3xIzmvG128iroZLX2I7rw/HV
         FX/d7BNccLUanOaqunY+pCRIvhSG0Nx5lCG7SF5kiS4JyooA+0n6gL6INrCbFcT33W5+
         dwV8Q15GexU2W5oMz2scJaIJMlf0rYnswFI5q1Yc0LT7durpj3X/MZZy21d10BXDR/gA
         lEY6ytI/HDYSDXJrW3B1QYIbzvVdXqOjeg1YMVr1zfURdLIaBQMfd74gyZT9mfYFUMkY
         2DK574BjXdysbMkuVrFgG58Pa5N93KWWTCmzuiC1vcdLoAzo9jeP01VweKvqKTAXABOb
         D0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498564; x=1739103364;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6LNdjOFUy9msGxetoNYZqZg+jBROeA3M9i1VLA/rJNA=;
        b=i+LiXj8FNee1DPAYCzeSC/2RCjyZbrQlbEBcbRHsdr+xqmhnC4w+jR8AcMCbhF+/Rh
         igUotb14aclpCh4oCBVi0+HPbhpDWrEO6xNKC+ICtMJOFb/vTB8fybei12vbHLp3eey3
         Kvm4OcZZLYI3zFzusoYeXTC22xz6Hd7er1/lPwlHr3rQWtE8I0xIH6oDEMoikQWp9Eyh
         6lAhnYk7YdydbaSO8Dda9f8ctob74+ILDchGKrzJzvmgF5Dq3vEAAQM8oojw+fX6sHSk
         CQIYGt0WSz9WNROvr2+IVJAOsAmi35N630TZoqtDqCGbyNyr49s0mL1BX/e2SJpA1Lb3
         4PaA==
X-Forwarded-Encrypted: i=1; AJvYcCXQFF2E5vICEpysarxDulVcRAO993gQvo8RRqqqzg3RF+lsxH7zPScb8/oj0eLJvQ3cWKtCNa1dNF21Rkfa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgh/xS8w2KfP1GzcPFSWb1t25Yn34SrHhvlS9AUX5t4UOXC3Db
	xIjL2Ke50JlimtQmoa/twjCvrfa91BmWWx7H9mb3blJt/YfxXaTbtiy7EqJDAkw=
X-Gm-Gg: ASbGncskCl/nSU27pTtdp7SIO1f8/VRi8ucg03nJ4cXEHkWt6rJzH56xM6FN+qA7Z8W
	hemxHhvof2YjsHUu4+G9bvgKdQqwkNmTEvInlfYI/lfEE/yc04yWXTiYa1C0D4QrMk04bFvIHiy
	8RDxcB/SvSUYsHvsCk06xran0BWum5KqIm9QOdh0EUFaYMVDAyncudTbHpOIKXFGv3hhmaFYIS1
	6zewJRibKJU+0qPhoJgW7ddqZye1G5juL994XyUo+bD48OzRUIAK5BvYuHvALLit5WgzWH+aEei
	CVNrXYJSJF8T7y4EcyZ1zkk=
X-Google-Smtp-Source: AGHT+IGlGtmf0KUkZvargRF+oOYj+wlI1hErSzY/qrXuyNlsP665sHb8ntKOEwzl04XAomqofcNbaw==
X-Received: by 2002:a05:6512:ac7:b0:540:1e7e:ca80 with SMTP id 2adb3069b0e04-543e4c0385fmr5757225e87.30.1738498563596;
        Sun, 02 Feb 2025 04:16:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0a4esm950663e87.114.2025.02.02.04.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:16:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/6] Bluetooth: qca: add Qualcomm WCN3950 BT/WiFi chip
 support
Date: Sun, 02 Feb 2025 14:15:56 +0200
Message-Id: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPxhn2cC/22MywrCMBBFf6XM2kgmjbZx5X+Ii7zaDkgjSQlKy
 b+bdie6PJd7zgrJR/IJLs0K0WdKFOYK7aEBO+l59IxcZRBcnLjgyKJBZhZmve10i1IpdFDPz+g
 Heu2h273yRGkJ8b13M27rTyIj40z7Xp2tVKJ1/fVBs47hGOIIWyOL/56o3uCk5IidVMZ8eaWUD
 /TNFIjVAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EfZHDUsPcSnK5tXC58XOykRPo22t1YthuhBDTBInV4Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn2IANSnjds/f1Nt7i59BHqYwxFRU+otGuJdeW
 vI6E3P16RCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59iAAAKCRCLPIo+Aiko
 1QxJCACWWP+qPEPdzLI0bok/aIFVc60aqobEI7Nt5vzyq5cXAI12Od98YsUNd4wMajy0RuuxJi9
 J1/jLrD1RzxMW3R88bdI1XYZYU2fh3umKL7QnTpdeGNoBsRArpeoO/N2uVSBzeRmmpcMGQmqL58
 BnP7nseSN2UsNFFkBDtEmQYNKCRbXSfgdt/kkUpkHgxqAcG/7Hqse7M7ZYPtS4Y+7tkV9vxh6I+
 ibVQEoj3nr/nYmyKaWMl7dS747VIcnOynAbmrgyy2ZQApaleUmwO7pY6xR9yey1wBvrmC7T472B
 PogeMwGZ1N7qMdF9V9AxKXn9Rg7wyF7RXZYEtopmhxkXLBJi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Qualcomm Robotics RB1 platform uses a new member of the WCN39xx family
of BT/WiFi chips. Add support for this member of the family and enable
it to be used on the RB1 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
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
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 82 ++++++++++++++++++++++
 drivers/bluetooth/btqca.c                          | 27 +++++--
 drivers/bluetooth/btqca.h                          |  4 ++
 drivers/bluetooth/hci_qca.c                        | 25 +++++++
 6 files changed, 156 insertions(+), 15 deletions(-)
---
base-commit: a1d1e1f2fae5fcb5f2e43b81afa9596c606e683d
change-id: 20250201-rb1-bt-cec7a314991d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


