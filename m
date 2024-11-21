Return-Path: <linux-arm-msm+bounces-38729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 489DE9D564E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 00:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E941D1F2399C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 23:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7461DE887;
	Thu, 21 Nov 2024 23:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO3TPWM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653B21DE4D3;
	Thu, 21 Nov 2024 23:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732232553; cv=none; b=NWYotoQhyP26kWAqRbh6m8kVD5PbLK9nRI9gFG+bIIL3oE/nDXHnz1k76d9VheeWL8BP+K5UyG/3uSqrn56eyDXxWQYR3ZWVPjD1pZRujfYfokprhLgFhzr+MDP/ZAZiP1atkKqzPe5gZoowufyt6UTEgBNeNzGQukuHoXJ83R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732232553; c=relaxed/simple;
	bh=8y9YLZfA/j4D+Wc81B7+9U0hAhDA8nNRAzL1uJgTbX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkLjaCVQpcw2DsReSvqFnqAWFM5myMEYmaBdVcUJ4YD1RHzJlMbQyvA8cy+Hnh3TvKb7h5EP9Dml/sVoz0WrPi81egGdfmXUJObwfS97ifIVoHpteyUcAp/Ux4+V+W218lQRguSm5npt48CsVg4+PwbCbwCyPZTrHpOJh4tI9JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO3TPWM/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-382325b0508so1054273f8f.3;
        Thu, 21 Nov 2024 15:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732232550; x=1732837350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ccV/yshE7H2smC4scGTK8g83YpYG6AVCznLkmoOvLTY=;
        b=iO3TPWM/OxZHrjSAEWVMxEoSlbFQ+9hjOGf7BbEZtqB5jMNY2f3BYLSwuBhGz9WXyJ
         ubby+/r/h7ISoI2EszopCGsmgnEoXF+k2W8fhrJoAzN0fXZUN8eNg/upCNsYz7zITZDO
         J7eQWOnokeVR5u2BQJ/vcvQmB5Smji1/2S+SKa2mKs2yGsgPXHRK2BNbSPc07/nUPZOb
         SG19Z2njS64ypEs2uUDPQ4l9rbFVmHIbOk957WaK4uZ3LwuF7O3eNty+4gnjKGIt8Aut
         eLhu+MAuprFIdgcruiFx1s7UEuUP69ktB4eUpmO69z9O/dZt/gI2u1My1PCzmZSzJkK9
         PaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732232550; x=1732837350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccV/yshE7H2smC4scGTK8g83YpYG6AVCznLkmoOvLTY=;
        b=XRs+GJCqgh+ktZE8H9ZoY2jERujQ956gUlLwhncMjWJOCLGgflSTIl7yyNcN6NKost
         aR+AwdLvp8vyJNQq5T6/dTxjFozRW8DGxvllMhvl+bZJgpfhlpXP8FxXvZqaSwB4T0lP
         CrF0F5UnCiNngWxzdyuXuUG0H0slIEn4MZXkhtGhrxVx4RnD566pwGSHjxxyDbd5ogUH
         uwToJIKOLhf768K0nOdnbkFCuHNfybETcP7SJWkTXL1RRo5TkKalLgTSnWAZC8102P8M
         tUAWXwsmgOmMqSH7i8oSW5hCt/rdqtqHQFDzAsZwg1RhAfa6Gjmrj+sw/oPfynjy8w2S
         lJTg==
X-Forwarded-Encrypted: i=1; AJvYcCU0EL/MFhU4KUyCJWLrC8mCksgIDwZKBGX7SoHbPt+wsls7uJRYRMD1gqx+gc2Sayu1s2UyDzjWPk2v6rLd@vger.kernel.org, AJvYcCV0bGUIdgzzvlGnlUe0l/rEa3kwidNzj0kqyR6OBX/eQJWUorWLWcVjlmNqNGeBwsyj0SkXGe+Q@vger.kernel.org, AJvYcCXQ7hKbAQRCog02FrOtHqmIcfXp8giEOvqrNY9ofxRv6seYeeqfL2GJRBKX0aRD7EvLOSey5tOyNz7k6TVV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3KwPJgWnj27Gb6/hsHMYp1hipgwH6/ALE3Eozh9gqQqaAWZp
	P+n7u3TfKAts/o6Udikx3MTx5UlI/O+e+OlFHgL2g9FcjpFuWu84
X-Gm-Gg: ASbGncsqTMoV4SUIafJiukk1ECRSpCLgrJWERchHGhbkcxaYSwmqi7RPOtIHaUVbg5R
	CmybGloQ1ilClmdD3UboEtfDr6ZbR7LiychiY0g0TZG+7kBroM87yB36JsmZ1io1IvQUmW6GciJ
	z3ZjyekEv5d71fCSHHVfU0oTNPGgMleM3mBL77dt9AV1P3sRDw2dTLuoxA9gd2zRXmLx7vMovqM
	V1MJKF/+7SpVyJfrv/+I8vNB/obUw5wXDEzAgguHIxFTTPoT7Q=
X-Google-Smtp-Source: AGHT+IFl26rdc0Msco1PLwttztV/3s0UQWBR7NApcuiOreI25Qfwe01ytYEWSRSuWB1714GsnV01Nw==
X-Received: by 2002:a05:6000:1543:b0:382:4b9a:f500 with SMTP id ffacd0b85a97d-38260b5bb7amr650832f8f.18.1732232549591;
        Thu, 21 Nov 2024 15:42:29 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b463abb4sm75592645e9.31.2024.11.21.15.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 15:42:29 -0800 (PST)
Message-ID: <33d70ece-15db-4c83-90a4-3daa2f4032fd@gmail.com>
Date: Fri, 22 Nov 2024 01:43:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: wwan: Add WWAN sahara port type
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Jerry Meng <jerry.meng.lk@quectel.com>, loic.poulain@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241120093904.8629-1-jerry.meng.lk@quectel.com>
 <863ba24c-eca4-46e2-96ab-f7f995e75ad0@gmail.com>
 <fbb61e9f-ad1f-b56d-3322-b1bac5746c62@quicinc.com>
 <7c263cbf-0a2f-4ce9-ac81-359ab69e6377@gmail.com>
 <022f6596-3b4c-6c19-f918-8dc1cce509ba@quicinc.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <022f6596-3b4c-6c19-f918-8dc1cce509ba@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.11.2024 01:02, Jeffrey Hugo wrote:
> On 11/21/2024 3:53 PM, Sergey Ryazanov wrote:
>> On 20.11.2024 23:48, Jeffrey Hugo wrote:
>>> On 11/20/2024 1:36 PM, Sergey Ryazanov wrote:
>>>> +Manivannan
>>>>
>>>> Hello Jerry,
>>>>
>>>> this version looks a way better, still there is one minor thing to 
>>>> improve. See below.
>>>>
>>>> Manivannan, Loic, could you advice is it Ok to export that SAHARA 
>>>> port as is?
>>>
>>> I'm against this.
>>>
>>> There is an in-kernel Sahara implementation, which is going to be 
>>> used by QDU100.  If WWAN is going to own the "SAHARA" MHI channel 
>>> name, then no one else can use it which will conflict with QDU100.
>>>
>>> I expect the in-kernel implementation can be leveraged for this.
>>
>> Make sense. Can you share a link to this in-kernel implementation? 
>> I've searched through the code and found nothing similar. Is it merged 
>> or has it a different name?
> 
> drivers/accel/qaic/sahara.c

I was searching for SAHARA and for sahara in the log, however it was 
introduced as Sahara. Next time will use case insensitive search :) 
Thank you for the clue.

--
Sergey

