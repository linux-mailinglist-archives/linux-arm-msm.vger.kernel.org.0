Return-Path: <linux-arm-msm+bounces-117018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u7FKM8UATGrzeQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:23:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8535E714EB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:23:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117018-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117018-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FAA13023322
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 19:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A0E3D952E;
	Mon,  6 Jul 2026 19:23:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MTA-07-3.privateemail.com (mta-07-3.privateemail.com [198.54.118.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC633DA7F8;
	Mon,  6 Jul 2026 19:23:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783365808; cv=none; b=l75jyVEUi+oNy+CJtXZjo+IbympdPYu/BS8lQSFtfVexTSWgkGdFgV+oZxrm83/USytKglzdcvx4Xmv52bm6sd5s9KXAvDh98sVm9TJgJ7DfFuK4Dx4e9SdcQ9JR+8wbORDqtDVdWCc9r9Cr0Do8SZlwE3QM/b9xNlAuBJOQK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783365808; c=relaxed/simple;
	bh=KhrGPjXfFOUZ5cyABgP7HYqcKMyFP7ns8/QsuVEWDg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=apkqjJhZQRm7rmTfxnkIm6CTm7c6S7QiJsiU0wPy8dEFCgQCRMYn5a96yg/pDX40OkL6EIKbIntGECvFgMfcomaL4WAisHI7ayssCSRILxHFKgMDnS9kWh0iUXa2rSfzokva653wHeYjOtVegIY2v7NglvST+1RzR+Pmh6ZEt6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.118.214
Received: from mail.privateemail.com (unknown [87.215.145.39])
	by mta-07.privateemail.com (Postfix) with ESMTPA id 4gvDlw6mgBz3hhTH;
	Mon,  6 Jul 2026 15:23:07 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Mark Brown <broonie@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: dt-bindings: add the Qualcomm WCD9378 audio codec
Date: Mon,  6 Jul 2026 21:22:28 +0200
Message-ID: <20260706192229.144137-3-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117018-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[catcrafts.net];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:jorijnvdgraaf@catcrafts.net,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:luca.weiss@fairphone.com,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[catcrafts.net,kernel.org,gmail.com,fairphone.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,catcrafts.net:from_mime,catcrafts.net:email,catcrafts.net:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8535E714EB0

The Qualcomm WCD9378 is a standalone audio codec IC found on SM7635
boards such as the Fairphone 6. Like the WCD937x/938x/939x codecs it
presents RX and TX SoundWire slave devices controlled by a common
parent node, so the parent binding references qcom,wcd93xx-common.yaml;
unlike those codecs it has three ADCs and three mic bias supplies
rather than four, hence qcom,micbias4-microvolt is rejected.

The slave devices enumerate with manufacturer ID 0x0217 and part ID
0x0110, hence the sdw20217011000 compatible. The TX slave carries five
device ports (ADC1, ADC2, ADC3, DMIC0/1 plus MBHC, DMIC2-5) and the RX
slave the usual five (HPH, CLSH, COMP, LO, DSD).

The -codec suffix in the parent compatible follows the existing
qcom,wcd93xx/pm4125 family compatibles and matches the compatible
shipped by production devicetrees for this chip.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
 .../bindings/sound/qcom,wcd9378-codec.yaml    |  76 +++++++++++
 .../bindings/sound/qcom,wcd9378-sdw.yaml      | 122 ++++++++++++++++++
 2 files changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
new file mode 100644
index 000000000000..32554541b279
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd9378-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCD9378 Audio Codec
+
+maintainers:
+  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
+
+description:
+  The Qualcomm WCD9378 is a standalone Hi-Fi audio codec IC with three
+  ADCs, three mic bias supplies, headphone/earpiece/line outputs and
+  MBHC. It has RX and TX SoundWire slave devices; the control registers
+  live in the SDCA control address space accessed through the TX slave.
+
+allOf:
+  - $ref: dai-common.yaml#
+  - $ref: qcom,wcd93xx-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,wcd9378-codec
+
+  qcom,micbias4-microvolt: false
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    audio-codec {
+        compatible = "qcom,wcd9378-codec";
+        reset-gpios = <&tlmm 162 GPIO_ACTIVE_LOW>;
+        vdd-buck-supply = <&vreg_l8b>;
+        vdd-rxtx-supply = <&vreg_l7b>;
+        vdd-io-supply = <&vreg_l7b>;
+        vdd-mic-bias-supply = <&vreg_bob>;
+        qcom,micbias1-microvolt = <1800000>;
+        qcom,micbias2-microvolt = <1800000>;
+        qcom,micbias3-microvolt = <1800000>;
+        qcom,rx-device = <&wcd9378_rx>;
+        qcom,tx-device = <&wcd9378_tx>;
+        #sound-dai-cells = <1>;
+    };
+
+    /* ... */
+
+    soundwire@3210000 {
+        reg = <0x03210000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_rx: audio-codec@0,4 {
+            compatible = "sdw20217011000";
+            reg = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5>;
+        };
+    };
+
+    soundwire@33b0000 {
+        reg = <0x033b0000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_tx: audio-codec@0,3 {
+            compatible = "sdw20217011000";
+            reg = <0 3>;
+            qcom,tx-port-mapping = <1 1 1 2 3>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
new file mode 100644
index 000000000000..a46938338f90
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoundWire Slave devices on WCD9378
+
+maintainers:
+  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
+
+description:
+  The Qualcomm WCD9378 codec has RX and TX SoundWire slave devices.
+  This binding is for the slave devices.
+
+properties:
+  compatible:
+    const: sdw20217011000
+
+  reg:
+    maxItems: 1
+
+  qcom,tx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host tx ports.
+      In the order of the device port index, which is adc1_port,
+      adc2_port, adc3_port, dmic01_mbhc_port, dmic25_port.
+
+      WCD9378 TX Port 1 (ADC1)             <=> SWR master Port 1
+      WCD9378 TX Port 2 (ADC2)             <=> SWR master Port 1
+      WCD9378 TX Port 3 (ADC3)             <=> SWR master Port 1
+      WCD9378 TX Port 4 (DMIC0,1 & MBHC)   <=> SWR master Port 2
+      WCD9378 TX Port 5 (DMIC2,3,4,5)      <=> SWR master Port 3
+
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+    maxItems: 5
+    items:
+      enum: [1, 2, 3, 4]
+
+  qcom,rx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host rx ports.
+      In the order of the device port index, which is hph_port,
+      clsh_port, comp_port, lo_port, dsd_port.
+
+      WCD9378 RX Port 1 (HPH_L/R)   <=> SWR master Port 1
+      WCD9378 RX Port 2 (CLSH)      <=> SWR master Port 2
+      WCD9378 RX Port 3 (COMP_L/R)  <=> SWR master Port 3
+      WCD9378 RX Port 4 (LO)        <=> SWR master Port 4
+      WCD9378 RX Port 5 (DSD_L/R)   <=> SWR master Port 5
+
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+    maxItems: 5
+    items:
+      enum: [1, 2, 3, 4, 5]
+
+  qcom,tx-channel-mapping:
+    description: |
+      Specifies static channel mapping between slave and master tx port
+      channels.
+      In the order of slave port channels, which is adc1, adc2, adc3,
+      dmic0, dmic1, mbhc, dmic2, dmic3, dmic4, dmic5.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 10
+    maxItems: 10
+    items:
+      enum:
+        - 1  # WCD9378_SWRM_CH1
+        - 2  # WCD9378_SWRM_CH2
+        - 3  # WCD9378_SWRM_CH3
+        - 4  # WCD9378_SWRM_CH4
+
+  qcom,rx-channel-mapping:
+    description: |
+      Specifies static channel mapping between slave and master rx port
+      channels.
+      In the order of slave port channels, which is hph_l, hph_r, clsh,
+      comp_l, comp_r, lo, dsd_l, dsd_r.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 8
+    maxItems: 8
+    items:
+      enum:
+        - 1  # WCD9378_SWRM_CH1
+        - 2  # WCD9378_SWRM_CH2
+        - 3  # WCD9378_SWRM_CH3
+        - 4  # WCD9378_SWRM_CH4
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire@3210000 {
+        reg = <0x03210000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_rx: audio-codec@0,4 {
+            compatible = "sdw20217011000";
+            reg = <0 4>;
+            qcom,rx-port-mapping = <1 2 3 4 5>;
+        };
+    };
+
+    soundwire@33b0000 {
+        reg = <0x033b0000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_tx: audio-codec@0,3 {
+            compatible = "sdw20217011000";
+            reg = <0 3>;
+            qcom,tx-port-mapping = <1 1 1 2 3>;
+        };
+    };
+...
-- 
2.55.0


