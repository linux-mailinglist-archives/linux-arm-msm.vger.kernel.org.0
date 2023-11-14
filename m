Return-Path: <linux-arm-msm+bounces-623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BEE7EB148
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 14:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 307E1B20A6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 13:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E10405D7;
	Tue, 14 Nov 2023 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ewfHx0DX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8143FE56
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 13:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC537C433D9;
	Tue, 14 Nov 2023 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699970193;
	bh=zn1cZkdmxow6oXx9mlxw4Bxyw+vPUUKmI1YntwViffA=;
	h=From:To:Cc:Subject:Date:From;
	b=ewfHx0DX6mWUD5x+Ub9YsdD/9h2Zx4P++52qj+6g/lLhdIMYPULBmDccX740UIkFV
	 h2v1wfdtDWZxpTibEafrM2WXZYn8EMoTUAu85RqPkz/nBH2KYvs2cuMAL3lwu9bXzo
	 UOmC0UC9b65g5nBpaGWNOtuV3trO9LwO73cuaqVEMCtCjmndpvoQ2zm5ouspzDedfz
	 RTC0eKoXwKakmq4i9IYYGYXIknP7cGPsduJnrWJCymoNyq7TLtKfHXsELqNbRh6Fi2
	 JKiETamQ7EmHJZvmblRZijBNX+pV/UxVAg+Ap6VV5f/2HDH492Dt4uPMwg07h32ZfS
	 gOCPoIyRsnyCQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r2tu2-0008PN-1V;
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
Subject: [PATCH 0/6] PCI: Fix deadlocks when enabling ASPM
Date: Tue, 14 Nov 2023 14:55:47 +0100
Message-ID: <20231114135553.32301-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pci_enable_link_state() helper is currently only called from
pci_walk_bus(), something which can lead to a deadlock as both helpers
take a pci_bus_sem read lock.

Add a new locked helper which can be called with the read lock held and
fix up the two current users (the second is new in 6.7-rc1).

Note that there are no users left of the original unlocked variant after
this series, but I decided to leave it in place for now (e.g. to mirror
the corresponding helpers to disable link states).

Included are also a couple of related cleanups.

Johan


Johan Hovold (6):
  PCI/ASPM: Add locked helper for enabling link state
  PCI: vmd: Fix deadlock when enabling ASPM
  PCI: qcom: Fix deadlock when enabling ASPM
  PCI: qcom: Clean up ASPM comment
  PCI/ASPM: Clean up disable link state parameter
  PCI/ASPM: Add lockdep assert to link state helper

 drivers/pci/controller/dwc/pcie-qcom.c |  7 ++-
 drivers/pci/controller/vmd.c           |  2 +-
 drivers/pci/pcie/aspm.c                | 65 +++++++++++++++++++-------
 include/linux/pci.h                    |  3 ++
 4 files changed, 56 insertions(+), 21 deletions(-)

-- 
2.41.0


