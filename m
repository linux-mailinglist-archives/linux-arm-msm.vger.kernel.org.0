Return-Path: <linux-arm-msm+bounces-625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD917EB14D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 14:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 587F2B20AD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 13:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E9F405DC;
	Tue, 14 Nov 2023 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SeWpsd+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDD7405D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 13:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E42C43391;
	Tue, 14 Nov 2023 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699970193;
	bh=IyFpJ4IPW+04Qg7uetnTuAVDseZG4Zu5u7tnsvS+xhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SeWpsd+8blmriSQBMZBlDg9HTiPOqC/TQjd6pKDcunLzqR3jShDyFDuVGX3o+W+XL
	 Qoas/TI4ZoSf+VvVCy+P07qZYXvxi7ChCBAtOpvPnbQinxnLfLcuAuTbeAOpTkbOuQ
	 i8wswos2HLxVIWnBf2h2TXvEL8GoEUBo47tOC/L2ugI/3E+n7o+q+N5+mqYJOBpgnY
	 +UpX+ekmhHjqTIQDRuTjxbdrsokfqOrV5SdFdKfOzRvpTLvEMGsBjJM6Ns/kuFAArc
	 PpdVsvyLFgEZJ1jFRzTWNb0rwCc82mDHeIZ806JJ3F+rGx/KyHm+KiumEl5rD92iFh
	 couZyIiRK1mWQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r2tu3-0008PZ-0I;
	Tue, 14 Nov 2023 14:56:31 +0100
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 6/6] PCI/ASPM: Add lockdep assert to link state helper
Date: Tue, 14 Nov 2023 14:55:53 +0100
Message-ID: <20231114135553.32301-7-johan+linaro@kernel.org>
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

Add a lockdep assert to the locked disable link state helper which
should only be called with a pci_bus_sem read lock held.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/pci/pcie/aspm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 19b7256d2dc9..ef2e7a186f57 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1090,6 +1090,8 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool locked
 
 int pci_disable_link_state_locked(struct pci_dev *pdev, int state)
 {
+	lockdep_assert_held_read(&pci_bus_sem);
+
 	return __pci_disable_link_state(pdev, state, true);
 }
 EXPORT_SYMBOL(pci_disable_link_state_locked);
-- 
2.41.0


