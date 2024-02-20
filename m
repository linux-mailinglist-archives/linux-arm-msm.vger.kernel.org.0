Return-Path: <linux-arm-msm+bounces-11797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D75B85BA3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 12:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 504DA1C214B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 11:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307AE664C8;
	Tue, 20 Feb 2024 11:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LEk8YPZy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68503664AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 11:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708428072; cv=none; b=XTNo9kE91DqPiMpG6ycWZd59M+yBQTcPdWqHPjdktIK3QEQ49FlcQnHq6uMwftP6aMnvvuyRQZjmhAuL0ias3C4wfarRCQFh25EgQjDRlGxYtoHgc3eij9gsvCvgtVMiw4bacuaVlt7p+oyRHjXh92D2zRhlmdccHFbyyXHYnJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708428072; c=relaxed/simple;
	bh=y2cTHdbhs+jP0V9l7RAJIUV6y6Yy4DW5bJt20AokuGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfGuEjKP63kq2PcMwuFoqK8/FG6OkYp0wBpYEnpHe9CPzsefw+7eCsZr1r/lnj8cySLbnUJw8mlkI8hixmm5n1ObEOORaXCcmMcD8aKw0YOopfuh68tIDnlXmDUJGdhSca0NUiJkkGylbqyh4SFioW57c5GfLGN7M6hwvff+xdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LEk8YPZy; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3394ca0c874so2699851f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 03:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708428069; x=1709032869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnrvsBqw7QbtpacZxecYVdwct8vCTDyR5tnhTxKnDkI=;
        b=LEk8YPZyLGaFY8XqmsQsHiNRQZ0BLHCIgMKUPOkbgigjjCvKxi2l8jgLmguSiSW2Qo
         ufVyD1BFisTQV+GeZUxHDVspdo1lV3MxpZSDkSa/rJEphhIpPy44qPsrjmQf2h0RqNJK
         s/PBlhIPbtJCfX/BwzN5UvX8oZuRdnJp+/dNIGb+N6TPr9i2KmvMXrikH3b45fshd0j6
         QRoyEIlO3M9/W0J3HhOnvNiD9J5z0Vs0/ohiJvbmsowaM8r/cHLUpqN54ZUjd7+r5z9P
         8P5MlJkqPRn4vzWG9NTS2JK3487UIhUgghXnuTLPNThKI08IIzlJU1XEvqGn7Ftjp0Kw
         VMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708428069; x=1709032869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnrvsBqw7QbtpacZxecYVdwct8vCTDyR5tnhTxKnDkI=;
        b=CO2iGnCHReDFKPMUpmdfEvxZweJC7ODTq1HhXtB9KBokUZA38388q3dRnVQBzjQlmr
         hssYbiJf+YBG8uRx+8TLzwPnSiK9culUkHn5W2IljqBM0gGjAgXH7TQ2o1BsIt8RZftI
         7Gu8L9+yFqUj22CQXA5Xl9BPJSCuXjPjdiTYolfuNgyjOw3+C8hzm3LOpVBptfQ9l2JA
         CTWvDNSIMJr+Bqzop3QQQW9mRnkKYu18FQmgLiEEM0Jd340brxFSdhjnwIPn392SJnlC
         QsKR85w0kFyp+4XrR+zh/C/tHZgbqU0oUw5lhZf3jafia7WYr+Mkf97KXeZGTYF90lNx
         Xg0g==
X-Forwarded-Encrypted: i=1; AJvYcCX7I7ymgsVMwwrfUL3L6IAdHaFryJdCjcyjnuor+UhugoZU2T/QKxak9aqRs7w8ITlw9S+fU99i7KciMoDGY1T1d0jgI3Twcf5QTyerIA==
X-Gm-Message-State: AOJu0YyPA98RNTAciWClE+4V8WQu120OV02lVt/lzwZwzRke1bnAraXA
	ZU5CmxrKJGN4YZyjhc3vusOD4l3k5lhwvz/HZY0T94MmdxijHmaXs6JRTb6/nbo=
X-Google-Smtp-Source: AGHT+IFPZI6mIvGokJt1X4VUEHcuPhIk2yyf27bMhmEMYYX9mw53cNbqyZDIkb1WvUBZVhkhJjcrdg==
X-Received: by 2002:adf:e10f:0:b0:33d:509c:5692 with SMTP id t15-20020adfe10f000000b0033d509c5692mr3941935wrz.31.1708428068775;
        Tue, 20 Feb 2024 03:21:08 -0800 (PST)
Received: from [192.168.232.100] (31-187-2-170.dynamic.upc.ie. [31.187.2.170])
        by smtp.gmail.com with ESMTPSA id b17-20020a05600010d100b0033ce1ef4e7asm13108972wrx.13.2024.02.20.03.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 03:21:08 -0800 (PST)
Message-ID: <87db77f7-fda4-4cf7-adfd-8545c40c3365@linaro.org>
Date: Tue, 20 Feb 2024 11:21:05 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: DT <devicetree@vger.kernel.org>, linux-media
 <linux-media@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phh@phh.me>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
 <f6e68756-72a1-4c32-968d-3d6adaa153c9@linaro.org>
 <CAA8EJpq=G21h87W69_4U-BZ=Sa5VEs15Y-zE-G5x9VxVx4qjsA@mail.gmail.com>
 <81dc6452-4039-4eb4-92ba-df248215fca2@linaro.org>
 <b8325dbf-67c5-4898-bc23-ff093ae6e14a@freebox.fr>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b8325dbf-67c5-4898-bc23-ff093ae6e14a@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/02/2024 10:56 a.m., Marc Gonzalez wrote:
> On 19/02/2024 20:24, Bryan O'Donoghue wrote:
> 
>> On 19/02/2024 5:44 p.m., Dmitry Baryshkov wrote:
>>
>>> On Mon, 19 Feb 2024 at 19:29, Konrad Dybcio wrote:
>>>>
>>>> On 19.02.2024 18:18, Marc Gonzalez wrote:
>>>>
>>>>> On our msm8998-based device, calling venus_sys_set_power_control()
>>>>> breaks playback. Since the vendor kernel never calls it, we assume
>>>>> it should not be called for this device/FW combo.
>>>>
>>>> FWIW, this is also broken on other SoCs.. 8280/8350 and 6115
>>>> to name a couple.
>>>
>>> Then let's just disable it until it gets unbroken?
>>
>> Its functional on most of our upstream stuff though, why switch if off
>> unless necessary ?
>>
>> Maybe it should be an opt-in instead of an opt-out, TBH my own feeling
>> is its better to minimize the amount of work and opt as per the proposed
>> patch.
>>
>> Perhaps the qcom vidc team can give insights on 8280xp and 8350 when we
>> come to tackling new HFI6XX and later SoCs ...
> 
> I was wondering if the chosen property name might cause issues later...
> 
> Thinking "qcom,no-low-power" might be a bit too general?
> Perhaps would need to mention venus somewhere in the name,
> to limit this to the video decoder?
> 
> Regards
> 

Yep, the word venus should probably appear in the property name.

---
bod

