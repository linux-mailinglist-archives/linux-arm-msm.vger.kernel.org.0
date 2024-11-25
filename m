Return-Path: <linux-arm-msm+bounces-39105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B00809D8818
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 15:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 737E328A3C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 14:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1381B0F29;
	Mon, 25 Nov 2024 14:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CR+cQKHE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600821ADFF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 14:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732545178; cv=none; b=MZjzYO410iUjCRJZuzHfbgrqwP6MYUcQrRTNSsxQRjDZ/cNNaFE9LLxusMONaG1Ol7X7ASOx9CVBfFUPeVqYufkearrbiUDI9izS9FAYvCy4rm5SBWo1jeda/egC0CLuEW8HIKhbWhA/179HI84VtAKWKQ3QDI0r6FEaqGRyh7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732545178; c=relaxed/simple;
	bh=HgNXDurU1Y6/iVHhxRcPHbCNyKwUgMFho7p6ih9pzg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SznRTCxpva8lq3P+imcvUFDrSXzoDTndwIhpsE0bVKOFrUaV8ze16S6hglFvIy6auBhAcISp78b+ueI1xZ6umUlz2VgvNk5/Fw6mjKoWTfgpjwaOwEmPCysPCSrK3e2aJT6TyikxpbFUyBR6g38S94HJybShNAUhqFxso8lOcVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CR+cQKHE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so41755665e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 06:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732545175; x=1733149975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J+Y0HXpyKgeDtrQhAYRPzCv1yrc8XspvZqRwVQTSQoQ=;
        b=CR+cQKHEDl89HnHZ3BI77rrrIKLQCINdHlBd0ZbnE+T2FD60yysJ6wd558KnT1+4aV
         qnVrHdvJQWfF3PjyQeb6ePZPy3iZhNIXPtrky4A2neJijJjT8kgz8H8D6ZW5GQsZ2t6a
         1YMEpA2pyOFzE1N/tb2fXtRSM2VP1gJQFw3xgEglI4vez2OKczj8RqmGtJXXcBbYEHxZ
         91vkhGCGmLREIa8Lim43LF4pZDCPaPVvPSx0dY8MXJBekG9zlWvsnEnoq6SVONEgZckp
         Rg3JNWcFQPZCWY2UMLbuIpXTXveinDrDbm6WiDobJKjNLNUd0deAzAa+2zRUPUjRgrHe
         LNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732545175; x=1733149975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J+Y0HXpyKgeDtrQhAYRPzCv1yrc8XspvZqRwVQTSQoQ=;
        b=WQkyO4hjFz/OhIJqd3Smvsv++xyGHCVRXsBW0mvvqTcUk3rU5A22G8x4ABC7CIYIZ+
         8/nlEs9PTytBpzij5KUB8aW4cBis7DvsgLHlkTJQ3AH9lECg4151vQGyjmRI0mTCay22
         67Ka311MNH/kYAXSol9QvsHHmPEiZGSPCNt/V4r4wJKj8HJymU5yu+/H9mBKRY99rWp1
         3Mop2kAZ8kyd+RuQINRek1xU8RMLbELL5d5p5tT3auaLaQXUE5WbLfQfTmRXH2V+nJ+9
         2nCA4qKz5WRz8W8cBQ/bAIIQgkchoh6hP50nzLOde93DqB0uzwXMLT/ef3fFqCR3oC2J
         t6XA==
X-Forwarded-Encrypted: i=1; AJvYcCXTXJ+xCgF8MkdLvmR3kB6OwV3RvsFGB1n/oJSfzYrh0imkJ4IRM/cNyA41GeK4ECa7Tsz5YXwzeAOuMKNU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3RrQNfGt/Up2BmBSGJCj6j1f3altBy6AlcEkYIqt+txgnobcj
	8CfMqG+yhQDL4deg+RdYppBMSJ3FNomJtlLz3EzRlaF2GbfAp0OcoKo+V55m1A4=
X-Gm-Gg: ASbGncvbtjvQqw2hfCRbM/rTf0GvptlfGNx/fbbUH5BZ+sagPepzMoV/1xWn7BOMuCL
	U4SMsnpwruXA5UVAmY+7ozBmdglk9mJs6zWlYvpLYtG3+G5Ox1sJlfmBkozutLWa+0T9AzUmOO1
	dhj0YdsFclBZDXS5nDnpWdAKh2Y6J1tuzrxex3bJ3zf/PPSvkt5Gtp7GUC8kTATFLSObPSAH8yU
	XL7WZrKwOFmfzccjzfbn9zpf4dxzAD2vJK5XzkEkjbkZOyWvUFN9rM5KDuChvs=
X-Google-Smtp-Source: AGHT+IHLpdEqvHkFDrmf7iYo+O6NcGKzmFklgROp89/Mv/+qWdOXbu1wuq8DK5pShhF7HXcnisT0Zg==
X-Received: by 2002:a5d:588f:0:b0:382:4851:46d2 with SMTP id ffacd0b85a97d-38260b45c95mr12173123f8f.1.1732545174756;
        Mon, 25 Nov 2024 06:32:54 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb36612sm10492934f8f.59.2024.11.25.06.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:32:54 -0800 (PST)
Message-ID: <7876986a-0164-4004-a8c7-43439e30fcbb@linaro.org>
Date: Mon, 25 Nov 2024 14:32:53 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241112173032.2740119-1-quic_vikramsa@quicinc.com>
 <20241112173032.2740119-2-quic_vikramsa@quicinc.com>
 <20241115165031.GA3344225-robh@kernel.org>
 <0234971e-9029-4371-a0aa-7da835591351@linaro.org>
 <f1ff6df1-89f3-4e63-bea7-2404fefe81f8@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f1ff6df1-89f3-4e63-bea7-2404fefe81f8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2024 14:30, Krzysztof Kozlowski wrote:
> On 25/11/2024 15:18, Bryan O'Donoghue wrote:
>> On 15/11/2024 16:50, Rob Herring wrote:
>>>> +  reg:
>>>> +    maxItems: 15
>>>> +
>>>> +  reg-names:
>>> reg and reg-names go after 'compatible'. See the documented ordering.
>>
>> Rob, the documented ordering pertains to the dtsi and examples not to
>> the yaml right ?
> 
> 
> The coding style indeed is explicit that it applies to DTS, however same
> rules apply to the bindings as well.  I just did not cover bindings when
> writing DTS coding style.
> 
> Best regards,
> Krzysztof

ACK, thanks for the clarification.

---
bod

