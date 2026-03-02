Return-Path: <linux-arm-msm+bounces-94926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGA3KfqJpWk4DgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:00:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C181D957D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D4EB301463D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834463D9024;
	Mon,  2 Mar 2026 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+Hvlnia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565653D7D73;
	Mon,  2 Mar 2026 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456437; cv=none; b=RgIvxfZuXX/cMhZOC6BO+lAa6lR+ZP33D6eTa5ADhaBeRO+RVoy8ZvPxi87kSfJ+S+wm5Z/ZRgWL6t4RTadtfO5Wzn+LeNe6TFWli9f20zNaOeHVaKvfzm+rbiA/WglYf9mCiCBm5WGQaYsLXCGOAxhkjKHHCqOpZ8oWnby8YVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456437; c=relaxed/simple;
	bh=toZY+oHCDLL1wXEJv++Eb8dGjU5O3Nr+hFpL9dqNUo0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Tb22Y6uK5+mS6SoLq/zVo6JGsMhU4KI4rGGwJZFvjR7/EHbLIqBIO6fcz9B8BM1WfTr6v84qMI+Ke2AnNddDHNZI0xo1wyr1yuiy7M4YJenJqFSUnW1t9Riib8CuJIpavya12smfBZv2eXveevWyHD61zbk26oH6F1iIypctxrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+Hvlnia; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE7AFC19423;
	Mon,  2 Mar 2026 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772456437;
	bh=toZY+oHCDLL1wXEJv++Eb8dGjU5O3Nr+hFpL9dqNUo0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=t+HvlniaXWWsxWpK358ar+AC+j+xPZPX0Vqj46VNm0gTUZvCxSqCB3kcVBKAqj3iU
	 noSetieG9cFF0OLJyqB6iZ2jwW3Vtml6Hhu6N5hZXB7TWVQdzd//ChW/oZD11h8gND
	 mpLnxfREfwlIOCQN5BQkixpFCuvO9AVxsvupAb3onRX508szddBCIprTJgFZnguh1F
	 0Qmvg1EkcqhDCn4jIg7dVpI+zbPrcbPjggXDcWVQjPG/S0fNCV/skDwTkB+EHnQyHc
	 UliohtGm7jMsY/qn9ilOmSncdbv1NRblZA9ucLr8mFTwqD79Yx+7Cj3NjJyYCyso8Z
	 goZSeSKnSoeeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FF8E9B37D;
	Mon,  2 Mar 2026 13:00:36 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v4 0/5] soc: qcom: ice: Fix race between qcom_ice_probe()
 and of_qcom_ice_get()
Date: Mon, 02 Mar 2026 18:30:17 +0530
Message-Id: <20260302-qcom-ice-fix-v4-0-0e65740a5dcc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGJpWkC/3XMQQ6CMBAF0KuQrh1SprSKK+9hXJS2ShOh0mqjI
 dzdgZUxupnk//x5E0suepfYvphYdNknHwYK9aZgptPDxYG3lBlyVBwrDqMJPXjj4OyfYFELzWv
 ZCrSMXm7RUb1yxxPlzqd7iK9Vz7i0f6CMwKExlW6lVZKjOYSUyvGhr7TqSzps8bL4MFB8GYIMZ
 bTc1Upgc97+MOZ5fgNkwVjE8wAAAA==
X-Change-ID: 20260210-qcom-ice-fix-d2a3a045b32d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Abel Vesa <abelvesa@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>, mani@kernel.org, 
 Neeraj Soni <neeraj.soni@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=toZY+oHCDLL1wXEJv++Eb8dGjU5O3Nr+hFpL9dqNUo0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBppYnyEWxqDOk0BM6sKUfi4886zLwu99WWtrO2C
 n4tV2enwR2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaaWJ8gAKCRBVnxHm/pHO
 9U65B/4ouVogJ2VGvK0uAwP5EfJq2GG6FeMRa61ZJo0S+5+Z57OA4Vjl35RaDiCgGHdHRpPnqek
 Zi7JGgXlv2/4AaXiDcJtEcR4SziGZOCiIMzU+q6TOy5IUxPQA7gTEsL5bjMjceTRWCevd9s44zO
 VsGqRyz/Y0/B9jQg2rTNIiYpdh4pFR9WBJbL/SxG4kHRnFXOa7RTdr/RMXinT3g6RTYokwcQpLA
 UI6p0JiD89+oQJSWF5/WBCS5Pc1LgcWZs4ANxFplvp3UarbT8o6J795qCMuW0UDcqVayfUV5NNd
 iUdzFitWZCUeSX7HdG55V9ViQL6/AYT3707chqN1jblwC3Du
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94926-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: 51C181D957D
X-Rspamd-Action: no action

Hi,

This series fixes the race betwen qcom_ice_probe() and of_qcom_ice_get()
but synchronizing the two APIs and properly propagating the error codes to
clients.

Merge Strategy
==============

Due to dependency, all patches should go through Qcom SoC tree.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Changes in v4:
- For supporting multi-ice instances in a SoC, stored the err ptr in platform
  drvdata instead of in a global pointer.
- Link to v3: https://lore.kernel.org/r/20260223-qcom-ice-fix-v3-0-6ca5846329f7@oss.qualcomm.com

Changes in v3:
- Dropped the platform driver removal patch and used the ice_handle to pass
  error codes. This was done as I learned that we need to have the platform
  driver design going forward and also removing it introduces other issues.
- Link to v2: https://lore.kernel.org/r/20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com

Changes in v2:

- Added MODULE_* macros back
- Removed spurious platform_device_put()
- Added patches to remove NULL return

---
Manivannan Sadhasivam (5):
      soc: qcom: ice: Fix race between qcom_ice_probe() and of_qcom_ice_get()
      soc: qcom: ice: Return -ENODEV if the ICE platform device is not found
      soc: qcom: ice: Return proper error codes from devm_of_qcom_ice_get() instead of NULL
      mmc: sdhci-msm: Remove NULL check from devm_of_qcom_ice_get()
      scsi: ufs: ufs-qcom: Remove NULL check from devm_of_qcom_ice_get()

 drivers/mmc/host/sdhci-msm.c | 10 +++++-----
 drivers/soc/qcom/ice.c       | 33 ++++++++++++++++++++++-----------
 drivers/ufs/host/ufs-qcom.c  | 10 +++++-----
 3 files changed, 32 insertions(+), 21 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260210-qcom-ice-fix-d2a3a045b32d

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



