Return-Path: <linux-arm-msm+bounces-103168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGNkCfhk3mmcDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:02:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C23A23FC447
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 314023009B20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6963ED13B;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sU694WY8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C07A3ED12B;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182412; cv=none; b=dV/S/Env6lyVhsHa7ITWihb9QWBf8cXPShfHdRs4s9Po0lisvNBSYdONne61EvjeNgxGampP5Je0+dptNycn0/LK7rhGzU51+SywYceZVWOwqRGYnAVo/rIAR1khrf2tyB0ZKGd6RZtiF2Hg04ytrBJpMlQgwYR50wiYD0IO8do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182412; c=relaxed/simple;
	bh=pfNTF4MyP7MbmWdaazOq9QG/qOgjWorM7k/pjnsdDnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Df7JOJ1uBfwwK8h5GstVdzGFShYvjClA+WVmI6wD7O+KRhuLmf4Wws3hHnaS+b0JrSx/v3HA/JA18iljUWWoY3akb8qbCVkIJZ0RIDZEMqJSS3Mm3OjBA8NuvqYEIxqlBnyxPqGBnj6z315M8o/tNfmx6SgpIgI7daXGt6gIC9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sU694WY8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42B45C2BCC4;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776182412;
	bh=pfNTF4MyP7MbmWdaazOq9QG/qOgjWorM7k/pjnsdDnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sU694WY8maCGvpsF2aPpm4jykA3aSkWrASj+i1wx4WXCaMBFa/Zp0bB/AwQCxS+lh
	 QhDNbpEZKsjJO8i14ujORdg0B/cGIq7oQXTua+g4ufmC2XyAZ1gxxaXP8k6iPfmdeg
	 UnWTzjH5eGd7ybatUXh7WFySJ2tFwsSxtMNI2QxdbKJDf1g5Ie7aNUdPx/2qTYAmzh
	 z/ugqtiaApix27pRIyiV1Bp3C+dDpkIkwMRWVK5eOyx7CFjbdsVm/TlUC5xGZFwd/7
	 NrFsmrkA7jnAjhsu/OGO12rjRDErQDO9q3g17ojFDcXBhzzufJyPnxfqK0F4ffIH1M
	 9wwhDXd4TJ+Mw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3612FF9D0E4;
	Tue, 14 Apr 2026 16:00:12 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Tue, 14 Apr 2026 21:29:41 +0530
Subject: [PATCH 3/4] PCI: qcom: Indicate broken L1ss exit during resume
 from system suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-l1ss-fix-v1-3-adbb4555b5ab@oss.qualcomm.com>
References: <20260414-l1ss-fix-v1-0-adbb4555b5ab@oss.qualcomm.com>
In-Reply-To: <20260414-l1ss-fix-v1-0-adbb4555b5ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2251;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=4DYEP1zauw4orkCeJPQ0uZzhSR/jxYVrTX9FZ5rhz18=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp3mSJljvX2vawbgDmc0ySB7J1BxqOQETumjAom
 wNG3QoD26iJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCad5kiQAKCRBVnxHm/pHO
 9bvaB/4oVZcPWtoaiBUEUXLan1VGwV1vrK0hc99d4fh1ddJGcWisR+kxmzUyky+BJJpPBnoT3ef
 5PeuljVd9HnNz+Nv+Ik5keS/N+FGKfZr9n7Cu4CLc472+00oPb8wnWxXWpa6/xhNe5G7iqCHSEn
 6wYL5AtnXz4CL2zs+oZwk7xAf+DY3EkbrJlhxy6B2W9hBF+0ZK0Zw7zamLuLmgyRvKs07zOtkUf
 Y2arFkHTFH9deHbELWtMtHckak0wBO+opSqpprijj/g6iEVEpi/mFDIrxjZdwGuIce96deoHSYQ
 8K/B2aQnL9YPi9b0KFoTmoCVyuNfaTCdhVKGKaQkMeuEmUeb
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103168-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: C23A23FC447
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Qcom PCIe RCs can successfully exit from L1ss during OS runtime. However,
during system suspend, the Qcom PCIe RC driver may remove all resource
votes and turns off the PHY to maximize power savings.

Consequently, when the host is in system suspend with the link in L1ss and
the endpoint asserts CLKREQ#, the OS must first wake up and the RC driver
must restore the PHY and enable the refclk. This recovery process causes
the strict L1ss exit latency time to be exceeded. (If the RC driver were to
retain all votes during suspend, L1ss exit would succeed without issue, but
at the expense of higher power consumption).

This latency violation leads to an L1ss exit timeout, followed by a Link
Down (LDn) condition during resume. This LDn can crash the OS if the
endpoint hosts the RootFS, and for other types of devices, it may result in
a full device reset/recovery.

So to ensure that the client drivers can properly handle this scenario, let
them know about this platform limitation by setting the
'pci_host_bridge::broken_l1ss_resume' flag.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 67a16af69ddc..01afffd384f2 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1363,6 +1363,17 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
 
+	/*
+	 * During system suspend, the Qcom RC driver may turn off the PHY and
+	 * remove votes to save power. If the endpoint asserts CLKREQ# to
+	 * exit L1ss, the time required to wake the system and restore the
+	 * PHY/refclk exceeds the strict L1ss exit timing, resulting in Link
+	 * Down (LDn). Set this flag to indicate this limitation to client
+	 * drivers so that they will avoid relying on L1ss during system
+	 * suspend.
+	 */
+	pp->bridge->broken_l1ss_resume = true;
+
 	if (pcie->cfg->ops->host_post_init)
 		pcie->cfg->ops->host_post_init(pcie);
 }

-- 
2.51.0



