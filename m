Return-Path: <linux-arm-msm+bounces-32342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0816984D78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 00:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B58A1F230DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 22:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2773E143725;
	Tue, 24 Sep 2024 22:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fF9zjqOb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE6184A2C;
	Tue, 24 Sep 2024 22:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727216144; cv=none; b=OpMm4aKP/4Ue/QbFbVqKIoMArg2MnYgUEtpYiW2SpyYUU3rK/0XEOOGZyEL639KncMPIBu/QOwv3nnLiAi9z57h1qvV8esn0rp5Y3kPW0sZ4mCcJ1If0fDSBVgIvU7+sDo9LFbtCY9zd+zNMZ/wVkRtFMSrq2EEhe1uGusod+vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727216144; c=relaxed/simple;
	bh=FpEg5BXjLYo20uODZkFQEaOnRAyUC33WchWm433FGhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoMpQXdg/UpOcG7aYzNZgqFjuKCO7lwkRJLcxDPvTxznX1R5QlsIqglB7Pxg/sgRLklNXxl0m472btCQPvkG7DVHAzQkRG6Ll1X/gRFj18300OeYYsJANS92yDI0ERI62Ff0Xa2zGyOk9hMOm+SHF8mDOXwyVFhoW01EN7b+A2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fF9zjqOb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9879CC4CEC4;
	Tue, 24 Sep 2024 22:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727216143;
	bh=FpEg5BXjLYo20uODZkFQEaOnRAyUC33WchWm433FGhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fF9zjqObnoYv61dfMCQtOmZoMfzIZKjfsVEfZJ1U3e5bBCOPO/J6Xj2igHSrTZ3e7
	 UGnjhMKmO5SWlyqHOC/rV4951PL1Eko33DbLMdsbaVUJhY1Una9d//biuL0W+91isE
	 RHLK0yYGgRHct2MI3l2ruw083Lw0SSKpa3V7a992QN5daBrBSTjR0QgsG8nj3SvVlV
	 0/KwDUrpQVT7rd8SclJSMLIrcsX6D/rP/CwqlVgwBGL5zaw7Yxcd/rzERRHJzkch+r
	 JR1a1Nr0ry2pnCACtbPf0RkoqoAcAARRDpHiP0uTXi415OK/mmTyguffN20zOGtvWF
	 toU/ISekOBVzA==
Date: Wed, 25 Sep 2024 00:15:40 +0200
From: Bjorn Andersson <andersson@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Peter de Kraker <peterdekraker@umito.nl>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
Message-ID: <effqouni7fmzpag6g6e2t6uq4tltjiufynjhym3rmrpylezydt@ipqglqizisqr>
References: <20240921163455.12577-1-alex.vinarskis@gmail.com>
 <20240921163455.12577-4-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240921163455.12577-4-alex.vinarskis@gmail.com>

On Sat, Sep 21, 2024 at 06:33:33PM GMT, Aleksandrs Vinarskis wrote:
> Initial support for Dell XPS 9345 13" 2024 (Tributo) based on X1E80100.

Very nice.

> 
> Working:
> * Touchpad
> * Keyboard (only post suspend&resume, i2c-hid patch WIP)

Hitting scroll lock/unlock on a USB keyboard once fixes this issue for
me as well. Looking forward to your WIP patch.

> * eDP, with brightness control
> * NVME
> * USB Type-C ports in USB2/USB3 (one orientation)
> * WiFi
> * GPU/aDSP/cDSP firmware loading (requires binaries from Windows)
> * Lid switch
> * Sleep/suspend, nothing visibly broken on resume
> 
> Not working:
> * Speakers (WIP, pin guessing, x4 WSA8845)
> * Microphones (WIP, pin guessing)
> * Fingerprint Reader (WIP, USB MP with ptn3222)
> * USB as DP/USB3 (WIP, PS8830 based)
> * Camera
> * Battery Info

Adding the ADSP firmware gave me both battery status and info, but
perhaps you're hitting the previously reported issue in pmic_glink?

> 
> Should be working, but cannot be tested due to lack of hw:
> * Higher res OLED, higher res IPS panels

I tried closing the lid and opening it again (which I believe is what
was reported to not work on the other devices), and that seems to work
fine.

> * Touchscreen

See below

> 
[..]
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
[..]
> +&i2c8 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchscreen@0 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x0>;

Make this 0x10 (and update the unit address accordingly) and we have
touchscreen.
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&ts0_default>;
> +		pinctrl-names = "default";
> +	};
> +};
[..]
> +&mdss_dp3 {
> +	compatible = "qcom,x1e80100-dp";

This isn't needed, right?

[..]
> +&uart21 {

This fails to probe, because we don't have an alias for it, which in
turn prevents sync_state on interconnects...

> +	compatible = "qcom,geni-debug-uart";
> +	status = "okay";
> +};
> +

Regards,
Bjorn

