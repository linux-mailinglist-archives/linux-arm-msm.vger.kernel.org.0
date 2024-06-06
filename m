Return-Path: <linux-arm-msm+bounces-21857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 907F28FDF90
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 09:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02F01B21FCD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 07:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0955713C679;
	Thu,  6 Jun 2024 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUotXnt3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA3413BC2F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717658832; cv=none; b=jbdI2+T/6/JIZepDD0Mhx9fU0WGCj6sEcs05rdRpLL+p1UYnZjSKtTkyPNM4D/vjjZyJH6eTk2YuBYKMfnh+xyN/g9bHjoO1I2xzxOKTS1aeKilyaACwNnbNJpnWYOTv+Lm1m8x3NDN08X9g1bMR2OSyiZdU0qsJTTxdgCI3eGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717658832; c=relaxed/simple;
	bh=eTnUwNkDQXdrC7n1JvpcvTENi2pHuNndoBzQaRgPaoU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H2rYgtS6lb5b7on+7SRnLRCg3xXkAf3VTJ+4qgNhwKy8BUfg29kuaH2mpJjV7s8Eft58RArO9B77Xqq9aCeH4L3Fs7GzRvQluy7qzjXYg5Z7EUhyIp+fWbUTB67O0AK5IaBrIM6DReqEzyOsj7IZTsvTqXrdTLPSOSS3jsdeo3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUotXnt3; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-702548b056aso526467b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717658830; x=1718263630; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vATXyYpxDoxuMBWGCsFFKBvV2FwTY9tS2i2Q/lEI70Q=;
        b=IUotXnt3RvCUccEuthAMJH8Yt1+eJjUysxbCO4myWRjqJb8I/7NVLposA4wgdUj8LT
         T6B3KSkshdQPjruuPxq1AJGEUDFmO82pKuHxD6e7383ZbhQOOw1pfKCMrEymOaHoTVAa
         qHTiTZesFLRbrzI4OBCOHv5fY8RlUqg5dLBpR5NKLyyp/W9cF1d6a/caAdlDc98Rcp+4
         uEHzpH58z96SSKDnJxP+jLvVqzHfNzUd9MMfgCWw3UvBust9Xwbx5W1avS7hcGXWhEUY
         zYiAzJcLdoI10+Ot37BnQ/ALUnOjSSi/I35JE5RVmqvrTDEprlYvKD9Obh/lfhT8KbJK
         4VDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658830; x=1718263630;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vATXyYpxDoxuMBWGCsFFKBvV2FwTY9tS2i2Q/lEI70Q=;
        b=QNmV2Kxmcd1S0vZRbCDc83p3jJuC80hUg0DfEJtSjziWm2Som69oqGgmrw/raabNqq
         PCUXKGQ8N0F5o9bAdc/l/N821yUmrHy6uMv+Ch67VktiQREI2S/Zb5xqn1ayA40fPirK
         Gz+8qboDi7lKf6QgWTRavEJCU1zf6Ratnisk3sA7/5dLrtBmjqBOOp5n2+p2U1hJaYO4
         WHqHs04qnZCNZtv2l0cREKgfv009ORmzkRagYIadhcv6KT9RyxUL5ba3A/np0aE78/Lt
         i4hUq80bIqQXJDVOlW6oULrhBCUy8nvgY5w6F80VojNnshJLLCvaZEeaI51jc64K0eih
         yt4A==
X-Forwarded-Encrypted: i=1; AJvYcCXfZ/Qmew+o4/qRq/PLqhoF+tYvqGpssd5Zop51caZlow48DVWgCrxM+fiz9oNwsxe8BESVgwUMGCVqqNy6oVUY37Z4FFB+jCBTqyyE+Q==
X-Gm-Message-State: AOJu0YyJfyqCJZVtlFdRna6vmuOSyQ0IViraJo9smSq61BNNQsUSSIYj
	ZXx4aPTsY229bGd6O1JwjWYKoEf0gxLOSCFOyKSRK6Vobj2Lg4VMUred04x6JQ==
X-Google-Smtp-Source: AGHT+IHaMKRV/ZyBSrUsIgLazsPnTH6mNPZ8ByD6J5KfGegSjHhh2dqKlKHNCqkvzSpa+cIabaAPcw==
X-Received: by 2002:a05:6a20:da9f:b0:1b0:278e:34a6 with SMTP id adf61e73a8af0-1b2b70fe1f0mr6173863637.49.1717658830110;
        Thu, 06 Jun 2024 00:27:10 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.142.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd494feasm566621b3a.100.2024.06.06.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:27:09 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/5] PCI: endpoint: Add EPC 'deinit' event and
 dw_pcie_ep_linkdown() API
Date: Thu, 06 Jun 2024 12:56:33 +0530
Message-Id: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKlkYWYC/x3MQQqAIBBA0avIrBNUYqCuEi3KGWs2JhoRiHdPW
 r7F/xUKZ+ECs6qQ+ZEiV+ywgwJ/bvFgLdQNzrjRoEGdvGhiiXJrx+gp2J1wCtCDlDnI+8+WtbU
 PTiaPVVwAAAA=
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@axis.com, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
 mhi@lists.linux.dev, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <helgaas@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2731;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=eTnUwNkDQXdrC7n1JvpcvTENi2pHuNndoBzQaRgPaoU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmYWTBvvClBeGF7FTQylWzbsg9oVTTskz2EOoBn
 Zt4GVpYgeSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZmFkwQAKCRBVnxHm/pHO
 9dwUB/4/uHuy0pOtmq60P1UyLiR+MH2npT+bFuWCf8fMwExCiwaeJHYifh0b18wJgThFXn7F4Lo
 iuzlAa23KRnrAiq/e0hvZmPmnM30g6EXNbW7THksJEFxLdnoSpeyIWg7uIsVak75r1nSfHIKqNj
 sSx1fUpQvxDgWYY+56ZvpDp7KZ40y4MG8iSOv2wVwPGgxgpugNKqY2ogX1366QUpjBOM1clCvwA
 tuS3Xry4kqdFn3bu9TsWOL4HoG/3r+VB7RwuZoMAOe7z17rawzf4OiRQF/WwQO6VgQomU+JUIBG
 hI3tDABYUW5C9SooxoFvxoHMbJIwb5/mXxW8M6dlQzXxeJpS
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Hi,

This series includes patches that were left over from previous series [1] for
making the host reboot handling robust in endpoint framework.

When the above mentioned series got merged to pci/endpoint, we got a bug report
from LKP bot [2] and due to that the offending patches were dropped.

This series addressed the issue reported by the bot by adding the stub APIs in
include/pci/pci-epc.h and also removed the unused dwc wrapper as concluded in
[3].

Testing
=======

This series is tested on Qcom SM8450 based development board with 2 SM8450 SoCs
connected over PCIe.

- Mani

[1] https://lore.kernel.org/linux-pci/20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org/
[2] https://lore.kernel.org/linux-pci/202405130815.BwBrIepL-lkp@intel.com/
[3] https://lore.kernel.org/linux-pci/20240529141614.GA3293@thinkpad/

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (5):
      PCI: dwc: ep: Remove dw_pcie_ep_init_notify() wrapper
      PCI: endpoint: Introduce 'epc_deinit' event and notify the EPF drivers
      PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle Link Down event
      PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
      PCI: layerscape-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event

 drivers/pci/controller/dwc/pci-dra7xx.c           |   2 +-
 drivers/pci/controller/dwc/pci-imx6.c             |   2 +-
 drivers/pci/controller/dwc/pci-keystone.c         |   2 +-
 drivers/pci/controller/dwc/pci-layerscape-ep.c    |   4 +-
 drivers/pci/controller/dwc/pcie-artpec6.c         |   2 +-
 drivers/pci/controller/dwc/pcie-designware-ep.c   | 116 +++++++++++++---------
 drivers/pci/controller/dwc/pcie-designware-plat.c |   2 +-
 drivers/pci/controller/dwc/pcie-designware.h      |  10 +-
 drivers/pci/controller/dwc/pcie-keembay.c         |   2 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |   5 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |   2 +-
 drivers/pci/controller/dwc/pcie-tegra194.c        |   3 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     |   2 +-
 drivers/pci/endpoint/functions/pci-epf-mhi.c      |  19 ++++
 drivers/pci/endpoint/functions/pci-epf-test.c     |  17 +++-
 drivers/pci/endpoint/pci-epc-core.c               |  25 +++++
 include/linux/pci-epc.h                           |  13 +++
 include/linux/pci-epf.h                           |   2 +
 18 files changed, 162 insertions(+), 68 deletions(-)
---
base-commit: 7d96527bc16e46545739c6fe0ab6e4c915e9910e
change-id: 20240606-pci-deinit-2e6cdf1bd69f

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


