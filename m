Return-Path: <linux-arm-msm+bounces-38038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8670C9CEBC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 16:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46818281E13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 15:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC031D4610;
	Fri, 15 Nov 2024 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6spUon9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAE01CEEB8;
	Fri, 15 Nov 2024 15:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731683584; cv=none; b=AMs1Z03ZamlILHPigZXkvw+g+aaFDbdkneT3gmyOfGjayVtX+kV8i/uG8TziwJaiGvvUCHkLuBHBeQwnl8jVRJp5FxNXIQkKC8HrItQ6Yh2dX9q3rTJuABIhq+Qm8DWAr4rkBUqTq2fqQ7dq+sjLXu/DnwEXYMJVGrFj6XBuscQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731683584; c=relaxed/simple;
	bh=Hzl4HvXjPCBTOCpxlfz8euN/4InZC0Ja5eJZlmrRPck=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SWMDGL7jctrhu2czmSyXdz62igUbf/VuBlhc66IoWARANTr1uu0OPLxXIKtZo4TbA9KuD8lQn4+96Pkab2Nlv9QVtilZ81xbb7/BJczjebLzEZl7dlktQ2jLCYl50pqATANCh63IVcjmh3Xk5zR7HPEn2U+Im0FYjemoCBDZaMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6spUon9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7D8C4CECF;
	Fri, 15 Nov 2024 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731683583;
	bh=Hzl4HvXjPCBTOCpxlfz8euN/4InZC0Ja5eJZlmrRPck=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=h6spUon9NMMpScytIHHQVaeHUzntFFQCAx7szJtYUsgNJmqDn7QJTTsxHQ4SME+Rz
	 kEHnxG3M8O5z+7BUQU/QNzNLwevpHFoMso/M/gGU0isvU1jRy1svL+mdj88W3mgyvA
	 kFxrfb5E3gLAz4/qX3LnN4HHCpMVJhNZfqUSrbC9RfWk0aD8kKeR6RsNPi/q/TVYdU
	 FwRuMhthDfMwgTrMRzP74vDh5+cxLrhK2upD/0ra06My4tcG6SM+AImWaK1h86NHh5
	 dwYrrnaqxJ3gpxFZYKxLueggyWFlcCT6vPh7ZXbBXtfEed6XRDZsR2QKErOB9Z0Xcf
	 XAlaJzDeJXVEg==
Date: Fri, 15 Nov 2024 09:13:01 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>, linux-kernel@vger.kernel.org, 
 Trilok Soni <quic_tsoni@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
In-Reply-To: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
Message-Id: <173168321020.2749625.3094744897170113522.robh@kernel.org>
Subject: Re: [PATCH v5 0/6] usb: typec: Add new driver for Parade PS8830
 Type-C Retimer


On Tue, 12 Nov 2024 19:01:09 +0200, Abel Vesa wrote:
> The Parade PS8830 is a Type-C multi-protocol retimer that is controlled
> via I2C. It provides altmode and orientation handling and usually sits
> between the Type-C port and the PHY.
> 
> It is currently used alongside Qualcomm Snapdragon X Elite SoCs on quite
> a few laptops already.
> 
> This new driver adds support for the following 3 modes:
>  - DP 4lanes (pin assignments C and E)
>  - DP 2lanes + USB3 (pin assignment D)
>  - USB3
> 
> This retimer is a LTTPR (Link-Training Tunable PHY Repeater) which means
> it can support link training from source to itself. This means that the
> DP driver needs to be aware of the repeater presence and to handle
> the link training accordingly. This is currently missing from msm dp
> driver, but there is already a patchset [1] on the list that adds it.
> Once done, full external DP will be working on all X1E laptops that make
> use of this retimer.
> 
> NOTE: Currently, due to both LTTPR missing support in msm DP and a
> reported crash that can happen on DP unplug, the DP DT patches are not
> supposed to be merged yet. That patch is only shared for testing purposes.
> Once those 2 issues have been resolved, the MDSS DP 0-2 enablement patch
> will be respun.
> 
> The LTTPR patchset is already on the list:
> [1] https://lore.kernel.org/all/20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org/
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v5:
> - Renamed binding schema to be the same as the compatible.
> - Dropped the ps8830,boot-on from the schema.
> - Added register offsets and bits names to the driver, like Konrad
>   suggested.
> - Reordered the vregs and clocks enabling, as per Johan's request.
> - Used the dev_err_probe for regmap init failure and dropped the
>   multiple regulator disable calls, replacing it with single call to
>   helper, as Christophe suggested. Also replaced dev_err with
>   dev_err_probe on typec_switch_register and typec_mux_register failure.
> - Added some new pinctrl specific properties to all pmic provided
>   gpios that control retimer vregs.
> - Re-ordered alphabetically the retimers default state pinconfs.
> - Added the T14s patches with same exact support, as per Johan's
>   request.
> - Link to v4: https://lore.kernel.org/r/20241101-x1e80100-ps8830-v4-0-f0f7518b263e@linaro.org
> 
> Changes in v4:
> - Renamed the driver and bindings schema to ps883x to allow future
>   support for the PS8833.
> - Dropped the dedicated DT property for keeping the retimers from
>   resetting on probe, and replaced that with a read to figure out
>   if it has been already configured or not. This involves leaving the
>   reset gpio as-is on probe if the retimer has been already configured.
> - Replaced the fwnode_typec_switch_get() call with typec_switch_get()
> - Replaced the fwnode_typec_mux_get() call with typec_mux_get()
> - Dropped the clock name, as there is only one clock. As per Bjorn's
>   suggestion.
> - Dropped regcache as it seems it is not needed.
> - Re-worded all commit messages to explain better the problem and the
>   proposed changes.
> - Link to v3: https://lore.kernel.org/r/20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org
> 
> Changes in v3:
> - Reworked the schema binding by using the usb/usb-switch.yaml defined
>   port graph and properties. Addressed all comments from Johan and
>   Dmitry.
> - Dropped the manual caching of the config values on regmap write in the
>   driver.
> - Reordered the DP pin assignment states within the switch clause, as
>   Dmitry suggested.
> - Added SVID check to not allow any altmode other than DP.
> - Added DT patches (retimer for USB orientation handling and DP
>   enablement). Did this in order to offer a full picture of how it all
>   fits together.
> - Split the DP enablement in DT in a separate patchset so the USB
>   handling can be merged separately.
> - Added ps8830,boot-on to let the driver know it is supposed to skip
>   resetting the retimer on driver probe, as the bootloader might already
>   let it in a pre-configured state.
> - Marked all retimer voltage regulators as boot-on since we want to
>   maintain the state for coldplug orientation.
> - Added pinconf for all retimer0 gpios.
> - Didn't pick up Konrad's T-b tags and Krzysztof's R-b tag as the rework
>   is quite extensive. Especially because of the ps8830,boot-on and what
>   it does.
> - Link to v2: https://lore.kernel.org/r/20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org
> 
> Changes in v2:
> - Addressed all comments from Johan and Konrad.
> - Reworked the handling of the vregs so it would be more cleaner.
>   Dropped the usage of bulk regulators API and handled them separately.
>   Also discribed all regulators according to data sheet.
> - Added all delays according to data sheet.
> - Fixed coldplug (on boot) orientation detection.
> - Didn't pick Krzysztof's R-b tag because the bindings changed w.r.t
>   supplies.
> - Link to v1: https://lore.kernel.org/r/20240829-x1e80100-ps8830-v1-0-bcc4790b1d45@linaro.org
> 
> ---
> Abel Vesa (6):
>       dt-bindings: usb: Add Parade PS8830 Type-C retimer bindings
>       usb: typec: Add support for Parade PS8830 Type-C Retimer
>       arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
>       arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support
>       arm64: dts: qcom: x1e80100-t14s: Describe the Parade PS8830 retimers
>       arm64: dts: qcom: x1e80100-t14s: Enable external DisplayPort support
> 
>  .../devicetree/bindings/usb/parade,ps8830.yaml     | 119 ++++++
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 321 +++++++++++++-
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 474 ++++++++++++++++++++-
>  drivers/usb/typec/mux/Kconfig                      |  10 +
>  drivers/usb/typec/mux/Makefile                     |   1 +
>  drivers/usb/typec/mux/ps883x.c                     | 437 +++++++++++++++++++
>  6 files changed, 1352 insertions(+), 10 deletions(-)
> ---
> base-commit: 28955f4fa2823e39f1ecfb3a37a364563527afbc
> change-id: 20240521-x1e80100-ps8830-d5ccca95b557
> 
> Best regards,
> --
> Abel Vesa <abel.vesa@linaro.org>
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


New warnings running 'make CHECK_DTBS=y qcom/x1e78100-lenovo-thinkpad-t14s.dtb qcom/x1e80100-crd.dtb' for 20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org:

arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#






