Return-Path: <linux-arm-msm+bounces-11115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FF785564F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 23:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3EF72883CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 22:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D1D24B33;
	Wed, 14 Feb 2024 22:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHhTRsyh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6844E182DF
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 22:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707950834; cv=none; b=ZFIpVihntT5FkM9wOp+HNNWaKfQgjXHxtdPqx8hL6B1G9dl4Tcat/9qXWGCe1guLtkARzn31DZ3qGqe210ZCWPhZdWe7D3erZ1WfCJSbJ+KzJxztOPuWXJfbNpT5EZipx602C1L+x7cXBZ8yE5SRTXD94OBV6PTFTBI4p759eV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707950834; c=relaxed/simple;
	bh=Gf2q2LoXaXMedPaMD4X5vryBQGidRU+F1fsY7xn3vTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4gDuUONBkCfU92Qsdqrrm7u4gPSyo71wn5Gy1/Ntdm6kcbIBxbTe/uowH9XT75ApKSw7KAFYXSSPZdAX9agHph8nCnI3h2kU7V64huMVe/75x6zSvf9nuPtlk+Y82X+vaa/xF03BvPmGcMlyugxouxrtv6TFCq66Nfb90Il/g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHhTRsyh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-411c2f76308so1858045e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 14:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707950830; x=1708555630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUrf1CdULtCm842OixJA1hbkk0S+s8Yppy8hugAej3Y=;
        b=wHhTRsyhWKbkbJb1jAznBCSr82OFQhg46rxYP1NByAfnYIbmAOq/HCNWqNWImc+g11
         18KjXh1kkzlUWo68CvG5XtS+vzMOMKAkiub3bOaYVLr0MoURWKFa9Lf1EgClnDAs88V3
         qyQTjVQgf9WEaxET4Lrmyr7tFZh9JYOuh+HalsKBSpDVFf5of0mJGcAMRrOs1XUznCU/
         5CnP/myf4Aii9jxw42aiAXH049wQ86fJupvEtMUfPvUlUSBdlGlaEPY9Gh8OCMH76/Ur
         WsJscL+k/ghjdWqvEVedHgUZi89IX7HTI7oOkIVXclg0zuumvFwLIxI27r0Pc27kCHmr
         3/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707950830; x=1708555630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUrf1CdULtCm842OixJA1hbkk0S+s8Yppy8hugAej3Y=;
        b=rlzrSuEHuoCCvpXSHD+W98EA29Y2gdb+o25vA4XIN1y4ro+gOSBJaA+P/hICGK80AE
         hIj2Sbh2sySbcID66MGEaWyPImDrh+SFpGjS5ncXLSSyfqgUKm7dJ8yx2kNC0l3wTVtR
         mpcnoffD1CdWo/bLUtc0v1W7SUuNVv4vSEexpeRgxTJx+Q11tQK6+fuCArwaG0f05Wrp
         nEB8ooymx1GA9QAVEtasaT4gv7xofZjC75kKVevQHwkpG7n84zU93YJfOffYgJGhXKwp
         SxonKsa8gEZpPBeIL7w7/QovnkCZjFyLvOE/ESFzsA7x/IUGaSRnHVIEDRkBNm0OQkbD
         vAEA==
X-Forwarded-Encrypted: i=1; AJvYcCWvWRGlWtnjgmyFrheS7nZsUGepd4gfj4BnyhYFmOsvdn+Qc1EqdhwVTFCWLtY19tRqA6cBP9TpVPtvi3SM7vzhZ72KUXISunBUipjmYA==
X-Gm-Message-State: AOJu0YyXMysLEBnNQzhXqHzg9KwipDprnrjdFgyDMbPaJlP7Bs7KS2MV
	p0tkc1Alp9UGqr7V7COwGElUm0tRnXl7DdOIGCzHAo2TPXSp6dqDSIc8vv+DzBY=
X-Google-Smtp-Source: AGHT+IEF0Q3O2U6SodhFam8u8dA5/7RjyuClhUhZCXtOazYRLN454yBVCp8fjcPNIkGRrG2GrW3qqw==
X-Received: by 2002:a05:600c:46d0:b0:410:3ffb:87dc with SMTP id q16-20020a05600c46d000b004103ffb87dcmr21608wmo.35.1707950830657;
        Wed, 14 Feb 2024 14:47:10 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id t4-20020a1c7704000000b0040ef0e26132sm1786389wmi.0.2024.02.14.14.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 14:47:09 -0800 (PST)
Message-ID: <df6a49f3-88e9-46b4-b7c3-e5419fd01eca@linaro.org>
Date: Wed, 14 Feb 2024 22:47:09 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: qcom-rpmh: Fix pm8010 pmic5_pldo502ln minimum
 voltage
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, lgirdwood@gmail.com,
 quic_fenglinw@quicinc.com, quic_collinsd@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240214121614.2723085-1-bryan.odonoghue@linaro.org>
 <13baed68-1014-4a48-874a-94027a6dd061@sirena.org.uk>
 <f38468b4-8b16-4180-9738-0a2b557651a1@linaro.org>
 <dcce3fa9-ecf3-42be-adf6-ca653a79ba2e@sirena.org.uk>
 <3851e21f-f8cb-487b-9ed4-9975949ff922@linaro.org>
 <a09d6450-95e7-4ed6-a0ad-5e7bb661533a@sirena.org.uk>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a09d6450-95e7-4ed6-a0ad-5e7bb661533a@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/02/2024 14:52, Mark Brown wrote:
> On Wed, Feb 14, 2024 at 02:44:56PM +0000, Bryan O'Donoghue wrote:
>> On 14/02/2024 14:13, Mark Brown wrote:
> 
>>> Not just that but also note that every voltage step in the range will
>>> have the 8mV offset added.
> 
>> The documents I have just show sensors attached to ldo3, ldo4 and ldo6 fixed
>> at 1.808.
> 
>> I don't think there's any better or different information than a +200000uV
>> increment TBH.
> 
> This seems like a very surprising and unusual hardware design, the
> 1.808V voltage is already unusual.  Note that this may break systems
> that are trying to set a range of say 1.8-2.0V if they actually need to
> set 2V.

Hmm. I'm sure the rail value should be 1.808 its all over the 
documentation for example when we get to index 3 we hit 2608000

REGULATOR_LINEAR_RANGE(1808000, 0,  2,  200000),
1808000 0
2008000 1
2208000 2
2408000 x
REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),

And there are other rails @ 1v8 if 1v8

The one thing I can't easily verify is index 0 = 1808000 and not say 
1800000 or indeed that the increment is 200000 and not say 8000.

I'll see if I can ask around with the hw people and get a more complete 
answer.

Similarly now that you've gotten me digging into this problem, it's not 
clear to me why this regulator isn't just a linear regulator with an 8mv 
increment over a range of indexes.

At least the documentation I'm looking at doesn't elucidate.

I'll dig some more.

---
bod


