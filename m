Return-Path: <linux-arm-msm+bounces-44382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AC5A05CFA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 020C916705B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD211FC7CC;
	Wed,  8 Jan 2025 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZVHkHDR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FA31FC105;
	Wed,  8 Jan 2025 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343572; cv=none; b=ICgB+ElZvXK3EQXfge69zWnig1qfl5VBI8Ba6k05kLcWONzeI8xDkNkZaDbvYVypHrkHGhEXhoBDza+biCV5x352+Uad4pn65nxNbhwl5ESWZdbMTpRwkMc2O+eENiNhLrDRwU4CZbjB+sUHTUyueH6sfDAoS7pa1bImsNESENE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343572; c=relaxed/simple;
	bh=FouJgExThB5JcMNTBT8U6TM7eQ3QWkBZ7ZTZZXTD0WE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ItZ+QJRBwCFlFqW4S+g2UtZb+OVaZ8y3fsmKH4I9+RKUPqN+0IjUvcZjKaNKpOXc0LhVtVa7LEJalNi2lZ/6SYKrWvMcXHg57oH3bpKkLNkc/bmnpxCAC/83HEm7vzNBo2SgdVLfQsZmSqS6/gE48QXkQxtX0zAS++dpvbxBI3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZVHkHDR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6E00C4CEE4;
	Wed,  8 Jan 2025 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736343571;
	bh=FouJgExThB5JcMNTBT8U6TM7eQ3QWkBZ7ZTZZXTD0WE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DZVHkHDR7I40t4HKWTCzKx9aKOtluLIbngGzW9IdMf6XcZXn5AQjIgmyvaIVdC2In
	 wv3jWZCVPfssW8cdcFgXbQo8Os8S9cqnZCMPSz3BRMTJ/tx2kXPaM2MfRv/v2DZwY3
	 lHSF5KXB7EuSfW4pp2lo7RUs/QOVy87iubhX32iALnYfbGgYafddXY8PYkYUpd9JQ5
	 BtdlofjGbvKpf/qgAPiIN4/spD/D7glDaR0sC38keT9v8eeh/2f6evFO7zUo0skiTj
	 xxiJX82LRAywCRIqn1deHLUKvikwKvKfEdrw8mMbuApfiP8uPUYfcN6FI4pTAzlfUm
	 oMIIkWsidxfww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9208EE7719B;
	Wed,  8 Jan 2025 13:39:31 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Wed, 08 Jan 2025 19:09:28 +0530
Subject: [PATCH 2/2] bus: mhi: host: pci_generic: Recover the device
 synchronously from mhi_pci_runtime_resume()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org>
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
In-Reply-To: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
To: mhi@lists.linux.dev, Loic Poulain <loic.poulain@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3728;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=PbUVuYWUfqmustC2WiHHQap1G0eBPYmJC2LfYKutaU8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnfoAR34yGYQF9ycq3TNgC1rXfy1K3VN1q2TEbX
 bZuU9qbRAuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ36AEQAKCRBVnxHm/pHO
 9dAqB/49P68aL4DjPjADl5s3uTq/Fv4ZvUlOBpNpEAB3hxBsN5sU9I4NLNghM7SWTeWw7zQVb5s
 iz2A2ROGdhVQZj5E7awq6zDUIR+xMsm4TCet1Z/jsrbs6wcX7GDOFCptJq/wNzJHyEW4EnvuXmt
 9SW8Lc9aM+bDif5e3yn5jTal4/Q7tQh7/MjK3mYT1Bif09i9+H9jImoK0n0H6/fyWLvIPfMIpHO
 kmIf9OXb8+d9R7+q28oDVQxCCFHUBAo/ARtQDN8w1j5eMff9TdpB1fOQ7CvXXj4AwGC7uY528XL
 V0OtkzTkawrMyxuqfeXM4KTp4fhfhNbKJh53fWyEan0Y1epI
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Currently, in mhi_pci_runtime_resume(), if the resume fails, recovery_work
is started asynchronously and success is returned. But this doesn't align
with what PM core expects as documented in
Documentation/power/runtime_pm.rst:

"Once the subsystem-level resume callback (or the driver resume callback,
if invoked directly) has completed successfully, the PM core regards the
device as fully operational, which means that the device _must_ be able to
complete I/O operations as needed.  The runtime PM status of the device is
then 'active'."

So the PM core ends up marking the runtime PM status of the device as
'active', even though the device is not able to handle the I/O operations.
This same condition more or less applies to system resume as well.

So to avoid this ambiguity, try to recover the device synchronously from
mhi_pci_runtime_resume() and return the actual error code in the case of
recovery failure.

For doing so, move the recovery code to __mhi_pci_recovery_work() helper
and call that from both mhi_pci_recovery_work() and
mhi_pci_runtime_resume(). Former still ignores the return value, while the
latter passes it to PM core.

Cc: stable@vger.kernel.org # 5.13
Reported-by: Johan Hovold <johan@kernel.org>
Closes: https://lore.kernel.org/mhi/Z2PbEPYpqFfrLSJi@hovoldconsulting.com
Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/pci_generic.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index e92df380c785..f6de407e077e 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -997,10 +997,8 @@ static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
 	pm_runtime_put(mhi_cntrl->cntrl_dev);
 }
 
-static void mhi_pci_recovery_work(struct work_struct *work)
+static int __mhi_pci_recovery_work(struct mhi_pci_device *mhi_pdev)
 {
-	struct mhi_pci_device *mhi_pdev = container_of(work, struct mhi_pci_device,
-						       recovery_work);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
 	int err;
@@ -1035,13 +1033,25 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
 	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
-	return;
+
+	return 0;
 
 err_unprepare:
 	mhi_unprepare_after_power_down(mhi_cntrl);
 err_try_reset:
-	if (pci_try_reset_function(pdev))
+	err = pci_try_reset_function(pdev);
+	if (err)
 		dev_err(&pdev->dev, "Recovery failed\n");
+
+	return err;
+}
+
+static void mhi_pci_recovery_work(struct work_struct *work)
+{
+	struct mhi_pci_device *mhi_pdev = container_of(work, struct mhi_pci_device,
+						       recovery_work);
+
+	__mhi_pci_recovery_work(mhi_pdev);
 }
 
 static void health_check(struct timer_list *t)
@@ -1400,15 +1410,10 @@ static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
 	return 0;
 
 err_recovery:
-	/* Do not fail to not mess up our PCI device state, the device likely
-	 * lost power (d3cold) and we simply need to reset it from the recovery
-	 * procedure, trigger the recovery asynchronously to prevent system
-	 * suspend exit delaying.
-	 */
-	queue_work(system_long_wq, &mhi_pdev->recovery_work);
+	err = __mhi_pci_recovery_work(mhi_pdev);
 	pm_runtime_mark_last_busy(dev);
 
-	return 0;
+	return err;
 }
 
 static int  __maybe_unused mhi_pci_suspend(struct device *dev)

-- 
2.25.1



