Return-Path: <linux-arm-msm+bounces-28152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC43394BCAA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 13:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B7C81C2258E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 11:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10DE18B48A;
	Thu,  8 Aug 2024 11:57:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gollum.nazgul.ch (gollum.nazgul.ch [81.221.21.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15D18C330;
	Thu,  8 Aug 2024 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.221.21.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723118227; cv=none; b=Md9Dm4W9azuRs0GfI3v4F/Fp2NYz63OKt/ij29QRjZXwx4UUGKTCAXJJFvHT7Dm+XeKKKxGPLQA8nIvv0+rmCi3B+m3ghKTYSEvYBndOoRi7haBqjRjxng5nv1TYhI5kDhcV9t+gjb3fJKskC6OpQ7bJh1vbFbTxzrDqwMWZfKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723118227; c=relaxed/simple;
	bh=LnuAYhivZhMPIsJOudSBQbxYr/VGLneDzJ8//Y/VQcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdBbkVwHkRM5BRlZcTE5FAQMf2k/8C96t+TMX5JHUR0J+iH2tAckhWcr4/IsltEcLmnAaEXW+iItDB2tt3l7FsYY9n4KzH3jWr+w7gal2ptqUxm3eNvFnDe67TWLpV+CLV5npSDtLlyRkbpAgW6hDdPgxBxoMM4Qy3FEKc1JEso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch; spf=pass smtp.mailfrom=nazgul.ch; arc=none smtp.client-ip=81.221.21.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nazgul.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nazgul.ch
Received: from localhost (gollum.nazgul.ch [local])
	by gollum.nazgul.ch (OpenSMTPD) with ESMTPA id 8637f7e7;
	Thu, 8 Aug 2024 13:56:54 +0200 (CEST)
Date: Thu, 8 Aug 2024 13:56:54 +0200
From: Marcus Glocker <marcus@nazgul.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: Add X1E80100 Samsung Galaxy Book4 Edge
Message-ID: <3epl2ejalepplnovj5hhwr7raw6hfbigfov2a4zjdkpkboix7r@6rt47jj2ag24>
References: <o2ysrhejn2xlba6mh4wueh7mgb4l54zvh4tcep3g5wizpaidk6@33mqoj3246zv>
 <f412c9f4-4813-4e81-babc-eb8850548a63@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f412c9f4-4813-4e81-babc-eb8850548a63@kernel.org>

On Sun, Aug 04, 2024 at 10:39:45AM +0200, Krzysztof Kozlowski wrote:

> On 04/08/2024 10:10, Marcus Glocker wrote:
> > Hi,
> > 
> > We recently added initial support in OpenBSD for the Samsung Galaxy
> > Book4 Edge by below DTS diff.
> 
> 
> Please write commig msgs matching Linux kernel style, see submitting
> patches.
> 
> That's not a letter but explanation of what and why you are doing.

Sure, noted for the future.  I will still reply to your feedback in
this response though.

> > - x1e80100-samsung-galaxy-book4-edge.dts:
> >   Is a copy of x1e80100-crd.dts, and then modified to our needs.
> > 
> > - x1e80100.dtsi:
> >   Includes the UFSHCI peaces, which was basically pulled from
> >   sc7180.dtsi.
> > 
> > Main stuff working:
> > 
> > - UFSHCI.
> > - Keyboard.
> > - Touch-pad.
> > - USB (as far tested).
> > 
> > Main stuff not working yet:
> > 
> > - Touch-screen:  Pin 51, which mostly works on the other X1E80100
> >   models, is creating an interrupt storm on the Samsung Galaxy Book4
> >   Edge.  Probing the other pins didn't showed success yet.  Not sure at
> >   this point what the problem is.
> > 
> > Regards,
> > Marcus
> > 
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dts b/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dts
> > new file mode 100644
> > index 000000000000..83751455211a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dts
> > @@ -0,0 +1,986 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +
> > +#include "x1e80100.dtsi"
> > +#include "x1e80100-pmics.dtsi"
> > +
> > +/ {
> > +	model = "Samsung Galaxy Book4 Edge";
> > +	compatible = "samsung,galaxy-book4-edge", "qcom,x1e80100";
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).

That's right, I didn't test the diff on the Linux GIT repository yet.
I did test it in the meantime, and added the missing binding entries.
I hope I got it right.

> > +	chassis-type = "laptop";
> > +
> > +	pmic-glink {
> > +		compatible = "qcom,x1e80100-pmic-glink",
> > +			     "qcom,sm8550-pmic-glink",
> > +			     "qcom,pmic-glink";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> > +				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
> > +				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
> > +
> > +		/* Left-side rear port */
> > +		connector@0 {
> > +			compatible = "usb-c-connector";
> > +			reg = <0>;
> > +			power-role = "dual";
> > +			data-role = "dual";
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +
> > +					pmic_glink_ss0_hs_in: endpoint {
> > +						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> > +					};
> > +				};
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +
> > +					pmic_glink_ss0_ss_in: endpoint {
> > +						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		/* Left-side front port */
> > +		connector@1 {
> > +			compatible = "usb-c-connector";
> > +			reg = <1>;
> > +			power-role = "dual";
> > +			data-role = "dual";
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +
> > +					pmic_glink_ss1_hs_in: endpoint {
> > +						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
> > +					};
> > +				};
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +
> > +					pmic_glink_ss1_ss_in: endpoint {
> > +						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		/* Right-side port */
> > +		connector@2 {
> > +			compatible = "usb-c-connector";
> > +			reg = <2>;
> > +			power-role = "dual";
> > +			data-role = "dual";
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +
> > +					pmic_glink_ss2_hs_in: endpoint {
> > +						remote-endpoint = <&usb_1_ss2_dwc3_hs>;
> > +					};
> > +				};
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +
> > +					pmic_glink_ss2_ss_in: endpoint {
> > +						remote-endpoint = <&usb_1_ss2_qmpphy_out>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	reserved-memory {
> > +		linux,cma {
> > +			compatible = "shared-dma-pool";
> > +			size = <0x0 0x8000000>;
> > +			reusable;
> > +			linux,cma-default;
> > +		};
> > +	};
> > +
> > +	sound {
> > +		compatible = "qcom,x1e80100-sndcard";
> > +		model = "X1E80100-CRD";
> 
> That's not a CRD board.
> 
> > +		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
> > +				"TwitterLeft IN", "WSA WSA_SPK2 OUT",
> > +				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
> > +				"TwitterRight IN", "WSA2 WSA_SPK2 OUT",
> 
> Is this correct?
> 
> > +				"IN1_HPHL", "HPHL_OUT",
> > +				"IN2_HPHR", "HPHR_OUT",
> > +				"AMIC2", "MIC BIAS2",
> 
> And this?

After discussing internally in our development team, I removed the
sound node entirely for now, since we have too less information about
the audio hardware currently, and we don't have a driver for it yet,
at least not in OpenBSD.
 
> > +				"VA DMIC0", "MIC BIAS3",
> > +				"VA DMIC1", "MIC BIAS3",
> > +				"VA DMIC2", "MIC BIAS1",
> > +				"VA DMIC3", "MIC BIAS1",
> > +				"VA DMIC0", "VA MIC BIAS3",
> > +				"VA DMIC1", "VA MIC BIAS3",
> > +				"VA DMIC2", "VA MIC BIAS1",
> > +				"VA DMIC3", "VA MIC BIAS1",
> > +				"TX SWR_INPUT1", "ADC2_OUTPUT";
> > +
> > +		wsa-dai-link {
> > +			link-name = "WSA Playback";
> > +
> > +			cpu {
> > +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> > +			};
> > +
> > +			codec {
> > +				sound-dai = <&left_woofer>, <&left_tweeter>,
> > +					    <&swr0 0>, <&lpass_wsamacro 0>,
> > +					    <&right_woofer>, <&right_tweeter>,
> > +					    <&swr3 0>, <&lpass_wsa2macro 0>;
> > +			};
> > +
> > +			platform {
> > +				sound-dai = <&q6apm>;
> > +			};
> > +		};
> > +
> > +		va-dai-link {
> > +			link-name = "VA Capture";
> > +
> > +			cpu {
> > +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> > +			};
> > +
> > +			codec {
> > +				sound-dai = <&lpass_vamacro 0>;
> > +			};
> > +
> > +			platform {
> > +				sound-dai = <&q6apm>;
> > +			};
> > +		};
> > +	};
> > +
> > +	vph_pwr: vph-pwr-regulator {
> 
> Use consistent naming, so either prefix or suffix, not both. E.g.
> consistent regualtor-foo.

Fixed.  But please be aware that I found this syntax in 51 other DTS
files in arch/arm64/boot/dts/qcom.  So, you may want to fix that there
as well in the future.
 
> ...
> 
> > +&i2c8 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "disabled";
> > +
> > +	touchscreen@5d {
> > +		compatible = "hid-over-i2c";
> > +		reg = <0x5d>;
> > +
> > +		hid-descr-addr = <0x1>;
> > +		/*
> > +		 * Pin 51 is creating an interrupt storm.  Hence, choosing
> > +		 * some other pin which just does nothing.  But obviously,
> 
> No, you cannot add incorrect hardware description.
> 
> > +		 * the touchscreen won't work for now.
> 
> So disable the device.

The node was already disabled in my last diff, but I remove the fake
pin and adapted the comment now.
 
> > +		 */
> > +		 //interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> 
> Odd indentation.
 
See above, removed.
 
> ...
> 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 7bca5fcd7d52..62d8a91dd707 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -2878,6 +2878,77 @@ mmss_noc: interconnect@1780000 {
> >  			#interconnect-cells = <2>;
> >  		};
> >  
> > +		ufs_mem_hc: ufshc@1d84000 {
> 
> ufs@

Fixed.
 
> > +			compatible = "qcom,x1e80100-ufshc", "qcom,ufshc",
> 
> Nope, pleasr test before.

Added the bindings and tested the DTB compilation.
 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> 
> Please run scripts/checkpatch.pl and fix reported warnings. Then please
> run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.
> Some warnings can be ignored, especially from --strict run, but the code
> here looks like it needs a fix. Feel free to get in touch if the warning
> is not clear.

Checked all diff files with `scripts/checkpatch.pl --strict`.  The only
warning left is for the new DTS file asking whether the MAINTAINERS
file has been updated.
 
> Best regards,
> Krzysztof

Thanks,
Marcus


diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f08e13b61172..c8a32e5d2c74 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1044,6 +1044,7 @@ properties:
               - lenovo,yoga-slim7x
               - qcom,x1e80100-crd
               - qcom,x1e80100-qcp
+              - samsung,galaxy-book4-edge
           - const: qcom,x1e80100
 
   # Board compatibles go above
diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 0304f074cf08..915db3d28892 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine
+          - qcom,x1e80100-inline-crypto-engine
       - const: qcom,inline-crypto-engine
 
   reg:
diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index f9cfbd0b2de6..c8a61cddb311 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -35,6 +35,7 @@ properties:
       - qcom,sm8475-qmp-ufs-phy
       - qcom,sm8550-qmp-ufs-phy
       - qcom,sm8650-qmp-ufs-phy
+      - qcom,x1e80100-qmp-ufs-phy
 
   reg:
     maxItems: 1
@@ -102,6 +103,7 @@ allOf:
               - qcom,sm8475-qmp-ufs-phy
               - qcom,sm8550-qmp-ufs-phy
               - qcom,sm8650-qmp-ufs-phy
+              - qcom,x1e80100-qmp-ufs-phy
     then:
       properties:
         clocks:
diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 25a5edeea164..4cb3fea53651 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -41,6 +41,7 @@ properties:
           - qcom,sm8450-ufshc
           - qcom,sm8550-ufshc
           - qcom,sm8650-ufshc
+          - qcom,x1e80100-ufshc
       - const: qcom,ufshc
       - const: jedec,ufs-2.0
 
@@ -121,6 +122,7 @@ allOf:
           contains:
             enum:
               - qcom,sc7180-ufshc
+              - qcom,x1e80100-ufshc
     then:
       properties:
         clocks:
diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0e5c810304fb..77a48a5780ed 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -265,3 +265,4 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-samsung-galaxy-book4-edge.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dts b/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dts
new file mode 100644
index 000000000000..576fd40aaf36
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge.dts
@@ -0,0 +1,926 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "x1e80100.dtsi"
+#include "x1e80100-pmics.dtsi"
+
+/ {
+	model = "Samsung Galaxy Book4 Edge";
+	compatible = "samsung,galaxy-book4-edge", "qcom,x1e80100";
+	chassis-type = "laptop";
+
+	pmic-glink {
+		compatible = "qcom,x1e80100-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
+
+		/* Left-side rear port */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss0_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss0_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		/* Left-side front port */
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss1_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss1_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		/* Right-side port */
+		connector@2 {
+			compatible = "usb-c-connector";
+			reg = <2>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss2_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss2_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss2_ss_in: endpoint {
+						remote-endpoint = <&usb_1_ss2_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
+	reserved-memory {
+		linux,cma {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x8000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_edp_3p3: regulator-vreg_edp_3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-bob1-supply = <&vph_pwr>;
+		vdd-bob2-supply = <&vph_pwr>;
+		vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
+		vdd-l2-l13-l14-supply = <&vreg_bob1>;
+		vdd-l5-l16-supply = <&vreg_bob1>;
+		vdd-l6-l7-supply = <&vreg_bob2>;
+		vdd-l8-l9-supply = <&vreg_bob1>;
+		vdd-l12-supply = <&vreg_s5j_1p2>;
+		vdd-l15-supply = <&vreg_s4c_1p8>;
+		vdd-l17-supply = <&vreg_bob2>;
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1b_1p8: ldo1 {
+			regulator-name = "vreg_l1b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b_1p8: ldo4 {
+			regulator-name = "vreg_l4b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5b_3p0: ldo5 {
+			regulator-name = "vreg_l5b_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b_1p8: ldo6 {
+			regulator-name = "vreg_l6b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_3p0: ldo8 {
+			regulator-name = "vreg_l8b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_2p9: ldo9 {
+			regulator-name = "vreg_l9b_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_1p2: ldo12 {
+			regulator-name = "vreg_l12b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b_3p0: ldo13 {
+			regulator-name = "vreg_l13b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b_3p0: ldo14 {
+			regulator-name = "vreg_l14b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b_2p9: ldo16 {
+			regulator-name = "vreg_l16b_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-l1-supply = <&vreg_s5j_1p2>;
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		vreg_s4c_1p8: smps4 {
+			regulator-name = "vreg_s4c_1p8";
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c_1p2: ldo1 {
+			regulator-name = "vreg_l1c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_0p8: ldo2 {
+			regulator-name = "vreg_l2c_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_0p8: ldo3 {
+			regulator-name = "vreg_l3c_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vdd-l1-supply = <&vreg_s1f_0p7>;
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s4c_1p8>;
+		vdd-s1-supply = <&vph_pwr>;
+
+		vreg_l1d_0p8: ldo1 {
+			regulator-name = "vreg_l1d_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2d_0p9: ldo2 {
+			regulator-name = "vreg_l2d_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3d_1p8: ldo3 {
+			regulator-name = "vreg_l3d_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s5j_1p2>;
+
+		vreg_l2e_0p8: ldo2 {
+			regulator-name = "vreg_l2e_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e_1p2: ldo3 {
+			regulator-name = "vreg_l3e_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vdd-l1-supply = <&vreg_s5j_1p2>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s5j_1p2>;
+		vdd-s1-supply = <&vph_pwr>;
+
+		vreg_s1f_0p7: smps1 {
+			regulator-name = "vreg_s1f_0p7";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1f_1p0: ldo1 {
+			regulator-name = "vreg_l1f_1p0";
+			regulator-min-microvolt = <1024000>;
+			regulator-max-microvolt = <1024000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_1p0: ldo2 {
+			regulator-name = "vreg_l2f_1p0";
+			regulator-min-microvolt = <1024000>;
+			regulator-max-microvolt = <1024000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_1p0: ldo3 {
+			regulator-name = "vreg_l3f_1p0";
+			regulator-min-microvolt = <1024000>;
+			regulator-max-microvolt = <1024000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-6 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "i";
+
+		vdd-l1-supply = <&vreg_s4c_1p8>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+
+		vreg_s1i_0p9: smps1 {
+			regulator-name = "vreg_s1i_0p9";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2i_1p0: smps2 {
+			regulator-name = "vreg_s2i_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1i_1p8: ldo1 {
+			regulator-name = "vreg_l1i_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_1p2: ldo2 {
+			regulator-name = "vreg_l2i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_0p8: ldo3 {
+			regulator-name = "vreg_l3i_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-7 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "j";
+
+		vdd-l1-supply = <&vreg_s1f_0p7>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s5-supply = <&vph_pwr>;
+
+		vreg_s5j_1p2: smps5 {
+			regulator-name = "vreg_s5j_1p2";
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1j_0p8: ldo1 {
+			regulator-name = "vreg_l1j_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2j_1p2: ldo2 {
+			regulator-name = "vreg_l2j_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3j_0p8: ldo3 {
+			regulator-name = "vreg_l3j_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	keyboard@5 {
+		compatible = "hid-over-i2c";
+		reg = <0x5>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "disabled";
+
+	touchscreen@5d {
+		compatible = "hid-over-i2c";
+		reg = <0x5d>;
+
+		hid-descr-addr = <0x1>;
+		/* XXX: Pin 51 is creating an interrupt storm. */
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c13 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+
+		hid-descr-addr = <0xe>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&lpass_tlmm {
+	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
+		pins = "gpio13";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l1b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp3 {
+	compatible = "qcom,x1e80100-dp";
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+			power-supply = <&vreg_edp_3p3>;
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss_dp3_out: endpoint {
+				data-lanes = <0 1 2 3>;
+				link-frequencies =
+				    /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+				remote-endpoint = <&edp_panel_in>;
+			};
+		};
+	};
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pcie4 {
+	status = "okay";
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&qupv3_0 {
+	status = "okay";
+};
+
+&qupv3_1 {
+	status = "okay";
+};
+
+&qupv3_2 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/SAMSUNG/galaxy-book4-edge/qcadsp8380.mbn",
+			"qcom/x1e80100/SAMSUNG/galaxy-book4-edge/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/SAMSUNG/galaxy-book4-edge/qccdsp8380.mbn",
+			"qcom/x1e80100/SAMSUNG/galaxy-book4-edge/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&smb2360_0_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l2b_3p0>;
+};
+
+&smb2360_1_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l14b_3p0>;
+};
+
+&smb2360_2_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l8b_3p0>;
+};
+
+&swr0 {
+	status = "okay";
+
+	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
+	pinctrl-names = "default";
+
+	/* WSA8845, Left Woofer */
+	left_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+	};
+
+	/* WSA8845, Left Tweeter */
+	left_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TwitterLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	/* WCD9385 RX */
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010d00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	/* WCD9385 TX */
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010d00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
+&swr3 {
+	status = "okay";
+
+	pinctrl-0 = <&wsa2_swr_active>, <&spkr_23_sd_n_active>;
+	pinctrl-names = "default";
+
+	/* WSA8845, Right Woofer */
+	right_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+	};
+
+	/* WSA8845, Right Tweeter */
+	right_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TwitterRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <34 2>, /* Unused */
+			       <44 4>, /* SPI (TPM) */
+			       <238 1>; /* UFS Reset */
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio51";
+			function = "gpio";
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio48";
+			function = "gpio";
+			output-high;
+			drive-strength = <16>;
+		};
+	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&ufs_mem_hc {
+	status = "okay";
+
+	vcc-supply = <&vreg_l9b_2p9>;
+	vcc-max-microamp = <600000>;
+	vccq2-supply = <&vreg_l4b_1p8>;
+	vccq2-max-microamp = <600000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l2c_0p8>;
+	vdda-phy-max-microamp = <62900>;
+	vdda-pll-supply = <&vreg_l12b_1p2>;
+	vdda-pll-max-microamp = <18300>;
+};
+
+&uart21 {
+	compatible = "qcom,geni-debug-uart";
+	status = "okay";
+};
+
+&usb_1_ss0_hsphy {
+	vdd-supply = <&vreg_l3j_0p8>;
+	vdda12-supply = <&vreg_l2j_1p2>;
+
+	phys = <&smb2360_0_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_ss0_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l1j_0p8>;
+
+	status = "okay";
+};
+
+&usb_1_ss0 {
+	status = "okay";
+};
+
+&usb_1_ss0_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_ss0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss0_hs_in>;
+};
+
+&usb_1_ss0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+};
+
+&usb_1_ss1_hsphy {
+	vdd-supply = <&vreg_l3j_0p8>;
+	vdda12-supply = <&vreg_l2j_1p2>;
+
+	phys = <&smb2360_1_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_ss1_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
+	status = "okay";
+};
+
+&usb_1_ss1 {
+	status = "okay";
+};
+
+&usb_1_ss1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_ss1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss1_hs_in>;
+};
+
+&usb_1_ss1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss1_ss_in>;
+};
+
+&usb_1_ss2_hsphy {
+	vdd-supply = <&vreg_l3j_0p8>;
+	vdda12-supply = <&vreg_l2j_1p2>;
+
+	phys = <&smb2360_2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_ss2_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
+	status = "okay";
+};
+
+&usb_1_ss2 {
+	status = "okay";
+};
+
+&usb_1_ss2_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_ss2_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss2_hs_in>;
+};
+
+&usb_1_ss2_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss2_ss_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 7bca5fcd7d52..235e20e4b51f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2878,6 +2878,77 @@ mmss_noc: interconnect@1780000 {
 			#interconnect-cells = <2>;
 		};
 
+		ufs_mem_hc: ufs@1d84000 {
+			compatible = "qcom,x1e80100-ufshc", "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0 0x01d84000 0 0x3000>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufs_mem_phy>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <1>;
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			iommus = <&apps_smmu 0xa0 0x0>;
+
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk";
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
+			freq-table-hz = <50000000 200000000>,
+					<0 0>,
+					<0 0>,
+					<37500000 150000000>,
+					<0 0>,
+					<0 0>,
+					<0 0>;
+
+			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ufs-ddr", "cpu-ufs";
+
+			qcom,ice = <&ice>;
+
+			status = "disabled";
+		};
+
+		ufs_mem_phy: phy@1d87000 {
+			compatible = "qcom,x1e80100-qmp-ufs-phy";
+			reg = <0 0x01d87000 0 0x1000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		ice: crypto@1d90000 {
+			compatible = "qcom,x1e80100-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0 0x01d90000 0 0x8000>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
 		pcie6a: pci@1bf8000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-x1e80100";

