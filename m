Return-Path: <linux-arm-msm+bounces-36638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B11B9B87E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 01:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A3C6281249
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 00:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16836224FD;
	Fri,  1 Nov 2024 00:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Na7BxDf8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEAB13A3F3
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 00:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730422177; cv=none; b=rNzIxvyc2tS2mj//WBBAiYW7nFWrdH37+f5M+FyXm2xTLk6pzeQKlbp9BaBOIcJIQe3tmZAe5DISQqAdSEIDD9gYLdsATLrusDpcGBtviX8BKQ4miNST6QpLvPD+XUbrFNIOc+j+685MxIuoqt+v2LchBLC3dII0HEK7ijFh018=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730422177; c=relaxed/simple;
	bh=hdHwgWkurGfGANj3VzGrzw/oKuEtZXk55vYm8sCzCGU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PbWxJSFo2zNXk6k6jxSj3e8kVfhekoGOfP4ZDeHcimM7PXJGloB9bN1UZdWKZeAieAXGLTBNrIN/hmFqRG4KMfFz/FT+UooUrIURMMFONVMGlIAsLLsnXbmRegnBVJAB3SWO1q+Zf2xAb4LKzSsU37pRMZ87z35aWZkalONY1p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Na7BxDf8; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f58c68c5so2833218e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 17:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730422168; x=1731026968; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DzcXQ2VUHoxojflFhJ4zyH+DlyMbFhuktbFeh0uQyFg=;
        b=Na7BxDf87+MKRugCw8oUkNfY1WvAkDv+LGrkxraUJ0pU9Mr18BjhQmncuPZyBBv8gY
         kB6us60fR81RDMGgq3vucVogzKDrANbG1CBxI6X9clOfGUNdAbMWHZJPeqriLU+iyTVZ
         vvc1sljmvkRWWjl7nLSFSL1tEGZPsB8BmK1hJU3DjzGgDJCpsCQPfSNjSRzl//ver7z0
         UQ9lvSiTtl29DqSK3ISO5u1l2a8hboml/p5R3EuqOlmTfpmiTNa5978qjJCVcVHUIRwT
         dYatL1HP1sPcN7IH2EWWZtO/S4XRuUstVNrZEXMPm+yC0ERMzoz67fuN8/pr2gWHVsrd
         sknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730422168; x=1731026968;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzcXQ2VUHoxojflFhJ4zyH+DlyMbFhuktbFeh0uQyFg=;
        b=m3LoKqsSV61G9eDuyQQxjKNVsowjDjaHXFxrq0ClQHF7knhF7fQqgAlwMmIgkcGh+0
         Im8kECvWgtg+F3HdgrSpOTGE6+P73Z6VLOiUSTinH6Q0PUnlU/e1kpuEZw0auv1H7aAN
         J1sKO3FLoR7UzKbk4fSeg28RFU3Yxo3F1eItuJ+PdDeNotkUivVh/mnmrnzMQxWM4wgu
         7iWlsxTST7JUd4RvdV6s5cmDZEgr3ZDZRbLiQ2/X6TmG5bk62EzYWUk5k2hTfWjCK0Bz
         RuQj3XCgCwckOUNSa4ACVSPmZIpxuwbel4FiB5N/WV9eqk0iLnYeVZngRZWoqGEK7Pbp
         Ebdg==
X-Forwarded-Encrypted: i=1; AJvYcCXnGp4qFXwvLpKrGZfE9EOz6Ad3kIeVkqpzY+4nr5O5PIKj5uRDE6r1rx1C+Na7zom9rsrMhcorCfTBAlBu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/EljdJCEiqbA/EfUdQKS5pMwNPXjYnzikprhErEyPhus1rUn
	pcK1HDzykmCyFshTm/bGkpqpaKEBkcvNQ/zjI0o9u27l9MmEQVTHnBEUswaepc4=
X-Google-Smtp-Source: AGHT+IHvNNizONYk2uGpFer8Bu7ZmCN6ksucX/gtNZZJGB7PZF+QaaBFEAOoF/V4ZycaNh/KywIXRg==
X-Received: by 2002:a05:6512:3b82:b0:539:9767:903d with SMTP id 2adb3069b0e04-53d65e16e31mr1463216e87.60.1730422167912;
        Thu, 31 Oct 2024 17:49:27 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc958c0sm374510e87.28.2024.10.31.17.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:49:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/4] arm64: dts: qcom: add QAR2130P support
Date: Fri, 01 Nov 2024 02:49:21 +0200
Message-Id: <20241101-sar2130p-dt-v3-0-61597eaf0c37@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJIlJGcC/42TzW7cMAyEX2XhcxVIoi1KPvU9ih4kksoaXf/U2
 jUSBPvu0W4OSdAU8ZEGvhl6xHlpiqyDlKY/vDSrbEMZ5qkO8OPQ0DFOj6IGrnNjtW2NtqhKXK0
 BvSg+K+cZRMS7gNBUYlklD093tV+/3+ZV/l6q6Pnt47tmf/hXMXJZVCbIkbuWhaHfTPNxka+gc
 5GpKG1SFEYOtmv/R5kP1DCP40W1JOhAdyZr02/2W2qhQTFpsjZJ9Ch7nJbjc1GtdQiQvDYu7DG
 6lKS0BCKW7Ay7PUa0XHJNWzGm6IzNHBj3cKcTkar/5IxDxOrYb/AtNKb5SZmc0bKX1JHf4zRto
 4yqy75zHEJKCfdkMY6kMPsE1vsgYHaFzqRMPc6sfUycdj0UnWb6U+p6iTmkrFupWHfDUiyiqF7
 McO4PEYIFLZRdqpeDufMBE7XYthGD1qgpJ8Hom1sBjkM5z+vzvV11hVsDvizSZpRWCIHBMRgC+
 HkaprjOD/P6eBeqOb3DoD/DtsJVEVxLUdc2foKv1+sr7+lLxuUDAAA=
X-Change-ID: 20241027-sar2130p-dt-68d3eee86973
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6346;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hdHwgWkurGfGANj3VzGrzw/oKuEtZXk55vYm8sCzCGU=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnJCWTk+tdm6mXKrwtz2Jkc1+rZ88o1GHocjFeN
 oFxcSuAj8OJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZyQlkwAKCRAU23LtvoBl
 uER3D/4++1oXrDxF0kjqdwrpGqakaFOxyuIt+m9zPwsaBssiXKIL5+Oc8TIQDgKjNXIaGi/PVs9
 p5s1KslrDgxV+3nTRO5cbD2InTnN2TtljLdYEyWz6nr9YrPT8XH/i0VDR8MgGTMmPPiFlqqJPam
 cfAxlEwNpsDhw8+sEqJHRuVAyGtfCJ2xPTjncwrm6wTeiFMn2P0j3sE1bEjb8YwIcKXzMy3VsiD
 e1fjOj7gJCyIbE4a+Tr+QIQYMrkGuLv8jhLkmoevuGhhFZ1GJbQbtMcAJ5nzBS5MwUn7/zAwM9U
 br8BYWg5wnU7RR+fW6P3RMjfgb8ReGpu4Wd7CPTewN/geFyKEMcYfWsR4gmFiuS1YE913IvC1Dw
 SjjYOoYtSmh7lFWZl0AwSG4hl/aby7k0aqigb3co2Dn45YjZ0Sw0QfXDuFkqhW/16DhioE2bYfv
 EtsMZWPCqZGJgWNajr5dd2PgGuLWeSZr5QLRvtLKt03FmJ4B7DmbTB/gEcFoB8CgwSrkkl++9wW
 ncFRWlwDgyxxxjCEKjPlmDxE4vnkhxo/gpcgWnZSCCDtppYXpbnKqQozJrUrgwb+ioCPEdpb/ZA
 7lIB86VeVyEdcA8ltJ/dCFq6xs2QA/GQqHhjnCfNFNWepRrbm7E/xdqd6nCJuMqL2O4oawUXXg1
 wakD1Gvcx6xK6hg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add device tree bindings for the QAR2130P also known as Qualcomm
Snapdragon AR2 Gen1 Smart Viewer Development Kit. The device boots,
provides serial console, I2C / SPI interfaces, WiFi (requires external
BDF) and BT (requires external firmware).

Dependencies:
    - https://lore.kernel.org/r/20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org
      (clocks bindings)
    - https://lore.kernel.org/r/20241017-sar2130p-nvmem-v1-1-6cc32789afc6@linaro.org
      (critical bugfix)

Additional bindings and drivers required for the device to function (on
top of linux-next):
    - https://lore.kernel.org/r/20241027-sar2130p-adsp-v1-0-bd204e39d24e@linaro.org
    - https://lore.kernel.org/r/20241027-sar2130p-tsens-v1-1-8dee27fc02ae@linaro.org
    - https://lore.kernel.org/r/20241018-sar2130p-iommu-v2-1-64c361fceac8@linaro.org
    - https://lore.kernel.org/r/20241017-sar2130p-pci-v1-1-5b95e63d9624@linaro.org
    - https://lore.kernel.org/r/20241021-sar2130p-phys-v2-0-d883acf170f7@linaro.org
    - https://lore.kernel.org/r/20241017-sar2130p-usb-v1-1-21e01264b70e@linaro.org
    - https://lore.kernel.org/r/20241018-sar2130p-cpufreq-v1-1-822e00b9a663@linaro.org
    - https://lore.kernel.org/r/20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org
    - https://lore.kernel.org/r/20241017-sar2130p-mbox-v1-1-906aa78b1358@linaro.org
    - https://lore.kernel.org/r/20241017-sar2130p-mmc-v1-1-c84da16a001e@linaro.org
    - https://lore.kernel.org/r/20241017-sar2130p-pdc-v1-1-cf9ccd9c37da@linaro.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Fixed the patterns in qcom-soc.yaml to prevent sa8775p from falling
  into two different patter bins (Rob, Krzysztof)
- Lowercased all labels (Konrad)
- Dropped extra -region from reserved-memory nodes names (Konrad)
- Dropped extra comments (Konrad)
- Added extra empty lines before status property (Konrad)
- Fixed linebreaks in PDC device definition (Konrad)
- Fixed order of pinctrl properties in pon node (Konrad)
- Fixed order of properties in the PMU node (Konrad)
- Reordered properties in PTN3222 node (Konrad)
- Added dma-coherent to the APPS SMMU device (Konrad)
- Link to v2: https://lore.kernel.org/r/20241030-sar2130p-dt-v2-0-027364ca0e86@linaro.org

Changes in v2:
- Added sar2130p to qcom-soc.yaml (Krzysztof)
- Provided the value for USB's hs_phy_irq (Krishna)
- Fixed uart7 node name to be serial@.
- Link to v1: https://lore.kernel.org/r/20241027-sar2130p-dt-v1-0-739d36d31c33@linaro.org

---
Dmitry Baryshkov (4):
      dt-bindings: arm: qcom-soc: simplify SoC-matching patterns
      dt-bindings: arm: qcom: add QAR2130P board
      arm64: dts: qcom: sar2130p: add support for SAR2130P
      arm64: dts: qcom: sar2130p: add QAR2130P board file

 .../devicetree/bindings/arm/qcom-soc.yaml          |    8 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts     |  558 ++++
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 3123 ++++++++++++++++++++
 5 files changed, 3695 insertions(+), 3 deletions(-)
---
base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
change-id: 20241027-sar2130p-dt-68d3eee86973
prerequisite-change-id: 20241027-sar2130p-adsp-fc3fad54ded3:v1
prerequisite-patch-id: a19263ac2521636a3a7b0ed846cf1714326832c7
prerequisite-patch-id: 7401c6f72aa9e510a01774b82586e5941980fbcc
prerequisite-patch-id: 0b132b0936dda8e4c7443b4e7e23ff427dc0d798
prerequisite-change-id: 20241027-sar2130p-tsens-01baed7d9254:v1
prerequisite-patch-id: 20d50df9440a16e1cea78fb674794ebb7dc9e352
prerequisite-change-id: 20241017-sar2130p-iommu-4ce763051f01:v2
prerequisite-patch-id: 22f9d4a5b0c8d50b5a7317375060ff07ebcae4c3
prerequisite-change-id: 20241017-sar2130p-pci-dc0c22bea87e:v1
prerequisite-patch-id: 70ad0a8594e6d224648e0206f9d783fcbb69887d
prerequisite-change-id: 20241017-sar2130p-phys-426733b80169:v2
prerequisite-patch-id: 263dca689cc6e8334d825b19ec9005a44cdc979b
prerequisite-patch-id: fcb8d377116bbcf9f165abba416d25c9be86d930
prerequisite-patch-id: da7fe2737145e858d9572ff51dff3478cf15e1b0
prerequisite-patch-id: 14e7540ecc4d365d2cea78016b2f9ffbac366921
prerequisite-patch-id: 6b2ecc0490d903cee517301c462053d2472e6992
prerequisite-patch-id: 874e118cd420166faa6247754c5f0a3f24de8a1b
prerequisite-change-id: 20241017-sar2130p-usb-0e9ccdef61d6:v1
prerequisite-patch-id: 283d975b372781bc4ab258583c82aa7edaa11edf
prerequisite-change-id: 20241017-sar2130p-cpufreq-d7ba612fd9d7:v1
prerequisite-patch-id: f0e7e53020e954149fc06988a583d4ca9deb7209
prerequisite-change-id: 20241017-sar2130p-llcc-0c2616777cde:v3
prerequisite-patch-id: 6ca6eacd9ceca6d060d23ef95594fb892e51a506
prerequisite-patch-id: dc04e235391820e4ab04c72ac64fd852e73fade5
prerequisite-patch-id: cdb161d351ba3ff4f9e53efaa67eb32b603af435
prerequisite-change-id: 20241017-sar2130p-mbox-1ff72d8eb5c8:v1
prerequisite-patch-id: f3975127d993dadf15bcffb81feb99d213471a22
prerequisite-change-id: 20241017-sar2130p-nvmem-5f856d99bbb7:v2
prerequisite-patch-id: a5520c74bc1a96a952ff6f744ea57636893f6278
prerequisite-patch-id: 7a260ae7850d966e8fecd3ebc5114ac157d23c87
prerequisite-change-id: 20241017-sar2130p-mmc-7f8b32889e31:v1
prerequisite-patch-id: 76b640936b8b98775f8e17f719b98147dbb7be4f
prerequisite-change-id: 20241017-sar2130p-pdc-18d3f08abdbe:v1
prerequisite-patch-id: aa2d8a846ea684d1e127f94e01414ded8b599763
prerequisite-change-id: 20241017-sar2130p-clocks-5fbdd9bf04ee:v5
prerequisite-patch-id: e6927fe4ae24ab139d5fe595b36b9a9182960b70
prerequisite-patch-id: 7cb0ec3c7122856fc33337b9e1e54693a6a7d0fa
prerequisite-patch-id: ec05d49fb2cabbd37a462cee2761bb9509a6aa5d
prerequisite-patch-id: 6c2171274b0615cef421498695bb61b3f1ec44d2
prerequisite-patch-id: 3e7615c0e77e3dbe18267fe556bec7bd5b413c56
prerequisite-patch-id: 8c0359d6075820139b0658ffcf74f8cd91f50875
prerequisite-patch-id: a500c056466cd165fbe3acf824e0b96ee225794e
prerequisite-patch-id: 0abbc5930afb89780a8d833b4fb7cf16865dedcd
prerequisite-patch-id: a8016b8cda7f0f766acd92e6ba8644f45b04f30d
prerequisite-patch-id: ddb641d43225f1165b30bb03b0243fc5bc3e7a96
prerequisite-patch-id: 0e7dbc6cf1359f2611ec19422139f9a95f389f51

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


