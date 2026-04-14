Return-Path: <linux-arm-msm+bounces-103164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGGrCwpl3mmcDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:02:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C20A03FC456
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 342A4306EB4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710D03ED121;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqH71j0/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9173ED119;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182412; cv=none; b=bAI7Jm6gFcw+C1XOWU1Xs5Jl3p7UbdZ8JxIeIVp31qecY9sP5pp7PNocs3Ix40eS5r4/wJe6aoN/raDvYpi0CBaLC00gJHAhwAQhblRrVGdJOX88HhTWJMrUjtlVllYGHsQyByjU6ywhKAQ3T8NSH9SgaoWeK/yuV2NlqvIYzHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182412; c=relaxed/simple;
	bh=mOftxv4/QKcA+8oXdsFGy1MXnS+r1vrmhCE64/287oA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VpNrNHclkgVJnrIl1WznKC4Hf1HGMERPHLc5AgUs+eJ3x3Fo3FOl6x8OgGyUtVx8ugrbhb+tZ9nrL/yEYmvmVGDGmrTE0g8k/pyd9WTGJwxJHQB2cT5WqOr77Kp9SDTpfZdxTJXJl4yPvkwfsyHe4sDGUkfOJfkiWT0nEmAsZNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqH71j0/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13C7EC2BCB5;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776182412;
	bh=mOftxv4/QKcA+8oXdsFGy1MXnS+r1vrmhCE64/287oA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=TqH71j0/LoJs10baVrq1uZnrmVSPYdnsCcFntJQ636feSA2JB4kmogOxTpKAvKm9c
	 Ew7cSLkFVOHO9eX1t+BH4dlGLnCzUKJ9MAVQ/KeRvblYZe3xjMRk+F6GgR8AT2cL0d
	 nmTo4wlE2mNqwfZpv7Rp0P69iRrkq9FVHSOQMvzc7PN3Hl5MzG/gISHFe3v9XHI4YK
	 Jza+ge2v1l89jzXABC4nmEXpNBLHFV6QEhIYghFcu6OknQao4JQ9ThZIkWZKjwhkBi
	 h/utXD/XVxFOB7uZxTA+4q2bmyc8aMb7qv2ulu20+7eC0D6ctNo3ekUb/8hDdTxJxR
	 NkUrti3dEXjnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03311F9D0DC;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH 0/4] PCI: Introduce pci_dev_suspend_retention_supported()
 API
Date: Tue, 14 Apr 2026 21:29:38 +0530
Message-Id: <20260414-l1ss-fix-v1-0-adbb4555b5ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGpk3mkC/yXMUQ5AMBAE0KvIfmuizWpSVxEf1GJFkC4iEXdXf
 L7JzFwgFJgEiuSCQAcLL3OEThPwQz33pLiNBpMZm6FGNWkR1fGprHe+M5hrhwixvgaK8XdVVr9
 lb0by27uH+34ArYB/vmwAAAA=
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
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=mOftxv4/QKcA+8oXdsFGy1MXnS+r1vrmhCE64/287oA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp3mSCyXV3Bi9/QyZ2BKGNKf8az8Qg5jIALqpAr
 37Al+bepYCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCad5kggAKCRBVnxHm/pHO
 9UOWCACTMvxVhal6glC4+LLw74EQF4QbGQYJKc2iXxMBxiiBZFMwC4nz03KqdEOzFNTgG1JfQky
 FVqfbXCHJ5xvOpTxpGyXYZBm1fDCrmT1WwLZrRx8MEUlakwYpGAOSwHs9MUnktXcDg/5h/Sjwvz
 6HcpI/67pkL17T8zLYz7qOmpIJYkBRp5gLKjl9xt/DGsekVNNLmaVKLghytRdRw4VisjsRFKgDA
 EHsUPnKYE8MO61DvsrQCaHeTgEaUBEqsD/ADJAnSrOf5DdDUWWBUOSU5pDO/K67f9mf8vc3xbu8
 pUahEkJ7QRqQp/0RPvaXEyuxZNcLcSDjrbEejPPB6Bg9iRPX
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103164-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C20A03FC456
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This series introduces a new PCI API pci_dev_suspend_retention_supported() to
let the client drivers know whether they can expect context retention across
suspend/resume or not and uses it in the NVMe PCI host driver.

This new API is targeted to abstract the PCI power management details away from
the client drivers. This is needed because client drivers like NVMe make use of
APIs such as pm_suspend_via_firmware() and decide to keep the device in low
power mode if this API returns 'false'. But some platforms may have other
limitations like in the case of Qcom, where if the RC driver removes the
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
Manivannan Sadhasivam (4):
      PCI: Introduce an API to check if RC/platform can retain device context during suspend
      PCI: Indicate context lost if L1ss exit is broken during resume from system suspend
      PCI: qcom: Indicate broken L1ss exit during resume from system suspend
      nvme-pci: Use pci_dev_suspend_retention_supported() API during suspend

 drivers/nvme/host/pci.c                |  3 ++-
 drivers/pci/controller/dwc/pcie-qcom.c | 11 +++++++++++
 drivers/pci/pci.c                      | 34 ++++++++++++++++++++++++++++++++++
 include/linux/pci.h                    |  9 +++++++++
 4 files changed, 56 insertions(+), 1 deletion(-)
---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20260414-l1ss-fix-6c9cf2451944

Best regards,
--  
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



