Return-Path: <linux-arm-msm+bounces-32684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 593D59887D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 17:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E231284109
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 15:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74E513AD1C;
	Fri, 27 Sep 2024 15:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h95CP4Ho"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C7A8F5A;
	Fri, 27 Sep 2024 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727449272; cv=none; b=lNKgJi8m9FRJ+s7rotu5d+NJXUWXv0d9UAkC+zH3FojwxNBP1tI/a4MsLH5gRJrZpPLz6LISQ6ZmwxQvfCvo99tInMLlvsYLJ2WfLkdJQE10kDOjaC1YxDgzrNDZVzv46In3qRSkPESykWxPJI7Oy4O6X0ukV0r0Ju1NFnJD1Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727449272; c=relaxed/simple;
	bh=JFTcK6PqjD63hgWX61yCU7vSz09nSwtGnF1mBkiY+qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bN/stq2fVkSHDxdc8D6i4Mz8wpZuASfFguTj5Uu9GxATDvGV/eulM3taYZ2LtknX9yDPS0PuhStUJEroc1d4RMApgh7TGi2QN5DIX6oKiVzuEG0N7uhvxGxisM/ryp+KIS3fDRMJrrLmm8eUImLI9JKdc58T0iVNzEws95bH2Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h95CP4Ho; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c882864d3aso1317338a12.2;
        Fri, 27 Sep 2024 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727449270; x=1728054070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eFJ6F1BxryQ8+onawS+5pO7WAZHzFPHliMYOCtlDU9M=;
        b=h95CP4Ho6BR1oochL2bFgpWEuhMwwUABBxLUHzvc+KoaZHUYyAgja+wmx+YC/HUHO5
         uT594lQaBh5jrm/8VSDEpI32GoyOICO/A3mZX6Pa72lkMo8mchg16r9QBv3BoOyCqJIV
         kWunRXL/3oxLwuIjrZJLsoLxj+UCKCpN/AkY24ApfmGvlYvPRIg/Ck3cU8OX17SE7AY6
         jP2NlbRiy9mmd9r5grI5KSq0BuyjLQ8/kdYP7DGrlbrOKbsjSCSTdFubNfeXIk6dcLA4
         S9LEW6C+NmP3A/AGVledU9HcPzSkYh0BQdEFI5cUkBmMKurJBexon0Hk+xFuCja3Eeai
         yrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727449270; x=1728054070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eFJ6F1BxryQ8+onawS+5pO7WAZHzFPHliMYOCtlDU9M=;
        b=qdsw6Fh4YE6hmCeZWP2bD6qgszkf4g1c4wucJ59CDHsRbLb5owGQPx9nIpGHmqQMBs
         wtjaGi2u6yNElEM1UellyioUawjhl+yGJkVjSIbwjbWymgr/zPpWYMrazmG+Xc0l3g8d
         vEwKxVMGEReLvcu7eK2MQjJztfuLSCXzzkMDu5EV2JO9ht2++JbQga3QhQ10ot+qaToW
         XZxBmMaJfoYqGxcEz4QAmb2PrI6O4B/0xmWrOIjDQTscQIVwK5gix5/RZJJ/hqir0t5s
         SOmNCiXLRGZsfhlhH1Bcw7gn3C0AjOGpW6Y6ps9759KIB6VUXrPj/6FdIzLd7PfHQaZh
         FRAg==
X-Forwarded-Encrypted: i=1; AJvYcCVyi5WxW6VmwCoH3VIOZkU5uIrqDKaCrFOkaSFnXPuQNV4YjyAuvYm/4tXb1JZT4XcbArCUyrHGz+XC@vger.kernel.org, AJvYcCXl5GTWQl3lwTX3iau9pA5LCwqCANgca6WnCj0Gej3+uSx37nCGc1gf8QiWzMB2icGFgtU8pnyD033wFmf6@vger.kernel.org, AJvYcCXz+xWHD/NzWKxP+6mR9yEKrv0Sj9e5EHqb+/tKZSVpk8XWSH4Sa++DVlQ6tFr4eZ6wrRXTDIj7bsqrdwNM@vger.kernel.org
X-Gm-Message-State: AOJu0YyRTqRJSj4ZWbqtHNpdCgni74Pws7Sms3kjS/2nbURYVcdTYHrx
	JeDg/TQZpOyMBIiuwfDYALWiVMiGKl1oIMBJ1pYsp5nmKH3HStWzy3xqzlD6
X-Google-Smtp-Source: AGHT+IHKBc1xhpTKxrBrf5NeabF0ioO0uKvJ7fvnEiaSivm5sB5H360qY7iS9UkiZwuz+APpUEm1ww==
X-Received: by 2002:a05:6402:390a:b0:5c7:1f16:7f77 with SMTP id 4fb4d7f45d1cf-5c882602d68mr2391698a12.27.1727449268937;
        Fri, 27 Sep 2024 08:01:08 -0700 (PDT)
Received: from [192.168.1.17] (host-87-19-160-215.retail.telecomitalia.it. [87.19.160.215])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882493f55sm1215805a12.91.2024.09.27.08.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 08:01:08 -0700 (PDT)
Message-ID: <8805a597-813e-49e5-82da-69ad15249601@gmail.com>
Date: Fri, 27 Sep 2024 17:01:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
 <20240926-preemption-a750-t-v6-4-7b6e1ef3648f@gmail.com>
 <CACu1E7HEZztQ3bctuVdrwLCVY2oJ_01AyeKdwCuuB6gmsPurpg@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CACu1E7HEZztQ3bctuVdrwLCVY2oJ_01AyeKdwCuuB6gmsPurpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/27/24 1:57 PM, Connor Abbott wrote:
> In the future, the right thing to do is open a mesa MR with just the
> register changes and then copy the file from mesa once it's merged,
> because all of the XML files are supposed to flow from mesa to keep
> mesa and the kernel in sync. I've opened a mesa MR [1] based on this
> that will hopefully get quickly acked and merged.
> 
> Connor

Sure I'll keep that in mind, thanks!

> 
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31422
> 
> On Thu, Sep 26, 2024 at 10:17 PM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
>> Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
>> index 2dfe6913ab4f52449b76c2f75b2d101c08115d16..fd31d1d7a11eef7f38dcc2975dc1034f6b7a2e41 100644
>> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
>> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
>> @@ -1337,7 +1337,12 @@ to upconvert to 32b float internally?
>>                  <reg32 offset="0x0" name="REG" type="a6x_cp_protect"/>
>>          </array>
>>
>> -       <reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL"/>
>> +       <reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL">
>> +               <bitfield name="STOP" pos="0" type="boolean"/>
> 
> This bit isn't set to 1 when it's stopped, it's set to
> 
>> +               <bitfield name="LEVEL" low="6" high="7"/>
>> +               <bitfield name="USES_GMEM" pos="8" type="boolean"/>
>> +               <bitfield name="SKIP_SAVE_RESTORE" pos="9" type="boolean"/>
>> +       </reg32>
>>          <reg64 offset="0x08A1" name="CP_CONTEXT_SWITCH_SMMU_INFO"/>
>>          <reg64 offset="0x08A3" name="CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR"/>
>>          <reg64 offset="0x08A5" name="CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR"/>
>>
>> --
>> 2.46.1
>>


Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

