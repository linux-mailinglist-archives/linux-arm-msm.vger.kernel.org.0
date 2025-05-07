Return-Path: <linux-arm-msm+bounces-57141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B37AADC8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 12:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09910986BE4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D7F213E99;
	Wed,  7 May 2025 10:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OPtQmXVo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683F5212FBF
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613680; cv=none; b=MlZ2MLsI69RBkHIGLWnuRY4JvzI207a2oQWKtTpNmsfk1KXU67D4YKr687i1sVDGn9NvnK5YkHQBvcLZv1mCbucWHy+jzijKLe9eulAZHjJbNo2AwJdLhco2Ngt+jtnkI2uqfpt/iBwDRjcYxJHn1dJf6kmOZafBLRcbZPuyCuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613680; c=relaxed/simple;
	bh=mN/SA7cybJrXxsBWCutgmdZPBRjmsXSS3+VC0dZT/vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dc8Xw4tsfzfBS7VkTYbpgQN8z/3fTA6iFam6yJqriS7VU0OIGQog23JKeMjrv+qmfm04E08+Cu1ZHBE3p5TiIDqPcN78LTDwtAHaVlEuzstGhJeasJqZz4aMC4nuayi/NbIxwABogHk78Gk8+ViFvyyhBMKvcPitKHgb6s4dSTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OPtQmXVo; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so1220791666b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 03:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746613677; x=1747218477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e3m3Sg0+bVIJxu2EZBhejSmz5ffY//z82ft5OZBcPQk=;
        b=OPtQmXVoJmlB7jZKrSK31bjK61wQZOLxHyCnVBTgRm+13gRkZd2HtAnymC8nxqkWH/
         f8eTgLH3lq5QO/8J0dvYIfWHvy3zk9lUn/+kEpPvrAyx9IvQKvQ3abvKLn8OcwS+8oa1
         zmgMv5mSb6AmuZWdRbusC36OOolhq3DC5haJaRHpvKXLJAGWCxampxtihHvmVayTDJeT
         gOODWGTGcZgFo4/GM6yn/arAzd7ALAKSUvrvt2CJVt9Hc41O9OmZ+lmp++Kyt2IGr9+q
         f7a+MmuWHFsMBB+mytXTSeKM7OCXZqhKbGwYezmq503IeAbOCJV6GAvZVIgzRI23Zk0V
         N8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746613677; x=1747218477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3m3Sg0+bVIJxu2EZBhejSmz5ffY//z82ft5OZBcPQk=;
        b=pLT46mkqoMyP1/Ultj5M8w2OjyTpNHEQ9a3R9CIa6Sqk8YX04qc+JGna5M7tK6iT5c
         Uo0eHwMVTnLIrIj4hEzdi7u4SqevLGwRpqzgFkH+KUsJuquEVlLf/3jUeSxX2G0hZdng
         mDr/t8G9B+fLUg+FVuYjsVbhqfvN+RnP8pcuAB68nRjFNvKBdvfHh5SQ9ceESpLl7Tak
         LozScgBqJb2fkRExCpXgwB+PIJGNQcEHw0+q8LMqjzaqH9Po1Y2PQTwtStp6L5b5HnqY
         MjCXqBoggAf2MpfFQLJGyI+tp2w0ycb2du9wye85qKAxcTWFfG+TXXQcoZAqbzqPceeG
         jd8w==
X-Forwarded-Encrypted: i=1; AJvYcCVPEGBABpOZXOZIl/setZe8/6ls3hACwiMNM0wKliSxFkymXVGyeQItb/nYFDvgcbOPwgzmHKff3RHr8KyT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8pO0I2jRE/uAbvjDWjwM4K3fb8hd8ZUrTj6w7T8IMdWzRQING
	E6PpSpS8+9CNWWag7uTgstvPKXlW5aB3tCNDNdE92OJ8vUG4cR84MOGvM955FzY=
X-Gm-Gg: ASbGnctkAiByP2o674m1+a7MRJjIb8r0pvtV+G9JLfL9x3Pb7MZLTnvYg+rYPFcILMA
	xpE5NoBvnuCbwfvXdEj5hXDu8n+/aZ0LVlJIg+guNzMFXRgpsUrsroZvbpwt+oAikA9zEml37GY
	PDqXBXm0HVVu3Lz96vnyI+3Hs0razBaHkcX9upI8jgsUUNyc1fILI8V/H+wfIr8jY90WonVgcWL
	ijSd4Zf7dqagb2xFinV+s8egcCR3VQfIuNSpiqT809mpsXompxHj4KK/rXL9S79DtCE6y6bwh//
	IJVUAlzgiduMHZRsOj5LRpOVIu5zN4tHwHb97qiZOJcYe9ak
X-Google-Smtp-Source: AGHT+IGcySqujnpgP/KzWefd3PmSmn8wVFheaUVYXa/h4ueAk588Gd+cTopnd3x4abbh2j4LBSSshQ==
X-Received: by 2002:a17:907:1c9e:b0:ac6:fe8c:e7bb with SMTP id a640c23a62f3a-ad1e8e2bd6cmr275060366b.55.1746613676715;
        Wed, 07 May 2025 03:27:56 -0700 (PDT)
Received: from [192.168.0.32] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950ad15sm881835766b.154.2025.05.07.03.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 03:27:56 -0700 (PDT)
Message-ID: <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
Date: Wed, 7 May 2025 13:27:55 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org> <87h61wn2qq.ffs@tglx>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <87h61wn2qq.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/25 13:18, Thomas Gleixner wrote:
> 
> $Subject: ... See
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes
> 
> On Tue, Apr 22 2025 at 14:31, Eugen Hristev wrote:
>> Add function to register irq info into kmemdump.
> 
> What is irq info? Please explain explicitly which information is exposed
> and why.
> 
>>  
>> +void irq_kmemdump_register(void)
>> +{
>> +	kmemdump_register("irq", (void *)&nr_irqs, sizeof(nr_irqs));
>> +}
>> +EXPORT_SYMBOL_GPL(irq_kmemdump_register);
> 
> Are you going to slap a gazillion of those register a single variable
> functions all over the place?
> 
> That's a really horrible idea.
> 
> The obvious way to deal with that is to annotate the variable:
> 
> static unsigned int nr_irqs = NR_IRQS;
> KMEMDUMP_VAR(nr_irqs);
> 
> Let KMEMDUMP_VAR() store the size and the address of 'nr_irqs' in a
> kmemdump specific section and then kmemdump can just walk that section
> and dump stuff. No magic register functions and no extra storage
> management for static/global variables.
> 
> No?

Thank you very much for your review ! I will try it out.

Eugen
> 
> Thanks,
> 
>         tglx


