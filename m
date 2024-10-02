Return-Path: <linux-arm-msm+bounces-32921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B08798CBBB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 05:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D0441C22034
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 03:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEA64F215;
	Wed,  2 Oct 2024 03:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDvJOAnw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21054C627;
	Wed,  2 Oct 2024 03:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727841131; cv=none; b=BKpv5/aF8ZDpgzMq2uvJnR+1n6STSrUtMlpoizeS3cALgS7PQ+um7WeMbNQf9if4fEh68QcrSi+7bKv9jH1WCa/mexIyG8ueJJA2WI6JVoc6YxXtcHh0JVVjzkNmkSY39YRXpw624o6k41JqCEiQhr6SLOrd0Yn0n7Dy0xROnCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727841131; c=relaxed/simple;
	bh=JapzRJQo/dhYIW9LtznuJD1ywFRN32NrD4oyGeTZRDM=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Jr6BJqjNIA2R/u2Fw/vJBT0ZdMm9P31b0Z8AIYVUg+/nqKEh5zdIRNfMtnVS3q48xAFj+085OY/kJhr1qL1axwN5vjcYGUaGrjIjPtA+qKlvmiQmP0rJ9tEMvOYsCm6JxoqBkV7HA6TJf41Ju1owkhfzP0m+Dc8i8LOVj9aZsM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDvJOAnw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0384C4CECE;
	Wed,  2 Oct 2024 03:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727841130;
	bh=JapzRJQo/dhYIW9LtznuJD1ywFRN32NrD4oyGeTZRDM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=gDvJOAnwo2Fj3T9/SgUzpkIr/jydVEH69C39dZyapfftpiH6AjltLlvD+eE74yZcN
	 rD1RlqjcqRKRuBPgoL45VAKYFP7Gp9WYaarrRWHbqhUSH8sLp4Xd3Fz2rBLgRz9bCm
	 LRKXsEYloqhgOj/wkDdpIlVXM4HgIOZLzkykRE/xRLsL3nd6HShe9/1AJkRhC0c5yG
	 wbUABdNCu+mDQedN8JF+SqY3t8jKOLIgzwnfcAwhG35pF0jJAuOHujSptsxdv4+iwi
	 5zrmu5+d6+CAEruX2k0Sc+GecpR5I9arX/LBU1idRJxUQh3aQSTcDzibCDNY7kGknl
	 Z4Ic8bZ4YFWvw==
Date: Tue, 01 Oct 2024 22:52:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: devicetree@vger.kernel.org, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org, 
 lgirdwood@gmail.com, srinivas.kandagatla@linaro.org, 
 konrad.dybcio@linaro.org, elder@linaro.org, dmitry.baryshkov@linaro.org, 
 conor+dt@kernel.org, andersson@kernel.org, broonie@kernel.org, 
 a39.skl@gmail.com, krzk+dt@kernel.org, bgoswami@quicinc.com, 
 linux-sound@vger.kernel.org, perex@perex.cz, caleb.connolly@linaro.org
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
Message-Id: <172784025903.526797.17199774017741034406.robh@kernel.org>
Subject: Re: [PATCH v2 0/7] qrb4210-rb2: add HDMI audio playback support


On Wed, 02 Oct 2024 03:20:08 +0100, Alexey Klimov wrote:
> Rebased on top of -master, tested.
> 
> Changes since v1:
> -- removed handling of MI2S clock in sm2450_snd_shutdown(): setting clock rate
>    and disabling it causes audio delay on playback start;
> -- removed empty sound { } node from sm6115.dtsi as suggested by Krzysztof;
> -- moved lpi_i2s2_active pins description to qrb423310 board-specific file
>    as suggested by Dmitry Baryshkov;
> -- moved q6asmdai DAIs to apr soc node as suggested by Konrad Dybcio;
> -- lpass_tlmm is not disabled;
> -- lpass_tlmm node moved to sm4250.dtsi;
> -- kept MultiMedia DAIs as is, without them the sound card driver doesn't initialise;
> -- added some reviewed-by tags.
> 
> This series still keeps "qcom,qrb4210-rb2-sndcard" for sm8250 soundcard. As per
> off the list discussion with Srini it was suggested to have it since in future it
> may be required to add clocks, workarounds, quirks, model-specific things based on
> this compatible. The same as for RB5 compatible in sm8250 snd driver.
> 
> This focuses on HDMI audio playback only hence there are no soundwire and dmic pins,
> for instance. The work to enable playback via wcd+wsa8815 amplifier is in progress (it works)
> and one of the routes is to merge such two patchsets together.
> 
> Link to prev series:
> https://lore.kernel.org/linux-sound/20240628010715.438471-1-alexey.klimov@linaro.org/
> 
> Alexey Klimov (7):
>   ASoC: dt-bindings: qcom,sm8250: add qrb4210-rb2-sndcard
>   ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
>   ASoC: qcom: sm8250: add handling of secondary MI2S clock
>   arm64: dts: qcom: sm6115: add apr and its services
>   arm64: dts: qcom: sm4250: add LPASS LPI pin controller
>   arm64: dts: qcom: qrb4210-rb2: add description of lpi_i2s2 pins
>   arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support
> 
>  .../bindings/sound/qcom,sm8250.yaml           |  1 +
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts      | 91 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm4250.dtsi          | 16 ++++
>  arch/arm64/boot/dts/qcom/sm6115.dtsi          | 72 +++++++++++++++
>  sound/soc/qcom/sm8250.c                       |  9 ++
>  5 files changed, 189 insertions(+)
> 
> --
> 2.45.2
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


New warnings running 'make CHECK_DTBS=y qcom/qrb4210-rb2.dtb' for 20241002022015.867031-1-alexey.klimov@linaro.org:

arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: pinctrl@a7c0000: lpi-i2s2-active-state: 'oneOf' conditional failed, one must be fixed:
	'pins' is a required property
	'function' is a required property
	Unevaluated properties are not allowed ('data-pins', 'ext-mclk1', 'sck-pin', 'ws-pins' were unexpected)
	'ext-mclk1', 'sck-pin' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml#






