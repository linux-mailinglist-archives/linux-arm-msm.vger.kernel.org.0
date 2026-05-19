Return-Path: <linux-arm-msm+bounces-108395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGf+ArgcDGoYWgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:18:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2AE579D2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E25643019128
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537CF3E022A;
	Tue, 19 May 2026 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwiqMkK3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B56E3DCDBB;
	Tue, 19 May 2026 08:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178290; cv=none; b=Q6YMRUu0yXd0IyfnmX364W9DsVnEg+BC2/B4rUc4grcE+MOVyLkHQrQJOgtiKbbQROd1rJxgTzjKlk55pJt3httU8H3s0OeOk4ETnJmu1BMj3ILYg5nnWc0YoOn86cCT5SZfHOXT1GFt3/RUfDRFfRX2Pi4svdP4joc8EnYBvPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178290; c=relaxed/simple;
	bh=5xjo82f3ie4CuJPJXkiVNG3j7U7ZB0tOBqMF+qD1aFs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u524JBQVd70nOF2N8MzH7YF1+gkNVIsBS/MBUxqUXb/4Zz/IwDfXE8NrMSNgXd2z5Ms57LctCHwigYUo6qWvCh02XlINFMAT7XZinRguYXjEDgsHxTa3s2Ddm/yHoZqkM1uEyIOxD+wnT3Mun4sTqKMzEibtdlCntUdWCDEZakE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwiqMkK3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA094C2BCB3;
	Tue, 19 May 2026 08:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178289;
	bh=5xjo82f3ie4CuJPJXkiVNG3j7U7ZB0tOBqMF+qD1aFs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VwiqMkK3ygOVcmD05/x3EcrJzM/opiB1d5fPx6XXiPkHAU6K6L4xS4eVI33gUN3n8
	 GndEmo4TcaZnSE6xiJEa2VAumzbOxrkd0Vsd5w27CaMpVfD7831MSUajt22kDWmjFd
	 MccW6Dwvo8YAQuRGVtA/EfjLWG93UPayNIC0VnsPqDIS07b9ZFwLTQku7SFf1ZJmqW
	 DzZQ91H4k68WS0dIWUeWD6so1ZLNzH2bYoAvF6uFQSDpzEpu3YmRkZodnxQRwCLZsA
	 Qgzvq3D6e5pQs0rPIXdTOi/6BM9t9D2Mgb360h3QVE321/dYebIBlUZ1+lqAnYw0nt
	 vblUf/q993qZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAE6CD4F57;
	Tue, 19 May 2026 08:11:29 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v2 0/4] PCI: Introduce pci_suspend_retains_context() API
Date: Tue, 19 May 2026 13:41:19 +0530
Message-Id: <20260519-l1ss-fix-v2-0-b2c3a4bdeb15@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACcbDGoC/yXMUQ5AMBAE0KvIfmuizWpSVxEf1GJFkC4iEXdXf
 L7JzFwgFJgEiuSCQAcLL3OESRPwQz33pLiNBpMZm6FGNWkR1fGprHe+M5hrhwixvgaK8XdVVr9
 lb0by27uH+34A/GF7UGwAAAA=
X-Change-ID: 20260414-l1ss-fix-6c9cf2451944
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-nvme@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=5xjo82f3ie4CuJPJXkiVNG3j7U7ZB0tOBqMF+qD1aFs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqDBst/hoKrDTpdPRjYYJTCX+++TyvGSE6NanlW
 am4jXQ1szSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagwbLQAKCRBVnxHm/pHO
 9eNGCACK2TWsgGvWcO0DSokv8etGLWLJwfMz66K1J0+8xc+cXK6Hfcx6lIBquWAnY2If3N3FtPj
 HUHTew/QYyZEZSKRV6PKMmVkYll6OGW2zbtFy+11qfr8ACFPQPF/bjtGoYwsTLtIR7CrIIFCfB4
 bexAzn9xOMAK9AsIdxrXNWKC3VR0/LsiIU8mXQxG+UqmVktjQv3LZZsd2zMBDuIsU2zVPdnxRbX
 5osUT2sxTvC1OVweFzzuQqRFIwol9Fs9htH2Uo7xxDM+duLEEXSjMZa0bnTFlPBl5dsFrH1oTAK
 gj7MNU/SHHucR5B6oNbyuZ8Yzlm+UwsMhpG5OfD4PbbdV7u2
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108395-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: 8C2AE579D2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This series introduces a new PCI API, pci_suspend_retains_context() to
let the client drivers know whether they can expect context retention across
suspend/resume or not and uses it in the NVMe PCI host driver.

This new API is targeted to abstract the PCI power management details away from
the client drivers. This is needed because client drivers like NVMe make use of
APIs such as pm_suspend_via_firmware() and decide to keep the device in low
power mode if this API returns 'false'. But some platforms may have other
limitations like in the case of Qcom, where if the RC driver removes the PCIe RC
resource vote to allow the SoC to enter low power mode, it cannot reliably exit
the L1ss state when the endpoint asserts CLKREQ#. So in this case also, the
client drivers cannot keep the device in low power state during suspend and
expect context retention.

And these limitations may just keep adding in the future. Without a unified
API, the client drivers have to implement their own logic which may cause code
duplication and may also lead to drivers missing some of the platform
limitations.

Once this series gets merged, we can extend this API usage to other client
drivers as well.

Testing
=======

This series is tested on Qualcomm Hamoa based Lenovo Thinkpad T14s latop with
NVMe drive.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Changes in v2:
- Renamed the API to pci_suspend_retains_context()
- Reworded the commit messages to include L10_REFCLK_ON + T_COMMONMODE as the
  L1ss exit latency
- Rebased on top of v7.1-rc1

---
Manivannan Sadhasivam (4):
      PCI: Introduce an API to check if RC/platform can retain device context during suspend
      PCI: Indicate context lost if L1ss exit is broken during resume from system suspend
      PCI: qcom: Indicate broken L1ss exit during resume from system suspend
      nvme-pci: Use pci_suspend_retains_context() API during suspend

 drivers/nvme/host/pci.c                |  3 ++-
 drivers/pci/controller/dwc/pcie-qcom.c | 12 ++++++++++++
 drivers/pci/pci.c                      | 34 ++++++++++++++++++++++++++++++++++
 include/linux/pci.h                    |  9 +++++++++
 4 files changed, 57 insertions(+), 1 deletion(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260414-l1ss-fix-6c9cf2451944

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



