Return-Path: <linux-arm-msm+bounces-5914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CD381D3DA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Dec 2023 12:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F8C01C20D62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Dec 2023 11:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175E0CA6E;
	Sat, 23 Dec 2023 11:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tpSTe79z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B787CA53
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Dec 2023 11:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33674f60184so2554572f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Dec 2023 03:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703332541; x=1703937341; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vPGk0HjLiKQ+CxO6emi2O17JwxG8APTMJGWVOcTcvfQ=;
        b=tpSTe79z/ylvB4kRUa0CzkaP883KVii01D+38IeF43N6OqRd5Y711S0rakhcKRqW3p
         YjiD3lOKbaJ8MHj/i5QQNG/QThsSV73E7u62nvmP93qUfmNiw5IugruzAGTd1tsvUIxJ
         2a2L77Tfa6jL3900SEswn4gfxSeNGtSJnfQz/wCqLRNYOXAeSM5Iop8uxzxjCcs+Zb8B
         XuzcjAAxOxrS7n7YhUPWIHXh1qcdE0zIEfHrtrRY17o7OeCDTJSgcIwKDJlGsM1Jy8bx
         8uzR4siQoswfJmGJIUBzQyyd9OJVtZdRRqe8KfdP0NPFnFTq7Aj2xN3XzG1vXdjDCa6l
         kvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703332541; x=1703937341;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPGk0HjLiKQ+CxO6emi2O17JwxG8APTMJGWVOcTcvfQ=;
        b=khCM9XZP4pViN8hFGKZXNAH2rPPk5j+v/3MAAbi4voXXB6vn41k7ZgxXpMUyMcrkpX
         DEdcvV9qwj1AuHuxumgH2HfUxu536nve10twffLsD++3zcDwCyC6UkoMVldvMxajEDwI
         gkv3/ISWeqEE2Li25CrHnJKS2PfGOI2c8xkBqZ2brOtzMy0AaQWmYqmqEjiLAlCW9oXi
         qrAU4rYXq9F1mTVyEneRLTa2j/9z1JcNcRp7PzpZM8fpIjETnnRAPvZCmc1VXlEJvB97
         nnAr/JCZSJ7Z3RJ78imm6pHgS1tVjC3qb5BMueXsa5RUB6w7O/1eSop/ay7KkAKy6n05
         LoEA==
X-Gm-Message-State: AOJu0Ywk5D29izPUiPNowPwEYmQmiwX9G4MWCs6OWqStVFAaDL88CfuR
	rUGFVYsyBmXibiJoXE+/DV7TmMsL5FU+QA==
X-Google-Smtp-Source: AGHT+IEY+TL616yws8qTBZ6IKKDIvFw0yhgoQ1kz8rSNxIo80Asg/yeKA23VhJS3VGagBrqFhKR4uw==
X-Received: by 2002:a05:6000:100f:b0:336:a0e2:1117 with SMTP id a15-20020a056000100f00b00336a0e21117mr671182wrx.140.1703332540494;
        Sat, 23 Dec 2023 03:55:40 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id r10-20020adfce8a000000b00336781490dcsm6351525wrn.69.2023.12.23.03.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 03:55:39 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/3] phy: qcom: qmp-pcie: Add support for G3/G4 PCIe PHY
 for X1E80100
Date: Sat, 23 Dec 2023 13:55:20 +0200
Message-Id: <20231223-x1e80100-phy-pcie-v2-0-223c0556908a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKjKhmUC/23NQQrCMBCF4auUrB2ZJILWlfeQLpJ00gyUpCRaW
 krvbiwuXf4PHt8mCmWmIu7NJjLNXDjFGurUCBdMHAi4ry0UKi0VSlgk3VAiwhRWmBwTkL9eTG9
 b4zWK+rOmENhsogv1Gd/jWMcpk+flgJ5d7cDllfJ6uLP8rj9CqT/ELAHBVsZJrVu0/jFyNDmdU
 x5Et+/7B3VCtr/IAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Hk/a9Ag7u1CiPccqFteOJa8czWyyeAF22NOW7Iqw3qw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlhsqrzQaD++ommUEpEZ5dUZVxjtSvLm9zc0r0C
 DsnFYzt2waJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZYbKqwAKCRAbX0TJAJUV
 Vq5WEACCOItGsuunfzlThSOrDl7CA89Keed1vy28p/oxWkC3c6Sjp204+Ld0LP9d6PBZCBXOd1o
 /lSem+tUVoBhQG119cd25oxEPXJQQ0l/pRTvevEZH3QVayUOM7YvgVQRBXmc8BIUEYJ3nt0TCLd
 RNjx4mHd08q3x5f5/yxvrE3VUpWWY6Ug9mBQ1+cFcbmBGySKOLNTIqaujJOH1GBCSIE8bHpKXRT
 eo9bA7hBuPymVUjTmENow7VO88QAR1npiUAWuIrtmkTb7xq1rygd/Jch1JNsYHfF1mNnHGN9tvp
 Iszcgr0HWHsIpAX1+FY1PVfFHPTn0bMuigZ37+kE7PZ2Fgrnrqz4DGqsmBQoD2pCyWxvTS9+nn2
 jHXCHwC3sWmykaw2+4oxrN8bV3OT7dxOnJy/9I2PdbKo7qCbGxFgG4tSCAqDHAN909mL1E7U4FA
 0PeZoNMHf/zl/3elRUtClKRj79dgFy7ieUIlsPj/JxInoqUF1FxZ/1oh8zfVe9xgLCFPMY/xOxB
 l5JSv+6xWFdSy1/qd9SJqVhJHBqP6V8Glfn6FDv+8K9jkk6HpQr9hQ9c7LeamRl8DKq91c/hiZC
 MtAt1N2XOsNi0F7zyr/kNVg438Byd/NhQa6lyd5KbIZDOcnVkS5igH91mVY2d4JkXHrUa9pfzRb
 0t5/+gdmFezbxCA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds the G4 tables and G4/G3 compatibles for X1E80100
platforms. Also adds the pciphy_v6_regs_layout to be used by the G4x2
phy and switches all the old QMP v6 PHYs to use the new regs layout.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Added Krzysztof's R-b tag to first patch
- Added new patch which brings the pciephy_v6_regs_layout and made sure
  all older (existing) QMP v6 are using that.
- Switched the regs layout of the x1e80100 gen4x2 to the new
  pciephy_v6_regs_layout
- Link to v1: https://lore.kernel.org/r/20231222-x1e80100-phy-pcie-v1-0-b74ac13390bf@linaro.org

---
Abel Vesa (3):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100 QMP PCIe PHYs
      phy: qcom: qmp-pcie: Add QMP v6 registers layout
      phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 186 ++++++++++++++++++++-
 2 files changed, 189 insertions(+), 3 deletions(-)
---
base-commit: 8a9be2a3cb673dba9d22311beb74be261f0b3f15
change-id: 20231201-x1e80100-phy-pcie-ef74adb9af30

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


