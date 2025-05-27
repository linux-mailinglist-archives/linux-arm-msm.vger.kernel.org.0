Return-Path: <linux-arm-msm+bounces-59579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 980A2AC5969
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 19:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 353391BC38E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 17:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C398328032B;
	Tue, 27 May 2025 17:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyb3iV42"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919BF28030F;
	Tue, 27 May 2025 17:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368582; cv=none; b=JSzpnUUi6NqLYRxqo4SLpaLJ1Ppa6vVrT102i+pSBB3wE2C/+3jcDOHzEYbvQJs3UJCVkphfHLI4VQIOLTwEfBZuq+drrhVjIMsoLrABVkIy9yR5IMTvZvyxZuNQg9pLgyQI80/IFDy4ZAEzD3uqu0odolwOScM1ezdKKTmQ0fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368582; c=relaxed/simple;
	bh=ETkF1OnVQp7f45KUierCwATe+rzbzH7OlHSlcERTaBI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=o2MTRVw49jdNvIed74P+Sj3kgFWwKdBar10yowuHz17PXqY4/g8t56sm4SohObLjA834qytJP0rUaS5QC7s3d7Hbtq5gZ0GLtMvahK1h3BGKipeA891GpGP9TdwCfMYGpEFN1eEZ0bzc5zGeug+hZFo1sILFk4CfHfpfVwcBWFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyb3iV42; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185B4C4CEE9;
	Tue, 27 May 2025 17:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748368582;
	bh=ETkF1OnVQp7f45KUierCwATe+rzbzH7OlHSlcERTaBI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hyb3iV42Ujw57iw7QRJTTYlOgZNxc6SQelg0lFoR5GCt58ZgEd9li3hhymP5kOulK
	 3KoGITLy7YRRAFVLki4Od1kdUTrSCdIGVUZjMlhhtHl2LGgh9m8aQWcsqjKiMmMwWl
	 g3MmJuZAReDWEL1HdCYD1OEMLM17oaG1vlg1G9GulBj/0oTtmld4iPn+uW1DE0kiSl
	 9nvj3UwLz+tWzPXUjsps4f+deDGvMzbf1Wu23gVNMIw5la/L4Fe/ThxJz8jtQmc0yE
	 udtORWdKp+KHXAV4OdaaB2FpdSxq6cMqglVq3Yj6zuRWmgmxeFnfNO26WTmruAeAfo
	 H6xiyO1sbto+w==
Date: Tue, 27 May 2025 12:56:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Matthias Kaehlcke <mka@chromium.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, Simona Vetter <simona@ffwll.ch>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 dri-devel@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-usb@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
Message-Id: <174836830633.840732.14973117205707463656.robh@kernel.org>
Subject: Re: [PATCH v4 0/5] arm64: dts: qcom: Add Lenovo ThinkBook 16
 device tree


On Sat, 24 May 2025 13:48:35 +0200, Jens Glathe wrote:
> Device tree for the Lenovo Thinkbook 16 G7 QOY
> 
> The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> 
> Supported features:
> 
> - USB type-c and type-a ports
> - Keyboard
> - Touchpad (all that are described in the dsdt)
> - Touchscreen (described in the dsdt, no known SKUss)
> - Display including PWM backlight control
> - PCIe devices
> - nvme
> - SDHC card reader
> - ath12k WCN7850 Wifi and Bluetooth
> - ADSP and CDSP
> - GPIO keys (Lid switch)
> - Sound via internal speakers / DMIC / USB / headphone jack
> - DP Altmode with 2 lanes (as all of these still do)
> - Integrated fingerprint reader (FPC)
> - Integrated UVC camera
> 
> Not supported yet:
> 
> - HDMI port.
> - EC and some fn hotkeys.
> 
> Limited support yet:
> 
> - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> but not UHS-I (SD104) and UHS-II.
> 
> - The GPU is not yet supported. Graphics is only software rendered.
> 
> This work was done without any schematics or non-public knowledge of the device.
> So, it is based on the existing x1 device trees, dsdt analysis, using HWInfo
> ARM64, and pure guesswork. It has been confirmed, however, that the device really
> has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
> @43).
> 
> I have brought up the Thinkbook over the last 4 months since the x1p42100-crd
> patches were available. The laptop is very usable now, and quite solid as a dev/
> test platform. GPU support would be nice, though :)
> 
> Big thanks to Aleksandrs Vinarskis for helping (and sort of persisting) on the
> fingerprint, camera and HDMI issues.
> 
> [1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> Changes in v4:
> - squashed Makefile and dts commits to one
> - picked up r-b from Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> - Link to v3: https://lore.kernel.org/r/20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz
> 
> Changes in v3:
> - removed changes in x1e80100.dtsi and x1p42100.dtsi - resolved with [2]
> - fixed schema errors with correct compatible string for the model
> - added power management for the camera via onboard_usb_dev.c
> - amended node ordering
> - changed the panel driver used to edp-panel, added panel in the driver
> - amended x1e80100.dtsi for exposing PM8010: This one is not present in the design,
>   added /delete-node/ for it.
> - removed commented-out lines for sdhc, specified which don't work.
> - corrected ZAP shader firmware name
> - Link to v2: https://lore.kernel.org/r/20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz
> 
> Changes in v2:
> - removed nodes that gave DTC compile errors (pm8010_thermal, edp0_hpd_active)
> - amended qcom.yaml
> - shortened the commit titles to fit 75 chars
> - Link to v1: https://lore.kernel.org/r/20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz
> 
> [2]: 20250520-topic-x1p4_tsens-v2-1-9687b789a4fb@oss.qualcomm.com
> 
> ---
> Jens Glathe (5):
>       dt-bindings: arm: qcom: Add Lenovo TB16 support
>       drm/panel-edp: add N160JCE-ELL CMN panel for Lenovo Thinkbook 16
>       usb: misc: onboard_usb_dev: Add Bison Electronics Inc. Integrated Camera
>       firmware: qcom: scm: Allow QSEECOM on Lenovo Thinkbook 16
>       arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY device tree
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
>  .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1655 ++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c                   |    1 +
>  drivers/gpu/drm/panel/panel-edp.c                  |    1 +
>  drivers/usb/misc/onboard_usb_dev.c                 |    2 +
>  drivers/usb/misc/onboard_usb_dev.h                 |    8 +
>  8 files changed, 1672 insertions(+), 1 deletion(-)
> ---
> base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
> change-id: 20250511-tb16-dt-e84c433d87b1
> 
> Best regards,
> --
> Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 176e917e010cb7dcc605f11d2bc33f304292482b

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz:

arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@0 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@0 (qcom,oryon): power-domains: [[4], [5, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@0 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@100 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@100 (qcom,oryon): power-domains: [[7], [5, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@100 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@200 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@200 (qcom,oryon): power-domains: [[8], [5, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@200 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@300 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@300 (qcom,oryon): power-domains: [[9], [5, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@300 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@10000 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@10000 (qcom,oryon): power-domains: [[11], [5, 1]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@10000 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@10100 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@10100 (qcom,oryon): power-domains: [[12], [5, 1]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@10100 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@10200 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@10200 (qcom,oryon): power-domains: [[13], [5, 1]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@10200 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@10300 (qcom,oryon): power-domain-names: ['psci', 'perf'] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@10300 (qcom,oryon): power-domains: [[14], [5, 1]] is too long
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: cpu@10300 (qcom,oryon): Unevaluated properties are not allowed ('power-domain-names', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#






