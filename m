Return-Path: <linux-arm-msm+bounces-106774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLsNAHg8/2kQ3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 15:54:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 480B34FFE93
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 15:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46C8E3013D44
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2026 13:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E360738CFF8;
	Sat,  9 May 2026 13:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XC8ZlNs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC4A38AC8B;
	Sat,  9 May 2026 13:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778334828; cv=none; b=Xl0YO84vxrK3RDl/UJWrVN9h5KqQChUg/qmPZ/DJzpXD7J/FVFt+QyRPKT1NAyBbkQKT8556JONKD8JLyleIaSsoD0BRXixPyUZFqbrYYYdq8EXadytTlulXLzpfZud9RRi3KMq60RZzrhnn18E2wkcroVyeX8SetqirXRDYvh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778334828; c=relaxed/simple;
	bh=XslxQDWUqHuPR9kl+dCUY8yQGz2G39WEj2ulGmwl8e0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZL/vHaueM54wvZ+Vbof7MUs+gU6ePI+X8KeF9eeoLb83BgyNw3H71rEOwBHYgwpRF7yenaC80XM4lJpmOzruAosGpXz97N641cAB83YlnWnLesRb5uXBIAEtXYKBJ3bDkIZEO7DhIISOsT0hCEtDJnfb1rG2R1yNgqxbmRfyLG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XC8ZlNs3; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=mI
	OPut41WSK0wYvb6vxdmeoEPL8RRyCrJZJUvtEZxAE=; b=XC8ZlNs3NhGX18IY9t
	j6I6UhqXs73kv2pIp/r9Gt5lUsDCkK0iccAYOOx8W7o1m7VhAxFqoode05hmjDj/
	cpYcpOSUU/AFOqZfeipmG2LaOlBLEi/vLumvaHFGT7P+0sPXLINCJd5ShbVRSCEG
	M2yZDdph28Cc/jCHv0gpHkUyM=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXLzL8O_9p486jAQ--.37610S2;
	Sat, 09 May 2026 21:51:57 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	jingoohan1@gmail.com
Cc: mx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 0/3] PCI: dwc: Cache PCIe capability offset and simplify drivers
Date: Sat,  9 May 2026 21:51:49 +0800
Message-Id: <20260509135152.2241235-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXLzL8O_9p486jAQ--.37610S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1kuFy3ZryfAw4ruFWxWFg_yoW8CF1rpa
	y5tFWIyF1rtF4avF4Yy3WDuF13t3Z7AFWDK39xW3WSvFyaka1UXr1rtryrtr9rtrWIqr13
	Kr1Uta47GF4fJFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziO6pDUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwx1oDGn-O-395gAA3x
X-Rspamd-Queue-Id: 480B34FFE93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[google.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-106774-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,lists.ozlabs.org,lists.infradead.org,vger.kernel.org,163.com];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The DWC PCIe core and its many platform drivers repeatedly call
dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to obtain the offset of the
PCI Express Capability structure. This is wasteful and makes the code
verbose. And some even search for the PCI_CAP_ID_EXP offset value within
the suspend/resume functions.

Add a cached pcie_cap field in struct dw_pcie and a helper
dw_pcie_get_pcie_cap() to initialize it once at probe time. Then replace
all explicit capability searches with the cached value across the
entire dwc subtree.

Hans Zhang (3):
  PCI: dwc: Add pcie_cap field and helper in designware header
  PCI: dwc: Use cached PCIe capability offset in core
  PCI: dwc: Simplify platform drivers using cached capability offset

 drivers/pci/controller/dwc/pci-imx6.c         |  6 +--
 .../pci/controller/dwc/pci-layerscape-ep.c    |  4 +-
 drivers/pci/controller/dwc/pci-meson.c        |  4 +-
 .../pci/controller/dwc/pcie-designware-ep.c   |  4 +-
 .../pci/controller/dwc/pcie-designware-host.c |  4 +-
 drivers/pci/controller/dwc/pcie-designware.c  | 16 +++---
 drivers/pci/controller/dwc/pcie-designware.h  | 17 +++++++
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 +++---
 drivers/pci/controller/dwc/pcie-eswin.c       |  3 +-
 drivers/pci/controller/dwc/pcie-fu740.c       |  2 +-
 drivers/pci/controller/dwc/pcie-intel-gw.c    |  2 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 11 ++--
 drivers/pci/controller/dwc/pcie-qcom.c        | 24 ++++-----
 drivers/pci/controller/dwc/pcie-sophgo.c      |  8 ++-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c |  5 +-
 drivers/pci/controller/dwc/pcie-spear13xx.c   |  6 +--
 drivers/pci/controller/dwc/pcie-tegra194.c    | 51 +++++++------------
 17 files changed, 85 insertions(+), 97 deletions(-)


base-commit: 70390501d1944d4e5b8f7352be180fceb3a44132
-- 
2.34.1


