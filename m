Return-Path: <linux-arm-msm+bounces-33811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF5A998118
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA5211F25741
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7412B1BDA9F;
	Thu, 10 Oct 2024 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z3kNozI4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14C519D070
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 08:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550374; cv=none; b=izUsDDpMK2bQtE4qGzl9s/a4iGl8PI0yNqdqJNE1hCfX3MJn84emJzNX5tGQAdtWnQvY9n1pYnE+dF8p5SgrEtYnXT6sn6WoBDqdyTWCoyYBJdbWYIW9Yp3qINeCKHbR7uxQgz8lioFTtJCAN6t4CoGVUfOLs7OI22o36ySPWQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550374; c=relaxed/simple;
	bh=0kuuvx8S6hxYXc/Q2SEM7qWLako0NeQPxFPsHkxB69s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vwo2vddleyZU9d16H0X7FI8rrWFAhX5HQxrn7Le5n8YM+wCmW6c4Auofyit7k2jMmYlEWGJqYvmmNDfNGTVomtfIOjY06DovBcHlWqpy6hDoeZFhd/PX7htySHwjbEkweP31OjuKeO1kQOXhf4D1NoAPkKSZ7YUhbE5z8w7Oyao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z3kNozI4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so6044145e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 01:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728550370; x=1729155170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4gB+FHKjUtmOrTxqJNh1pOMw3FFxgDS/WvLLgffyczM=;
        b=z3kNozI4Axn5eRaMpmMWlpUrTT1W5Rs3V/3MtpgEeLXR/GIq3oSELpVJAx/RwQWgh3
         VbZ7uIPY8uPsQhibKbXsL+LEJENnfeR5Ko4fXV6FdH+g4XIZxGDMmJ9gZ+t6cspJhsib
         gBRVTKQb0XTjhGxGc4tRiQDyI2jw5eInnyZSQBdLeBHLtENIRDwfZ7gk/ISErzCyXFmX
         n81vMlypqLaCedLu/0q5p6H8IB/qtS9EaBj0y1RNbNs3Cac6e49ebEzZgpIIq/CTVrv/
         5BfhTdVfn5UcZn0+WxfGA9/eQDwrQR+pn8TJymgSqbXJFnEexEi5iBd76F3SAnmFHI71
         Hrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550370; x=1729155170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gB+FHKjUtmOrTxqJNh1pOMw3FFxgDS/WvLLgffyczM=;
        b=F/pjckaquN138BHT3KaZ0a3zzVZtxZgxPJ5pUis+F8xCC4OijWM+DTMu2ISo1ErfF6
         WbNbBsMyt4RSBBDT2Orw3AkkNDFUoez6J8AAKxDSTwCDTCOWJTk6IcGgy88AMQYHqNBF
         sPS47r4KtIkMtwfXf4FX4rcVYBUH1m91mHE6Ufw55wz8H2pSHcCzsXjzxaqYNawl2aMg
         Yy7wCTEeK7oaMF9IL65jjkvyOqfptSzR+TBimSnmJo9zD0X1kYrzkRQZcZKTtmGiE/EB
         ZMWpoHzETVAXGL+DfJQhs6joHkIvZvrF6Az3ggi7oPZxVxo7qRZ2CzBRlmIDK0FQVxZ9
         x50w==
X-Forwarded-Encrypted: i=1; AJvYcCWx5dFkXM07P55+vrqVk0l1U2Kp8OjggdZ+HNeyu8mcvxoHByymKf3uokK8PgRWu/1h8+FseXQmns1SUZQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YxKaLXQUedgrM2mODvngMzyPwE6bP86qyJ8C2p9mxDNhHdtWA52
	quibNt2Bn0DGsW4nmdjRP0PGxbKB3ifvCIU4VSQ9jEdEjnV+xekP9MC2AAunYUs=
X-Google-Smtp-Source: AGHT+IHF6MBLxr7Jsp2l5hDpG1f+RZEDPhjwpuRTU+QgJgiAT9795ytUe4ZI5bD7CxezWQIY1nBr0g==
X-Received: by 2002:a05:600c:1e10:b0:428:f0c2:ef4a with SMTP id 5b1f17b1804b1-430ccf1d7fdmr49634915e9.13.1728550370074;
        Thu, 10 Oct 2024 01:52:50 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-431182d7bddsm9333705e9.8.2024.10.10.01.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 01:52:49 -0700 (PDT)
Message-ID: <32bb0156-a820-402c-8076-630e5fb1bc8c@linaro.org>
Date: Thu, 10 Oct 2024 09:52:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: sdm845: add missing soundwire runtime stream
 alloc
To: Alexey Klimov <alexey.klimov@linaro.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: stable@vger.kernel.org, broonie@kernel.org, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org
References: <20241009213922.999355-1-alexey.klimov@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20241009213922.999355-1-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/10/2024 22:39, Alexey Klimov wrote:
> During the migration of Soundwire runtime stream allocation from
> the Qualcomm Soundwire controller to SoC's soundcard drivers the sdm845
> soundcard was forgotten.
> 
> At this point any playback attempt or audio daemon startup, for instance
> on sdm845-db845c (Qualcomm RB3 board), will result in stream pointer
> NULL dereference:
> 
>   Unable to handle kernel NULL pointer dereference at virtual
>   address 0000000000000020
>   Mem abort info:
>     ESR = 0x0000000096000004
>     EC = 0x25: DABT (current EL), IL = 32 bits
>     SET = 0, FnV = 0
>     EA = 0, S1PTW = 0
>     FSC = 0x04: level 0 translation fault
>   Data abort info:
>     ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>     CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>     GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>   user pgtable: 4k pages, 48-bit VAs, pgdp=0000000101ecf000
>   [0000000000000020] pgd=0000000000000000, p4d=0000000000000000
>   Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>   Modules linked in: ...
>   CPU: 5 UID: 0 PID: 1198 Comm: aplay
>   Not tainted 6.12.0-rc2-qcomlt-arm64-00059-g9d78f315a362-dirty #18
>   Hardware name: Thundercomm Dragonboard 845c (DT)
>   pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   pc : sdw_stream_add_slave+0x44/0x380 [soundwire_bus]
>   lr : sdw_stream_add_slave+0x44/0x380 [soundwire_bus]
>   sp : ffff80008a2035c0
>   x29: ffff80008a2035c0 x28: ffff80008a203978 x27: 0000000000000000
>   x26: 00000000000000c0 x25: 0000000000000000 x24: ffff1676025f4800
>   x23: ffff167600ff1cb8 x22: ffff167600ff1c98 x21: 0000000000000003
>   x20: ffff167607316000 x19: ffff167604e64e80 x18: 0000000000000000
>   x17: 0000000000000000 x16: ffffcec265074160 x15: 0000000000000000
>   x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>   x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
>   x8 : 0000000000000000 x7 : 0000000000000000 x6 : ffff167600ff1cec
>   x5 : ffffcec22cfa2010 x4 : 0000000000000000 x3 : 0000000000000003
>   x2 : ffff167613f836c0 x1 : 0000000000000000 x0 : ffff16761feb60b8
>   Call trace:
>    sdw_stream_add_slave+0x44/0x380 [soundwire_bus]
>    wsa881x_hw_params+0x68/0x80 [snd_soc_wsa881x]
>    snd_soc_dai_hw_params+0x3c/0xa4
>    __soc_pcm_hw_params+0x230/0x660
>    dpcm_be_dai_hw_params+0x1d0/0x3f8
>    dpcm_fe_dai_hw_params+0x98/0x268
>    snd_pcm_hw_params+0x124/0x460
>    snd_pcm_common_ioctl+0x998/0x16e8
>    snd_pcm_ioctl+0x34/0x58
>    __arm64_sys_ioctl+0xac/0xf8
>    invoke_syscall+0x48/0x104
>    el0_svc_common.constprop.0+0x40/0xe0
>    do_el0_svc+0x1c/0x28
>    el0_svc+0x34/0xe0
>    el0t_64_sync_handler+0x120/0x12c
>    el0t_64_sync+0x190/0x194
>   Code: aa0403fb f9418400 9100e000 9400102f (f8420f22)
>   ---[ end trace 0000000000000000 ]---
> 
> 0000000000006108 <sdw_stream_add_slave>:
>      6108:       d503233f        paciasp
>      610c:       a9b97bfd        stp     x29, x30, [sp, #-112]!
>      6110:       910003fd        mov     x29, sp
>      6114:       a90153f3        stp     x19, x20, [sp, #16]
>      6118:       a9025bf5        stp     x21, x22, [sp, #32]
>      611c:       aa0103f6        mov     x22, x1
>      6120:       2a0303f5        mov     w21, w3
>      6124:       a90363f7        stp     x23, x24, [sp, #48]
>      6128:       aa0003f8        mov     x24, x0
>      612c:       aa0203f7        mov     x23, x2
>      6130:       a9046bf9        stp     x25, x26, [sp, #64]
>      6134:       aa0403f9        mov     x25, x4        <-- x4 copied to x25
>      6138:       a90573fb        stp     x27, x28, [sp, #80]
>      613c:       aa0403fb        mov     x27, x4
>      6140:       f9418400        ldr     x0, [x0, #776]
>      6144:       9100e000        add     x0, x0, #0x38
>      6148:       94000000        bl      0 <mutex_lock>
>      614c:       f8420f22        ldr     x2, [x25, #32]!  <-- offset 0x44
>      ^^^
> This is 0x6108 + offset 0x44 from the beginning of sdw_stream_add_slave()
> where data abort happens.
> wsa881x_hw_params() is called with stream = NULL and passes it further
> in register x4 (5th argument) to sdw_stream_add_slave() without any checks.
> Value from x4 is copied to x25 and finally it aborts on trying to load
> a value from address in x25 plus offset 32 (in dec) which corresponds
> to master_list member in struct sdw_stream_runtime:
> 
> struct sdw_stream_runtime {
>          const char  *              name;	/*     0     8 */
>          struct sdw_stream_params   params;	/*     8    12 */
>          enum sdw_stream_state      state;	/*    20     4 */
>          enum sdw_stream_type       type;	/*    24     4 */
>          /* XXX 4 bytes hole, try to pack */
>   here-> struct list_head           master_list;	/*    32    16 */
>          int                        m_rt_count;	/*    48     4 */
>          /* size: 56, cachelines: 1, members: 6 */
>          /* sum members: 48, holes: 1, sum holes: 4 */
>          /* padding: 4 */
>          /* last cacheline: 56 bytes */
> 
> Fix this by adding required calls to qcom_snd_sdw_startup() and
> sdw_release_stream() to startup and shutdown routines which restores
> the previous correct behaviour when ->set_stream() method is called to
> set a valid stream runtime pointer on playback startup.
> 
> Reproduced and then fix was tested on db845c RB3 board.
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: stable@vger.kernel.org
> Fixes: 15c7fab0e047 ("ASoC: qcom: Move Soundwire runtime stream alloc to soundcards")
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

thanks for fixing this,


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
> ---
>   sound/soc/qcom/sdm845.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 75701546b6ea..a479d7e5b7fb 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -15,6 +15,7 @@
>   #include <uapi/linux/input-event-codes.h>
>   #include "common.h"
>   #include "qdsp6/q6afe.h"
> +#include "sdw.h"
>   #include "../codecs/rt5663.h"
>   
>   #define DRIVER_NAME	"sdm845"
> @@ -416,7 +417,7 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
>   		pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
>   		break;
>   	}
> -	return 0;
> +	return qcom_snd_sdw_startup(substream);
>   }
>   
>   static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
> @@ -425,6 +426,7 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
>   	struct snd_soc_card *card = rtd->card;
>   	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(card);
>   	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
>   
>   	switch (cpu_dai->id) {
>   	case PRIMARY_MI2S_RX:
> @@ -463,6 +465,9 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
>   		pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
>   		break;
>   	}
> +
> +	data->sruntime[cpu_dai->id] = NULL;
> +	sdw_release_stream(sruntime);
>   }
>   
>   static int sdm845_snd_prepare(struct snd_pcm_substream *substream)

