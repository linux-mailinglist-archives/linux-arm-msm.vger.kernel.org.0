Return-Path: <linux-arm-msm+bounces-115661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sQHcKdnyRGo23woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:58:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F32C6EC72F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:58:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HtWkPO6n;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115661-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115661-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A27C30095E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F2642DFF2;
	Wed,  1 Jul 2026 10:58:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6493B9617;
	Wed,  1 Jul 2026 10:58:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903493; cv=none; b=dQWu+iag69UEm1pYsi9ASC9UGLVD6A++SXLoPbsdPNHIt9y+Y34cQD0EXZkUj7NMnjxsUEwv0B2NzGC7y7F8XGreukn84apxGDa7t/W5ATJxSqUuMyHVysv9z2byC7QTmc+cFAwJ9ZACE/xXPGo5qoECkafcibH2z1pJ2EY5iHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903493; c=relaxed/simple;
	bh=jkAv7QvKyayJIQeHyUaaTy/3/78ElF616S8Zx3sBP74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fq8fSgpiFMiJpZAWcLuZ0XeDal7m5ZNvyUjr1M4PJqGxqBha6Xx9V6/cVRuHIsX85wQ6peN9dmtS40aC7lTsKspGAdz6BzcKkQMUx/vgkHKEwzi3i+R6kVYXEiRsjBmb1p6ngvWs1CwYLuLWjhtlow2SM2fkpt+BUY0l1HTHCOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtWkPO6n; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8UKT643984;
	Wed, 1 Jul 2026 10:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBf3wUjl0BEVpu8ViJZCI8wFAxUfIlkzKCrFRTv0GSQ=; b=HtWkPO6nfgRpgKE6
	LqYM5yNR3dkpdZzEjf1rbTbeoWfykOm1uBk4qL4uvJxNmf+hjN9PuXTCpArH/35K
	TbC39gnVASPHgBRyJQ2nQriTQiIxsE4vUvnedz9FtU9weh0klABrNVN7a9tl5F6A
	+5oNMm9zw1ZA5JH6WSng18djgOLV0aq3x+uELmuFSClQUhtolqC6A4Wrjvzftqkd
	TyEjiaaeztOINGlOUvBHbKg6a3EJsDbLU36ysktfBXHD9btNumBVoNprOeStg7My
	OIlUGbBzWgivLdVnPzfDHIN8D5n3ghCJGmEE1g4B8YeUm6KMwBqYSJoBRE/JGhRs
	fkzPXw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4dr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 10:58:07 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 661Aw2J5011886;
	Wed, 1 Jul 2026 10:58:03 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/11] dt-bindings: sound: qcom,qaif-cpu: Add binding
Date: Wed,  1 Jul 2026 16:27:47 +0530
Message-Id: <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfXw0dfeDZkAhQT
 5YZJ4UApJ4Ia4cGoIu2SF71aAaFGQcxEx+ZtEZYtjtAkEaAtYdfFkOOMUuI89eL68+ghMnpbnSW
 GoQu9szGOUtRwTueXbben6DufLwVT5k=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44f2bf cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8 a=6pifYrob6IKiN34dYWQA:9
 a=9G7WFDrTNaI2hl7B:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 9wsQoFQEP99UVGpPwjkwWcbXcPeV8pmh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfXxRr746ZLxf/3
 p34Q9XFTNNFUyOnB6CY9ZQ11jJKuAcMbQXwuAhd/xPmzKW20LOW9UsmNSsIGhSDDZVPnNjyBSiJ
 TGeor7HaYOMdaCWv9bfDw9Jtqz/8cNJ7/EW7+mSfgn5dNsqMnGY9t+KQD22OrYjs134MApX/gN/
 4XVS1MDN24JV+hseZ/PU9SPamL/QzkCmQ2/nz3bZW1rquBSGmEls0VCCU7kWg9IeGHX8tPqNtho
 LrRRfFlxlZP5FvoUcjIrX7s5uMit8Nz9k586d0hj5gv5YSGRbqFkM5R+JltuzhcYirQynYzdw/I
 kpk/ux407y/xxhxLSR+Znp5W7usz2akw0trBxfCiFwzlvTxbIHFpbUMYBTVrhPe5gYac+NlVhPq
 3AM7E9S8kjuwxwF9LkWCThX46LU9GZEqTEbpI/pxWoWcLV1tt+78ItgYbzxS6IYics66ed2KG4f
 tWqGNwwHEHb55pPdZNQ==
X-Proofpoint-GUID: 9wsQoFQEP99UVGpPwjkwWcbXcPeV8pmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010115
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
	TAGGED_FROM(0.00)[bounces-115661-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,devicetree.org:url,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F32C6EC72F

Add a dt-bindings header for the Qualcomm Audio Interface (QAIF) controller
DAI IDs. This provides shared constants for devicetree sound-dai references
and QAIF aif-interface reg values instead of using raw numeric IDs.

Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
controller used on the Shikra audio platform.

QAIF moves PCM data between system memory and external serial audio
interfaces through the AIF path, and between memory and the internal Bolero
digital codec through the CIF path. The controller needs a binding so
platform Devicetree files can describe its MMIO region, DMA IOMMU stream,
clocks, interrupt, DAI cells and per-interface AIF configuration.

Describe the single register region, one EE interrupt, the required GCC
LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@N'
child nodes used for static PCM, TDM or MI2S configuration.

Depends-on: [PATCH 0/4] clk: qcom: Add Audio Core clock controller
  support on Qualcomm Shikra SoC
  https://lore.kernel.org/linux-clk/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com/
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 .../bindings/sound/qcom,qaif-cpu.yaml         | 358 ++++++++++++++++++
 include/dt-bindings/sound/qcom,qaif.h         |  92 +++++
 2 files changed, 447 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
 create mode 100644 include/dt-bindings/sound/qcom,qaif.h

diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
new file mode 100644
index 000000000000..6b1ced01e04f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
@@ -0,0 +1,358 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,qaif-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Audio Interface (QAIF) CPU DAI Controller
+
+maintainers:
+  - Harendra Gautam <harendra.gautam@oss.qualcomm.com>
+
+description:
+  |
+  The Qualcomm Audio Interface (QAIF) is a fully configurable DMA-based
+  audio subsystem controller. It serialises and deserialises PCM audio
+  between system memory and external serial audio peripherals (PCM, TDM,
+  I2S, MI2S) through the AIF path, and transfers parallel audio between
+  memory and an internal WCD codec through the CIF path.
+
+  AIF (Audio Interface): up to 13 multi-lane Unified Audio Interfaces,
+  each supporting up to 8 independent data lanes. Each lane is individually
+  configurable as TX (output/speaker) or RX (input/mic). All lanes of an
+  interface share a single bit clock and frame sync. Supported modes are
+  PCM (short/long sync), TDM, and MI2S (stereo/mono). Per-interface
+  configuration includes sync source (master/slave), sync mode, sync delay,
+  sync inversion, slot width (8/16/24/32-bit), sample width, active slot
+  masks (up to 32 slots), bits-per-lane frame size, lane enable/direction
+  masks, loopback, output-enable control, and full-cycle path support for
+  long chip-to-chip connections.
+
+  CIF (Codec Interface): up to 32 RDDMA (playback) and 32 WRDMA (capture)
+  channels connecting to an internal codec over a parallel bus. Each channel
+  supports active-channel enable mask (up to 16 channels), frame-sync
+  selection, frame-sync delay, frame-sync output gating, dynamic clock
+  gating, and 16-bit packing/unpacking.
+
+  Note on RX/TX naming convention: in QAIF, RX refers to the capture path
+  (audio received from the interface into memory) and TX refers to the
+  playback path (audio transmitted from memory to the interface). This
+  applies to both AIF lane directions and CIF slot/mask properties.
+
+  DMA engine: RDDMA fetches audio from DDR/TCM/LPM into a shared SRAM
+  latency buffer (SHRAM) and drains it to the interface. WRDMA collects
+  data from the interface into SHRAM and writes it to memory. Each DMA
+  owns a private SHRAM region defined by start address and length registers.
+  Burst sizes of 1/2/4/8/16 beats (64-bit) are supported with up to 4
+  outstanding transactions per DMA. Two QSB master ports (QXM0 for TCM,
+  QXM1 for DDR/LPM) provide the memory interface.
+
+  Resources are partitioned among up to 5 Execution Engines (EEs) via
+  EE map registers. Each EE owns a set of DMAs, audio interfaces, and
+  interface groups, and receives its own independent interrupt output.
+  The interrupt hierarchy has a two-level structure: a summary register
+  identifies the event class (DMA period, underflow/overflow, error
+  response, audio interface underflow/overflow, group done, rate detector,
+  VFR), and per-resource status registers identify the specific channel.
+
+  Interface grouping (bonding) allows up to 6 groups of audio and codec
+  interfaces to start synchronously and align their DMA period interrupts
+  within half a frame duration using the RDDMA padding feature.
+
+  Two rate detector blocks measure the frequency of incoming frame sync or
+  word select signals and generate interrupts on rate change, undetected
+  rate, or sync timeout.
+
+  Block diagram::
+
+    System Memory (DDR / LPM / TCM)
+    +---------------------------------+
+    |  Circular Buffers (ping-pong)   |
+    +----------+----------+-----------+
+               |          ^
+         64-bit AXI  64-bit AXI
+               |          |
+    +----------v----------+-----------+
+    |        QSB Master Ports         |
+    |  +----------+  +----------+     |
+    |  |   QXM0   |  |   QXM1   |     |
+    |  +----+-----+  +-----+----+     |
+    +-------|--------------|----------+
+            |              |
+    +-------v--------------v----------+
+    |         Shared RAM (SHRAM)       |
+    |  +------------+  +------------+ |
+    |  | QXM0 Read  |  | QXM0 Write | |
+    |  | SHRAM      |  | SHRAM      | |
+    |  +------------+  +------------+ |
+    |  +------------+  +------------+ |
+    |  | QXM1 Read  |  | QXM1 Write | |
+    |  | SHRAM      |  | SHRAM      | |
+    |  +------------+  +------------+ |
+    +---+--------+--------+-------+---+
+        |        |        |       |
+    +---v--+  +--v---+ +--v---+ +-v----+
+    |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
+    | AIF  |  | CIF  | | AIF  | | CIF  |
+    |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
+    +--+---+  +--+---+ +--+---+ +-+----+
+       |         |       ^          ^
+       | TX      | TX    | RX       | RX
+       v         v       |          |
+    +--+--------------------+  +----+----------+
+    |  Unified Audio Intf   |  | Codec DMA     |
+    |  (AIF 0..12)          |  | Interface     |
+    |                       |  | (CIF)         |
+    |  AUD_INTFa block:     |  |               |
+    |  - Serializer (TX)    |  | RDDMA: DDR -> |
+    |  - De-serializer (RX) |  |   internal    |
+    |  - Sync gen/detect    |  |   codec       |
+    |  - Up to 8 data lanes |  | WRDMA: codec  |
+    |  - PCM / TDM / MI2S   |  |   -> DDR      |
+    |  - Near Pad Logic     |  | Up to 16 ch   |
+    +--+--------------------+  +----+----------+
+       |  Lane 0..7 (TX/RX)       |  Parallel bus
+       |  Bit clk + Frame sync    |  + Frame sync
+       v                          v
+    +--+--------+          +------+------+
+    | External  |          | Internal    |
+    | Serial    |          | Digital     |
+    | Peripherals|         | Codec       |
+    | (PCM/TDM/ |          | (Bolero/    |
+    |  MI2S)    |          |  WCD)       |
+    +-----------+          +-------------+
+
+properties:
+  compatible:
+    enum:
+      - qcom,qaif-cpu
+      - qcom,shikra-qaif-cpu
+
+  reg:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  clocks:
+    maxItems: 9
+
+  clock-names:
+    items:
+      - const: lpass_config
+      - const: lpass_core_axim
+      - const: aud_dma
+      - const: aud_dma_mem
+      - const: bus
+      - const: aif_if0_ibit
+      - const: aif_if1_ibit
+      - const: aif_if2_ibit
+      - const: aif_if3_ibit
+
+  interrupts:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+
+patternProperties:
+  "^aif-interface@[0-9a-f]+$":
+    type: object
+    description:
+      AIF interface configuration child node. The compatible string
+      identifies the serial protocol the interface is wired for on the
+      board. The unit address matches the hardware AIF interface index.
+    properties:
+      compatible:
+        enum:
+          - qcom,qaif-pcm-dai
+          - qcom,qaif-tdm-dai
+          - qcom,qaif-mi2s-dai
+      reg:
+        maxItems: 1
+        description: |
+          Hardware AIF interface index (AUD_INTFa block index). This value
+          also serves as the ALSA DAI ID; it corresponds directly to the
+          QAIF_MI2S_TDM_AIFn constants in <dt-bindings/sound/qcom,qaif.h>
+          (e.g. reg = <2> selects QAIF_MI2S_TDM_AIF2).
+      qcom,qaif-aif-sync-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+        description:
+          Defines the FRAME SYNC mode for the audio interface.
+            0 = SHORT - FRAME SYNC is high for 1 INTF clock cycle per frame
+            1 = ONE_SLOT - FRAME SYNC is high for 1 slot per frame (pulse
+                stretched by MIN(RPCM_WIDTH, TPCM_WIDTH))
+            2 = LONG - FRAME SYNC is high for half the frame duration
+      qcom,qaif-aif-sync-src:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description:
+          Sync clock/frame source. Independent of sync-mode;
+          all combinations of sync-mode and sync-src are valid.
+            0 = External source (slave)
+            1 = Internal source (master)
+      qcom,qaif-aif-invert-sync:
+        type: boolean
+        description: Invert the frame sync polarity.
+      qcom,qaif-aif-sync-delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+        description:
+          Defines MSB data start position relative to FRAME SYNC edge.
+            0 = MSB data starts at the rising/falling edge of FRAME SYNC
+            1 = MSB data starts 1 INTF clock cycle after FRAME SYNC edge
+            2 = MSB data starts 2 INTF clock cycles after FRAME SYNC edge
+      qcom,qaif-aif-slot-width-rx:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [8, 16, 24, 32]
+        description:
+          RX slot width in bits. Board-specific hardware constraint
+          determined by the wiring of the serial audio interface.
+      qcom,qaif-aif-slot-width-tx:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [8, 16, 24, 32]
+        description:
+          TX slot width in bits. Board-specific hardware constraint
+          determined by the wiring of the serial audio interface.
+      qcom,qaif-aif-slot-en-rx-mask:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Bitmask of active RX slots. Board-specific — determined by which
+          TDM slots the codec is wired to on this board.
+      qcom,qaif-aif-slot-en-tx-mask:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Bitmask of active TX slots. Board-specific — determined by which
+          TDM slots the codec is wired to on this board.
+      qcom,qaif-aif-loopback:
+        type: boolean
+        description: Enable DMA and interface-level loopback mode.
+          Used for hardware validation only; omit in production.
+      qcom,qaif-aif-ctrl-data-oe:
+        type: boolean
+        description: Enables output drive on the control/data line.
+          Required when the interface is connected to a shared bus;
+          not needed for point-to-point connections.
+      qcom,qaif-aif-lane-config:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description:
+          Lane configuration matrix. Each row is a pair <enable direction>
+          for one lane starting from lane 0, up to 8 lanes.
+          enable: 0 = disabled, 1 = enabled (QAIF_AIF_LANE_ENABLE).
+          direction: QAIF_AIF_LANE_DIR_TX (0) for TX (playback),
+                     QAIF_AIF_LANE_DIR_RX (1) for RX (capture).
+        maxItems: 8
+        items:
+          items:
+            - description: Lane enable (0 = disabled, 1 = enabled)
+              enum: [0, 1]
+            - description: Lane direction (0 = TX/speaker, 1 = RX/mic)
+              enum: [0, 1]
+      qcom,qaif-aif-full-cycle-en:
+        type: boolean
+        description: Enable full-cycle sync (effective in sync master mode).
+      qcom,qaif-aif-bits-per-lane:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Number of slots per lane. Maps to hardware register
+          BITS_PER_LANE as (slot_width * bits_per_lane - 1).
+          For example, 2 slots with a 32-bit slot width gives
+          63 (= 32 * 2 - 1) in the register, representing 64
+          bits per lane per frame.
+    if:
+      properties:
+        compatible:
+          const: qcom,qaif-mi2s-dai
+    then:
+      description:
+        MI2S interface. Sync mode and slot-enable masks are fixed by the
+        MI2S protocol and must not be set in DT. Mono/stereo mode is
+        determined at runtime from the stream channel count.
+      properties:
+        qcom,qaif-aif-sync-mode: false
+        qcom,qaif-aif-slot-en-rx-mask: false
+        qcom,qaif-aif-slot-en-tx-mask: false
+    else:
+      description:
+        PCM or TDM interface. Sync mode and slot-enable masks are
+        board-specific and must be provided. Mono mode does not apply.
+      required:
+        - qcom,qaif-aif-sync-mode
+        - qcom,qaif-aif-slot-en-rx-mask
+        - qcom,qaif-aif-slot-en-tx-mask
+
+    required:
+      - compatible
+      - reg
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - iommus
+  - clocks
+  - clock-names
+  - interrupts
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/sound/qcom,qaif.h>
+    #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
+    #include <dt-bindings/clock/qcom,gcc-shikra.h>
+
+    qaif_cpu: audio@a000000 {
+        compatible = "qcom,shikra-qaif-cpu";
+        reg = <0x0 0x0a000000 0x0 0x20000>;
+        iommus = <&apps_smmu 0x1c0 0x0>;
+        clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
+                 <&gcc GCC_LPASS_CORE_AXIM_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_MEM_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_BUS_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>;
+        clock-names = "lpass_config",
+                      "lpass_core_axim",
+                      "aud_dma",
+                      "aud_dma_mem",
+                      "bus",
+                      "aif_if0_ibit",
+                      "aif_if1_ibit",
+                      "aif_if2_ibit",
+                      "aif_if3_ibit";
+        #sound-dai-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
+
+        qaif_aif_if2: aif-interface@2 {
+            compatible = "qcom,qaif-tdm-dai";
+            reg = <QAIF_MI2S_TDM_AIF2>;
+            qcom,qaif-aif-sync-mode = <1>;
+            qcom,qaif-aif-sync-src = <1>;
+            qcom,qaif-aif-sync-delay = <1>;
+            qcom,qaif-aif-slot-width-rx = <32>;
+            qcom,qaif-aif-slot-width-tx = <32>;
+            qcom,qaif-aif-slot-en-rx-mask = <0x3>;
+            qcom,qaif-aif-slot-en-tx-mask = <0x3>;
+            qcom,qaif-aif-ctrl-data-oe;
+            qcom,qaif-aif-lane-config = <QAIF_AIF_LANE_ENABLE QAIF_AIF_LANE_DIR_RX>,
+                                        <QAIF_AIF_LANE_ENABLE QAIF_AIF_LANE_DIR_TX>;
+            qcom,qaif-aif-bits-per-lane = <2>;
+        };
+    };
diff --git a/include/dt-bindings/sound/qcom,qaif.h b/include/dt-bindings/sound/qcom,qaif.h
new file mode 100644
index 000000000000..0000b2f30379
--- /dev/null
+++ b/include/dt-bindings/sound/qcom,qaif.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DAI IDs for the Qualcomm Audio Interface (QAIF) controller.
+ * These values are used in devicetree sound-dai references and as
+ * the reg value of aif-interface child nodes.
+ */
+#ifndef __DT_QCOM_QAIF_H
+#define __DT_QCOM_QAIF_H
+
+/* qcom,qaif-aif-sync-mode values */
+#define QAIF_AIF_SYNC_MODE_SHORT	0	/* FRAME SYNC high for 1 INTF clock cycle */
+#define QAIF_AIF_SYNC_MODE_ONE_SLOT	1	/* FRAME SYNC high for 1 slot per frame */
+#define QAIF_AIF_SYNC_MODE_LONG		2	/* FRAME SYNC high for half the frame */
+
+/* qcom,qaif-aif-lane-config enable values */
+#define QAIF_AIF_LANE_DISABLE		0
+#define QAIF_AIF_LANE_ENABLE		1
+
+/* qcom,qaif-aif-lane-config direction values */
+#define QAIF_AIF_LANE_DIR_TX		0	/* TX (playback, speaker) */
+#define QAIF_AIF_LANE_DIR_RX		1	/* RX (capture, mic) */
+
+/*
+ * AIF (Unified Audio Interface) DAI IDs -- AIF0 through AIF12.
+ * Each AIF supports PCM, TDM and MI2S serial protocols over up to
+ * 8 independent data lanes sharing a single bit clock and frame sync.
+ */
+#define QAIF_MI2S_TDM_AIF0	0
+#define QAIF_MI2S_TDM_AIF1	1
+#define QAIF_MI2S_TDM_AIF2	2
+#define QAIF_MI2S_TDM_AIF3	3
+#define QAIF_MI2S_TDM_AIF4	4
+#define QAIF_MI2S_TDM_AIF5	5
+#define QAIF_MI2S_TDM_AIF6	6
+#define QAIF_MI2S_TDM_AIF7	7
+#define QAIF_MI2S_TDM_AIF8	8
+#define QAIF_MI2S_TDM_AIF9	9
+#define QAIF_MI2S_TDM_AIF10	10
+#define QAIF_MI2S_TDM_AIF11	11
+#define QAIF_MI2S_TDM_AIF12	12
+
+/*
+ * CIF (Codec Interface) RX DAI IDs -- playback to internal codec.
+ * RDDMA channels fetch audio from memory and drain it to the codec.
+ */
+#define QAIF_CDC_DMA_RX0	13
+#define QAIF_CDC_DMA_RX1	14
+#define QAIF_CDC_DMA_RX2	15
+#define QAIF_CDC_DMA_RX3	16
+#define QAIF_CDC_DMA_RX4	17
+#define QAIF_CDC_DMA_RX5	18
+#define QAIF_CDC_DMA_RX6	19
+#define QAIF_CDC_DMA_RX7	20
+#define QAIF_CDC_DMA_RX8	21
+#define QAIF_CDC_DMA_RX9	22
+
+/*
+ * CIF (Codec Interface) TX DAI IDs -- capture from internal codec.
+ * WRDMA channels collect audio from the codec and write it to memory.
+ */
+#define QAIF_CDC_DMA_TX0	23
+#define QAIF_CDC_DMA_TX1	24
+#define QAIF_CDC_DMA_TX2	25
+#define QAIF_CDC_DMA_TX3	26
+#define QAIF_CDC_DMA_TX4	27
+#define QAIF_CDC_DMA_TX5	28
+#define QAIF_CDC_DMA_TX6	29
+#define QAIF_CDC_DMA_TX7	30
+#define QAIF_CDC_DMA_TX8	31
+#define QAIF_CDC_DMA_TX9	32
+
+/*
+ * CIF (Codec Interface) VA TX DAI IDs -- capture from voice activity codec.
+ * WRDMA channels collect audio from the VA codec and write it to memory.
+ */
+#define QAIF_CDC_DMA_VA_TX0	33
+#define QAIF_CDC_DMA_VA_TX1	34
+#define QAIF_CDC_DMA_VA_TX2	35
+#define QAIF_CDC_DMA_VA_TX3	36
+#define QAIF_CDC_DMA_VA_TX4	37
+#define QAIF_CDC_DMA_VA_TX5	38
+#define QAIF_CDC_DMA_VA_TX6	39
+#define QAIF_CDC_DMA_VA_TX7	40
+#define QAIF_CDC_DMA_VA_TX8	41
+#define QAIF_CDC_DMA_VA_TX9	42
+
+#endif /* __DT_QCOM_QAIF_H */
-- 
2.34.1


