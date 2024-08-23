Return-Path: <linux-arm-msm+bounces-29319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F9095C1CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 02:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC0B2284DF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 00:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036C963A;
	Fri, 23 Aug 2024 00:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmhFd/DC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4594C631;
	Fri, 23 Aug 2024 00:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724371321; cv=none; b=XoZe0itQNKULKb70DkL4zCUDIERqzk8op0XHrVaIe8/UtFUViePcfwFOBj1tUuZp7kpfMxyTPc5cH37+I0R8zA1sRbf0xRpl7IP8+hddJAcqwe+cnwr8n3nPiK5OxgYT0jRDyQ3ZZ3eZZML6PYQcIMl7bMMbi8MtdFdzg+IM4NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724371321; c=relaxed/simple;
	bh=AkGMr/4GiilXB0TyYUMOrZI0rt4Zs9G2rPhD2KI9vgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXwC1DuUzJhKarJfwQaUxp5TOsfTcb0YXL7P9Jpdw2MIvbkn3ZF4WirDX1h3ljCXUS0mui60MJg6+nGwyTcnqb2D5u9//sGZNdLH2YKfzjOls7IZVBQ5hWah1oXtuwiQsHkLFSe1F1Uneq+uah26ldNEBydISlLaKDtFOv52eyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmhFd/DC; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3eabcd293so15878601fa.2;
        Thu, 22 Aug 2024 17:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724371318; x=1724976118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FZXhseYTPdiEAsaCZyp0/eUGXOH14KUMciIsgJkUDzE=;
        b=hmhFd/DCrGY6iZNPxsZ24bN9ktSW2djRbHtIVbWHYimwVgbGrCtGicATmEtTp9ziiX
         eMAyHFdgrvQiOru2QNo0Btq4nO378gw+GGs+tJdcYZqvu6D0TnbRh2MZSkj+VWrDxu3u
         epPEhORYruUCDCVGeDzcfHqoxMLONVkdr0M+QJUW53UAc9N66YE4FW4+kjhR5GPBANjf
         7HpJ/g+8bK/6YTTzTkYYLl30afgtrqSEHxNvAh+6/o2jQHOzVOQGeXDYh3Ygn8Or61Do
         fvyiU0VCj3uNegzn5WInTFXYgktc/vig1rMZsf+ZcTj5n00CO56n0F0yFNuNZz4jdqHX
         F2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724371318; x=1724976118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZXhseYTPdiEAsaCZyp0/eUGXOH14KUMciIsgJkUDzE=;
        b=bOmrErHbTfKDVA0+Vz5EYLeRMe/0sF5xQkoy/FtngDdayvRTyb++FsLrOyznAN+J/N
         98vns8mBLtAjnB6QZfAPCy4W4jBUOaxtS80TbCfdSvn2D+uYuXDEjBfjDGhcTXbF7pzh
         iBM0DcuQU1Z4Fp7zU7VSZoWBtFs6TJuhnFtRKHnics1/QN/2hu6btt9dfYcyAKHUmLRj
         Si1KEpsv3Z17IiMk+19JnJhhxwir1KrlmpNhU33TnUFgVbx/zJEHcWsYH1bqdr2C6a4n
         8lGjGjT5TwSYk5wxT2qQduVaZ9kbXWz454X6AOiSzc5UvkgiXIibb2jF9yfG2vGbjyCg
         Fcog==
X-Forwarded-Encrypted: i=1; AJvYcCWKDYvGnjRIXzPMIN1rNrCmxZdLjruT7lcTIUzkg+rMrFpvBMDKl/MQpq+e0SYiLwzthtaADsXSeuLSgyFF@vger.kernel.org, AJvYcCXZMVg/LaD72GJsxjngEXZ/e6eJ5bSnlPVu0qppl+v1BAi8x4uVycgZVpsTfCsURPmay8Z3bpmQa5TeX2uT@vger.kernel.org
X-Gm-Message-State: AOJu0YwgMiSsTmRAHPuT+fFzmCpc/nOLDgBBV0XuoKtg9jZ/RQF+jhtq
	Y09pmQiQS0OeX5RL7EZTfgVGmTyTRg5sF1EMXRl738wjAPM7bqbr
X-Google-Smtp-Source: AGHT+IHhHWZf9vpNIAFQ0R09BUx/Ka3OjJk//K6B4lxZ33XIVlPX1Apvk/xy8KlJbFosWsKjoueAWw==
X-Received: by 2002:a2e:a595:0:b0:2f2:bbcf:1b83 with SMTP id 38308e7fff4ca-2f4f57aa5e7mr1018501fa.45.1724371317606;
        Thu, 22 Aug 2024 17:01:57 -0700 (PDT)
Received: from [192.168.1.14] (host-80-104-252-9.retail.telecomitalia.it. [80.104.252.9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a4c43a5sm1414410a12.66.2024.08.22.17.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 17:01:57 -0700 (PDT)
Message-ID: <3c0ce811-ae61-4d09-8eb4-054afeaa1969@gmail.com>
Date: Fri, 23 Aug 2024 02:01:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com>
 <20240819203128.hit2csdpbbsybkoq@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7GnwjS3Hv140emJ_-yJKDd+FB75upF9z3pDTj7Ey7zWRA@mail.gmail.com>
 <20240822192144.e7u3fhlqpeyypbxp@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240822192144.e7u3fhlqpeyypbxp@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/22/24 9:21 PM, Akhil P Oommen wrote:
> On Tue, Aug 20, 2024 at 11:48:33AM +0100, Connor Abbott wrote:
>> On Mon, Aug 19, 2024 at 9:31 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>
>>> On Thu, Aug 15, 2024 at 08:26:16PM +0200, Antonino Maniscalco wrote:
>>>> Some userspace changes are necessary so add a flag for userspace to
>>>> advertise support for preemption.
>>>
>>> So the intention is to fallback to level 0 preemption until user moves
>>> to Mesa libs with level 1 support for each new GPU? Please elaborate a bit.
>>>
>>> -Akhil.
>>
>> Yes, that's right. My Mesa series fixes L1 preemption and
>> skipsaverestore by changing some of the CP_SET_MARKER calls and
>> register programming and introducing CP_SET_AMBLE calls and then
>> enables the flag on a7xx.
> 
> And we want to control L1 preemption per submitqueue because both
> freedreno and turnip may not have support ready at the same time?
> 
> Antonino, since this is a UAPI update, it is good to have these details
> captured in the commit msg for reference.
> 
> -Akhil.
> 

Sure I will update the commit message. Anyway that could be a valid 
reason but there is also nothing preventing you from loading different 
versions of mesa in two different processes so having one globally 
enable preemption and break it for the other wouldn't be ideal. It felt 
natural to have it per submitqueue.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>


