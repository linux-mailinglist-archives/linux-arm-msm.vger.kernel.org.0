Return-Path: <linux-arm-msm+bounces-31597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD32976712
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 12:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 856871F22927
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 10:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634831A0BE0;
	Thu, 12 Sep 2024 10:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="SuvMnECE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B09F19F43E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726138571; cv=none; b=gCHyigEkVS4ArTMar6RzFOy+vvBVfap2dThQwpk23MWq3hFPTCt5sZ7LeOufg+MQqfm4DmCK05pU4KDVZyWDpz4B6x1fiQ92fGrjFi+cs7XUprilRvAFRiwSVPTvOauC4ykw7Tza6AnNIT5petmrtLhDF0d5hXGiKcM57NNcv9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726138571; c=relaxed/simple;
	bh=m4DQqclehTeJ0bHwZz/3hIYYXgzo3cQJDlxwsOgH19U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQWK+4EW6Z9DP8IWl4WXP71Z2sKa7axDbTLdRzgPqvv5UHaT3VZ3a5xNg4IshoALhX8sUPFMLqzRfD6OzGeuePzcIakfNBAaC0ywsS1vh0dCY00pGZZ0WCFI7fDFPLUf6hd7eFq1ua6w1+vIfKNuGTJp7p/kpKxB/SXIewHDi80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=SuvMnECE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3787f30d892so570597f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 03:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1726138566; x=1726743366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nt9opV20XXsOa5z/RzMwdzRNoh6hR/E6GTyAUXLI6Is=;
        b=SuvMnECEd+U9PS8GygrIAAZqW1basZ8/xKU3qg8y4xxzS0e60qGVtrbavQlRRbDtcQ
         TkMl2TF86mu/VxKpgerkmFWol09WaZCSrRJlMKYodjeK420Ep3qrvyrgZLCkkzcZpQSL
         HrX2+QKPkQR4vFs8oVweYCBD1jcxyibwsUbuIo4OjRgE1QW2kTdIDm2gE5RswPmkhgZc
         qn2EJTW5E6PeX/VDov2cwg4mmrTU6jhKSD3PPloOqVPpsKewtsXE0QlnoUZWdQ6gw82Z
         FtQ8RmZiuIzQD5AZ6RMNZHuS4+KMXg1dDkQKxoybQ/gS1GAF+EM42F4gy70/ly/g4+r0
         GTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726138566; x=1726743366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt9opV20XXsOa5z/RzMwdzRNoh6hR/E6GTyAUXLI6Is=;
        b=L3MqeJdJHErBZYjUGMXZYf1205vXxIIV8ZYoBw0+78250GJY7hoYXqqb9Y4QajbNuX
         I+98Tc2YHWrgC9dwC2N3eiaFDti3/b6nEa+fpuMB7e/yzk6PxWYQgRs2C2unrYLzNuj1
         kfzstY3Rl04P67kAL4dtELXLxQCRxmpYrI/P+Tu31H80fGIxmuVXY2iRAuw6n0I7hwyd
         BR+vJaOJty9ntKwNZR93yMEnqNsMmVIshjQJyUXtCXBTInyC+SM61qxc5XHAAk5uln56
         OrphQbz+NwBn1xFV87Yc2HNr6C8Ko2TglypbI6bFGOsQ41WD+hjmT4fho+VyCLMHXfmB
         UTIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDl4vv2LK2CT4i0SvN5SSzvdIZmVXaiPC82yIujp8oWM6u31jsBnM4NmLJOOaGUxw3bjHXuuY7BasP4HjW@vger.kernel.org
X-Gm-Message-State: AOJu0YwDMt7ACrVXUDtJEiuuzXmDSMrWUcfwykhvJdTY+JBIlir2/vEO
	yUIfDRIi1P7lhcFKtuqkRT2qGO0smqlQnZGKEkLFtXo8b30NMG6HV3i+7Jf+h4I=
X-Google-Smtp-Source: AGHT+IE9+wQX/1J2KsVADvG1QVUpPXoig/hsO7v0VZ7xjkRspuEnpc2g7y3vNOnUaSl7AMnmsynS5Q==
X-Received: by 2002:adf:ef4a:0:b0:368:31c7:19dd with SMTP id ffacd0b85a97d-378c2cd3ae1mr1221292f8f.5.1726138565430;
        Thu, 12 Sep 2024 03:56:05 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956e8a98sm14084691f8f.117.2024.09.12.03.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 03:56:04 -0700 (PDT)
Message-ID: <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr>
Date: Thu, 12 Sep 2024 12:56:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
To: Jani Nikula <jani.nikula@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Arnaud Vrac <avrac@freebox.fr>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr> <878qvyjxpg.fsf@intel.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <878qvyjxpg.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/09/2024 12:23, Jani Nikula wrote:
> On Tue, 10 Sep 2024, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
>>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
>>>
>>>> Building with clang and and W=1 leads to warning about unused
>>>> pll_cmp_to_fdata(). Fix by annotating it with __maybe_unused.
>>>>
>>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>>>> inline functions for W=1 build").
>>>>
>>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>> I think this function can be dropped. Marc, your call, as an author of
>>> the patch?
>>
>> ( Why is the patch prefixed "drm/msmi", is "msmi" a typo? )
> 
> Whoops, a typo.
> 
>>> For the record, Arnaud is the driver's author.
>>
>> pll_cmp_to_fdata() was used in hdmi_8998_pll_recalc_rate()
>> in a commented code block which was later removed.
>>
>> Thus, yes, it is safe to completely delete the unused function.
>> I'm surprised gcc didn't catch that...
> 
> Thanks, I'll change this to drop the function.
> 
> GCC doesn't catch unused static inlines, while Clang does.

It makes no sense to me that adding "inline" would prevent
GCC from diagnosing the issue... GCC should simply ignore
the "inline" keyword when definition is not in a header file
(maybe they don't store "origin").

Regards


