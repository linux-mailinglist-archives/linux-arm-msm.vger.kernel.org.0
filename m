Return-Path: <linux-arm-msm+bounces-76850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86064BCFF8D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 08:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3180C3B87D3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 06:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EC820E6E2;
	Sun, 12 Oct 2025 06:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b="O2LUySFq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F1D1F4190
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 06:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760249014; cv=none; b=S0XLS6fnyZqDYheEqpmbfMaJ15lCbgJg4vjLYrQ5Z0fQPfKeXnoTEagzCMie2rJXPi3C9xPErbB4mktV+jNwf6JMstKfCKpuOwY9YKebt4eho97B/Vay8LLCL4RgoZQd9Wx35HOkkKRcGAyrk0B8JxAPx/dtZtaa0ql6Hz4c208=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760249014; c=relaxed/simple;
	bh=EL2sXnkVXyc4/0xhj1/c7GTQHDex3rg+30WyKQzgLNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4vVWb2JZXXeVeVEEAM749e4fHMwYf5ywdjlWm2VJAkENqhvy00ghn9TroDtcMAsH/2LvDJzUtao2sDJFFPSq5hI9DeTNMlxh4xi2HersLZN9onQEt23zlAUPJoTbHgwQUt9vLPDn7o1h3W3XpEDgFxtRM4pKwYlOiyzRRHIXxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org; spf=pass smtp.mailfrom=me.ssier.org; dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b=O2LUySFq; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.ssier.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-85cee530df9so489136285a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 23:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1760249012; x=1760853812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRm9xjoa7nma870h/XmiqTo0QL4WR8G5o5uredUdibo=;
        b=O2LUySFqouNdvHjJuev1tGTrotwEqB2FM52NnvKpwZ6XuDTMrirUL8VemA4BtRa3UZ
         HjUIVvCcA+rZVR5e93uqw4WFpvO/WhLFlNFbQWd3LdOHK1ehR92kbVOBvvnsQOKeK1QI
         wNKjDHZtfppO6UqnETgyX9rXYzUffSyPYeoJGkCOa/pC70LgGQwVXyv6cG5lWuG7Qkov
         u6cXsK1Tzs7E8+vcGLSjSmbK1tmhuNKwbgV9t11XVD+tcS3EQrT34K7AOkCyiQDUXBJt
         zOltcv2XA98rbL8Osu8TY154AbHz51yUKalc/SYWIyIYUF02CAxZcyODwbIkiybJowMb
         JKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760249012; x=1760853812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRm9xjoa7nma870h/XmiqTo0QL4WR8G5o5uredUdibo=;
        b=IfPEIudqGrcUz+JHZhaOOEQciELx81vknuvxviKYOOJqSzjwmsukLvsF87volXUEh3
         nVGcWEWIZv9k6yQryxOIv7yyuD6F1dN8jBjKsCE0fEnjonfKoabdvP8iKWuSPftLCIfd
         S1AFo6KCEWJ0vpu3VgPA8acSmyzluDixy90XVxzIj8PIViW/z2mq4zSTeWsxDFABc1Zn
         892sMbq9eVbgW7PCK20OlcY8fhTdB6twH5ewrXGKYMZa3w1Ozj88kqoMIeEiyRrFGQvi
         kADkJT1J7GiYmGB0oZDaqmTuZcPsG7HRClhcEoNsIUN1ta7RVJDQ2QqhW0ahOevHqj+Q
         FFTg==
X-Forwarded-Encrypted: i=1; AJvYcCUP1uWlad+Mb+jEg7/dgHu6LUceu0HrcYcQD7KSazdnVG+qEg372wX8lOX+W/gYYJifq5ml0quB9zqTfb7W@vger.kernel.org
X-Gm-Message-State: AOJu0YzMKBfCOyRlKYUfwDpuEltQ7R9/DO16mZqwKtVCe1FfjbiZlgTq
	GzyfqxubbmkLu+7WvlOdqQfsDmsnSUlFy3nNfPWl6ckj8UYexHlsOWKqfdezBzc0Fb4=
X-Gm-Gg: ASbGncsMRrZvdqQFpJUnfvzXqftam3RFpdTP8w6uXrIXciYn6+fdVi/Uj7gWflLkasx
	GehN6rbXC7NBQDn6gT333ypvBwl/HNRmmRMQ3oa5mlaRYdQ7WNnzh2HrDP10a5ro1OZk4EJFQh0
	t8E455NWpIC/atfEbw/7b4JLNjVnwqw8dws/KU981CJZHKnIymhe/EacuQToV40YBhvQPXZb2op
	lf1/Rwp5mZ4Xjp4MFY9xbqPC33i/wzyN06ChatJs1WVU3gnW03+xIRe/p5NQSgC0B6avIuL+Nha
	I7TVN1Pmp+Nzi0ABwJXCoZBpqI/IpG69NzvNdVOaE8E8FpWmyi9/hxAtjZssC/1aSKtyA06Ullp
	c25zBnAAq1NXyrDh6G4HSBONfq/0jc2rPyxXex6ywGPBmBQQZa7OfC6KuMHOQcY3+qY1Uz28yU9
	iPI9YKu/pcuPxNTegVeYMALRNXk3C51VcsmKSnC/Q=
X-Google-Smtp-Source: AGHT+IGLhoJnin+O4om4Te+bAwuwm/6HPtCKLHtCftsCB9hZmh2J7RkjVHXeDb2T0HUlNqxwL0iT8Q==
X-Received: by 2002:a05:620a:44d0:b0:863:b78e:d159 with SMTP id af79cd13be357-88354ea751amr2282466585a.51.1760249011609;
        Sat, 11 Oct 2025 23:03:31 -0700 (PDT)
Received: from [192.168.2.8] (bras-base-stggpq3702w-grc-09-74-14-126-215.dsl.bell.ca. [74.14.126.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a1ca3defsm730315685a.38.2025.10.11.23.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 23:03:31 -0700 (PDT)
Message-ID: <fef52764-3092-4375-b9c7-793d85adc102@me.ssier.org>
Date: Sun, 12 Oct 2025 02:03:30 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
 <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
Content-Language: en-US
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-10-07 06:03, Konrad Dybcio wrote:
> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>> From: Alexandre Messier <alex@me.ssier.org>
>>
>> Add support for the notification LEDs on the HTC One M8.
>>
>> Two LEDs are available, one amber and one green.
> 
> Do they form a single notification led, or are they supposed
> to act separately?

Good point, I had to check the phone user manual to confirm. Indeed, it is
referred to as a one logical notification LED. It also mentions the color can
be either green or orange, it does not mention using the combined color of
the two LEDs.

So I would say they are supposed to act separately.

Hope this answers your question, and let me know if more details are needed.

BTW: I will be sending a V2 to update the color name, since the user
manual says the color is orange, not amber.


> 
> Konrad
> 


