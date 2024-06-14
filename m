Return-Path: <linux-arm-msm+bounces-22742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A30269090E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 19:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D91B1C21CA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 17:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3626B19AA41;
	Fri, 14 Jun 2024 17:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pC8EVGFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD8A146D45;
	Fri, 14 Jun 2024 17:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718384639; cv=none; b=l/cMjkpHJw0C5Hkc0o7IdhBktUw2A9EhvVf/k5U8QAbYajZCwR9fCXCk9wkqv4NJvShshNWmdhKfEfbqYd7qLMp/dK//f1WogJB0uhD21ke5Fhs7fY+IvQLB24As7c4uN4bkmITI0GFns435s9DtqyQ4B2QiyrvRishbWz6bMJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718384639; c=relaxed/simple;
	bh=lm2WP2jZQ+yAD9yshOLeLpSgAYROFU4jcWs2mhGJV/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdNsVUOpYcBMXBLZHMmcC7Xpxov5e8EeDSmAKDqheUbfGOlJM3K9oj/hx1renIJCojXmCrL3kjdfWN0/ocAivsxy+qQxBvlXc85djBXySK19xTLfY8oPM5KqUVPSEPTeh8Bzj+Y9C/BgGGj6pesICmjk0nh68fmA2GcJvXiF964=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pC8EVGFe; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718384635;
	bh=lm2WP2jZQ+yAD9yshOLeLpSgAYROFU4jcWs2mhGJV/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pC8EVGFeJC0EZME094IliR7iYu6S2QKmrleDEslrJLGXCVaeDv32icm3cX3aTqv+i
	 JWjLrMyYuwMppE48PfQTbHvI1q2LDE/Or+5l8l4ek2coaoTxjYb4VhjN7ubSuCx0Ks
	 snhS9mXrE1ixZFJKVBZi6krUVI8pb1Li6QJZyEYL4rl/fSqTtfz9JO/zvzBiFf+sVO
	 ZWyGsdyG6jVa3hRhS1WBFbq9PuFaGBpNLUaQ9+AiXc9vZBLZwQGdM7cSIse1QxA/BF
	 hjoZTwhdJ61dk4G1uaywehXzCX8h/tBv3/sVwH2SixJk7EmhLn7GXIAbRstouNhu9R
	 YPdjdR/2wrIOg==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CD5BB37821B8;
	Fri, 14 Jun 2024 17:03:50 +0000 (UTC)
Message-ID: <af6d496e-2f49-4f12-bc12-426e06d24494@collabora.com>
Date: Fri, 14 Jun 2024 14:03:48 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: mark kms_addfb_basic@addfb25-bad-modifier as
 passing on msm
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240613-msm-pass-addfb25-bad-modifier-v1-1-23c556e96c8a@linaro.org>
 <8aa99c1d-ca6a-a26b-96b5-82fc35cea0fa@quicinc.com>
 <CAA8EJpr5r=5MP8DqGPV7Ndz0zKy4Ar3u+RiqocLyt6eZWuifnw@mail.gmail.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <CAA8EJpr5r=5MP8DqGPV7Ndz0zKy4Ar3u+RiqocLyt6eZWuifnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/06/2024 14:55, Dmitry Baryshkov wrote:
> On Thu, 13 Jun 2024 at 20:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/13/2024 9:33 AM, Dmitry Baryshkov wrote:
>>> The commit b228501ff183 ("drm/msm: merge dpu format database to MDP
>>> formats") made get_format take modifiers into account. This makes
>>> kms_addfb_basic@addfb25-bad-modifier pass on MDP4 and MDP5 platforms.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 1 -
>>>    drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 1 -
>>>    2 files changed, 2 deletions(-)
>>>
>>
>> Would be good to also give a link to the CI for the CI maintainers.
>>
>> But otherwise, LGTM
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Yes, good idea: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/119


Nice to see new tests passing!

Acked-by: Helen Koike <helen.koike@collabora.com>

I'm applying it to drm-misc-next

Thanks,
Helen

> 
>>
>>
>>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>>> index 3dfbabdf905e..6e7fd1ccd1e3 100644
>>> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>>> @@ -4,7 +4,6 @@ device_reset@unbind-cold-reset-rebind,Fail
>>>    device_reset@unbind-reset-rebind,Fail
>>>    dumb_buffer@invalid-bpp,Fail
>>>    kms_3d,Fail
>>> -kms_addfb_basic@addfb25-bad-modifier,Fail
>>>    kms_cursor_legacy@forked-move,Fail
>>>    kms_cursor_legacy@single-bo,Fail
>>>    kms_cursor_legacy@torture-bo,Fail
>>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>>> index 23a5f6f9097f..46ca69ce2ffe 100644
>>> --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>>> @@ -4,6 +4,5 @@ device_reset@unbind-cold-reset-rebind,Fail
>>>    device_reset@unbind-reset-rebind,Fail
>>>    dumb_buffer@invalid-bpp,Fail
>>>    kms_3d,Fail
>>> -kms_addfb_basic@addfb25-bad-modifier,Fail
>>>    kms_lease@lease-uevent,Fail
>>>    tools_test@tools_test,Fail
>>>
>>> ---
>>> base-commit: 6b4468b0c6ba37a16795da567b58dc80bc7fb439
>>> change-id: 20240613-msm-pass-addfb25-bad-modifier-c461fd9c02bb
>>>
>>> Best regards,
> 
> 
> 

