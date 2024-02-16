Return-Path: <linux-arm-msm+bounces-11390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF46858425
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 18:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1E6CB217EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 17:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F6F132493;
	Fri, 16 Feb 2024 17:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtZsMfv7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39C0131E30
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708104902; cv=none; b=l0DSsKvWgI9s/2W8LAnWBwuGMHkcOuIsbHaBxH1r24dWR5naNkp+d+QaPat11+y8iFkXeRgJMun/WohiDIIdiA6piGYNXZObxdzLAYD36yZp/gvGM4eFB7JxCYjlDIMwpvyYlfpGcY6a/OGwB3TS11BajjJnVM1DD9qgW6T1pHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708104902; c=relaxed/simple;
	bh=99VEk3JCJiDH24Jv72sqb98zC6yFP+9ws46GoTojhW0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tZIfvLk7pH1zw1Uy54WlNVVpgowOX+nuIGSCMfW5CDfMLCs2Lqw5fTEFlKQ80OxG6BpSSavR72E9V7QAocP48OBk/zoWOTL/Sm10dcg6qraknN1PREUZK6vkQHrH2TLlRyMxpxVIcD3XrydO/Vzq43UlIh5LvQdonzxgQKSSIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtZsMfv7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d918008b99so19655995ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 09:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708104899; x=1708709699; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mo7D8foZvWwiKzcVMAsIOcGfmFdA1mJSQiHgs+esco4=;
        b=xtZsMfv7WZS3qA/yXNlCJQwVFeqSz2lb6fjLx+k+qdxNQg1dsBW1hVUMMgG2RuzlbC
         lpm52ARGmc+gnqDW1LGLchuwUHCukbFpwCv1yr/ZcU/nhBQz3LaSlsBBUGNA8CwHH2Cy
         IHcE+0/olWamaT4dlLrYX1NMvvFJ06rK7OKP7Bqv8vLhJDxfOmrqdkzURLEHIygVcl0A
         PMvXxlPuyXT+82u+JhEpfOu6ftVk8FZiumcVdgeGUI3XzRd1VsEX5+yz4rxq/s/Bm1/y
         FO7RNabvjTTWDGSYOFTarRtNMXEIlE5gts4Np84aJRq/5HwqiWaz3ZC6fpyMrg+MZ5nL
         5/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708104899; x=1708709699;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mo7D8foZvWwiKzcVMAsIOcGfmFdA1mJSQiHgs+esco4=;
        b=cW9Cr9etdj/PsaUiqgodqDLZUcr7Db2RLnCSNIP1GSQzQL51SIkjDrTysW4A4BRQPa
         80FnbRaJ5i3MXseg3KvsqHd6KAlPWGVyn5J97dgK/yWe7c16n3E2z2ddfc2vxZJrZKxh
         fsr30ZljoYktgMrvV83BN1EA8M9cfYwldNqEZB4QT2owNzZLBo4gsLhl6qlYi4uZed+e
         jj7Vr8r4arF0hzz7oRQg1RQJ9tR/h5/FS65pnlY0zsjpJU0zpkNyPtRqnoZnY7soBE3z
         UfRtLtAYBTXcQl2g9mridgJkxC5NMW66mPLAvNGYQrcyb499bfNurAKrOZVPEqSWX65h
         wC+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9hi/164MirtAQqojSZZePGQKUhEi6XzuWo92uv1oThi13W0L7nsNl4hvvkPba75NsVo57Dv4klJqH/pu0/I2HVrKzPBsshEYgzljzJQ==
X-Gm-Message-State: AOJu0YzcQUdVTjzkQRJfklGDNKPXhY3WF1Paqay73ObOBZ1B5P18u/wk
	R89ka81G8xiEs0zLZS2h1itxCb798WQpysmzQBfZZBrmVJf8g2+u3G6VNbgiQQ==
X-Google-Smtp-Source: AGHT+IFk4N7zOmO4de9XyDDsNksT6JFJf7NdhjEhj4LMWruSTWIvTgCKpk0OTkcC+I/9vwrWBZd6hA==
X-Received: by 2002:a17:902:d384:b0:1db:9a8c:7e6f with SMTP id e4-20020a170902d38400b001db9a8c7e6fmr3961946pld.29.1708104898948;
        Fri, 16 Feb 2024 09:34:58 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id v9-20020a170902b7c900b001db5241100fsm118592plz.183.2024.02.16.09.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 09:34:58 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/5] PCI: dwc: Add support for integrating HDMA with DWC
 EP driver
Date: Fri, 16 Feb 2024 23:04:39 +0530
Message-Id: <20240216-dw-hdma-v2-0-b42329003f43@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+cz2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxMDI0Mz3ZRy3YyU3ERdM5OUlGQDy7QkY4MkJaDqgqLUtMwKsEnRsbW1AMI
 0aL5ZAAAA
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Mrinmay Sarkar <quic_msarkar@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2441;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=99VEk3JCJiDH24Jv72sqb98zC6yFP+9ws46GoTojhW0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlz5y8/nDWN+q7bOqSTwmMApHd0RdZi4kG0v2Us
 R/zkzK7KXyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZc+cvAAKCRBVnxHm/pHO
 9f2MB/wKutNeeQWuBJWdggFALHVJZ/xi34jw93TUq4RTBXX2RsNOIFMplUKyw9Z4v/FfFlq4vZF
 5a7A1WU1IKubiwSRWWtWPsxqLW8VgdIMQlwQzO+HVM4UsyCvQD7BEYlVU6usyZTB3AFV7ShBN1I
 uoCZmc3kii12NlYwGWOBXk8+FmX2WfhCUZEPB7mOIiLwuU0jHvUZYGcArZTsj14DRdbPOWdbht7
 8e54cmerwAeAMb9cKV39Ewhp3gEK4LpD6Mol7yeyTlk+LK3aUmWHqSZgvU8TbIfG59cWsE6dRvm
 aJTxCV11jqoAB2jOuuNGsnpVkASMoUg1RVAGjhlEr8DLcG50
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Hello,

This series adds support for integrating HDMA with the DWC EP driver.

Hyper DMA (HDMA) is already supported by the dw-edma dmaengine driver.
Unlike it's predecessor Embedded DMA (eDMA), HDMA supports only unroll
mapping format and doesn't support auto detecting the read/write channels.

Hence, this series modifies the existing eDMA code to work with HDMA by
honoring the platform supplied mapping format and read/write channels
count.

The platform drivers making use of HDMA should pass the EDMA_MF_HDMA_NATIVE
flag and provide channels count. In this series, HDMA support is added for
the Qcom SA8775P SoC and the DMA support in enabled in MHI EPF driver as
well.

Testing
-------

Tested on Qualcomm SA8775P Ride board.

Dependency
----------

Depends on:
https://lore.kernel.org/dmaengine/20240129-b4-feature_hdma_mainline-v7-0-8e8c1acb7a46@bootlin.com/
https://lore.kernel.org/all/1701432377-16899-1-git-send-email-quic_msarkar@quicinc.com/

NOTE: I've taken over this series from Mrinmay who posted v1:
https://lore.kernel.org/linux-pci/1705669223-5655-1-git-send-email-quic_msarkar@quicinc.com/

- Mani

Changes in v2:

- Dropped dmaengine patches (Sergey)
- Reworked dw_pcie_edma_find_chip() to support both eDMA and HDMA (Sergey)
- Skipped MF and channel detection if glue drivers have provided them (Sergey)
- Addressed review comments in pcie-qcom-ep and pci-epf-mhi drivers (Mani)

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (3):
      PCI: dwc: Refactor dw_pcie_edma_find_chip() API
      PCI: dwc: Skip finding eDMA channels count if glue drivers have passed them
      PCI: dwc: Pass the eDMA mapping format flag directly from glue drivers

Mrinmay Sarkar (2):
      PCI: qcom-ep: Add HDMA support for SA8775P SoC
      PCI: epf-mhi: Enable HDMA for SA8775P SoC

 drivers/pci/controller/dwc/pcie-designware.c | 62 +++++++++++++++++++++-------
 drivers/pci/controller/dwc/pcie-designware.h |  5 +--
 drivers/pci/controller/dwc/pcie-qcom-ep.c    | 23 ++++++++++-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c  |  2 +-
 drivers/pci/endpoint/functions/pci-epf-mhi.c |  1 +
 5 files changed, 72 insertions(+), 21 deletions(-)
---
base-commit: fdd10aee7740a53c370a867b8743a8c8945d1db1
change-id: 20240216-dw-hdma-64ddc09fb30b

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


