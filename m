Return-Path: <linux-arm-msm+bounces-50509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A39FA54AF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A409516D30D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 12:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACA020B1F3;
	Thu,  6 Mar 2025 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gF+7s/zM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F66190051;
	Thu,  6 Mar 2025 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741264914; cv=none; b=mWCDJQw7F4BM0IkRpDEtuq9bvPtSy3cQ/+tqLVOU31sNZiSIw2/ipFkEBRLxHqiQPKOvegWSjzQS/VHej8uI4/DV5A2cyDcjx4TnwuMu/tFnt2nzvVBpoc/jQx9HrL0VyVfwFjZhEib5G23RGRhAGU9vRmoRurtDac4jykSXwJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741264914; c=relaxed/simple;
	bh=40/PeAeXAjmSJ+HviKd4I8tD+I4pW9r5VSSDdOws/5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5DHDXP7trYW2AgtCpLqYKYQkVU6/EPSGShxpLxgnyAW2Os6YW2J6f9qd+u5IOW0ID8Q0m8Jq+gXr33oFtcpd6pJgc4hNcojkyW2EN6r2UOhPVM/VY+2zRFa7ylA3AxXVwiRPtqHLb11Hk/lnxOTP7Fj+xqvPTUMEaEQpZExKVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gF+7s/zM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0DFC4CEE0;
	Thu,  6 Mar 2025 12:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741264914;
	bh=40/PeAeXAjmSJ+HviKd4I8tD+I4pW9r5VSSDdOws/5U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gF+7s/zMoiPC27BOey1fWc0EQ/oc5GL0vlN3dpvkBoec3W/x9Epkmvt2dMUYAZ5kN
	 YwR1nK+EBgNkFNnM2nGlMougBQkKU8vvLiBFhTRKQENEeAkWM+feoyzBkjhBNLfCJL
	 Yj5jLfW03VKZy+S/A/fuurHAaPPyF66i3oWHIxzuj3mp5/MfwYGFZpOhTwas1PzrAE
	 kJAB+nk+t9Vfxc6ZfwNtcFRVSlc2iGz9f9eVxr7HJCvwgZQowN5uB1ratl0M9hId95
	 /zitaRW7vILVR8bcPtzYOB3KyMKX/noGf8IbW+DgZsKYe2+6OK0st6cWlqSC8oSTz8
	 uaWhO8mnL/dOw==
Message-ID: <75c17309-3072-4321-ab15-69d60190f2f7@kernel.org>
Date: Thu, 6 Mar 2025 13:41:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14
 Gen1
To: Georg Gottleuber <ggo@tuxedocomputers.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, wse@tuxedocomputers.com,
 cs@tuxedocomputers.com
References: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/03/2025 13:25, Georg Gottleuber wrote:
> Initial support for TUXEDO Elite 14 Gen1 based on Qualcomm Snapdragon X
> Elite SoC (X1E78100).
> 
> Working:
> * Touchpad
> * Keyboard
> * eDP (no brightness control yet)
> * NVMe
> * USB Type-C port
> * WiFi (WiFi 7 untested)
> * GPU (software rendering)
> 
> Not working:
> * GPU (WIP: firmware loading but output is jerky)
> * USB Type-A (WIP)
> * Suspend with substantial energy saving
> * Audio, Speakers, Microphones
> * Camera
> * Fingerprint Reader
> 
> Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../qcom/x1e80100-tuxedo-elite-14-gen1.dts    | 798 ++++++++++++++++++
>  2 files changed, 799 insertions(+)
>  create mode 100644
> arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 140b0b2abfb5..f0a9d677d957 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -298,3 +298,4 @@ dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-lenovo-yoga-slim7x.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-microsoft-romulus13.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-microsoft-romulus15.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-qcp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-tuxedo-elite-14-gen1.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> new file mode 100644
> index 000000000000..86bdec4a2dd8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> @@ -0,0 +1,798 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 TUXEDO Computers GmbH
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "x1e80100.dtsi"
> +#include "x1e80100-pmics.dtsi"
> +
> +/ {
> +       model = "TUXEDO Elite 14 Gen1";
> +       compatible = "tuxedo,elite14gen1", "qcom,x1e80100";

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also `scripts/checkpatch.pl --strict` and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.


...

> +
> +       eusb3_repeater: redriver@47 {
> +               compatible = "nxp,ptn3222";
> +               reg = <0x47>;
> +               #phy-cells = <0>;
> +
> +               vdd1v8-supply = <&vreg_l4b_1p8>;
> +               vdd3v3-supply = <&vreg_l13b_3p0>;
> +
> +               reset-gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
> +
> +               pinctrl-0 = <&eusb3_reset_n>;
> +               pinctrl-names = "default";

No graph? Isn't it needed?

> +       };
> +
> +       eusb5_repeater: redriver@43 {
> +               compatible = "nxp,ptn3222";
> +               reg = <0x43>;
> +               #phy-cells = <0>;
> +
> +               vdd1v8-supply = <&vreg_l4b_1p8>;
> +               vdd3v3-supply = <&vreg_l13b_3p0>;
> +
> +               reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> +
> +               pinctrl-0 = <&eusb6_reset_n>;
> +               pinctrl-names = "default";
> +       };
> +
> +       eusb6_repeater: redriver@4f {
> +               compatible = "nxp,ptn3222";
> +               reg = <0x4f>;
> +               #phy-cells = <0>;
> +
> +               vdd1v8-supply = <&vreg_l4b_1p8>;
> +               vdd3v3-supply = <&vreg_l13b_3p0>;
> +
> +               reset-gpios = <&tlmm 111 GPIO_ACTIVE_LOW>;
> +
> +               pinctrl-0 = <&eusb6_reset_n>;
> +               pinctrl-names = "default";
> +       };
> +

Stray blank line

> +};
> +
> +&mdss {
> +       status = "okay";
> +};
> +


> +
> +&usb_1_ss0_dwc3_hs {
> +       remote-endpoint = <&pmic_glink_ss0_hs_in>;
> +};
> +
> +&usb_1_ss0_qmpphy_out {
> +       remote-endpoint = <&pmic_glink_ss0_ss_in>;
> +};
> +

Here as well


Best regards,
Krzysztof

