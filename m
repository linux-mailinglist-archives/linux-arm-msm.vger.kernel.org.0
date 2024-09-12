Return-Path: <linux-arm-msm+bounces-31601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645799768D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 14:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC93CB218D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 12:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB2D1A2567;
	Thu, 12 Sep 2024 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="Omj+yh6P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D7D29CF6
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726143256; cv=none; b=QdTdpOOCrjn0Av2hw0VYwm1mDD5kWDCy2ogujuqGTEf45NSGAYz7cA8Nx/uHPJg/klhIVSuJiDrLrhrpLzikpw5PMJ9en82IwsSW2BBpqdjCaQ1JRbfoQ+hJNa0L08DdeotAfOR0S6TyCe7HlyWowQ7v4PQyNV5/Q+vXx6UXY9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726143256; c=relaxed/simple;
	bh=UtIt931CJLYI0RgFqHsG1BIIxNiEzyf9O54ny+H/o7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkGH4m2IumVjDYs5ltgnQUKHqfozo3u/sw6L1FOQoko0tWDl2jB/oa/5obvi9PjinMt+UZL9y++mQ0LkRXWdbR2DQ32XPTrmBQOhNIyikquShfox31aQe/TAisWmE2MnfUHxS/41fEXK1RWX3bxsKvauXc0Dp87NBZaRX8xY/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=Omj+yh6P; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb60aff1eso8386685e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 05:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1726143252; x=1726748052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bORY3HlP0kOQCmx0LKjYAH7NpqjR028coTgUAD9TUQA=;
        b=Omj+yh6PCwvcBAugTGwajAl/oES0Tx+FQM6fLSDn/mtVtDidrqgEwned12n6eNuLuA
         oGnUDa8xiC+hGAkCWIhzheNu4vnvJFGoT7QE9WKXeGFKNPinWqQPwL33j8/1F8eR5de7
         81WrWFoyZSHwq15K7RG30ROOeQg5CgwU1snIX7vvmZtD5tDHauIEXyYu1ofJYjxz3LLK
         cQwbJKpt75eJqLI6BlNjZ2XpmfHbi7rzN8WMlPnCTs7gCcH3MjkdVoDijgVKEoNT1c1D
         oMkWf+0zC2vk+8Sqyk80vosYA8hahZJ5AeXJ4HbE3sHAabfdQVTE3mugqS6kb2pVaJN5
         1ATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726143252; x=1726748052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bORY3HlP0kOQCmx0LKjYAH7NpqjR028coTgUAD9TUQA=;
        b=v2pQv67nQfWUGLal1TCCxwaWFqV7HGaDrhB3iLph1lOLoxZ8/FJxXRxWAyQ1iSxAbD
         pJSTffgVQD/wKfgxLn88sUQxtZfQmjf+ZBmGdVNr4L6hq21EsKe6Buy9OMDwuM5S8JJp
         ET91mY+sZd0fEiXCD1GhrF4EjBaoI9hnUUbO8HSau4V1Tg14skqNF9gyLEeCI8/aPbBl
         5X3Az09c2Fw80KhMI9Fr2CE8tskS/M25YOAxSHoPuxpofgKj5LmczODNVfwbWeFrLG/7
         HQXuU9NEAceasBc7exd+0QKE+ah6EQCQUGUh6uYXr9SDKDWyXXv/6vd4YioHtqdK9ITQ
         aSnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT6Pxh0ITba75+v/AU88QdqwymKdc5VDMfi8Q3FTy6ydT+atQG1iQZr9goOSdoqBs6mIycvPImU8q8iEwz@vger.kernel.org
X-Gm-Message-State: AOJu0YyohY/Kjg6jPKVtqrGQIsEEeSw4FLH0eFGPEa4KTLKPSvJQ9JJO
	xATDkmY0ERvQ8yIwtu7+7RmfMX5rb3TRsSqYSMR7NBMcXgRBBezAPVNthS0YpJY=
X-Google-Smtp-Source: AGHT+IHEBljsXZHgMq2X1DZ+waGkIVs7/2emM2n8fTffmGwuJ7pI0ZvONKQFZiDu5gqGP2V4v0tYJw==
X-Received: by 2002:adf:f3ce:0:b0:374:c621:62a6 with SMTP id ffacd0b85a97d-378c2d5b297mr1483853f8f.47.1726143251095;
        Thu, 12 Sep 2024 05:14:11 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb2a08a1dsm152643165e9.1.2024.09.12.05.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 05:14:10 -0700 (PDT)
Message-ID: <c2ed3380-82c3-43a3-9c01-534b08333f95@freebox.fr>
Date: Thu, 12 Sep 2024 14:14:10 +0200
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
 <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr> <87ed5pgm2i.fsf@intel.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <87ed5pgm2i.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 13:15, Jani Nikula wrote:
> On Thu, 12 Sep 2024, Marc Gonzalez wrote:
>> On 11/09/2024 12:23, Jani Nikula wrote:
>>> On Tue, 10 Sep 2024, Marc Gonzalez wrote:
>>>> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
>>>>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
>>>>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>>>>>> inline functions for W=1 build").
> 
> [snip]
> 
>>> GCC doesn't catch unused static inlines, while Clang does.
>>
>> It makes no sense to me that adding "inline" would prevent
>> GCC from diagnosing the issue... GCC should simply ignore
>> the "inline" keyword when definition is not in a header file
>> (maybe they don't store "origin").
> 
> Please just read the commit message for the commit I reference above for
> details. There's not much more I could say about it.

OK, I read 6863f5643dd7.

My remark still stands.

GCC's decision to not warn for unused static inline functions
in source files (not headers) is questionable at best.

(For the record, I think clang is the devil's spawn.)

Regards


