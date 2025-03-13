Return-Path: <linux-arm-msm+bounces-51330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3B7A604DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 23:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 740BC188FD48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 22:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDFC1F8AD7;
	Thu, 13 Mar 2025 22:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Np3p0fQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316301F03C7;
	Thu, 13 Mar 2025 22:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741906754; cv=none; b=GGECkrNKpmA1SH11PjXsBFX3G1iwIR7IwoYjQ7oj2iUO9YDVQBejTidnMQUj8b3tPRWb5z5Mcq9c3R3Zl9DtnyzL4YdBTk3drwR4aZIzgITW0AFYEpNblvcor41oz1xtDnE7g/o0/bEFfGO69IwS3CptSdEYRD+DKR1nT7JCa5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741906754; c=relaxed/simple;
	bh=Kguls8axKBoFrO5AjCFJKOoiclf1DanVRt6JAyteZ2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcVAn0ly8ABVkp67JzK3uxc4y5JP/nZfjWezsRxhO1IaC94Yc0/WZpnUqcAw4GD2fG+4UQiZ3VbU6yVhPd9+UNTNCu1oxh5wsfgDCytMhgBfkisTM74dBVM7BzQg26RvchaEW91IajFW9PXtQBf5WboG4Lo3MXX4X3t+g5ItkMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Np3p0fQU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f2f391864so869036f8f.3;
        Thu, 13 Mar 2025 15:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741906750; x=1742511550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yO5kyBpcT0BbdxDO5L56bH6b4vFcrtwYw7f0yDEAAbM=;
        b=Np3p0fQU8Kc44QhxBBwE5isK2G6SH645xuza6aTT5n778if/L83GCmswTVTr4xQAZI
         8funiuiy+foL1l79bhe7aoZPOkPjYmnq5NkLARmCeyIVzBFFrAyoJ9D12qX6USv9JrEO
         LxPi5fFHZ1a1Vu2f/P/DpYDPIgNKPIQVBaZASTm5mxBzwa+N4CJfyFD7l20BE7geFy1z
         SRnLyfz8MGhw/XDHJ+OP0I0iUaeO4aAMIXFFDdATKP/cP2/pZ2NIdzxF1OG1n/ZtYPaP
         0UJOVMgqPlYAjPwDqHNNJk5Nnyjaf04+7+A94fwduIn1EGu9H3564H73RRxbVQCP0x4V
         O5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741906750; x=1742511550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yO5kyBpcT0BbdxDO5L56bH6b4vFcrtwYw7f0yDEAAbM=;
        b=qe/WEYFrs9n8uTrUeRgv/Vei0qCpWSFuKzrt5URwKy4UK6qTd+yHhb55gtciaBkWLr
         CjsEHjEbyCjnvq6gbQYg9Qjy+EfrmAMhOl4/zeXaMQn3W0uOr2S2CSUVBTw97WvD+7jG
         Hy/u1cwoWFpwLg8aRqNnZT22ZeG4x+fEo5FNTE9z5HSDH471hySwgLhtypfk4AVgWNX8
         o4JI21INvYXz/v+QtRrgWuT74OshY28v2FR256OIZ7lFW2YE8ZRhnX+uQsZN3BZ7RBBp
         c3+hjxL2j/IxXW0AmJFW4IqA1MU5swM+yyxqk50lvMouugmfXOLtH5z+KdUdKHGQoZOv
         0TFA==
X-Forwarded-Encrypted: i=1; AJvYcCWVR2tEN0E8W6iX+tozVN4qdrLHzSv1pTUAGFrKL7Gu0DJ5NhY6egDpwdRI49UgioiV727sbhLvtrONKqcQ@vger.kernel.org, AJvYcCX/C7WU7kCT8Tdg86Xs+plAlp+jMAmF3hvcnG0er3zdvjKIS3cn1S1M9Z1O2F0MgGZ9qsLZSYbxrAWSkpyf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxdh9ZmNf/agNANi3e26xqcVFUVQZE4zGDQyNFpSffcaTbJyrx
	Z7WOjMOkBhvmGAUyrIM6aU8bXzJ53kyBfEiFIqXov4lvGebCK8Q=
X-Gm-Gg: ASbGnctowXzFWDN/+IL8SBKA6lJlQJCE/kHNKQeXSsqKctJJyYzUSnfECaox7AeFeHa
	r/hzGKohWCswJAUydP/RBsUQSU//0K9dKh4eL5ZxxzgafKRryrVqfTdl8j2ztoK0dz3EaZqaxhr
	w312cA2lEZKqLBqBwTnDXxDuarM65SOwcUJboZ8ERuzQGeAvzh9dSUAdFtnr30fWe1LbCGk2thv
	bomkFwo6e7fXTcfQ8lBYjXNO2VKdKFDmwrTHyCukBUNZcH20YXTyTr7yK0cLcFVKckFnW6EDNNF
	j6VTa5DnIKOs4jvLqgex6pt19oxOodnMwUbGu4OgCGOsC9nWF1DBcSD2aT4bOf5RkyYepIE15uV
	AX2v2j35MfdM=
X-Google-Smtp-Source: AGHT+IEEcr5tLlHRCwRgIm81YAO79o0KXmqFBuZsB1QvlKMuOiqa3CoD7fSJfWVzyXEVc8D0DoWmIQ==
X-Received: by 2002:a05:6000:1865:b0:391:275a:273f with SMTP id ffacd0b85a97d-3971d1349a3mr141997f8f.4.1741906750151;
        Thu, 13 Mar 2025 15:59:10 -0700 (PDT)
Received: from [192.168.20.171] (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a3dsm3503210f8f.74.2025.03.13.15.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 15:59:09 -0700 (PDT)
Message-ID: <990c38f8-0e7a-4e06-afa7-41d7c63bbc1e@gmail.com>
Date: Thu, 13 Mar 2025 23:59:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
To: Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
References: <20250311234109.136510-1-alex.vinarskis@gmail.com>
 <CAEvtbusre2PUwNiD42d-xTCVf4dV0npN-5UxxwrjriVOsbj0Fg@mail.gmail.com>
Content-Language: en-US
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <CAEvtbusre2PUwNiD42d-xTCVf4dV0npN-5UxxwrjriVOsbj0Fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/12/25 22:16, Stefan Schmidt wrote:
> Hello Aleksandrs,
> 
> On Wed, 12 Mar 2025 at 00:41, Aleksandrs Vinarskis
> <alex.vinarskis@gmail.com> wrote:
>>
>> Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
>> to non-transparent mode to enable video output on X1E-based devices
>> that come with LTTPR on the motherboards. However, video would not work
>> if additional LTTPR(s) are present between sink and source, which is
>> the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
>> some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
>>
>> First, take into account LTTPR capabilities when computing max link
>> rate, number of lanes. Take into account previous discussion on the
>> lists - exit early if reading DPCD caps failed. This also fixes
>> "*ERROR* panel edid read failed" on some monitors which seems to be
>> caused by msm_dp_panel_read_sink_caps running before LTTPR(s) are
>> initialized.
>>
>> Finally, implement link training per-segment. Pass lttpr_count to all
>> required helpers.
>> This seems to also partially improve UI (Wayland) hanging when
>> changing external display's link parameters (resolution, framerate):
>> * Prior to this series, via direct USB Type-C to display connection,
>>    attempt to change resolution or framerate hangs the UI, setting does
>>    not stick. Some back and forth replugging finally sets desired
>>    parameters.
>> * With this series, via direct USB Type-C to display connection,
>>    changing parameters works most of the time, without UI freezing. Via
>>    docking station/multiple LTTPRs the setting again does not stick.
>> * On Xorg changing link paramaters works in all combinations.
>>
>> These appear to be mainlink initialization related, as in all cases LT
>> passes successfully.
>>
>> Test matrix:
>> * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland
>>          * Left USB Type-C, Right USB Type-C
>>          * Direct monitor connection, Dell WD19TB, Dell WD22TB4, USB
>>            Type-C to HDMI dongle, USB Type-C to DP dongle
>>          * Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
>>            monitor per USB Type-C connector)
>> * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland
>>          * Left USB Type-C, Right USB Type-C
>>          * Direct monitor connection
>>          * Samsung S34BG85 (USB Type-C), Dell U2725QE (universal
>>            Thunderbolt/USB Type-C, probes with an LTTPR when in USB
>>            Type-C/DP Alt mode)
> 
> You can  add the following:
> * Dell XPS 9345, Debian trixie/sid, Gnome 48, Wayland
>          * Left USB Type-C, Right USB Type-C
>          * Dell WD15 Dock with DisplayPort connected
>          * Dell HD22Q dock with HDMI connected
>          * USB Type-C to HDMI dongle
>          * Dell U3417W

Hi,

Thanks for testing, will add on next re-spin.

> 
>> In both cases, "Thunderbot Support"/"USB4 PCIE Tunneling" was disabled
>> in UEFI to force universal Thunderbolt/USB Type-C devices to work in
>> DP Alt mode.
>> In both cases laptops had HBR3 patches applied [1], resulting in
>> maximum successful link at 3440x1440@100hz and 4k@60hz respectively.
>> When using Dell WD22TB4/U2725QE, USB Type-C pin assigment D got enabled
>> and USB3.0 devices were working in parallel to video ouput.
>>
>> Known issues:
>> * As mentioned above, it appears that on Gnome+Wayland framerate and
>>    resolution parameter adjustment is not stable.
> 
> I can confirm this on Gnome 48 + Wayland as well. Sometimes the resolution
> change from gnome settings gets stuck and does not apply. It normally works
> here around every third try or so when using a dock.

Good to know that it isn't issue only on my side :)

Alex

> 
>> Due to lack of access to the official DisplayPort specfication, changes
>> were primarily inspired by/reverse engineered from Intel's i915 driver.
>>
>> [1] https://lore.kernel.org/all/20250226231436.16138-2-alex.vinarskis@gmail.com/
>>
>> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> 
> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> 
> regards
> Stefan Schmidt


