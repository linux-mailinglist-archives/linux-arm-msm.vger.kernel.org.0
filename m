Return-Path: <linux-arm-msm+bounces-8126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACFC83A9E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 13:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B75A8286FB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 12:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F5077F27;
	Wed, 24 Jan 2024 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g8yeZPCM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864C377622
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099663; cv=none; b=O4VoBNyt1rfCTMwerAQQFjtAK3h5JzDI16WesOMtKPX8GkZHJ8+SAcW7eWw9zfkwDxYTIlDwWm9aZM1Ttoo1lDTqNj1K6iD1DlFA6aMbXZPowALlApQFtut2iZkyYMYxoWlZNs3DwwyDDezwrl/Os4a1g2HD4NtX2DLvimbPcP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099663; c=relaxed/simple;
	bh=jyvSiO7pP8IS2juBo4PIGtSrz/acm4bNYI4ZPwuqEYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNS/wzGO6cDbaWS1UKlFk8yFC/xOhN9WJFRBgJwFN3pIThlI2pkFpbM718Me8ZBdwlAhDPLkDyUK7f29ICAsqECHmQpUtYRAFxXzpnKwyLyPTUoo3DF251Ojp7+t5BFevBDNTbZOImIaFa53wJf9CR8ukk8lWPjYQUOirvPLFpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g8yeZPCM; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5100ed2b33dso1201662e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 04:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706099660; x=1706704460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6RopD7J40Mytb9WIDlcCfTBz6ZKZHDbcmtWKYlQzcI=;
        b=g8yeZPCMoSSl/66Gbay5hM4HuKgGT9RUqr0MHECPOhg12FK2pQ4La74oi6SSo2npgr
         USSvOt2ST5ZbfDFQTLADgj3Qjy3Fnd4ydkF95jrNSo5ZAGMjM1JODqAdKUKSGV31L0P3
         IXwe1bceDZuutfMDNbMjZVKtVw66I6MqSli4wLKPTJq0LAbkizOC5Cn3u6G0S66mO4lK
         +wKXLED9P5vcg0VAug9aidTvcZ2kc0nj0LNJwqt6azSmcc5EFrmeo43st45H/6PAyNeh
         GOwSw2CzHbhVHjPaerSYJ04MkaPufGSV54/5WWBhAmQmbp9Ya94oefhu8DMuDGIqrCEW
         Svog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706099660; x=1706704460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6RopD7J40Mytb9WIDlcCfTBz6ZKZHDbcmtWKYlQzcI=;
        b=KVa4nmbBF0RuNi4IRqdFcN4ehd2iTkQnWyZnyRMYBx4CeWZlDbVwGTfDTQrJcWL/4X
         zspdIxExRRE6Sr+oy9wfWi68qePO2Zk4hR9ZmDEoLoEDYYW4nVRWbLEt95yr0ywgwTVy
         0bXTFYqN7oLoXbz1J7dLl+Y0b5hdjDmsRLGhG26kLC95P+skNCiBOG37nog7rShRdKK+
         ezgs6hgE0hgTWmBNidy22kL3bt7zkoSXU/OkIyCfIXcFUM00d6cu8y5ZfMnHUfG75efY
         LpvxSjr9DmxZYJcqwb0h0bJS1gmEN1YA7v8ZMViO2X+eoAV8bWHKTya1ScgErm7MNwi6
         wetA==
X-Gm-Message-State: AOJu0YzolKJfbyqSBzTe+VtEbh75WquUF1c9wuRoCYZlH/l0HINyuUwj
	484o3OaT4XBwr/gj6+Kug+MDs1vuXI+yfd6WRJLVO+FDrVZYzllRkikGjBMKmLI=
X-Google-Smtp-Source: AGHT+IFxrZhUS4GmLbPy+Or25khi6S/3hoZURFv44UJtwh7pvfKXw7sXxdDDR8uIyYRgssXe7kwJ7w==
X-Received: by 2002:a05:6512:202:b0:510:40a:4cb2 with SMTP id a2-20020a056512020200b00510040a4cb2mr1512683lfo.38.1706099659702;
        Wed, 24 Jan 2024 04:34:19 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p26-20020a19f01a000000b005100ed58b76sm207756lfc.308.2024.01.24.04.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 04:34:19 -0800 (PST)
Message-ID: <aeae2e69-8407-4d90-9d16-27798e2f3248@linaro.org>
Date: Wed, 24 Jan 2024 13:34:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/tsens: Add suspend to RAM support for
 tsens
Content-Language: en-US
To: Priyansh Jain <quic_priyjain@quicinc.com>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_manafm@quicinc.com
References: <20240122100726.16993-1-quic_priyjain@quicinc.com>
 <548e2f24-a51e-4593-9463-09506488c70e@linaro.org>
 <f415a8cd-4cae-d7c3-60fc-674b3e660f6b@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <f415a8cd-4cae-d7c3-60fc-674b3e660f6b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/24/24 11:42, Priyansh Jain wrote:
> 
> 
> On 1/22/2024 8:02 PM, Konrad Dybcio wrote:
>> On 22.01.2024 11:07, Priyansh Jain wrote:
>>> Add suspend callback support for tsens which disables tsens interrupts
>>> in suspend to RAM callback.
>>
>> Would it not be preferrable to have the "critical overheat", wakeup-
>> capable interrupts be enabled, even if the system is suspended?
>>
> 
> 
> As part of suspend to RAM, tsens hardware will be turned off and it cannot generate any interrupt.Also system doesn't want to abort suspend to RAM due to tsens interrupts since system is already going into lowest
> power state. Hence disabling tsens interrupt during suspend to RAM callback.

Is that a hardware limitation, or a software design choice? I'm not
sure I want my phone to have thermal notifications disabled when
it's suspended.

Konrad

