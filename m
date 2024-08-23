Return-Path: <linux-arm-msm+bounces-29320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F358495C245
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 02:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24B821C22F6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 00:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C331533D8;
	Fri, 23 Aug 2024 00:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrTV72OX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16205171A5;
	Fri, 23 Aug 2024 00:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724372395; cv=none; b=L2ziGFq4PxAcIF9QRv5YwhQ1EVOrjHbWxH1FOrU9zrgf0XOi6VpSy+Di8f2FNYAq694Y0X1H1ZHYsawgVE6xV9kI68riIg44ZIqEtbVpMhguGqSHlCxhCiPwmRWXun+bVOW74tKS1m4dZF0qW9bYdXFwNmaU6KdRimrgHBnvCgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724372395; c=relaxed/simple;
	bh=F2lLLOIZ5MdL4ATGWpjDdNMqu/+FrhRvRhi5CgSEkxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJ0aqlP/XFi4D2rCBE4PUxJsnSxqIAZWI4ycQnYD/WnQa2N6r22fyaS+G8C+qAwtZHqYNDhABD+t3OqK5rlbM6yfp5cHZ1TMMg3yysn8+6Gh0d5CjP+ZCSaMV2YRYt/hTkoOdsJEPYRxrBCLznyYzfmLrLR+N4+iIJApytDPl6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrTV72OX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7d26c2297eso186765066b.2;
        Thu, 22 Aug 2024 17:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724372392; x=1724977192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFn5gD+eI+oFc3WZUBSmujCGXwdn3up3L1zAyTOtMZs=;
        b=NrTV72OXEK0meH7V5F5mY7EM5Z8VaB8iFu90QMIop7r/5FagPgtpKZVh+ne4Zx2a+3
         Rd8uFRDyjLjwIKB8degIPq/QkPenctZ6RzHBfOWEjeEzXE3+aFXAqraCVtf78cVM1Hzp
         K7wHhga3RECrSnU5h0hJDZm/kiMtOCPZticWxP/kwU6Aexllm2EdKXNBb1j7ZIEym//y
         GzFQe3Uoa+w4OWQBDePxvIge9CN138H25i5vP4QRBvDejmoOoOh3QN1k8tHIwGOE3hlV
         A6g/GUCAC3nHnC+zYbbmpj7c/afPAMIF5Ltl9f32gydf5/y6aVHRd2JV4J1TNsLPbFu7
         u0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724372392; x=1724977192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFn5gD+eI+oFc3WZUBSmujCGXwdn3up3L1zAyTOtMZs=;
        b=IcTyKSfCum01EFlad/pXpC9AGZ+BT89YKarhy+fF6bD0poYfm/5eUfz/rTk8yxYYs0
         /f5VrAkKQZq3DMRD6LWSdMgezmO9mItuACfrN4eB9fFEc40tjiRgnX76Wo5FnyzUv6QR
         uk9VvHU3HlzUil8kTNlqhe2b1qZkX08NKmse8eVYo1Xhj0rYZfX28XH1t+IbrEPvtgIq
         RDPLyEDZwgoT0uVxsGGEolOl8tSFF/gO1PSiMK196dLNowSKCQnLKXiEtV93DQ0aJ9pJ
         +egIBLt5Ly59hSCg7Yzmw3JdemfoES5zTuYkVauh/RZ+hd3umMLpAkK7dfgVe98Z/Z6F
         Xpjw==
X-Forwarded-Encrypted: i=1; AJvYcCUWJnQRsfbq+HEkbiuv2Vdfb9b7YVsxv4YQHGNmO5VozpUhArKcMfHOUYEPBmZ3T+6pWFAi7a6PHN0vGndJ@vger.kernel.org, AJvYcCUejGU7prfbA8IboNYAyGs9W/yNyFRptQUdmv/jjHarhJF07Dr0yCxTAPVRyOY6YLSR1msdBPc3Hrh8ByCb@vger.kernel.org
X-Gm-Message-State: AOJu0YzxNeOyhqD0n6mDPU9MlO+tzxjBWLzXy2x6KMwGXkWIBSKjyh/4
	jS5uZ+zxxmLRLGSPAjNxBOylj9LlObyqQNkVSbKHwEaMYyZsazOO
X-Google-Smtp-Source: AGHT+IGEdE1pbgGLiaspl7QobJK5Wc6J6u40OI9jibZkTpdAQBLwU1nX+HnLn66He1iLWtKUtIO7IQ==
X-Received: by 2002:a17:906:fe4b:b0:a7a:bae8:f2a1 with SMTP id a640c23a62f3a-a86a54899f5mr28977066b.42.1724372391803;
        Thu, 22 Aug 2024 17:19:51 -0700 (PDT)
Received: from [192.168.1.14] (host-80-104-252-9.retail.telecomitalia.it. [80.104.252.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f6686sm179971366b.221.2024.08.22.17.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 17:19:51 -0700 (PDT)
Message-ID: <27840bd4-aac4-49ca-9c98-60913c352076@gmail.com>
Date: Fri, 23 Aug 2024 02:19:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com>
 <20240819200837.etzn7oaoamnceigr@hu-akhilpo-hyd.qualcomm.com>
 <14591112-4455-49b4-8b1a-3feffc4d343f@gmail.com>
 <20240822192347.ffezairwoqqolssl@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240822192347.ffezairwoqqolssl@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/24 9:23 PM, Akhil P Oommen wrote:
> On Wed, Aug 21, 2024 at 04:34:15PM +0200, Antonino Maniscalco wrote:
>> On 8/19/24 10:08 PM, Akhil P Oommen wrote:
>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrote:
>>>> This patch implements preemption feature for A6xx targets, this allows
>>>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>>>> hardware as such supports multiple levels of preemption granularities,
>>>> ranging from coarse grained(ringbuffer level) to a more fine grained
>>>> such as draw-call level or a bin boundary level preemption. This patch
>>>> enables the basic preemption level, with more fine grained preemption
>>>> support to follow.
>>>>
>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>>> ---
>>>
>>> No postamble packets which resets perfcounters? It is necessary. Also, I
>>> think we should disable preemption during profiling like we disable slumber.
>>>
>>> -Akhil.
>>>
>>
>> You mention that we disable slumber during profiling however I wasn't able
>> to find code doing that. Can you please clarify which code you are referring
>> to or a mechanism through which the kernel can know when we are profiling?
>>
> 
> Please check msm_file_private_set_sysprof().
> 
> -Akhil
> 
>> Best regards,
>> -- 
>> Antonino Maniscalco <antomani103@gmail.com>
>>

I see, thank you. So as Connor said in the other message we want to 
distinguish the case of system profiling where we do want preemption and 
application level profiling where we do not want it. So sysprof is not 
the condition we want to check for to disable preemption, correct?

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


