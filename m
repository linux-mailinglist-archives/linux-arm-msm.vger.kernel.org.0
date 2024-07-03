Return-Path: <linux-arm-msm+bounces-25172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B30926370
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 16:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B192B20FC3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10ACE1DA21;
	Wed,  3 Jul 2024 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OME98eeL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8F01EB27
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 14:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720017014; cv=none; b=sYXCD1sMhwXS3HiLivZkJfhTCYwGIasWdDr2EV5opSc7+EcrUXtF8CaD8R/h4W9/GsesqNGEUxxwceXv2Wzx9Z6hnwNp4MjsfhtnM9G5sF5pudKTsfVXZ7TGk4EhKBIhDLKQL901+Sg5jaMEy/VmKQUReBNTQw67fvxmaXhAKgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720017014; c=relaxed/simple;
	bh=703hhRSpknmH8TbKJyDrP7eger1IOJLJ7Yp6gEEIU5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFExLU5bKEiWkakc+baSPJha0yY8QVxTLeaCqvkUAONPENqQhu1KwEHckQnVNNB4NDAzch0l2R57sYfZFh8uifW322JzjQrNd4rLJC5knUNbrKnTgNTPAtPNPSKLppbq4EQaw73UjtbPTor9Jjpu5iHB451ZkK0bhrcrPJ02wJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OME98eeL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36785e72a48so1103375f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720017011; x=1720621811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5uMdQw5W+def7pihp9EhrnCgDBaY8Iz8fouuXaSiQ08=;
        b=OME98eeLhuWzT/j9kMrnOj2s71aM9YvTM3YlSVGVokKT8ss6JAAzCaJyJyX0ADTU+a
         cn3Rcir7LQfU/I3xiKj7GJNNzX+4w9yyouK7ZCGUFa9cZMTKSmz9l3zfEbubv9WzTAxP
         sRjym+eQ5SbCWBATdDTYXoSeKnJJclg8ckTxj+3B660VK8F4HSBl/EA637IMnoZFQhZN
         PdTBd2ioRpJH0jCpljp+egCvtnK3zcimEThyx/MHU5ypV9BPRXLsUqKEoO+nokqUnTD8
         XkQTPZaHkNZuYR58EoMYPY39urwT+snt+/0BsS8Y82OZA8HdfFMHs17/IXESRvS+Qcw7
         KjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720017011; x=1720621811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uMdQw5W+def7pihp9EhrnCgDBaY8Iz8fouuXaSiQ08=;
        b=bly0wxEvYD2Zlfvwrp2G6QAX1WhASD0Cj5L4CR5pNr2t8wd3RN/OMZ7y7O9mFnVjOT
         haYRbbIyoVDpgte/N+jpK/KjZIU94NNiuSXLOLB75KTYrmv0ZTKebuHTomBaJchz4d8W
         0TF5pl4iJO400ElB1FO0JSUM+FsuRsBBHQWBfdPhmg6P/7SvcrwUq57YxKabgnbs+aNV
         r5EP49qfFqilf1eBlMjakZbPL+hrnrbkGlRBW+KhE9c/k/AqwyfjdimWuF31/Bgq9+BO
         14ut9mhKhM0FE6VOfJwrcFSKjLLGLHRCTjG1CMto9cIiEkokyZMZ0qLqH40DPfZXUab5
         iDMw==
X-Forwarded-Encrypted: i=1; AJvYcCVVmoZRvdHTzUV4RhybY2dVMG3o63rqQ8XGpL8muZA6eBXcQt+7E0nLuL6mXpQAdEZ/KhGX9GGVdcSA06nYm336jlsIcUamHy/d9ZQMeQ==
X-Gm-Message-State: AOJu0Yx1JcxcY/4oiVjyczwwdXDJzXappBjGt2s9V1rqD8vRCfYJXrsM
	y9mT9xB3pKKywAx3Tpi9qMDSEa48TJQL1ZfSGt38vDy4/JdUZkvNkzX07b2yYMufZvcPZjRaEv5
	wNS0=
X-Google-Smtp-Source: AGHT+IFMA3j+9ZoVQ1XUOszmpt90crPyACidhPK2ftUVLUgtC81roKmr7IVwuI6zp4tDlyFz7yqSlw==
X-Received: by 2002:a5d:6d83:0:b0:367:89e7:72a2 with SMTP id ffacd0b85a97d-36789e773b2mr3889568f8f.22.1720017010701;
        Wed, 03 Jul 2024 07:30:10 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fc4c9sm16033873f8f.86.2024.07.03.07.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 07:30:10 -0700 (PDT)
Message-ID: <49b2504f-e5ab-4ea9-aefb-bc9c7f71f5fc@linaro.org>
Date: Wed, 3 Jul 2024 15:30:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Failure to stop CAMSS stream (sc8280xp)
To: Johan Hovold <johan@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <ZoVNHOTI0PKMNt4_@hovoldconsulting.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZoVNHOTI0PKMNt4_@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2024 14:07, Johan Hovold wrote:
> Is this a known issue with CAMSS or is something missing in the sc8280xp
> integration?

A known issue on my end, I also want to root cause intermittent sensor 
startup failure, before switching on the sensor upstream for more common 
use.


> I'm using the following (squashed) devicetree patch from Bryan to enable
> the camera (everything else is upstream):
> 
> 	https://github.com/jhovold/linux/commit/85b41b8d0efd418509df548592f95b43b9663409
> 
> The issue was there with 6.9 as well so it's not a (recent) regression.
> 
> Probing the camera sometimes, but infrequently, also fails with:
> 
> 	qcom-camss ac5a000.camss: Failed to power up pipeline: -13

Yes this. If you recall on the pm8010 I had mentioned to you about a 
wait-time to startup the regulator - thinking it was the regulator 
causing this error.

More likely the GPIO reset polarity or delay needs to be tweaked in the 
sensor driver.

> and I'm seeing the following warning on every boot:
> 
> 	i2c-qcom-cci ac4c000.cci: Found 19200000 cci clk rate while 37500000 was expected

That's hanging around for quite a long time 19.2 MHz is a perfectly 
valid clock, useless error message.

---
bod

