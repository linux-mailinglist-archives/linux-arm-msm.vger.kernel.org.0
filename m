Return-Path: <linux-arm-msm+bounces-33188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 747F299189C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 18:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C5261F22168
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 16:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD3E15886D;
	Sat,  5 Oct 2024 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="fo9g685j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132B6155C87
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Oct 2024 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728147516; cv=none; b=cf50w4vmft2O9t3tULjh4HtIImr/Sj1SVynEHBawF/yg2pFtTmuYBubmbcWYs5aYAG84foj7pXB9HM36OQ/8Pe0vpYC7RWXDUdIhhxR/ExTqdawtfSBZPrLC/IfwjIuFnMEoXRD3GuZ1b8LZJ28AjgdXB2WQUGr9hTNKNiklBFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728147516; c=relaxed/simple;
	bh=5T4U1UHrigNQBk+mJQwGMPE/eTCGy/9RZiUgKQnFmlQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=XwWgJ/4JC4SAhrdi1yymdQMoi2VtDG3wdJNH/jkllcGIoUD1oC9sFEK3enI6O6pwGjVODdyAYhmDprIE6GXV2pFc7uCLMbeiKVGD7LxsJ5686XkvrRhTDqppHUrrJ1FOelpZMEYZuwcCTE5/glM/cIBVkT1S4aVxN/Sk+ege4UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=fo9g685j; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cb2e5d0104so21415016d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Oct 2024 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728147513; x=1728752313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=534BF0P5lE7Sw6EXBB2MdGwppSsVFm73Tau4PbJd3Pc=;
        b=fo9g685jiYKwVwKPeGyQPpTLyL/6Ndbzovf7A4GMg0SnJA0Qrzr4V6h4SrpWDF5v5S
         T0+9M616riiO3Pwr0RRdH3V/4bbAs61naERXXRaRNgP1tkGjT6TswbpEBtLaqDaJ5CZN
         mdYHIDbukQe9RU11/cnB+StAuktNA6znDUU/LrtTpslF8knQAvCqw1mgGWsTyox+R/iT
         Z1azhSgGScz/sQ8LFouJlyzGQfrF7qTOHbGFrYHhoR37zERqz/f//NzKplYCqAag2lgK
         ah3SBMlq4MmGxe9iHMnRznsm/FkN86V1omcIcnrMnAnm0nam5O2znF8B3Jb6Zu98lvkV
         v57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728147513; x=1728752313;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=534BF0P5lE7Sw6EXBB2MdGwppSsVFm73Tau4PbJd3Pc=;
        b=NqTT3RznpXGD87Ajr08wRxjBcd+nZoB3fK0uDd9lAbW9FnDse5V5B3lJWLbN+nVSDi
         HYLQeMbCHNS8cZXzs5flGl76kY2+UD36M+crPcbil40tgtxrhEv66lxfBjlcjntcgPEd
         dVjzMjMSBQVyLrw1XxzlHHMdOp6HOV372g1xrcNPXSSUUUrQ739lcLU7l8JpC6xiar73
         rWPLfFxd2LGOqsGiax8DnJQ2mrFnFLsTWDhBXXpPPqFmbw5MumT4ZxFQHsFsPFM+pg7Z
         O8holbu+BPvBhEmwlGGABVEQThisk+5ZKmV/5gg3qlgSJdxJk9Kg/yLm2rWyWA81//7C
         jwdg==
X-Forwarded-Encrypted: i=1; AJvYcCW0SV8/voeLNWQPc+PZRNm2dd5WaZpztP5Z6uua1jPbFzQzr/+BObvlxPXJJcq+Y1GXF+E6wvYXnXxYt0Sp@vger.kernel.org
X-Gm-Message-State: AOJu0YzcvHq+lekGQYRXBvUBh4+qKZUQns1oR0g+BnoyjBGlpygpkJWb
	xm6o3EnnBhn4wpWn1b3mrZpGU72n+V8T9hY1/KF3h20hTqiw+ZUNxk1Dxn/kRWE=
X-Google-Smtp-Source: AGHT+IHNX/nlmxQbI/WqWLEEy+/8YLvtUS/jHRIC7aZ58AdVpv3bsRE62Z/GKH7EQ1/OcMHcCRnZww==
X-Received: by 2002:a05:6214:5709:b0:6cb:46ce:744a with SMTP id 6a1803df08f44-6cb9a4fa3b0mr78469376d6.48.1728147512903;
        Sat, 05 Oct 2024 09:58:32 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba46efed1sm9795796d6.68.2024.10.05.09.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 09:58:32 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
References: <20241005143818.2036-1-jonathan@marek.ca>
 <ba56c822-cf3d-4d62-86d4-e04551e443c6@oss.qualcomm.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <e60361b2-29bc-aeee-2ab9-bb19e5c0afa6@marek.ca>
Date: Sat, 5 Oct 2024 12:55:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ba56c822-cf3d-4d62-86d4-e04551e443c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/5/24 12:31 PM, Konrad Dybcio wrote:
> On 5.10.2024 4:38 PM, Jonathan Marek wrote:
>> drm_mode_vrefresh() can introduce a large rounding error, avoid it.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 185d7de0bf376..1205aa398e445 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -542,7 +542,7 @@ static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mo
>>   
>>   	int new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
>>   
>> -	return new_htotal * mode->vtotal * drm_mode_vrefresh(mode);
>> +	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);
> 
> This seems to ignore mult/div by two on certain mode flags.. is that
> intended?
> 
> Konrad
> 

It is intended - those flags are not relevant to DSI panels, and DSC 
pclk adjustment is only about how DSC affects htotal.

