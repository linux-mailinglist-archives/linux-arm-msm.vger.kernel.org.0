Return-Path: <linux-arm-msm+bounces-1106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B0C7F0DB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 09:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94FD71C2116D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 08:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E640F6ADC;
	Mon, 20 Nov 2023 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="szbEyj2H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A90883
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 00:40:30 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6be1bc5aa1cso4264073b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 00:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700469629; x=1701074429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q1l7DrgcLu7VXd3X25X1T1+EEwHez3TAITsgaEsk2/c=;
        b=szbEyj2HT6h+dB9Q2jnR57VzvzY3z73WCtWa05aGwZWqjIGJ00aayT4yDKyRey6rLb
         l8dlFP83N846R5EhEfyvG0iWme/jNkFP1WmWcg54EcLzfR4xjma1tY/hznnO4sJk1ci+
         ce6TkPQP91GhPlPrXIvopW2Jz5+h8DdqDKz5vphbSzpG0xZxjNgqNvB1Jl4GCS+VQegj
         CM+fJqy+Le5r0LWdBS3GrwjXRDeUzB9tZYn6RhDFdgzwz92BkKhArDAI8/q1R2nVGe/U
         iLA2Yc/EqUeAu73D6Os86xkfFhgTaQALDhW6oE6b6ugfFqHygBjQ9Qrrz9VwzDWn09NQ
         +8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700469629; x=1701074429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1l7DrgcLu7VXd3X25X1T1+EEwHez3TAITsgaEsk2/c=;
        b=Xby6nUCyK+8nAf6OavUIPQbvdOrj2nI8I2RAD0bTkNMCzx7bVWibREchFioNcN8zb9
         6MBxmnrWTp0BJDEQ9NKDCzg4udRwIYMkrHMsP8zV5lIQKB6ESdnQ4Gq5yb2x70VaZ1bB
         dKaZhHME8oyAyVwhS5UYBXaF4ZkLshON7ij1bOm3YvPdP6NG65tZdKNYpXP7/i+KMfV9
         l6TOGpQ4FK+8Dz5xUa1sddwbEmmgW4Qopzk4SulIk6hrGE5Qxz9Dyt1WJ+rcdWaNK5vp
         tb5kBYDIpM54+uvmaFuqUltHDlTWMGYUo47QpaxLDLLk4mq+2N/P7cIRrhLxxcYGs4VO
         +uzw==
X-Gm-Message-State: AOJu0YzKD30Bn64CMDIQOBmm1RE0gLEh5LywgeVIVLiBM9+M2SRtHwYt
	OPu1Ia8dvJ00mSJSRW1Srza6
X-Google-Smtp-Source: AGHT+IFtQV/ccq96KNMgHw78cdV9zVDXhrmwTg6H1dMXISAr54kG1H+fS2nrstxC8hq4JKy/7bUxhQ==
X-Received: by 2002:a05:6a00:6c83:b0:6be:130a:22a0 with SMTP id jc3-20020a056a006c8300b006be130a22a0mr9695978pfb.14.1700469629585;
        Mon, 20 Nov 2023 00:40:29 -0800 (PST)
Received: from localhost.localdomain ([117.248.2.5])
        by smtp.gmail.com with ESMTPSA id e24-20020a62ee18000000b00694ebe2b0d4sm5567019pfi.191.2023.11.20.00.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 00:40:28 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: jingoohan1@gmail.com,
	gustavo.pimentel@synopsys.com,
	lpieralisi@kernel.org,
	robh@kernel.org,
	kw@linux.com,
	bhelgaas@google.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_bjorande@quicinc.com,
	fancer.lancer@gmail.com,
	vidyas@nvidia.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 0/2] PCI: designware-ep: Fix DBI access before core init
Date: Mon, 20 Nov 2023 14:10:12 +0530
Message-Id: <20231120084014.108274-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series is the continuation of previous work by Vidya Sagar [1] to fix the
issues related to accessing DBI register space before completing the core
initialization in some EP platforms like Tegra194/234 and Qcom SM8450.

Since Vidya is busy, I took over the series based on his consent (off-list
discussion).

I've reworked the series in v7 to make it bisect friendly, and also to avoid
build issue with the dependency. This resulted in the patches being heavily
modified, so I took over the authorship of the patches.

Testing
=======

I've tested the series on Qcom SM8450 based dev board. I also expect it to work
on Tegra platforms as well but it'd be good if Vidya or someone could test it.

- Mani

[1] https://lore.kernel.org/linux-pci/20221013175712.7539-1-vidyas@nvidia.com/
[2] https://lore.kernel.org/linux-pci/20230825123843.GD6005@thinkpad/

Changes in v7:

- Rebased on top of v6.7-rc1
- Kept the current dw_pcie_ep_init_complete() API instead of renaming it to
  dw_pcie_ep_init_late(), since changing the name causes a slight ambiguity.
- Splitted the change that moves pci_epc_init_notify() inside
  dw_pcie_ep_init_notify() to help bisecting and also to avoid build issue.
- Added a new patch that moves pci_epc_init_notify() inside
  dw_pcie_ep_init_notify().
- Took over the authorship and dropped the previous Ack as the patches are
  heavily modified.

Changes in v6:

- Rebased on top of pci/next (6e2fca71e187)
- removed ep_init_late() callback as it is no longer necessary

For previous changelog, please refer [1].


Manivannan Sadhasivam (2):
  PCI: designware-ep: Fix DBI access before core init
  PCI: designware-ep: Move pci_epc_init_notify() inside
    dw_pcie_ep_init_complete()

 .../pci/controller/dwc/pcie-designware-ep.c   | 149 +++++++++++-------
 drivers/pci/controller/dwc/pcie-designware.h  |   5 -
 drivers/pci/controller/dwc/pcie-qcom-ep.c     |   2 -
 drivers/pci/controller/dwc/pcie-tegra194.c    |   2 -
 4 files changed, 93 insertions(+), 65 deletions(-)

-- 
2.25.1


