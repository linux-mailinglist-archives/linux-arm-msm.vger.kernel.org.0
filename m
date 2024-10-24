Return-Path: <linux-arm-msm+bounces-35727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 822DE9AEEA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 19:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 343991F219DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2267A1FEFC3;
	Thu, 24 Oct 2024 17:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiY542qu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2221EF958;
	Thu, 24 Oct 2024 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729792281; cv=none; b=YQILfuDB98et+NuMIwoIpjdJacGEdoJdvdLk8j6JwST1/mmwmWahnB1KeZHvS5Nfj7CZi4Vm7hbc3VLWS1egdksSsduI6DGLt8qwnFpB3CHsMmnO0p2OAQ2JVlgcSZuVHi5Yzj2egYZ/5Ryr9RY5NiRry6C+7MBoD7xu7Cx8Dgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729792281; c=relaxed/simple;
	bh=mpIlZlRaCxkDCmg+pxpSIPgyUvtGMEuJt4hyIHi535E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMDViJQsGWjuiwXj2XJ6kXbdGYK+era29WbAnsfT/wsdqi4TkCJAV/cqOlZeCAPMt/ItakAbqqxvtU4kZWuvs1wDs2OoNTw5hx9gKx4ZbANVo+yn1kIDDpk6uj0wls7PPM4Ck7xPegdEbhgPreXjSs9nfp/s8jXzVMEzotkIAPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiY542qu; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5ebc0dbc65dso720029eaf.1;
        Thu, 24 Oct 2024 10:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729792278; x=1730397078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jc6NuU0ODoibJhPCVJDjw6esPivGZJhY0CSxZRAhpns=;
        b=hiY542qu2EeaKabGnC9fO311/CZJUC6IHOzrfjTApH0HlOa1GccW8lXHDYeqsYj1j3
         piPgqWLlN+J/Jf+Fv9RG3LYitS3Wn8lQs5QjIDloWQF2AYZSEP2rvFucD9B1XLrWgNdQ
         3Jds97J42QYlhbd5p2sbxKf/w5XcrFbyrp5sSilacdn/ikkB/z6FC/njTK9dLcFd0Hqg
         ghGSYs+CiCS5H7naVsJ4bKGaTb/oQWuV+9HieVVJRfGWHRNlm5VEgRtDA1FHCCNY/j0v
         w635A6Q+RGuPXJy8hAyAYSoVCA40FVKIhjJ59Ci51UPJ2HheNDx1EoHCIeN/NJ93OSos
         YIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729792278; x=1730397078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jc6NuU0ODoibJhPCVJDjw6esPivGZJhY0CSxZRAhpns=;
        b=WEq3KsLkWLoV0dD+DQWc478hTOVrArI8US7QQWk3hovT82dy4hoOnpzcP4BjeY7Nw/
         X20+0M3rMWM2CdmFhgDbKCf+59lYx4QJXAvjgg4gF9RGYRDeYFBnZntfBl8sptZ712ib
         kHaec0sa9Pak3fyiP5jO3lIBGc+3FrwgOZTKuBwUWMBGVyvbld4xwIYiZ3C2mzMkdrto
         dxzGSZLPv0c2ExqWLh09sR0dtHoPyS12GncKQHxoG6e7ct1tVySo5xvI3RrdGxhEon7z
         iv2EwfeRZEOh+RCmyHJcrhC1zgUOzsB+L+9y2xZuohlJ4gk2lefkLOelwTwJR2AO6fFP
         f/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUajfKqr0FmgevMZkNUoXKlk5YZnMyiYym5CPbTMT04QmUnesbDBPAUheuf4Z4mAFoo5vowi4NoCNsnc5lW@vger.kernel.org, AJvYcCVUw+3tVWHwa5v623VTKwURz2hJF78t8xWMnQ82WlVcWOOoDrbH9EGJt3AtHZ3M2ehpQzXy/HkhRlmDOqzY@vger.kernel.org, AJvYcCW0aGwNXMcPwYVL7UEcdbKwYkD9Yd2ldFB5RshBCHShE1ICIliUoXjHWXGO4yPSkPPbTxTEuJY3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmebhdv8ZpFRMhyL6tSIhqaowC4GfaqBH8Fc5wss8l/e5wLhxN
	eQj2xPwOtP76awmvhvUcRXdqFEowwMG7Fr/86FYTUXOJGhRu6GxH
X-Google-Smtp-Source: AGHT+IGG18h4HWFXUHL+AVT/CiehJARJDdu5LECKYjUv8wI1OGM4dXmOALas6TVufIUAnqB01Px/Hg==
X-Received: by 2002:a05:6820:2611:b0:5e8:8b:f2f9 with SMTP id 006d021491bc7-5ec0576ef96mr1788028eaf.5.1729792278181;
        Thu, 24 Oct 2024 10:51:18 -0700 (PDT)
Received: from [192.168.1.22] (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-5ec02c038cdsm428809eaf.31.2024.10.24.10.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 10:51:17 -0700 (PDT)
Message-ID: <c97ba583-0d03-4981-8113-87babfabbd7d@gmail.com>
Date: Thu, 24 Oct 2024 12:51:16 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 07/10] net: qrtr: allow socket endpoint binding
To: Chris Lew <quic_clew@quicinc.com>, netdev@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>, Andy Gross <agross@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241018181842.1368394-1-denkenz@gmail.com>
 <20241018181842.1368394-8-denkenz@gmail.com>
 <64cc6a55-fa3f-42c3-b6b2-cd0da18cdeeb@quicinc.com>
Content-Language: en-US
From: Denis Kenzior <denkenz@gmail.com>
In-Reply-To: <64cc6a55-fa3f-42c3-b6b2-cd0da18cdeeb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chris,

>> @@ -1346,6 +1367,9 @@ static int qrtr_getsockopt(struct socket *sock, int 
>> level, int optname,
>>       case QRTR_REPORT_ENDPOINT:
>>           val = test_bit(QRTR_F_REPORT_ENDPOINT, &ipc->flags);
>>           break;
>> +    case QRTR_BIND_ENDPOINT:
>> +        val = ipc->bound_endpoint;
>> +        break;
> 
> In the case where an endpoint goes away and a client has bound their socket to 
> an endpoint, would there be any notification to unbind the socket?
> 

I didn't think it was needed.  In my use case I would be relying on the relevant 
device to be removed, (e.g. a udev notification would be received for the 
devices associated with the PCIe modem).  ECONNRESET might also happen, with the 
udev events following shortly after.

> Is the expectation that the client would get notified through ECONNRESET on the 
> next sendmsg() or receive the BYE/DEL_CLIENT/DEL_SERVER control message.

Yes.

> 
> On that cleanup, I guess the client would either re-bind the socket back to 0 or 
> wait for the mhi sysfs to come back and get the new endpoint id?

In my case I would be closing the sockets entirely.  But what you describe can 
also be done.

Regards,
-Denis

