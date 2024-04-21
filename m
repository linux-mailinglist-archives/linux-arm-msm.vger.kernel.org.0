Return-Path: <linux-arm-msm+bounces-18090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D908AC0ED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Apr 2024 21:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDCF31C203B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Apr 2024 19:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4A23F8ED;
	Sun, 21 Apr 2024 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YJYXt8o3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9763B1F171
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Apr 2024 19:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713727419; cv=none; b=O5NwjE+7wG8FdvhBygt9GjSrShypj3gNrKso/TW6T8pmsXEhn6rU+wZKcogo6DoeqlWrA0fJLlzH4mQV+S8Fi9Fiu7Ii9TOj3MdchDhEuzWFV4oqzVDR773aZbcKQhF8SEKivs81Yy4tO2GP38OSXfXtTKbjyEyZ94ah6dINLPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713727419; c=relaxed/simple;
	bh=ko3baWa0bXarvAUBkLoisnJ87lFgJ97JsurMB9rDxfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8P7g/HVjfOQZLWfjgwCSoPjtP3HUhHHIJXrhDf0PFRfv80Xx4dVbqII/xXF7H94oH2Y6bwqidqEyV7iukx+5zfL6pGrEdx1yGaASaUEdJY6ItegD5GZSBbw8OS6rZcw5296VxBoey/rpgDAvoGBlz7BnW4X9G8hd9VWkmlNHzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YJYXt8o3; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-437b3f256easo18510341cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Apr 2024 12:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713727416; x=1714332216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqhW4D4jLVsKH1utbHDn/iKJztmh2klhA7VKP20qINw=;
        b=YJYXt8o3ISIOOewEaP0VkMBiYskRWkaijkP77qqV275dtOHf4fGO3AYekbZ2+NH9qu
         ir2kRyADd48L3HOnKxn+logXIIFNoHhp1A10YbKNGrhXANPjHvI37n/YZ6uL7tx76YzQ
         WE29s1Gxv8rnVw6yiiTbzOvewZ5JlqCetlyt8Pdj0UBLSq5CsNzNVcU3l/mEuGsgw1Kh
         r3gp6K+bMoP9z4olFRBNCbmCAS7DtMS9meakHSUgVF/KOerCio3PRsCsrh1E61jGW/Z+
         84t3TT6pTCgmCEDE3g4Bmbfj9fSQD2Vd5/5ReVYDzbolFDzDcMP/5miHVOUasFA5f+6N
         gJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713727416; x=1714332216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqhW4D4jLVsKH1utbHDn/iKJztmh2klhA7VKP20qINw=;
        b=QQF7lIBokfXp0aGADOab8Tnwj6eqyvAJeeY7GsWZ7y98xcawGRiy6ZQLnjYrxpW8mW
         Rkp30hIWWZ6T3lX4pl8CHbVEgPuZDbfCJQ1XcsvKIgqUrwiKd7jyMCZ9eIBhhY7spu1n
         bu/gEGhlrv2QKL9IqokQ1rHrC5bIKlgFBfc+4yXxYR1e7e+nOhvzhA4XEXBJAjduy7Mn
         ha9Ra7Gn60+UEe+Y52vYlZ9MRxGbQkn4LGFmtOT7k7m28iYUJ7cRKTK3aPuyXKe7fV6X
         VBkvkb4LuDgD5TeQkZwUNsJ/2Nw0UuFUK7La/NybXKO1bSJMcmeXuNQIheF2CRY3dQxu
         0HvA==
X-Forwarded-Encrypted: i=1; AJvYcCXBENKgT1buO0B/L/gkE/SDCLofbYUQ8+xr7xP2CJUtl5iRd2L9R3VqB4g9F/uiC1ruN5Goh8x/SiFOpDFvjYz+S4IHwvWjPa6g5JcMtw==
X-Gm-Message-State: AOJu0YzXdmOfdvnq+op/QahJYMpBrLZ9onnVF+VNJgygbfL5s/NNUeLS
	YHQ/fddplsv59UqA6w37hl0u0EplT2Y9KBhZEtaYXg8GqL96miu3FsbgDJPr4l4=
X-Google-Smtp-Source: AGHT+IFG+MgI9P5zvYhi3oK9zNce0+Wm/zV3xYro6FQoOvWRlykWswFzedE1EssCx/FegZrr7XDg8Q==
X-Received: by 2002:a05:622a:1a02:b0:437:9f6e:81be with SMTP id f2-20020a05622a1a0200b004379f6e81bemr11102550qtb.25.1713727416517;
        Sun, 21 Apr 2024 12:23:36 -0700 (PDT)
Received: from [10.211.55.3] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id w2-20020ac84d02000000b00435163abba5sm3604873qtv.94.2024.04.21.12.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 12:23:35 -0700 (PDT)
Message-ID: <5d580dd8-8510-4754-982a-131ea994923e@linaro.org>
Date: Sun, 21 Apr 2024 14:23:33 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] mailmap: add entries for Alex Elder
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>, Alex Elder <elder@linaro.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mka@chromium.org, quic_cpratapa@quicinc.com,
 quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
 quic_subashab@quicinc.com, elder@kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240421151732.2203345-1-elder@linaro.org>
 <kabhsybtcfg6ky46rwry462dpql2k6mcrnb7w7xtb5d2httg7r@lg6rbbmaiggp>
From: Alex Elder <alex.elder@linaro.org>
In-Reply-To: <kabhsybtcfg6ky46rwry462dpql2k6mcrnb7w7xtb5d2httg7r@lg6rbbmaiggp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/21/24 11:16 AM, Bjorn Andersson wrote:
> On Sun, Apr 21, 2024 at 10:17:32AM -0500, Alex Elder wrote:
>> Define my kernel.org address to be the canonical one, and add mailmap
>> entries for the various addresses (including typos) that have been
>> used over the years.
>>
>> Signed-off-by: Alex Elder <elder@linaro.org>
>> ---
>>   .mailmap | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/.mailmap b/.mailmap
>> index 8284692f96107..a78cd3d300eb1 100644
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@ -38,6 +38,18 @@ Alexei Starovoitov <ast@kernel.org> <alexei.starovoitov@gmail.com>
>>   Alexei Starovoitov <ast@kernel.org> <ast@fb.com>
>>   Alexei Starovoitov <ast@kernel.org> <ast@plumgrid.com>
>>   Alexey Makhalov <alexey.amakhalov@broadcom.com> <amakhalov@vmware.com>
>> +Alex Elder <elder@kernel.org>
>> +Alex Elder <elder@kernel.org> <aelder@sgi.com>
>> +Alex Elder <elder@kernel.org> <alex.elder@linaro.org>
>> +Alex Elder <elder@kernel.org> <alex.elder@linary.org>
>> +Alex Elder <elder@kernel.org> <elder@dreamhost.com>
>> +Alex Elder <elder@kernel.org> <elder@dreawmhost.com>
>> +Alex Elder <elder@kernel.org> <elder@ieee.org>
>> +Alex Elder <elder@kernel.org> <elder@inktank.com>
>> +Alex Elder <elder@kernel.org> <elder@kernel.org>
>> +Alex Elder <elder@kernel.org> <elder@linaro.org>
>> +Alex Elder <elder@kernel.org> <elder@newdream.net>
>> +Alex Elder <elder@kernel.org> Alex Elder (Linaro) <elder@linaro.org>
> 
> Isn't this form (with the name in the middle) when you want to be able
> to map one email with two different names, to two different addresses?
> 
> As described in last example in the "gitmailmap" man page?
> 
> I think thereby this would be a duplicate with the entry two lines
> above?

I interpreted this form as meaning "change both the
name and the e-mail" but I tried deleting that last
one and it still mapped properly.  I also just noticed
that I mapped @kernel.org to @kernel.org, which is
dumb.

I'll send v2.  Thank you.

					-Alex

> 
> Regards,
> Bjorn
> 
>>   Alex Hung <alexhung@gmail.com> <alex.hung@canonical.com>
>>   Alex Shi <alexs@kernel.org> <alex.shi@intel.com>
>>   Alex Shi <alexs@kernel.org> <alex.shi@linaro.org>
>> -- 
>> 2.40.1
>>


