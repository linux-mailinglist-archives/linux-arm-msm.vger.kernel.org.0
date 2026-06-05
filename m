Return-Path: <linux-arm-msm+bounces-111370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +0s7LMarImqKbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:58:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C28E6478ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:58:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kgkDNREx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111370-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111370-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12BDB30207E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997F14963C6;
	Fri,  5 Jun 2026 10:37:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B776D4183CD;
	Fri,  5 Jun 2026 10:37:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655877; cv=none; b=c8lPHVA+jK0ZgTsDyNHlPGpBtxu1tS/0NyWzFIq1s0GCTkrh0Y4H5MZoyWtM1j7fbhG9TUYee/MjLaW7tylrGdFExzUdSh2jF8MwzzksYMpqBeB8tOnrfWDSEr9HVALa88xTd3MrFWYN4vuzO6zi5kfq5jX265NIfDBDoI6gOG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655877; c=relaxed/simple;
	bh=zuk8XiQNs/JAyL1uFTnxn+zjPUc0+Kg3ZQeCk8+o4vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YR+VbIlwJ213AYFZqXm1MjJLG6K8LG6YSBZpfhVGfu1hV1LqNYLSkS/voJ8oHwpyJ7MviXCJUMZxcMlVD6fzwWmBfEyLb6YaYZ5E/phjAe8/jh0A2hRnn1gjS5lhYjPMQTc9KVyqjSe0wgni14vt7WvzweSkErUiW0InlKXTja0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgkDNREx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6556Oawe3112461;
	Fri, 5 Jun 2026 10:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgzmhYHrpG0Ff/CL+iSKnmwN0NIEacRz4ArN4DDbdOs=; b=kgkDNREx46XTKlj6
	g1SxXDfzBww7r+EMzEPInzbt+cnOnjJICml6n3DlyWqMtLqK+0avNvMYDGS2CQvn
	1cc46DaeAAOvcdleIBUWf+W5+qf4bEYBX8HYkM90Z7W6v12Ieyoeq1oa0wZ6/1pK
	VqlmlQNUQxFjKqS+cb4Ol42kxzsOxbaYrlpqiZDnx2FDysmPJ01chV9UVoZbNDcN
	YMlExU86Q2Zv7BAdgpKvWuLrBMRws3dODpvaPb5+3HNWj3gK/hioRC9HyDumc7ro
	hxWyF6jCkXeRZSpIAQksOypX6xXxx0giiXNDi4GKpMWqqAkTZGxHmZVaWJsBsw73
	sEainA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekfv732yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 10:37:52 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 655Abk6n011714;
	Fri, 5 Jun 2026 10:37:49 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
Date: Fri,  5 Jun 2026 16:07:28 +0530
Message-Id: <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-GUID: DXrFP0_MecdF69zEtYd5ECu5HvHTBAsm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEwMyBTYWx0ZWRfX62PK47UggQK0
 lkTwntA5sAIAahrySXlHRjHxccWawLhxNRzwPJ2UrxBZvKQZVEI3ZVhjBWfM1VLZy+zWQlbseAn
 BWETxjS39j0mqq+hI1L0JK5HzVcrIQvtFHs5vYAYu23dK2ERJKjRPkWXdqSnoqDH7MsqHZklvtq
 xoB9/EYgTs5MdBL77s7jfSf2D0ArOMRYkIMk1+Sx3kITn7B23gX43rR9DsiEuYsdzobdOdkPQtG
 3IAHGzmqQ9beMvOFvebIdmzBxuDFaoH54bGulukCYW+irC5mgEF0nePagD+gPNGZ7kCbcft+RsQ
 uRMdzeAJ/JlClsBO+RR2uSDTcPqraoiJJhtTXq3EuOOgyfgmy6iN1b2MUyZG9XraefeFxVMzMp4
 1bEsaSlykmkjxdMjZ30fkOTZBte6oJPOJ12pm1dFhT7V7MK8eGa5bbHQrJQ6bbZqkpojZSweCAk
 9T5GBTq1d/oqNNQ96hA==
X-Authority-Analysis: v=2.4 cv=JNULdcKb c=1 sm=1 tr=0 ts=6a22a700 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2W7YXHVdVEJxzfH0i0IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: DXrFP0_MecdF69zEtYd5ECu5HvHTBAsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111370-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C28E6478ED

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

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,qaif.yaml  | 353 ++++++++++++++++++
 1 file changed, 353 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif.yaml b/Documentation/devicetree/bindings/sound/qcom,qaif.yaml
new file mode 100644
index 000000000000..5b385e05a650
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,qaif.yaml
@@ -0,0 +1,361 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,qaif.yaml#
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
+      - qcom,shikra-qaif-cpu
+
+  reg:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  clocks:
+    minItems: 15
+    maxItems: 15
+
+  clock-names:
+    items:
+      - const: lpass_config_clk
+      - const: lpass_core_axim_clk
+      - const: aud_dma_clk
+      - const: aud_dma_mem_clk
+      - const: bus_clk
+      - const: aif_if0_ebit_clk
+      - const: aif_if0_ibit_clk
+      - const: aif_if1_ebit_clk
+      - const: aif_if1_ibit_clk
+      - const: aif_if2_ebit_clk
+      - const: aif_if2_ibit_clk
+      - const: aif_if3_ebit_clk
+      - const: aif_if3_ibit_clk
+      - const: ext_mclka_clk
+      - const: ext_mclkb_clk
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
+  status: true
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
+        description:
+          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pulse)
+          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
+      qcom,qaif-aif-sync-src:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mode
+          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
+      qcom,qaif-aif-invert-sync:
+        type: boolean
+        description: Invert the frame sync polarity.
+      qcom,qaif-aif-sync-delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Number of bit-clock cycles to delay the data relative to sync.
+      qcom,qaif-aif-slot-width-rx:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          RX slot width in bits. This is a board-specific hardware constraint
+          determined by the wiring of the serial audio interface.
+      qcom,qaif-aif-slot-width-tx:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          TX slot width in bits. This is a board-specific hardware constraint
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
+        description: Enable loopback mode (presence enables loopback).
+      qcom,qaif-aif-ctrl-data-oe:
+        type: boolean
+        description: Enable output drive on the control/data line.
+      qcom,qaif-aif-lane-config:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description:
+          Lane configuration matrix. Each row is a pair <enable direction>
+          for one lane starting from lane 0, up to 8 lanes. Use
+          QAIF_AIF_LANE_ENABLE (1) or QAIF_AIF_LANE_DISABLE (0) for enable.
+          Use QAIF_AIF_LANE_DIR_TX (0) for TX (speaker) or QAIF_AIF_LANE_DIR_RX
+          (1) for RX (mic). TX and RX lanes should each be grouped contiguously.
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
+          Number of slots per lane. The frame length is computed as
+          slot-width multiplied by bits-per-lane.
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
+    /* Shikra platform example */
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
+                 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_EBIT_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_EBIT_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_EBIT_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_EBIT_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK>,
+                 <&audiocorecc AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK>;
+        clock-names = "lpass_config_clk",
+                      "lpass_core_axim_clk",
+                      "aud_dma_clk",
+                      "aud_dma_mem_clk",
+                      "bus_clk",
+                      "aif_if0_ebit_clk",
+                      "aif_if0_ibit_clk",
+                      "aif_if1_ebit_clk",
+                      "aif_if1_ibit_clk",
+                      "aif_if2_ebit_clk",
+                      "aif_if2_ibit_clk",
+                      "aif_if3_ebit_clk",
+                      "aif_if3_ibit_clk",
+                      "ext_mclka_clk",
+                      "ext_mclkb_clk";
+        #sound-dai-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
+        status = "okay";
+
+        qaif_aif_if2: aif-interface@2 {
+            compatible = "qcom,qaif-tdm-dai";
+            reg = <QAIF_MI2S_TDM_AIF2>;
+            qcom,qaif-aif-sync-mode = <QAIF_AIF_SYNC_MODE_LONG>;
+            qcom,qaif-aif-sync-src = <QAIF_AIF_SYNC_SRC_MASTER>;
+            qcom,qaif-aif-sync-delay = <1>;
+            qcom,qaif-aif-slot-width-rx = <32>;
+            qcom,qaif-aif-slot-width-tx = <32>;
+            qcom,qaif-aif-slot-en-rx-mask = <0x3>;
+            qcom,qaif-aif-slot-en-tx-mask = <0x3>;
+            qcom,qaif-aif-ctrl-data-oe;
+            /* Lane 0: RX (mic); Lane 1: TX (speaker) */
+            qcom,qaif-aif-lane-config = <QAIF_AIF_LANE_ENABLE QAIF_AIF_LANE_DIR_RX>,
+                                        <QAIF_AIF_LANE_ENABLE QAIF_AIF_LANE_DIR_TX>;
+            /* frame length = slot-width (32) * bits-per-lane (2) = 64 bits */
+            qcom,qaif-aif-bits-per-lane = <2>;
+        };
+    };
-- 
2.34.1


