Return-Path: <linux-arm-msm+bounces-3695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4BE8087CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37E3F283C7E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D584D3D0A4;
	Thu,  7 Dec 2023 12:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NCXfN3Lv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CFA10C8
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:34:26 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50c222a022dso115263e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701952464; x=1702557264; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idNFXUDeTCb9cuCDDJuvMArzVa/3N4PhXRLdWCeeLAQ=;
        b=NCXfN3LvHbkm9CzgBUJPM/GGdPYswnH01PIhYuU/mXMw4FFIVlpJwn6rD8O5zqqAsP
         XxBCQR11ZQ4FZX4Os+LZUu5IGWGu4tN9wJH+HZM9n4uMtv3ZWdh+cxyQ0XNwZIdNaQDD
         Zlrx2T0uLwnIPQypT6K4k2zYR19lEDnOrGh/Um1BBS1Vyil3IgEa2JkSv6KTO7RZD2pn
         kxIgpiiFzqpeBy08j4O1SMOJ/nl01LuofFrlKUfazrcSDW+u2DQqowZ/rxHQNPrPNA8U
         vY2GEamEjeWqJzwNFEUseC/tiJH8nfG9YlUfodD45B53rAeDPJOdJoCQy9JsCcwUl4Ad
         nt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701952464; x=1702557264;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idNFXUDeTCb9cuCDDJuvMArzVa/3N4PhXRLdWCeeLAQ=;
        b=nxVeFwe8pcuuLVwk7jhByRE2seh1uXXK4x5LbB+oM3aaWdpOiqKNVBpLQLiE9SE9IK
         bVcR3UrmsUkSa4xbMSpu8vydxjWvWWCol87bh5Ch7R1UpD0rn5Na0hWc66AyZ9XEu58Y
         y8E0HMUur9DN3txu4r1Y9kb8f0Soy94FXSWWtwxrjdI6w6+2rm5RVomxX3cJVUxbWxYp
         TsA99em9ADy5V4cfoSczxpGp6LPTjjovjODFnHFXIJ5Zez5qR7rNDdlWF62DR9zhsaFM
         zOJc2eCHCAsEPKNB0FvTOJ3KVO8cNVrnCC3z8UekNeQHPj2nI6o9cGfLhiDiMvEvbbWh
         qlcQ==
X-Gm-Message-State: AOJu0YxpD6etH702h8B1V4+1FqwmVlXxzVhuLIx/ciybVtVm+qPk6hU4
	yextFPe1xCS+EVR0rFgs+mmtOw==
X-Google-Smtp-Source: AGHT+IFw9+jhBJU5GR2px5plT3QUZ62XtMeTFEJiK9qC7iWCtK5RiA8HWa2W2HfALfRO0GvwU1z8bg==
X-Received: by 2002:ac2:4428:0:b0:50b:efd4:1475 with SMTP id w8-20020ac24428000000b0050befd41475mr1392716lfl.9.1701952464529;
        Thu, 07 Dec 2023 04:34:24 -0800 (PST)
Received: from [127.0.1.1] ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id c69-20020a509fcb000000b0054c86f882bcsm747331edf.22.2023.12.07.04.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:34:24 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 0/2] phy: qcom: qmp-usb: Add support for X1E80100 USB3
 PHY
Date: Thu, 07 Dec 2023 14:34:10 +0200
Message-Id: <20231122-phy-qualcomm-usb3-uniphy-x1e80100-v3-0-273814c300f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMK7cWUC/5WOQQ6CMBBFr0K6dkxnCgquvIdx0cIgTbDFVgjGc
 HcLO5cs31u8/78icrAcxSX7isCTjda7BOqQibrT7sFgm8SCJClEIhi6D7xG3df++YQxGgWjs6u
 ckUuJUkJ1VnVZUlEhtyJ1jI4MJmhXd6nkxr5Pcgjc2nkbvt0Tdza+ffhsPyZc7Z7JCUGCagvTE
 KmmMPm1t04Hf/ThIdb8RLuTlJKoFWNTlcUp57/ksiw/u1tzSzsBAAA=
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=uCgc7bBM7vglJNBa0/vPovuGzjNc308c2ZpWtT5/tX8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlcbvHE9IMZ3fwyYvfhXsLPGnaw5Cm10fetNyMn
 +z/C88MSreJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXG7xwAKCRAbX0TJAJUV
 VlmaEADDe5i5PHYiZWvX5vSkL46jtrGdXj183eVPG/jscT/eq9bCp1+Xy8sGeMsjrZAxQge8tDJ
 ljQ8VE7I3PjguvYmkLhuM3d4ASL1kUxT7LEU05jM5RFFFcVflEgLbQMBDbiPHTEA4Hhwu/Ok0sL
 YxJ5m9Mzq86x6HSl15BgRVcHf15XiAmMmCJSCwfr2EkF4Ja/ISzJYprn5qnLrvYVAg/S1ssL55V
 XxHspXYn5J2AfdZwfiTF3x1xMTP0vGzONHTP3iy4wqPS/j1c7QE067x7FgCVQxsJXUK8JzI6hoM
 qBQlg5jHcLPW+W/5URC7tF9au8HDdtV1sWsDfv/u87aiZ2U5pF3fAQUDXjHNXItPred3tUA82MB
 EjDh+EDW9nXvhgpatZMw8g6T6PjITCg0KH9cO3yKGt0OuvMhUKNAsoJfc+jCGoFISTyjIoi2tPs
 +Exf7zKA0NKxLH1rDUkgcoCZ/Cz1AIxJsNsM7mhHdr8rwuOYyaja1n7jb/Ix0rJXw0EL8Gn2pPf
 AjfsMXmdVXVHGMqtyhmtAvElGzAt0DpJLpeP8Mrvn0etfgiSddu3lKu138t2wHnHT8YENdYqgqn
 EIvzQHwtQUmPzDxhdaGB9DL9vbNbQurk/PXU8bwnjy0yMKzcVRzGB2EQjF5yzzkgeWUyl59PIR3
 7gFqLqQKOQy+wSw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds support for USB3 PHYs instances found on X1E80100.
It depends on the v7 register offsets added by the following patchset:

https://lore.kernel.org/all/20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
- Added qmp_v7_usb3phy_regs_layout like Dmitry suggested
- Added Krzysztof's R-b tag to 1st patch 
- Added Dmitry's R-b tag to 2nd patch 
- Link to v2: https://lore.kernel.org/r/20231122-phy-qualcomm-usb3-uniphy-x1e80100-v2-0-1a3e1d98564e@linaro.org

Changes in v2:
- Added qmp_usb_offsets_v7, as Dmitry suggested
- Properly sorted the init tables, cfg struct and compatible entry, as
  suggested by Johan
- Add entries to allOf section in the schema, as suggested by Krzysztof
- Link to v1: https://lore.kernel.org/r/20231122-phy-qualcomm-usb3-uniphy-x1e80100-v1-0-3f5bd223d5b4@linaro.org

---
Abel Vesa (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add X1E80100 USB PHY binding
      phy: qcom-qmp-usb: Add Qualcomm X1E80100 USB3 PHY support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   3 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 171 +++++++++++++++++++++
 2 files changed, 174 insertions(+)
---
base-commit: a2a7cea5da9065b9e34a8bf3275241c1129ebce0
change-id: 20231122-phy-qualcomm-usb3-uniphy-x1e80100-973c882591ef

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


