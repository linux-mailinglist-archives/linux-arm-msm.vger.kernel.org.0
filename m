Return-Path: <linux-arm-msm+bounces-25244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A2C92710C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 09:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C080A28455F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 07:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5B11A38EC;
	Thu,  4 Jul 2024 07:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MwsV5FcE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A97D1A38E4
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2024 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720079880; cv=none; b=YwHdIS9FwoSq4GYyTSGLiDUF0URqyAT8YQuk8MHKPfS9t77Hng+lDOdAyi1lHx09LfVpFQ8dSTpeiGhF7vzsZmP1KKtbQrCc/GPMUU3KbXPWGFd78trN+R4VqTZ3RQpCW37XiiPeGJhMjNQys37oxpyMbfAzJDoGlbOPvDCiaSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720079880; c=relaxed/simple;
	bh=UGMJ44RQRK5L7aXCmLcCVD3t3Ew+7rZXgNHMCelmG4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5SqVnvT2hHrUPd8AZsXBDg2FN33KDvYPHzN/0ddMTr7WWvwEl1jBbFrdLI/Zo1KYG+N4Yvz6qjjyM835BHZptFPjw050oP7qmDdQ6BWN4z2yksMxZj4NaGqgwe6tiLt1uo+CZOKFBoaZPgskDhROVB+ZUQ86/f2i7exx7CMJWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MwsV5FcE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3627ef1fc07so214643f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jul 2024 00:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720079878; x=1720684678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yh+wWDEWyvWxK+Dc2ccAVMOd+nezcfUI+rK+tEbS35s=;
        b=MwsV5FcExI5ZVPlVgKEcePwkYok+WfzdvNtwPkvHmvo8Z+xoG5hA0cs3BpRVw1xuf5
         88D23HyHCcn0PQyC9/wmqqdsgajtk2eTfHIV+CltYNUZFWurZrvOkY+ZlmdWgNKpp+7F
         iSvDtJeXNbB7vU7VZEH2PPLxGec8wUo0X2saav5lpatRJXqPj85sw5EN4wsFNOCYt3ya
         h/UBgy+x0fuSij329hqJcgWBau2BLi3ZPX/D7gZxChtCo8L/9MXlLPUZnIlRjnT6Gxmj
         4Nk2sY/Ts2XexPX3v7t1Z/KjkZbPsMo8aA4Ca3PsKoT04ijKZd9L6Dxk8JZFdb1DkxJ2
         HEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720079878; x=1720684678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yh+wWDEWyvWxK+Dc2ccAVMOd+nezcfUI+rK+tEbS35s=;
        b=JScuxyRifkcykSVsaLkjWTwInxJM4jQkhT4mZUuNie6LAuBMC57WWQejikQc+B9L1/
         9y/uH97QkzXr7LiMKLIlQW0BxQFAQDiyxggCZpVbbAWU2lKwgHABNZi2tuitXQGUA0LO
         ETZWMEVWKmrIvQrXNyrLiTm58e04ASGQkpx8b4WxY5hAZ9vr90PVEfXoUxpwbt+OerZB
         uYTSI5fyLemjANOai+2nMedP4i6axfh6Djf4ZKxsKse+wnigaDCBiOQ/SFCIcQGpLq5d
         xy9JZ0wcWRQS0wJe+RbHADzwPC9PWv/gTEE5tIDXMyjfey6DG+1qamZCZdSt1F0aZsMh
         tFMw==
X-Forwarded-Encrypted: i=1; AJvYcCVFm/8jep1iXoRkCnhIRcLyQBuQd8o0YeJKgpBnb14+Rre/wlQNBYYWm5JrjdLVWf/I0AIG7Sd68NrUbW92OOEex4XyHC98wWUx7g8Kyg==
X-Gm-Message-State: AOJu0YxGzbfYN6YUP+kqhmJNs5JGOFI2fncKLPump1627zU601nUlSx4
	mQlTJSE2+JoTvnxF2xaXiTEFqqVRz9URGoqz4MIjU8v80csqktL6rG4pqhiFMEE=
X-Google-Smtp-Source: AGHT+IHfWjqPwEJhWwd/bHs46j5WWXDlgt+XZ6rBtRnO7nRiiCBSFw8hpTuo6iaafsU3L46ZlgLJCA==
X-Received: by 2002:a5d:5489:0:b0:367:911b:ff6f with SMTP id ffacd0b85a97d-3679dd29485mr583989f8f.18.1720079877647;
        Thu, 04 Jul 2024 00:57:57 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3678ec6ff64sm4952189f8f.3.2024.07.04.00.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 00:57:55 -0700 (PDT)
Message-ID: <50390ee7-20df-4be1-9cda-639981bf4ca7@linaro.org>
Date: Thu, 4 Jul 2024 09:57:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thermal: core: Call monitor_thermal_zone() if zone
 temperature is invalid
To: neil.armstrong@linaro.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux PM <linux-pm@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Zhang Rui <rui.zhang@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <2764814.mvXUDI8C0e@rjwysocki.net>
 <2ed4c630-204a-4f80-a37f-f2ca838eb455@linaro.org>
 <8d91a3c1-018f-495b-83be-979b795b5548@linaro.org>
 <12c5c133-9519-4a26-b9a3-2da1d3466e94@linaro.org>
 <15b67ce6-3238-435d-ad28-7c06efbe9153@linaro.org>
 <ce6c2e8a-65a7-4cb2-a91d-fbcaeef6edc1@linaro.org>
 <0c4b401e-86b8-4169-af88-475433012d67@linaro.org>
 <636922b4-96d4-49cb-9020-2359e7497f56@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <636922b4-96d4-49cb-9020-2359e7497f56@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/07/2024 09:39, neil.armstrong@linaro.org wrote:

[ ... ]

> OK I just found out, it's the `qcom-battmgr-bat` thermal zone, and in CI 
> we do not have the firmwares so the
> temperature is never available, this is why it fails in a loop.
> 
> Before this patch it would fail silently, but would be useless if we 
> start the firmware too late.
> 
> So since it's firmware based, valid data could arrive very late in the 
> boot stage, and sending an
> error message in a loop until the firmware isn't started doesn't seem 
> right.

Yeah, there was a similar bug with iwlwifi. They fixed it by registering 
the thermal zone after the firmware was successfully loaded.

Is that possible to do the same ?

> I think Rafael's new patch is good, but perhaps it should send an error 
> when it finally stops monitoring.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


