Return-Path: <linux-arm-msm+bounces-42833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A01D59F8456
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41E1C7A125D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 19:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B8F1B4147;
	Thu, 19 Dec 2024 19:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UVoS8Tnq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580981A2541
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 19:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734636749; cv=none; b=ZGzqmlM0Q1Zpcdy5q6l1koCNgYF/x+r09rQEuEAX+UyqJkAx5C92KhgBcWrCfPYsvblnppDZXc8ihoLYK7HJPeaTNUkxNzIaQvNJs0+GWFcqnhoDrYhK+tQOvKiUiKprq6RRmhZyGcN7ZBNic+0JTy8DTHEpdsQnM8JRSlcOvHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734636749; c=relaxed/simple;
	bh=XisdETZGt1xGd/tAcysR1gf7SJZ+Q0OQ6PAQF/dE/QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cefXkVgUiZSe4LINJPRBKCsJ7iGaqan1wXmwVuVjHgc4wKSYzR9mnP0MmZphpB7bS2iR1eNqPTN4gPJnpIJ4JKsUzgE0RiyF8zKv4LdcqNkvg7CxkoUXtgAMPnKFQ6U0QTx027mJou3vjw7pmrH5VmJGZDnZJiBYP5ciVvvko2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UVoS8Tnq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e3c3e38d0so94003e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 11:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734636744; x=1735241544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IW/1H+wBsYHEd+yu91SFC/VMNkW4y30uxY2FjxFoA0k=;
        b=UVoS8Tnqvuihmed2kUERhKZeQvCpgyWsPVaDN7L9hyd6tUbSpenigE12GRuJFJZhvq
         tFQy2fSgsZ+9iAStZ7rDB6gw9nzmd4fGCIgx5Z7OzWDQmKA6Z8mHTeBPb9cfmGJTQdc/
         opaTLmKM8igS7ONiZ5wTj8RIip2RAZ1K8jva0b0Eck3fClr/mwl/PDIHUc0/H4EeP/6v
         ZqRTPBSSaw/q06TFFOLTnXZmd3Sa7QblVGyZfVrE8sXO3XESwe/cPFJkTwnvKbyKnYuo
         LSvkLxn7RRh4BWKIccHXv4+thDs7VxPa6OY5h1NJPG/Xirn1kZvfzrMG0ShIw5nGSe9Z
         5j5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734636744; x=1735241544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IW/1H+wBsYHEd+yu91SFC/VMNkW4y30uxY2FjxFoA0k=;
        b=j7Hft0BGRd8TGon1r6FkldxMHd7I43gz3vgh6BW9xg9lPVir8B6SumsiuL5hT+0lan
         Ee6j+qP76Wv9cb2xtqQM7RRkBg6kXAiJxXQ6sxyKUswai3IS4qrdKPTOaHks8+pFOUdj
         0JRmqs7GJZ75PyhhMWZPZGMwlU1jLhN47IpcHTy6ZyaSnEC+JTk/ZfGG3WBBk5MvDtV6
         DHPTy/K584PbHVVxZswnRrB2oagzee7bMyF1/ajHIF/ZJlv1KQPFG9fz3f6tSVlBQAco
         EbmMAmESyGSJaDFW0bUjaT2KskkDZOCcglPW1hL6pP670sXhel4wd5Sk+SJBDuVYT9p8
         uksQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3XSQ2ob8mq7PWt3Sy0Y9p3Z50YysNhfrr/ZrYSsArndeJZBAK/b7dQeq4e26smJyKyWIk6OdoKJ7bXTvc@vger.kernel.org
X-Gm-Message-State: AOJu0YxAlhgb7zQr+nf0gPFc0U82nwRsB+crW4Wrymo/dMVhUzcu6Ty5
	txcl2C5gMNmskfjHREyFWtrgJjBvwOXngV78KnIRv25If1N+WpuyPan4loobU+4=
X-Gm-Gg: ASbGncs42Pal5IZXXfcdipqdr5tUC8dH2483Fm4j5CB+4FRo7bERT5LcNTYLVV3POQY
	3QUGzH6Lw+QBLm0n/cpJJNZImbJPsCJZTYmU01ClsCyfCYdDMd1s6tqJYYdEiBSlACTyS3BNpKi
	onxzgOlR6qyUmQNM+r0StrgopNSidg2IhLqc//z0KNWBHbSJwczThFqVmy4YgUjD6Wy4V8k8YLs
	qyhkHLlSzjcsCtCfeCizdUu+VcJttANJROlVnJZF2qo5s5Do2TJuEqPc/mRDTA8p1z360Ez0S45
	YNkmcDZbR3zN6K5qOSlPneJpjgkZPLAhMs4=
X-Google-Smtp-Source: AGHT+IHUvBst8RiUn9IST8/5AjNtAtHUWTb9tBGd8LLvhOk3TajPDIYTYMQtaGEJvz/fTfQPjsQaIg==
X-Received: by 2002:a05:6512:398d:b0:540:2aeb:5d3c with SMTP id 2adb3069b0e04-541e673d7c7mr950150e87.2.1734636744478;
        Thu, 19 Dec 2024 11:32:24 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f5d88sm256403e87.15.2024.12.19.11.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:32:23 -0800 (PST)
Message-ID: <c7253f5f-eb4a-4636-b0f9-7d284a2f5a8d@linaro.org>
Date: Thu, 19 Dec 2024 21:32:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Content-Language: ru-RU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-5-quic_vikramsa@quicinc.com>
 <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
 <99cf5f7e-43f6-4ac4-a4a2-dc731b695572@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <99cf5f7e-43f6-4ac4-a4a2-dc731b695572@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/24 21:06, Konrad Dybcio wrote:
> On 17.12.2024 3:40 PM, Vladimir Zapolskiy wrote:
>> On 12/17/24 16:06, Vikram Sharma wrote:
>>> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
>>> Enable the IMX577 on the vision mezzanine.
>>>
>>> An example media-ctl pipeline for the imx577 is:
>>>
>>> media-ctl --reset
>>> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>>> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
>>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>>> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
>>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>>
>>> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
>>>
>>> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
> 
> [...]
> 
>>> +        rst-pins {
>>> +            pins = "gpio78";
>>> +            function = "gpio";
>>> +            drive-strength = <2>;
>>> +            bias-pull-down;
>>> +            output-low;
>>> +        };
>>
>> I have doubts that it's proper to embed a reset gpio into driver's
>> pinctrl suspend/resume power management.
>>
>> Konrad, can you please confirm that it's really accepted?
>>
>> I'd rather ask to remove this reset pin control.
> 
> There's certainly some appearances of this in the tree.
> 
> You could make the argument that it makes sense to prevent misconfiguration
> (i.e. the bootloader may set the pin in input mode), but then the counter
> argument is that the (Linux) gpiod APIs request OUT_LOW/HIGH, and we would
> expect that the driver uses that if the GPIO is requested through
> e.g. reset-gpios.
> 
> I'm not particularly sure what to recommend here. Krzysztof?
> 

I'm worried by a possibility that a device reset/shutdown control GPIO could
be turned off by entering the "sleep" pinctrl setup. If a particular GPIO/pin
is off, is it still continuously functional as a control GPIO of some device?
I believe it is not anymore in general, this is my concern here.

--
Best wishes,
Vladimir

