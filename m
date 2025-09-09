Return-Path: <linux-arm-msm+bounces-72724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E68B4A98C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 475503B7B7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 10:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D1831A572;
	Tue,  9 Sep 2025 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H0PBeCYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BA9309EEA
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757412490; cv=none; b=chyAyVoGiI2IJTROQBpePKlTPv4nEUMDZo9rmb5ZSeVjYhy6AIegwo5Q0MfpSIvEJXqPCRTfMvRgMH+TFi/JEFzNoqZ13NKQ5buYyrknHLoNv1leC8cU4MQpQb1tpyOjKbs6Rf3Sa/6jTfomnlOiev1Xz7ZjGn2+87r332JtEPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757412490; c=relaxed/simple;
	bh=ORlIfeVuUFj8TqCHe+6GbxbXVnDrP5dWUNMSw05JOiw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s/NIGkuz+atPiNEsQvu8tRM+KQSWFt9ONzko0t2RJtTnzu3SukWEipeMftTut8QUoQqKR/FIE6adW2qHZI1xpkPvh1bB9JYdMyykEWKlV42xqijLT0LLgP50efw6Eo3K+Q/rEScXORMmn+etu2TXqViE1ReF5E/hkJgrhCuLCPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H0PBeCYN; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6188b5ae1e8so6423773a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 03:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757412487; x=1758017287; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+MjkjuuumUbUDHtDIz2dF54RODSv0Du6+TYcnVJO6uY=;
        b=H0PBeCYNQJnYa3YBklml2RS5ogbcZq3C08p2RDP/tC9Tn0CojrWZAS+9Zn+BYj/qgh
         51ewQCkOZ3p5rAsa1g4nYozmSmt7/4KOUEMf8Oknm2D4TgetfDtwfSqOlCq5T2s3nZuX
         OKg/0ZCJR+/IR265bzZi51yzkSSYfI1Cs2uzeKJPFgtoL+xp53qGsgCk5o9Mx4q1jxKF
         VlCV30dQbkC9EAoUwVKvQBdO4yODd2wURQ76BFNovTW+cUtrI3CEt44aMGIqG5+BVkR2
         /qsjE1XVwQaB0A7y8twdQ6aAxijxFeNjXMZbnRJtzjCWzwy5quPSxlqiqCFqMz1xy4b9
         alwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412487; x=1758017287;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MjkjuuumUbUDHtDIz2dF54RODSv0Du6+TYcnVJO6uY=;
        b=e07/ZLpmtmRuFWKfqvTrfMZLLQ7A2d01MhGtuAbk+lvMkWyd7USHLUfuxEeObv2FAk
         dHbfeVt//Bta5H+KYfQoRfqRm9Y4m9QTom0ImxNWHE3oMOREhB9S5PftuqmHdGNhkXui
         YzQsxUWE2jbGObBFnnt82/daC0y0t3x00EPvM3CcLK76G5Uv/5oWQ+xUQz9zSot12gCK
         0NHYrYOswx3zKKPYheoBjEoYWcps1BpNxzlIGgs2sG+mfnsHb3d0WEJ3ZiJzZlX/DImC
         a7QB4J9LmNiwIb/HT6KYnvHkGEJOdhI2lgyHPfAEnQTXUJhPph4gLya1sWknCSO7NBo8
         PqpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRzGeEsBGQRHf+Hs4yfnRWPbH4cQ/NQA09lFX9D8Y4Bmaf5k7S0zi+yH7xSPdhJZNlL5MiEA8B1vKoOV2C@vger.kernel.org
X-Gm-Message-State: AOJu0YzNJca9tzle2y10G5+8S8Ljtr30rETeKRi9+d7Ptp3EwNARbz1A
	UgwSLiTY35H/K+c9ipT9vdNuykrxQ3bUgzs4ve1wKgyFDL1AoqbYAjJwpJW89we0EFQ=
X-Gm-Gg: ASbGncujQIMqCJ3GM8+y817J62Vsn5YvJ3fPahMq+jFfkzfcrhyqdOTvTnKExNOj4tc
	xIoiNR5tcyvYORLNoheR6FRaIfZSnes0wE3pBXEsXcsW4M8HI5/CGDSBxRrPR9yPhAUbkmoGU1Z
	gdPUq9TOWNuEbn4+Jo2STxBn8h0WgORyVvJQrEBV9E5zfXeQvkStHe3nqS2ct/euJ9VaWPMSb5E
	WXIRvxmuAJ9ddFUcC215zgvKExP4Vd7BLlmuK7QjorsQWnI/QaQHmM4oxPMVxiF1ipR2J2uqHvK
	2NhPQwgZxtp8Fjj8ObZ9aHdsHM0HNfz+SoJSZxyLsvHplaQbpJUdCo4Shc/yx9PhGROT7szueIA
	uPAyOe1rsRw93ftiwtAzRJME=
X-Google-Smtp-Source: AGHT+IH56pjx4S+xCzwszByBGw0i4rHRRP48D6P7XzQ02qobQwECTA0WZ5Ve2z2zBNo3UUrAel+vNQ==
X-Received: by 2002:a05:6402:304f:b0:621:d92:d85 with SMTP id 4fb4d7f45d1cf-6237b87545amr7716194a12.25.1757412487214;
        Tue, 09 Sep 2025 03:08:07 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c018f65afsm965379a12.41.2025.09.09.03.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:08:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/3] phy: qcom: edp: Add support for Glymur platform
Date: Tue, 09 Sep 2025 13:07:25 +0300
Message-Id: <20250909-phy-qcom-edp-add-glymur-support-v2-0-02553381e47d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF38v2gC/4WNQQ6CMBAAv0L27Jq2gFJP/sNwKLRCE6B1C42E8
 HcriWePM4eZDYIhawLcsg3IRBusmxKIUwZtr6bOoNWJQTBRMsly9P2Kr9aNaLRHpTV2wzouhGH
 x3tGMQlWcX7UUTSUhVTyZp30fh0eduLdhdrQew8i/9tcu/rYjR4amyttLIxUvyuY+2EmROzvqo
 N73/QNKR+2JzwAAAA==
X-Change-ID: 20250903-phy-qcom-edp-add-glymur-support-2a8117d92b89
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ORlIfeVuUFj8TqCHe+6GbxbXVnDrP5dWUNMSw05JOiw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBov/x3qh+1zkzDZKKOEjks5vxfK+KWla2sIQ5P5
 CtcqF+Ai16JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaL/8dwAKCRAbX0TJAJUV
 VrOND/0bhPxTsAz/y8hRCHNuaCoalofm1WeqNCg0xItbMiYGXqqM34dXABJB610AlCboDhmrxOg
 F96oqb6pfPgXC+Ly+5OxT95evYyGGaz+QQu/pt4x4KqQ5Fp2yTeqIpcWQ12qEt0K0Jsh9d1i3VF
 893hpYSpuynvLkbW5Njyawl+LcFc2oiml2cqojIfTRAeGTJjtNpwQDQvj4h81ICCX36xG0f0oPL
 dtt7AVhIqKNO4WgQ2E7t/1bqV/nRoPxbtNpgZDEwqTTCiWyUMi6yScBXSB9RYT8LV35dWmbf6jz
 0x1w+9BZN+j+XmIHNWgVbDCs0YX/6CbBOqZIIbcZMlsBvwgQtpBOcidLQjv3/hC0dsXeGh7Vwer
 Z//L3yzcsihZ3xRGm7bDUg4nnPYC300faDTIq6Xt0GK8iaAjMoOwMZOg3EJH18jN+sryNy8nfmi
 MbODlV66UA5e3DwFxY770D/0pK2y2h7IqjLSQd1opCUYBEWR1v2FfZBgXogiB/iF4X/m/BlZZoh
 xTeycGgrL/kNQqSQWBuyBdjLMIcvPA37RUIwsCnRrQELlBW6bPb0PQHT8PHw8y/Vse+9jkGWnYs
 PAB2h7t2hdQL7WrudaCexQMV71bF6u9Aytn5j2rvi0lSOi/ca8ty681aNJiyIt5lrp2mzuUUKAX
 wSiRGQjFsorC3UQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Glymur platform implements the eDP/DP PHY version 8.
Add the necessary registers, rework the driver to accommodate
this new version and add the Glymur specific configuration data.

This patchset depends on:
https://lore.kernel.org/all/20250903-phy-qcom-edp-add-missing-refclk-v2-0-d88c1b0cdc1b@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Sorted alphabetically the both the compatible and v8 specific
  configuration.
- Prefixed the new offsets with DP in order differentiate from PCIe ones
- Link to v1: https://lore.kernel.org/r/20250904-phy-qcom-edp-add-glymur-support-v1-0-e83c6b9a145b@linaro.org

---
Abel Vesa (3):
      dt-bindings: phy: Add DP PHY compatible for Glymur
      phy: qcom-qmp: qserdes-com: Add v8 DP-specific qserdes register offsets
      phy: qcom: edp: Add Glymur platform support

 .../devicetree/bindings/phy/qcom,edp-phy.yaml      |   2 +
 drivers/phy/qualcomm/phy-qcom-edp.c                | 242 ++++++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h  |  52 +++++
 3 files changed, 289 insertions(+), 7 deletions(-)
---
base-commit: 8128ba77e80a40f545381f1b31267f2f204380fe
change-id: 20250903-phy-qcom-edp-add-glymur-support-2a8117d92b89

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


