Return-Path: <linux-arm-msm+bounces-39579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 964899DE655
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 13:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 524781620FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 12:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032CC19CCEC;
	Fri, 29 Nov 2024 12:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkuvstxS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DA319CC34
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732883119; cv=none; b=a+E6f/ODlZ5wdbSwWLuNIR+/vB8guPPOGrlvitwCO1h6Itx/gqzNQwFc0szxn2OAXls5A5vX06p0MPeq+fEvT1fbc8OwtRoRQYbIk2DWWuol+8V+PGn+Gzom+f4AZWUnIhn/MU7WDDm78QHkwaGM56hhWULu1N45da1ItzjCtX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732883119; c=relaxed/simple;
	bh=o8HEnOjpe2SP2Y+jogFDyN/Mo0SW8oxuVkT4x3RnrWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZKdzfWRCDiixD7+n4YJJskfrnCcU03o6/eade7tN45W4a5tZXS3KqWYVAc/aS0zPC+ko/xuJm0JZbQdh9pJNext0IDUNmX0GiSXZZd5yh7hy7XgzkgvzHkaKQhxY/83izS9pSFi3B/QF90PvzWAbSxigasanpvoivQf7H1LUQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bkuvstxS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso16507335e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 04:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732883116; x=1733487916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9PyfoxYk6cSqtAE4cwiXMDHVr0/Xlhbbabc9YAFuxI=;
        b=bkuvstxSS+qwrR9GjvQoA/59h94558eTRpCzOI0W+FkHlyNB54386VcrVUJk1F8oG1
         rARs2uJkwC2WzdrLjWzo1wxiNHibBQC/GRWVarjHgaQaB5uRddAtBY4WMp0bPHAcLBO3
         Q8l2IKSakRt1m5PxbyU4SGTs/WNqlE7KcuCJnl5K0dbpU8IgRPR2ReCkj5/1rtAnQ/Rx
         w/s5LGD/4IDzamFLXC+hmnHhGIOp3dIOa91MYmXZrNRnQ5X8uGoc8acMyWzOoUVqVzRX
         8rUliTOYJBZhYZA+8IpCYK2+fn2/J6/52uF1L/oxPgmPPt9b/Fn0gYWFYnByB6Qn1Ss+
         KcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732883116; x=1733487916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9PyfoxYk6cSqtAE4cwiXMDHVr0/Xlhbbabc9YAFuxI=;
        b=ClP3o0ZTHo4O3O200U3mABGyTmm4LGsFGpVtnYFQzyGw5LQDJGWi3BJtiHu5zKbO+h
         kCGpSb3DN5nzzVLhPe5A2PGuFn/16ECWj8muvSwjM6BsSTZK1cH1GpiQhk4xC9urVNIj
         10oQZXuve0ma7panHy8bN2rDFM/rQq8FVWP0TMPYG7atS/YxrvJw5SL/7e5B3BvnzV+U
         dDKehvPpFqL8Cw+OXxmVAIZ1TcaR2D/eYAhnu2k/APlsZxXGD0iZyUUWYHvE+U+nk9Ft
         rd9myPSEgbzNTQaFm5eggdKb1JyN3sjeiM+XPFb7rBbi82tzsuLNUTkbvi6Z8TBgWRPh
         quBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfnjiKK75a7/kF9yJcY5MNvxrpu2IHIkTdqDb2sNdZdwugpy55BIEEeMuGMUnHuFtEx2pkZGKrjvk1cYdn@vger.kernel.org
X-Gm-Message-State: AOJu0YwxDt35hJSU9f9NebvTyGFWLm2OB8TR7hidzDDM8TscFgbMNUcn
	YB0Jv7u6PbGMrvt90ceTowXTali9oqdpYe83/7Z0eIz60n3yE1lJYIRsuiPt1vk=
X-Gm-Gg: ASbGncuDAqFQc6IUPryBUviuq2I60gJqLUEZyeZ4rwltID+cpYLWnjDi2Bumja1H6ka
	x6NWYsc/28bhA9gIn5BU87UCLgGL3vlBouBcZ9MKUcBZR+/PZpGSomRBxNf+HnNxu2rIlV2ePi3
	N9LYJgOoRaw6bt8t29P5y4KvAkbpMNHKHzm4eMYE5KOFG/Esd+5iaC/Ojl7d8GXKt7LXKrZaN7H
	HO+EqbNueRwVWMMqWjuQq71U6fjoDBCUSVvWsrKCTFrt+WNgiwYppQPxVWxD/0=
X-Google-Smtp-Source: AGHT+IGmoCspL3T/lhwTwBWMmmVpK4Wfl8T0tGwPv1bmoDJfk4x0AfSr2KSu0p2y3balC3pqTji+og==
X-Received: by 2002:a05:6000:4710:b0:385:e013:73f0 with SMTP id ffacd0b85a97d-385e0137516mr1722779f8f.59.1732883116492;
        Fri, 29 Nov 2024 04:25:16 -0800 (PST)
Received: from [192.168.0.31] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dc715a74sm2353625f8f.82.2024.11.29.04.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 04:25:16 -0800 (PST)
Message-ID: <8dfd2ee1-9baf-441f-8eb9-fa11e830334a@linaro.org>
Date: Fri, 29 Nov 2024 12:25:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
To: barnabas.czeman@mainlining.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
 <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
 <5cccec71-0cc7-492a-9fb9-903970da05c5@linaro.org>
 <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
 <a08e95fc03fce6cb0809a06900982c6c@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a08e95fc03fce6cb0809a06900982c6c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2024 11:44, barnabas.czeman@mainlining.org wrote:
>> The change does not describe how to reproduce the problem, which commit
>> base is tested, which platform is testes, there is no enough information,
>> unfortunately.
> I can reproduce the problem with megapixels-sensorprofile on msm8953 and
> it can be reproduced with megapixels on msm8996.
> The base is the last commit on next.

Can you verify if vfe_domain_on has run and if so whether or not 
genpd_link is NULL when that function exists.

That's the question.

---
bod

