Return-Path: <linux-arm-msm+bounces-1501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFBF7F4559
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 13:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF3C01C208F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 12:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995F55B1F1;
	Wed, 22 Nov 2023 12:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ocKnreAj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB6710C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 04:05:32 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-548a2c20f50so4991049a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 04:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700654730; x=1701259530; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F3iRTyYm++LfKkBAqCvb+FLSd+8UJIkyMkD3WQQLyuE=;
        b=ocKnreAjVz1PLzY/hHEvNAMh+CyZ8lJI9EfE53jW6pbP+tGVl4cSoa5fBp26Xk1kuk
         ig0QiYEG/Z/THQzvfggJT/o2I5X8pUBxeh6XxIqOjGgQK7iuOz9nsNWKAgSrUm+PRfco
         knUEDDtAdPOPhhWoISFxP8zwmbIbH02SkMjMXC155Z4OcxO1bMnqOHD2VSRRfJd9wXaB
         4mfBvaCrhesPy+hRDXGjYbuBwXYGdi5EAaa8JxbRu3IauNNIxS0nrjtsrz8mLYcso7kz
         PXM10PfYGf9vS7dmx+cjgMtXqxOfBbtvrRd5Cp9SLKZ4LNFXLvvq5xDP5tupheIwn6Fs
         k/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700654730; x=1701259530;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3iRTyYm++LfKkBAqCvb+FLSd+8UJIkyMkD3WQQLyuE=;
        b=aAdZI/uKrrF7Szz92w+tdfXT0O7mf5F3++fFXn/yP42kBI2GuAzA3iEHbY8rFk3IsS
         7ecwbI2GEnocq5LlfiF6c3EWwDhcrUQk40VDJkZEiBxxKjFlwUM6CgRNaqh2SykKX4ma
         MKQRBQX7WWdlFktzHfPq5z0b6VDu5flikjDtg4WEmyGkg50L0gMc/g/iC2S0Z2bfCtvU
         ATUyC/ZLYgr3DkjUfBSxaP1gJUirvtgxjZiw1aZexJ2iDT/NOm5aLcUAeTMBHj74ROMP
         B12KChqkV4LhNbIsyY0tmAK6dZ2Q60gOlXEwbgTbQrLmHuaCWrHRBpo1+iPjDGBXi6xr
         awbQ==
X-Gm-Message-State: AOJu0YyarXc2pfdP+rks1zOSQKid9zkTM6bjtfHXltf8UnEUH+ZgiWwm
	rpFb6I0Ys61s+kcB9HyWU3Rk5iOxlkdW8MPNEoI=
X-Google-Smtp-Source: AGHT+IGDuvN3XpxCMad1R4oTrZlqTFp4K28uSJGx5TCUw6otAoFmnB30kMshZ4Dfx1vmSXvLFKSpJQ==
X-Received: by 2002:a17:907:2913:b0:9ff:cdf3:553 with SMTP id eq19-20020a170907291300b009ffcdf30553mr1258514ejc.61.1700654730525;
        Wed, 22 Nov 2023 04:05:30 -0800 (PST)
Received: from [127.0.1.1] ([86.123.99.122])
        by smtp.gmail.com with ESMTPSA id kq14-20020a170906abce00b009fcb10eecb2sm4383416ejb.84.2023.11.22.04.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:05:30 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/2] phy: qcom: qmp-usb: Add support for X1E80100 USB3 PHY
Date: Wed, 22 Nov 2023 14:05:20 +0200
Message-Id: <20231122-phy-qualcomm-usb3-uniphy-x1e80100-v1-0-3f5bd223d5b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDuXWUC/x2NQQ7CIBAAv9Ls2U1YiJH6FeMBcCubUFohmJqmf
 xc9zhxmdqhchCtchx0Kv6XKkjvQaYAQXX4yyqMzaKUNkda4xg++mkthmWds1RtsWX5yI7aKlML
 xYoK1+jwST9A73lVGX1wOsZdyS6nLtfAk2398ux/HF/QYbuWIAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=834; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=eXw1PqnDXRaa9q9LSnWqKj7Y4vQ414LWHrJ5zXCLXcY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlXe6CIfxfp+7KFdffH/AKuF0jZrge2rhNCZck9
 Xitrixfu2CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZV3uggAKCRAbX0TJAJUV
 VscqEADCMX8wxjIQDp7Ts+yxwcdjGaIvk4Dk0x3mRQOs2yib9BEsK+wOoAVG64XaTFhmrZcOxo7
 gIXHi7EniFlc8vmYWA0uibbT6Z0OFIboDtINccW7bgJy71VaizIt33NIZChKg2KfE8ppUerdRQv
 /IRGtaCFuuPoRpDizOLXNsWCutzpjbTecAPcl8TKZY7fILlj3rUg9i+57Pl0o2yB67shUrHDKJi
 gYqeOgjFrcee6zZTVJJRoQ4dI21kshKnDEtTSG5TMDSVHcaBin2C6bPTFoqIvDSCLil9phFetUk
 BUCqXbtafZKL/pXvbAgopZtXMUUEsvC+YfOI2n/VgKx0MO08D0Uw/B0FNK4kyTI8wkQymkDfSFu
 uB/iUshNkj5xTjde2WUr+NV0cVcBP7EULmeVxqYKU3AiDzTr2t1l0qCWjrAt+QrxxcgZ68njFQ3
 g78MwreFBaOCB5F2rZrFQMsVubB/4X4F6B9oEAT8KxRf1ycF3Ht6pDR04wNFsHuOC76cGWK8rq2
 qVoFS97bb5H8es0G3rARQWNkBOOf4wBmIaSJOLLYOCkf/MQXyUKS19Ow7xOW+uZZl28Cb78sz7M
 5mnwIRJc75dE7qQs/ycLzjP0fsbUQjK/JTMGVS1a66A7ko6JTxaYOTsn5hgEA/uyPZWUm4+VGcJ
 PMdiO0Yr5cAvwtg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds support for USB3 PHYs instances found on X1E80100.
It depends on the v7 register offsets added by the following patchset:

https://lore.kernel.org/all/20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add X1E80100 USB PHY binding
      phy: qcom-qmp-usb: Add Qualcomm X1E80100 USB3 PHY support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 152 +++++++++++++++++++++
 2 files changed, 153 insertions(+)
---
base-commit: 07b677953b9dca02928be323e2db853511305fa9
change-id: 20231122-phy-qualcomm-usb3-uniphy-x1e80100-973c882591ef

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


