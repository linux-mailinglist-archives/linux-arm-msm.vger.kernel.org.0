Return-Path: <linux-arm-msm+bounces-49538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F30A46518
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 16:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77FAD7AA5DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 15:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016CF22488E;
	Wed, 26 Feb 2025 15:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPiIIrpc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03D721E0AA;
	Wed, 26 Feb 2025 15:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584211; cv=none; b=XMGOvvTpP2ZL1eCzFL24jhWKYqLnGU5x3xViOxoeeFPBjdpvxb8wrln68qq/JufkfmjYNWsvBwvSzs6I7Ua5ZipOcjtNJldWo3vHKTo+4bac3VZjlvi0ZsqQI1UwPGukefj7ytXwlC6iHj9cy2YephVWg8VFoT+RgePv8VQhFPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584211; c=relaxed/simple;
	bh=Kcxlg+wkdwQqRcewEbnIH5bR8ZjExYIUPT/bKiPZZzA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=FKsGtzfk8E9Os/fu4OkZz2lolyGjnAWM0OhXjmk7O/dxYSpmBBfm6+7YXRTnoi+JfIY7v0rnLMOb3+RAUm9ZKXyqruucriNQlcwU+Q0nUSuWptQLVi6HGGZJKQ+QMMfda/O3iKS7mL33aq8tnd+VNFo+SXFqRsxiAZFC2a1QkIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPiIIrpc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8C9C4CED6;
	Wed, 26 Feb 2025 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740584211;
	bh=Kcxlg+wkdwQqRcewEbnIH5bR8ZjExYIUPT/bKiPZZzA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jPiIIrpcBQVeaLUguCnE87OKpBphKCIQfTlQz+vcSIczYpVQ64VB/o+lcViLlKG1Z
	 1tYvK4Iqgx4+qMw2GZx6BgbCkn5MS7TxFQSD5RWKB8F3Vah68MeDQgss2MrdGRE/j0
	 Qz96eWw+jFIjVdXqNA/i4aA7wrG0Bc/3Im/DHKKyHntOzH+ygaG3hZt7ogO9SYFnyv
	 WRWxe58bAbz9p019/dVtcPlGswsEw+FaFRSK4KvOoDup58AJR/iY1DJGV+37OuSwEt
	 0MYoLrYZXmhPhxBQWUbPflEF8XkJg9AVZ/E+bYIiZG5oeg4YiiwTfcEFOYPbnMWOJe
	 xz5HzbdDfK1bA==
Date: Wed, 26 Feb 2025 09:36:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org, Mark Brown <broonie@kernel.org>, 
 devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Bjorn Andersson <andersson@kernel.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>
In-Reply-To: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
References: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
Message-Id: <174058387176.2466803.5224190356165061330.robh@kernel.org>
Subject: Re: [PATCH v9 00/12] This is continued work on Samsung S9(SM-9600)
 starqltechn


On Tue, 25 Feb 2025 19:38:51 +0300, Dzmitry Sankouski wrote:
> Contains starqltechn device tree changes.
> Add support for new features:
> - sound (headphones and mics only)
> - gpu
> - panel
> - buttons
> - MAX77705 MFD:
>   - charger
>   - fuelgauge
>   - haptic
>   - led
> 
> Binding Dependencies:
> - s2dos05: https://lore.kernel.org/r/20241007-starqltechn_integration_upstream-v6-0-264309aa66de@gmail.com
>   - This series was applied to krzk/linux.git (for-next)
> 
> - max77705: https://lore.kernel.org/r/20241209-starqltechn_integration_upstream-v11-4-dc0598828e01@gmail.com
>   - applied to
>     git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
> 
> - s6e3ha8 panel: https://lore.kernel.org/r/20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com
>   - applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
> 
> Runtime Dependencies:
> - gcc845 gp clock: https://lore.kernel.org/r/20241007-starqltechn_integration_upstream-v6-0-dd75c06c708d@gmail.com
>   - applied to clk-next
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Changes in v9:
> - update applied dependency patchsets
> - Link to v8: https://lore.kernel.org/r/20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com
> 
> Changes in v8:
> - add reviewed tags
> - minor fixes
> - remove 'reg' property in fuel-gauge to comply with v11 max77705 mfd
> - Link to v7: https://lore.kernel.org/r/20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com
> 
> Changes in v7:
> - review fixes.
> - new patch with dt-binding header for wcd934x
> - Link to v6: https://lore.kernel.org/r/20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com
> 
> Changes in v6:
> - refactor: no space between tags in commit message
> - rename starqltechn to sdm845-starqltechn in commit summaries
> - Link to v5: https://lore.kernel.org/r/20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com
> 
> Changes in v5:
> - Split patchset per subsystem
> - Add links to subsystem patchsets in description
> - Link to v4: https://lore.kernel.org/r/20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com
> 
> Changes in v4:
> - Rewrite max77705, max77705_charger, max77705_fuel_gauge from scratch
> - Reorder patches:
>   - squash max77705 subdevice bindings in core file because
>     no resources there
>   - split device tree changes
> - Use _ as space for filenames in power/supply like the majority
> - Replace gcc-845 freq_tbl frequencies patch with new approach,
>   based on automatic m/n/pre_div value generation
> - Link to v3: https://lore.kernel.org/r/20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com
> 
> Changes in version 3:
> - disable crypto patch removed(disabled on distro level)
> - dts framebuffer node along with related patches removed,
> because panel driver added
> - fix 'make O=.output_arm64 CHECK_DTBS=y qcom/sdm845-samsung-starqltechn.dtb'
> errors, but it still complains on 'monitored-battery' and
> 'power-supplies' though I have 'power-supply.yaml' link in charger
> and fuel gauge bindings.
> 
> ---
> Dzmitry Sankouski (12):
>       arm64: dts: qcom: sdm845: enable gmu
>       arm64: dts: qcom: sdm845-starqltechn: remove wifi
>       arm64: dts: qcom: sdm845-starqltechn: fix usb regulator mistake
>       arm64: dts: qcom: sdm845-starqltechn: refactor node order
>       arm64: dts: qcom: sdm845-starqltechn: remove excess reserved gpios
>       arm64: dts: qcom: sdm845-starqltechn: add gpio keys
>       arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC
>       arm64: dts: qcom: sdm845-starqltechn: add display PMIC
>       arm64: dts: qcom: sdm845-starqltechn: add touchscreen support
>       arm64: dts: qcom: sdm845-starqltechn: add initial sound support
>       arm64: dts: qcom: sdm845-starqltechn: add graphics support
>       arm64: dts: qcom: sdm845-starqltechn: add modem support
> 
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                   |   4 ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   |   4 ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts                      |   4 ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          |   4 ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts      | 600 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            |   4 ---
>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        |   4 ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |   4 ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           |   4 ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi                         |   2 --
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts         |   4 ---
>  11 files changed, 591 insertions(+), 47 deletions(-)
> ---
> base-commit: d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
> change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3
> 
> Best regards,
> --
> Dzmitry Sankouski <dsankouski@gmail.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com:

arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/geniqup@ac0000/i2c@a98000/pmic@66: failed to match any schema with compatible: ['maxim,max77705']
arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/geniqup@ac0000/i2c@a98000/pmic@66/leds: failed to match any schema with compatible: ['maxim,max77705-rgb']
arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/geniqup@ac0000/i2c@a98000/pmic@66/haptic: failed to match any schema with compatible: ['maxim,max77705-haptic']
arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: /soc@0/geniqup@ac0000/i2c@a98000/charger@69: failed to match any schema with compatible: ['maxim,max77705-charger']






