Return-Path: <linux-arm-msm+bounces-78629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF9CC027EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 18:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B1CA3AF608
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 16:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6095133CEB1;
	Thu, 23 Oct 2025 16:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkdpnOlV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183B241760;
	Thu, 23 Oct 2025 16:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761238199; cv=none; b=RRzFCx3TTmSZ5pg6K9zAxw/V4akC17vF5SQZhGYjFQsCj+HuAZVtnuQdSL4/mFfvEXkGaLSdaRB4jA5K1Qlbxeqmc7SpfjIku9Vt5J7qu4OAQ4HrDh9DU9g1HsXDu+V8jaPKe0vzlaS2IqRngq92FsNso2YuRavZvJGUgpXMqHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761238199; c=relaxed/simple;
	bh=Sv5ZTJIc8mdOyFyYEUpoBFZA3FTMtAHYeE6VxCWxjyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRSpelV4nx1HbEgcoNV5nPFV9XNsfDWrTD2JHeco4WDF3ycRuxEg3hfSuO8+QKixyMuHj4g7Oj64s97wg0UOiFFeXDauMubR4Y2GhcuEWep1FppiSX/FijikqnZPWjwAiDVATehuaK6sNhjWSjTUTwgDe+c6koGE1UxTRZoXYNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkdpnOlV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AADC4CEE7;
	Thu, 23 Oct 2025 16:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761238198;
	bh=Sv5ZTJIc8mdOyFyYEUpoBFZA3FTMtAHYeE6VxCWxjyU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fkdpnOlVfwsj074MXISpqiMtq9R0FJEHXd3jn71OpJZiFKooy+7N42nSSiTQ5A/KB
	 Y5xN9b8RSoz77cWgSxhCgybD0vvhydql69Sljnoo9VBik/lRghY7IZm3Qf7xWJbo7p
	 7AiVN8EqgPF7jv/kvkuxmB2ADWb6Qj+PlKbp4IN0M2hgRvvdmhREq7WWBlRX3bEt0y
	 qN+kPQTWe+lRnt/SRlWyKIzqIcDYoiTAsphhUPVMrJYYNwrM9Xs8XK2QCRAjA9v9bI
	 HWFA/hkweKvq8HQ++vqb+ehkOQc4UkbKCQ3kSv0XHRo4mkLtTNpnIff9qmDSzaJwQ9
	 4hp4zIIOTwIkg==
Message-ID: <affa81cd-6f44-4408-9b07-f635b00cfaa6@kernel.org>
Date: Thu, 23 Oct 2025 17:49:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] regmap: slimbus: fix bus_context pointer in regmap
 init calls
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
 gregkh@linuxfoundation.org, srini@kernel.org
Cc: rafael@kernel.org, dakr@kernel.org, make24@iscas.ac.cn, steev@kali.org,
 dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 abel.vesa@linaro.org, stable@vger.kernel.org
References: <20251022201013.1740211-1-alexey.klimov@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20251022201013.1740211-1-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/22/25 9:10 PM, Alexey Klimov wrote:
> Commit 4e65bda8273c ("ASoC: wcd934x: fix error handling in
> wcd934x_codec_parse_data()") revealed the problem in the slimbus regmap.
> That commit breaks audio playback, for instance, on sdm845 Thundercomm
> Dragonboard 845c board:
> 
>  Unable to handle kernel paging request at virtual address ffff8000847cbad4
>  ...
>  CPU: 5 UID: 0 PID: 776 Comm: aplay Not tainted 6.18.0-rc1-00028-g7ea30958b305 #11 PREEMPT
>  Hardware name: Thundercomm Dragonboard 845c (DT)
>  ...
>  Call trace:
>   slim_xfer_msg+0x24/0x1ac [slimbus] (P)
>   slim_read+0x48/0x74 [slimbus]
>   regmap_slimbus_read+0x18/0x24 [regmap_slimbus]
>   _regmap_raw_read+0xe8/0x174
>   _regmap_bus_read+0x44/0x80
>   _regmap_read+0x60/0xd8
>   _regmap_update_bits+0xf4/0x140
>   _regmap_select_page+0xa8/0x124
>   _regmap_raw_write_impl+0x3b8/0x65c
>   _regmap_bus_raw_write+0x60/0x80
>   _regmap_write+0x58/0xc0
>   regmap_write+0x4c/0x80
>   wcd934x_hw_params+0x494/0x8b8 [snd_soc_wcd934x]
>   snd_soc_dai_hw_params+0x3c/0x7c [snd_soc_core]
>   __soc_pcm_hw_params+0x22c/0x634 [snd_soc_core]
>   dpcm_be_dai_hw_params+0x1d4/0x38c [snd_soc_core]
>   dpcm_fe_dai_hw_params+0x9c/0x17c [snd_soc_core]
>   snd_pcm_hw_params+0x124/0x464 [snd_pcm]
>   snd_pcm_common_ioctl+0x110c/0x1820 [snd_pcm]
>   snd_pcm_ioctl+0x34/0x4c [snd_pcm]
>   __arm64_sys_ioctl+0xac/0x104
>   invoke_syscall+0x48/0x104
>   el0_svc_common.constprop.0+0x40/0xe0
>   do_el0_svc+0x1c/0x28
>   el0_svc+0x34/0xec
>   el0t_64_sync_handler+0xa0/0xf0
>   el0t_64_sync+0x198/0x19c
> 
> The __devm_regmap_init_slimbus() started to be used instead of
> __regmap_init_slimbus() after the commit mentioned above and turns out
> the incorrect bus_context pointer (3rd argument) was used in
> __devm_regmap_init_slimbus(). It should be just "slimbus" (which is equal
> to &slimbus->dev). Correct it. The wcd934x codec seems to be the only or
> the first user of devm_regmap_init_slimbus() but we should fix it till
> the point where __devm_regmap_init_slimbus() was introduced therefore
> two "Fixes" tags.
> 
> While at this, also correct the same argument in __regmap_init_slimbus().
> 
> Fixes: 4e65bda8273c ("ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()")
> Fixes: 7d6f7fb053ad ("regmap: add SLIMbus support")
> Cc: stable@vger.kernel.org
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: Steev Klimaszewski <steev@kali.org>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
> 
> The patch/fix is for the current 6.18 development cycle
> since it fixes the regression introduced in 6.18.0-rc1.
> 
> Changes in v2:
>  - &slimbus->dev replaced with just "slimbus", no functional change
>  (as suggested by Dmitry);
>  - the same argument in __regmap_init_slimbus() was replaced with
>  "slimbus" (as suggested by Dmitry);
>  - reduced the backtrace log in the commit message (as suggested by Mark);
>  - corrected subject/title, few typos, added mention of non-managed init
>  func change, rephrased smth;
>  - added Reviewed-by tag from Abel.
> 
> Prev version: https://lore.kernel.org/linux-sound/20251020015557.1127542-1-alexey.klimov@linaro.org/
> 
>  drivers/base/regmap/regmap-slimbus.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

In case Mark if you want to pick this up,

Acked-by: Srinivas Kandagatla <srini@kernel.org>


> diff --git a/drivers/base/regmap/regmap-slimbus.c b/drivers/base/regmap/regmap-slimbus.c
> index 54eb7d227cf4..e523fae73004 100644
> --- a/drivers/base/regmap/regmap-slimbus.c
> +++ b/drivers/base/regmap/regmap-slimbus.c
> @@ -48,8 +48,7 @@ struct regmap *__regmap_init_slimbus(struct slim_device *slimbus,
>  	if (IS_ERR(bus))
>  		return ERR_CAST(bus);
>  
> -	return __regmap_init(&slimbus->dev, bus, &slimbus->dev, config,
> -			     lock_key, lock_name);
> +	return __regmap_init(&slimbus->dev, bus, slimbus, config, lock_key, lock_name);
>  }
>  EXPORT_SYMBOL_GPL(__regmap_init_slimbus);
>  
> @@ -63,8 +62,7 @@ struct regmap *__devm_regmap_init_slimbus(struct slim_device *slimbus,
>  	if (IS_ERR(bus))
>  		return ERR_CAST(bus);
>  
> -	return __devm_regmap_init(&slimbus->dev, bus, &slimbus, config,
> -				  lock_key, lock_name);
> +	return __devm_regmap_init(&slimbus->dev, bus, slimbus, config, lock_key, lock_name);
>  }
>  EXPORT_SYMBOL_GPL(__devm_regmap_init_slimbus);
>  


