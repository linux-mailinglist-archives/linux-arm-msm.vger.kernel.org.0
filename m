Return-Path: <linux-arm-msm+bounces-32864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B33EA98BAD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 13:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 559FF281967
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 11:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8EF19DFAE;
	Tue,  1 Oct 2024 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLyWhz/t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7064839B;
	Tue,  1 Oct 2024 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727781504; cv=none; b=WZE68SIELF7d/ddtj0J1NQzipbnNOzMfi4+DduyHe2gqdf8KPYBd/qiZyS0WytBZCDsLr5OZOmsZkls3NH6H00Z03zV8YPobAQvj0WYg3WMOvn6kxi+J9RGaalz8hNS03L1gA6A+UdJVK5FxoII+csqkroBhK2VsSFe7xZA+i8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727781504; c=relaxed/simple;
	bh=Mioa/5LJHiFVwRnLUJ3TyjnE9QgsmBQmcNPMZ83ReDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYbu4PbcoANcRgaaAkdbVNfNW0jddtPhYZlnXbRbSnS1ztnyNzwedm4gSQz8CRlTmYQYk5Dhq6BZmoREY3AH88XEmHf6TSd+362gZ7QFllTQWRwdahPVqxY9HtxUS5vkuhnq2Wrz7pG6iLdfszIbA+xjqD3lLkao9Juz62GCmT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLyWhz/t; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d51a7d6f5so712492966b.2;
        Tue, 01 Oct 2024 04:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727781501; x=1728386301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M7Y+01ypUJsEmgwdYhnhTchynt4rwwmYzwYQjNI7xpM=;
        b=dLyWhz/tj+yNwNDWEkh+QTvIVHtXfw6ZbQ2a/OTnAOpgBPKpQ/MYoYiRPZm7SFXfi9
         4WGOhibVSpL5kBoVqyKQiAKCLG0Hx1awz62WT1p4KOOlx4SVkSex7yKPpyXJsgPJDBzr
         ZB8hbVQZU7pArkofuHAO/np0xmpbv52bQ5Mj+0wy1ftOJTuFAMzGvUj6EGOzkbnOJOnT
         De2YFrqyFeu9Uce5p5cZm/1BZBHuNUHr1uVe6tzEuU0N/1lEFzJxc81tDblDF7s28QX/
         shqG1F2/76QZcySBGiCxFsJESUh/Ea/ITqElTT0oRAUB+3khcGD0sOfwXDeN3I6HfcmP
         MY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727781501; x=1728386301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7Y+01ypUJsEmgwdYhnhTchynt4rwwmYzwYQjNI7xpM=;
        b=vGjXtdhPMsE4QWeEHop4Q2vaqN/s9sWAO8PaG+rkLR2Ax77WIY34LmszaPuX0JUA77
         tM9Pgj5KFS6+ykpRw+UY4aVs/S8wJqeQczCaM7/Zu0gm89rkfd+KQHSRAfZl9v245bUz
         EJpjBbAn2+mdJaLsW9du/I4jv54XkblASz10rpKLQ3eOBvvKVxzdCZAAOtCy325nRwlA
         xH/AyWBMLQtniaEvvP4u16WyUS7/InnmmtYgVyvgbGrSpdBJ/S7h0G+c5VWRzcMxEo32
         xtYRJLn5vFIrlRXhHjG0bqbYLB79ongzPY45SrUVH4TJhhC3UibWI4QTE/Lkhg/atKNz
         W5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVy1WHc3QC+egrkHWANx77YalQ+keIUIf8kf9eIUbzt1gqdi6xHlRO9U7b5WnEV7M8ZcSBR9ptD2v0=@vger.kernel.org, AJvYcCWRM5hJWyXTEzQsRkkmWR6xoTb9U91kQvVD6g1P8vnchfCe37JidNuZOfD0wyzS/h/SlTMFo8cA2cYE2SNz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6p713iawBVutnQHebSmhqjPiuDNyr0pDqQ3z/QYkORb1kQzA5
	dQWC/F+lNzYyls9J99/nKCVFSADudz8/MHTY/s3YnmqlEGgGzeed
X-Google-Smtp-Source: AGHT+IEjf7kjW+MgxUTDGHSJNPDYgDC2pVN3zKWGsYHhpG6QGdF/JkSRWRkTQCML9v/lBAseCkcp7g==
X-Received: by 2002:a17:907:ea7:b0:a8a:8c92:1c76 with SMTP id a640c23a62f3a-a93c4961721mr1478843866b.36.1727781500535;
        Tue, 01 Oct 2024 04:18:20 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it. [79.12.161.203])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27ecf90sm694400766b.97.2024.10.01.04.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 04:18:20 -0700 (PDT)
Message-ID: <0aab9845-b960-477f-b869-e8d0759c4671@gmail.com>
Date: Tue, 1 Oct 2024 13:18:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] Documentation: document adreno preemption
To: Bagas Sanjaya <bagasdotme@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
 <20240926-preemption-a750-t-v6-11-7b6e1ef3648f@gmail.com>
 <ZvtMB14Yx5m3TzFJ@archie.me>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <ZvtMB14Yx5m3TzFJ@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/24 3:10 AM, Bagas Sanjaya wrote:
> On Thu, Sep 26, 2024 at 11:16:53PM +0200, Antonino Maniscalco wrote:
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +:orphan:
> 
> Why don't this be added to toctree in Documentation/gpu/index.rst?

Yes so there is existing orphan documentation for msm so my intention 
was to add it as orphan then eventually send out a series to organize it 
properly (so creating an msm directory with an index which then points 
two files we currently have). Does that sound good to you?

> 
>> +
>> +=============
>> +MSM Preemtion
>> +=============
> s/Preemtion/Preemption/

Thanks for pointing out the typo!

> 
> 
>> +This mechanism can be used by the kernel to switch between rings. Whenever a
>> +submission occurs the kernel finds the highest priority ring which isn't empty
>> +and preempts to it if said ring is not the one being currently executed. This is
>> +also done whenever a submission completes to make sure execution resumes on a
>> +lower priority ring when a higher priority ring is done.
> 
> Do you mean that the kernel finds highest priority ring possible that is not
> empty? What if all these 4 rings are empty?
> 
> Confused...
> 

Yep, if all rings are empty we don't preempt, same as when the highest 
priority ring is the current one.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

