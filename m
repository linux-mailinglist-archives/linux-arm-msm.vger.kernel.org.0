Return-Path: <linux-arm-msm+bounces-92412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I9UCuHWimnrOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:57:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D71117908
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA6E63037E49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 06:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E455932E729;
	Tue, 10 Feb 2026 06:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3UICiD0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3AA2EA151;
	Tue, 10 Feb 2026 06:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770706618; cv=none; b=kQ/5IlSmPLhqwqnvgFuZ6AflnBRk7G0CffXd0yQhuZZkgCnN9m6dNHvVQN6hLVJX3nGdFMc9AAWZ6ZjYsxGhvU2nLJzyFq8QhqqbmoR904+j7gPbwAVGdHhiOn6HwOqY7AjV0xNsXr+rH73rGLFLpObznY15KFfe31GCw9S/VyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770706618; c=relaxed/simple;
	bh=14eJu/e65Krl0O98yiBCxz41S1FxvvsUyw5DkWoDIB8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uUZcPQpDPb6r8f7/+Pb2htrRiYsHLLr47DT7fb3n1UBuX/CvUgq5dqiMgiFQBtmEBuF4oRXGpYndbx5wgMkXhsPw+bPdz705w4tFUkBWwvdlvv6z+f3/4UEbV/xNqdFbmIMbPxyL8ROA8x4CIxHrd8ADTsH/ByZZJD4WL5GXb5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3UICiD0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ED95C19421;
	Tue, 10 Feb 2026 06:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770706618;
	bh=14eJu/e65Krl0O98yiBCxz41S1FxvvsUyw5DkWoDIB8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=D3UICiD0BGyRJ5b8KqMi13pRqwt+2ffVcb/neP3YqVmfhRBITdz06vpS/6DsGzqjM
	 rqcMhHDfkT2iDm/ZQoRqV8/fSUnxcZNyi0H4O2ocd1oWjMIA69j/EATGUy7gaAEIaj
	 CzEDS1+uBEgJBXaeBG778YzAYqDO4FGJwa/9jPzKOVLuG8HFI+5IwyJ72SDD6DMRs8
	 nLJQSDVXwjI+UUKQdyHSNxKCzCkoLHjDbPXwJZtR1AxUPa7vSHSG49R9xJ002f2jGd
	 dyerFQR/vFQSZQJrxmNIE6hPBGsQ4h8d29s0z3ADIYZyg1L7JXPmnBd+4jPmFKPIKy
	 oOFkkE8kUQl4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45086EA3F11;
	Tue, 10 Feb 2026 06:56:58 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v2 0/4] soc: qcom: ice: Remove platform_driver support and
 expose as a pure library
Date: Tue, 10 Feb 2026 12:26:49 +0530
Message-Id: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALHWimkC/x2MQQqAIBAAvxJ7bsHW6tBXooPpVntISyEC8e9Jx
 xmYyZA4CieYmgyRH0kSfAVqG7CH8TujuMpAikZFncLbhhPFMm7yoiOjjeqHVZODmlyRq/5381L
 KBwYdpUJeAAAA
X-Change-ID: 20260210-qcom-ice-fix-d2a3a045b32d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>, mani@kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=14eJu/e65Krl0O98yiBCxz41S1FxvvsUyw5DkWoDIB8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpitaz5wD+GT+GNV8a016Lvwg57YK23bFzxBP4T
 liFCTBMpFiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaYrWswAKCRBVnxHm/pHO
 9crvB/44ZaWUxDpDQJq9WmevFXzgclsf03FlbKbk890kwx9abXvj9q2xOGnKtNy9W2zK+MKIPPN
 skq61LCzs7pwGsfrnRWI2TmJCVFnEVqppxWy8YDoFpRMCbUdNBPq12xxP5I3WSoCBOAh/ygugw7
 KUy+CKxs/EqzCqWrVkltMw5+tYDZQoyghuSHZ29LvRNYmiZRdVwENkmtuK4K7WhL7iTc/uEs+/r
 DUJUp5uzcnJ06ioX1J0W5hzr5quhoyXmd/vlpz4I2gutArY9InQyvxkqY2sKMQo7L2fpLuhXkOe
 J6wmCiokkV8CBUJpVsk/dRe7SaNffe42WDTQlgjarZSZ6l3b
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92412-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 80D71117908
X-Rspamd-Action: no action

Hi,

This series removes the platform_driver support from Qcom ICE driver and
exposes it as a pure library to the clients to avoid race conditions with ICE
SCM call availability.

Merge Strategy
==============

ICE patches (1,2) through Qcom tree and MMC/UFS patches (3,4) through respective
subsystem trees as there is no dependency.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Changes in v2:

* Added MODULE_* macros back
* Removed spurious platform_device_put()
* Added patches to remove NULL return

---
Manivannan Sadhasivam (4):
      soc: qcom: ice: Remove platform_driver support and expose as a pure library
      soc: qcom: ice: Return proper error codes from devm_of_qcom_ice_get() instead of NULL
      mmc: sdhci-msm: Remove NULL check from devm_of_qcom_ice_get()
      scsi: ufs: ufs-qcom: Remove NULL check from devm_of_qcom_ice_get()

 drivers/mmc/host/sdhci-msm.c |  10 ++--
 drivers/soc/qcom/ice.c       | 127 ++++++++++++++++---------------------------
 drivers/ufs/host/ufs-qcom.c  |  10 ++--
 3 files changed, 58 insertions(+), 89 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260210-qcom-ice-fix-d2a3a045b32d

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



