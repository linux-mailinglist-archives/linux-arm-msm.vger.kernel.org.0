Return-Path: <linux-arm-msm+bounces-20013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D5B8C8E6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 May 2024 01:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A45C61F22E4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 23:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BF31411F0;
	Fri, 17 May 2024 23:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ytc/4XLt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70E39FC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2024 23:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715987595; cv=none; b=joSiqSSG8MEvgzLdIU+F68IGi/BMoPBZIMchKWcQTFYJVQkpkByjiWWK8mY5VXYqlWzvD0ylQOKwh2sMq5NKW2/V++J8+UuWvkVws8dinJ9gwcSGW6fwx9jysGC1XaXeFd/69e4rCh1e+Hy1PNLgOdoEwlZgL2OJE5Eepcfwfi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715987595; c=relaxed/simple;
	bh=E6xXHE2U0UNNqbgVzCG9WXRjb+Eb3Yuxe05NpCER5NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVIKZ+15heX9zZWj+ah08ZvGRbCQTJklvacNIsqKtEHxDGtxDkfdFJ72NG4YOlHP+Duq1D3lkfcFeVb+6Ljzbp6Dzs77Vjm037Ek8Nej1r1bP/4N5K+A2pjR/yCylRCEgEIEQx9BDWvSfXD+BkZt4JPxU7DLCLVDowQllhOZ/OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ytc/4XLt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42016c8daa7so6439695e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2024 16:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715987591; x=1716592391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TZVI66jI2kN4mSZo36o1UAonrQfJPzrUsip59CjO1Ds=;
        b=Ytc/4XLtMqWzVg+ic28qgBCB4R9/50yX3QHIDcRotmrwDdoAcq+iw9hSRCVQH0dejk
         vs9UfcNWKnimQMAkWoL3Z2hOhsiGoXlPihkh9ezApuK6+WmqrO5eAtRw5kLI4dOiNUqU
         SQfpij3DLxmceCQL+abseWqtKmRZZLW1SzV5p68M+/Qq3oo1r2QMON9hdguNwxyyOavd
         vsGjiREsjUqmenB4g7l0Y289NDC4TJ0L361uPFmvl4tV7lZa2NAFHlYAoqYUuipsRE8R
         dbm4FVgcszFTuAEKuUBSqg0wXll8Wbs8dMXhAyQpRSouFigD+Ty+pOly3JVm588kaRf1
         8ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715987591; x=1716592391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZVI66jI2kN4mSZo36o1UAonrQfJPzrUsip59CjO1Ds=;
        b=bV0BAfu42f6sz+3Cwxlp/Pvu3Frbws1xvGTfy1+ivog1CsS58Jo3IwUK+i2FyfaJWL
         G0dfOZZT0gxRmzI8rnf2pyjfvL6n+5HPXoirGnjO7IZ2iqly94jWlzv5XRoU77VYhovv
         HzFf0OYbI/tGwO2EzwjFTyY+W/cV8Cl0n6+qvlxK6Dz5afNHzYt0v/g/jOx7uXwXNaVD
         XSHTHXUedoUMaWrL6yY4jmOA65gszH5/ekVmcjTN3B7xyZPtTSrzJkAt1nD92JHQUIOS
         EFu2G7g7sM+P/Z6laMyoiHbHwDoaWn+OP29Ie0DNw0SCITBbYg/OgWqCfS398OBHDPop
         isWA==
X-Forwarded-Encrypted: i=1; AJvYcCV9YD0i1h8aHGRClpljkwjfk3DSrYcLph+vAG1jmOXeJeC+9TCADcy/PP0KQC2flwCho66Xds5ZDo6HZn3iHN7QJXooKIepOA0e5qkesA==
X-Gm-Message-State: AOJu0YwQd8S+W7Qrc1HbgKZV9VF2A8q5M3aeherdB2MP7xT4ELDsZ6rx
	+qCU+1DHrf9ljkT2sn8TV17UxZFsmwEEQgSVJFKOOMQRyjMiXtGs8NxKz3J4RA4=
X-Google-Smtp-Source: AGHT+IEBoYAYHc0la+iBnbQ21k30p9u7QPWes2aucTfYwgEf7j3QWhSJ6wWOQA7MBsRGI/TMSuCYXQ==
X-Received: by 2002:a05:600c:4751:b0:420:d54:7003 with SMTP id 5b1f17b1804b1-4200d547063mr154691165e9.20.1715987591024;
        Fri, 17 May 2024 16:13:11 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce2580sm318368025e9.18.2024.05.17.16.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 16:13:10 -0700 (PDT)
Message-ID: <f2cfac67-c793-4f47-b390-2b4fff21ff5e@linaro.org>
Date: Sat, 18 May 2024 00:13:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: qcom: gpi: remove unused struct 'reg_info'
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Frank.li@nxp.com, vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240516152537.262354-1-linux@treblig.org>
 <39b66355-f67e-49e9-a64b-fdd87340f787@linaro.org>
 <Zkc69sMlwawV8Z7l@gallifrey> <Zkc9J4vbQdeCmTpO@gallifrey>
 <3fe6e86d-5b4d-4b3c-a5d7-59f01dc6b0bc@linaro.org>
 <Zkfidbh3Sqy6BEDh@gallifrey>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Zkfidbh3Sqy6BEDh@gallifrey>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/05/2024 00:04, Dr. David Alan Gilbert wrote:
> * Bryan O'Donoghue (bryan.odonoghue@linaro.org) wrote:
>> On 17/05/2024 12:19, Dr. David Alan Gilbert wrote:
>>>> If you look at the V1 I had
>>>> ''gpi_desc' seems like it was never used.
>>>> Remove it.'
>>>>
>>>> but Frank suggested copying the subject line; so I'm not sure
>>>> whether you want more or less!
>>>>
>>>> I could change this to:
>>>>
>>>> 'gpi_desc' was never used since it's initial
>>>> commit 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
>>> Oops, of course I mean 'reg_info' which is what I fixed in v2.
>>>
>>>> Would you be OK with that?
>>> Dave
>>>
>>>> Dave
>>
>> Hi Dave,
>>
>> I saw your v1 interaction after commenting but, I still think commits that
>> say "this removes a data structure" should elaborate more.
>>
>> "This structure is no longer used since commit: 12charsubshahere" or "This
>> structure was never used and should be considered dead code"
>>
>> I generally hope the intention of my commits is clear from the code with the
>> commit log adding whatever context or elaboration on top.
>>
>> So that's what I'm suggesting here. A bit of commit log sugar on top which
>> elaborates on and justifies the change.
> 
> OK, so how about the version I suggested above:
> 
>   'reg_info' was never used since it's initial
>   commit 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
>   Remove it.
> 
> Is that OK with you?
> 
> Dave
> 
>>
>> ---
>> bod
>>

LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

