Return-Path: <linux-arm-msm+bounces-36056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A66299B1B9B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 02:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32C66282206
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 01:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA707E555;
	Sun, 27 Oct 2024 01:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YLnBi8BE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFDAD530
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Oct 2024 01:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992251; cv=none; b=l9ofE4YvKMXNjWclT01SXmYvie2nIyfkZE2ydRHpJXlJLlR4PeT428YZtQBXCeTTiJnzHm7PBHog3GCu6UTP+69DrUfriMedtntpyxuevlvQYCEU/5bpOAuK8NJQq3T1VylHJCB6HHXVGa3hSCFNVXwF/epigupVWdvQxMtpx2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992251; c=relaxed/simple;
	bh=1pZBI18oNqocqm6PR8RghihAT9odsvMpt5vSubrQKBs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gVQfZZnhMJO0azmgatSrLvwZHhthtpqrJ6dVrPN8DqtFmIuaGb6aapVU34qrXUVGSDSLzSpGsiWwvIfxDnS5JZi9tid0YCZ1hxXhhsLOP6MeTWVHTvMvtcoYBtQeF5NaQ9hkBGRJq3IhR5n2KtyZpYuvEpSB88FxpAa9Vyll/2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YLnBi8BE; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb5111747cso29589931fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 18:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729992247; x=1730597047; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EppU3i5rDzOrHLzp7XLGSc7eRglYjMn3g4s/WhXqYQg=;
        b=YLnBi8BEKjpKVQHUjbS2iDj6YY8gVzXcsxzMVakfG9F81kcAYIxVjH9lbpAN99l9iz
         RO5Iw09HL3ogO3iwIc/lcOCbxP0fCTDgmzAhImnZ3RrfoXgxRVI/WmguR5+NUHYBF6xd
         T60ZZZhWINvENVRIK4isYkGUJNoLNp4Wi8tJuYebqTOGn+Weyk2l5EgTDWsCu76ZWugE
         kG8IjVYZQnFQv6t6QMpq/rz2kCVuuv2NRNgH6vXOBWBBivxDACKaNFVphe/zOFNBpzxr
         Jr0jbCVkIMt3XDlUP1imBEthd8DMFqPCva2uWOOVHy5dqTBf0U0rhqsLwAWn7jdZMK/T
         P99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729992247; x=1730597047;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EppU3i5rDzOrHLzp7XLGSc7eRglYjMn3g4s/WhXqYQg=;
        b=aCRnLuTHvVrj8wQxBwS8GDBqycS20EWxTt1SMS41KdcVBPxTjCI0puTrdhDQVaMxJc
         ZpEnMbI2I6eOI57DQKzjMY+O2M9sAxCww4kseSVWsfi2n6tgb2rUXWAfNJdV9Xw7xS9/
         BW3hUmNSXEcMAexGk+zAuWgb5lZsXaJXWSBqk0ff4YK06UQIlrNz3ypOgNgr+Ga3lTUX
         HJ0BWMm5zLiA9e+zdKDGg+SOp7wsxufFDjzxbMVx9rRtxZghN5aZwXzr1Yo7LJ0HOX/w
         /tWhQ/dl1WTK9l4wevx+Z/iWZHpAfNzvgZGXfDCwwM3PtL1FNkH+FEWZCHVMzJRG4/zP
         C8PQ==
X-Gm-Message-State: AOJu0YwGtfR4w8rd4eyDx9fqn+VaCAQZHYaBdJ/hp30lmWGgFOKsrw+T
	IIo5HP1TCC3wz3Olw7sb3XEAVVeMp1NWIOh6TwiSob7vF7NMU5mDbAiHU9JPH74=
X-Google-Smtp-Source: AGHT+IH0iNtKitb1gftd/JxSfoLMkb9fABEcXQZrnW3/kLmZBqL8hGEn9fWPJpagG0b/p0xxq64xAw==
X-Received: by 2002:a2e:a99c:0:b0:2fb:6027:7c0a with SMTP id 38308e7fff4ca-2fcbdf5fcedmr13309041fa.8.1729992247053;
        Sat, 26 Oct 2024 18:24:07 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4519b3esm6913881fa.44.2024.10.26.18.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 18:24:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: add QAR2130P support
Date: Sun, 27 Oct 2024 03:24:02 +0200
Message-Id: <20241027-sar2130p-dt-v1-0-739d36d31c33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADKWHWcC/42SS27cMBBErzLQOg3wJzapqwResD+MhYxmZHFGc
 GD47qbjRQwkgbVsAq+qWV0vQ9Nt1jZMp5dh031u8/XSB/vtNPBjufxQmKXPgzMuWOMQWtmc9WY
 FuUFM4lU1xYx+6MS6aZ2ff6t9f/iYN326d9Hbx+Mfzen0t2KRtkJlX4uMQVT8tNvh8yL/gm5NL
 w2MpaKCkt0Y/kfZT9R8XZY7BFaM3oy2Gjvt7ktq5RmEDTtHWhLqEaf18VeD4CJ6T8nYmI8Y3Ru
 B0cwsWqOVeMSI13vtaYMglWhdlSx4hDufmaH/KdqIiN1x2v2X0ELXZ7C1opOkNHI64nTZF11gr
 GmMkjMR4ZEsloUBayLvUsrq7aHQhcH2claTCgkdOhSfr/yz9fVIJFM1QTsW3jEqTYF7Y+bbdCo
 +O2+Ua6TeHKxjykgcMISC2Rg0XEmxpOHh9fUNVNjNh14DAAA=
X-Change-ID: 20241027-sar2130p-dt-68d3eee86973
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5242;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1pZBI18oNqocqm6PR8RghihAT9odsvMpt5vSubrQKBs=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHZYzRlOweXi03vYaIFuRg33eRBACPqIbBbkg+
 lXwi+S5P2SJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx2WMwAKCRAU23LtvoBl
 uGPKEADCVOeRJG7E4UziWV+YLKZsmVTDJGHjRQb53lJ8iUHLw4T+/pJ+0Pn2oj7GaHZcYTNVGHJ
 g6yKWznmEXqyss16twwdhMgU7qQqq1aMR9tj0YQ1pJjixJKc/21jdry5qlJaCgCCocrKhlg7y4K
 MVqT7x19lmvuMRqdFsShJPOhjdwaQGCWIZtFJE+HreuWkP8HL5VI75WhxnbICFggVIQbl3AlUjZ
 esDL0DokX5jXRmApjMfI//xzF43WwMpksbgPKvg5DMc6YYEo4fiTmaHGGTdgsii1fZSABRwEhmy
 /x5ic9+Ga582afWdoB3zMHd3Ih/NigvzzOHwegGYnD4m8qP0eqPpeb293o3SqttVfWuDEB+6JkW
 wC/PZ9wVDzFaRqmsZgXlfs5sN3bnv8Wt+QvFfeocLg1Xcd5eS6qEMPKi3OK/F2UN7fxxlYvdUna
 EnEF+xYJkqdmznlEhq2dqTnYE83vATUt3FDZXzwaUIw7JqxzfqjRSN/8nBXxOmEDvEcUupGGT+h
 uE+3CiA9FVK+r6+3aWs45vxx70UPx4tIRrAQ8ywkMfGUmnGzPSYCmiB9KkDPC8jcfZimWBdC7sb
 vy6Es1N9XQdIw/YjaoOenfw0/cGOuA4saqdy2u0zr37rVvXbGd37WBluomh9CGeZsd4THMxbI61
 BAn2wXjAQsw6Zew==
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
Dmitry Baryshkov (3):
      arm64: dts: qcom: sar2130p: add support for SAR2130P
      dt-bindings: arm: qcom: add QAR2130P board
      arm64: dts: qcom: sar2130p: add QAR2130P board file

 Documentation/devicetree/bindings/arm/qcom.yaml |    7 +
 arch/arm64/boot/dts/qcom/Makefile               |    2 +
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts  |  551 ++++
 arch/arm64/boot/dts/qcom/sar2130p.dtsi          | 3091 +++++++++++++++++++++++
 4 files changed, 3651 insertions(+)
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
prerequisite-change-id: 20241017-sar2130p-clocks-5fbdd9bf04ee:v4
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
prerequisite-patch-id: 37062c04b8a3fc2a4434a32bed4b0ec66325ae2d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


