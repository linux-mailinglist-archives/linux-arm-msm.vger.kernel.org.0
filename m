Return-Path: <linux-arm-msm+bounces-60831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE64AD3C38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CF1B178AEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 15:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D30235069;
	Tue, 10 Jun 2025 15:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JHcyg+pL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7527A23536E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749567744; cv=none; b=N8CuccnJdDHbj2yEs9itEmX8ydF37PwrKKDQVR2KfR/e6msQEUpr09lphY/bgpI970TaGLgTawDKKh4oZ5GLlG+qiZ1gF1PieSXw7eAxMjHjdsSOJA11zI5yeYhzMbheKfgb+E5XQmFheGP3fR3szi4WmepuARtrbISRC+uQPCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749567744; c=relaxed/simple;
	bh=zafj7aZavn6+rfBRYzGjnAgF8d7WzsIv1NqVPuCSe1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sei3+IPO7RqcQGnz0laSZcwSyIT+4RSyAYOi3nu4++KHywXYut8wtsDiztD5Fq/UVHEZrgKnhIZ9raHurr7ogs+XYnd67RqmkD/K1epELKAW9SJgTv77i++hwC3cKW/ZgXkxryosLKPSMcO6vk8yYhTkJQQmB9nuCyJ0L2jivwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JHcyg+pL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450dd065828so38186385e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 08:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749567741; x=1750172541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6KtswEqQ1pl5gFB1WRd58AOD0ITY+Z1hiQhfoUKBuUU=;
        b=JHcyg+pLUtvEE/bntMuu5crsbtSVfN1IhpMnLC0OTMt40LA/Ibt21MQ+fHS2/YrXv/
         2wOi7WZG6et+2VR0kssA0FvlCGAvokLcNlxGwR22oRxbkR9e3nDlxsg9u/VcHXGDPR/q
         KXQq7mD7eOBeuiRwlfCfCFt+YI8qBXYLj+QQB9wEfQlIEsOsgJsftCOg6k2xTCW+yOkA
         B9v1ow1OdoAUlHJT9dhl3+f3zYOhmP01BYegPbsvWjjb46lRIX2JvIxlNK5hMddyLXPg
         +YylXETNUjXM2KCyuE9kNuuCe1T5Kt2zJ8tSsigsXDRvk9cLDbMtlOkkM7oMxCsF57eC
         EzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749567741; x=1750172541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6KtswEqQ1pl5gFB1WRd58AOD0ITY+Z1hiQhfoUKBuUU=;
        b=OCgpWSmAgBSdsb4sTPqCIPsyLY8U8RqHmi1ICI72zTlGumjhfPqm5aP3JqQifjdIra
         bXHzhsHaGyas/C/6DcydEQkAw4k7GAY4tbMRe4ISyvZsar6TLhQI1cyjsoLc7sCaV/hr
         2kUbkEZpTnMjoVq27ZX55uExaf21/xNU66tw+MQoMH07SnEDbKNUAGy4ki4Nmb6D55hj
         Fcq0XDfrpJ3nNz+KUbBVNeTbLsP4Z0DpgZdx1D8uk4MgIBCnd+CeTLMabFllDB5SwRIV
         d/p0eLT4lIdmmZ4PFV6IumVJ7E0aGi78BYU7vLMcgd/BQj6zqKXkpyt8tS0jy4H/6dFu
         xA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr0hAwIn0CjyhEgNlnbnPtdBX6cMr799qMlw4PiV9KIjaLXKusudiAT2w5lk0te+r5TXrzuMw5rIAB2zhd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0RBcMOd2JjC4Dcf/6in4AAeSirtrkDOFRTaHxdtQRTycbiSPx
	fiwzUSc2h7xsv8JWCE3mwzUkw0A1C22x05IuAg82Sc/EzDBZsvaGBMssqMSua8YEYRb917iHEmN
	WEnfYh08=
X-Gm-Gg: ASbGncsis8458V8AoGZB5yCuJnS7TbJsZ3dN0ZPuiuFjDqHo0CY0ddGTaIFE5PO9wkB
	G81hSew4c3tiV/3nc13ANCQP9hD4F45CX7884gOYsGnGa+TZPARRN7KOOslai46D9MBZsH5a//5
	ubkA0/TWkkJrNY536WnN/wfT+wQTFiiPWWfXDIbKdgFSZfnhsD2zZaO++XTt824S7XysXlB+Eo9
	NLyO0bFPPNkIgoVJUPbjMMnp/g3Q1YPEvMy0+sEe/2Sur9cQ1RXJ3CLtLOscpDU6Z0rxS305Ltb
	C70AinQobzywSFR0ucHOE7og5BcEg/n1sx64ohQ+c5MXOChhtsp9YqqTT3Vn+NMzXKh6YiWlvH7
	nfZwZAy2Y9zPmx8UA1PjCaz3g+Fs=
X-Google-Smtp-Source: AGHT+IH+tWEkQXFAY0ELc5Dwc49Kdl/4EWO+CPjVNq2q4Kkp4CMqzwV1NPVTkuHfWtb2NlfA6pu6mg==
X-Received: by 2002:a5d:5f8c:0:b0:3a4:e665:ca5 with SMTP id ffacd0b85a97d-3a531883d8dmr15192347f8f.23.1749567739357;
        Tue, 10 Jun 2025 08:02:19 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm12780025f8f.91.2025.06.10.08.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 08:02:18 -0700 (PDT)
Message-ID: <ae364f1c-5d64-4178-b26c-e58e352feee0@linaro.org>
Date: Tue, 10 Jun 2025 16:02:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <a072d00e-df91-420b-9363-424bcdf1ed8e@linaro.org>
 <3e8f8220-1fad-437e-9fa4-5eb628891110@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3e8f8220-1fad-437e-9fa4-5eb628891110@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 13:45, Vladimir Zapolskiy wrote:
>>
>> How is this a Fixes: ?
> 
> I call it the fix to the dt-bindings documentation, then what is this
> change, if it's not a fix?..
> 
> Anyway, if there is a strong disagreement about if it's a fix or not,
> the Fixes tag can be dropped from the change, since it's so secondary.

Since we don't have a committed upstream user I don't think this is an 
ABI break.

But I also don't think it warrants a Fixes: tag either, there's no bug.

---
bod

