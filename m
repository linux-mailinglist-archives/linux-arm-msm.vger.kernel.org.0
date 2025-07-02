Return-Path: <linux-arm-msm+bounces-63401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBD1AF14F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 14:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC9B97A64BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 12:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1018D26CE18;
	Wed,  2 Jul 2025 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="elPdaOBf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2166F26B773
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457983; cv=none; b=TFx7kSt8cvdGySFGKQminFzfCARp09/cgQjRB8iKUPNDyOuDPwAKE6ypmhMg6bm0k2ogNbpSN9S1XgkC2RfbOtNElr7S7NTjW1TsQTen4DOuI64cQvan4/mVFYvwa87iacQeQZpwjADwT9sWyliO6cL9tIpGVxWs84nItEituNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457983; c=relaxed/simple;
	bh=GVNj0GiDbzEfuPNlWlITePA20oGFkxhZ//VQ6Wqj9z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zp1n73MMFD7pNJI503JUhb9HNcsNL9oh6jvouDFgwEaa4Zmo0szHw6cxFF9aY7g9v3VA3VvqwmjPnsDNHedSP8bbo/4t8l3Tg9qThSEwDMFDCj4lu0MPWnIJv/X+TjWtl0g5VhCT5anXA++rY9c9T4PrjB/1dQrmqf+UQkuQ1mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=elPdaOBf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so47598615e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751457979; x=1752062779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4I9wHRK6ycL/nw5skCVK6BibKiZIXkW4VmffJ6mPK24=;
        b=elPdaOBf1Y1osT08GlI0yQdY9yz4+VCtXoORGaEDDCY6UpcbTyPRcbfPBqjBONJVnx
         MmhuaPOftEXpMQBKVAKHoeXygZ5GBU9TwsTIduNp3yrNBhLzfMmkKlZKb1iWcLUu9KgI
         7+Blwbrbc5wPF3Uo98ROKzmJMaJX+7urND9kwFBD7IMGk2FLoCclyVkPxEhvDiQA7X6D
         UXe77TD3LlZqg/anNUEQ3Huokik7tBwmQQGqmKnUrJRy1A7ZKjvRvDaeUSMyMqAIQfKL
         jt6SEqYCwGM4FQuD0sJ+hYi1Hdc/z4TwR6l5UJcdc2bortlRVmFZbmCMY5VunfmHTQqv
         AZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751457979; x=1752062779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4I9wHRK6ycL/nw5skCVK6BibKiZIXkW4VmffJ6mPK24=;
        b=F9+Yhe885W2gTYrpz8E3QVrsRsC33+h+BRv4OgaMU/ZleP9ftzpinVlhjzbIEBeiGC
         oWd5UV+dcpli3UKyxJOj171ZG57eXMWRwTdyXx/nmX7QIJD0IbxbBDEyNa3c3F0ipIgr
         b6zUUB8cjeLcDU/8/+IQaIQqbO349EzX4Zg5bOvJ3xfrcyR3y+Iy0RB7KGQ9UongyrEZ
         GlsD8PlBoPKYCos9cWWPjqSCBykHQ1Ug4PC1PS4o2bb1WJPmsB4x/CM1i+Siu+87bVPb
         xymDAs2uT07dTKZjUltKXf4jGabrSfJYI2Ts/tusl2rLNs5+sawZnXvCB9eJFTGTGANj
         RApA==
X-Forwarded-Encrypted: i=1; AJvYcCVC84X/kuDlQRL3r9JwSgYJaa8bGQucAqG3JA7xbkc6qMkzBkGA5oMnY1IbIBEq5kGKyJTHcXzP4/wRnhXw@vger.kernel.org
X-Gm-Message-State: AOJu0YwWOOaEUCEaImalTVLg6hjLctYCu8FW5wwQdU3N+pqFMArc4AQn
	eKbC680NYl9KrXaocB6tygDhqH04/2dGwKSoIFvBQIraZANPqbPAct6EGYacv+Kyc34=
X-Gm-Gg: ASbGncsuxyeB3kJWrc8B2JWKquKHGaxM//JOBYPyuonLEodWFX0GX1X8H5EglK2rtUb
	2/L1miU4ynSg8y5u3izwlYnfjuXCiH4lSB/NaakDBeKsXZ7DXLXe3LmhVq/cemu7BqWys8HnCfT
	w0l5gikjnU/K08F0QFlZluy8wuOTI0QtfZ8+yxG9I4fiIJwAWxGrYthko3CmiawKtktBZMkbCPF
	vkRhbnFm8ozms292TaABFdTzePF5qLnxuviwZgjVZVrRew9eKzPhix7gCV4TQ4OMyuF6v3ojWLG
	QplY1eJybrG/vXS3nXgTD87UJ/ExFUuxZs/a44wo3ThazO/qO8eYeBQwSLsBZjD3ksHgfVESw0l
	udODaEsGnmkBqw+/tKtQ5PWGa5o7y
X-Google-Smtp-Source: AGHT+IFiGQ8eoDbIef8H5WgcGBsaUK7l+LIPHU5+0N6yFyzZ/rasF17jb2K+ACo904sf9rWYtcqByA==
X-Received: by 2002:a05:600c:c08d:b0:453:8e3d:26ef with SMTP id 5b1f17b1804b1-454a3c22568mr18064675e9.6.1751457979384;
        Wed, 02 Jul 2025 05:06:19 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233bd14sm230508525e9.2.2025.07.02.05.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 05:06:18 -0700 (PDT)
Message-ID: <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
Date: Wed, 2 Jul 2025 13:06:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <5f90547d-945a-4e26-b36c-75f2d8a1af97@kernel.org>
 <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2025 13:01, Vikash Garodia wrote:
>> Anyway, in other messages I explained what is missing. You are changing
>> existing hardware and you clearly must explain how existing hardware is
>> affected, how can we reproduce it, how users are affected.
> Exactly all of these i have explained in the commit message. The limitation with
> existing hardware binding usage and how my new approach mitigates that limition.
> 
> Coming to usecase, i made a generic comment saying usecases which needs higher
> IOVA, i can add the explicit detail about usecase like 8k or higher
> concurrencies like 32 or higher concurrent sessions.

Why not make this change for a new SoC, instead of an existing ?

That way you don't have to make the argument for retrospective ABI changes.

---
bod

