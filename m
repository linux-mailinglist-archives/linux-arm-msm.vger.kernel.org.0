Return-Path: <linux-arm-msm+bounces-28278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 761BD94E562
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 05:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0457B282911
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 03:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAED2146D75;
	Mon, 12 Aug 2024 03:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCfOoReS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B691411C8;
	Mon, 12 Aug 2024 03:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723432060; cv=none; b=gye+VRqecawqH7tS8eYyxYoFw/tU5gDRvbC8ZDrtLz5vy71rQe/Nyd1rZO40ItGYvgG9CIOyqtlctv52gUY36hYiV2Didx1kQb/KQEdfzNX8aJzQJJUM2ch30+jlRLik9jn4ZZ7wsAT1FaUZTQ6gl6k7NP9NBuo3DDNLzfcHjv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723432060; c=relaxed/simple;
	bh=kRzWib2TzBcclEfDo0uuWGlg63aC6VgDtOKPFlG5b0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aeycXPktqlCMeocTtdT2VPrWj5fpTc2f2Ir7zz2tmocGCOS4rR7D+5mPjBW4+wcIhjCGAcfSbc8+ED/FB5ocZUTTkiz/1Ak4nvimJoibpPfw96Jm6B9+PlTCazpukKtMA+b0V99yIKuKQ1tsrsFcb9SBcaC76IlBmJh0F7hMzk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCfOoReS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B94C4AF13;
	Mon, 12 Aug 2024 03:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723432060;
	bh=kRzWib2TzBcclEfDo0uuWGlg63aC6VgDtOKPFlG5b0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WCfOoReS9Oarn09dfeLdnudurs5rP0ODcvEE59RuhfL5n5zXBJHYgbiXR5QLEUpLa
	 TDYlL4IRjty+kojFCYf+GQVhSKqCQFK4oV3zRYdsGiCTOPNCyxknQoa2hb44Egsorf
	 GXiQsZ3rXkexKAgivCcN4V6yOYMK2p9KDEzwnUrcJ/fnQ0dczItpcgjipBgf1LhaCB
	 GKKTu4C/lAal0cZoABBYtAEHpcDvMLFebH/C5l5jeImljq/eLWnHr+14c24iqPkAxm
	 jXStEkdgQoO4E+ChyHaVYxbQQvzlcIrDDPix2TwqQcGwMijk655WyyKlStuUXEPofP
	 MTEGYZUh4YZ6Q==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sun, 11 Aug 2024 20:11:58 -0700
Subject: [PATCH v2 1/7] dt-bindings: usb: snps,dwc3: Split core description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240811-dwc3-refactor-v2-1-91f370d61ad2@quicinc.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
In-Reply-To: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Saravana Kannan <saravanak@google.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=29235;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=BTv4cSvvq4+loN+cwFLtN9IUde0sXrdkXxBGIsSB6is=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmuX2Abl/EOS71rX606RC20QN+95/9ASN4IPk4g
 z9agbV79deJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZrl9gBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWRmhAAyImssYWtABLTMBj18MVp1LVSHO8r2NPiVVcPgkl
 pVwL9PO720lGWKzU4VGAN3DRjILlfqkFLb4wwQglEL/5Tcqas1QOmeE+y6xMsxtZuJfg5838kXc
 1mMbQEGpNYZY8bDEHxQQhXg8fANjWLAsOg0W/E1H2OePfBK1APs9jyTJhRV3X+2wwLQ8nyummDk
 zoe9c9yVSLnEvQCngSMXWAKZn1fXohPlPjSFO20X+gUdF3upSvm1Y30GSNTq0BSBJMWUshctLXu
 sWaxzRGI9tdXsbCdt691jyB3A+P9T1i9me4VVhBDy7fbqfBy//eB//Q/GMLR4bdknctpnniqFp7
 ufeIviurt6Gy37JIGVjBQ5nf68mgGapIU/Ww0YGYuvKXcQGjOOuHzd6kUYDe2umwA08VTjpxjza
 w8qOFQZO1ejaiR7YnmB/MqIkfF8WTGe2vptRAt6Btd2E5apyoDgj0+0elyymqa8SRSLHJaioLOX
 UdeCKRtKI3PHUTPmX0+l9YH06f5/rMFozOe91M9tCgLiYqDllg2wHYF1sm2wQOXbLmFQh+wiwvO
 QZ1hqiPZnZ9Y7bf1PigMHOW3nMU52B3ZS5R535fwgOMUAol0qSdQ4vGJ1QZHkNOGSubZ1qurnT5
 Hj3lr9qEjAxzjL/kZtWMa7YeOZCgCVkbeYQgwb6QHabQ=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The Synopsys DWC3 core is found either as a standard block or integrated
with vendor glue logic. So far the latter has been described as two
separate IP blocks in DeviceTree, but the two parts are not separate.

In the case where the core is integrated together with vendor glue,
resources such as clock and resets are often customized by the vendor,
such that the standard properties doesn't make sense.

Split the snps,dwc3 binding in a description of the core properties and
the standard "glue" properties, in order to allow vendor bindings to
inherit the core properties.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 .../devicetree/bindings/usb/snps,dwc3-common.yaml  | 417 +++++++++++++++++++++
 .../devicetree/bindings/usb/snps,dwc3.yaml         | 391 +------------------
 2 files changed, 418 insertions(+), 390 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
new file mode 100644
index 000000000000..65e7900f904a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -0,0 +1,417 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/snps,dwc3-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare USB3 Controller common properties
+
+select: false
+
+maintainers:
+  - Felipe Balbi <balbi@kernel.org>
+
+description:
+  Defines the properties of the DWC3 core as being embedded in either an
+  vendor-specific implementation or as a standalone component.
+
+allOf:
+  - $ref: usb-drd.yaml#
+  - if:
+      properties:
+        dr_mode:
+          const: peripheral
+
+      required:
+        - dr_mode
+    then:
+      $ref: usb.yaml#
+    else:
+      $ref: usb-xhci.yaml#
+
+properties:
+  extcon:
+    maxItems: 1
+    deprecated: true
+
+  usb-phy:
+    minItems: 1
+    items:
+      - description: USB2/HS PHY
+      - description: USB3/SS PHY
+
+  phys:
+    minItems: 1
+    maxItems: 19
+
+  phy-names:
+    minItems: 1
+    maxItems: 19
+    oneOf:
+      - items:
+          enum: [ usb2-phy, usb3-phy ]
+      - items:
+          pattern: "^usb(2-([0-9]|1[0-4])|3-[0-3])$"
+
+  snps,usb2-lpm-disable:
+    description: Indicate if we don't want to enable USB2 HW LPM for host
+      mode.
+    type: boolean
+
+  snps,usb3_lpm_capable:
+    description: Determines if platform is USB3 LPM capable
+    type: boolean
+
+  snps,usb2-gadget-lpm-disable:
+    description: Indicate if we don't want to enable USB2 HW LPM for gadget
+      mode.
+    type: boolean
+
+  snps,dis-start-transfer-quirk:
+    description:
+      When set, disable isoc START TRANSFER command failure SW work-around
+      for DWC_usb31 version 1.70a-ea06 and prior.
+    type: boolean
+
+  snps,disable_scramble_quirk:
+    description:
+      True when SW should disable data scrambling. Only really useful for FPGA
+      builds.
+    type: boolean
+
+  snps,has-lpm-erratum:
+    description: True when DWC3 was configured with LPM Erratum enabled
+    type: boolean
+
+  snps,lpm-nyet-threshold:
+    description: LPM NYET threshold
+    $ref: /schemas/types.yaml#/definitions/uint8
+
+  snps,u2exit_lfps_quirk:
+    description: Set if we want to enable u2exit lfps quirk
+    type: boolean
+
+  snps,u2ss_inp3_quirk:
+    description: Set if we enable P3 OK for U2/SS Inactive quirk
+    type: boolean
+
+  snps,req_p1p2p3_quirk:
+    description:
+      When set, the core will always request for P1/P2/P3 transition sequence.
+    type: boolean
+
+  snps,del_p1p2p3_quirk:
+    description:
+      When set core will delay P1/P2/P3 until a certain amount of 8B10B errors
+      occur.
+    type: boolean
+
+  snps,del_phy_power_chg_quirk:
+    description: When set core will delay PHY power change from P0 to P1/P2/P3.
+    type: boolean
+
+  snps,lfps_filter_quirk:
+    description: When set core will filter LFPS reception.
+    type: boolean
+
+  snps,rx_detect_poll_quirk:
+    description:
+      when set core will disable a 400us delay to start Polling LFPS after
+      RX.Detect.
+    type: boolean
+
+  snps,tx_de_emphasis_quirk:
+    description: When set core will set Tx de-emphasis value
+    type: boolean
+
+  snps,tx_de_emphasis:
+    description:
+      The value driven to the PHY is controlled by the LTSSM during USB3
+      Compliance mode.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum:
+      - 0 # -6dB de-emphasis
+      - 1 # -3.5dB de-emphasis
+      - 2 # No de-emphasis
+
+  snps,dis_u3_susphy_quirk:
+    description: When set core will disable USB3 suspend phy
+    type: boolean
+
+  snps,dis_u2_susphy_quirk:
+    description: When set core will disable USB2 suspend phy
+    type: boolean
+
+  snps,dis_enblslpm_quirk:
+    description:
+      When set clears the enblslpm in GUSB2PHYCFG, disabling the suspend signal
+      to the PHY.
+    type: boolean
+
+  snps,dis-u1-entry-quirk:
+    description: Set if link entering into U1 needs to be disabled
+    type: boolean
+
+  snps,dis-u2-entry-quirk:
+    description: Set if link entering into U2 needs to be disabled
+    type: boolean
+
+  snps,dis_rxdet_inp3_quirk:
+    description:
+      When set core will disable receiver detection in PHY P3 power state.
+    type: boolean
+
+  snps,dis-u2-freeclk-exists-quirk:
+    description:
+      When set, clear the u2_freeclk_exists in GUSB2PHYCFG, specify that USB2
+      PHY doesn't provide a free-running PHY clock.
+    type: boolean
+
+  snps,dis-del-phy-power-chg-quirk:
+    description:
+      When set core will change PHY power from P0 to P1/P2/P3 without delay.
+    type: boolean
+
+  snps,dis-tx-ipgap-linecheck-quirk:
+    description: When set, disable u2mac linestate check during HS transmit
+    type: boolean
+
+  snps,parkmode-disable-ss-quirk:
+    description:
+      When set, all SuperSpeed bus instances in park mode are disabled.
+    type: boolean
+
+  snps,parkmode-disable-hs-quirk:
+    description:
+      When set, all HighSpeed bus instances in park mode are disabled.
+    type: boolean
+
+  snps,dis_metastability_quirk:
+    description:
+      When set, disable metastability workaround. CAUTION! Use only if you are
+      absolutely sure of it.
+    type: boolean
+
+  snps,dis-split-quirk:
+    description:
+      When set, change the way URBs are handled by the driver. Needed to
+      avoid -EPROTO errors with usbhid on some devices (Hikey 970).
+    type: boolean
+
+  snps,gfladj-refclk-lpm-sel-quirk:
+    description:
+      When set, run the SOF/ITP counter based on ref_clk.
+    type: boolean
+
+  snps,resume-hs-terminations:
+    description:
+      Fix the issue of HS terminations CRC error on resume by enabling this
+      quirk. When set, all the termsel, xcvrsel, opmode becomes 0 during end
+      of resume. This option is to support certain legacy ULPI PHYs.
+    type: boolean
+
+  snps,ulpi-ext-vbus-drv:
+    description:
+      Some ULPI USB PHY does not support internal VBUS supply, and driving
+      the CPEN pin, requires the configuration of the ulpi DRVVBUSEXTERNAL
+      bit. When set, the xhci host will configure the USB2 PHY drives VBUS
+      with an external supply.
+    type: boolean
+
+  snps,is-utmi-l1-suspend:
+    description:
+      True when DWC3 asserts output signal utmi_l1_suspend_n, false when
+      asserts utmi_sleep_n.
+    type: boolean
+
+  snps,hird-threshold:
+    description: HIRD threshold
+    $ref: /schemas/types.yaml#/definitions/uint8
+
+  snps,hsphy_interface:
+    description:
+      High-Speed PHY interface selection between UTMI+ and ULPI when the
+      DWC_USB3_HSPHY_INTERFACE has value 3.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [utmi, ulpi]
+
+  snps,quirk-frame-length-adjustment:
+    description:
+      Value for GFLADJ_30MHZ field of GFLADJ register for post-silicon frame
+      length adjustment when the fladj_30mhz_sdbnd signal is invalid or
+      incorrect.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0x3f
+
+  snps,ref-clock-period-ns:
+    description:
+      Value for REFCLKPER field of GUCTL register for reference clock period in
+      nanoseconds, when the hardware set default does not match the actual
+      clock.
+
+      This binding is deprecated. Instead, provide an appropriate reference clock.
+    minimum: 8
+    maximum: 62
+    deprecated: true
+
+  snps,rx-thr-num-pkt:
+    description:
+      USB RX packet threshold count. In host mode, this field specifies
+      the space that must be available in the RX FIFO before the core can
+      start the corresponding USB RX transaction (burst).
+      In device mode, this field specifies the space that must be
+      available in the RX FIFO before the core can send ERDY for a
+      flow-controlled endpoint. It is only used for SuperSpeed.
+      The valid values for this field are from 1 to 15. (DWC3 SuperSpeed
+      USB 3.0 Controller Databook)
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 15
+
+  snps,rx-max-burst:
+    description:
+      Max USB RX burst size. In host mode, this field specifies the
+      Maximum Bulk IN burst the DWC_usb3 core can perform. When the system
+      bus is slower than the USB, RX FIFO can overrun during a long burst.
+      You can program a smaller value to this field to limit the RX burst
+      size that the core can perform. It only applies to SS Bulk,
+      Isochronous, and Interrupt IN endpoints in the host mode.
+      In device mode, this field specifies the NUMP value that is sent in
+      ERDY for an OUT endpoint.
+      The valid values for this field are from 1 to 16. (DWC3 SuperSpeed
+      USB 3.0 Controller Databook)
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 16
+
+  snps,tx-thr-num-pkt:
+    description:
+      USB TX packet threshold count. This field specifies the number of
+      packets that must be in the TXFIFO before the core can start
+      transmission for the corresponding USB transaction (burst).
+      This count is valid in both host and device modes. It is only used
+      for SuperSpeed operation.
+      Valid values are from 1 to 15. (DWC3 SuperSpeed USB 3.0 Controller
+      Databook)
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 15
+
+  snps,tx-max-burst:
+    description:
+      Max USB TX burst size. When the system bus is slower than the USB,
+      TX FIFO can underrun during a long burst. Program a smaller value
+      to this field to limit the TX burst size that the core can execute.
+      In Host mode, it only applies to SS Bulk, Isochronous, and Interrupt
+      OUT endpoints. This value is not used in device mode.
+      Valid values are from 1 to 16. (DWC3 SuperSpeed USB 3.0 Controller
+      Databook)
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 16
+
+  snps,rx-thr-num-pkt-prd:
+    description:
+      Periodic ESS RX packet threshold count (host mode only). Set this and
+      snps,rx-max-burst-prd to a valid, non-zero value 1-16 (DWC_usb31
+      programming guide section 1.2.4) to enable periodic ESS RX threshold.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 16
+
+  snps,rx-max-burst-prd:
+    description:
+      Max periodic ESS RX burst size (host mode only). Set this and
+      snps,rx-thr-num-pkt-prd to a valid, non-zero value 1-16 (DWC_usb31
+      programming guide section 1.2.4) to enable periodic ESS RX threshold.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 16
+
+  snps,tx-thr-num-pkt-prd:
+    description:
+      Periodic ESS TX packet threshold count (host mode only). Set this and
+      snps,tx-max-burst-prd to a valid, non-zero value 1-16 (DWC_usb31
+      programming guide section 1.2.3) to enable periodic ESS TX threshold.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 16
+
+  snps,tx-max-burst-prd:
+    description:
+      Max periodic ESS TX burst size (host mode only). Set this and
+      snps,tx-thr-num-pkt-prd to a valid, non-zero value 1-16 (DWC_usb31
+      programming guide section 1.2.3) to enable periodic ESS TX threshold.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 16
+
+  tx-fifo-resize:
+    description: Determines if the TX fifos can be dynamically resized depending
+      on the number of IN endpoints used and if bursting is supported.  This
+      may help improve bandwidth on platforms with higher system latencies, as
+      increased fifo space allows for the controller to prefetch data into its
+      internal memory.
+    type: boolean
+
+  tx-fifo-max-num:
+    description: Specifies the max number of packets the txfifo resizing logic
+      can account for when higher endpoint bursting is used. (bMaxBurst > 6) The
+      higher the number, the more fifo space the txfifo resizing logic will
+      allocate for that endpoint.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 3
+
+  snps,incr-burst-type-adjustment:
+    description:
+      Value for INCR burst type of GSBUSCFG0 register, undefined length INCR
+      burst type enable and INCRx type. A single value means INCRX burst mode
+      enabled. If more than one value specified, undefined length INCR burst
+      type will be enabled with burst lengths utilized up to the maximum
+      of the values passed in this property.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 8
+    uniqueItems: true
+    items:
+      enum: [1, 4, 8, 16, 32, 64, 128, 256]
+
+  num-hc-interrupters:
+    maximum: 8
+    default: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      This port is used with the 'usb-role-switch' property  to connect the
+      dwc3 to type C connector.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Those ports should be used with any connector to the data bus of this
+      controller using the OF graph bindings specified if the "usb-role-switch"
+      property is used.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus.
+
+  wakeup-source:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Enable USB remote wakeup.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+...
+
diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 1cd0ca90127d..4380bb6fa2f0 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -15,18 +15,7 @@ description:
   compatible string.
 
 allOf:
-  - $ref: usb-drd.yaml#
-  - if:
-      properties:
-        dr_mode:
-          const: peripheral
-
-      required:
-        - dr_mode
-    then:
-      $ref: usb.yaml#
-    else:
-      $ref: usb-xhci.yaml#
+  - $ref: snps,dwc3-common.yaml#
 
 properties:
   compatible:
@@ -70,32 +59,9 @@ properties:
 
   dma-coherent: true
 
-  extcon:
-    maxItems: 1
-    deprecated: true
-
   iommus:
     maxItems: 1
 
-  usb-phy:
-    minItems: 1
-    items:
-      - description: USB2/HS PHY
-      - description: USB3/SS PHY
-
-  phys:
-    minItems: 1
-    maxItems: 19
-
-  phy-names:
-    minItems: 1
-    maxItems: 19
-    oneOf:
-      - items:
-          enum: [ usb2-phy, usb3-phy ]
-      - items:
-          pattern: "^usb(2-([0-9]|1[0-4])|3-[0-3])$"
-
   power-domains:
     description:
       The DWC3 has 2 power-domains. The power management unit (PMU) and
@@ -109,361 +75,6 @@ properties:
   resets:
     minItems: 1
 
-  snps,usb2-lpm-disable:
-    description: Indicate if we don't want to enable USB2 HW LPM for host
-      mode.
-    type: boolean
-
-  snps,usb3_lpm_capable:
-    description: Determines if platform is USB3 LPM capable
-    type: boolean
-
-  snps,usb2-gadget-lpm-disable:
-    description: Indicate if we don't want to enable USB2 HW LPM for gadget
-      mode.
-    type: boolean
-
-  snps,dis-start-transfer-quirk:
-    description:
-      When set, disable isoc START TRANSFER command failure SW work-around
-      for DWC_usb31 version 1.70a-ea06 and prior.
-    type: boolean
-
-  snps,disable_scramble_quirk:
-    description:
-      True when SW should disable data scrambling. Only really useful for FPGA
-      builds.
-    type: boolean
-
-  snps,has-lpm-erratum:
-    description: True when DWC3 was configured with LPM Erratum enabled
-    type: boolean
-
-  snps,lpm-nyet-threshold:
-    description: LPM NYET threshold
-    $ref: /schemas/types.yaml#/definitions/uint8
-
-  snps,u2exit_lfps_quirk:
-    description: Set if we want to enable u2exit lfps quirk
-    type: boolean
-
-  snps,u2ss_inp3_quirk:
-    description: Set if we enable P3 OK for U2/SS Inactive quirk
-    type: boolean
-
-  snps,req_p1p2p3_quirk:
-    description:
-      When set, the core will always request for P1/P2/P3 transition sequence.
-    type: boolean
-
-  snps,del_p1p2p3_quirk:
-    description:
-      When set core will delay P1/P2/P3 until a certain amount of 8B10B errors
-      occur.
-    type: boolean
-
-  snps,del_phy_power_chg_quirk:
-    description: When set core will delay PHY power change from P0 to P1/P2/P3.
-    type: boolean
-
-  snps,lfps_filter_quirk:
-    description: When set core will filter LFPS reception.
-    type: boolean
-
-  snps,rx_detect_poll_quirk:
-    description:
-      when set core will disable a 400us delay to start Polling LFPS after
-      RX.Detect.
-    type: boolean
-
-  snps,tx_de_emphasis_quirk:
-    description: When set core will set Tx de-emphasis value
-    type: boolean
-
-  snps,tx_de_emphasis:
-    description:
-      The value driven to the PHY is controlled by the LTSSM during USB3
-      Compliance mode.
-    $ref: /schemas/types.yaml#/definitions/uint8
-    enum:
-      - 0 # -6dB de-emphasis
-      - 1 # -3.5dB de-emphasis
-      - 2 # No de-emphasis
-
-  snps,dis_u3_susphy_quirk:
-    description: When set core will disable USB3 suspend phy
-    type: boolean
-
-  snps,dis_u2_susphy_quirk:
-    description: When set core will disable USB2 suspend phy
-    type: boolean
-
-  snps,dis_enblslpm_quirk:
-    description:
-      When set clears the enblslpm in GUSB2PHYCFG, disabling the suspend signal
-      to the PHY.
-    type: boolean
-
-  snps,dis-u1-entry-quirk:
-    description: Set if link entering into U1 needs to be disabled
-    type: boolean
-
-  snps,dis-u2-entry-quirk:
-    description: Set if link entering into U2 needs to be disabled
-    type: boolean
-
-  snps,dis_rxdet_inp3_quirk:
-    description:
-      When set core will disable receiver detection in PHY P3 power state.
-    type: boolean
-
-  snps,dis-u2-freeclk-exists-quirk:
-    description:
-      When set, clear the u2_freeclk_exists in GUSB2PHYCFG, specify that USB2
-      PHY doesn't provide a free-running PHY clock.
-    type: boolean
-
-  snps,dis-del-phy-power-chg-quirk:
-    description:
-      When set core will change PHY power from P0 to P1/P2/P3 without delay.
-    type: boolean
-
-  snps,dis-tx-ipgap-linecheck-quirk:
-    description: When set, disable u2mac linestate check during HS transmit
-    type: boolean
-
-  snps,parkmode-disable-ss-quirk:
-    description:
-      When set, all SuperSpeed bus instances in park mode are disabled.
-    type: boolean
-
-  snps,parkmode-disable-hs-quirk:
-    description:
-      When set, all HighSpeed bus instances in park mode are disabled.
-    type: boolean
-
-  snps,dis_metastability_quirk:
-    description:
-      When set, disable metastability workaround. CAUTION! Use only if you are
-      absolutely sure of it.
-    type: boolean
-
-  snps,dis-split-quirk:
-    description:
-      When set, change the way URBs are handled by the driver. Needed to
-      avoid -EPROTO errors with usbhid on some devices (Hikey 970).
-    type: boolean
-
-  snps,gfladj-refclk-lpm-sel-quirk:
-    description:
-      When set, run the SOF/ITP counter based on ref_clk.
-    type: boolean
-
-  snps,resume-hs-terminations:
-    description:
-      Fix the issue of HS terminations CRC error on resume by enabling this
-      quirk. When set, all the termsel, xcvrsel, opmode becomes 0 during end
-      of resume. This option is to support certain legacy ULPI PHYs.
-    type: boolean
-
-  snps,ulpi-ext-vbus-drv:
-    description:
-      Some ULPI USB PHY does not support internal VBUS supply, and driving
-      the CPEN pin, requires the configuration of the ulpi DRVVBUSEXTERNAL
-      bit. When set, the xhci host will configure the USB2 PHY drives VBUS
-      with an external supply.
-    type: boolean
-
-  snps,is-utmi-l1-suspend:
-    description:
-      True when DWC3 asserts output signal utmi_l1_suspend_n, false when
-      asserts utmi_sleep_n.
-    type: boolean
-
-  snps,hird-threshold:
-    description: HIRD threshold
-    $ref: /schemas/types.yaml#/definitions/uint8
-
-  snps,hsphy_interface:
-    description:
-      High-Speed PHY interface selection between UTMI+ and ULPI when the
-      DWC_USB3_HSPHY_INTERFACE has value 3.
-    $ref: /schemas/types.yaml#/definitions/string
-    enum: [utmi, ulpi]
-
-  snps,quirk-frame-length-adjustment:
-    description:
-      Value for GFLADJ_30MHZ field of GFLADJ register for post-silicon frame
-      length adjustment when the fladj_30mhz_sdbnd signal is invalid or
-      incorrect.
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 0x3f
-
-  snps,ref-clock-period-ns:
-    description:
-      Value for REFCLKPER field of GUCTL register for reference clock period in
-      nanoseconds, when the hardware set default does not match the actual
-      clock.
-
-      This binding is deprecated. Instead, provide an appropriate reference clock.
-    minimum: 8
-    maximum: 62
-    deprecated: true
-
-  snps,rx-thr-num-pkt:
-    description:
-      USB RX packet threshold count. In host mode, this field specifies
-      the space that must be available in the RX FIFO before the core can
-      start the corresponding USB RX transaction (burst).
-      In device mode, this field specifies the space that must be
-      available in the RX FIFO before the core can send ERDY for a
-      flow-controlled endpoint. It is only used for SuperSpeed.
-      The valid values for this field are from 1 to 15. (DWC3 SuperSpeed
-      USB 3.0 Controller Databook)
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 15
-
-  snps,rx-max-burst:
-    description:
-      Max USB RX burst size. In host mode, this field specifies the
-      Maximum Bulk IN burst the DWC_usb3 core can perform. When the system
-      bus is slower than the USB, RX FIFO can overrun during a long burst.
-      You can program a smaller value to this field to limit the RX burst
-      size that the core can perform. It only applies to SS Bulk,
-      Isochronous, and Interrupt IN endpoints in the host mode.
-      In device mode, this field specifies the NUMP value that is sent in
-      ERDY for an OUT endpoint.
-      The valid values for this field are from 1 to 16. (DWC3 SuperSpeed
-      USB 3.0 Controller Databook)
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 16
-
-  snps,tx-thr-num-pkt:
-    description:
-      USB TX packet threshold count. This field specifies the number of
-      packets that must be in the TXFIFO before the core can start
-      transmission for the corresponding USB transaction (burst).
-      This count is valid in both host and device modes. It is only used
-      for SuperSpeed operation.
-      Valid values are from 1 to 15. (DWC3 SuperSpeed USB 3.0 Controller
-      Databook)
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 15
-
-  snps,tx-max-burst:
-    description:
-      Max USB TX burst size. When the system bus is slower than the USB,
-      TX FIFO can underrun during a long burst. Program a smaller value
-      to this field to limit the TX burst size that the core can execute.
-      In Host mode, it only applies to SS Bulk, Isochronous, and Interrupt
-      OUT endpoints. This value is not used in device mode.
-      Valid values are from 1 to 16. (DWC3 SuperSpeed USB 3.0 Controller
-      Databook)
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 16
-
-  snps,rx-thr-num-pkt-prd:
-    description:
-      Periodic ESS RX packet threshold count (host mode only). Set this and
-      snps,rx-max-burst-prd to a valid, non-zero value 1-16 (DWC_usb31
-      programming guide section 1.2.4) to enable periodic ESS RX threshold.
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 16
-
-  snps,rx-max-burst-prd:
-    description:
-      Max periodic ESS RX burst size (host mode only). Set this and
-      snps,rx-thr-num-pkt-prd to a valid, non-zero value 1-16 (DWC_usb31
-      programming guide section 1.2.4) to enable periodic ESS RX threshold.
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 16
-
-  snps,tx-thr-num-pkt-prd:
-    description:
-      Periodic ESS TX packet threshold count (host mode only). Set this and
-      snps,tx-max-burst-prd to a valid, non-zero value 1-16 (DWC_usb31
-      programming guide section 1.2.3) to enable periodic ESS TX threshold.
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 16
-
-  snps,tx-max-burst-prd:
-    description:
-      Max periodic ESS TX burst size (host mode only). Set this and
-      snps,tx-thr-num-pkt-prd to a valid, non-zero value 1-16 (DWC_usb31
-      programming guide section 1.2.3) to enable periodic ESS TX threshold.
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 1
-    maximum: 16
-
-  tx-fifo-resize:
-    description: Determines if the TX fifos can be dynamically resized depending
-      on the number of IN endpoints used and if bursting is supported.  This
-      may help improve bandwidth on platforms with higher system latencies, as
-      increased fifo space allows for the controller to prefetch data into its
-      internal memory.
-    type: boolean
-
-  tx-fifo-max-num:
-    description: Specifies the max number of packets the txfifo resizing logic
-      can account for when higher endpoint bursting is used. (bMaxBurst > 6) The
-      higher the number, the more fifo space the txfifo resizing logic will
-      allocate for that endpoint.
-    $ref: /schemas/types.yaml#/definitions/uint8
-    minimum: 3
-
-  snps,incr-burst-type-adjustment:
-    description:
-      Value for INCR burst type of GSBUSCFG0 register, undefined length INCR
-      burst type enable and INCRx type. A single value means INCRX burst mode
-      enabled. If more than one value specified, undefined length INCR burst
-      type will be enabled with burst lengths utilized up to the maximum
-      of the values passed in this property.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-    minItems: 1
-    maxItems: 8
-    uniqueItems: true
-    items:
-      enum: [1, 4, 8, 16, 32, 64, 128, 256]
-
-  num-hc-interrupters:
-    maximum: 8
-    default: 1
-
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description:
-      This port is used with the 'usb-role-switch' property  to connect the
-      dwc3 to type C connector.
-
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    description:
-      Those ports should be used with any connector to the data bus of this
-      controller using the OF graph bindings specified if the "usb-role-switch"
-      property is used.
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: High Speed (HS) data bus.
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: Super Speed (SS) data bus.
-
-  wakeup-source:
-    $ref: /schemas/types.yaml#/definitions/flag
-    description:
-      Enable USB remote wakeup.
-
 unevaluatedProperties: false
 
 required:

-- 
2.45.2


