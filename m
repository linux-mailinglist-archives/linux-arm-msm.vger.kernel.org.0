Return-Path: <linux-arm-msm+bounces-84219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E88C0C9EEA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 12:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B7CCD34B20D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 11:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777802F60CC;
	Wed,  3 Dec 2025 11:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cl0oH+JJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7532F60DA
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 11:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764763062; cv=none; b=PTonSFnC8LQqLIYiCwZ/jFV5o4rvbMaKBYRJHH1VUD2y0rgB3uszYQjuwBcp6H5+I7ivxhvytuPQwaGaReI5qu9YoG+x47Ac7Lq+r5uaPiuveYIOUh7+HyOo71enejWufFSwSfSSAebikrtqyuki4q26XMTx3K7c5oG0o8+wUkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764763062; c=relaxed/simple;
	bh=LPKwLwISED/VLZ+wyALuzSxuIRAJQmsGoVwD5UqGVRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5XF6njUZrickzisL1oErRdVkiqYVIgw4ie3foSbTh3D5XMBnkPd6gEbr2m7VlMalx26b9KGM8m/VBrK0YK2mE+LMzf/VU4jCVsz9w22qvBG/RtXjUittGCC4FaidxDSlT2oLEw6cMFihi0VUnGTQxfuhKDvDXZWXoYzL5vwsAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cl0oH+JJ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59426dc96f2so553779e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764763059; x=1765367859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lmmz3wGYuAOnOg8QMFr0ARgUibgo3L//u7jYl7HIUsg=;
        b=Cl0oH+JJ3vq8ZLraORHFhXpsAJl/8Cx+PyGnAcvU9MsEFuwmTB8LSp5SkjZ+8mours
         NedaOQGFJQG6JEvHajUnr/FhizSgwN3yPBV2fLZvEQDMsunmlFVu2GOx+TE76A0hWY0B
         GvET17M6dmO8TXp5BvCLf6xCh2WI9+jdc55B97igoR3GG/S4wwsJWRymf1/DlOR5eTmr
         kT4mbFVRDRVS1R0aWHA+MhZYB1vgHejTALubZ6Zp/cHlfgSzkNXOYmXYgZpUTDAB2fWW
         wJLy4wdNjjwd7jZb5B9kHJKRHcwxOA8SVkvxRebpOUvvWkBqKuNcVhVOIradAhzUDnfY
         ldJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764763059; x=1765367859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lmmz3wGYuAOnOg8QMFr0ARgUibgo3L//u7jYl7HIUsg=;
        b=kTWNGJtmz4HBc+NznJl5w/W7+oZjyrOEY+8WtlsPC6nYVK24m1akrVJR9lWP94B0QP
         S0qDTnTv9Lw6eiV8hzHMejr9+EbMQiLdgrUGza3cxZrH4nTeVWILHXzFzi8dsreGS+wL
         mrmSNJUDETgSrTpN8Wu0l3mhLwUaWBKWSWGlRRIoikFVKNRO+VO5b+X09zk2D8KqGSac
         3hv/V4YxWa+egExlGQ0fS57I8/URvwfGVkQD6Ld9B8UhoR27V6P3AeVWDHHENNKXfsAj
         ftJsA2oa2lt9IcrYJ8KL9oSunEa6eIpXPPH77GPNNmb/3DxKs1mvzTvmM9FUZzrggdUs
         QEig==
X-Forwarded-Encrypted: i=1; AJvYcCW/IGN0fJLsd6gNENccCoz5/5qe6OJx7mXr8px+0zOnZP6DaxAu1kG0Vi+cxqt6Juk3mT1PckNyHj0jhQm8@vger.kernel.org
X-Gm-Message-State: AOJu0YzYXB/fwCPZ96tzrMKJ+CK4ADDKXlowjYvXDxOJL/Txo0DWWhb9
	ffrhISV+EzVqrXVT0QxILeMfQ2vI4sH98q4R1+uyi+0AIcQ4/Acn6E//6kuFS4V7ZvI=
X-Gm-Gg: ASbGncsiP/4dV2MhRXKRWqVImTclcuXlyiAjm8a0hJMgzJVDVber2Y2qR7llJBczzN7
	2L/NF0VGWVjuphjmBj1SnAjtZqVJjmP+4neyIl8Z2Ywd7Tng7q/6Asq9r6lQXhpwKX0qNFr9L0f
	oMajFyvSdRLRmXSH5I7j/rHrOIkir9HlvxnYuBWuaYAfayZEBuLITaM+jZ1mbNuO3TCZmXZTuT9
	pKva4I5/UhQpG1Hw+GZkH9OW+itNIUT5n2FbkdZ2x6oDahTkwfKRQZfxZEUncnd/uZYukJGXqsg
	F2NBlTpWBHsU1lAZTZ/O4bWWwxA38ud+LMdjP4JJ0oPguCT5FLggd5Xl+HHGWBKxpZTvx8vIGRY
	DuhmhvIqPsgOuLJLe40x3bziI0RkGC7KaqCRmbTRDyvp+3GIQG9byrJCAX1XSeUSW4f8hXwHeZy
	UcLzvuO6eO89RHmWK2oi193QNosGlXj4KkRTAMUoRDCWjraa6cc1sODYZLMw0SG6N1eQ==
X-Google-Smtp-Source: AGHT+IGe2OQoXICFOyfigwG22HGnS3iFhKdt6cwRjTvC1hJEg3a+rMZEtqZi9qXjIGMgEvHgF14L4Q==
X-Received: by 2002:a05:6512:3186:b0:594:2f72:2f78 with SMTP id 2adb3069b0e04-597d4b5efcfmr316636e87.8.1764763058582;
        Wed, 03 Dec 2025 03:57:38 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4406esm5630377e87.66.2025.12.03.03.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:57:38 -0800 (PST)
Message-ID: <5c163334-2ddd-4e52-8add-30652b34dc0f@linaro.org>
Date: Wed, 3 Dec 2025 13:57:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8550-qrd: remove data-lanes
 property of image sensor
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
 <20251203040538.71119-3-vladimir.zapolskiy@linaro.org>
 <9252338e-c775-46db-9376-53002edf429a@oss.qualcomm.com>
 <40980eac-9e9b-4293-8986-bff46f30a50b@linaro.org>
 <94d6d26e-8009-437d-af9f-0a3c69fe8ed3@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <94d6d26e-8009-437d-af9f-0a3c69fe8ed3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/3/25 13:50, Konrad Dybcio wrote:
> On 12/3/25 12:41 PM, Vladimir Zapolskiy wrote:
>> On 12/3/25 13:11, Konrad Dybcio wrote:
>>> On 12/3/25 5:05 AM, Vladimir Zapolskiy wrote:
>>>> Samsung S5K3M5 image sensor supports only 4-lane MIPI CSI-2 interface,
>>>> which makes the sensor data-lanes property redundant, and it can be
>>>> safely removed from the board dts file. Noteworthy that the property
>>>> value is incorrect, because conventionally lanes enumeration of image
>>>> sensors starts from index 1.
>>>
>>> This seems to vary between sensors
>>>
>>
>> It should not, from Documentation/devicetree/bindings/media/video-interfaces.yaml
>> the clock lane has index 0, data lanes enumeration starts from 1:
>>
>>    data-lanes:
>>    ....
>>      description:
>>        An array of physical data lane indexes. Position of an entry determines
>>        the logical lane number, while the value of an entry indicates physical
>>        lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes = <1 2>;",
>>        assuming the clock lane is on hardware lane 0.
> 
> I interpret the last sentence as ">>if<< the clock lane is 0, then data lanes
> start at 1. I'm not sure if the spec mandates that's the case though.
> 

Well, that's the absolute common practice for media devices, which I'd like
to follow without a deviation from it or introducing a novation.

The dt bindings documentation of this S5K3M5 sensor device describes the value
of the optional data-lanes property accordingly:

https://lore.kernel.org/linux-media/20251203040241.71018-2-vladimir.zapolskiy@linaro.org/

So, I belive, this change under review should be fine as is.

-- 
Best wishes,
Vladimir

