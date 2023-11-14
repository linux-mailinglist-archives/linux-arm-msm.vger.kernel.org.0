Return-Path: <linux-arm-msm+bounces-624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C00A7EB141
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 14:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCA6A1C20A8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 13:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FC9405DB;
	Tue, 14 Nov 2023 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqjCpx50"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BA2405D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 13:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2BFC433C9;
	Tue, 14 Nov 2023 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699970193;
	bh=ccp3ogSsb4odknXliurziQtdOSnVHJBmXHc1B6Tc75s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cqjCpx50IAiQYCU9k/IfgDPeIhFv+9uWmWFC6j2KoAkGQmt2kEAeY29cU/peo05pd
	 mhPyqxa1sMwBW46MTeju7iHCWPFWOvJv6N6K5ZBrldwxnYVuvva41K+vR2H9s9+Ucw
	 z5SFcCofn3ybaamOymSBoMfR7oVVcjqZzIvF7Dg7Byb9NnWwu6QBdGa/JwEVLrnxTi
	 E6YJejE+CF7P272F1nJyC0QGl2ojxS98dzoyuIhUcOEHtIFtbApWpXkNRGLvOZsC9A
	 oX/1obd0/Q3XG7FsvQO4lcQ8aP9MDLvnUFV3T+44UlhgnB6dZVxhE3r48J75wNi+iP
	 P/FJXHIESqxuA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r2tu2-0008PX-3C;
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
Subject: [PATCH 5/6] PCI/ASPM: Clean up disable link state parameter
Date: Tue, 14 Nov 2023 14:55:52 +0100
Message-ID: <20231114135553.32301-6-johan+linaro@kernel.org>
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

Replace the current 'sem' parameter to the __pci_disable_link_state()
helper with a more descriptive 'locked' parameter, which indicates
whether a pci_bus_sem read lock is already held.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/pci/pcie/aspm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 8cf8cc2d6bba..19b7256d2dc9 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1041,7 +1041,7 @@ static struct pcie_link_state *pcie_aspm_get_link(struct pci_dev *pdev)
 	return bridge->link_state;
 }
 
-static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
+static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool locked)
 {
 	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
 
@@ -1060,7 +1060,7 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
 		return -EPERM;
 	}
 
-	if (sem)
+	if (!locked)
 		down_read(&pci_bus_sem);
 	mutex_lock(&aspm_lock);
 	if (state & PCIE_LINK_STATE_L0S)
@@ -1082,7 +1082,7 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
 		link->clkpm_disable = 1;
 	pcie_set_clkpm(link, policy_to_clkpm_state(link));
 	mutex_unlock(&aspm_lock);
-	if (sem)
+	if (!locked)
 		up_read(&pci_bus_sem);
 
 	return 0;
@@ -1090,7 +1090,7 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
 
 int pci_disable_link_state_locked(struct pci_dev *pdev, int state)
 {
-	return __pci_disable_link_state(pdev, state, false);
+	return __pci_disable_link_state(pdev, state, true);
 }
 EXPORT_SYMBOL(pci_disable_link_state_locked);
 
@@ -1105,7 +1105,7 @@ EXPORT_SYMBOL(pci_disable_link_state_locked);
  */
 int pci_disable_link_state(struct pci_dev *pdev, int state)
 {
-	return __pci_disable_link_state(pdev, state, true);
+	return __pci_disable_link_state(pdev, state, false);
 }
 EXPORT_SYMBOL(pci_disable_link_state);
 
-- 
2.41.0


