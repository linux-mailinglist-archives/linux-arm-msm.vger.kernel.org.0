Return-Path: <linux-arm-msm+bounces-89471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F33D3897F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 23:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 347283040227
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 22:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC78314D13;
	Fri, 16 Jan 2026 22:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="Vf486Z7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A6A23183B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 22:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768604132; cv=none; b=StlNPe3rqLJM/oiT4sez3AGDth95SVMjgabKYxJFMJOcfEtfw7+qytCY6dgSzpNRXny16/0BIzs0eJZvpIuoFYy7bsMsJq0Fw/KaDXNPtx1fYYoBoF1oys+Zlp8FTx4Ye3AqoUy9kP6AnJ+5kxBQwv3hwsQIpHu6GxP6SRILKC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768604132; c=relaxed/simple;
	bh=llmfTPp0WelKz7jhVXMsw5K4Hl8MVjxqniwEWa7ji2g=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=saXRgUwCdme6QRs6FSyRb+G3Umphmm8jmXG/r0MxdlzOLkNKJyAQR3yrZX/+6l2FqMKUE65iicu5PvhYkLcd3SDk+2NWl8p3kahSilNStuOMhF+ufCO8GvRtpUJOOku7nLSLETa/Gfd5YcgHtCvQ95kQ3s5V7DdiEdCQh2wj/Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=Vf486Z7q; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c52c1d2a7bso392901385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 14:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1768604128; x=1769208928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaMQBLQZL4oC9WJAEgtAsMP8QqOYOo5TRnK/me2K3Oc=;
        b=Vf486Z7qBN3f/OiF7l6OqCyLfzQnOkm9QXPHBSwnnrEwB+siGkUMs3/4gacYoshRKH
         0QVo0cMAqi8uHWknnL8cvXnAZscCG2NQUncQJLWaXrtboR2DIPm3bvIAJfCLyAuZXAyi
         cIc7zFCGzUoZkSMczNhIVr8DX4YiWCrDAsBxVsbdPGmmexOB5No1t3EBTzTg/WPUHDJ6
         z75VL/S7ViNFvmWdqcicyrLYsUkxBQ6hbBScmsCZgiovFhppLEbvkF3Ee3B98LBhNJ2r
         OtfRcjPWBsqbG2Or6Gk9mC9Nr0BfCpgP5HE1SF1sM7bsk+aQ2fbowYmMzXkDTH7znG6x
         jf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768604128; x=1769208928;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kaMQBLQZL4oC9WJAEgtAsMP8QqOYOo5TRnK/me2K3Oc=;
        b=gLyIX6x5gqya0AbXuDiyyLpRAOdeJogerCtGSwt3htdn3NlRhWp23ikzV0ilw8wluV
         ED0oJnIPUnRgUSWX3fteAXEPN9XasShJP/9DfoCcmbCGGwQfYLA300wxlBqjRIRotQDo
         kTymUCoUTZJznTh2QYJtU7iTLlyO54qIezCCqr1aZ/VedoOqlngSIYvLmNXpb128RZtv
         H33fJcOWAem+RTbtDInqMTyb/fPmNUYEwDJUqsi645+WAjB+OJysjeSdxPWc2zVL4zff
         OE57269TgG46dI54aN0pIxzbM5L8tNmu8B8UYYBIHLBeCe0xKTHwfYMnhMjUQ7S1mczm
         6/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfnaDUzTNArs94FFUNQ8QXh2k8v2C43qjYgozCmIYH2lPY8BGgXPOx2a12YGaPc/Djnbr7we2820TnbR98@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9HLJVBVAOhjnGb1frNhaTZrvq0Mj+QbHJh3ykX7WngvqKzBmz
	kOAyQgPL1woOVjnheRfhRdyNUf4RZo2z+LdXGCRPrNAW+Rbc/QM7EFugV1rRFwVkTU8=
X-Gm-Gg: AY/fxX7vGbxwy4UYMIym7sg2acKgWJRFy7mh54SSL/rky6fUkc2/9T3WHmpbuWR/rc+
	/I8W5VQvT2Nz45GIycXyhs5y/b/RAN9hDYDO1QE30MyXEJf4XeeOh+mh6O+Z93FOMJ+nuzbCzg3
	i5fYQ1WI07qwjgE2IW3NB8zD/6h3WAW67gRVsIlmpupMIOCwUTBbreXODauBtRbJt0fRRL3qtbf
	xOlXMcioW3q+UDnU3dNp3l0UCDtUTOAAbsLPz7SGZyF4e4ltFsYpY7zFDxaUEmqh37WJOWqSxGb
	h03KEXRyL+W28HUc4bb37FvVJ8ezlLCEQ57WFDG/bCVrI7tmkCa4gBX4UpPvle930CZD84aqQUN
	DaFAWqUDIFJGVVR4+5EW2aRUiLvwvwje+9dJShlsJpla8VDo6yvHSr7ZU+coz0vLzH2hYfWu3ZH
	erR7n5Xb6nhWxnggwmmBTci1W8teoNEoaL4RLm7upY5irkyDh1gW4atqLrVQ==
X-Received: by 2002:a05:620a:298a:b0:8a6:1a5d:7ae8 with SMTP id af79cd13be357-8c6a64eb2ebmr839278485a.28.1768604128544;
        Fri, 16 Jan 2026 14:55:28 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a724ec87sm337089085a.30.2026.01.16.14.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 14:55:27 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
To: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
References: <20251127212943.24480-1-jonathan@marek.ca>
 <176859948742.425550.1764024067188709567.b4-ty@kernel.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <79b3e8ae-134c-df6d-396d-9b7f766ef666@marek.ca>
Date: Fri, 16 Jan 2026 17:53:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <176859948742.425550.1764024067188709567.b4-ty@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It turns out this change will make things worse for the (unfortunately 
common) EL1+64GB+brokenfirmware case.

Because of that I think the Fixes: tag and "(fix 64GB models)" should be 
dropped from the commit message. (I can also send a v2 with extra info 
in the commit message if needed)

On 1/16/26 4:39 PM, Bjorn Andersson wrote:
> 
> On Thu, 27 Nov 2025 16:29:42 -0500, Jonathan Marek wrote:
>> Unlike the phone SoCs this was copied from, x1e has a 40-bit physical bus.
>> The upper address space is used to support more than 32GB of memory.
>>
>> This fixes issues when DMA buffers are allocated outside the 36-bit range.
>>
>>
> 
> Applied, thanks!
> 
> [1/1] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
>        commit: b38dd256e11a4c8bd5a893e11fc42d493939c907
> 
> Best regards,
> 

