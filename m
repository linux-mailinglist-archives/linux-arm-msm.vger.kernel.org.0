Return-Path: <linux-arm-msm+bounces-44381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF53DA05CF9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C58E1888BCD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F141FC119;
	Wed,  8 Jan 2025 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8nvlyk0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EDF1FBEAC;
	Wed,  8 Jan 2025 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343572; cv=none; b=aAmNpas4KdOUaH06S50AKo8BKWye4udn2Wn3N/JYwOZBLd8e3hZvO4qxz9iun3WsVpPKut+z0oydWs3Oc+svPEFXodOCLpZvXJzIJblV30CcVYDI4Rzzu8MCwODyTta5AwxUxpkkSfuGeeKco7e4N1s6xXlCJz6g8sdAFReu6rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343572; c=relaxed/simple;
	bh=yMeuaGYcJ9n3K4FoPrra09BkyrChG+ayAn7ooCQC7BU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcXsoT6ihftqPY5MQ4BKu9eVQOPwAGoJ58Tpv/+FmrTkB9upvpt/ePCrjAm72Xrh1w3FmzGePmvxxRd1mwDXKNeif0KmaPquaHpOfN85rmpmNhe9xDNVEICrDCYUEnN403KSQ03JlK8rnOPX+1pUDJU/wBIpvR0JoWYhOj6dBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8nvlyk0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 957B2C4CEDF;
	Wed,  8 Jan 2025 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736343571;
	bh=yMeuaGYcJ9n3K4FoPrra09BkyrChG+ayAn7ooCQC7BU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W8nvlyk0dZsfcJMcmNUEOKBMAENQ0jBXfW3U5rFxKEv+/CzY1MHBAlIzEwKoa4E0t
	 eA/4q8lwi9kwXMVl2+hNfevWtok9Zqlqfabkk/nG0ZGbuvXG0XiazuiVkDhcZvZJ5S
	 p7kRCAgcQihQJH74X39/Ae5ZRH7ZWvgQTwgHw6208iz0Xc3AOGrQGJcNvqtYe/jLm6
	 ln+t2HFbGAvYae6VJjvbppQy+i5r2UAui4Cdx6rfXU82Voq8K803KfhhByx3+WHX8O
	 8wazQpLpQsBGADAA6aexNkkfQY2LikWZouYgbqcHg+CSmct2Q0Ugxr4uEivk2fboEE
	 D5ig3q5U8+azA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810DEE7719A;
	Wed,  8 Jan 2025 13:39:31 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Wed, 08 Jan 2025 19:09:27 +0530
Subject: [PATCH 1/2] bus: mhi: host: pci_generic: Use
 pci_try_reset_function() to avoid deadlock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-mhi_recovery_fix-v1-1-a0a00a17da46@linaro.org>
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
In-Reply-To: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
To: mhi@lists.linux.dev, Loic Poulain <loic.poulain@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2538;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Beg2AFqZZL1RvTLG/5NUS0TciFZs05fGK2znhT/Ie3c=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnfoARZYSvqd01mNXvbQZs16URxmMs7KFVOxBcu
 k5JZ8d4KkiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ36AEQAKCRBVnxHm/pHO
 9aL2B/0agETOOAhfKtVOGUJeWXPJTbpwzbpPvVW2MNAxK0FhkcReUe8GZHeT9g3iqAApqy+tMnb
 RYHf4dadmOJzNAHCTs11bBPBmhULknnnY3l7+kw9x1vTk433ree5DG4HAsbYQPeYGFvc1Iye7rt
 LR3tdZmhg80LLdNt0lnrXS1HZsm7aLEkdIU0/xlvqDe2qqUhG8m52t6sRVs/1dXnnON7qyhQyrH
 HPnKk220v7onEXWuxOFhwk7CDzNmbsLTcS0mKNtXi7ZfYfy1mQpOHLr5jxUXES+CJFI3jYqLLx4
 oF0Uz48INYGVlX4Pg0C5OX/xDMhfH6FT/RbCH6qxdUosr1bP
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

There are multiple places from where the recovery work gets scheduled
asynchronously. Also, there are multiple places where the caller waits
synchronously for the recovery to be completed. One such place is during
the PM shutdown() callback.

If the device is not alive during recovery_work, it will try to reset the
device using pci_reset_function(). This function internally will take the
device_lock() first before resetting the device. By this time, if the lock
has already been acquired, then recovery_work will get stalled while
waiting for the lock. And if the lock was already acquired by the caller
which waits for the recovery_work to be completed, it will lead to
deadlock.

This is what happened on the X1E80100 CRD device when the device died
before shutdown() callback. Driver core calls the driver's shutdown()
callback while holding the device_lock() leading to deadlock.

And this deadlock scenario can occur on other paths as well, like during
the PM suspend() callback, where the driver core would hold the
device_lock() before calling driver's suspend() callback. And if the
recovery_work was already started, it could lead to deadlock. This is also
observed on the X1E80100 CRD.

So to fix both issues, use pci_try_reset_function() in recovery_work. This
function first checks for the availability of the device_lock() before
trying to reset the device. If the lock is available, it will acquire it
and reset the device. Otherwise, it will return -EAGAIN. If that happens,
recovery_work will fail with the error message "Recovery failed" as not
much could be done.

Cc: stable@vger.kernel.org # 5.12
Reported-by: Johan Hovold <johan@kernel.org>
Closes: https://lore.kernel.org/mhi/Z1me8iaK7cwgjL92@hovoldconsulting.com
Fixes: 7389337f0a78 ("mhi: pci_generic: Add suspend/resume/recovery procedure")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 07645ce2119a..e92df380c785 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1040,7 +1040,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 err_unprepare:
 	mhi_unprepare_after_power_down(mhi_cntrl);
 err_try_reset:
-	if (pci_reset_function(pdev))
+	if (pci_try_reset_function(pdev))
 		dev_err(&pdev->dev, "Recovery failed\n");
 }
 

-- 
2.25.1



