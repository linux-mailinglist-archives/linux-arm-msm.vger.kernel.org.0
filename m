Return-Path: <linux-arm-msm+bounces-96134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TXzUN+RvrmlPEQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:59:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E45D6234972
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E6683002D23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265F7362141;
	Mon,  9 Mar 2026 06:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9rPG1Bc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00048262D0B;
	Mon,  9 Mar 2026 06:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039521; cv=none; b=ehXD7VQpKVoWCRPptxFmcLfPhGiGdcnFhPSEb2v70ZVwoGjSComgXPc1UsV8s69yA6NVCT6OvQozdJPaC1grw9YpV5ojJkGvHsCSyacW7C0OmmW5Tp5DzdX5zgtYbwByPico8T4A+pdWEACbvekPiev6IS9gGVcpY1UmQtG8Ll0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039521; c=relaxed/simple;
	bh=UrB+nwLO5Nzq+PPEH+2q9A2ciYRrBSH/FL5LeliDRRU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bbvBPqecUy9jVSjhuwMPLjMI3Q8wHFy9LxNxUZHnbIrnaitUxlv0Vb2ESSkCy5c3pV+OkBKEeiJ0eZdLZyN58Vqb77c1Y5s0bxQTlk1sDXrrM/7tkjhclz4NGpTIbWAwzOC7FGjZmTgP/4KhHKDS+5kMxR7uBZOCSTdBor53o8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9rPG1Bc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93363C4CEF7;
	Mon,  9 Mar 2026 06:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773039520;
	bh=UrB+nwLO5Nzq+PPEH+2q9A2ciYRrBSH/FL5LeliDRRU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=f9rPG1BcUBh0y/rj077iBSm6D0pD3VicAhAcVErEggRxVL683kcehZNctDcTDst87
	 S2TLONMaFHVSuSLhTwmLiVJHIkrPW+VW55IbSJgtqHfN3IdV/hhdE04G7Hqfky5x3U
	 L8OjfxMD2OXbc8zuA9Gwiw7vhM4Jshx62nDRB8ooUliTQwA1fabyfsJaSC9pVDetk4
	 jJtvBtE8xFDrwy4JF/gxdiuAHBq+Yvcrwt5QCjRGJ1ztSroKkPALX6GOs3e2S4dhH1
	 Tc+Gv9L3rg9pJMYevzoxmjvgCMgGhY81erXOuL5400WtBvON2ymLqWGF7/Bx27kXy+
	 XLjum5t5P4eHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815A1EF36E9;
	Mon,  9 Mar 2026 06:58:40 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v6 0/5] soc: qcom: ice: Fix race between qcom_ice_probe()
 and of_qcom_ice_get()
Date: Mon, 09 Mar 2026 12:28:30 +0530
Message-Id: <20260309-qcom-ice-fix-v6-0-4dd3347df530@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJdvrmkC/3XOwQrCMAwG4FeRnq3ENO2mJ99DPHRt1II6XXUos
 nc320UZ7hL4f5KPvFXmJnFW69lbNdymnOqLBDefqXD0lwPrFCUrBHSAS9C3UJ91Cqz36akjeuO
 BbGUwKjm5Niz1wG13ko8p3+vmNegt9u0E1KIGvQpLX9noLGDY1Dkvbg9/kq3zQobqvdb8GGhGh
 hHDBW9LcgZX+2LCoK9hAEcGiQHsbEHgbQxTf9hfoxwZVgymgktPVLlAf4yu6z6eyp7newEAAA=
 =
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=UrB+nwLO5Nzq+PPEH+2q9A2ciYRrBSH/FL5LeliDRRU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBprm+caLzDzWwmsdpiMx11AV2ItnugWPKaWQR9x
 YJ5rdtbVuKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaa5vnAAKCRBVnxHm/pHO
 9T+wB/wOL3Np3hdKYPKOqHmCruktfr3OxHqw8OhBDfJWNoQtbQMk4IUFTx28LU8GrH931Z6vr4u
 INN8lxfKMWHV4zE0vpdI65rykagJj7/8F8mGCzqn3+PzMV0vY011LEURD4XU7zF6ZeY6xNU3RWi
 0vj7FmfRNv18nBCSPDlLd5SbGAqXyvNUgpohNHbsxsKqjiq5OtEKN/gki/xqS+9uKg5qsi3z+xG
 g8ooEjXd8vVs8+IyPzMdj1Qckbvg3he29eM2M6/8ypqMtEDtYmQqM/uraQ0MXSIri05oTuHzciW
 jKvTG7tRlgJL1w3v1SQC99hHo4qljP2Ph+pEWHq9npN6AQEy
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Rspamd-Queue-Id: E45D6234972
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96134-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	NEURAL_HAM(-0.00)[-0.936];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
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
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260210-qcom-ice-fix-d2a3a045b32d

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



