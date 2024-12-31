Return-Path: <linux-arm-msm+bounces-43739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C65D9FEF28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 12:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AA1F3A2E5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 11:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BC717ADE8;
	Tue, 31 Dec 2024 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="i5EAlF/v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28CF192590
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 11:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735646136; cv=none; b=ou5GG8HZqabbpyA2GM+xsLxMxRpkxEtRmCOZcKOaL1jZKkfrufKrFVUaG+kvCsQhEt+dWrkmKwScrOlBgl2vUUyAnLS0kotOgkDjNNebDCsCPoBWJS1peRXasMibB14q4Zu1Bi234Xpi7xNENf6XpNaBiILAsgXCLYrlAu2Q9Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735646136; c=relaxed/simple;
	bh=QpGKZ91wVIoUqvx/iFmT0yQGkEu+6Lb221p2kgbWuUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEokkmgLK/Sv0g6n9M6Mu0Hhh9NWIVI2zwPF1DRD+TakmcMCvuWMPy6q1CWUh47XAtxXzYz/yYOyWcTJk5GVy0Y7vBwSmft6uZMeqyoH3rFmUgqKwnViTH8iSmsBmH4GpI05WHSxnaAcJ1IqLmrHw1VgkvJKu6Uqc6ovHh0BHTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=i5EAlF/v; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso105364135e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 03:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1735646133; x=1736250933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZ0cCTCCRfld4Ulk+wiogAmP056IVjuCCQi0SFVFq28=;
        b=i5EAlF/vju9DSmT5y0276bReGR7DN9/GsyPLFK8wrMSaYpSYob2iv7v8eUdRf91C7/
         is4vbvyhyMkUANr45dJwX/zdrsskidr88KUsxV0DAdac4d1JT54bk4k2bUJuCOlE7Mla
         Opo+X8P3+OL39inaJwFXpjB8cgcPhcbjk87csqG/AspAYVd+m6MvBP1suj+0NGUPuQtb
         2X1xhg2Z3kGVrkLiHmmcZeVtIG4ijdD5e410A/6JM5PKZDyWOvYCfF7sg5co4serR9tS
         7nLxF/KXcthyFhbd26l4OrMu93aIh8OdConpQ391aZbOZpBhkZH2ux3KGrwacNc2Uhdt
         AGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735646133; x=1736250933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZ0cCTCCRfld4Ulk+wiogAmP056IVjuCCQi0SFVFq28=;
        b=nRNIG+ucMzz6KhgCrQLoxl4Jn71Xwzoo2TTVnd4KdQI0NPCwj7R95MvjhdBfTYsYb8
         1FWkaeNN9m8UYk+namFhbDQ1O4RhklPeojwMU9TSzuzkHzvV2g9VWYQTICPG9q/g3wM1
         cWyFYYXwHUkaZJWUF/0YU+hkrJ7Cm/VEV+nLxJdV4EHrgq9TZWGDd/uZ1/Ya5z3+dqxV
         1V69LRtNoxUIVpyUuNbwJAKZRHPF0/jwj/DWeOTV9t5crGHyORFN5cuR5Ogz2eF/xIvE
         /rYa+tVsrUX9589oj9GsaGno39kArNXCD6m0x5Ge9CAzcvE3MG+j01R0GFVUAd+/eL0h
         mq/A==
X-Forwarded-Encrypted: i=1; AJvYcCWYW2u6uKfx7TxJ3ZdgWqn66+xw93V2CC8DqnocYbSzeQW6hXs1IGvxVyak7H1K5gq9Z9aoudrcIyQxKZiE@vger.kernel.org
X-Gm-Message-State: AOJu0YyuskjPJWsfnOU/Ax0pk98w1jhdoDVVuJGjR8jSSWsgpCFMyCeK
	bAx4QHW3za0eGITnctHo4CowupbiaCSsSURwjJGYClC9xXdc0zDnVETzDwhbDMA=
X-Gm-Gg: ASbGncsRKfyits7XWh4l7MGJv5V762AsLZUe7XXq5WZlJTUOgjesYhsRz9/fyYN18Um
	AjsfG+VmMylFmkHBJWOs2mwqwF0E2Pojulwze3FBjYcgF/41LzNaJUxTV4MrZjt3xYYAoXNupVo
	uHlJRkA9fEI9fK1kcbc4v8zTIPcSI8V+rvCB86+uhLOS5NT4ipAs9BqrmkLd7qWQmuVjrCkJk8C
	hg/OW6jyzCRGeCqsP3C+kAmX0/3M/GES05MtIUWh4d2AZtgmgnmmKvKksMPxoZepDxUOhP3
X-Google-Smtp-Source: AGHT+IEonJCQkKfmUZRTTcQxMpQNh8v+hJ8WjpocKj3WTxQpFwWxDIM9bcA7O43AFVEzFIMvitFZLg==
X-Received: by 2002:a05:600c:4748:b0:434:f804:a9b0 with SMTP id 5b1f17b1804b1-43668b78818mr314536595e9.29.1735646132934;
        Tue, 31 Dec 2024 03:55:32 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3e0sm390817235e9.7.2024.12.31.03.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 03:55:32 -0800 (PST)
Message-ID: <1b5a3555-1094-404c-8b71-49dd07f59ac9@ursulin.net>
Date: Tue, 31 Dec 2024 11:55:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20241121164858.457921-1-robdclark@gmail.com>
 <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
 <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 22/11/2024 15:51, Rob Clark wrote:
> On Fri, Nov 22, 2024 at 4:21 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 21.11.2024 5:48 PM, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Debugging incorrect UAPI usage tends to be a bit painful, so add a
>>> helper macro to make it easier to add debug logging which can be enabled
>>> at runtime via drm.debug.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>
>> [...]
>>
>>> +/* Helper for returning a UABI error with optional logging which can make
>>> + * it easier for userspace to understand what it is doing wrong.
>>> + */
>>> +#define UERR(err, drm, fmt, ...) \
>>> +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); })
>>> +
>>>   #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>>   #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>
>> I'm generally not a fan of adding driver-specific debug prints..
>>
>> Maybe that's something that could be pushed to the drm-common layer
>> or even deeper down the stack?
> 
> Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
> just #define UERR() to be a wrapper for it, since line length/wrapping
> tends to be a bit of a challenge.  And I have a fairly substantial
> patch stack on top of this adding sparse/vm_bind support.  (Debugging
> that was actually the motivation for this patch.)
> 
> I noticed that xe has something similar, but slightly different shape,
> in the form of XE_IOCTL_DBG().. but that kinda just moves the line
> length problem into the if() conditional.  (And doesn't provide the
> benefit of being able to display the incorrect param.)

FWIW there is also a debug only builds hack in i915:

/* Catch emission of unexpected errors for CI! */
#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
#undef EINVAL
#define EINVAL ({ \
	DRM_DEBUG_DRIVER("EINVAL at %s:%d\n", __func__, __LINE__); \
	22; \
})
#endif

UERR functionality wise looks quite good to me. Better than the other 
two. The name is not scoped but I appreciate the readability line length 
challenges.

Regards,

Tvrtko

