Return-Path: <linux-arm-msm+bounces-113463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IYbIMj6rMWrEowUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:59:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A86950C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 21:59:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FeOPhN4v;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113463-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113463-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3561A3194166
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 19:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9736537CD31;
	Tue, 16 Jun 2026 19:59:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D322FE56E;
	Tue, 16 Jun 2026 19:59:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781639996; cv=none; b=flDjLOPnPvGoITNwWgRCdDgFqZCKcuDziNvAjHx4qGlDoGGztHGKkxcMgQgxN5fGEtnk2KsBobK/l41B/H4i7Akpr9oPukpPjbBZ5pPtj+SMPqwbHhgA41/VF3FrDgtJPWLBAvQkuD6ZBt+yhIcgJzu5EPXSMebXiba12MGVYgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781639996; c=relaxed/simple;
	bh=7JfASsL9ynDCdjp/SvmR3k+bBmDLHXJTab4TFPKT2Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rpiqjM7jzFqDq8xil/uUHq2RhVwCBbIg3Iwave97ZkAE1xvxl1rDd1ywOgtufBOdhMPyad7ZZy9zx2/jXDQU7wRypWbbeJpCGILIMsEtJkx+J6knLwCF0htcWJeOTABp4FjLt1SgEpem+Xsy3x3nRJ8aX8XB2MRu/3Ex0pCiRB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FeOPhN4v; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E76B1F000E9;
	Tue, 16 Jun 2026 19:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781639994;
	bh=YkytCcXVpVljTLZR4r4Eirx8I+F1kRglESAzNJxmvzg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FeOPhN4vQUmc0oSLNy2mvjtcaanoSl3onSO9B/pXAtjwxTYu6HK4YLVWOS1+O5Meb
	 Tt+i1e3jv+jcczBRlELV78CKppYcEMk5oIk78SpTBKg/j/ABl1GqxXFNFgWLuvvOGv
	 C7uFjc0eVLgSNL5TkodzmNUcJqVQMmAUJKN6XfWg9/sHcIqrz3y0bJaSP8iwBq6kJS
	 pjQbujx3JqZEBS+ZE5N9R0Eqw826OyfwDLys1SkFYYsYfxNV2gBvpEd6rvvqw77vhw
	 fUJwqh3GWTDXs3EXAf5M79nUgtlm6vl5US7zwOeTamE3w+6Imjix0/9nG8SEiUTj+l
	 oR5hJkgY4mxWA==
Message-ID: <69d2e4a7-eb2e-42f2-83e4-0d8ca4b62da8@kernel.org>
Date: Tue, 16 Jun 2026 20:59:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113463-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,devicetree.org:url,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 634A86950C4



On 6/5/26 11:37 AM, Harendra Gautam wrote:
> Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform.
> 
> QAIF moves PCM data between system memory and external serial audio
> interfaces through the AIF path, and between memory and the internal Bolero
> digital codec through the CIF path. The controller needs a binding so
> platform Devicetree files can describe its MMIO region, DMA IOMMU stream,
> clocks, interrupt, DAI cells and per-interface AIF configuration.
> 
> Describe the single register region, one EE interrupt, the required GCC
> LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@N'
> child nodes used for static PCM, TDM or MI2S configuration.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,qaif.yaml  | 353 ++++++++++++++++++
>  1 file changed, 353 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif.yaml b/Documentation/devicetree/bindings/sound/qcom,qaif.yaml

Pl run dt-bindings checks before posting.
> new file mode 100644
> index 000000000000..5b385e05a650
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,qaif.yaml
> @@ -0,0 +1,361 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,qaif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Audio Interface (QAIF) CPU DAI Controller
> +
> +maintainers:
> +  - Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> +
> +description:
> +  |
> +  The Qualcomm Audio Interface (QAIF) is a fully configurable DMA-based
> +  audio subsystem controller. It serialises and deserialises PCM audio
> +  between system memory and external serial audio peripherals (PCM, TDM,
> +  I2S, MI2S) through the AIF path, and transfers parallel audio between
> +  memory and an internal WCD codec through the CIF path.
> +
> +  AIF (Audio Interface): up to 13 multi-lane Unified Audio Interfaces,
> +  each supporting up to 8 independent data lanes. Each lane is individually
> +  configurable as TX (output/speaker) or RX (input/mic). All lanes of an
> +  interface share a single bit clock and frame sync. Supported modes are
> +  PCM (short/long sync), TDM, and MI2S (stereo/mono). Per-interface
> +  configuration includes sync source (master/slave), sync mode, sync delay,
> +  sync inversion, slot width (8/16/24/32-bit), sample width, active slot
> +  masks (up to 32 slots), bits-per-lane frame size, lane enable/direction
> +  masks, loopback, output-enable control, and full-cycle path support for
> +  long chip-to-chip connections.
> +
> +  CIF (Codec Interface): up to 32 RDDMA (playback) and 32 WRDMA (capture)
> +  channels connecting to an internal codec over a parallel bus. Each channel
> +  supports active-channel enable mask (up to 16 channels), frame-sync
> +  selection, frame-sync delay, frame-sync output gating, dynamic clock
> +  gating, and 16-bit packing/unpacking.
> +
> +  Note on RX/TX naming convention: in QAIF, RX refers to the capture path
> +  (audio received from the interface into memory) and TX refers to the
> +  playback path (audio transmitted from memory to the interface). This
> +  applies to both AIF lane directions and CIF slot/mask properties.
> +
> +  DMA engine: RDDMA fetches audio from DDR/TCM/LPM into a shared SRAM
> +  latency buffer (SHRAM) and drains it to the interface. WRDMA collects
> +  data from the interface into SHRAM and writes it to memory. Each DMA
> +  owns a private SHRAM region defined by start address and length registers.
> +  Burst sizes of 1/2/4/8/16 beats (64-bit) are supported with up to 4
> +  outstanding transactions per DMA. Two QSB master ports (QXM0 for TCM,
> +  QXM1 for DDR/LPM) provide the memory interface.
> +
> +  Resources are partitioned among up to 5 Execution Engines (EEs) via
> +  EE map registers. Each EE owns a set of DMAs, audio interfaces, and
> +  interface groups, and receives its own independent interrupt output.
> +  The interrupt hierarchy has a two-level structure: a summary register
> +  identifies the event class (DMA period, underflow/overflow, error
> +  response, audio interface underflow/overflow, group done, rate detector,
> +  VFR), and per-resource status registers identify the specific channel.
> +
> +  Interface grouping (bonding) allows up to 6 groups of audio and codec
> +  interfaces to start synchronously and align their DMA period interrupts
> +  within half a frame duration using the RDDMA padding feature.
> +
> +  Two rate detector blocks measure the frequency of incoming frame sync or
> +  word select signals and generate interrupts on rate change, undetected
> +  rate, or sync timeout.
> +
> +  Block diagram::
> +
> +    System Memory (DDR / LPM / TCM)
> +    +---------------------------------+
> +    |  Circular Buffers (ping-pong)   |
> +    +----------+----------+-----------+
> +               |          ^
> +         64-bit AXI  64-bit AXI
> +               |          |
> +    +----------v----------+-----------+
> +    |        QSB Master Ports         |
> +    |  +----------+  +----------+     |
> +    |  |   QXM0   |  |   QXM1   |     |
> +    |  +----+-----+  +-----+----+     |
> +    +-------|--------------|----------+
> +            |              |
> +    +-------v--------------v----------+
> +    |         Shared RAM (SHRAM)       |
> +    |  +------------+  +------------+ |
> +    |  | QXM0 Read  |  | QXM0 Write | |
> +    |  | SHRAM      |  | SHRAM      | |
> +    |  +------------+  +------------+ |
> +    |  +------------+  +------------+ |
> +    |  | QXM1 Read  |  | QXM1 Write | |
> +    |  | SHRAM      |  | SHRAM      | |
> +    |  +------------+  +------------+ |
> +    +---+--------+--------+-------+---+
> +        |        |        |       |
> +    +---v--+  +--v---+ +--v---+ +-v----+
> +    |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
> +    | AIF  |  | CIF  | | AIF  | | CIF  |
> +    |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
> +    +--+---+  +--+---+ +--+---+ +-+----+
> +       |         |       ^          ^
> +       | TX      | TX    | RX       | RX
> +       v         v       |          |
> +    +--+--------------------+  +----+----------+
> +    |  Unified Audio Intf   |  | Codec DMA     |
> +    |  (AIF 0..12)          |  | Interface     |
> +    |                       |  | (CIF)         |
> +    |  AUD_INTFa block:     |  |               |
> +    |  - Serializer (TX)    |  | RDDMA: DDR -> |
> +    |  - De-serializer (RX) |  |   internal    |
> +    |  - Sync gen/detect    |  |   codec       |
> +    |  - Up to 8 data lanes |  | WRDMA: codec  |
> +    |  - PCM / TDM / MI2S   |  |   -> DDR      |
> +    |  - Near Pad Logic     |  | Up to 16 ch   |
> +    +--+--------------------+  +----+----------+
> +       |  Lane 0..7 (TX/RX)       |  Parallel bus
> +       |  Bit clk + Frame sync    |  + Frame sync
> +       v                          v
> +    +--+--------+          +------+------+
> +    | External  |          | Internal    |
> +    | Serial    |          | Digital     |
> +    | Peripherals|         | Codec       |
> +    | (PCM/TDM/ |          | (Bolero/    |
> +    |  MI2S)    |          |  WCD)       |
> +    +-----------+          +-------------+
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,shikra-qaif-cpu
> +
> +  reg:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 15
> +    maxItems: 15
> +
> +  clock-names:
> +    items:
> +      - const: lpass_config_clk
> +      - const: lpass_core_axim_clk
> +      - const: aud_dma_clk
> +      - const: aud_dma_mem_clk
> +      - const: bus_clk
> +      - const: aif_if0_ebit_clk
> +      - const: aif_if0_ibit_clk
> +      - const: aif_if1_ebit_clk
> +      - const: aif_if1_ibit_clk
> +      - const: aif_if2_ebit_clk
> +      - const: aif_if2_ibit_clk
> +      - const: aif_if3_ebit_clk
> +      - const: aif_if3_ibit_clk
> +      - const: ext_mclka_clk
> +      - const: ext_mclkb_clk


Also do we really need to specify these 15 clocks even though I use only
one aif interface on my board.

should some of these clocks belong to each aif child node instead of
global qaif-cpu?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  status: true
> +
> +patternProperties:
> +  "^aif-interface@[0-9a-f]+$":
> +    type: object
> +    description:
> +      AIF interface configuration child node. The compatible string
> +      identifies the serial protocol the interface is wired for on the
> +      board. The unit address matches the hardware AIF interface index.
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,qaif-pcm-dai
> +          - qcom,qaif-tdm-dai
> +          - qcom,qaif-mi2s-dai
> +      reg:
> +        maxItems: 1
> +        description: |
> +          Hardware AIF interface index (AUD_INTFa block index). This value
> +          also serves as the ALSA DAI ID; it corresponds directly to the
> +          QAIF_MI2S_TDM_AIFn constants in <dt-bindings/sound/qcom,qaif.h>
> +          (e.g. reg = <2> selects QAIF_MI2S_TDM_AIF2).
> +      qcom,qaif-aif-sync-mode:
> +        $ref: /schemas/types.yaml#/definitions/uint32

These should be enum instead of uint32, simillar comments apply to some
of the properties that have only few supported values.

> +        description:
> +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pulse)
> +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
> +      qcom,qaif-aif-sync-src:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mode
> +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
> +      qcom,qaif-aif-invert-sync:
> +        type: boolean
> +        description: Invert the frame sync polarity.
> +      qcom,qaif-aif-sync-delay:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Number of bit-clock cycles to delay the data relative to sync.

This looks redundant to qcom,qaif-aif-sync-mode, which already indicates
the delay information?

> +      qcom,qaif-aif-slot-width-rx:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          RX slot width in bits. This is a board-specific hardware constraint
> +          determined by the wiring of the serial audio interface.
> +      qcom,qaif-aif-slot-width-tx:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          TX slot width in bits. This is a board-specific hardware constraint
> +          determined by the wiring of the serial audio interface.
> +      qcom,qaif-aif-slot-en-rx-mask:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Bitmask of active RX slots. Board-specific — determined by which
> +          TDM slots the codec is wired to on this board.
> +      qcom,qaif-aif-slot-en-tx-mask:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Bitmask of active TX slots. Board-specific — determined by which
> +          TDM slots the codec is wired to on this board.
> +      qcom,qaif-aif-loopback:
> +        type: boolean
> +        description: Enable loopback mode (presence enables loopback).

What is this mode used for, testing ?

> +      qcom,qaif-aif-ctrl-data-oe:
> +        type: boolean
> +        description: Enable output drive on the control/data line.

will this be ever false?

> +      qcom,qaif-aif-lane-config:
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        description:
> +          Lane configuration matrix. Each row is a pair <enable direction>
> +          for one lane starting from lane 0, up to 8 lanes. Use
> +          QAIF_AIF_LANE_ENABLE (1) or QAIF_AIF_LANE_DISABLE (0) for enable.
> +          Use QAIF_AIF_LANE_DIR_TX (0) for TX (speaker) or QAIF_AIF_LANE_DIR_RX
> +          (1) for RX (mic). TX and RX lanes should each be grouped contiguously.
what do  you mean ? can you elobrate how can you enforce this?

> +        maxItems: 8
> +        items:
> +          items:
> +            - description: Lane enable (0 = disabled, 1 = enabled)
> +              enum: [0, 1]
> +            - description: Lane direction (0 = TX/speaker, 1 = RX/mic)
> +              enum: [0, 1]
> +      qcom,qaif-aif-full-cycle-en:
> +        type: boolean
> +        description: Enable full-cycle sync (effective in sync master mode).
> +      qcom,qaif-aif-bits-per-lane:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Number of slots per lane. The frame length is computed as

bits per lane?

> +          slot-width multiplied by bits-per-lane.
> +    if:
> +      properties:
> +        compatible:
> +          const: qcom,qaif-mi2s-dai
> +    then:
> +      description:
> +        MI2S interface. Sync mode and slot-enable masks are fixed by the
> +        MI2S protocol and must not be set in DT. Mono/stereo mode is
> +        determined at runtime from the stream channel count.
> +      properties:
> +        qcom,qaif-aif-sync-mode: false
> +        qcom,qaif-aif-slot-en-rx-mask: false
> +        qcom,qaif-aif-slot-en-tx-mask: false
> +    else:
> +      description:
> +        PCM or TDM interface. Sync mode and slot-enable masks are
> +        board-specific and must be provided. Mono mode does not apply.
> +      required:
> +        - qcom,qaif-aif-sync-mode
> +        - qcom,qaif-aif-slot-en-rx-mask
> +        - qcom,qaif-aif-slot-en-tx-mask
> +
> +    required:
> +      - compatible
> +      - reg
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - iommus
do we
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - '#sound-dai-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* Shikra platform example */
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/sound/qcom,qaif.h>
> +    #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
> +    #include <dt-bindings/clock/qcom,gcc-shikra.h>
> +
> +    qaif_cpu: audio@a000000 {
> +        compatible = "qcom,shikra-qaif-cpu";
> +        reg = <0x0 0x0a000000 0x0 0x20000>;
> +        iommus = <&apps_smmu 0x1c0 0x0>;
> +        clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
> +                 <&gcc GCC_LPASS_CORE_AXIM_CLK>,
> +                 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_CLK>,
> +                 <&audiocorecc AUDIO_CORE_CC_AUD_DMA_MEM_CLK>,
> +                 <&audiocorecc AUDIO_CORE_CC_BUS_CLK>,
> +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_EBIT_CLK>,
> +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF0_IBIT_CLK>,
> +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_EBIT_CLK>,
> +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF1_IBIT_CLK>,
> +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_EBIT_CLK>,
> +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF2_IBIT_CLK>,
> +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_EBIT_CLK>,
> +                 <&audiocorecc AUDIO_CORE_CC_AIF_IF3_IBIT_CLK>,
> +                 <&audiocorecc AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK>,
> +                 <&audiocorecc AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK>;
> +        clock-names = "lpass_config_clk",
> +                      "lpass_core_axim_clk",
> +                      "aud_dma_clk",
> +                      "aud_dma_mem_clk",
> +                      "bus_clk",
> +                      "aif_if0_ebit_clk",
> +                      "aif_if0_ibit_clk",
> +                      "aif_if1_ebit_clk",
> +                      "aif_if1_ibit_clk",
> +                      "aif_if2_ebit_clk",
> +                      "aif_if2_ibit_clk",
> +                      "aif_if3_ebit_clk",
> +                      "aif_if3_ibit_clk",
> +                      "ext_mclka_clk",
> +                      "ext_mclkb_clk";
> +        #sound-dai-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
> +        status = "okay";
> +
> +        qaif_aif_if2: aif-interface@2 {
> +            compatible = "qcom,qaif-tdm-dai";
> +            reg = <QAIF_MI2S_TDM_AIF2>;
> +            qcom,qaif-aif-sync-mode = <QAIF_AIF_SYNC_MODE_LONG>;
> +            qcom,qaif-aif-sync-src = <QAIF_AIF_SYNC_SRC_MASTER>;
> +            qcom,qaif-aif-sync-delay = <1>;
> +            qcom,qaif-aif-slot-width-rx = <32>;
> +            qcom,qaif-aif-slot-width-tx = <32>;
> +            qcom,qaif-aif-slot-en-rx-mask = <0x3>;
> +            qcom,qaif-aif-slot-en-tx-mask = <0x3>;
> +            qcom,qaif-aif-ctrl-data-oe;
> +            /* Lane 0: RX (mic); Lane 1: TX (speaker) */
> +            qcom,qaif-aif-lane-config = <QAIF_AIF_LANE_ENABLE QAIF_AIF_LANE_DIR_RX>,
> +                                        <QAIF_AIF_LANE_ENABLE QAIF_AIF_LANE_DIR_TX>;
> +            /* frame length = slot-width (32) * bits-per-lane (2) = 64 bits */
> +            qcom,qaif-aif-bits-per-lane = <2>;
> +        };
> +    };


