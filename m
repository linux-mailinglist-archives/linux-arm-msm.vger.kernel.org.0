Return-Path: <linux-arm-msm+bounces-53002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2322CA78988
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41B773AF0B0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2181233D86;
	Wed,  2 Apr 2025 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQGgFccE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD8E23371F
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581495; cv=none; b=agUYlFTr9lGMhKFjCPc2uZrBydelEWNX7Ll7aLeCWUESqfbIky2eCREvvKl5Eqi7WyfNntjHfJd23UdcDceFp7fNFkn4cRvf50FyKKw1RuJf5T0LfKwAMPBSCEahAsfjJXofvONvRNliLxtF8bYIMKjcc3N21Els14yzIEH4CwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581495; c=relaxed/simple;
	bh=0cjdRtAyc7Px1cY6aHSxrqx02qbVdI+k/2UMUqPwMk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sm71n+OOiYSgzheWF6WLW5HjZPHAJkknStaEoy3kVeo4a0b0awRzP1etyKDKqu6YLv5/hPrApnAT40iI907brf5Tl4v0EPW9ROxtefeVSidVllwqUG81SAMB2CzgOgq8pJf5fXJvZnqO641EvMgGow74x/sfVeV8wRHZlIzjfc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CQGgFccE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso60644785e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743581492; x=1744186292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dWB4iyOPjGa3JvhHFf0OgRFJSrqP/oOM2ls8icvbkUg=;
        b=CQGgFccEALP9ATYuS6WWClLU+UeHbfI0FthAwXU8cbcQBFktL1D0xJ0XHkOmy2rSaK
         gt8he5G87QlBoyTp/r+FL9A2m+bAihWL2heWRrygtkl9Ce4aEpHKaxLgGronwissRVGN
         9QqZSmScWW0YtQZOeqw0wlKsBZLltx1vqTQiva4VG7x/8WQgJrlbS6tHRcv0bhIxqf8U
         aByF/Yw9TXVU269LzVTeDFn23YMcH7VdBbR0HTXbmlBvLkOD5cXQdYcwVd0zVmwN8F53
         WcbH5+RUvH++fZhfU/luv7KRhfg2Dqof3T43OwCBZ5COjSq7nlGrhi12Bpc7gFA5ij+/
         Kc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581492; x=1744186292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWB4iyOPjGa3JvhHFf0OgRFJSrqP/oOM2ls8icvbkUg=;
        b=D+/vK7pUevWk03/Fgdhf82Y9irlT3H2neUKn0fD6T0isFmgS2etzcNvd797hvungcY
         /aExjlk0gpZ4Y3qQNuaGaz60srw649vOiugIYXQmNukfYadVztNhal3LlRPWdN5on422
         PE4B/pSEHQI+JUtCqFsQ0kRqI1J+SYH1smusSyqa/WWrkx5txX1tABLjK4+BFE5vbMGE
         1Or4dLB7kAlbhHn9lfqXmuD6CPddgy8UFDpTKCfLC3TiFzgYTq3tNt4TOVOuvfv+GIQX
         6mZKIM6vwhbOP5H0l1eklS+bk9U3k9+/XMi7+Z1v13dLyjnOrAUFQSsoZmwX0F36WcuS
         NNcA==
X-Forwarded-Encrypted: i=1; AJvYcCWHCocE9I4BoHnI/iSN9l7vo1XjH+Tx60jHnT8vBYWLyNrROG0B/g/5cusvC7ZKHRZOO8Jzc6NBrIaXMiPH@vger.kernel.org
X-Gm-Message-State: AOJu0YyrsG5PNdkagZaaiq3Qbjb1Qy3iLGLhbg1F0JdzVjTYVLQ+E5fx
	Toeb2IoMNUf8pDb5fMAbmGB7QLC/iUbfErNkh0r/a9zavLRFnQSpfNOkfy7yC+U=
X-Gm-Gg: ASbGncvBr6mX+LiagHbI8QyOxprFJthQZKoNezbaVs0pp0bbbXQM1dnV1To49icZevO
	lJmlrj+k2gj2wvZVgmKj4eVseflFzFzp34GfVwohLA4oDJacXwV/APUGzxTVyvvMmgJIB/p2Wez
	SlDuDRx5smBsZNmrqZhXy3m9JTzK6xptzD81F8upnZxF4Be5i33M54O6LJi38JEV3gBvTHMdKaQ
	TDEkcY5goIPN0nMaKV87aCwDYK6cPyqFrWbqmwL0a0C0NLU4e7UKMNkqx839XNwZbCjO2TNB+r1
	GqYufB70NIpBLzlDkOigcGGfIsvO3pttqKeRMdvbM5KFAZrMTpXI6hoW/Q66uHA=
X-Google-Smtp-Source: AGHT+IGBlatt9XRxf1VEZzEp39rZq64LmfgcstZnSIvck/QvLxH5SbIITWq2cnYOJybXJkyGikBbpw==
X-Received: by 2002:a05:600c:8411:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43eb3af4581mr16487215e9.7.1743581491995;
        Wed, 02 Apr 2025 01:11:31 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0afsm16439234f8f.65.2025.04.02.01.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 01:11:31 -0700 (PDT)
Message-ID: <e1ce7e09-0398-41e5-ace8-50b9547622d1@linaro.org>
Date: Wed, 2 Apr 2025 09:11:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] mux: gpio: add optional regulator support
To: Mark Brown <broonie@kernel.org>
Cc: peda@axentia.se, andersson@kernel.org, krzk+dt@kernel.org,
 ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 johan+linaro@kernel.org, Christopher Obbard <christopher.obbard@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-3-srinivas.kandagatla@linaro.org>
 <e8bf5dca-16b1-4bcf-b3ab-3367f29264db@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <e8bf5dca-16b1-4bcf-b3ab-3367f29264db@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/04/2025 11:16, Mark Brown wrote:
> On Thu, Mar 27, 2025 at 10:06:29AM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> Some of the external muxes needs powering up using a regulator.
>> This is the case with Lenovo T14s laptop which has a external audio mux
>> to handle US/EURO headsets.
> 
> The ASoC bits of this series look fine, what's the plan with the mux
> bits?  It looks like the two parts can just get merged independently.
ASoC bits and codec bindings can go independently, there is no compile 
time dependency.

--srini

