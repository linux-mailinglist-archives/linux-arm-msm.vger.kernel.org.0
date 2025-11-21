Return-Path: <linux-arm-msm+bounces-82761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE32C76C65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 01:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 762E1208DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 00:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3F5247289;
	Fri, 21 Nov 2025 00:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="u0pinqtH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8023F22688C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 00:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763684884; cv=none; b=u9sb5a4JuSb0YoiZcVYFQRz40ORb0P17EWDcN09YuB+whzjs26cyGduHWwpXcQIB9p+B03oAQIzHpiUDkHEDbS+bwMtGyAgqScxRZ7jYdIIgi1bjNaSIKTzH+rHePGnuCHe08E4xvGUvn0rFI2ic2SLOtCTrRaOCQR9Xx+RoAIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763684884; c=relaxed/simple;
	bh=iAtyAHeFXno+x3emC1dduNajG8biFIGO/mpNi/3NyWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T6INlt8oBFod6nDgqNm9EvVkNDi/d3njmgIY7J+xC3VP60ohCZ0IJE6GF1JGFZ2ShFoxy2zYjn6qsAfxJ8+D6Km68hpPmVMxzUtG/bEJfE76bQ9ub8uE5m1/Ube84eWRCMcIiDQFCoBvdofFiNVu2AD3yq+b4jo9RnpeKSbY7Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=u0pinqtH; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <3b5d9df5-934d-4591-8827-6c9573a6f7ba@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1763684880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsdQVZDTYPb+WJU5W+qBd4HHdK8qY/Whv5lgvrY3/f4=;
	b=u0pinqtH5K5gMsYy6NyVpNY8dBuXeK5wBOcc2uf8rR1UgTk27xhJcC4Hj3lRoUnQHyyesm
	XtKuphT7jjVztBw5mmcMZ9nsEyPEge4LHLnbmkUQLmEipQwAeeARmAV3+Zv8F8MtMQR88H
	GNm3VkgBHJQ34FpknGh5YM4A8fMJNFGWMepFqY8hmb0xGyu7BY2z+T5AwQ2baE3G+EwjI5
	xuYD3tS3H1InSop+P0eI4NkXDdZy+A6VrV0ubA2Na1REKSrjDr+4HGe0jKa6mFVVoXOV5O
	5qXieNcr64wSjFk/5s5DFjfb8eXE5bpDolBEKQ9+bAtF9O9D8BpiY3XdQPnwqA==
Date: Thu, 20 Nov 2025 21:27:46 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
 Mika Westerberg <westeri@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 11/12/25 10:55 AM, Bartosz Golaszewski wrote:
> ---
> Bartosz Golaszewski (10):
>        string: provide strends()
>        gpiolib: define GPIOD_FLAG_SHARED
>        gpiolib: implement low-level, shared GPIO support
>        gpio: shared-proxy: implement the shared GPIO proxy driver
>        gpiolib: support shared GPIOs in core subsystem code
>        gpio: provide gpiod_is_shared()
>        arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
>        ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
>        ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
>        regulator: make the subsystem aware of shared GPIOs

this seems to actually have caused a regression for me, audio does not 
initialize anymore on hamoa due to EBUSY since upgrading 
from next-20251114 to next-20251118 or next-20251120:

[   11.748781] platform 
6800000.remoteproc:glink-edge:gpr:service@1:dais: Adding to iommu group 30
[   11.785864] wsa_macro 6aa0000.codec: using zero-initialized flat 
cache, this may cause unexpected behavior
[   11.796964] reset-gpio reset-gpio.0: error -EBUSY: Could not get 
reset gpios
[   11.796984] reset-gpio reset-gpio.0: probe with driver reset-gpio 
failed with error -16
[   11.894662] reset-gpio reset-gpio.1: error -EBUSY: Could not get 
reset gpios
[   11.894676] reset-gpio reset-gpio.1: probe with driver reset-gpio 
failed with error -16
[   12.006938] wcd938x_codec audio-codec: bound sdw:2:0:0217:010d:00:4 
(ops wcd_sdw_component_ops [snd_soc_wcd_common])
[   12.006964] wcd938x_codec audio-codec: bound sdw:3:0:0217:010d:00:3 
(ops wcd_sdw_component_ops [snd_soc_wcd_common])
[   15.424657] qcom-soundwire 6ab0000.soundwire: qcom_swrm_irq_handler: 
SWR CMD error, fifo status 0x4e00c00f, flushing fifo
[   21.994354] qcom-soundwire 6ab0000.soundwire: qcom_swrm_irq_handler: 
SWR CMD error, fifo status 0xe00c000, flushing fifo
[   21.996001] qcom-soundwire 6b10000.soundwire: qcom_swrm_irq_handler: 
SWR CMD error, fifo status 0x4e00c00f, flushing fifo
[   21.996239] platform sound: deferred probe pending: snd-x1e80100: WSA 
Playback: codec dai not found
[   21.996248] soundwire sdw:4:0:0217:0204:00:0: deferred probe pending: 
wsa884x-codec: Failed to get reset
[   21.996250] soundwire sdw:4:0:0217:0204:00:1: deferred probe pending: 
wsa884x-codec: Failed to get reset
[   21.996251] soundwire sdw:1:0:0217:0204:00:0: deferred probe pending: 
wsa884x-codec: Failed to get reset
[   21.996253] soundwire sdw:1:0:0217:0204:00:1: deferred probe pending: 
wsa884x-codec: Failed to get reset

gpio_shared_proxy, reset_gpio, pinctrl_sm8550_lpass_lpi are all built as 
modules and were autoloaded fine.

This is wsa884x (not wsa881x nor wsa883x), failing in 
devm_reset_control_get_optional_shared..


Thanks,
~val


