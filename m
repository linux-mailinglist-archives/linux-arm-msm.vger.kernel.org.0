Return-Path: <linux-arm-msm+bounces-36812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDA49B9C63
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 04:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FE242827A4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 03:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF1613A250;
	Sat,  2 Nov 2024 03:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ETM40HX4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564BA2AD00
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Nov 2024 03:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730516601; cv=none; b=EoEgJ+0Dq43B4DZYLNWml9lJ+VB7rrwkdc7XtgmubJAgOc9/rkMpR9Vf+hec0/GS/wrZF4JcdWAd2U0JY3hTKKxyMEXxU+c/pBVg3MOVT0FI7iuZIhwvL9d1xjP+/ZH1lxFiLGtZD5MJKMbZ04gxspCPgAHjkfpIxXWsNUAEcNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730516601; c=relaxed/simple;
	bh=BQFATnDkA7qoE5E2dqyMr7OLxlTsPa02lEZYLm9AxrA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W0TEHOMk45PU6oWK9f0wEwMBU6RIf9jSJWsF5hnUZLAVwvOSztqIpkX8i+iBgM7oV6DDzFuO9u/PG0zC4iYDrtC8oPeDM97X0ZHQt8QWY2oHr10m5E3CLfsJ/JMONC2JcSYJyOQNXtQm9VWfjupk0ipqAz5psOouUWe9MHOIJQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ETM40HX4; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb3110b964so22194021fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 20:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730516597; x=1731121397; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ow4G9YlNHCWKVOimjEdAYp5tp9lVUrnTb7YQeU776zY=;
        b=ETM40HX4eMIcmpigV6iRYBL+AHsWraNur/e13ILrGpfl8vqgVa+GFfz4+fMV+H7S5Y
         gWBfe3j3JZxyKQnDtXRFZcTUxs5CN6B9WGSs+z9xk1WH3HlkelnHdw1GORUXWb9+Z/2Q
         ZXL/d8QkSTRadxVsLnrOUhXD8WftHqXCTkN3+EfpRda6FDNrZbrqZdbWh127ekf0EqWH
         OIBVStTjmlYUtw97McYe95Hdz+B753bmnyvTHAgFNYdd05FffOpXMqDoHV2AUY4OqqUu
         jV/ACrwKrZ8Y/ZaBNSFBLbQbYrRoPt17CJ8Vnl+094Wwu/3FcQeVsor2vDIBzF5gfne0
         fo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730516597; x=1731121397;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ow4G9YlNHCWKVOimjEdAYp5tp9lVUrnTb7YQeU776zY=;
        b=KWPeW5OLdWRfxMnv3uuvQNC46abMpj23PfhRXZlcw3jR2SMFr2lxP6gsjrt0pJN7Na
         gRyALyYQ15mufbVDbRU/rO76GmX9jmrlppCT3e/ey5rB5iRnZCfZy3Ihm9l5uV53iLE1
         26cC8va3+UfjdE02Q2gKTNFrLaIKfTCmTDs+XkxRx1Y7+JK556ootY3Fc7R2LVzhsSOC
         sgDonEniLine183rmCDZ3YwrNlycHmWp+HK7xGfXX7rqUODR2SPezu6Vpp1Ab6taruwW
         uDPGG2cV5jieQ4wUkxpVZDDMU8z0Q6luex1kiESs4DryRMc1SdDCNQUCi7XKO+JzsAl0
         AtDw==
X-Forwarded-Encrypted: i=1; AJvYcCU83FTYDvw+CocfrRnyVemGvWmRAYnmE+qpiNSh5QSB+j3e6x06twJHbQkcHnTrhRqCg7p9++OIZtPAWwlm@vger.kernel.org
X-Gm-Message-State: AOJu0YxsEIYeHuaPHeX/9Mq7eFQeJV2dZs4tS7oEZTYKbJiYJuGsvHwJ
	mBs9LPYnENTT9gwpfZeyHyYRCRSd8jY9KqrEAaLZ2lPgR/+iBgkas6Wb5BdGt0kerSootwcSrvo
	N
X-Google-Smtp-Source: AGHT+IHOEGrh1cJ3+1+Cv0qKQ4l3PH/ALIS3w7RAciEFgBOewCThCNdDonICNXtA2fH/TyvhrwxXcQ==
X-Received: by 2002:a05:651c:909:b0:2fb:2a96:37fc with SMTP id 38308e7fff4ca-2fedb783624mr26150021fa.16.1730516597292;
        Fri, 01 Nov 2024 20:03:17 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef8a6070sm7455811fa.89.2024.11.01.20.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 20:03:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/3] arm64: dts: qcom: add QAR2130P support
Date: Sat, 02 Nov 2024 05:03:11 +0200
Message-Id: <20241102-sar2130p-dt-v4-0-60b7220fd0dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCWJWcC/42TwW7bMAyGXyXweRok0RYln/Yeww4SSTXG4ti1E
 qNFkXefkh7SoB3qIwV8/09S/N+aIssgpel3b80i61CG6ViL9seuoX08PokauNaN1bY12qIqcbE
 G9Kz4pJxnEBHvAkJTiXmRPLzc1H7/ea8XeT5X0dP7412z331WjFxmlQly5K5lYehX03xs5CvoV
 ORYlDYpCiMH27X/o8wHapjG8axaEnSgO5O16Vf7LTXToJg0WZskepQtTvP+tajWOgRIXhsXthi
 dS1JaAhFLdobdFiOaz7luWzGm6IzNHBi3cIcDkaozOeMQsTr2K3wLjWl6USZntOwldeS3OB3XU
 UbVZd85DiGlhFt2MY6kMPsE1vsgYDYtnUmZepxZ+5g4bfooOkz0t9T2EnNIWbdSse6KpVhEUb2
 Y4dTvIgQLWii7VC8Hc+cDJmqxbSMGrVFTToLRN9cA7IdympbXW7pqC9cEfBmk1SitEAKDYzAE8
 OswHOMy/ZyWp5tQ3dMdBv0I2wpXRXAtRV3T+AmGO1xnfoShws50ASVmTYAP8OVy+Qe4gJi7IgQ
 AAA==
X-Change-ID: 20241027-sar2130p-dt-68d3eee86973
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6444;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BQFATnDkA7qoE5E2dqyMr7OLxlTsPa02lEZYLm9AxrA=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnJZZxzez/4oIuFz6cl3hH38Ig51IPX4t+GFAxe
 YTd2CIvojOJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZyWWcQAKCRAU23LtvoBl
 uIXPD/4kolcrNO61Vf/R+s5dRM+yb19ZQWuM3zcFhq7ochQYt1TBoqp28gcuO0G5hNoC6oFbpw8
 l1OKaRu8e9iL/yDsTswQCAcary08NUL0zy3gYpWJK5a8LxODxhMUDpQvOHUUS25UKwBYDhCJK1F
 c/Ry8HTTeNK1u6WaKq1cO3XnJKOBvQW5FVeVw2w+39qJO85tcxWqemEE0pNp+LCkS9uNgBV2KRp
 /liks6MRyTThpyZ5H2rPW5y/kn3Go/0Fkh/LYDYXRagxAzEi4d77ryyNDTlcZshvUIOBKVhf6Ij
 IxXZtZyNSGNArvx4MjoNafLK1wMwO8969uhsu9vzXEcL3bTLcElckMH9+lusAGk1LzpAHWebZWf
 Rfgp9dnQabQxUkJyjReuRRZRT7NdWQCvkHk2pF6MS2UmMU9/n/rI4+eXRQWzpeeZiqgaBPi8cnR
 DoPnCWB5ZPqB8P/8MGSPTyUP+13lHHdzbvW1q7af74LEAh7njSR8aOknuZWPIjM1e9dtnm1wKML
 DYJSSyBPO9rI68wlDepEwmFUklVnvnZAIE+o/fuq87GR+Mslghb7cNXaHNvM8Z3kzmMu+GUJ7ZM
 CMY0pZndAugTLIYkRKIkP/EiHpIky6GZpYy51Pbo4ibY43kfLbM9D2n90YnNfcK7iXuY+WZpSoP
 5sKOGZyebzx2Khg==
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
Changes in v4:
- Dropped pattern rework patch
- Fixed sleep clock ID
- Link to v3: https://lore.kernel.org/r/20241101-sar2130p-dt-v3-0-61597eaf0c37@linaro.org

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
Dmitry Baryshkov (3):
      dt-bindings: arm: qcom: add QAR2130P board
      arm64: dts: qcom: sar2130p: add support for SAR2130P
      arm64: dts: qcom: sar2130p: add QAR2130P board file

 .../devicetree/bindings/arm/qcom-soc.yaml          |    3 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
 arch/arm64/boot/dts/qcom/Makefile                  |    2 +
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts     |  558 ++++
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 3123 ++++++++++++++++++++
 5 files changed, 3692 insertions(+), 1 deletion(-)
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


