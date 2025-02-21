Return-Path: <linux-arm-msm+bounces-48856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C3DA3F1A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 11:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B05D94229C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BDD205E05;
	Fri, 21 Feb 2025 10:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wlY7dJEi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D506E205E00
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740132917; cv=none; b=nuDVBiT678zJskGnnuEgN22fkmwAc3r21rw1wtenUdeFvyv3iOUjEU1wxaae0QPMQgfG0F6qekqGPy4rt2ee2jrqOmmC2CqwTTKXT/t4Usx6+9hCb+/EbaqNHZjpqYFkKAbSrSuU/BDKwf+aUEnFl9RanpAw26ME005I4eZ+dBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740132917; c=relaxed/simple;
	bh=UdcYjV22LJAtanzSNBkgkEhCCbJV4PqgUmZbYYZfH78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbMmPlKUzhjGFIxlJFNGGduEXJrGCEq68NH6c4+NGy7xPDSepobCjXS3gZGviqilhS/yvXo8sT4DW3D5FZe7XLauVA7PzidAziIAe+hOskDx+HBcWCN1t+nX2FedCJIOV0OUdP6ru/lUczJudH18CfHa4143myZYc3i1H985104=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wlY7dJEi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-439946a49e1so12073385e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 02:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740132913; x=1740737713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i87rotjO6zoXIGEp7j7IctCY9/qoavWizZ0RPKxAJoU=;
        b=wlY7dJEiFC1MWUMWTeI/GakHlLPoYi6H8wd85GepYwm7fR7lbDBP91KzJCH78jAK3D
         JDKHptco5BlagjdDG9jSo0lkXRniiPjt4RSXhW3Xv1WSXnR6rPWJ76Z8cXpcl446yby+
         7vUh5jEG/PdRd9A49/FC/yeNYY0np24sLUCeg6Aduolu9qStfW+7bwxBTwOOzxtKr+C7
         RB2MqrcKtlDdYBfjV17Byz9g7NRykTn6Zcj5MJYCseGrsQqUbyGbLUkIimRGwb8V0lOs
         x21wTF9trSNAtSnHjVqDhP5OyzvJbWpBFLwXdo/lT4zHUbGafGwOWf49KlQWTCBRXTP4
         NIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740132913; x=1740737713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i87rotjO6zoXIGEp7j7IctCY9/qoavWizZ0RPKxAJoU=;
        b=kSfv4AsAnFAmHqzYXyBSyFH1yQqdkWaLeMHHXtDPmosT4mbK8sthHJ9bqpED8GZcoc
         gkRB8J8Eeq0qttR7Io9O38zjhyqQ8VcXKceyrOavgxfDgw+oKmdsMy8TUoX3uk0MgsHU
         U7FcOFujEHkVgGWnv5SPTE+TXpRgkH9sYEltsp+m3nYtHD0SXrm7aFhfmJcstH/CMcPM
         ls3jLnCJP/xp9QIrYjVgQg2X8994FiJB/QeX8rU0Q8cVmk+dWJLBrsSTJ0EXzncEyMtw
         Fs10gMMzysVUfmLxeAgF6LJITQ7UAEL8uXDRiieWKMbZ89V47QyIypfgV6pzy/cexU9f
         QG7w==
X-Forwarded-Encrypted: i=1; AJvYcCUXwLI3dK8fF5l4XPDywteCeS1YK5w5WUUNYn7NEOG8L+qmMvALyti8U0xLuoH+Y0cT4qL2HKzJhsj9mmjI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9kUFGDaLA5TE0e8Gm5IxjOmLSmymA2+0ZkXsa8hyCihAy72VI
	7DfIn/gFzDbCAw5UCdes75VmwwulXrrf6WVafglb0eijnKv7lBwZdSSczobGmPM=
X-Gm-Gg: ASbGncuQhoi9/25If6JJB8Q8kuRiPV/YXBbW4noKbRpDqCeqHa1cidJMnXBk0GdbfXG
	hQyvP8ud/NKUXCVHa68qCXDDdoIeBM7sgH68XwfqZMbFYb1hdgHDpnwfhOQT9nu636A/NecE9LX
	eruF5i4/ANUwJBiFmFk+LmGinbDY7BGC/96WnqEgOS2EZaY6mDG2NIhPipenqYa3aqtPghf9J9I
	4BxbeeEscK51LDcqEbSkcar00sph7L+Ilp7Kc8ENz6ndpMgV0XDVyFR0fm/aj3/JSLFao/nXC6q
	73+BpDcV7VKkU8q2EGV+rYq5jDNmIxFiqUiaQCdFwOqW
X-Google-Smtp-Source: AGHT+IGs9NvKFIrKnXrzHMSGbBJ0oy+uXlJm086a7XejqQUgpF1zmN5RxP381nbAlt43bqejwAwrgQ==
X-Received: by 2002:a05:600c:354f:b0:439:6ab6:5d46 with SMTP id 5b1f17b1804b1-439ae21d210mr20795145e9.27.1740132913197;
        Fri, 21 Feb 2025 02:15:13 -0800 (PST)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38f64b0f565sm4215318f8f.51.2025.02.21.02.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 02:15:12 -0800 (PST)
Message-ID: <b359e44c-fb9f-412c-bc3b-f0a129d0c34e@linaro.org>
Date: Fri, 21 Feb 2025 10:15:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] ASoC: q6apm: fix under runs and fragment sizes
To: Johan Hovold <johan@kernel.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
 <Z7dog3cWe4BroZdT@hovoldconsulting.com>
 <Z7g5c0_vJNpN9fI4@hovoldconsulting.com>
 <Z7hAfGHvdeWpZ4Y3@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Z7hAfGHvdeWpZ4Y3@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/02/2025 08:59, Johan Hovold wrote:
> On Fri, Feb 21, 2025 at 09:29:39AM +0100, Johan Hovold wrote:
>> On Thu, Feb 20, 2025 at 06:38:11PM +0100, Johan Hovold wrote:
>>> On Thu, Feb 20, 2025 at 04:28:42PM +0000, Srinivas Kandagatla wrote:
>>
>>>> On Qualcomm Audioreach setup, some of the audio artifacts are seen in
>>>> both recording and playback. These patches fix issues by
>>>> 1. Adjusting the fragment size that dsp can service.
>>>> 2. schedule available playback buffers in time for dsp to not hit under runs
>>>> 3. remove some of the manual calculations done to get hardware pointer.
>>>>
>>>> With these patches, am able to see Audio quality improvements.
>>>>
>>>> Any testing would be appreciated.
>>>
>>> With this series, the choppy (robotic) capture when using pipewire
>>> appears to be fixed (pulseaudio worked before).
>>>
>>> Playback is still choppy (heavily distorted), though, and now it also
>>> appears to be too slow.
>>>
>>> I tested using pw-record and pw-play (and mpv) on the T14s (6.14-rc3).
>>
>> Retested this morning and realised that playback is only choppy (and too
>> slow) while I have pavucontrol open. That would be nice to fix if
>> possible, but this is still a great improvement since pipewire was not
>> usable at all before these changes.
>>
>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Hmm... Scratch that.
> 
> This series apparently breaks pulseaudio instead.
> 
Thanks for trying out pulseaudio, I will try to reproduce this with my t14.
--srini
> Too fast playback on the T14s with mpv, and after I stopped it I wasn't
> able too play any audio anymore. And systemd complains about a stop job
> running for long when rebooting. Similar issues on the X13s.
> 
> Johan

