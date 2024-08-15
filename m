Return-Path: <linux-arm-msm+bounces-28584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 713DF9528F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 07:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C530A28891B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 05:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6895155738;
	Thu, 15 Aug 2024 05:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OaEJrADA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E9F1553BD;
	Thu, 15 Aug 2024 05:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723699759; cv=none; b=lGqPMyLHpaAk6HG1Cwo7d+rZ84OyqpYchQbD/3BYvSvq7kNfkWKRwadk3GaDf/GZ1zNNLbaT3GEPiW4d7/dqJGiLGkbIr5TPN/m1d/C/Ie8XlJflfhwyjnKig6/9eeX43csFNxE/itH8+J8go3ZbHywmS1H5YBOKE5Eg8ny+DVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723699759; c=relaxed/simple;
	bh=2a9AgodhrhH3CTPo5Xri+BdzgtYXv5AFaphVQ/5mojw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ASwqkPwlgb+EeB/ctYjTaq4IWRjO2R2jNYJMBqLyLC+yuIWzsScYfLIfxY6ze0HdwO3uC5LKteEMs2AiZ0FqCnpKE+uTB828rJOWX32H64vfAA2gRAUlSJRNSnd3+mjlRUI5D21GYFa7zZGZXTAPqsuB00u7SbNFzQbdmto+uAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OaEJrADA; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3b8eb3df5so2407181fa.1;
        Wed, 14 Aug 2024 22:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723699756; x=1724304556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZS64AVtiuq4By/oS75dC4kq1+h/gjy5AfNcubB/vso=;
        b=OaEJrADA7/Vx2gncSWZPSgLgO27Q38i2zjZMARiwFFpAkFgH+SzzM1CPJw4kZ6NRp3
         2JoeJzxgllADbuR0MjgLC/y8fKt53YGceFU98WfJcbYcbWiv8vDpyvEkvC6CfkEYxwcq
         tvu2I+r8P/AlURxoeTBA5H7grruYPp9cYVNsUAeXT4EGyeiownvB7dhbxO+FK7i/xImQ
         gWnIE64EYhx/I0naUG05LW3KsTVBlwPkcl+BpP55Z2uO0ex2SLVuiYmpG8qB2nsfmfDe
         M/kPElH7etUwKic5vNAQwFgMcBdKIhypbwzbaaY6Sv2jXnEDNE90gtXHDln9iSMR89/Z
         zdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723699756; x=1724304556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZS64AVtiuq4By/oS75dC4kq1+h/gjy5AfNcubB/vso=;
        b=O2+DDNxzFaCpHhXZJf4I5Z3FHllZkv/TrQ5j+WN/fZn3saTx9k7C/ySy2tHlvGF76v
         zYdnkl/10CWSkqBvH3dwOe1raP8wh9aXqYkYR9pT8tSf1PlZslk45qToSze+O3IgLI3S
         JBO6uykByiSCWreASkOCaZGw/s3kIYDpjI/yVt07zjp++7lV63MkfVu+PFD4efZlzeEG
         owP20L6Cj5yrQTPCasN9NCyiZFz5+WYbGkia99aOTNacSgnWuK5gqF3cP3NY2furyOD/
         tTViFPfkA/3iKVXSs7f7ShHYSjThjWtEGcJ33b42OleokktbUdZg4D6AILBCbd6rsKdA
         gWjw==
X-Forwarded-Encrypted: i=1; AJvYcCWpL7avb062dGUBshborqqQmJ8oBMKzvOAEJNCFEo/GylTnQFc67kyGqc0wBD9pDsu2T/3eCj9EGFpmHOidO2KvtlT0VrCVHiSDD0FN9TumjEap3hiX98iijhDEOrw5LJ1sY25RntQKGcoKHKuYtpuM9zresVU8puxp25paSTfI+MTnH56zW4EXiAk=
X-Gm-Message-State: AOJu0Yyq5rPUaCdId5PseTdJW0/3YL9ApiWiQEUYwZX0Byaxrhj6LbnV
	BIybTNwKA8kSXQJDzgtyec5UuWEFNZMPuEKQzM7gIpLe3vBiaGM6
X-Google-Smtp-Source: AGHT+IGycwR4CF+14CvU4aVgAtzgZxOGWE6QAjBwpP5moXbwFV6NbNV7ekPWJ2Phb4XyRpTlTbWbrg==
X-Received: by 2002:a05:651c:8d:b0:2f2:9f39:3e58 with SMTP id 38308e7fff4ca-2f3aa301372mr28041681fa.48.1723699755321;
        Wed, 14 Aug 2024 22:29:15 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f3b746cf56sm863451fa.18.2024.08.14.22.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 22:29:14 -0700 (PDT)
Message-ID: <f591cbac-8bbf-4112-b619-c6eb2e5de05e@gmail.com>
Date: Thu, 15 Aug 2024 08:29:13 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] regulator: bd96801: Use scoped device node handling
 to simplify error paths
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
 <20240814-cleanup-h-of-node-put-regulator-v1-2-87151088b883@linaro.org>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240814-cleanup-h-of-node-put-regulator-v1-2-87151088b883@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/24 18:04, Krzysztof Kozlowski wrote:
> Obtain the device node reference with scoped/cleanup.h and use scoped
> for_each_child_of_node_scoped() to reduce error handling and make the
> code a bit simpler.  Add also brackets {} over outer for loop for code
> readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


