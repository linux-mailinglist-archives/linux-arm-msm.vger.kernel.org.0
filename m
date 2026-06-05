Return-Path: <linux-arm-msm+bounces-111367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZAvNGuSpImoSbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:50:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 619D7647827
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:50:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d0sq4+f9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111367-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111367-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4E0F23008685
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96934183BD;
	Fri,  5 Jun 2026 10:37:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422654183B4;
	Fri,  5 Jun 2026 10:37:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655874; cv=none; b=OzwgtgtwKOw7Ym4ONWWrmhlgUOxFJFOrbpQh/8Q74Jw81cFZtC4pZq8HyO2Bav+hYxX+QU8rulFE8jyu4APjQ+EOnXGhwihjZGa9L0EUXsh4s2oOdp6kdSxUodD/2S7zAeolVNp0orcMnssHgQqNbjdsRyWOKIOW7ULIUtIDdSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655874; c=relaxed/simple;
	bh=kcyrPjeuJZWd42rDn1Kr2nTfDV78yRex3n2tZqdSn3k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sISXvMkPCXiHO4e3oVRntLQOIx9LmUobzD1hmcFDZJb9YDUoZ2emZVuKTPXCgaC51kpF6eBMQ6MTy0/unJFNrPr3WJH4LlQd3Yv6o2YEUTXS7RIfdf1gho7WavnKAVyTWZx62FyPMRhbKS9Ycb+NWj2Lit/dWmPOIwJJANwDh24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0sq4+f9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6555uY683112556;
	Fri, 5 Jun 2026 10:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mV06m0R56Lo45XWSWGcP3i
	8G4AJJBc+jc7mnE7Gw0p0=; b=d0sq4+f9ZqgZh6Ok7h/yAJss/tgupMi7gOnqc7
	LXA0kaiWcahGr1vTPpUFzUY1e86yg6NuPuCIXLYBhrFjj5pjubhipK/hN1NNc3Us
	AlDCf2Z60jQ84RTz9vbCmWydAxVrjdbFxRs6oqAG3agDOZikbTJytPQA1cz9SP7k
	u/vozmpXSFjk2B6duX/lFpeFYggBRhFPASEznCodo6b0e0ucR25LWTfeumA4KEp3
	B2T68XZS0ts9WGNhr+mbr8VRML8nJZwXydYYLGPH4TJOkUmT9XgiSwR8kWEGBOYs
	V5UYRvtmL3KCfU6euFEsZdBHAfQiHKDLvfIea5y6nXgvIOnQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekfv732yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 10:37:50 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 655Abk6l011714;
	Fri, 5 Jun 2026 10:37:46 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/13] ASoC: qcom: Add QAIF driver for Shikra audio platform
Date: Fri,  5 Jun 2026 16:07:26 +0530
Message-Id: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-GUID: csZUSwm1ARqs2xr0vk2W5lZCE4Twi-d_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEwMyBTYWx0ZWRfX2v4Xa3jrUVOk
 O5A79pGFkxoF+yAjftgUGP6Uj8siyo/jJhN5pfMialOFi7dRNv72M8ZvVhnhMkSek3/UxFlLa/u
 /3fnvVXTPT5PyGtQ+Oa2P1cO9WUzOsTBs11hbLTYn5arhFMa+obM1XR+ULW7eXcyMIinKH86drB
 JsehxrCkbM4U1dXY5Dk6GdkoXjj0327LRgSIag4Nf5ITb5QVtMP5lVoSNjNTeAFp4FlNOHWYmqO
 YbDzB4AA3D8NhBIuHyQ+NfOStE0X1ipQZeLK6ZoZXenYtUQmmGFkkjTwOmLadPXEvbyhLcZaEbD
 6dJT6KtCY/Hk2+zy+5VM0gk6ATgRB7XkxNDLqU0A0DLypKTk0YvsEwl8+MxZM/Hn00XKAoPr3eG
 rK0NolGKNL12jRYyX4Gm7LMrEuOzLrGcA+qUw3iakfcWK5+zQO5ZAlyXTQCImE9QplWrrUKoKcy
 ekQK0ZR1T4FseFLE+nQ==
X-Authority-Analysis: v=2.4 cv=JNULdcKb c=1 sm=1 tr=0 ts=6a22a6fe cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qLBaUGd7TCgKCsoal_sA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: csZUSwm1ARqs2xr0vk2W5lZCE4Twi-d_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111367-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 619D7647827

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


Harendra Gautam (13):
  dt-bindings: sound: Add Qualcomm QAIF DAI ID header
  dt-bindings: sound: Add Qualcomm QAIF binding
  MAINTAINERS: Add Qualcomm QAIF driver entry
  ASoC: qcom: Add QAIF hardware register map
  ASoC: qcom: Add QAIF shared data structures and variant interface
  ASoC: qcom: Add QAIF CIF (CDC DMA) DAI ops
  ASoC: qcom: Add QAIF AIF DAI ops
  ASoC: qcom: Add generic of_xlate_dai_name helper to common
  ASoC: qcom: lpass-cpu: Use asoc_qcom_of_xlate_dai_name helper
  ASoC: qcom: Add QAIF regmap, DT parsing and platform init
  ASoC: qcom: Add QAIF PCM operations
  ASoC: qcom: Add QAIF IRQ handling, suspend/resume and platform register
  ASoC: qcom: Add Shikra QAIF support

 .../devicetree/bindings/sound/qcom,qaif.yaml  |  361 ++++
 MAINTAINERS                                   |   10 +
 include/dt-bindings/sound/qcom,qaif.h         |   92 ++
 sound/soc/qcom/Kconfig                        |   11 +
 sound/soc/qcom/Makefile                       |    2 +
 sound/soc/qcom/common.c                       |   34 +
 sound/soc/qcom/common.h                       |    5 +
 sound/soc/qcom/lpass-cpu.c                    |   19 +-
 sound/soc/qcom/qaif-cpu.c                     | 1586 ++++++++++++++++++++
 sound/soc/qcom/qaif-platform.c                | 1169 +++++++++++++++
 sound/soc/qcom/qaif-reg.h                     |  405 +++++
 sound/soc/qcom/qaif-shikra.c                  |  585 ++++++++
 sound/soc/qcom/qaif.h                         |  504 +++++++
 13 files changed, 4769 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif.yaml
 create mode 100644 include/dt-bindings/sound/qcom,qaif.h
 create mode 100644 sound/soc/qcom/qaif-cpu.c
 create mode 100644 sound/soc/qcom/qaif-platform.c
 create mode 100644 sound/soc/qcom/qaif-reg.h
 create mode 100644 sound/soc/qcom/qaif-shikra.c
 create mode 100644 sound/soc/qcom/qaif.h

-- 
2.34.1

