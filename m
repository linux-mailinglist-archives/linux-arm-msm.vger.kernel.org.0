Return-Path: <linux-arm-msm+bounces-23097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D248390D5F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5435282DC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E24E153800;
	Tue, 18 Jun 2024 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RNSBxOqJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D55C153573
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721557; cv=none; b=pe+lzsc71A8xksBAC7surdgrR2nAhoisitEiPJhJ7J9IdvGQkdm6Koi2tnzUWY7dq3DkjLsrbepW7bAsYagCzAX6S6jPEJcpxPgJR9KgydeTyYDnl8abKxWCk0gWqK6isO8N5NzR9CHNcrY/kpn/29pSlODqtRBrNTnyM5Unq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721557; c=relaxed/simple;
	bh=zrVZtKOw1wtm34lfpGY8EB2vsDosS6TKH8DIDwhCmGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYm+bTqY6jPrjwrxd6hKdWjwUkxFVzMkDGMhS57yawEYbzhZ7+Kh9uI8wiVg5hhhdWvs3RdbksY5d978lwZoVM4AD2Ls9Nz5768F4W5vkHDld8utDonzuVTIoqaGvsK8fMsoRPUJHuFyGCHtZhK93Z3L4iU9Xs1MUjfv8zekUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RNSBxOqJ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cdbso38426471fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718721553; x=1719326353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wdAgFpCSfsBaoK3eiN4GlXTRiQPusSTXTIM+J24lOEM=;
        b=RNSBxOqJIstc+XUQn7OUh9Bzi6stsMnI/6slcpqBKEn7bZUrrQF/20HJ5ivM63PoVV
         NtY4EHFLUMMEkCn+qsNclFFnPPgvCgaIZ4upkeSFBARyTQcTXdtl23DYNoJqRmw1MFki
         /ievN6j5MR9ui71olGFCmpk5WyrzBmK51TNKJV/iMeXQY++kAQK/ibOEI/j/ytGwcHf0
         njFz3XdUhoZrZLaTw/6mBGuOvOJAygSGU3FfGvfG98La7cUsbh54LvLEZznEzcQqemge
         mcJgu2BMrCZc/XZuKn7avqQ+b+Es4SxryLQc+/wet1a4zLbEz85UZLQkLZlr9bNFH207
         f00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718721553; x=1719326353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdAgFpCSfsBaoK3eiN4GlXTRiQPusSTXTIM+J24lOEM=;
        b=WLOJPQRPHXWEErNPlHi5a2r7TgKeAW2voN5bFyhHV8GEDOdQ+X7erkTBQSqmpU6LYn
         fWn9kcAR51QNB65+c1yEQeMHdGj3Rp5+klGHU9jsyjDVd5FmAfV/1zi6mHEz1Kho8v15
         KjUofcqM44XP1nGMIVE8qBpqaypw7WOBYTwmAGBE6azlBV2mVd64EBxJdn8pvBtyhUBR
         vidOwI++WrVIfu/g55re63wNHBhN8FSwdFbUJ02w5Wh0QUBS6mjAxMtkRtvV8ji3yGk/
         uEK55IwFlgWqxqi71b9gib3E/HxpU4hS3+gxGxcb3ea82gs6ECKv1NFyOvdeiCHdmmSZ
         +9lA==
X-Forwarded-Encrypted: i=1; AJvYcCU/0dlM/aWYJzXoSFcbndqg+giOr6jVJ7sUzEm0LmLxYdS97gdqzoRA5f/J3FlPdkYUYaYb5k+DpXJzBYTLlUqpo+YoxHKpV4WvUN6A9Q==
X-Gm-Message-State: AOJu0YxBPoaHU2C6kOCdtfGvIDvdlVF+hzOA6BsQ5aMl5PlIN2JAVU0q
	o2DMXQQxAawE197+RPKljYGl1j/z0gbttAS6aEKCLHOHzuh7uD0UcPfyINkg7F8=
X-Google-Smtp-Source: AGHT+IFpKUjGdBUk/w3QFo4wFb49hKoT3v+xxZtiuL1ieNzPlljX7lEbvTogCzQzGRTD99k7+qiidw==
X-Received: by 2002:a2e:a317:0:b0:2eb:d924:43fb with SMTP id 38308e7fff4ca-2ec3cfe9ee8mr277231fa.41.1718721553229;
        Tue, 18 Jun 2024 07:39:13 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c0605bsm17294671fa.47.2024.06.18.07.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 07:39:12 -0700 (PDT)
Message-ID: <7395f6ca-31d7-4ebc-b846-6c68e2ae2efe@linaro.org>
Date: Tue, 18 Jun 2024 16:39:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] arm64: dts: qcom: x1e80100: Enable bwmon and fastrpc
 support
To: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 djakov@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 srinivas.kandagatla@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org,
 dmitry.baryshkov@linaro.org, abel.vesa@linaro.org
References: <20240604011157.2358019-1-quic_sibis@quicinc.com>
 <be2dc908-c8d3-4739-9f46-8f8daf0f328e@linaro.org>
 <24d2d3b3-d676-8e86-bae4-c3538b7b9981@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <24d2d3b3-d676-8e86-bae4-c3538b7b9981@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/13/24 19:27, Sibi Sankar wrote:
> 
> 
> On 6/6/24 16:00, Konrad Dybcio wrote:
>> On 4.06.2024 3:11 AM, Sibi Sankar wrote:
>>> This patch series enables bwmon and fastrpc support on X1E80100 SoCs.
>>>
>>> This series applies on:
>>> next-20240603 + https://lore.kernel.org/lkml/20240603205859.2212225-1-quic_sibis@quicinc.com/
>>>
>>
>> Going back to [1], is memlat-over-scmi not enough to give us good numbers
>> without OS intervention? Does probing bwmon and making some decisions in
>> Linux actually help here?
> 
> Memlat and bwmon are meant to cover to different use cases. Though
> they have a big overlap on when they get triggered bwmon is specifically
> meant to address cases where band-width aggregation is required (meaning
> if other peripherals already have a avg bw vote on active LLCC/DDR, the
> vote from bwmon would be an additional request on top of that). However
> to make use of this we should vote for avg-kbps in addition to peak from
> icc-bwmon driver which we don't currently do (Shiv was planning on
> sending a fix for it).

Great, thanks for confirming

Konrad

