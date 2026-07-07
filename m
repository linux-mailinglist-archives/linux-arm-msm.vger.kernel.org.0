Return-Path: <linux-arm-msm+bounces-117252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5/Z7OY7STGo6qQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:18:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C4B71A3AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 12:18:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=W48hkeBy;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117252-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117252-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F14A303CC41
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 10:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB54D3DD86C;
	Tue,  7 Jul 2026 10:18:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA68738E8BE;
	Tue,  7 Jul 2026 10:18:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419509; cv=none; b=b1mY/VDWBxMF0hmq9I1rOrw91XaTQdCdGVwgzLUgQD4exigOZQvOXpcMhG9TFYN/ITEi1+cFunjVZ/xNAhF5r8D/0KYsLS9x4xtshelm/7ipXLyD8gC1FRx9fBMszdGl5RTfAm1m1iyYogo5eudO+PPeRivCB+4Or03gE+Gv634=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419509; c=relaxed/simple;
	bh=kZQRAY0+wf7tANwdQEEzmn2adWvwm631GfvPmgo1bcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DDf5vzLcFYImVExJjB9EEFR3mam4d0+JLqUbWaZkDI33KDZgp2IbQ4eZQVYsYOPM21PrCb02PDvuP6uARAAtt7M9Pb49m7K5zaotMDpX+nVxt56I35boCebMx/+CXtXFXbvHrnofvhbgNHH8yziJQPuBOef+2D1NL0yrgCHWkHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W48hkeBy; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783419506;
	bh=kZQRAY0+wf7tANwdQEEzmn2adWvwm631GfvPmgo1bcw=;
	h=From:To:Cc:Subject:Date:From;
	b=W48hkeByz7O/ceb8s8R92eJ1nVmwF26Prc8pDQvGBVVVdTivuKyzmsvNqma39qKES
	 /kTyDCDsom0/cQxnWMc65uLFdgcrgCzI9Yi0efKLVLVirqIYujMpVsTGGd661pJbXe
	 2WRp6m3tIm4+bxEhsVo1I8V8VZ0pie5k9i1Sl4cJt9uQPntDulqbicFBs4pQDNyh9+
	 jgAI3lSy9eCrMPSa0lKbTB4CmPJrrwMPMBdqfW9b7Bcc8o6LYW4Lq7FE97Z+U1f6zA
	 i43ZhiPpr1c/6fuqUcpN7sBJJY54c+uBodvqA6kNbruyTD1DfFq94vyCtVUze4rucp
	 3xSkzYLY+sUJw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B44217E0795;
	Tue, 07 Jul 2026 12:18:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org,
	sboyd@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	srini@kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	sre@kernel.org,
	angelogioacchino.delregno@collabora.com,
	krzk@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	quic_wcheng@quicinc.com,
	melody.olvera@oss.qualcomm.com,
	quic_nsekar@quicinc.com,
	ivo.ivanov.ivanov1@gmail.com,
	abelvesa@kernel.org,
	luca.weiss@fairphone.com,
	konrad.dybcio@oss.qualcomm.com,
	mitltlatltl@gmail.com,
	krishna.kurapati@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v11 00/12] SPMI: Implement sub-devices and migrate drivers
Date: Tue,  7 Jul 2026 12:18:09 +0200
Message-ID: <20260707101821.173319-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,arndb.de,linuxfoundation.org,linaro.org,collabora.com,oss.qualcomm.com,quicinc.com,gmail.com,fairphone.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-117252-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:sboyd@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:sre@kernel.org,m:angelogioacchino.delregno@collabora.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_wcheng@quicinc.com,m:melody.olvera@oss.qualcomm.com,m:quic_nsekar@quicinc.com,m:ivo.ivanov.ivanov1@gmail.com,m:abelvesa@kernel.org,m:luca.weiss@fairphone.com,m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-pm@vger.kernel.org,m:kernel@collabora.com,m:ivoivanovivanov1@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50C4B71A3AB

Changes in v11:
 - Use kzalloc_obj() in spmi_subdevice_alloc_and_add()
 - Introduced new helper to get a parent SPMI device which verifies
   both if the device has parent and if that parent is effectively
   a SPMI device type
 - Removed dev->parent NULL checks in all migration code, as that
   is now being checked in the new helper instead, reducing the
   amount of required lines of code to instantiate a SPMI subdevice
 - Moved of_node reference dropping to dev release callback (Sashiko)
 - Rebased over next-20260706

Changes in v10:
 - Add use-after-free fix rebased to before this series, as the v1 of
   that did not apply cleanly on a tree without this series applied
 - Replace unsafe to_spmi_device() with spmi_find_device_by_of_node() (Sashiko)
 - Fix -Wformat warning in dev_set_name call (Sashiko)

Changes in v9:
 - Added check for dev->parent where missing (Sashiko)
 - Changed %d to %u in dev_set_name() call as arg is unsigned (Sashiko)
 - Propagating error code from devm_regmap_init_spmi_ext() instead of
   returning -ENODEV in phy-qcom-eusb2-repeater.c (Sashiko)
 - Rebased over next-20260605 (no conflicts anyway)

Changes in v8:
 - Renamed *res to *sub_sdev in devm_spmi_subdevice_remove() (Andy)
 - Changed kerneldoc wording to "error pointer" for function
   spmi_subdevice_alloc_and_add() (Andy)
 - Shuffled around some assignments in spmi_subdevice_alloc_and_add() (Andy)
 - Used device_property_read_u32() instead of of_property_read_u32()
   in all of the migrated drivers (Andy)
 - Changed .max_register field in all of the migrated drivers from
   0x100 to 0xff (Andy)
 - Kept `sta1` declaration in reversed xmas tree order in function
   iadc_poll_wait_eoc() of qcom-spmi-iadc.c (Andy)

Changes in v7:
 - Added commit to cleanup redundant dev_name() in the pre-existing
   spmi_device_add() function
 - Added commit removing unneeded goto and improving spmi_device_add()
   readability by returning error in error path, and explicitly zero
   for success at the end.

Changes in v6:
 - Added commit to convert spmi.c to %pe error format and used
   %pe error format in spmi_subdevice code as wanted by Uwe Kleine-Konig

Changes in v5:
 - Changed dev_err to dev_err_probe in qcom-spmi-sdam (and done
   that even though I disagree - because I wanted this series to
   *exclusively* introduce the minimum required changes to
   migrate to the new API, but okay, whatever....!);
 - Added missing REGMAP dependency in Kconfig for qcom-spmi-sdam,
   phy-qcom-eusb2-repeater and qcom-coincell to resolve build
   issues when the already allowed COMPILE_TEST is enabled
   as pointed out by the test robot's randconfig builds.

Changes in v4:
 - Added selection of REGMAP_SPMI in Kconfig for qcom-coincell and
   for phy-qcom-eusb2-repeater to resolve undefined references when
   compiled with some randconfig

Changes in v3:
 - Fixed importing "SPMI" namespace in spmi-devres.c
 - Removed all instances of defensive programming, as pointed out by
   jic23 and Sebastian
 - Removed explicit casting as pointed out by jic23
 - Moved ida_free call to spmi_subdev_release() and simplified error
   handling in spmi_subdevice_alloc_and_add() as pointed out by jic23

Changes in v2:
 - Fixed missing `sparent` initialization in phy-qcom-eusb2-repeater
 - Changed val_bits to 8 in all Qualcomm drivers to ensure
   compatibility as suggested by Casey
 - Added struct device pointer in all conversion commits as suggested
   by Andy
 - Exported newly introduced functions with a new "SPMI" namespace
   and imported the same in all converted drivers as suggested by Andy
 - Added missing error checking for dev_set_name() call in spmi.c
   as suggested by Andy
 - Added comma to last entry of regmap_config as suggested by Andy

While adding support for newer MediaTek platforms, featuring complex
SPMI PMICs, I've seen that those SPMI-connected chips are internally
divided in various IP blocks, reachable in specific contiguous address
ranges... more or less like a MMIO, but over a slow SPMI bus instead.

I recalled that Qualcomm had something similar... and upon checking a
couple of devicetrees, yeah - indeed it's the same over there.

What I've seen then is a common pattern of reading the "reg" property
from devicetree in a struct member and then either
 A. Wrapping regmap_{read/write/etc}() calls in a function that adds
    the register base with "base + ..register", like it's done with
    writel()/readl() calls; or
 B. Doing the same as A. but without wrapper functions.

Even though that works just fine, in my opinion it's wrong.

The regmap API is way more complex than MMIO-only readl()/writel()
functions for multiple reasons (including supporting multiple busses
like SPMI, of course) - but everyone seemed to forget that regmap
can manage register base offsets transparently and automatically in
its API functions by simply adding a `reg_base` to the regmap_config
structure, which is used for initializing a `struct regmap`.

So, here we go: this series implements the software concept of an SPMI
Sub-Device (which, well, also reflects how Qualcomm and MediaTek's
actual hardware is laid out anyway).

               SPMI Controller
                     |                ______
                     |               /       Sub-Device 1
                     V              /
              SPMI Device (PMIC) ----------- Sub-Device 2
                                    \
                                     \______ Sub-Device 3

As per this implementation, an SPMI Sub-Device can be allocated/created
and added in any driver that implements a... well.. subdevice (!) with
an SPMI "main" device as its parent: this allows to create and finally
to correctly configure a regmap that is specific to the sub-device,
operating on its specific address range and reading, and writing, to
its registers with the regmap API taking care of adding the base address
of a sub-device's registers as per regmap API design.

All of the SPMI Sub-Devices are therefore added as children of the SPMI
Device (usually a PMIC), as communication depends on the PMIC's SPMI bus
to be available (and the PMIC to be up and running, of course).

Summarizing the dependency chain (which is obvious to whoever knows what
is going on with Qualcomm and/or MediaTek SPMI PMICs):
    "SPMI Sub-Device x...N" are children "SPMI Device"
    "SPMI Device" is a child of "SPMI Controller"

(that was just another way to say the same thing as the graph above anyway).

Along with the new SPMI Sub-Device registration functions, I have also
performed a conversion of some Qualcomm SPMI drivers and only where the
actual conversion was trivial.

I haven't included any conversion of more complex Qualcomm SPMI drivers
because I don't have the required bandwidth to do so (and besides, I think,
but haven't exactly verified, that some of those require SoCs that I don't
have for testing anyway).

AngeloGioacchino Del Regno (12):
  spmi: Fix potential use-after-free by grabbing of_node reference
  spmi: Remove redundant dev_name() print in spmi_device_add()
  spmi: Print error status with %pe format
  spmi: Remove unneeded goto in spmi_device_add() error path
  spmi: Implement spmi_subdevice_alloc_and_add() and devm variant
  spmi: Add helper to get a parent SPMI device
  nvmem: qcom-spmi-sdam: Migrate to devm_spmi_subdevice_alloc_and_add()
  power: reset: qcom-pon: Migrate to devm_spmi_subdevice_alloc_and_add()
  phy: qualcomm: eusb2-repeater: Migrate to
    devm_spmi_subdevice_alloc_and_add()
  misc: qcom-coincell: Migrate to devm_spmi_subdevice_alloc_and_add()
  iio: adc: qcom-spmi-iadc: Migrate to
    devm_spmi_subdevice_alloc_and_add()
  iio: adc: qcom-spmi-iadc: Remove regmap R/W wrapper functions

 drivers/iio/adc/qcom-spmi-iadc.c              | 116 ++++++++--------
 drivers/misc/Kconfig                          |   2 +
 drivers/misc/qcom-coincell.c                  |  45 +++++--
 drivers/nvmem/Kconfig                         |   1 +
 drivers/nvmem/qcom-spmi-sdam.c                |  41 ++++--
 drivers/phy/qualcomm/Kconfig                  |   2 +
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    |  52 +++++---
 drivers/power/reset/qcom-pon.c                |  31 +++--
 drivers/spmi/spmi-devres.c                    |  24 ++++
 drivers/spmi/spmi.c                           | 124 ++++++++++++++++--
 include/linux/spmi.h                          |  17 +++
 11 files changed, 328 insertions(+), 127 deletions(-)

-- 
2.54.0


