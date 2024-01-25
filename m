Return-Path: <linux-arm-msm+bounces-8371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1954383D096
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3CB62958AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5DA134A0;
	Thu, 25 Jan 2024 23:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="icF6qDOC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D01612E5C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706224982; cv=none; b=UU0j8B9eWefKw2Ec3MSDcbP+bKqkn1xl/5jLhycKkkWYFuHPSqxZnbDKeFf8gaVGvD9myCja5BlmzksgUFPoLCiAhXWPck0Tg7NK8s/kBgRbI4ZqXBnoAC1kRkJw0tctJ9wEkuddLJRip5rVbxp6quGzAb0ka3yQt1L83pNnYi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706224982; c=relaxed/simple;
	bh=EaPmvIrH64MNXrCSBN8Nyn+GlMwOHCv5l8nt55jlLuw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lk/tmib5ZKlIrCWBh4Nob0C384uvsI44bk0jm/Xf0HghTF0oJKsUEwUsUSmPwDshlq4dEIxgnvEO3dRz4fk4HM7zCS2Mg3XLXmMRWzRbsy4NeHl3LMK1yb0DLJpTdxlKx4ESZFhi8j/piqVFfFa/AQSbpUu/UH3BvuGhANOBkms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=icF6qDOC; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5101f2dfdadso1789148e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706224978; x=1706829778; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I77hIOPDHZqRb1VrXDKP+cEud9VJnWouv168YllT/hk=;
        b=icF6qDOC1QHUmhAVjHqRmMqicV7wQTyL+urPUYytGreTfPhxZNWvrEU5v4buTpqzH6
         PfnjA2qjFA5vBhRZTFr159PGYxjcz4CsMfb6c0qrVTLeXSSN7LdHPSRSGon592yErDhw
         xHD5E2o/1njhUygjpdS4zl7dG74voaoyBSKsY1e2ZqXg1xnb9brm5neJHGP04SAlZZ89
         S4rMmBY4/A01v69Ui4dMzV7ot86sEiB6rfYXHk96YL9+mjtD4aaoOyEoC1pwC+FtOkbp
         hgpuAKG/kau9Muv3OHGLiRxOj2oOMNUAZiZzXg+2+gB1vcqSoSfXWocNmGYW06g7WbIY
         RhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224978; x=1706829778;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I77hIOPDHZqRb1VrXDKP+cEud9VJnWouv168YllT/hk=;
        b=qsn00qKbzPA3cXI5Vx8nfsZ9Dg3fF7MxgQuyo5zaANzeaG5cM2Zxl8amL8egErEK3q
         skn8Bk7Vdso+sfUfvMn1ASrTuI7M3MhnFfTXgSDb+uvMZe8ELXa0/2CqkfKb0uhCiv7s
         DbW3kO15R91GVyoSzcga1+n3YRaOKLe+LAs66q2De/W161ISQVM3GK6KZxLW1aMf84Ga
         /n7GI7ZYJrO9R+AjZHXpzE+1p68pdxrJsthZhTgVisuatvBKCNPEdEKEcDTQ/jo+Yk7O
         6zVLylvGHXozPxd/kgI65U+Ov5NMftPzyHKIG+3O/n3rP/RZJaZXluvbpsoCJDaZb2oP
         eoQQ==
X-Gm-Message-State: AOJu0Yxs3Dpixc5djxgN3vxzmni9lyUZmETobM3fDI6KKGPoMNKAzlwl
	TMIcN4n/8fXWlQwRop2m+Tch+z0hnjRb5pHXCXSUnzaJfdQKBdViMDM3VxdBZ/usX61oJf4uAi4
	s
X-Google-Smtp-Source: AGHT+IGfezyDNKL9GenHCf03ccQrCPBMVcRDST9G7xNUwawazUaRkcoJPPuUdoAAETpZ1wk1Sh57QQ==
X-Received: by 2002:ac2:5290:0:b0:50e:b23c:e37 with SMTP id q16-20020ac25290000000b0050eb23c0e37mr256367lfm.48.1706224977340;
        Thu, 25 Jan 2024 15:22:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k3-20020a05651210c300b0050e6df07728sm3920lfg.180.2024.01.25.15.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:22:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/8] phy: qcom: merge common register defines in QMP
 drivers
Date: Fri, 26 Jan 2024 01:22:34 +0200
Message-Id: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADrtsmUC/22NwQrCMBBEf0X27Eo2tpp48j+kh9LEdsEkdSPFU
 vrvxoI3j2+GebNA9sI+w2W3gPiJM6dYQO930A1t7D2yKwxa6UqRMjgOMz7DiMFLKbsUQoroToa
 cI0fW1lCmo/g7vzftrSk8cH4lmbeXib7pT2j/CydChfVZG2tbqo5krg+OraRDkh6adV0/Xbb08
 7kAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2511;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EaPmvIrH64MNXrCSBN8Nyn+GlMwOHCv5l8nt55jlLuw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsu1PHdTsu7cVp5r24fWYO8eOWHm2qoY0CzBe8
 7Cy3OX3QouJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLtTwAKCRCLPIo+Aiko
 1RGVB/9zBd3lxnvyBVN+s5ao6owHdwpcsYwpEiAO1O7zc2NHyRQQ1X4+bLVesAmuiso00s5bCMe
 x92P6ZWGzOpXsq7To70Grp9598UQKlNxU+YOzxJNdDO+/EzL0aCumqgxUp99ExPqrVx85yzmlcN
 /zvLX6Olgks4vfyDpCAUobKGMLhRYxOYe/k3uTqIYS5scA59yg/qfYqccO7lFdGKWlnC13GfVtW
 ylH/U3NXTcuJT5m4QzUtzNEf2l4VxN1QqKHkt++bl2c1XTApHrBgeEroyy8Fl6BTgkzoZVt2olb
 TL2y29sswd4c8WWtrL4GsYY8q7bYjKOJsht4JK7bygEgqyR8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

After the split of the gigantic QMP PHY driver, individual drivers
contained common regster bits definitions. Move them to the global
header. While we are at it, also remove register definitions from the
phy-qcom-sgmi-eth driver, which is yet another QMP driver with its own
embedde register defines.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Squashed the outstanding fixup commit
- Rebased on top of phy/next
- Extended cleanups to the new qmp-usbc driver
- Link to v1: https://lore.kernel.org/r/20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org

---
Dmitry Baryshkov (8):
      phy: qcom: qmp-usb-legacy: drop single-lane support
      phy: qcom: qmp-usb-legacy: drop qmp_usb_legacy_iomap
      phy: qcom: qmp: move common functions to common header
      phy: qcom: qmp: split DP PHY registers to separate headers
      phy: qcom: qmp: move common bits definitions to common header
      phy: qcom: qmp-usbc: drop has_pwrdn_delay handling
      phy: qcom: sgmii-eth: use existing register definitions
      phy: qcom: sgmii-eth: move PCS registers to separate header

 drivers/phy/qualcomm/phy-qcom-edp.c              |   3 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c        | 109 ++----
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
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c          |  97 +----
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c         | 102 +-----
 drivers/phy/qualcomm/phy-qcom-qmp.h              | 111 ++----
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c        | 441 ++++++++++-------------
 18 files changed, 513 insertions(+), 883 deletions(-)
---
base-commit: 01af33cc9894b4489fb68fa35c40e9fe85df63dc
change-id: 20240108-phy-qmp-merge-common-d681dd1d1995

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


