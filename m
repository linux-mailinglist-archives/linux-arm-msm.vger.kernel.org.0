Return-Path: <linux-arm-msm+bounces-22114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 395529010FC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 11:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC610282ECB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 09:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAE114F9E6;
	Sat,  8 Jun 2024 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T7O3r78z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0220433AD
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jun 2024 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717837926; cv=none; b=l5GcdSUdOZp6gXlfCZt7iw1QFcORBU8SvwWVkFpuRuL4sjSIvJfS5yVYndAjeHsu1q/U8buMoNMmc9qBX92A254GekIp35u610OwOrYAhEDnNkyCyZP5LafDITL5yr7i2Gy/UeebSgSwPByCmG6PdwRvK7k7Aub/e86R5risniI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717837926; c=relaxed/simple;
	bh=eVab9dY4pSAIshPG2LfxmqFFlszomKgU2u38kNf82Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bf5AasljKd2zOJZa27AEBpGVv6WlRGKboer1o5AY/fSNpAGZqeB91KOUhnrLH6rppIThIn1EWI/AVJijfc9sqFl169acYufz6FFjHevxzsgK5PwUFVSm8+a92amyaTct4o+2qVncEKHDECzb91huWGmsN0lAybWLk8kmgaNgK3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T7O3r78z; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57a31d63b6bso4097487a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jun 2024 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717837923; x=1718442723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0UpUKnkWpc6C7/avXDFr5uyhktb5SegGLRIL+r2gqA=;
        b=T7O3r78zAc8j9TgX6xtD1GOnGZwtCSnXibSVUXWkCsPKKq2o/0z5Yvm4UZf5jsysi8
         vU0XKPhd8T7SK3MEUHrqlmrdE++ua1posch4Hnm/oTwavEXu+QCBd5z3kLl+Kn/dfpVx
         Ok1byU0gT4Xw5nxMvEb7A5jE17+PLx2g+bGt8Xo/D4mqJWSUnuLPwHQ2Dqkk+qJmxSWy
         ZhzXjuF2Ls8qYWRTG6aiwVuB9FcdbllilY96QClBOgcq4Z615Bd+jNEwYyP1fkHo+7ni
         jE7MMdXTzKeM0anQ1Vup9ll9rQDYGoQnEXb3c8BnrLe3JNxV9gj0oRw6vPKfoJgLpJJO
         X6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717837923; x=1718442723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0UpUKnkWpc6C7/avXDFr5uyhktb5SegGLRIL+r2gqA=;
        b=pboDo1pxb1RJb/ClJRfHVMXdcbgcmcEp+5V9yqdk0aXaICOCPDozxq0+fgLWfo9Su4
         eIdN3ZaKSL/csrxIYYj6KI2is1X59fiC9GnylizSuuAx9V6hPndYwME/kGYT6KgPlHDw
         s1n02mL5tQscr8kxwH1oX+0bDNo5s85hiIBIzIoBhIbqgQR4Ys6Ets8hYORPAlNTSa7e
         qgVP2+07SziNalxr2lK+hyQYWpA5xe5xPcIaJURjiQhtqmasVZLgmPrp/hqrR08lZ/OM
         nZc+KQJLJ7mKMvyqyklMXuk6CGA+5oyiZd9+Z4I7CBC+SrnwBih/h9tekoGfEIXLmum0
         k7SA==
X-Forwarded-Encrypted: i=1; AJvYcCX9UJgjpx1L6QQmamPpc7c1qx9DOLq382za5LmauJ2YZKt/pwp/sRqRO+PiiTOaIaUn+v/mztUWKy60x9N1jNE9u/5mVs2UtEbhrSgJeQ==
X-Gm-Message-State: AOJu0YzJmKy6k5kSePAiW8BtORNCvhWHCmRwuNzdBi+Y2finqh7zdpnd
	5n+D9J980nopm0PUU2P4JAfSmGPmawL3Bw2h9QXpbQEbHlz14kKUYepBk2HsPww=
X-Google-Smtp-Source: AGHT+IGgJ9P7gtdKHjyuziQT+ntOGPCdrCq5wKDE9BsBfE7IbIX651xKkM9jSh5hxO3HmLkhGM90xw==
X-Received: by 2002:a50:8714:0:b0:57c:6c98:b622 with SMTP id 4fb4d7f45d1cf-57c6c98b85amr620690a12.38.1717837922899;
        Sat, 08 Jun 2024 02:12:02 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-57aae20238asm3998372a12.73.2024.06.08.02.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jun 2024 02:12:02 -0700 (PDT)
Message-ID: <3ea05a12-27a8-46df-9fb3-28501404a399@linaro.org>
Date: Sat, 8 Jun 2024 10:12:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] ASoC: qcom: display port changes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
 <i6jwqycgywrq42u4km6pjppgvvhsbvuh7m6mzyqy2qcge32ihy@n3lrowkyouv2>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <i6jwqycgywrq42u4km6pjppgvvhsbvuh7m6mzyqy2qcge32ihy@n3lrowkyouv2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Dmitry for testing this out.

On 08/06/2024 03:23, Dmitry Baryshkov wrote:
> On Thu, Jun 06, 2024 at 11:49:18AM +0100, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> This patchset adds support for.
>> 	1. parse Display Port module tokens from ASoC topology
>> 	2. add support to DP/HDMI Jack events.
>> 	3. fixes a typo in function name in sm8250
>>
>> Verified these patches on X13s along with changes to tplg in
>> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
>> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
>>
>> x1e80100 is verified by Krzysztof with his changes in tplg
>>
>> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/merge_requests/7/commits
>>
>> Thanks,
>> Srini
>>
> 
> I have been testing this patchset on X13s, switching between speakers,
> connected and disconnected DP output.
> 

This series changed the Jack event names by removing HDMI string from it 
as suggested, did you update the UCM to reflect this?
I have pushed changes required to 
https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp


Can you also try to  clean the asound.state restart the pipewire.

> - Once the DSP got into the state, where I could not further get it to
>    work until the reboot:
> 
> rohan pipewire[1749]: spa.alsa: set_hw_params: Invalid argument
> rohan pipewire[1749]: pw.node: (alsa_output.platform-sound.HiFi__hw_SC8280XPLENOVOX_1__sink-48) suspended -> error (Start error: Invalid argument)
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare Graph -22
> rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on WSA_CODEC_DMA_RX_0: -22
> rohan pipewire[1749]: spa.alsa: set_hw_params: Invalid argument
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare Graph -22
> rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on WSA_CODEC_DMA_RX_0: -22
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> 
> 
> - Once in a while during startup PipeWire will try opening the
>    incorrect DAI and then fail with:
> 
> rohan kernel: hdmi-audio-codec hdmi-audio-codec.8.auto: ASoC: error at snd_soc_dai_hw_params on i2s-hifi: -22
> rohan kernel: hdmi-audio-codec hdmi-audio-codec.8.auto: ASoC: error at snd_soc_dai_hw_params on i2s-hifi: -22
> 
>    I think this happens if previously I have selected DP as an output,
>    then closed gnome session, unplugged the cable and tried logging in
>    again.
> 
> Generally, it looks like even though the Jack is reporting
> 'unplugged', sound daemon still can switch to to the disabled output
I think this is to do with ucm changes requried for new jack name.

> (or the audio card can be left in the stale state).  In case of DP
> this frequently results in audio daemon or DSP failures.
> 
> So, the DP implementation needs to be made more robust, so that if
> DP output gets selected when the cable is unplugged, the driver will not
> attempt to configure the DSP.

I have tested this with

kernel: 
https://git.codelinaro.org/srinivas.kandagatla/linux/-/tree/dp/sc8280xp-6.10-rc1?ref_type=heads
ucm: https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
tplg: 
https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads


with the above on my x13s, I can properly do switching between dp0,dp1 
and speakers with no issues.

Can you try them?

thanks,
Srini

> 

