Return-Path: <linux-arm-msm+bounces-16954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D50489E225
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 20:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EE931C21221
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 18:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6317D15689E;
	Tue,  9 Apr 2024 18:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MDvgS//y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B854156883
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 18:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712686082; cv=none; b=IhipJxBUTwPTo8AViABzhLBJzqNDAfQKJmKjRwTN5djwRUY4dj8nuXfgDm8BYJEHgw1AQRSmpX684nm8Htunc48bwM5mnVC7uZ/PLOxPf3qZIA4VQCYLmRCB9Ehl31OTJV5+dXeGCwzaGbY7hU9ocm/eu7jkq2PVyyIYhmkixIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712686082; c=relaxed/simple;
	bh=r0cBb6TC8kaxGaoj/nyQjZyd29xL4RD/be2AArxVvoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ED9LpzN460O5YOG5/GWtL+iRUGkcZsxfNp+Nyf3wP5vG+MU+3+ysMImgv3ZWEF+rqr8SbC+y/M8vDgObYBh5qiNxERykpd08i1juojivu7wqMAwXPCopWm2x7F6O+ICSvSN7+D2Xbl7Yv+LkR1wzxaWk7CLcfazKYmIvk7bUw0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MDvgS//y; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-516d04fc04bso9125050e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712686079; x=1713290879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VrZ8RYQWmS/u2XwLs8TYJcX0Juh8Ia0TqmDetkGlloc=;
        b=MDvgS//y9Z4Zuqi4JdBm/4iMxPujP2t3Ct+L/hCejNNvQyn96Z783Mp94+UpYCFCtv
         NzUfaYmxBW/qOmghZuNQCRF9n+WKTmfTXIcxPY62s2+Kj/JYHoZ5QGnYdEfHyaYePSpj
         +UYCLMgQ5Zjlr+RqtYmaSCI9TD5ihOo+jrBdPEyGGFUWkKfIeP6eAzv21ySG5MGsQsQK
         XAqiKvGeuN2XqULJB2Bm8MfopyboZtmTQeH1MjDJyX25ewzAdsOyULnD6d98O/QaVx4h
         eWTvbwkEKOytatHeVOybuH6nNEUcUgjX9EdF1GQ3YkupNgpSlDF/xUvmdrmYTbWRcHY9
         BWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712686079; x=1713290879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VrZ8RYQWmS/u2XwLs8TYJcX0Juh8Ia0TqmDetkGlloc=;
        b=nOZ93yhviWPBf7eAdMIMJdElCVlzH65kFxvqP0aUjSEQuuQxPu+9Ir6OkgH14udQc7
         TDZ8yrso7CY5r4tOl8rcCLivLl0x4moxwYVcu2E2JCh/OwFkus/FRbO/7JYp3QH4HS9m
         XkDRf1o+OUjiI+BcZHey7beW0NcOaZwy0bhmzHr17ut9iAKD2++rCNqux6IhHhOru9gB
         vsK6ArzC11DAwAD34Jyvlw1d1OqaYVFZYVxLvx+M73uot00hMkOL4+x28efy/7K+4Gh4
         Wm7E3IRGxipqQqq7ODci6R9siRGNa1ZSrLeTPIOn+nogQpXZxEk4/JuVmzVrpDGsJT0C
         dIqA==
X-Forwarded-Encrypted: i=1; AJvYcCXGxedkm1eGIhKHKbb5z6TW5hDxf5IwRqckhbn4Zjt8nuiCoRX3CdyxBrpPZ2G37Yh5Sv3qsI+rVldFcNkbVIEKgH9iBU/X8dvQnf3OsQ==
X-Gm-Message-State: AOJu0YwERX73fuILpY68lR48+5zNLmZgHHy5rB4efgWtLSiNhz9smQYF
	bucPmD6lbmpucU0KbT5DvYN0WBup1qzVp18/y/Yugwtj+qlpdaKdo/bdshMJJto=
X-Google-Smtp-Source: AGHT+IG3MqgBS+mPe51VGcruWuPwb8VmWczbzg+K2q9SMydDRG5mtJeurSgvPU0XHt+YSYXpUbL4rg==
X-Received: by 2002:a05:6512:2313:b0:513:7e83:b3f2 with SMTP id o19-20020a056512231300b005137e83b3f2mr178345lfu.45.1712686078563;
        Tue, 09 Apr 2024 11:07:58 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i10-20020a0565123e0a00b0051723af85casm629871lfv.238.2024.04.09.11.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 11:07:58 -0700 (PDT)
Message-ID: <b77a3161-9a18-4523-8528-31c2f2f4f476@linaro.org>
Date: Tue, 9 Apr 2024 20:07:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/msm/adreno: Allow specifying default speedbin
 value
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-3-ce2b864251b1@linaro.org>
 <pncr7ecf4eir36skul3iwt2nf5bpuwd5zjfzzfwwnxjwe4hoes@6z2xe54crijp>
 <d8a2ef87-f29e-4bdb-a9b8-591b8bd5d2b2@linaro.org>
 <tkcbl2iwcy3feoggbk737gx32qsxe5p4ad6lfrujy2pazccrhm@kif3guuzay6h>
 <CAF6AEGsg2xCCC27t_Gqu=MMQ6tckVw=Zj90p4x7EuOm+VKA=ig@mail.gmail.com>
 <quil2y6tbilihgont2xekay4joxgnsanu3khgo77omtwkolslp@ozuaajpv5uon>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <quil2y6tbilihgont2xekay4joxgnsanu3khgo77omtwkolslp@ozuaajpv5uon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/9/24 20:04, Dmitry Baryshkov wrote:
> On Tue, Apr 09, 2024 at 10:12:00AM -0700, Rob Clark wrote:
>> On Tue, Apr 9, 2024 at 8:23 AM Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>
>>> On Tue, Apr 09, 2024 at 05:12:46PM +0200, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 4/6/24 04:56, Dmitry Baryshkov wrote:
>>>>> On Fri, Apr 05, 2024 at 10:41:31AM +0200, Konrad Dybcio wrote:
>>>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>
>>>>>> Usually, speedbin 0 is the "super SKU", a.k.a the one which can clock
>>>>>> the highest. Falling back to it when things go wrong is largely
>>>>>> suboptimal, as more often than not, the top frequencies are not
>>>>>> supposed to work on other bins.
>>>>>
>>>>> Isn't it better to just return an error here instead of trying to guess
>>>>> which speedbin to use?
>>>>
>>>> Not sure. I'd rather better compatibility for e.g. booting up a new
>>>> laptop with just dt.
>>>
>>> New speedbin can have lower max speed, so by attempting to run it at
>>> higher freq you might be breaking it.
>>
>> Usually there are some OPPs in common to all speedbins, so picking a
>> freq from that set would seem like the safe thing to do
> 
> Well, the issue is about an uknown speed bin. So in theory we know
> nothing about the set of speeds itsupports. My point is that we should
> simplfy fail in such case.

Or we could allow e.g. the lowest frequency (or 2) which if often shared
across the board to work, giving a compromise between OOBE and sanity

Konrad

