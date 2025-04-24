Return-Path: <linux-arm-msm+bounces-55456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB22A9B36A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 18:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE6785A3BFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4154827FD69;
	Thu, 24 Apr 2025 16:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZPqWYlK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7AB27F741
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 16:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745510853; cv=none; b=BT1zP/1nj2qaX2W4+qlAxTKOGwJxjjsvtXT1+C5yZvJzQBeerNYr04fWIzcbb1ywtFv6cqV9YcMwVs/5uFfw41BJiiah3GF847wvgQjhLkaP/GcnvTlpwGJCUSqVGEVHq8lCE5K0tqhQ0J8aXPVAsMFzHNFcx7AP8ka8CfshHmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745510853; c=relaxed/simple;
	bh=0Px7jvGhuJRiflMflGOKgJJn7q3qCKBYZy5iMa70b04=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Li9U4lcIcF8saMArHfavhizzCLsvMYKAvCnCtNQaAChJlaUaxRssBpUAetYHYNsPoLRsDKuZz+ntY6LuH/BQblednluxySTT1oHKdLQKH+DfYSHVjeFzUBqU0TfwfENHsGYr7XX8q2kyAG0mspZnvU6xFG8rIfsz35iKHvayKlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZPqWYlK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224019ad9edso17146865ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745510851; x=1746115651; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ztM6ZhwbBzqofjKNReosW9oAapXnNeASiHQKoNm3Vc=;
        b=dZPqWYlKWVPgLCUMHvDxknlfp3vYBqrqa4qtrSEbn2Ehx1qWrqHMh8q8FeDByfZrZy
         duMK3/3IF5pjV/18OVb2IunKvvFMdfKG7qGOfR4xynUB3MFZL7odf8M4hIy+kJ91MPxl
         S320QPIZiC0CYHvL1iMdMj5Q2Z6dIsgEwPQa4mep+Ul8QiomgxCwER4TI57hmwWSEQqp
         zYq4c6fGEAx3KlZsDmGfxS0R3qSPhR96iQ0+AZhlPZODWOIPIDnpci3h56eG0chN3wyI
         0d5pOihxT6ezzMDewvRyqDbL0qxuL9Rk6Wy4RwKoe8KMKkJ4YsalNDN0OFdl9afBy+TP
         XgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745510851; x=1746115651;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ztM6ZhwbBzqofjKNReosW9oAapXnNeASiHQKoNm3Vc=;
        b=TEskZfxyXsL4pVVTlpb2I5K5isIDLyLyXmsSet607jxorhLUPIvQuVXbQe0ZLgp/uC
         Fn3ykNz6p8+sHtm5QGlx5bsiYIMmM0cqLQ3nHHO6D4/E21HcWMObE4qzsywNt+IdqFwR
         S8GA3oNNllU1S6n4U81nlcy7zt/s1tZgyeTgkDKq5VnsS0saUVAiXzjLki1tfjMpTG+f
         aPOUuncquZCQ5zPxfyqmfXUTC9P29UKHYXE6Rjsqm3zdlvWMPneJmS8OuqrlkDaSexu9
         dk/iLmN1560TQjytJn9dUS6v60ysCwglH9Lz9oDQS56TAcnnE6RssaAyXxSCj9Bcz0iS
         vU7w==
X-Forwarded-Encrypted: i=1; AJvYcCVj/ChYkLugRfFmXJlfkWe0ANvz6kAJf51ovRl4qRdb/6gXTSGEaHOkFUtypbEKpw+E1VFCbRssd1h5eiVV@vger.kernel.org
X-Gm-Message-State: AOJu0YyYBho1FLAhDLgr+PVxK6uVuzruzM1oXjUwZq72+w7MiIg1+e2V
	yMYiEZMbSx23BxnrvxhrVf02w1UInd+aiFXPCi2ZhAb+5Ynn50iTcLOlfJeZaA==
X-Gm-Gg: ASbGncvOnVtW8G+JwzZCVxT3IaOK/qgQGdbfcr2bD6VI5wWDN/Vtd74Tt3LplF6Ny6X
	TCE3+cllppt+PVgCrHYsyFGAmCM+zDcFdihohFgQ260yvQzBn0dRvqvV5+uoBrCnKMkmO0eEOPy
	Qi1w46u5xCe0rJ2YlzYqOrek82+0Bz5LP3uaZlzDE6eYfyUVYTNuxt4sohaZ/GwqoDaTdIo6xKg
	OWr25CkQEzNoewGeWBn/oe3KOns/VU9L20n/K6bZkKznOCOzLyg5WWv0kIwL/Gne1II8XT/BIX7
	fxS0t2mrlPEabeCNZaexUQB2kkZibURmzYaLkjl90/RA5IEeodv8Rnw=
X-Google-Smtp-Source: AGHT+IEBGkJA01XOR5juVSwEwgYSL2iayGzzvTy9VnE5/0UWjwW9zVp7Des8tZPmxJhpSTd3lAmX8g==
X-Received: by 2002:a17:902:e54f:b0:21f:1bd:efd4 with SMTP id d9443c01a7336-22db3be36b8mr49102425ad.19.1745510850701;
        Thu, 24 Apr 2025 09:07:30 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221656sm15262275ad.252.2025.04.24.09.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:07:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/4] PCI: Add PTM debugfs support
Date: Thu, 24 Apr 2025 21:37:15 +0530
Message-Id: <20250424-pcie-ptm-v3-0-c929ebd2821c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALNhCmgC/23MQQ7CIBCF4as0sxZDgFp11XuYLoAO7SQKBBqia
 bi72LXL/+Xl2yFjIsxw73ZIWChT8C3kqQO7ar8go7k1CC56LoVi0RKyuL0YDr25GeGcdQbaPSZ
 09D6ox9R6pbyF9DnkIn7rH6QIxpkd5quVF6WM0uOTvE7hHNICU631C8KwCH+hAAAA
X-Change-ID: 20250324-pcie-ptm-e75b9b2ffcfb
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3677;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=0Px7jvGhuJRiflMflGOKgJJn7q3qCKBYZy5iMa70b04=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoCmG+CKMLlQHtFHJTVixNZ7ukdMa0FsFzKc+qh
 4qGb57vvxGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaAphvgAKCRBVnxHm/pHO
 9Q/+B/0bm65cttTnyoDield/0CiSmBJ764HbXm0MKPCvBvVRSFVsN1BG3LvQrr8MmvBiLks7yIk
 vlb00IomkkH63L5oLmeHC4XroaRk4V13luz7xBaUJ1ouMI1IgN2wk5tdgRhPS2SWsKukpM5I2vZ
 I/9HPtUPMjpK6ahCJGc2pWkSdkBrJnPZF+uC8hUQhGhPE4sc8GvXBddv1sTYvONR/a4KT6XDIwX
 U/NlxK2n8Xl2UHWZDIPMAYu2EmNBvGBYMX5vXQ4+jVlSN0kjUnVhqnzMMKeqBPNqH5Nj4lgpIbq
 VegBAQwXMxpOHOEqdBEDJmRmTUnXwJy5m3IqikhugMNIvAsi
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Hi,

This series adds debugfs support to expose the PTM context available in the
capable PCIe controllers. Support for enabling PTM in the requester/responder is
already available in drivers/pci/pcie.c and this series expands that file to
add debugfs support for the PTM context info.

The controller drivers are expected to call pcie_ptm_create_debugfs() with
'pcie_ptm_ops' callbacks populated to create the debugfs entries and call
pcie_ptm_destroy_debugfs() to destroy them.

Patch 1 adds the necessary code in the drivers/pci/pcie.c to expose PTM
context over debugfs and patch 2 adds PTM support in the DWC drivers (host and
endpoint). Finally, patch 3 masks the PTM_UPDATING interrupt in the pcie-qcom-ep
driver to avoid processing the interrupt for each PTM context update.

Testing
=======

This series is tested on Qcom SA8775p Ride Mx platform where one SA8775p acts as
RC and another as EP with following instructions:

RC
--

$ echo 1 > /sys/kernel/debug/pcie_ptm_1c10000.pcie/context_valid

EP
--

$ echo auto > /sys/kernel/debug/pcie_ptm_1c10000.pcie-ep/context_update

$ cat /sys/kernel/debug/pcie_ptm_1c10000.pcie-ep/local_clock
159612570424

$ cat /sys/kernel/debug/pcie_ptm_1c10000.pcie-ep/master_clock
159609466232

$ cat /sys/kernel/debug/pcie_ptm_1c10000.pcie-ep/t1
159609466112

$ cat /sys/kernel/debug/pcie_ptm_1c10000.pcie-ep/t4
159609466518

NOTE: To make use of the PTM feature, the host PCIe client driver has to call
'pci_enable_ptm()' API during probe. This series was tested with enabling PTM in
the MHI host driver with a local change (which will be upstreamed later).
Technically, PTM could also be enabled in the pci_endpoint_test driver, but I
didn't add the change as I'm not sure we'd want to add random PCIe features in
the test driver without corresponding code in pci-epf-test driver.

Changes in v3:
- Switched to debugfs interface based on comments from Bjorn
- Added locking for context read/writes
- Rebased on top of v6.15-rc1
- Link to v2: https://lore.kernel.org/r/20250324-pcie-ptm-v2-0-c7d8c3644b4a@linaro.org

Changes in v2:

* Dropped the VSEC changes that got merged
* Moved the PTM sysfs code from drivers/pci/controller/dwc to
  drivers/pci/pcie/ptm.c to make it generic so that other controller drivers could
  also benefit from it.
* Rebased on top of pci/controller/dwc

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (4):
      PCI: Add debugfs support for exposing PTM context
      PCI: dwc: Pass DWC PCIe mode to dwc_pcie_debugfs_init()
      PCI: dwc: Add debugfs support for PTM context
      PCI: qcom-ep: Mask PTM_UPDATING interrupt

 Documentation/ABI/testing/debugfs-pcie-ptm         |  70 +++++
 MAINTAINERS                                        |   1 +
 .../pci/controller/dwc/pcie-designware-debugfs.c   | 252 ++++++++++++++++-
 drivers/pci/controller/dwc/pcie-designware-ep.c    |   2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c  |   2 +-
 drivers/pci/controller/dwc/pcie-designware.c       |   6 +
 drivers/pci/controller/dwc/pcie-designware.h       |  24 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c          |   8 +
 drivers/pci/pcie/ptm.c                             | 300 +++++++++++++++++++++
 include/linux/pci.h                                |  45 ++++
 include/linux/pcie-dwc.h                           |   8 +
 11 files changed, 713 insertions(+), 5 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250324-pcie-ptm-e75b9b2ffcfb

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


