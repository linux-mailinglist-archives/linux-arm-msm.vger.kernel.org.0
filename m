Return-Path: <linux-arm-msm+bounces-11833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C77985BC48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 13:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D62FDB25DD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 12:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D035674E;
	Tue, 20 Feb 2024 12:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="o9dVyzXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B87692F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 12:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708432459; cv=none; b=HW/bgYk2NbTxqjHSlubBfc58QSoA0HjS7JkIdpZNB1iZtBFsdpK1l/yp0cZtGcuSuCiJ8cbof3ZfC/DFwaSJ37hn7HoZ+/t7KlSu6N5KjvChy1l3XZxlntEv6X+7KHW3z60rlj7g8PkNrx6GE4jfOJMwYUcmR2DcQ1kix4S0/So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708432459; c=relaxed/simple;
	bh=MGIqUV2CI+UKZ3CA2T3javXRBNfXHeAugjBsCrGhZlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsL6MGa6ke+ipBPYwBKNi3WovijiGiY2TkT5jD8v4BNiT3jn3//zt0dy3CqnxGhdN9EzHlyAf+8cltam+wG3uVYfPpVfqq8nS/2WPTPzoS6c6cZXCSu65hmg606vl0UIa8LVV+4IZuSC7hoRMaAJJjgMf0bmnqoj6SLFgFcaZYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=o9dVyzXJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so44546325e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 04:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1708432455; x=1709037255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ua3KO8MgOVGzzJ9O1MDgx7OJCCp+9jL6JZTa/Xsyo18=;
        b=o9dVyzXJ/46kmTf7VPuDXsh0qSs18b3Lvy+SFtKL3PyAitmIobJMtmRv1PuIjx/t2z
         BmJlaWXCmerNvswJEf4R9S2NTrdy+qHdk7T44XM8qoahm/4THe/EGbaScffS0jRNo1g/
         tpdezRM4CgBrmUVLDUjh+l3yDj1/ZAPWeJY35yGaVjSD3zi4xUsxS1Z88hqfnnOKIJsm
         RP2x0e2YgWVXLQmNclX1PaQT52ljlZ+yYlvwz8bQMlqYqJoDT7bnFQtVVQ1TeJnviFuA
         PEh8cpTz2U3shBfHugG6b1ukmPd85QfO4X9HXV7PZdSyUI2RqFjiN/8RLbmCa29ivO49
         z6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708432455; x=1709037255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ua3KO8MgOVGzzJ9O1MDgx7OJCCp+9jL6JZTa/Xsyo18=;
        b=O4JECCqAOvURjvERyG8ROTiYmmQwh895c3hAh1ce1SkGU+Rz2VrnfvkUj/gN7sKcDG
         JN9WRqUJ2wDDawz0UXQQWu6DMhs22DtM1sAhr9lubVmD/XKNZ7SnojXusPNsKXIZ9tWw
         DLYwyVot7fHxoaM9s7p2+xswTdNjagset122muLAZLlkPyiAkZY6VUNNow2QU5I7sx1i
         YlT0LGVL5UCgklPGO0NVgolUotbLSEjwHR80CdvWbeYAwgsZuC9lziZRmmjKMrkEwmsl
         JycpiSRpAnVJV9TYKRtCIGN1Gn9nkcgT2va4b8+YlTCMhR17yfawiYdEIQvPinWpMd0n
         bUFg==
X-Forwarded-Encrypted: i=1; AJvYcCWszVdLjHp8dJXS0JqR/pXdTxPZzBgnuyVtf169/2g1E8mGB8BEsreLvNGRSzGY7kcaGMneHONWkMQN0Tqx5HXuZ8TiniR2AyBxfGoRbA==
X-Gm-Message-State: AOJu0YzCzl48YgZY+tQwZrEvkV+DutMGF8HoR6qhXZxerntAHDPzXQCd
	/x6tqaUzUnqypATuNBnQkrcem9X0pfwEhWtXgZKc+svU/u/X7+eU7QQ4IDWY9X8=
X-Google-Smtp-Source: AGHT+IEj8Nz2mWcue7qr/FDIPFVjs/qOJzU/FyY35CbGThswb1cSYoppPgfhE++jXBFH189u94TX6Q==
X-Received: by 2002:a05:600c:4f0d:b0:412:107d:cd6c with SMTP id l13-20020a05600c4f0d00b00412107dcd6cmr11000210wmq.28.1708432455483;
        Tue, 20 Feb 2024 04:34:15 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c4fd400b00412590eee7csm11460164wmq.10.2024.02.20.04.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 04:34:15 -0800 (PST)
Message-ID: <6342e92d-eed0-45c2-8f04-3779aa2e521d@freebox.fr>
Date: Tue, 20 Feb 2024 13:34:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <87db77f7-fda4-4cf7-adfd-8545c40c3365@linaro.org>
 <10fe67af-0572-4faa-91c6-fce9c8f9dc92@linaro.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <10fe67af-0572-4faa-91c6-fce9c8f9dc92@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2024 12:37, Krzysztof Kozlowski wrote:

> On 20/02/2024 12:21, Bryan O'Donoghue wrote:
>
>> On 20/02/2024 10:56 a.m., Marc Gonzalez wrote:
>>
>>> On 19/02/2024 20:24, Bryan O'Donoghue wrote:
>>>
>>>> On 19/02/2024 5:44 p.m., Dmitry Baryshkov wrote:
>>>>
>>>>> On Mon, 19 Feb 2024 at 19:29, Konrad Dybcio wrote:
>>>>>>
>>>>>> On 19.02.2024 18:18, Marc Gonzalez wrote:
>>>>>>
>>>>>>> On our msm8998-based device, calling venus_sys_set_power_control()
>>>>>>> breaks playback. Since the vendor kernel never calls it, we assume
>>>>>>> it should not be called for this device/FW combo.
>>>>>>
>>>>>> FWIW, this is also broken on other SoCs.. 8280/8350 and 6115
>>>>>> to name a couple.
>>>>>
>>>>> Then let's just disable it until it gets unbroken?
>>>>
>>>> Its functional on most of our upstream stuff though, why switch if off
>>>> unless necessary ?
>>>>
>>>> Maybe it should be an opt-in instead of an opt-out, TBH my own feeling
>>>> is its better to minimize the amount of work and opt as per the proposed
>>>> patch.
>>>>
>>>> Perhaps the qcom vidc team can give insights on 8280xp and 8350 when we
>>>> come to tackling new HFI6XX and later SoCs ...
>>>
>>> I was wondering if the chosen property name might cause issues later...
>>>
>>> Thinking "qcom,no-low-power" might be a bit too general?
>>> Perhaps would need to mention venus somewhere in the name,
>>> to limit this to the video decoder?
>>
>> Yep, the word venus should probably appear in the property name.
> 
> This is RFC, so I am ignoring it, but just in case before you send v2
> with the same:
> 
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.

I added the RFC tag explicitly because I was hoping for the DT folks
and msm maintainers to comment on the property name ;)

Thanks for your comment!

Here's the proposal for v2:

qcom,venus-broken-low-power-mode

Description:
This property is defined for devices where playback does not work
when the video decoder is in low power mode.

Regards


