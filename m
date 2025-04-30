Return-Path: <linux-arm-msm+bounces-56208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 768B3AA4510
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 10:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 130633B476D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 08:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5BB20F060;
	Wed, 30 Apr 2025 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0tJbcci"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54412219A8C
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001160; cv=none; b=mDteGS6SjyyDrTuFfS+pYJiUnRpW4UuLc7X/lE5qC73H9ibxTdDTBEi3vFohWJpyhrtqFlATbIaH74kboFjsooLCqACYzgkphz9K4Uge5YseoHeGXq9/tOGEv9x0MbCJ7B2RCfSE0lYMARqmqaEBJU3JExvbWiTaZmHXRSItSDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001160; c=relaxed/simple;
	bh=fiI6v2sLSru2ldS3Chl17lyrvKpWDwMOwhCNyMMMPuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/Me3r4KA77p/4KmIYIOBtZ4FO/DBlA5DO3Z/EfhcKiXzqquHNX2zVF3OVF+qfEmLhDJeNUvSBksHTlmw4Ic5HgT6oKxYcFg7nEGxOWX7szy3zmxhpVIOx17oM0AIX2SXP/lBaYrdFEgkqzGnFZtJAYs0bQTqyEfVHQm6HFJKIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0tJbcci; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so502636f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 01:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001155; x=1746605955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UpunSQQmJd11F5PhM8s5L9YEZ9KXf1KKg9c45qMNfwE=;
        b=Q0tJbcciExaBiMS/6q0G3FiRPQ15rAe2qXB06p9C96g0P0CDeE9Wez00ua9vf8UtCd
         Sc0VQc2Q6scCBU1cn2Is/zFXG4ABoFqB9+cIdKMHEebmETABYjyMP3q/tXKhpFKYi77b
         hOaTCxmVb1CcqCaC6XgaxNN0FwvD9qwY3ia45ZvEROzabUoNasorkqA/bG4PElzT7em9
         55NtKkrVKmk88wSXHqC20VhW5DccjsJ001OCHFVTAyfvdqAWAHxuc02SketSuxpbsEXs
         TANqfNj2UoisV6nyJP3u4KU7XNJVL2w/zjwZDk4zeA4U2ptYxTi2wKfgASez/UsINWPt
         d8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001155; x=1746605955;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpunSQQmJd11F5PhM8s5L9YEZ9KXf1KKg9c45qMNfwE=;
        b=Ggss207BBs3Iu1XSOQjG85/GfWAOHGnnPF3XgvSnITz/0htXfG5y3Xx01m8d6Lc/1v
         wU93t3CsPoeE+0LrOzKawXuR7WDEpTn6G/hpESsL1o7HmtCrZ5LWHZ+RZjxdGd6hUuv5
         m5DFCdpxB1Ilw0hYv/nErWHnvh5BzJR+CTgFNXNIbxiF78PrY5D6E5AqsOvyt/1tmKJt
         2yhUfqScN/b3esObWe6h2q+9UC5ZEptcols8LRtcyOPdwsSqU563IfLRb5QmhzStoEOr
         JlFIGlLLAiJPtlm1c53o4x7FpEI7SibQmsPOnSI1ruXwTFDrWgetmlWOj/DxG7LTDAzw
         oeTw==
X-Forwarded-Encrypted: i=1; AJvYcCX3MHot1v2n4njOwVL2XN9b1exHol7ai3rxkd1RPfV+ygTxmhPV5ec9cCxyQjhDgIJeHNMZG3btyGLAUhDl@vger.kernel.org
X-Gm-Message-State: AOJu0YxSv4McPLQI1QhddeZtQTPHUypzcOmNI5kAE89Krg1kQawV+yw1
	8rKcbN8emOc0A4FbFgr2G+c7hjQLkX9s9t/MzxRpILmVE+tUVDV4/Df6Tfp3n6I=
X-Gm-Gg: ASbGncvW3a36l435w4NAooy6ySH3Xy+8o/OqJgX25jGACQn9EvfPMMEhMYB/dmJHb+4
	dEfFF+DmcMjFAx1xmtP0ssSBXgEZ7JE8/Vvf3BYSLpHFdstVRfnxPPYcWxpb6GO4PWGpWRGIc3J
	zBWAnmHc4pgOVxZW9ZMvC/hItR5kE54hkoorjA1IWqSJfpHYGbisGO1FoUCRhPYjRkvZl9UxKVX
	OhpEEhP5DTraBkLp0kw21jpra9RooBiWc0SNL8muJ7x4JSPkXG5538Zk2XK17FjRumpfDvLwJib
	iT8+3uLnhPE2CifD6HjnFBznJWsk6Y0RXWs+yMqejGr1QebTHOKy85eAwkI=
X-Google-Smtp-Source: AGHT+IE1qlH7u+YAdeHuBXmBf21Ma0kko6EXnXCydVXTTFQPPR5RsKgo/tR0GJokT9V5Sn48/V0JFA==
X-Received: by 2002:a05:6000:40dd:b0:3a0:8b90:1acd with SMTP id ffacd0b85a97d-3a08ff347b3mr497614f8f.0.1746001155603;
        Wed, 30 Apr 2025 01:19:15 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca5219sm15998586f8f.27.2025.04.30.01.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 01:19:15 -0700 (PDT)
Message-ID: <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
Date: Wed, 30 Apr 2025 10:19:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Johan Hovold <johan@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <aBHQejn_ksLyyUm1@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2025 09:25, Johan Hovold wrote:
> On Tue, Apr 29, 2025 at 08:08:29PM +0200, Krzysztof Kozlowski wrote:
>> Camss drivers spam kernel dmesg with 64 useless messages during boot:
>>
>>   qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
>>   qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
>>
>> All of these messages are the same, so it makes no sense to print same
>> information 32 times.
> 
> It's even worse then that (several hundred messages during use) and I
> sent fixes for these regressions a few weeks ago:
> 
> 	https://lore.kernel.org/lkml/20250407104828.3833-1-johan+linaro@kernel.org/
> 	https://lore.kernel.org/lkml/20250407085125.21325-1-johan+linaro@kernel.org/

Oh damn...

I developed this on top of next, so already with your fixes included,
but - following standard kernel coding practice that drivers should be
silent on success - I think even debug messages are not needed here.

There is really no point in printing (even as debug) version of hw block
EVERY TIME I boot the hardware. It does not change, does it?

If anyone wants to know it and cannot deduce from compatible, then add
debugfs interface.


Best regards,
Krzysztof

