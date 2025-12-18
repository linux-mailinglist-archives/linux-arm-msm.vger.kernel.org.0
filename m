Return-Path: <linux-arm-msm+bounces-85738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE3ACCD1B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 19:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 894C7301691C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 18:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAE63557F9;
	Thu, 18 Dec 2025 18:03:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24468355050;
	Thu, 18 Dec 2025 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766081003; cv=none; b=P2hpDNBS205ZzBaL0F/wwW6MVlUoEMuPydTC0ceUrLACe2WRr1/HFbGlC+KNBw1IFtz6iEH3UCaaRMXIwlPVU2IbNlaElHnbKyYzsSxocS2Pz2s02PoxCT2K8I4n9Vt6TpZ0UcaM854uNw6P4f3XMQrOMaBfYRbsf8Ro1DmIjts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766081003; c=relaxed/simple;
	bh=FwtZMjOzQPtAXdid+KYvKsDfP7QSHkItstkusniPYRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M88pISLYyFy80gokkpSpv5BFTsKgh9yricxmDXdRw7c6E7+oDflA/LBMRTSoE1W6ue4IAW8S/OZx/QJy8ZRRYasGEhUiEwsywH1Q6vnbQL1RyISS7LweG5GUElLyLOqOko3R5Wmq+zuRMfqw3yzhZdAqZ7oBu56x47enm5+4OOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz12t1766080953tbad004b4
X-QQ-Originating-IP: +O1L5rXCWWMLoSbBIVXoSE9cR0f/TEAYnQ+FkVGsghc=
Received: from bigfoot-server-arm-node1.classf ( [183.250.239.212])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 Dec 2025 02:02:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10289529294355736162
EX-QQ-RecipientCnt: 16
From: Junhao Xie <bigfoot@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Junhao Xie <bigfoot@radxa.com>,
	Xilin Wu <sophon@radxa.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tomas Winkler <tomasw@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd: devices: Qualcomm SCM storage support
Date: Fri, 19 Dec 2025 02:02:03 +0800
Message-ID: <F138514E18CB55B6+20251218180205.930961-1-bigfoot@radxa.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M4K5nIxZYv59llAs4gRwC1RyprGYOFQFtD4PaS0kFNU1sAXoue2dWjId
	XP3+0sWNn3Gd9bPbg3ZlZZDEZTlEwtqDxmwHffH/D9/E8LGFbLaQ69ahxNBIz1XUWHdtrv+
	GWHm18/fl1i2JNscDylflWVnhW3inuYtnkpVKWw/l63qt1S/9NRsdO+3HB3moNW5ve1n+Xk
	0jxqaXlBfBLMy/0MoRDmcanDkhvYw1yXuvMEuJ0DgucCdTervXVoKQI3OpwLRaUj3Ujizy7
	o2pPKthukfL7LAmoxktqvJRxQOOR+TFIv+Cwmttn3G0ujkFD5GZ3g5U6mFFqpfEDLydueAq
	4moL39bj8n4vRwp9y+mLMMlE/9I9O3EdAVNHiokyM1aHJSD7kNsvfeCnTOoDctSIAYNTYZx
	G3opACjIwhuGkoCqiZ6vLAc+KLQK6PvzRWwzkBhKfBOk755x3cpEny6BV5Q1PTOMPQ4ECid
	wyAdEV7M+fjzeOg11hkXe0eeLBiTc0rzFnd0etdgahU8wlEPS4t/TJPpbQarO340ADj5mf6
	9ClAQCFgrzgf8fW8GFds3LEnCXj1h74Xrzml+d/WozkrkSitDxq+bwzMTrXYWQVW5znhlKl
	uXHMDc/Gk5Hw0/B4Dkq+8kUrlk69/4V+YoBhR8pGIlNNUL/lKQ/Dq8aCGSbkB8bokmRYK0p
	LInmGiPQC1dp6264mS9RJ4t2/EQYDvvpoLq4S2+Z3BDH6L6epED01XmpymMbQicH4EykkMB
	xkd4d80/RXooZ+pU3KtOUPMj7o+IvsgIAHl7GLfxJPq2GuTo2EIOturrThbF9jR4SJCdGGj
	XNznS37tQ35xzhtyxKv0iw+QgRBMZZwj6PuDeIcGQniGj/sk+raeSQmRejguCLdzPTk7eLq
	9A8Yv/mek6O5A5PGOFY4l6fnC4pnJ1t72BNl5+lhzYKzKTr0U7ghjXIiqRSk/DGwsxY9ZM6
	sqEyo92Y6y3tAwNj7gF95m9vkZORgECN9Ltmpzs5C47AVho5R61VvZHWZ
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

This patch series adds support for accessing storage devices managed by
Qualcomm TrustZone firmware via SCM (Secure Channel Manager) by
introducing a new MTD driver.

On some Qualcomm platforms, firmware or BIOS-related storage (typically
SPI NOR flash) is not directly accessible from the non-secure world.
All read, write, and erase operations must be performed through SCM
interfaces provided by the secure firmware. As a result, existing MTD
SPI NOR drivers cannot be used directly on these systems.

This series introduces a new MTD device driver that exposes such
firmware-managed storage as a standard MTD device in the Linux kernel.
The driver is built on top of the existing Qualcomm SCM infrastructure
and integrates with the MTD subsystem to provide a uniform interface to
userspace.

This driver has been tested on Radxa Dragon Q6A, based on the Qualcomm
QCS6490 SoC, with a Winbond W25Q256JWPIQ SPI NOR flash device.

Note that this platform previously used the standard Qualcomm Linux firmware,
which allowed direct access to the QSPI controller without needing this
driver. However, we plan to migrate to a Windows-compatible firmware which
is more feature-complete but restricts direct access. Device tree changes
for this transition will be sent separately.

Junhao Xie (2):
  firmware: qcom: scm: Add SCM storage interface support
  mtd: devices: Add Qualcomm SCM storage driver

 drivers/firmware/qcom/qcom_scm.c       | 183 ++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   3 +
 drivers/mtd/devices/Kconfig            |  17 ++
 drivers/mtd/devices/Makefile           |   1 +
 drivers/mtd/devices/qcom_scm_storage.c | 256 +++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h |  47 +++++
 6 files changed, 507 insertions(+)
 create mode 100644 drivers/mtd/devices/qcom_scm_storage.c

-- 
2.51.2


