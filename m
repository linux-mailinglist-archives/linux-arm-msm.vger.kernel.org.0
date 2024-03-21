Return-Path: <linux-arm-msm+bounces-14735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D2D885830
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 963D11F21B19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E7358229;
	Thu, 21 Mar 2024 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YMLwfvcv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD7C5730C
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711020194; cv=none; b=CTWkE0UmmGRhH7vlABw5pc27XJDayabS6cWiAnwSfxPIaiHcGuP4RSPMdeSwq6QjzbOsBOjbsibYKBmV15A+dLtZTar+TF1/lhZpTvdec895HRzXd/jupCTfqD3lzeUFANo0tYeaAwM1EGVZS51vmHuzzVe/VAkJz/X2Kc7sKzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711020194; c=relaxed/simple;
	bh=zv9KKqUc9fAa+niST3PvZen5PrPnTLP0uZp7en464NE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bKMaTqU5OoPDXMR4NwrH6bNjkdmgBftWT/FM7FZwxnAAS1ApfK+YhyArFpLPaT6YLv81BPTXDVvb37l8hsffowOI7wIT+8fQvKir+Bz103KRCThfTigEeA8+CTU6/1a20OeiQsgpjeU4BC56SDc7A8U4KgSuZYBDODmn49U17Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YMLwfvcv; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7bed9fb159fso33956239f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711020190; x=1711624990; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AoHRZqUApoexBQclJ0SEIArATxYn4nvqO1XMi4tAf/I=;
        b=YMLwfvcvZtgzMxPvc6rRyyfK31zhpy6jL4EO//5w3tURgbkbjccJYlwgm+I5TH7TL3
         IcPRk0BlUURAUQ85IY+ez7P99NwshsWyCclKJ2ntUECU4xd/TeWpto1tLHjxeA99umdp
         IqlcL/KamWBJ1on/ciiHDNgumjFQID/sEjWZpgR7UUYSFUncScC2Thggj+Qb5d+CLc9V
         d9LhJ2d2qbJJAPO2hQiyXwLlne/NS/4orR6pdTP2tUu6d44MuylSCG52bdLGO+EMUoGv
         nxhbAw345tLSbq+Ji+aImF7C6lk1rx4FJy8QOcq2K+Qf61axpu4NI3oa9PeeDRvt6V3Y
         UCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711020190; x=1711624990;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AoHRZqUApoexBQclJ0SEIArATxYn4nvqO1XMi4tAf/I=;
        b=VjcyhLvZWRIuvH4Bh+2rUmHqA2wKQtmLMNpEuWoUd0YkGWV0l65Ey8tYjmtDWVOa52
         KvMuE3d2Qli4A5jUYD856X7h2mK8LHBU1JhVdLPxiSJVsj/CYnA5qo4j1WbqqGXvOKIg
         T3j4xcbEJpkZMik/2kn2twF3ZNtT8U69jhxDhXgvTMdG7Zx9D977C9Stao8ISn3akIRY
         92+z9RJqgW5bFUtMWzRnbpl6SNkKERBEC89DvLmYxlsCmvJ/haqHDBo0AYl0tQNbiOUD
         kfguuIGSSdeHfkX0Zt/Nhep9n0zxZ8mEvAIRK9q4zLBqDu/FzBP6xgLKBxO3e9XYbkoV
         3Qbw==
X-Gm-Message-State: AOJu0YwVOjejQ/Idt5rWi3f8MR7zGJ6oPI6IMe/ZDmqXMqPbZ8yklvQW
	U1wCujydclh4sCT+XMOe80yFbSSy8Ujs3ZhCAOG8Xl+Re2olaZztjs8ktecE1lXaxHR0LmRhzUY
	=
X-Google-Smtp-Source: AGHT+IFJsLv0LKyhdDZ4hWi1GEWRRF4DiaqFe0j7aUXHYQSeixrjn3jVZLnWa1Vb9aLvT3uBlbwP/Q==
X-Received: by 2002:a05:6a21:3a84:b0:1a3:5d70:1828 with SMTP id zv4-20020a056a213a8400b001a35d701828mr4489419pzb.48.1711019795777;
        Thu, 21 Mar 2024 04:16:35 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:16:35 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 00/21] Add PCIe bridge node in DT for Qcom SoCs
Date: Thu, 21 Mar 2024 16:46:20 +0530
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAUX/GUC/4WNTQ6CMBCFr0Jm7Zh2rERdeQ/Dgv4AkyiFKSEa0
 rtbuYDL7728722QgnBIcKs2kLBy4jgWoEMFbmjHPiD7wkCKjCLSODkOOLv4QivsS++XhPZycsp
 rWxuyUKaThI7fu/bRFB44LVE++8uqf+kf4apRYe1q36nuas7K3588thKPUXpocs5fLDKHybkAA
 AA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3620;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=zv9KKqUc9fAa+niST3PvZen5PrPnTLP0uZp7en464NE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl/BcI0ubzqSFwVpxkGZjd+njegKvBWv5lTO3O4
 FkM6u/CmWaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfwXCAAKCRBVnxHm/pHO
 9aYkCACWDEgfPJUitECHdt0chIpNj4kwVLqbDXVmOr8c8MxzTZESFZKLUCfNyPhr3jqiWN23u1V
 sC+vVz0hVomQUcsf1ZsuTk7422nRScDN+DTf0GxIcmP3Z3ZDd1b47Ybe7KyxempGzW/GmHWLp1+
 qZGi3nODxg/B4/Fk/+JplaqckHupMvIFuyAb4SgYf+AYBhuGCEJwhQBUhEhEEoAASIU1/0/4fRr
 cbHqnOCu3bLxtQrknVHa8Y6nEWFwNSVE9EvXlPJ+guuQp6mGECJdRqYNTvE5js81RzxVP88ciLD
 aViBc1H73jdbgEBnEB377dkzsv5PXV9cHKjsjNIj6an4kIT3
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, this series adds a DT node for the
PCIe bridges across all SoCs.

There is no functionality change with this series, but the PCIe bridge
representation in DT will be necessary to add the DT node for the client
devices like the one proposed in power sequencing series [1].

- Mani

[1] https://lore.kernel.org/linux-arm-msm/20240216203215.40870-8-brgl@bgdev.pl/

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Changes in v2:
- Added label for bridges in sc8280xp
- Collected reviews
- Link to v1: https://lore.kernel.org/r/20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org

---
Manivannan Sadhasivam (21):
      arm64: dts: qcom: sm8250: Add PCIe bridge node
      arm64: dts: qcom: sdm845: Add PCIe bridge node
      arm64: dts: qcom: sm8150: Add PCIe bridge node
      arm64: dts: qcom: sm8350: Add PCIe bridge node
      arm64: dts: qcom: sm8450: Add PCIe bridge node
      arm64: dts: qcom: sm8550: Add PCIe bridge node
      arm64: dts: qcom: sm8650: Add PCIe bridge node
      arm64: dts: qcom: sa8775p: Add PCIe bridge node
      arm64: dts: qcom: sc8280xp: Add PCIe bridge node
      arm64: dts: qcom: msm8998: Add PCIe bridge node
      arm64: dts: qcom: sc7280: Add PCIe bridge node
      arm64: dts: qcom: qcs404: Add PCIe bridge node
      arm64: dts: qcom: sc8180x: Add PCIe bridge node
      arm64: dts: qcom: msm8996: Add PCIe bridge node
      arm64: dts: qcom: ipq8074: Add PCIe bridge node
      arm64: dts: qcom: ipq6018: Add PCIe bridge node
      ARM: dts: qcom: ipq8064: Add PCIe bridge node
      ARM: dts: qcom: ipq4019: Add PCIe bridge node
      ARM: dts: qcom: apq8064: Add PCIe bridge node
      ARM: dts: qcom: sdx55: Add PCIe bridge node
      arm64: dts: qcom: sm8650: Use "pcie" as the node name instead of "pci"

 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 10 +++++
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           | 10 +++++
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           | 30 +++++++++++++
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             | 10 +++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              | 10 +++++
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              | 20 +++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 30 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi              | 10 +++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi               | 10 +++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 20 +++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 10 +++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 40 +++++++++++++++++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 20 +++------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 50 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 20 +++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 20 +++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 30 +++++++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 20 +++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 20 +++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 20 +++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 24 ++++++++++-
 21 files changed, 418 insertions(+), 16 deletions(-)
---
base-commit: 10569bb9fb9732cec670faa38cf1460cabeffa09
change-id: 20240221-pcie-qcom-bridge-dts-b83c0d1b642b

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


