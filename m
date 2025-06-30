Return-Path: <linux-arm-msm+bounces-63072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4721EAEDF67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 15:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DCEE1892C28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 13:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A848128A73D;
	Mon, 30 Jun 2025 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRiRcXya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F91218E97;
	Mon, 30 Jun 2025 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290952; cv=none; b=KqnH8TcBmDsIgo+9n3ib27aUEGR+To/el85nzpw4jdHmvuXEXtEGcC6O/m9/+l367mcLgxanz329t53hHlP560oZKauaM7N07oKzbzkBVmysu8O4L8hqTGwJGA/ksW5E9tCtDAEHZ6tMzi6lsEoDJi6xexdj+8VuKRBFK7e6AO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290952; c=relaxed/simple;
	bh=LMxWSRbeMrQ397sVPv5d6xYeYOJCN5ZVzbcON2O6348=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Cbv0LF9SCnH1T/P7wCecQ7ThSN7v+a26Cbpqj20lM1Asz26ORTWGoLyakX/yWCQb34MbSWDB4PW5rSrS4+PuoQ76JM92RWkRAY++xg9pYOrs+CJFUYr0VEyODLCgOGKzT2qtS6iL7wLrTksHiWS2bR1F4bKRZ4/dZrzluOsXbRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRiRcXya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBAB0C4CEE3;
	Mon, 30 Jun 2025 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751290952;
	bh=LMxWSRbeMrQ397sVPv5d6xYeYOJCN5ZVzbcON2O6348=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=lRiRcXyan/qB3kR6n8V3665F28+h28HRtiIEpU2h9cn8B1sxvI6uco8AO6C0UHSUR
	 51PH4oJ8JGilTrSGX4OLCPRDlYnuwwyALVrFWoXJoJiS0ymuh7twc20tO7znfs0bic
	 QmRJ6fZbnXdOcPbHvURsNSpAdxYPbGi9tMK4N7ChHR9VFR/Sp7UGs5lq49B3oxF+yF
	 h74x+wQByUuB8LuW2WPQcMOyoMPXoC4BIuK18sECJTEJP4EMqjk9TTs1pbQ5lEK6+a
	 buhwCrtcqDptJXR3GKqxdlfvXKN+oTaVkEy5zpxtmsVYX+t8cYW7y+l0jEcM0uj0fw
	 f+MdriNC9Ti0g==
Date: Mon, 30 Jun 2025 08:42:31 -0500
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
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>
To: Cristian Cozzolino <cristian_ci@protonmail.com>
In-Reply-To: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
References: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
Message-Id: <175129088384.2459095.6875987984505796019.robh@kernel.org>
Subject: Re: [PATCH v4 0/3] Add initial device tree for Billion Capture+


On Sun, 29 Jun 2025 08:44:36 +0200, Cristian Cozzolino wrote:
> Billion Capture+ is a handset using the MSM8953 SoC released in 2017
> and sold by Flipkart.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
> Changes in v4:
> - pick up tags (Rob);
> - Link to v3: https://lore.kernel.org/r/20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com
> 
> Changes in v3:
> - (patch 3/3): pick up tag (Konrad);
> - Link to v2: https://lore.kernel.org/r/20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com
> 
> Changes in v2:
> - (patch 3/3):
>   - add unit address and label to qseecom (Luca);
>   - reorder properties alphabetically in gpio-keys node (Konrad);
>   - fix hex values in reg address and size cells: from 0x00 to 0x0 (Konrad);
>   - add regulator-allow-set-load property to regulators supplying sdhc1/sdhc2.
> - Link to v1: https://lore.kernel.org/r/20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com
> 
> ---
> Cristian Cozzolino (3):
>       dt-bindings: vendor-prefixes: Add Flipkart
>       dt-bindings: arm: qcom: Add Billion Capture+
>       arm64: dts: qcom: msm8953: Add device tree for Billion Capture+
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 255 +++++++++++++++++++++
>  4 files changed, 259 insertions(+)
> ---
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> change-id: 20250620-rimob-initial-devicetree-da86a5bffc8b
> 
> Best regards,
> --
> Cristian Cozzolino <cristian_ci@protonmail.com>
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
 Base: using specified base-commit 0ff41df1cb268fc69e703a08a57ee14ae967d0ca

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com:

arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dtb: gpu@1c00000 (qcom,adreno-506.0): clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#






