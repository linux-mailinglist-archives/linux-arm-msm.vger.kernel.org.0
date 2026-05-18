Return-Path: <linux-arm-msm+bounces-108224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDhAOSYrC2pAEAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:07:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 626EB56F960
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1D50303B4C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 14:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87B2303CAE;
	Mon, 18 May 2026 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StQ5mdlw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F006B2F12AC;
	Mon, 18 May 2026 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116377; cv=none; b=SWgl8htBQdReHyg6HZKx8ulB+umBw88rU6bNI2wBcvGH7sGcVODTVGWef9aM2nKOCjRe0gf6QGemZFV85UUCeqh4xC66RcdgK1PrSILaqcfD4zi/wzoSWj3uqkc5dlx4zXW+TczDiXSCX1o7WQI9/RqHZc/Phpr3daPKNxwqtM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116377; c=relaxed/simple;
	bh=3AIauHZc5fsWKZZZAdpC8t1KoLS+876d+0DM89J+kl8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IJojyrhes7/bz6PL2BxcjqhaP3+GcnBr2wWGjwFrQwyUgyRF+EA1tVhsFFfoXx603Z+4SAL2zrP9JqK+I26FFgSw8e4Mk0AWyDw5Ue5YvdgqLom1twm2r1v0CxS4mpK/5+dnfAixvVmTNmJl3Lrn9dTzjNlVXs3HuZKrPsTMUEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StQ5mdlw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F2F4C2BCB7;
	Mon, 18 May 2026 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116376;
	bh=3AIauHZc5fsWKZZZAdpC8t1KoLS+876d+0DM89J+kl8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=StQ5mdlwmshcD8k2X17VnGuY6aGsbviwj7UdM6eWyWPw5pO4ZtFKubpp/YemJQmVo
	 ntCpz5Mg9exi6ahuQfVWQDw6SK+3vOFrCQU/T9Cl6hce0rTVOGORwl2QZCpebMtMh9
	 EEkDZbfL47kPjRAnvyj3CFAZaBF7rFbJrUi9j9DvjYoBjjVGOaZssCKB+05pdvIp+k
	 bUYVjSTpNCBGQ8rStq7w+LRdrHeKn1mr+TKHmImQYBgyBv2sv0Wlb9+XO8EVCmv8/z
	 r373hrGX6R+am8KgAw7hpjIRnEDl3rqim8H5nBG9HLule28B3oKMBjQh0J/+gN4XPm
	 HqLmTCnUj1Npg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD9BCD4F3C;
	Mon, 18 May 2026 14:59:36 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v8 0/5] PCI: Add support for resetting the Root Ports in a
 platform specific way
Date: Mon, 18 May 2026 20:29:12 +0530
Message-Id: <20260518-pci-port-reset-v8-0-eb5a7d331dfc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEEpC2oC/33MQQ6CMBCF4auQri0ZCm2pK+9hXEA7SBOh2CLRE
 O5uIXGluJnkn+R9MwnoLQZyTGbicbLBuj5GeUiIbqv+itSa2IQB4yAzTgdt6eD8SD0GHGlhFM8
 Ul5CxnMTR4LGxzw08X2K3NozOvzZ/4ut3l5o4BcpExQ2TpakLOLkQ0vujumnXdWk8ZBUn8V8RU
 RGN0hpVgbKudxT5UQTkGXwpMirKGACtNePVL2VZljfQ6RrYPwEAAA==
X-Change-ID: 20250715-pci-port-reset-4d9519570123
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Niklas Cassel <cassel@kernel.org>, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 mani@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Brian Norris <briannorris@chromium.org>, 
 Wilson Ding <dingwei@marvell.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Frank Li <Frank.Li@nxp.com>, Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5165;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=3AIauHZc5fsWKZZZAdpC8t1KoLS+876d+0DM89J+kl8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqCylTQOA4nC0mQALeCJgw1HmXmSTWcof5udtVK
 u/RdWjGSMmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCagspUwAKCRBVnxHm/pHO
 9W1hB/wKp6MDZshPsB3gTDX/NgNSiNPsUCxaAbf5fuBcPAUJYDV+CcTnwU4fOBmOf+m6p6kKolH
 qThFdeESTekTYQVvYlVdmnd3htGg9xw+Zb0aHZtu4KNdyKRoyakYJl6lhqE34sNRDHJ6fj2Vo4Y
 D9/0szP3hnxYPOw7Kyb00CBvdmVi5PZFbmKZVPK7ImSyt28ZokIMWa3U5k4SVDp2azNVnsV1tJK
 3LFamLyNKpMiCVnMHLzF24rywH/EgoOYw1240eFQoebK5SjxoZaWWZ4NnMqQsDMAsHXxwnqjLg/
 7MbJY0+wp4knK47XP/6y5tfKu09Qc0c7h+e7pJj7cJ2uQojA
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108224-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FREEMAIL_TO(0.00)[google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: 626EB56F960
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Currently, in the event of AER/DPC, PCI core will try to reset the slot (Root
Port) and its subordinate devices by invoking bridge control reset and FLR. But
in some cases like AER Fatal error, it might be necessary to reset the Root
Ports using the PCI host bridge drivers in a platform specific way (as indicated
by the TODO in the pcie_do_recovery() function in drivers/pci/pcie/err.c).
Otherwise, the PCI link won't be recovered successfully.

So this series adds a new callback 'pci_host_bridge::reset_root_port' for the
host bridge drivers to reset the Root Port when a fatal error happens.

Also, this series allows the host bridge drivers to handle PCI link down event
by resetting the Root Ports and recovering the bus. This is accomplished by the
help of the new 'pci_host_handle_link_down()' API. Host bridge drivers are
expected to call this API (preferrably from a threaded IRQ handler) with
relevant Root Port 'pci_dev' when a link down event is detected for the port.
The API will reuse the pcie_do_recovery() function to recover the link if AER
support is enabled, otherwise it will directly call the reset_root_port()
callback of the host bridge driver (if exists).

For reference, I've modified the pcie-qcom driver to call
pci_host_handle_link_down() API with Root Port 'pci_dev' after receiving the
LDn global_irq event and populated 'pci_host_bridge::reset_root_port()'
callback to reset the Root Ports.
 
Testing
-------
Tested on Qcom Lemans AU Ride platform with Host and EP SoCs connected over PCIe
link. Simulated the LDn by disabling LTSSM_EN on the EP and I could verify that
the link was getting recovered successfully.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Changes in v8:
- Removed pci_save_state() for the Root Port during recovery as the PCI core now
  saves the config space during enumeration
- Added save/restore in pci_endpoint_test.c driver to save the config space
  after enabling BME and restoring it after reset
- Added a patch to unmap MSI address post LDn
- Rebased on top of v7.1-rc1
- Link to v7: https://lore.kernel.org/r/20260310-pci-port-reset-v7-0-9dd00ccc25ab@oss.qualcomm.com

Changes in v7:
- Dropped Rockchip Root port reset patch due to reported issues. But the series
  works on other platforms as tested by others.
- Added pci_{lock/unlock}_rescan_remove() to guard pci_bus_error_reset() as the
  device could be removed in-between due to Native hotplug interrupt.
- Rebased on top of v7.0-rc1
- Link to v6: https://lore.kernel.org/r/20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com

Changes in v6:
- Incorporated the patch: https://lore.kernel.org/all/20250524185304.26698-2-manivannan.sadhasivam@linaro.org/
- Link to v5: https://lore.kernel.org/r/20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com

Changes in v5:
* Reworked the pci_host_handle_link_down() to accept Root Port instead of
  resetting all Root Ports in the event of link down.
* Renamed 'reset_slot' to 'reset_root_port' to avoid confusion as both terms
  were used interchangibly and the series is intended to reset Root Port only.
* Added the Rockchip driver change to this series.
* Dropped the applied patches and review/tested tags due to rework.
* Rebased on top of v6.16-rc1.

Changes in v4:
- Handled link down first in the irq handler
- Updated ICC & OPP bandwidth after link up in reset_slot() callback
- Link to v3: https://lore.kernel.org/r/20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org

Changes in v3:
- Made the pci-host-common driver as a common library for host controller
  drivers
- Moved the reset slot code to pci-host-common library
- Link to v2: https://lore.kernel.org/r/20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org

Changes in v2:
- Moved calling reset_slot() callback from pcie_do_recovery() to pcibios_reset_secondary_bus()
- Link to v1: https://lore.kernel.org/r/20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org

---
Manivannan Sadhasivam (5):
      PCI: dwc: ep: Clear MSI iATU mapping in dw_pcie_ep_cleanup()
      PCI/ERR: Add support for resetting the Root Ports in a platform specific way
      PCI: host-common: Add link down handling for Root Ports
      PCI: qcom: Add support for resetting the Root Port due to link down event
      misc: pci_endpoint_test: Add AER error handlers

 drivers/misc/pci_endpoint_test.c                |  23 ++++
 drivers/pci/controller/dwc/pcie-designware-ep.c |   5 +
 drivers/pci/controller/dwc/pcie-qcom.c          | 143 +++++++++++++++++++++++-
 drivers/pci/controller/pci-host-common.c        |  35 ++++++
 drivers/pci/controller/pci-host-common.h        |   1 +
 drivers/pci/pci.c                               |  14 +++
 drivers/pci/pcie/err.c                          |   6 +-
 include/linux/pci.h                             |   1 +
 8 files changed, 222 insertions(+), 6 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20250715-pci-port-reset-4d9519570123

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



