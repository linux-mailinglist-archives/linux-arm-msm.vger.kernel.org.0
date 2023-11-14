Return-Path: <linux-arm-msm+bounces-626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E27C7EB145
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 14:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33C1A1C20A32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 13:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F14405E0;
	Tue, 14 Nov 2023 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvzgQs4/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA4F405DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 13:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15D0C433CD;
	Tue, 14 Nov 2023 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699970193;
	bh=eo9kfCbX6q6KqiGf0IQeZw8TC/sg5ZoML6hbCiQxCyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hvzgQs4/9S5RUfSUDfl+ZBXj8xB4XpWCi1gh6wnZMfzRCKuYG5KTLn6y4h4DuADRA
	 oCa5tYe+ekj/mzp5YSjsWpZ2ILuTsBhlr/KuBHdZlMyxnxNTWg9sYZwd2yJEqavC0/
	 LsJfY+IPxeWYpZcBJvx/XVnxsriQqgUo9bFQkTqvoJq4RKZA2xsFGNjt2z+k84xlSN
	 qeOlTdksrKdZc1Az0YZoHAso558mOYRAKeudnfYMQ77IAKelqIDXCMQNqIj28cKbNm
	 E1OSs/RawbAUAJ2Nym5MugY8Gubl6pA7BUIyiiUdKscX5F3dMO5qEgjIB3NCp7TBeO
	 WgnjHWVXRD1Lg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r2tu2-0008PV-2s;
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 4/6] PCI: qcom: Clean up ASPM comment
Date: Tue, 14 Nov 2023 14:55:51 +0100
Message-ID: <20231114135553.32301-5-johan+linaro@kernel.org>
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

Break up the newly added ASPM comment so that it fits within the soft 80
character limit and becomes more readable.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 21523115f6a4..a6f08acff3d4 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -969,7 +969,10 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 
 static int qcom_pcie_enable_aspm(struct pci_dev *pdev, void *userdata)
 {
-	/* Downstream devices need to be in D0 state before enabling PCI PM substates */
+	/*
+	 * Downstream devices need to be in D0 state before enabling PCI PM
+	 * substates.
+	 */
 	pci_set_power_state(pdev, PCI_D0);
 	pci_enable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
 
-- 
2.41.0


