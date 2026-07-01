Return-Path: <linux-arm-msm+bounces-115660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NbgLJ8jyRGow3woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:58:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AC06EC715
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:58:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F5M3egaJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115660-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115660-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0892C300E147
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5253B4EBD;
	Wed,  1 Jul 2026 10:58:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF46C3B5306;
	Wed,  1 Jul 2026 10:58:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903491; cv=none; b=VXAzVEkvnVr3WoUrznomALgibrxU4h12r9keVmD+LR839z8WL6CA6LuQN+QTeZ7F1937DItjwLAo/ntv8Csv80Q6aZQvX9AkfDajjOhSbn4PfobXhnYf2x8eSLvNsK6aEtp7dFYfpl9G8z/yPFLX98xrqOxHD4ajlNgTgNo5Yts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903491; c=relaxed/simple;
	bh=jB5MepU6CODcLq6EoYCwB4lWaURO/TvhAAGhAG3vxt8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LdmLfVJqbVQvxBX6Oi+v1S2UfZ0uY8hmacIacRBeykDfveJ9efAiF3RcM0jXVDVTapkA5mY4ZA21P07U4G9zCckaqz6JVPTlEHHynVH7+zP194ej2LfLOFPxVTz9TNs+9gcCe00LpAdYm/M4Lj44tB4246RbwLBl4ayqSSMAVgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5M3egaJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8RoE761248;
	Wed, 1 Jul 2026 10:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tfFQ1qNgGL2rE1pd1FW8WBl8N3InKUkJH7w
	HGUxeaS8=; b=F5M3egaJ/PKLTgMQDrrlrRh6PcuGGmMQRZdqHhyQrFomnt7jw97
	+CRxBHb98RgrJF/37RjvRegMDXEhoWkSbxsvyER4zBKJMb6r1UHqZAgXPhwEjr9O
	AeFY/mR/L0mkDey7DV+nr28+oDNjoZpOyG4q2tZfIKbvDLhu4diBj60m/B2e8wRl
	4b+gQTa59EEFrakZxlbK71jrM5IT9c/xGuKoKOqB38Vhb15Zol8DibuII1q+ElmV
	wxmAWwgCRMy8jlJrRWnRE1XnEIfeziXaeYPJNBXLCiIuR0SE6vE6Hsm2rTSrHhv7
	+vAFfwia3VB1uLnpNcKSZoy393ZdU9lZVAQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw3ns9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 10:58:06 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 661Aw2J4011886;
	Wed, 1 Jul 2026 10:58:02 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/11] ASoC: qcom: Add QAIF driver for Shikra audio platform
Date: Wed,  1 Jul 2026 16:27:46 +0530
Message-Id: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44f2be cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2-yV753ltCfSz2TXDvIA:9
X-Proofpoint-ORIG-GUID: NxTNyK9cnFu9yOaZOpWy16Fx8TqUDPKW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfXyUoLvuxvaBQu
 pTWiYOsWAmlp4caIp6uUeeqPw8O6M/9nSAEKy7XJbeYAS1zHJRsbd732YPWJamrC6K9vE3W/2Ta
 cNoRnSB2ztQ8SUAgBOZi772cbr2bRVE=
X-Proofpoint-GUID: NxTNyK9cnFu9yOaZOpWy16Fx8TqUDPKW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX8/BptatdJIm8
 FjNdweLXaGWopBvQtpEkORiX5v+zhtkOyXaTxfZYZnit8Hhl4vI/AOIItNZ8j6HgYGSmvkU3Z8r
 Re6ztq8aYNebWadzzU8BDbHG3iZBPYmqAkojR5gvy0fer74LcgvDdp1akpnYq6D8ACJE+TUs2kv
 ozKZ/ct/L6t1JzDNwEyWSEHAQZGOGA7O8aa/cpS7BKTZEROrsBOIC++zIsoUxOLnkd5k2gAYxns
 3Glt2qLzv3+uo0ud6MWikTSurZhdAcU8w4ULIDoqF3InAe+5HhRxW4XUZsN3wK5cIPeE9RaHH+z
 qBaJkeB43Jp6pSeg+k5IbKOAvidMpmGIqqqAzOfhWjiaLWKAHYM8ULI2TLbFbEFaLxsVHAae00C
 IrjSOGD2fsWtWjSZLNVoGuJqbXV2G1kdKjdIPUCw0++HF8gSkeToo/9+3KgYI4YxITyUorJdP9B
 uzaH5QfMXGhSsnVBVrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115660-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06AC06EC715

This series introduces the Qualcomm Audio Interface (QAIF) driver for
the Shikra audio platform.


Hardware IP Overview
====================
QAIF (Qualcomm Audio Interface) is a fully configurable DMA-based audio
subsystem used to transmit and receive audio data over serial audio
interfaces (PCM, TDM, MI2S) and to provide a DMA interface for internal
codec connections. It manages two independent data paths:

  Unified Audio Interface (AIF): Serialises and deserialises PCM audio
  between system memory and external serial audio peripherals. Each
  interface supports up to 8 independent data lanes, each configurable
  as TX (speaker) or RX (mic). All lanes of an interface share a single
  bit clock and frame sync. The AUD_INTFa hardware block controls the
  serial protocol -- sync source (master/slave), sync mode (short/long
  PCM, TDM, MI2S), sync delay and inversion, slot and sample widths,
  active slot masks, lane enable/direction, mono/stereo mode and
  full-cycle path support for long chip-to-chip connections.

  Codec DMA Interface (CIF): Provides a parallel DMA interface to the
  internal Bolero digital codec. The RDDMA path carries playback data
  to Bolero and the WRDMA path carries capture data from Bolero. Each
  channel has an INTF_CFG register controlling the active channel enable
  mask, frame-sync selection, frame-sync delay, frame-sync output gating,
  dynamic clock gating and 16-bit packing/unpacking.

  DMA Engine: Read DMAs (RDDMA) fetch audio from DDR/TCM/LPM into a
  shared on-chip SRAM latency buffer (SHRAM) and drain it to the
  interface. Write DMAs (WRDMA) collect data from the interface into
  SHRAM and write it to memory. Each DMA channel owns a private SHRAM
  region. Two QSB master ports (QXM0 and QXM1) provide the memory
  fabric. Burst sizes of 1/2/4/8/16 beats and up to 4 outstanding
  transactions per DMA are supported.

  Execution Environments (EE): Resources (DMAs, audio interfaces,
  interface groups) are partitioned among up to 5 EEs via map registers.
  Each EE receives an independent interrupt output. The interrupt
  hierarchy has two levels: a summary register identifies the event class
  (DMA period, underflow/overflow, error response, AUD_INTF
  underflow/overflow, group done, rate detector, VFR), and per-resource
  status registers identify the specific channel and event type.

  Interface Grouping (Bonding): Multiple AIF and CIF interfaces can be
  bonded into a group to start synchronously and align their DMA period
  interrupts within half a frame duration using the RDDMA padding feature.

  Rate Detector: Two rate detector blocks measure the frequency of
  incoming frame sync or word select signals and generate interrupts on
  rate change, undetected rate or sync timeout.

Block Diagram
=============

  System Memory (DDR / LPM / TCM)
  +---------------------------------+
  |  Circular Buffers (ping-pong)   |
  +----------+----------+-----------+
             |          ^
       64-bit AXI  64-bit AXI
             |          |
  +----------v----------+-----------+
  |        QSB Master Ports         |
  |  +----------+  +----------+     |
  |  |   QXM0   |  |   QXM1   |     |
  |  +----+-----+  +-----+----+     |
  +-------|--------------|----------+
          |              |
  +-------v--------------v----------+
  |         Shared RAM (SHRAM)       |
  |  +------------+  +------------+ |
  |  | QXM0 Read  |  | QXM0 Write | |
  |  | SHRAM      |  | SHRAM      | |
  |  +------------+  +------------+ |
  |  +------------+  +------------+ |
  |  | QXM1 Read  |  | QXM1 Write | |
  |  | SHRAM      |  | SHRAM      | |
  |  +------------+  +------------+ |
  +---+--------+--------+-------+---+
      |        |        |       |
  +---v--+  +--v---+ +--v---+ +-v----+
  |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
  | AIF  |  | CIF  | | AIF  | | CIF  |
  |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
  +--+---+  +--+---+ +--+---+ +-+----+
     |         |       ^          ^
     | TX      | TX    | RX       | RX
     v         v       |          |
  +--+--------------------+  +----+----------+
  |  Unified Audio Intf   |  | Codec DMA     |
  |  (AIF 0..12)          |  | Interface     |
  |                       |  | (CIF)         |
  |  AUD_INTFa block:     |  |               |
  |  - Serializer (TX)    |  | RDDMA: DDR -> |
  |  - De-serializer (RX) |  |   internal    |
  |  - Sync gen/detect    |  |   codec       |
  |  - Up to 8 data lanes |  | WRDMA: codec  |
  |  - PCM / TDM / MI2S   |  |   -> DDR      |
  |  - Near Pad Logic     |  | Up to 16 ch   |
  +--+--------------------+  +----+----------+
     |  Lane 0..7 (TX/RX)       |  Parallel bus
     |  Bit clk + Frame sync    |  + Frame sync
     v                          v
  +--+--------+          +------+------+
  | External  |          | Internal    |
  | Serial    |          | Digital     |
  | Peripherals|         | Codec       |
  | (PCM/TDM/ |          | (Bolero/    |
  |  MI2S)    |          |  WCD)       |
  +-----------+          +-------------+

Software Design
===============
The driver follows the standard ALSA SoC split:

  qaif-cpu.c: CPU DAI component. Manages clocks, initialises regmap
  bitfield handles for all DMA and interface control registers, implements
  DAI ops (startup/shutdown/hw_free/hw_params/trigger) for both AIF and
  CIF paths, registers an of_xlate_dai_name callback so that sound-dai
  references using non-sequential DAI IDs resolve correctly, and parses
  per-interface TDM/MI2S configuration from DT child nodes.

  qaif-platform.c: PCM platform component. Handles DMA buffer allocation
  (dma_alloc_pages()), PCM ops (open/close/hw_params/prepare/trigger/
  pointer/mmap/copy), two-level IRQ dispatch with period-elapsed
  notification, and component suspend/resume across power collapse.

  qaif-shikra.c: Shikra SoC-specific variant descriptor. Provides all
  register field definitions, DMA-to-DAI index maps, SHRAM geometry,
  clock names and the DAI driver array. This abstraction keeps the core
  driver portable across future QAIF integrations.

  qaif.h / qaif-reg.h: Shared data structures, constants and the complete
  MMIO register address map consumed by both the CPU and platform drivers.

  common.c/h: This series also adds asoc_qcom_of_xlate_dai_name(), a shared
  helper that resolves a sound-dai phandle argument to a DAI name by
  searching the component DAI driver array by ID. Both lpass-cpu.c and
  qaif-cpu.c use thin wrappers around this helper, replacing duplicate
  private implementations.

The series is split by functionality to aid review -- register map and
data structures first, then CIF ops, AIF ops, probe infrastructure, PCM
ops, IRQ handling and finally the Shikra variant glue.

Tested on Shikra with 48 kHz stereo MI2S playback and capture over the
Audio Interface Zero (AIF0) and Bolero CDC DMA RX/TX paths.

Link to v1:
  https://lore.kernel.org/lkml/20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com/
Changes in v2:
  - Rename YAML file to qcom,qaif-cpu.yaml, add qcom,qaif-cpu compatible
  - Merge DAI ID header into binding patch, drop _clk suffix from
    clock-names, add enum constraints, remove status: true (Krzysztof)
  - Fix dt_binding_check failure in binding example (Rob)
  - Fix IRQ storm: client status register bitmask missing BIT(16)
  - Fix race: use test_and_set_bit for DMA bitmap allocation
  - Fix regmap_config: use non-const with dynamic max_register
  - Use dev_err_probe() in probe path, sizeof(*var) in kzalloc (Krzysztof)
  - Add kerneldoc for all EXPORT_SYMBOL_GPL functions (Krzysztof)
  - Use goto-based error cleanup in pcmops_open()
  - Move MAINTAINERS entry to last patch (Krzysztof)
  - Add shared asoc_qcom_of_xlate_dai_name() helper used by lpass-cpu
    and qaif-cpu
  - Fix checkpatch --strict warnings and alignment issues

Depends-on: [PATCH 0/4] clk: qcom: Add Audio Core clock controller
  support on Qualcomm Shikra SoC
  https://lore.kernel.org/linux-clk/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com/

Harendra Gautam (11):
  dt-bindings: sound: Add Qualcomm QAIF binding
  ASoC: qcom: Add QAIF hardware register map
  ASoC: qcom: Add QAIF shared data structures and variant interface
  ASoC: qcom: Add QAIF CIF (CDC DMA) DAI ops
  ASoC: qcom: Add QAIF AIF DAI ops
  ASoC: qcom: Add generic of_xlate_dai_name helper and use it in
    lpass-cpu and qaif-cpu
  ASoC: qcom: Add QAIF regmap, DT parsing and platform init
  ASoC: qcom: Add QAIF PCM operations
  ASoC: qcom: Add QAIF IRQ handling, suspend/resume and platform
    register
  ASoC: qcom: Add Shikra QAIF support
  MAINTAINERS: Add Qualcomm QAIF driver entry

 .../devicetree/bindings/sound/qcom,qaif-cpu.yaml   |  358 +++++
 MAINTAINERS                                   |   10 +
 include/dt-bindings/sound/qcom,qaif.h         |   89 ++
 sound/soc/qcom/Kconfig                        |   11 +
 sound/soc/qcom/Makefile                       |    2 +
 sound/soc/qcom/common.c                       |   34 +
 sound/soc/qcom/common.h                       |    5 +
 sound/soc/qcom/lpass-cpu.c                    |   23 +-
 sound/soc/qcom/qaif-cpu.c                     | 1610 ++++++++++++++++++++
 sound/soc/qcom/qaif-platform.c                | 1250 +++++++++++++++
 sound/soc/qcom/qaif-reg.h                     |  453 ++++++
 sound/soc/qcom/qaif-shikra.c                  |  556 +++++++
 sound/soc/qcom/qaif.h                         |  506 ++++++
 13 files changed, 4891 insertions(+), 16 deletions(-)
 create mode 100644 .../devicetree/bindings/sound/qcom,qaif-cpu.yaml
 create mode 100644 include/dt-bindings/sound/qcom,qaif.h
 create mode 100644 sound/soc/qcom/qaif-cpu.c
 create mode 100644 sound/soc/qcom/qaif-platform.c
 create mode 100644 sound/soc/qcom/qaif-reg.h
 create mode 100644 sound/soc/qcom/qaif-shikra.c
 create mode 100644 sound/soc/qcom/qaif.h

base-commit: bebb6ea69b2a793e8c840d7c9c4f18cb1747570f
prerequisite-change-id: 20260605-shikra-audiocorecc-85efef073474
prerequisite-patch-id: 591dd358a559fa83d46149f74f80ff0f2a98da7f
prerequisite-patch-id: 4d40e704139dc4b0ec2529c49f096d86a4e4dc5f
prerequisite-patch-id: c02813140f0c1c3d783f5643e34ef8e175cb20ea
prerequisite-patch-id: b9dbd75b7919d7d2dd621194609507ede839b9bf
-- 
2.34.1


