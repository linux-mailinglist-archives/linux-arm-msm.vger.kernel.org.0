Return-Path: <linux-arm-msm+bounces-41753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A449EE837
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE84F283CD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 14:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDA72147E3;
	Thu, 12 Dec 2024 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lbuylqTb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0414B2135BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734012246; cv=none; b=M7YY5jNvBR9pAJAS/nqmWqb+ohIbye3vDAkxhviy3UNMrg595donHg/mUricHjZvau/DWqBMNTuD51ISqPBxxiFI4WeJd7VG01y9lkEw7ZiEbrUk9et/ew6den5eWo8Z471TEv/xbujvl9rlcm2NnY2npKCJ1tHMlAs9IbuRv5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734012246; c=relaxed/simple;
	bh=0clCWrGBpSkpZ9aHSFW/0CsAHfJ3VaJRG8xLf2OnhZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H24H5daoQOjucK5NdwpXliey0uELyHwjTc8m7APuE4wFjXNhadoL4/LTUZmow1gYr38HRDBdvOyN2Utqfa0YH/6jMKC41oxnbZpqulSg3I6x2mWIo/KIU3630l1PTx2A97g8pUSajwDSf0pNXVmD7M4/IU4/O308x8PIZSHz01w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lbuylqTb; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3862df95f92so345596f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 06:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734012243; x=1734617043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NTvOnHE1hh8uNaAY0Ob6P0uimOUvscrCyQDIQ9oqKM=;
        b=lbuylqTbIrc+jiCBds4t+bAk7nxwZKtX+e3480v3laYAuNWuCNTA29tVmy/RDL78Xa
         fKOd/AP6BY+ah79MP9ayxQuLAlWj4J64KJy3BadRYAER5wx2kJxRdxxJc4b+haiuK7Dy
         MLQLGJR+mdeNr488/yt4KaYzhGk+AP379RiVjE8KchIzeGv+geLyxcZlVfR+194pOHNE
         JBx3zWwQj5IwMajK2mMz2hAN6LSNf12PWJQl5b6zn1Yha3D26aRVtOOVGpaWkRXcvQha
         pggI1y22LS8ggmrGe5eAWbQ5H6VIqzeULflfArOVc6ULjU8HmUmiJ2rHEvkCf948gMqP
         60KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012243; x=1734617043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4NTvOnHE1hh8uNaAY0Ob6P0uimOUvscrCyQDIQ9oqKM=;
        b=XDd9S+gzAUZ/FtRNwrcUwmAZTPK7ioDeaRjQg4Yh6oWE1U2YYmX2yJnpNdP37DlXBM
         3HYVYSydIKtOuRWGesfq8n9qINZJq1rCebdQws7h4D0KD0RGintPgTIUNYxoz1hTuWMm
         M8BUXwLcHyYyLLm6AhUiTxmEWvpFlOdEsF/hShGgVUZjYwd6QBcK6s5fn85iSIW6+7JV
         aVOUfzMYG4YwF99BOF4IGiRH6zyy0Xke5BbHe5RzCWl6rvBeIIUF/mYn8mR2mO8b0pL6
         qtzaeYkdJK3+j7fx5V36CVYvwXuvKGO9+GLghiDHhbucvCqwH1Acjal9S4hpGrXji1P2
         uBHw==
X-Forwarded-Encrypted: i=1; AJvYcCUdfXyJgwHt3CT9xch7aiO48g4EM9IX75yrsFWb9idL/Q65Wms6QyjrqFRGOTVTGYBOpfSQHEzDfCRTVAvG@vger.kernel.org
X-Gm-Message-State: AOJu0YxqCirGd7nytT/cGGqIEcIuzLp6/s6Ix/8x7gSqjNyno8zylQdj
	GNMxxD/huTEUL0tVDOXE759o4qm/T/b1GqsAnYejlEVTNlKoxDETnaht++G40Pw=
X-Gm-Gg: ASbGncu3axaAxnXYEdq/Jgx1WCLS0BYzpS6Fn+3kh+yvuPESQgQLKIcvbkW4kWULYlE
	hUTS7sV6nW4Nrvy0gV4JuhwVZhVTRqnE99wOzfnS+m7G2X8CIQiMfhLzpiReLBDG9tJjES6eSkV
	+WNzTx6N9QrdgnqJtG3Qf7MHIskmZMT7Gc2tpJgZB/HFlvTw2CUN2Ef8mPNmRx/WDjdtGIdH1Zt
	xslypi8QTZAUmNhZUhGBsUU1wdf8h3UlcWX064cfM0soo0iXQIydaoCkdzl1vfMMX1hKw==
X-Google-Smtp-Source: AGHT+IHQhg1N3HLj54dub1op17V66eyUvO6n2hZgAgXvqBl/jqbmIbfHC/VhKCoRMTmzyfBX6zBl/Q==
X-Received: by 2002:adf:e18a:0:b0:385:e8dd:b143 with SMTP id ffacd0b85a97d-3878768e78dmr3259121f8f.19.1734012242852;
        Thu, 12 Dec 2024 06:04:02 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878251c1ccsm4191693f8f.88.2024.12.12.06.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 06:04:01 -0800 (PST)
Message-ID: <dc7b546d-6746-4559-b1fb-0e6d768c3399@linaro.org>
Date: Thu, 12 Dec 2024 14:04:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-13-quic_depengs@quicinc.com>
 <d8b73275-a52a-4cfb-91d7-948686d3a5f1@linaro.org>
 <82f61951-89c3-4793-82c9-581f737b5303@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <82f61951-89c3-4793-82c9-581f737b5303@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2024 13:39, Depeng Shao wrote:
>> Have a look at 7280.
>>
>> The parameters to the NOC should be named.
>>
>> https://lore.kernel.org/all/20241206191900.2545069-2- 
>> quic_vikramsa@quicinc.com
>>
> 
> Do you mean use QCOM_ICC_TAG_ACTIVE_ONLY and QCOM_ICC_TAG_ALWAYS?
> And, I will also remove the ICP and SF interconnects which are used by 
> offline HW, rather than real time VFE.

I was asking about the TAG names.

Re: removing interconnects that's up to you, provided the removal is 
tested on real hardware.

---
bod

