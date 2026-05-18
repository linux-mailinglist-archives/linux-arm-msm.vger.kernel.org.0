Return-Path: <linux-arm-msm+bounces-108214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dOd2EbgZC2reDQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:52:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D5756E0D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E4C730182CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DA9481A9E;
	Mon, 18 May 2026 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXIHWG5l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127E480350;
	Mon, 18 May 2026 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112350; cv=none; b=Mbxybx0l9L8wKQEKtzgyElCxo1MFqYWmUqGQYk7tnbdb2caQIJ+e0CjbSnyl0KtxHZpQj+Qni99n4085FtHLO/FF5Q106Qo60NBjaYlvj3q6g8F2fNWrQw6rfADKn/zoNpodrQy9lCUGPUF9ciN1d9SzvqcnHHzCGS9Rbi6DEak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112350; c=relaxed/simple;
	bh=kWISkeVRfd8jvFcHNKLpQ1GFOQCP73gX7K3vEQF5lPE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JvX/1ViErCThzAYxrW8MZeN1jf9TErZ0zP70aV2KWRVr2pEO8gjYa26goKmaohVzPwlzxplT/vXlzVw2OKyUvWHgmhbTv/EtwyRPGE1xcGrJRp4yAX4j0tzelG3tiMOBBQ51dQnoefHFTx1FfvRxaTE2+rMx4qt2RHp0J/Qz9qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXIHWG5l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02DEEC2BCB7;
	Mon, 18 May 2026 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779112350;
	bh=kWISkeVRfd8jvFcHNKLpQ1GFOQCP73gX7K3vEQF5lPE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bXIHWG5lnUkHm/CkMZ0P9a1AIvbJCOB261Yc70vYYWOiVhwUqG21qmOH/RLl9K7Sv
	 YNatKPkTWv0ajWCP20rzPvEmMEDK/uCG0FH0NdfRdZNdRRcAKHwxvrGGg3+oIr+Jvi
	 vhmpXxWJLiC3kIQKgpVAt/0vt+2/fdHHOxLfkvfjlXK5jU7IdJ4nBBv51AxpBhz0HU
	 4KNI7vJTE582nOgdgImp/IyMzAccQjyPx0jEI1JByQAHKboKP41JPtGPqgac2sqBG2
	 EizTY1r7YKOIlJepk2v9Vzdc4wBgPYiIoRkA3DfQuglthbN87mrj10mcSPX1PnjM0E
	 g3SfiD3tCOXcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30C1CD4F50;
	Mon, 18 May 2026 13:52:29 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v7 0/5] soc: qcom: ice: Fix race between qcom_ice_probe()
 and of_qcom_ice_get()
Date: Mon, 18 May 2026 19:22:16 +0530
Message-Id: <20260518-qcom-ice-fix-v7-0-2a595382185b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJAZC2oC/3XOwQrCMAwG4FeRnq3ENO2mJ99DPHRt1II6XXUos
 nc320UZ7hL4f5KPvFXmJnFW69lbNdymnOqLhGI+U+HoLwfWKUpWCOgAl6BvoT7rFFjv01NH9MY
 D2cpgVHJybVjqgdvuJB9TvtfNa9Bb7NsJqEUNehWWvrLRWcCwqXNe3B7+JFvnhQzVe635MdCMD
 COGC96W5Ayu9sWEQV/DAI4MEgPY2YLA2xim/rC/RjkyrBhMBZeeqHKB/hhd130Al7QznHsBAAA
 =
X-Change-ID: 20260210-qcom-ice-fix-d2a3a045b32d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>, stable@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Ulf Hansson <ulfh@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2360;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=kWISkeVRfd8jvFcHNKLpQ1GFOQCP73gX7K3vEQF5lPE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqCxmYCvvALWkQZC2rYZ1PvIwFlbeupGGU1KLFO
 g0x8cKNlvGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagsZmAAKCRBVnxHm/pHO
 9Q6zB/0fF5aKOehEDnZHrPz34NODgyB+ECsieVqHX9VV4Kmy3+UxjD5MrLQiO8dYt2/0eVBbgQ1
 FnQhTG+rKcCBvS3gPmMFwehUwnQSGpymnBi9DASd6nHpef6sZxXTA0Sw/ORiZSBdKpNK4lLgqON
 P+seFQ/0DljEM6jrlzS73Ewh3Or9C0W+V3f8+X3x5NfvL/mlg/gi0kdsZjwL75zzw1WCNnDTJAc
 njmjXmcOnT7tM4ucirlONeEQFW4TbyFRlNi12CIx+LFAGXjBEtzV0V0OpAUfNZIVl3p+STo+Q2q
 Fnjlm661UD6dOH3wDv1LjuxiGvIb1+HBk0zxEhCaP/UTwVJ8
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108214-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:replyto,qualcomm.com:email]
X-Rspamd-Queue-Id: D1D5756E0D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

This series fixes the race betwen qcom_ice_probe() and of_qcom_ice_get()
but synchronizing the two APIs and properly propagating the error codes to
clients.

Merge Strategy
==============

Due to dependency, all patches should go through Qcom SoC tree.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Changes in v7:
- Rebased on top of v7.1-rc1
- Collected tags

Changes in v6:
- Fixed sparse warnings
- Link to v5: https://lore.kernel.org/r/20260308-qcom-ice-fix-v5-0-e47e8a44b6c4@oss.qualcomm.com

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
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260210-qcom-ice-fix-d2a3a045b32d

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



