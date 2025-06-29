Return-Path: <linux-arm-msm+bounces-62976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA5DAECE28
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFA127A336A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F88231A24;
	Sun, 29 Jun 2025 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E/d37Q7J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E848231856
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208858; cv=none; b=jhD4i6f/KHnVXeOb7JYklpixfiYNxz7F9Ip8bj2M3o5KVmEx5yHRRnYmRwGj+oAs9UfEb+xn5+G3ze6JB4fE7jclyPth87lp45xVX/ix6znDHZ8gwJ7MDiG2ex7uupyOGVLSGzPwKa660lxmUFxJx8TEu3Kg8waC/GW2JHzirW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208858; c=relaxed/simple;
	bh=SuYzlHdKx9KKuMad5H89bprbU/W9GFt87MZuLdv6G2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfGZUfrFIUAofERIiGVWZGvdYKH0odIFqOveqEpxzSPfAR6iFyuTMrVHq6XzpajOE30mw8R6G8PYlpTLRxRx8crjnpPb8JqkPPTvVT8L2FFhhzMTCC2vLyPqbFyC2oLt2Ntc8qXIQlWLpMcsVOfX+2RusCb0+mA2O8Zq0O45lJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E/d37Q7J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751208856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQhAjIZaqrzSin/ILh/jdA9Kl28mycO6RSVocvPjupU=;
	b=E/d37Q7JhFzLTtHM49KPoqxnmJgy1UmOhMMsajlQS1dgbL2/GVmHuFzA1mD4m6rh8jBeSg
	rSBUy7bmF7zt2dM1/LhAEzPcoW1Hdy9L7On6NoymC6kXd2J8cEjy0eP+yNyq+LKA5498h4
	XnqC0wYXLrXfZqpK6KFiFRdlwaJusjs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-G6w9jv8hPGy9mx93Ks8-WQ-1; Sun, 29 Jun 2025 10:54:14 -0400
X-MC-Unique: G6w9jv8hPGy9mx93Ks8-WQ-1
X-Mimecast-MFC-AGG-ID: G6w9jv8hPGy9mx93Ks8-WQ_1751208854
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f65a705dso673134f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751208853; x=1751813653;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQhAjIZaqrzSin/ILh/jdA9Kl28mycO6RSVocvPjupU=;
        b=pz8UW3a2pwyBSISZLpdGhatkdtPo0e4WgRXIS1z3LOnmeDc23odhQJiD2RKN9iSzgr
         yqvDCdWXGgHpIJnEjCTEEUsheaLIoXNDrmTTNNLtSAgE7lkhz791zkLccr7F6V6P+ZrD
         Kq3ZbZ5wjOh0B5a6iUX4SmL7uTlmMVUHt2pEXeZoCQWSWGtgV0bJqd0KG1h8GBSz38U3
         KJGShROK9TTjCQhDr0l9XENUiauTk5M8P2rOaGHbRteBgCw6T1vXndz34N72wA0NisWo
         oxW67Es1ExnGVP86EW+ADNNjijjRqnGvbrzNDwUYXaJpKnPxvvtgEsV59dIu+oylTjAf
         Q4rw==
X-Forwarded-Encrypted: i=1; AJvYcCWLn+kzyOlX8RcaJ4v7oVabllFXFVWfSxLHjlseqbZXawiVdhgGWu0Tnc3golFgZ1l0liZ9KDEHqynhJ8zd@vger.kernel.org
X-Gm-Message-State: AOJu0YxVy70x/b6+dOmopkBGAHqU6UCfckb/zqBuqyaFez3oupD3vQZ4
	CmWM2tsuMLWGdtz31ik0Bt15bJcc8rUT7UhPdjdfrL00MFCWEaalzNlmS+xDyAVBoD+9O6suwer
	Lrgbj2JExxBi2QZ2/LKFa4Qh6aobvPtLannbLd0axz3UolefE62reeMMxVIsveMjA4E4=
X-Gm-Gg: ASbGncsMyY/POmHdg0XYsHpCmyACFZy8PvTxU3EJK11gvzx8NAaKdshS5mCCjYlQfne
	297mxamhwlTChCfVQhSdgV52TfETjEbeTyY8/48f2BEBe6z/yDOsA2aCh3eekURtd7o6IcW+1lp
	r1/hsvuRM1Y1TK175UuQ8+EneLKlG2LkBNqpWuygQScp1139YCr6ejBG0vlft/+Io1MWypTGJTa
	LijocpN14wZLv0SKyAMIA5vxGpoyntx8HwluMgvaSJakKYGrETpuD41CkGP3kUEmZYOaz0hHFFO
	AamzUQJ77WNVszHW0MlVBytQw+oGS7c9V8B15TZ5NMscR10Ey1faVjXPSRhjAg==
X-Received: by 2002:a05:6000:4186:b0:3a5:57b7:cd7b with SMTP id ffacd0b85a97d-3a8f482cf28mr7316064f8f.22.1751208853593;
        Sun, 29 Jun 2025 07:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBMBWkMBcKHvlqeEC2011OKDiMy1e9qvKMcbYXf7maBrJLSJvn0jG6UetsmvOQwcivB7Qgog==
X-Received: by 2002:a05:6000:4186:b0:3a5:57b7:cd7b with SMTP id ffacd0b85a97d-3a8f482cf28mr7316054f8f.22.1751208853166;
        Sun, 29 Jun 2025 07:54:13 -0700 (PDT)
Received: from ?IPV6:2a00:79c0:638:3500:abf:b8ff:feee:998b? ([2a00:79c0:638:3500:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52af3sm8072162f8f.50.2025.06.29.07.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 07:54:12 -0700 (PDT)
Message-ID: <20f0c6fa-fb23-4159-b742-58994f2af30d@redhat.com>
Date: Sun, 29 Jun 2025 16:54:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 42/42] drm/msm: Add VM_BIND throttling
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
 <20250629140537.30850-43-robin.clark@oss.qualcomm.com>
From: Danilo Krummrich <dakr@redhat.com>
Content-Language: en-US
Organization: RedHat
In-Reply-To: <20250629140537.30850-43-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/29/25 4:03 PM, Rob Clark wrote:

> @@ -1121,6 +1124,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
>   
>   	/* Flush the remaining range: */
>   	prealloc_count(job, first, last);
> +
> +	/*
> +	 * Now that we know the needed amount to pre-alloc, throttle on pending
> +	 * VM_BIND jobs if we already have too much pre-alloc memory in flight
> +	 */
> +	ret = wait_event_interruptible(
> +			to_msm_vm(job->vm)->sched.job_scheduled,

Ick! Please don't peek internal fields of the GPU scheduler (or any other API).
If you solve this within your driver for now, please use your own waitqueue
instead.

However, I think it would be even better to move this to a new generic
drm_throttle component as discussed in previous patches. We can also do this
subsequently though.

> +			atomic_read(&job->queue->in_flight_prealloc) <= 1024);
> +	if (ret)
> +		return ret;
> +
> +	atomic_add(job->prealloc.count, &job->queue->in_flight_prealloc);
> +
> +	return 0;
>   }


