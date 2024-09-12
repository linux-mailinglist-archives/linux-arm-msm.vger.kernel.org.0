Return-Path: <linux-arm-msm+bounces-31604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D742697698D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 14:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82BF01F24810
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 12:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107261E49F;
	Thu, 12 Sep 2024 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="biq1IDh/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0881A3BD4
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726145411; cv=none; b=utDEMDXPNcOMWMQN9HxhciRNkUwCyDlbZEf+WwytwH1c1FzhJjjSjPFoxWxzzunPOkc4xWJ05yOKx4xuzkfNxy0cT50MIOIDRWbHOfZXmuHF1wN7Ponwey3A7umRUMAJJ84ZRM4OtXBpAqR7FyrX2MRrSG7LmovNC+JZA6YyUeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726145411; c=relaxed/simple;
	bh=sPW1kih8h0W63qwVDyygn731qGaFqgh/NrQpNVrGBXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cbere1ZuO0zjfXcie4h6S8vp91iZbrDVEsUzSjBOZ1fqkURQg4YbK6lA6Vv8m7Pr3eSHG0O/AXaNVQG47BxKuoiwQMWfmr88lpph0VidKdBGkOeTzOnNfqBJRezPxndrN+1Y+0oTy0xlA/V7mEX1U2OLljUqQkHuk/uRi/KpLgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=biq1IDh/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso7259755e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1726145406; x=1726750206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kFPOQU3GMjuvWQcs4H70Wo/maeGnFNSIqsgef5XY/WE=;
        b=biq1IDh/BNK1jPfLXMxgsmU/RFOIaqG0Qq/w1pahnyus6AOgtQ8a/7He71VaNe3V/8
         PCwhNx9nCtOyRE6j1zeEu8IP18gf0PooBlAAvmfW00rVxUpGaTkWkDO/3Z0yYIykOTVA
         cwjnoow9eTUEKuhza6kL5FmtC2JQV+F/bAhSQOIwOpp3SVANOJWP7DiUgyiFcjnv94bR
         SZO7irbc67RkvZFzzJCbUXQ7OyOLWS4eafan/ljJQSWqIlnJ2hE41n7mfC9Q+v2BwoQp
         K2H0lRZ7rvnKkMklw6qfHnYeKQNMy7AhHsKJIAOPUby4CkOalZf0AK/36X70F8D8P59F
         o3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726145406; x=1726750206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFPOQU3GMjuvWQcs4H70Wo/maeGnFNSIqsgef5XY/WE=;
        b=wSmxFl4dq7FGidmnR2fL7QhRwMV7epKYr6WPltqrwbIeavWWaO80NKv9sZe/k+AXxc
         UCs9hnML1+7m4mZSIc7ZduCKjNuHGuA85MoT2Fd8H0YEVhhnr6IV7QqPNjoeeuttM+Xs
         VehgvmLOrEpIYiswHt2Jo0rzRsaQUBua8z1/zr93YKhae4ZVS3NI5ifmBy4mav/vF0cT
         wXrwIxlcTw7JAeWmHs3tpM/08d2CXDCVp006wRGtwV/+EdfJ97uU6UVnSzMC5v8MzZNz
         Ou0j1454fvmwrhpywFj8F9iArHLXuGFisTKelqkRiOa/eAjCW6BE7aRDK+YXneBjLi3X
         nppA==
X-Forwarded-Encrypted: i=1; AJvYcCU5j5EWdIy11EC1PtdCCjxE0Pdp+E9zg2fseJiHjxyXaBotE1YPty8/h7dOS+bLVm0dxyptGJvjT0ukFgds@vger.kernel.org
X-Gm-Message-State: AOJu0YxOjo2Eg0LCOG2iwaRsvBQwHMVLoR63Z3229PPaJgYTiCBivu/0
	qMcDSaq/jwapigJejRsLMx5K33bPdazqsUEsW/5yKd53tkW3wpqgawlzNnpJaOY=
X-Google-Smtp-Source: AGHT+IE0mdXYD9UBDthqRnMkDX45dIfhIqhZHWCpb6Dv2rSoMAuL/MFQWuMEruuop+ZMck3cJiPsMw==
X-Received: by 2002:a05:600c:3510:b0:426:6eac:8314 with SMTP id 5b1f17b1804b1-42cdb4fbcdbmr22565915e9.1.1726145405296;
        Thu, 12 Sep 2024 05:50:05 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caf016a08sm172076905e9.16.2024.09.12.05.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 05:50:04 -0700 (PDT)
Message-ID: <535df4a8-2d4b-4c52-851d-b4306a28b07f@freebox.fr>
Date: Thu, 12 Sep 2024 14:50:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Arnaud Vrac <avrac@freebox.fr>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr> <878qvyjxpg.fsf@intel.com>
 <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr> <87ed5pgm2i.fsf@intel.com>
 <c2ed3380-82c3-43a3-9c01-534b08333f95@freebox.fr>
 <uosenmxvixug7yfakpbynbltryvvxqc2hxtagby362c2lvps22@kce4vsbi7xql>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <uosenmxvixug7yfakpbynbltryvvxqc2hxtagby362c2lvps22@kce4vsbi7xql>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 14:28, Dmitry Baryshkov wrote:
> On Thu, Sep 12, 2024 at 02:14:10PM GMT, Marc Gonzalez wrote:
>> On 12/09/2024 13:15, Jani Nikula wrote:
>>> On Thu, 12 Sep 2024, Marc Gonzalez wrote:
>>>> On 11/09/2024 12:23, Jani Nikula wrote:
>>>>> On Tue, 10 Sep 2024, Marc Gonzalez wrote:
>>>>>> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
>>>>>>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>>>>>>>> inline functions for W=1 build").
>>>
>>> [snip]
>>>
>>>>> GCC doesn't catch unused static inlines, while Clang does.
>>>>
>>>> It makes no sense to me that adding "inline" would prevent
>>>> GCC from diagnosing the issue... GCC should simply ignore
>>>> the "inline" keyword when definition is not in a header file
>>>> (maybe they don't store "origin").
>>>
>>> Please just read the commit message for the commit I reference above for
>>> details. There's not much more I could say about it.
>>
>> OK, I read 6863f5643dd7.
>>
>> My remark still stands.
>>
>> GCC's decision to not warn for unused static inline functions
>> in source files (not headers) is questionable at best.
> 
> What's the difference between source file and a header after the CPP
> run?

That question is moot, since the source file / header file
convention exists only _before_ the preprocessor runs.

If you meant to ask
"How is the implementation supposed to track the origin",
then I would hand wave and say "internal annotations".


