Return-Path: <linux-arm-msm+bounces-7308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD682E7A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 02:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 074FB1C22C77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 01:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599D420DE6;
	Tue, 16 Jan 2024 01:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o9K/zBGX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE77320B3F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 01:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cd853c159eso56312911fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 17:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705367475; x=1705972275; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FuT1DaaoZzFJEGnrKpG/Tzsp72d4M51WYP5lgXMmZno=;
        b=o9K/zBGXogilbed+KhzS3mE5qKraSJNnTG0KxLEqg/OefsFO2m+hJVDtnDDvgJ4Lps
         g0rk0p6c7kVLMgX75olDYMGo6TChcy6Yao4FXQ9iVJsprGB7hraIsubcN9tDJ7HwTU5N
         8GU059hCBH8HSKwGlwWstLTjOkQRZ+7+hfnyEad8PQlK29RLf3lzFDVAqZXI4vkqLbVQ
         +lrBsCbUe28geMLGXn/hMF7bADPbU1ggksZgfJT8qJR5352c3ok7rxwhNjhEisrs00lM
         fdskbWbqKdSHSJAgrCOUCb6hc+q/+/VJ+zOPLAdRxsL3qsVNTVhEU+xUsevZvIuG4IXk
         HxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705367475; x=1705972275;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuT1DaaoZzFJEGnrKpG/Tzsp72d4M51WYP5lgXMmZno=;
        b=ohUMZc/nIuhshZ62ts3UaAPD7S671ZJ5ojV4uth8Eaw//PSqGyQ0279Kgy4VtCHvfR
         kr4bdc7kpf35qYNCyO1cWlXoBpGJVkjOXqv3PXKEPTrLKTL2U6gb5rk2ic1eCIqbm4Z2
         BWjcsDfN/rVEHzcxfv8h0mk460q4yqghtsyg4kuCmY+J2YeO5ENDJ5CEEM1JMIzmfG3J
         OUgyd2zTbc6D2ILF79+PojGJ39oD3sTlLDRzlo18niaQjCQO8Cyp/xOgteNqp+T8LEAT
         NsjJkzASMQ9A59GyJNwbLNgiqPgrndHvyYfvdIe7Hk82UYai8zYEkr4FW643lShPgrtz
         +LbA==
X-Gm-Message-State: AOJu0YzU+ludRFHUJcIqyfyLnNfDPBLsJRP7uWGkCxwE3eOUHRrm3f/E
	9+xeFVfG2+Xv5f7TJ4sNoCDI6Pp2ajzSm6xj0hZGlbhsQJMzyg==
X-Google-Smtp-Source: AGHT+IGyhsXsnRx/d5EzPD1IgnMLJ1jUTVTcSGSZ1BQPLWqIPq/ZA/bdrN+ZSmIp7P0TutZabWsR+w==
X-Received: by 2002:a2e:9013:0:b0:2cd:dfe:74c7 with SMTP id h19-20020a2e9013000000b002cd0dfe74c7mr2998718ljg.21.1705367474822;
        Mon, 15 Jan 2024 17:11:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q15-20020a2e84cf000000b002cc7a2f7a9asm1513414ljh.98.2024.01.15.17.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 17:11:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] phy: qcom: qmp-usbc: enable SDM660 support
Date: Tue, 16 Jan 2024 03:10:54 +0200
Message-Id: <20240116-sdm660-usb3-support-v1-0-2fbd683aea77@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ7XpWUC/x3MPQqAMAxA4atIZgNtLRW9ijj4EzWDWhoVofTuF
 sdveC+CUGASaIsIgR4WPo8MXRYwbcOxEvKcDUYZq7S2KPPunMJbxgrl9v4MFzbOTpWihmpjIJc
 +0MLvf+36lD5GhRa+ZQAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4+Wceje7kSG2L86r73rRdjLpXN0pBa/Fh0jrdnHD6tw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlpdexq13GIcRe8q7m4biVtRgBz2DhlPntHD3rf
 9T4kSFiLGeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaXXsQAKCRCLPIo+Aiko
 1fsbB/9cj+61hor/z9r2g2jDT7le990apsTRNdvB2MDIBB1N3G1276UUNvM8qs8yioH3wWogUgd
 j8Pw0Ev7tCUdNb6265mME+s8/Q+DFZHwY5kH/JP440FvL+sWdy8EseTI7NdLMByvjpx9aCLNyra
 DHvL4Fw2Tmz2ya+NpRueMkXUPakj5lgGZS4X7SeA2zcp1y0I40QWI/V6rWHY7uSgy137U6QdJyM
 quBbgxpDpe81sHaHG8G0B/TowKpCcpOup8SNNU1vx+NzI9J0juggwFWBLp2y9OIznM4jonwP3wd
 9gNjvWOC6wfWW+jXE16tHv8G7gmHGKfTuRM68YfYvLKuKU1I
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable support for the USB3 QMP PHY present on the QUalcomm SDM630 /
SDM660 platforms.

Dependecies:
- PHY-related changes of [1]
- [2]

[1] https://lore.kernel.org/linux-arm-msm/20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: support SDM660
      phy: qcom: qmp-usbc: enable SDM630 support
      arm64: dts: qcom: sdm630: add USB QMP PHY support
      arm64: dts: qcom: sda660-ifc6560: enable USB 3.0 PHY

 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    |  2 ++
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |  5 +++
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |  6 ++++
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 36 ++++++++++++++-----
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |  6 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 40 ++++++++++++++++++++++
 6 files changed, 87 insertions(+), 8 deletions(-)
---
base-commit: 737cf0e409063e44e36bf564cc679f9eb88f6e8d
change-id: 20240114-sdm660-usb3-support-964c30e9e722

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


