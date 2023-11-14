Return-Path: <linux-arm-msm+bounces-628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A569F7EB155
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 14:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D64EB1C20AB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 13:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A068C405EB;
	Tue, 14 Nov 2023 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBHOHfNc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B27C405E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 13:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8C7C43397;
	Tue, 14 Nov 2023 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699970193;
	bh=FBrVwkCNQ13rjcfw1rE/Ykhh7nhHv9rEy/bYSmsBegQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BBHOHfNckzRz7mnu26EM4ZGNdr34Tk+SyDvwuccRYDg3/vBsf5XfdAI532RpNgedV
	 N2JcKrllILDtvNuhJ1nbPIeWY5nSHp8yMzs02lrEnGHsngcHmdgVmFYB5nTN+iedLp
	 dvT6K9UjGj7xIwUy0BOu+U75X49pqAxeZkUf7ZxLMW3AZ48e94dDU7baWsnE/IUxOa
	 iaaixLJK/z0HBKHZwYXQuw/48ot5+xto239+Sedo42JooeUiqBl1f8et7L58/eNSHe
	 YuICzi3eeb6/fxPrdVYw8HwDXX7YFZzoBaJw4GEid+wCUMf1pJd2tiDkUHS0LBHoQ/
	 u85joJ6WXsyug==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r2tu2-0008PT-2c;
	Tue, 14 Nov 2023 14:56:30 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/6] PCI: qcom: Fix deadlock when enabling ASPM
Date: Tue, 14 Nov 2023 14:55:50 +0100
Message-ID: <20231114135553.32301-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114135553.32301-1-johan+linaro@kernel.org>
References: <20231114135553.32301-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qcom_pcie_enable_aspm() helper is called from pci_walk_bus() during
host init to enable ASPM.

Since pci_walk_bus() already holds a pci_bus_sem read lock, use the new
locked helper to enable link states in order to avoid a potential
deadlock (e.g. in case someone takes a write lock before reacquiring
the read lock).

This issue was reported by lockdep:

   ============================================
   WARNING: possible recursive locking detected
   6.7.0-rc1 #4 Not tainted
   --------------------------------------------
   kworker/u16:6/147 is trying to acquire lock:
   ffffbf3ff9d2cfa0 (pci_bus_sem){++++}-{3:3}, at: pci_enable_link_state+0x74/0x1e8

   but task is already holding lock:
   ffffbf3ff9d2cfa0 (pci_bus_sem){++++}-{3:3}, at: pci_walk_bus+0x34/0xbc

   other info that might help us debug this:
    Possible unsafe locking scenario:

          CPU0
          ----
     lock(pci_bus_sem);
     lock(pci_bus_sem);

    *** DEADLOCK ***

Fixes: 9f4f3dfad8cf ("PCI: qcom: Enable ASPM for platforms supporting 1.9.0 ops")
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index ce3ece28fed2..21523115f6a4 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -971,7 +971,7 @@ static int qcom_pcie_enable_aspm(struct pci_dev *pdev, void *userdata)
 {
 	/* Downstream devices need to be in D0 state before enabling PCI PM substates */
 	pci_set_power_state(pdev, PCI_D0);
-	pci_enable_link_state(pdev, PCIE_LINK_STATE_ALL);
+	pci_enable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
 
 	return 0;
 }
-- 
2.41.0


