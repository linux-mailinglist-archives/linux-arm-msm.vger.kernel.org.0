Return-Path: <linux-arm-msm+bounces-25973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D735692E7D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 14:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14DC51C2203D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 12:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E61515B0F9;
	Thu, 11 Jul 2024 12:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBjOyswt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB0729CF0
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720699261; cv=none; b=Wn7DC0G0afO0Nsy+GPKgk2Xtzm+iEat2v+Sne/DqpETz/2fHQBkAx8mxs1uHv8msnZHZI0lWlBKQMeGJBGHZxD43f2YMLG8ZeeDaxA9TBJ+yxPVTTYgekpY6BHULsxcowzmTXXsy/cXpieblKffmdW20wVcFqz/95MfAHqIEFbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720699261; c=relaxed/simple;
	bh=v49Vip4jZ4oBWopBF6Z/4qZU0UdOimIaGgazufPlW2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RM8l3W7jPX7rqJ7XO10mNdBm4NOOnahw+UzLbYY710f3wjch8kkDRSiljDi0YX6oEMxs9vU2qlxDdTrsNXdp/gXDPDZ+l68cKjvg2n635rdWLwFbPqZ/P2dfWtR4Jh2sg04UGO9XdM9CLgSdJYRaROZY4Iq7T3gZm+t2BMKLr18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBjOyswt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4267345e746so5392355e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 05:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720699258; x=1721304058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2JUd2oLXgxshKzRFVISFxh+A+Mvcy+qNlBasbhAfNdM=;
        b=JBjOyswtkOKjO/rVl5GyhQrUk1FTLWGA39KEEcIUX/Jrm9LrlJIUgBXPqPxiCU+lHv
         RULBP5UeSZ9KZ8KG9cA6r+R9tfZZ2LvlQnY+LwPqY13keA5st6cHLwPacf2gNb7wMWlQ
         Mx1Cq09ZsUv86NNrwyXNiJ9yYsrpdzNcqzsQ8cFB5Wj4IRMrV0KrFz4xBQ8BLC1SgQet
         hyKyYbNIUKIjQ55UbWse9iN02kmwvNhAdGyM9Xds/hv1a7Uf4MrS9vsJ6CUUj5lG1nyM
         FJQps4NpfYtSBQiqXeGhRcA9Iyw/U3KUcijvXzMwPFozD7n3NTYaO68F69b+7DezbKfe
         bDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720699258; x=1721304058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JUd2oLXgxshKzRFVISFxh+A+Mvcy+qNlBasbhAfNdM=;
        b=TsvTNVF+LeaU33j7Ikfa5fbksVejEYEVe3nb1bxQDZ46l4JHHlQ+qP0Jsa8YnH+jgf
         QIfekAPQiktxhvuzQxAf5WG7c/cuTBL4PCFjnDTFa718EK87phalt+M4cbJ66TbqFQxW
         OsLvoMA9cyqioh9J6tgAVdIFmxKdVibkfD1L6N+I9bxxblcUK4SQ8bgiGwhmCW7IwOLG
         H+D+AUadTiLsebjLvKW7qX/QVzILUHoX1yRDWA362EUavQ5hke6IXFnVcJ6+4ARIFGOI
         COeNCNMtHsu5G7bH9JnEl7Be5xtKBPY8Pi9n9BRicBQJEZBqO3h7Ptvf+MnbxuWfNiff
         irnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgT2w12j6dGgDF/Jl8bYMIuKzuudduW6oiyhL1SuofuCa9oaP9AZPQVppJEnip9d8635rSFDQd1vbZcFkO6yg80AZ+RaeBB43m9ord0g==
X-Gm-Message-State: AOJu0YxGroOYAFPC8gDPS/OgDXUO/qt/XFiTqDMqMIfcoX7IzcKRo882
	wo+gAVxLjERaRfdpqxTzmYAKyVVhxYXfry7+v6Lw9WxeIqTBqbHX1DBQ7a7276LNMqXMJLaKdyt
	u76c=
X-Google-Smtp-Source: AGHT+IEYp8K8dzwxo8IceVvIX+AjIdtBRRlmCQuuavFPvMmMwPrAreMKuYzQFVtHTSRgUEKZznR3tA==
X-Received: by 2002:a05:600c:4d0d:b0:426:6e8b:3dc5 with SMTP id 5b1f17b1804b1-426708f1fb7mr54216235e9.32.1720699258137;
        Thu, 11 Jul 2024 05:00:58 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42650b26c48sm248723315e9.17.2024.07.11.05.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 05:00:57 -0700 (PDT)
Message-ID: <4c26e896-69fa-413b-ace3-39c9698dd6aa@linaro.org>
Date: Thu, 11 Jul 2024 13:00:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for
 SM8550
To: Depeng Shao <quic_depengs@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-10-quic_depengs@quicinc.com>
 <1da50dd1-b170-4775-94fc-19a10b7f9c47@kernel.org>
 <4c8095dd-4f96-4b0e-9282-8bdfb5badbc3@quicinc.com>
 <9255b3e4-874c-4919-b50a-919cf0f42f75@kernel.org>
 <064baf66-eecd-4982-864f-50b86b104ff6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <064baf66-eecd-4982-864f-50b86b104ff6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2024 12:41, Depeng Shao wrote:
>>> Yes, these are some sequences to initialize the HW.
>>
>> Hm? It's like you ignore the problem and just answer with whatever to
>> shut up the reviewer. Instead of replying with the same, address the
>> problem. Why ordering is not a problem here?
>>
> 
> Sorry, I didn't mean that, was trying to understand the problem, then 
> just sent out the mail by mistake.
> Do you mean we should use writel to ensure the strict sequences?
> Thanks for catching this problem, this problem is also in the the 
> existing camss driver. I will check all of them in this series, but the 
> problem in some existing camss drivers, maybe Bryan from Linaro can help 
> to fix them, since I don't have these devices to verify the modifications.

_relaxed is used I'm sure because that's what's always been used and 
what downstream does.

Is there a good reason for it ? None that I can think of.

Krzysztof is right, there's no good reason to use relaxed() here at all, 
you should drop it.

---
bod

