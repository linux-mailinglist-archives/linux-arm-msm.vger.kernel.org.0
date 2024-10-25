Return-Path: <linux-arm-msm+bounces-35882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EFB9B04B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 15:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65C3A1F243FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 13:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B451E1FF04A;
	Fri, 25 Oct 2024 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHN9enql"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863751FB8BF;
	Fri, 25 Oct 2024 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729864522; cv=none; b=mY0/VQmkjOYvrj9YdC6ZJVsFYEBicy+qj7hYeLiRyG0Ae7Ebxr0BAyIcj9x28n/IRtDL4nsqJIlwlrnBIQhpHrFR4B2pLCDgxYHgCnP0Ibz/rNghcPYaLKBY2buBhCtGf405DFXsLy8kJpFJ9hJyudrhtG22BZZKn950/kVxF2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729864522; c=relaxed/simple;
	bh=xkMudEWRRfD3YH0ME7+qRwqIW0hLv1EbymSWtkmjw8E=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=EITkVtbfoq9QcJZSAfweeryVlQY5qyANizqWIvD5uV5PL3z7pwpOrnMLqzBW2tZhd1iIa6pzYm0TS/N2bX2b1WENBINT8dD6416/LAw/zZQh7Z8uEs4RtIPImlYOwVlU7T/WOGkUzOSrBZ4rTOpD/3/v9mZ2Ftux9ILbrIkxFa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHN9enql; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD6EC4CEC3;
	Fri, 25 Oct 2024 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729864522;
	bh=xkMudEWRRfD3YH0ME7+qRwqIW0hLv1EbymSWtkmjw8E=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=RHN9enqlblAP3ihkNIodMpf4bP8wly0fzq3tFnxiaYOD+m54357zDBKTeyBX+wTw1
	 I5geDoQcgPiW41rQEKu3MdaSxT2X1UGfsulfW5wEwFcCuZ2DHyviCib8RRTg1XtfXh
	 Qq1KMMnpvLV86w7ZXzz5xyFws0hVBEVbe4aEr+AcS2FxDie1L8rwm8eA46uvbOtVqz
	 6FaOwJZUcNVD3ExoU3nDJD2YRNEkFB92X/f43IU8aszOfOQqQHyEHBqLlTF8CYhAJo
	 NWzBj/9nOUsFgnm01yBh47rxH/qenVn2jAEucg0mDEaSB3tNe/ombT3NLwHFr21lax
	 zRS2xomrCT7IA==
Date: Fri, 25 Oct 2024 08:55:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: krzk+dt@kernel.org, maz@kernel.org, konradybcio@kernel.org, 
 robh+dt@kernel.org, dmitry.baryshkov@linaro.org, 
 linux-kernel@vger.kernel.org, quic_jjohnson@quicinc.com, 
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
 abel.vesa@linaro.org, jens.glathe@oldschoolsolutions.biz
In-Reply-To: <20241025123227.3527720-1-quic_sibis@quicinc.com>
References: <20241025123227.3527720-1-quic_sibis@quicinc.com>
Message-Id: <172986441294.1908121.6054999866989311557.robh@kernel.org>
Subject: Re: [PATCH V3 0/3] X1E001DE Snapdragon Devkit for Windows


On Fri, 25 Oct 2024 18:02:24 +0530, Sibi Sankar wrote:
> Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E001DE
> is the speed binned variant of X1E80100 that supports turbo boost up to
> 4.3 Ghz. The initial support includes the following:
> 
> -DSPs
> -Ethernet (RTL8125BG) over the pcie 5 instance.
> -NVme
> -Wifi
> -USB-C ports
> 
> V3:
> * Asked around and looked at the firmware, couldn't find a codename so
>   will keep it as DEVKIT. Will update it if someone from the community
>   finds something else.
> * Update type c roles as reported by ucsi. [Dmitry]
> * Update THUNDERCOMM to Thundercomm. [Dmitry]
> * Update regulator names and sort Order. [Dmitry]
> * Add x1e001DE devkit to the safe list.
> * Mark regulator-nmve as boot enabled.
> 
> 
> V2:
> * Fix Ghz -> GHz  [Jeff]
> * Pick up Ab tag from Rob.
> * Use Vendor in ADSP/CDSP firmware path [Dmitry]
> * Fix reserved gpios [Dmitry]
> * Only port0 supports DRD update the dt accordingly [Dmitry]
> 
> Sibi Sankar (3):
>   dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
>   firmware: qcom: uefisecapp: Allow X1E Devkit devices
>   arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   6 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  | 814 ++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c              |   1 +
>  4 files changed, 822 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> 
> --
> 2.34.1
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


New warnings running 'make CHECK_DTBS=y qcom/x1e001de-devkit.dtb' for 20241025123227.3527720-1-quic_sibis@quicinc.com:

arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#






