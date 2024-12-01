Return-Path: <linux-arm-msm+bounces-39768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 953369DF68F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 18:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51D4016278B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 17:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A251D5CDB;
	Sun,  1 Dec 2024 17:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWFaYR+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EF233086;
	Sun,  1 Dec 2024 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733073186; cv=none; b=VqSUMIJ5h3TecHfoRhdcHvFdxeV8Ex52ZQoMk5vfe2OhmDErJKP/NOlcilrCJwBAYcC45/bFBKPRwE9A287e4C9C0gdi9uPLJgy+DiDJxW0o5FPKz5EQLC24dm4C89ocJDQxfdfiVGc7+TBBfplPLtsksjieRQCoiEGJE6j7WK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733073186; c=relaxed/simple;
	bh=GZDgvFf8CNnTdTo8PVgG8C+++QBsDRSWVueYPc3D//E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ue4bPpFJJOcxOdFixzGU7A1bE19hUl22GbISp+85d1RV+y6Ar3oljdfR1kD37opOWheyIrq2sA1NM4vrNA3pbomZVLoOOHcSU+nzeKIG6NZW3iD0GSXWd+TOwBPFPYf2zPh05UphkGNRtxo6cxQTPdSoC14Bc1bGArVTmBi2ulo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWFaYR+s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744F5C4CECF;
	Sun,  1 Dec 2024 17:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733073185;
	bh=GZDgvFf8CNnTdTo8PVgG8C+++QBsDRSWVueYPc3D//E=;
	h=From:To:Cc:Subject:Date:From;
	b=fWFaYR+sxGBYWi1/CBZ8WeE6RzEWvB8c5iWhh0Zj7utud9CgyCZuCq0YWaVoRdmyP
	 rSJmCtgMxuHVMyTNtX3A1KMdFMyn/HJeWljpPbRjr3wABrfwfMZQZdebBiY5OwRR1b
	 77lZrkUanr2znZlNGCFO5GrXR7ZlzG+VnLrCMaXf/+1l9s7mnMPhbkx4LciL4WzKJi
	 L6zCdfdfT1HA4JAjkxzfT2ZauVYIoxf8eX4i44WgOerK+GR8+0vWA40wFmXjt0Na3+
	 KQSdXQR1xcp1IIMH0fatTlqbcxuaOlj+9utTyt16jppC0uJJj6Ei4x2Rd7PjNp4eil
	 xk2GUjDZBD8uA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tHnVF-000000008Fi-01Bf;
	Sun, 01 Dec 2024 18:13:01 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Mayank Rana <quic_mrana@quicinc.com>
Subject: [PATCH] bus: mhi: host: pci_generic: fix MHI BAR mapping
Date: Sun,  1 Dec 2024 18:11:20 +0100
Message-ID: <20241201171120.31616-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change converting the MHI pci_generic driver to use
pcim_iomap_region() failed to update the BAR parameter which is an index
rather than a mask.

This specifically broke the modem on machines like the Lenovo ThinkPad
X13s and x1e80100 CRD:

	mhi-pci-generic 0004:01:00.0: failed to map pci region: -22
	mhi-pci-generic 0004:01:00.0: probe with driver mhi-pci-generic failed with error -22

Fixes: bd23e836423e ("bus: mhi: host: pci_generic: Use pcim_iomap_region() to request and map MHI BAR")
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mayank Rana <quic_mrana@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

The offending patch was marked as "Compile tested only", but that just
makes you wonder *why* the patch was never tested...

	https://lore.kernel.org/all/20241004023351.6946-1-manivannan.sadhasivam@linaro.org/

Johan


#regzbot introduced: bd23e836423e


 drivers/bus/mhi/host/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 07645ce2119a..56ba4192c89c 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -917,7 +917,7 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 		return err;
 	}
 
-	mhi_cntrl->regs = pcim_iomap_region(pdev, 1 << bar_num, pci_name(pdev));
+	mhi_cntrl->regs = pcim_iomap_region(pdev, bar_num, pci_name(pdev));
 	if (IS_ERR(mhi_cntrl->regs)) {
 		err = PTR_ERR(mhi_cntrl->regs);
 		dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
-- 
2.45.2


