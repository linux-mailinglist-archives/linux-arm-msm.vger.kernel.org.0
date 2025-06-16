Return-Path: <linux-arm-msm+bounces-61480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFACADB644
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 18:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E0387A34DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E19C28642A;
	Mon, 16 Jun 2025 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCS/55hN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D189286D70
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090102; cv=none; b=XBo61MJQHHvuxG4WRowmQ/mMlm1MzGmlN6DoWO7xz6qIIWUwAsSu1QrokKEXGqNVOfJMas1jjnBOjK8fj5bordxMiYfdMmOnxpl3pi6tLDp/Zn/elBJigbbRuw3H82h5dZzMTXfjfiu/yNHR9hqBp2LPOGIcFjXeB/TEJH47uxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090102; c=relaxed/simple;
	bh=hRBgOq4APKw2y8RYVbZ1gYWD7szlzHz0G09X13KV7qQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6pmZEKT/RViamnsuTJoZyaiCkF7HRguOi+av9F8c5bzD0/IktS2Z3rAuXBMq8+mXwLH/v8EIowABfObbNuXEkO8AcmXEE1zJOMeEyGpDobeA3EqDXGLxgoM93pkYdH+xE5j3fsZKfJx3xxAXj9kLfOvt5yen1pbIVJ8XG4+OM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCS/55hN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d54214adso36681625e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750090098; x=1750694898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a5x30H0yIc6HW7ib5oxYVmHAekW/AqIC/RAZDFhWWGM=;
        b=ZCS/55hNlkd4E3ABvHjuL2k/lcwa2B72q4u7hhnQDvpvn5rQb4ypwJepn6GjeruMDR
         ypH3+YuNB5EpOlmBM6XtfT1TiWWNIpWtkOxmAOKG6Ieg74vZE1gPgfKzp5GCnCzII1Kn
         nWKzriCvHrjkirJ9PAt4QfZAmqc23faMQ928lyZp0dBtZERIkijwrshUPkqATqWTyIra
         /bdHrmJs0bcmjqWUTK5h/C+dTgk2yVsjAGIwMu+gOI/hL7eQdB7d/va0CBj+8tdeF9sp
         kMzRyTJxiUNBKIX63zjt/74sWJxH0wGuA26ucbx5/uaWFo2DX2o0eY+kbHvwGJl+zeL5
         NnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090098; x=1750694898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5x30H0yIc6HW7ib5oxYVmHAekW/AqIC/RAZDFhWWGM=;
        b=lslZ11twyMOoV7ot+lQNkCM9Gk0LA3z3W23cye4uwUZGDkAPUvzYmQcpjrcCuyZBxx
         MJuFIFlHU55ZOda8M9IAm0hGDMCy+3Zf+pVWc11B/Ck7OONZisE2WOqE85ZxaE0lWQa4
         5aGqdsVyQ9p2NrvCYwJOoPSlzF0mH0JDCWj2BU/e6+9ZetLLfcLYAn58XhnOYJVtZ5Ni
         nUhth9t1jdtxAd3k4a3PZ8toOO5v7jwgr+b2Iuum6GCEo669Q2kleOiwbHlFmos8HFAm
         SUEqfcc9wuiGoUFIC2WgV+um/xEVqphLpLBK4dp8bem/IBptRZ7tgi0RoUS8Z/0JmWBk
         +t7g==
X-Forwarded-Encrypted: i=1; AJvYcCVMZaak07CnLxWCVexmw5asj6CUCjW4ZrgWPHAvmufI5SH9vvnVU8WOp6nQ0M+zxEWHgDW+jl6lJcd+E8dy@vger.kernel.org
X-Gm-Message-State: AOJu0YzKnNW8MbwQfJaxG69ILSypl7TxueObDpImacX4cJi8AXH1XzAJ
	TrDgUBOnAQ9sxMxow3Vn8+O864+/gu5lhH9fvxbtTf5RBAAfV3AX4EA2fIMkzjX595E=
X-Gm-Gg: ASbGnctvg98UgdCykyYh35N0OkIUVCrfxvwxkg06W9MKxdC3PwQ/DP5CyJWBff8n9jA
	40jw4YZr7K3XUPo8rj0x36phtqaesYcCqWillNMTamblY6/y8k02W2Mk3bIflLdc9DvBmTvHOU4
	GeaaA7f4p2TIyuB5leVEYmQTFl8Vg6dXZiKdPJsnbckxf9KUkpm493gnJ5mlb853dTllX+LJTT8
	CXTmBgjeN3iF9v/k5lJk6IGyCVjmxTz/LXGWUGHZlGA78UT1zep+3K4B6c0FfggVoLc/iTEV/Tk
	Q9mpQ564RnD5IWSQsikjxfnvlPC9hrOZtSwSAgmgPT8hQLcmqz/5tln/K5qh0OohIPS3T06MO7x
	GYNk9Us1/YoiBUmFkMy9Iy2DN4Fc=
X-Google-Smtp-Source: AGHT+IFprAWkawH42OL4Sz9tt4KKrYG6bZs86pGWjUVLMBCA8Vbyzc5s6Wod8JkjjmaDSK8H+pKM+w==
X-Received: by 2002:a05:600c:500d:b0:450:cabd:160 with SMTP id 5b1f17b1804b1-4533ca46532mr100521395e9.3.1750090098474;
        Mon, 16 Jun 2025 09:08:18 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm147563205e9.4.2025.06.16.09.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:08:18 -0700 (PDT)
Message-ID: <2df8eeec-406d-4911-9c1b-1aafcc8be8d5@linaro.org>
Date: Mon, 16 Jun 2025 17:08:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: vfe: Fix registration sequencing
 bug
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Depeng Shao <quic_depengs@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
 <20250612-linux-next-25-05-30-daily-reviews-v1-2-88ba033a9a03@linaro.org>
 <c90a5fd3-f52e-4103-a979-7f155733bb59@linaro.org>
 <21bc46d0-7e11-48d3-a09d-5e55e96ca122@linaro.org>
 <fe113f83-fbbd-4e3b-8b42-a4f50c7c7489@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fe113f83-fbbd-4e3b-8b42-a4f50c7c7489@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/2025 16:00, Vladimir Zapolskiy wrote:
> Hi Bryan.
> 
> On 6/16/25 17:09, Bryan O'Donoghue wrote:
>> On 13/06/2025 10:13, Vladimir Zapolskiy wrote:
>>>
>>> Per se this concurrent execution shall not lead to the encountered bug,
>>
>> What does that mean ? Please re-read the commit log, the analysis is all
>> there.
> 
> The concurrent execution does not state a problem, moreover it's a feature
> of operating systems.

I don't quite understand what your objection is.

I'm informing the reader of the commit log that one function may execute 
in parallel to another function, this is not so with every function and 
is root-cause of the error.


>>> both an initialization of media entity pads by media_entity_pads_init()
>>> and a registration of a v4l2 devnode inside msm_video_register() are
>>> done under in a proper sequence, aren't they?
>>
>> No, I clearly haven't explained this clearly enough in the commit log.
>>
>> vfe0_rdi0 == /dev/video0 is complete. vfe0_rdi1 is not complete there is
>> no /dev/video1 in user-space.
> 
> Please let me ask for a few improvements to the commit message of the next
> version of the fix.
> 
> Te information like "vfe0_rdi0 == /dev/video0" etc. above vaguely assumes
> so much of the context
Sure but this is a _response_ email to you and you know what vfe0_rdi0 is.

The statement doesn't appear in the commit log.

---
bod

