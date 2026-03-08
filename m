Return-Path: <linux-arm-msm+bounces-96007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vf1RHOcWrWmRyAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:27:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFCF22EADA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 07:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D836B300DDFE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 06:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AE829B77C;
	Sun,  8 Mar 2026 06:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNWnnSfW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A502BD11;
	Sun,  8 Mar 2026 06:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772951267; cv=none; b=tSHJqVh2pqgT70crtxfg+fbsV4eTQLMUlnSX5J1tmqpDw5j+kqoOeuhx4Hk07xM4r+EZRUV+AJHp9hc1FM48Ltc/b15LjLIrkKA3CDQUwVwRgz2/fUktz0V5gmIlexr25BDhL5tWfrvyNmuQAqhVc8RLcGTaCShO1JK0GQHII5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772951267; c=relaxed/simple;
	bh=x+5oBETJCIhKD/G4vbt1bz5h6D/Psa7OJAz2mIkVAhU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o8hMWuTfQu+osJOhzWmPXbw5B+m6j2thtq0Y/Azcz4YOAVPjoJPbdJs4+0awusrZAlGu/GK9ojssSgBI/oHeR/3WEI8AdjI3fge6wPLNK5qJiYSfOMdjZe2wXZJoRK3MzfE1gfw+0sabEC1R0NU0j2PIrhOVWirg4kDZmxvBaD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNWnnSfW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16C3EC116C6;
	Sun,  8 Mar 2026 06:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772951267;
	bh=x+5oBETJCIhKD/G4vbt1bz5h6D/Psa7OJAz2mIkVAhU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jNWnnSfWo3Ae3mdAQOlvDUWSAMfGWQImf7Yihrrwp+bxRlRyuL3mp4Zx6l4P6Zrgm
	 KT8eeGACxOZ5e7rEIS0Rk7IO7+FI9CZTfoGjpdKiJW0mkcyf1IlHZPSfl5y7KLGZyB
	 xgejnq3s4N4zr76lzhjC7u4GPM3CUOoCpLZOmQ0/0b3pJpBfHNhwe7XnUTjG/FVH1E
	 EEDM/cVgGloSKPEkC+MkoDDmrqZjlBkufuYQaXqyPdzLswP1b+QqemBcfJ0VbvpQAu
	 Js9qPkIkXoKADSobND+eRcyUHeVsgJ+EzcqjvogCP0ZETghRX+bLiwPnf+633G6Xly
	 7hoSS51YS8mZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EAAF55109;
	Sun,  8 Mar 2026 06:27:46 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v5 0/5] soc: qcom: ice: Fix race between qcom_ice_probe()
 and of_qcom_ice_get()
Date: Sun, 08 Mar 2026 11:57:26 +0530
Message-Id: <20260308-qcom-ice-fix-v5-0-e47e8a44b6c4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4WrWkC/3XOTQ6CMBAF4KuQri0Zpj+IK+9hXJS2SBMBoUo0h
 Ls7sNEQ3UzyXma+zMSiH4KP7JBMbPBjiKFrKahdwmxt2ovnwVFmCKgBM+C97RoerOdVeHKHRhi
 QqhToGJ3cBk/1yp3OlOsQ793wWvURl/YPNCIHXtjMlMppBWiPXYxp/zBX2mpSGmzxRvFloNgYg
 gxtjdpLLbCo8j+G/BgCcGNIMsBrlUswytlff8zz/AbjMpVqNwEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2153;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=x+5oBETJCIhKD/G4vbt1bz5h6D/Psa7OJAz2mIkVAhU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBprRbgIjxlREu2N3Oxerz1F9yhh7jyZHQc5N16l
 tvwB7MMBvKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaa0W4AAKCRBVnxHm/pHO
 9dyyB/93wf6GMc4BczXT9iqaup4Keirysld8TVVwloGUzTO1C15URXSemhc9cLglxFps2Z/YupN
 iJSNH7ajHi9B7My4XwLRwt6HiNig0twur2b9iuM5/g8/s4OKxBWL+x2DP/5QEcnruoDjMOYwzcE
 09Q4x9L3RsA1suy4VOWwcwzsxOO85zb2mNl0H4sOxY2wMPQxdLxA29OWiYV9n7DLaP3nITgxrtc
 buOoTRj55bEODjI1zBTqN4N2yMb0Dw923JfhELEC91VpIYz+HWApIoDbVjr8is6WxSYw46BcLIC
 tANvJN28Cdz9LTWdp8s256y5sO+Z7uX3f1HXUvEjLXlKWmQX
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Queue-Id: BAFCF22EADA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96007-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	NEURAL_HAM(-0.00)[-0.943];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
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
Changes in v5:
- Used Xarray instead of platform drvdata for passing the pointer since driver
  core frees drvdata on probe failure.
- Link to v4: https://lore.kernel.org/r/20260302-qcom-ice-fix-v4-0-0e65740a5dcc@oss.qualcomm.com

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

 drivers/mmc/host/sdhci-msm.c | 10 ++++-----
 drivers/soc/qcom/ice.c       | 49 ++++++++++++++++++++++++++++++++------------
 drivers/ufs/host/ufs-qcom.c  | 10 ++++-----
 3 files changed, 46 insertions(+), 23 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260210-qcom-ice-fix-d2a3a045b32d

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



