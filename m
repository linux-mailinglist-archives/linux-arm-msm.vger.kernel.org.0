Return-Path: <linux-arm-msm+bounces-110869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ME+zEctcH2pglAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:44:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A9D632876
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:44:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SnTtyv7X;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110869-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110869-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C429030429B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 22:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB4D3C4B92;
	Tue,  2 Jun 2026 22:44:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0528C38656D;
	Tue,  2 Jun 2026 22:44:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440263; cv=none; b=nTjFAlKnFWDDkv1bwCrYWzazA5jvCWfUQhIDI1HBwolaUvBaIcWdmkFM4EVbmyL+RQj216+/7hRiKWiNc19jwxMIy/2oHN/wm2cU/8dKNR615nqL+6PNPIpPx6zK0o2LM/f8xvpFk1UgRe7f1jxOCRjKlVweeR8RrD/84weLvN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440263; c=relaxed/simple;
	bh=R97bS5XJigtugovY0rXW5W4MqcP/Ms7eBIZLtl9ZUnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPvaFX0iMFOTigr1v/xW6YtbyWBJcck1Oy9FcHbA4TMwJzriSFeDmM8XgkzSSoFhzdCBl1kEg2K6EqRdmAY+A8Vr9D10ZYh8Oo87NJSHoCj41MhoPCBiHgLBEzE4J4L38lC3VcgT65WGPPbeGeGWzSBBmpgE5st//Ifgt7GAwCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnTtyv7X; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3731F00893;
	Tue,  2 Jun 2026 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780440261;
	bh=QieqOEx45394xsvg9BBejpOau9VHQld2fTTqbdYvdVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SnTtyv7XZmWX3yqFEIH8gFaH+ZHuiuXVxdY+tk7mAqV/3iBSaX7gZtsWs4HAxeOaN
	 f21QmCmh6EX8R8nuqkhfvsfM0f0ZczYBN0bnKJZcmybbUlZCgnJxV4Ibo+WuakL21Z
	 4kipclxt1ZaUZQKBvQOy28dXuOMosg1F0Nzpb3wyXkMu5UPA+M16IcOv/6vSjuBLQs
	 wbUn7kaOcnPQL20JI9CT5zYyrL4DqtlBV15VUxv0c30UJvM7N45H1xnW0lXSmJRWVn
	 3Ng86891cICVFow93HVRK/4itDVsodcSLVvc6hKNKCnNHGm3nyZsk1k0SX/tL2oW5i
	 so9SR+qw7BTHw==
Date: Tue, 2 Jun 2026 17:44:20 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add the Nothing Phone (3a)
Message-ID: <20260602224420.GA1290244-robh@kernel.org>
References: <20260323-asteroids-v2-0-1a35fa9e178a@pm.me>
 <20260323-asteroids-v2-3-1a35fa9e178a@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-asteroids-v2-3-1a35fa9e178a@pm.me>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110869-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:luca.weiss@fairphone.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3A9D632876

On Mon, Mar 23, 2026 at 01:55:05PM +0000, Alexander Koskovich wrote:
> Add a devicetree for the Nothing Phone (3a) smartphone, which is based
> on the Milos/SM7635 SoC.
> 
> Supported functionality as of this initial submission:
> * Camera flash/torch LED
> * Debug UART
> * Glyph LEDs (AW20036)
> * PMIC-GLINK (Charger, Fuel gauge, USB-C mode switching)
> * Assistant Key, Power Button, Volume Keys
> * Regulators (PM7550, PM8550VS, PMR735B)
> * Remoteprocs (ADSP, CDSP, MPSS, WPSS)
> * USB (USB2 + FSA4480)
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/milos-nothing-asteroids.dts      | 964 +++++++++++++++++++++
>  2 files changed, 965 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f80b5d9cf1e8..bb7ac369682c 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -44,6 +44,7 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
>  
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
> diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> new file mode 100644
> index 000000000000..7393978926e4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> @@ -0,0 +1,964 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#define PMIV0104_SID 7
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "milos.dtsi"
> +#include "pm7550.dtsi"
> +#include "pm8550vs.dtsi"
> +#include "pmiv0104.dtsi" /* PMIV0102 */
> +#include "pmk8550.dtsi" /* PMK7635 */
> +#include "pmr735b.dtsi"
> +
> +/ {
> +	model = "Nothing Phone (3a)";
> +	compatible = "nothing,asteroids", "qcom,milos";
> +	chassis-type = "handset";
> +
> +	aliases {
> +		serial0 = &uart5;
> +	};
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		stdout-path = "serial0:115200n8";
> +
> +		framebuffer0: framebuffer@e3940000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xe3940000 0x0 (2392 * 1080 * 4)>;
> +			width = <1080>;
> +			height = <2392>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +			panel = <&panel>;
> +			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
> +
> +			/* Dummy panel for simple-framebuffer dimension info */
> +			panel: dummy-panel {
> +				compatible = "boe,bf068mwm-td0";

This is missing documentation and gives a warning. However, having a 
panel node here is not valid. Either define a complete panel node or 
none at all. That should throw a warning as well.

Please send fixes for this and any other warnings you didn't check or 
ignored.

> +				height-mm = <157>;
> +				width-mm = <71>;
> +			};
> +		};
> +	};


Rob

