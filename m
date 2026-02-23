Return-Path: <linux-arm-msm+bounces-93600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AhoJfEJnGn8/AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:04:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02746172E4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4C143021E6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 08:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DD234CFAD;
	Mon, 23 Feb 2026 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="de136+YM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F87286A4;
	Mon, 23 Feb 2026 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771833776; cv=none; b=pxn85MaUeBghresBxswDCUS1Izh01EEpF0EtFOoLBLLEoNgR1yjsFrFm0UO1Y0gOZK6PTM28fzZF1jbbdxDQ71u7ED7uQmaYhszpkQSpjJ9YIVjC9KOdKkJGJyFD6ANEXue79/N/VJf/rg67qNpItifltFrnBI6N7OSqoWA/hls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771833776; c=relaxed/simple;
	bh=U1vbfXxLYJpoqB0vLtDD0LEYx0ULx7q4q0aMqEAXCSA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rOZti+o2ZDEEwVDnzlTm9WwK+MPXGl/RvMR5Vv1nR0tZPTnoBciFheNUUGXtgAcAUDVqpfKudl0bTgT5GxLzixbofDGE2k6yw5spF7vMaPWTdR6A78cKiega4XunDEd/9A50+7A/qeFoWRCKZoE/wSIroaE3xuoC14ypbjmexQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=de136+YM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E1E2C116C6;
	Mon, 23 Feb 2026 08:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771833776;
	bh=U1vbfXxLYJpoqB0vLtDD0LEYx0ULx7q4q0aMqEAXCSA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=de136+YM7SMbVnG1L9q0/SeZouIX/IZfohMhKhXKNnU3td6tG7ecQH+p1uX4laJ7u
	 SSM6j3dCxpAlHByTGgZ+0QwvGJ1gNlyKKhAj1p5oqBcjuJTWKWHiVX2Y+nJLz504iV
	 GdlxEynwBsChGgngWVOJXK2hsPp9uIPRngwTvfFJRI6CABxoOlN7Titp1ccbdEpuUo
	 tbs8cHutW15dEp4PQPeF+frNPaS9BsSOvJXCuzEDuThwQ5vzyT8YmaeF3drrikTZ+J
	 mLezc35kBB7aI5Dr/g0lfhHTm7cy58sLglbpaZavZ38dDRj+50d+BPf6iGeJq7ZJ1a
	 XZlD7IuhqpTmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C40DE98DFD;
	Mon, 23 Feb 2026 08:02:56 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v3 0/4] soc: qcom: ice: Fix race between qcom_ice_probe()
 and of_qcom_ice_get()
Date: Mon, 23 Feb 2026 13:32:51 +0530
Message-Id: <20260223-qcom-ice-fix-v3-0-6ca5846329f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKsJnGkC/3WMwQ6CMBBEf4Xs2SVlKyR68j8Ih9JW2USotNpoS
 P/dlbuXSd5k5m2QfGSf4FxtEH3mxGER0IcK7GSWm0d2wkCKOkWNwtWGGdl6vPIbHRlt1LEdNTm
 QyyN6qXddPwhPnJ4hfnZ7pl/7R5QJFZ5sY8bWda0iewkp1evL3GU11xIwlFK+tk5zta8AAAA=
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
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=U1vbfXxLYJpoqB0vLtDD0LEYx0ULx7q4q0aMqEAXCSA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpnAmtN8Ptqj4btgkzlM7I4Zv1HbbBIxzFPxKSK
 dMX+Ibdcq2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaZwJrQAKCRBVnxHm/pHO
 9SlOB/0Srn5ALm2UkqC9jb+Y8PXdN/0aNbzSarWRB1uFSwYAapsmWMATDInbKhtmZyQlkGvVZSa
 QvrGOEOSdHJikIB5oFMo0OkAZKwaYV9aZK93TPiNzCPPHsXoKNOKCzjqYesStDy6fJ+kkNib9Is
 Y8Ce1KVLQicL6IflvKxQfIRe155Mr1CKsiWAuJrNvrP2q7QcYqw59+h2h8Gz/+AXctT8uXEFysY
 VjfoSjGpRgMDDK9GvnBkCTOn51llH98DVk8jkHw9ctipbZhBfEOreEDvB74N+qnYonWfzA1IA7S
 tVRDa2m6U5AwhnX8jW89hVUaB/grAMpKeVN8FGVAKkVnGY5A
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93600-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:replyto,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 02746172E4E
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
Manivannan Sadhasivam (4):
      soc: qcom: ice: Fix race between qcom_ice_probe() and of_qcom_ice_get()
      soc: qcom: ice: Return proper error codes from devm_of_qcom_ice_get() instead of NULL
      mmc: sdhci-msm: Remove NULL check from devm_of_qcom_ice_get()
      scsi: ufs: ufs-qcom: Remove NULL check from devm_of_qcom_ice_get()

 drivers/mmc/host/sdhci-msm.c | 10 ++++-----
 drivers/soc/qcom/ice.c       | 53 ++++++++++++++++++++++++++------------------
 drivers/ufs/host/ufs-qcom.c  | 10 ++++-----
 3 files changed, 41 insertions(+), 32 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260210-qcom-ice-fix-d2a3a045b32d

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



