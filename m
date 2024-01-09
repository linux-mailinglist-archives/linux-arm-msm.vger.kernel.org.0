Return-Path: <linux-arm-msm+bounces-6701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0B9827D2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 04:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 196AE28625E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 03:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9843FFF;
	Tue,  9 Jan 2024 03:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dNQ3/O9U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE25433E5
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 03:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ccc6e509c8so31195521fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 19:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704769443; x=1705374243; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jHq7G5tPYOrJZNq7Usqn+mPLOUEA8a1PkSKcieA2wLU=;
        b=dNQ3/O9UPaX0R/mot2yKjBClIL346ePmiN2yJA9mXXEv5cd0o6Lo0V4vCYbRN5b+Pl
         tCZbgsWC0ifewn96rQ2+iQMxPcvEoNhlru+jv1bEzr+GgDGvuYMv5+i2SB+2IqD56A8A
         esG/YrJCzOnH06t/8pkCwNE8o0W38D1P+8Y8FU9NAkJzycSG7G0EJh7qwl19/c48qi7E
         16b/0Px9EFmUpzBDvfe1qJk3Ep6F/ViCu4FXO+PLgFrIJPoOnil0WJ/pLk2PvT+G0Aca
         5phnnE1VcqCQfqFgdp+1aPeat5gwaH2/MJrRv2voQ3MGONu5j9KHZ1Z6mttNCIoClInd
         iSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704769443; x=1705374243;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHq7G5tPYOrJZNq7Usqn+mPLOUEA8a1PkSKcieA2wLU=;
        b=PlHwiYuGUpKhIQdua1sWM5Yb5cUdley7vGeGo0sTe+V0X6FVkt/UgSavbKz9XZA30j
         Rzn36RU1/seW8P2A2q65ZpZ06RlSjnONkl0Ka4ZOOc5pe0aFJQ1LwG3CsQ92SJpEANWG
         BVwHN2VbaV6UJzjWkDMgc0qymmPAO4GWyrKq8ieNVmGK9QsobrjiUCjxbdNggzKAtiXb
         UHVwzxA4L1fVN6aZhNCiVun2IfDJERvAkOrUVjUTGoHjvP7uDBRrnZ0rHB9LDuFAx/sy
         SL+mWoKAvLHdqUhA9bFt2U/Vg6N+i0lFslhlv2R6isW/NvDR9W9JetPuqOv2xbWTqHve
         6+hA==
X-Gm-Message-State: AOJu0YxihavdCsjWUR5oS0kmtWpMV2fWemnXnI3n2wWYRbvy4rXlPhfv
	QeMK6aKIDMl1llQIpNn5HcLBtBRJwCu3lp2g4exMau86yCOy6Q==
X-Google-Smtp-Source: AGHT+IGnvp9jZLgG6CuumBjIJ0fl9O4JktnPnumRZH0REhZI8N8LyfAF9E9lHQobvOUb9HberpnfrA==
X-Received: by 2002:a2e:330f:0:b0:2cd:2938:417b with SMTP id d15-20020a2e330f000000b002cd2938417bmr38599ljc.21.1704769442617;
        Mon, 08 Jan 2024 19:04:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g30-20020a2e391e000000b002cd1ad3b11csm176920lja.42.2024.01.08.19.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 19:04:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/8] phy: qcom: merge common register defines in QMP
 drivers
Date: Tue, 09 Jan 2024 05:03:58 +0200
Message-Id: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ+3nGUC/x2M2wpAQBBAf0XzbGpHCL8iDzKDediL3RLJv9s8n
 k7nPJAkqiQYigeinJrUuwxUFrDss9sElTNDZarakOkw7DceNqCVmOXirfUOue2ImZj6voGchii
 rXv92nN73A70S0P9mAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2218;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Wdbb6JKXTmgqpW4wPGopTy/zUcu1Z0nETpYCYivTf9Q=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+qc7QtupPY1miW4/rqcknT5RODu5wnTFXmVfKbE+M+o/
 5x4afejTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMpNyDg2HJiX8FjxeqnPbs
 L3Tb8Mo0+tadBc8L2X4wTyg7dssi+/1XBaXkeFsGWf0fiY7Jes1Mv3m2TfywVJ9n0k9dXf39MQf
 6c3MDpu45GGNxs38Xn5Rp8sb9bkfShWZWPfM0tf2aoDJdQyezJy45xfaG4MrjEs1Z6zz2Rl6Z5a
 1T+OSkRM6COuEf75ZaHRDnDHgswNHjktyoYSW5f16k1zHZ0M7FJeHmzDkHlv1P8ZbaOndBhdSxv
 ll+6xYKSbBeMTzekn6r/5gSJ0t3iO2k3hMRqaFKbKV5Ms8E30yamuoUcf35ros7r+jPlHlfeqmb
 UYzr89wsM46Tor9N13U2eu/OszV/9MRgrWxIr7vN5l17AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

After the split of the gigantic QMP PHY driver, individual drivers
contained common regster bits definitions. Move them to the global
header. While we are at it, also remove register definitions from the
phy-qcom-sgmi-eth driver, which is yet another QMP driver with its own
embedde register defines.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (8):
      phy: qcom: qmp-usb-legacy: drop single-lane support
      phy: qcom: qmp-usb-legacy: drop qmp_usb_legacy_iomap
      phy: qcom: qmp: move common functions to common header
      phy: qcom: qmp: split DP PHY registers to separate headers
      phy: qcom: qmp: move common bits definitions to common header
      fixup! phy: qcom: qmp: move common functions to common header
      phy: qcom: sgmii-eth: use existing register definitions
      phy: qcom: sgmii-eth: move PCS registers to separate header

 drivers/phy/qualcomm/phy-qcom-edp.c              |   3 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c        | 127 ++-----
 drivers/phy/qualcomm/phy-qcom-qmp-common.h       |  59 +++
 drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h    |  18 +
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v3.h    |  21 ++
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v4.h    |  19 +
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v5.h    |  13 +
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v6.h    |  13 +
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h       |  62 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c |  70 +---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         |  90 +----
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h    |  20 +
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c          |  72 +---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c   |  76 +---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c          | 101 +-----
 drivers/phy/qualcomm/phy-qcom-qmp.h              | 111 ++----
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c        | 441 ++++++++++-------------
 17 files changed, 516 insertions(+), 800 deletions(-)
---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20240108-phy-qmp-merge-common-d681dd1d1995

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


