Return-Path: <linux-arm-msm+bounces-11736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B220E85ABF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 20:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49CD41F2107A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 19:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8540250276;
	Mon, 19 Feb 2024 19:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eu41wML8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B208F4F1F5
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 19:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708370679; cv=none; b=jcWdOSi60t7NHJB0nHFwlf4xBERoPp3K/ScJ6WbLehuEd/OiBJw58RwZRbg4AVmCby4nbw8S4REAmLNQyjIjd7atuG0hKO+2lEY5yH1ML+31zJo6lBKQ/jJSqRbHGFBOh5Z8PphSYuUbl7rrv/kXogAua2XIlPibjyNegPmJ2I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708370679; c=relaxed/simple;
	bh=+7RYe4hdrSrfp0K7I1usaPBY7XndsDc1j10wOZqP+X8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+GcHF5NUtxNvqZSG+zddlQq8YLf46CmvYcRvF6H4ZtjK1T9XjV71AggwTffbRElhl/79EOXjlISRE5cMpcsPWbxiubkZQodtufCldAP4fWeFi1IOY1ty7HvJoSY6iKdiywg0EofUlnGkZerLH899bTZnUF9AQOPkbpJhGbl1Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eu41wML8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41261233e61so9562745e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 11:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708370676; x=1708975476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GdQ2CT7PNWX/unl4Eff66KtywtI6Y0FjDftHF6BPnlM=;
        b=eu41wML8Gucxb8UhTk7P3E3XSrM6PUDB1iSmw99nw0/YlLuoMuo1ig+iBy1zs5w1Fp
         pW5lhcPXjC+7HFnOnQ7DNVjxCvP2LgPWxwOCrN9k6g1NT8W5YcqkruXjM0AVR7kQ5Bz7
         iySbU9Le1/yJBlrtgE4/KkZuRvUpAtz49WdgIJZnpTLXn6BkKTKlbCqj1q+jNWbHX10F
         TDLEumnDdrv7vNIqFwN9ig6pH7KyggPspZTZQxDgXM+tL6Q3Yj2qfL8v5IIdBFFpaf7N
         yfqGf9Qg6Aa1IWNtJIUqE8KTcJ04b866BZP59STRTKgRwbweO34u2yncqWpf32q+CFXN
         UQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708370676; x=1708975476;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdQ2CT7PNWX/unl4Eff66KtywtI6Y0FjDftHF6BPnlM=;
        b=iDSsbBUu2FKA7PidApso64wWKrRcpuCBpLaCG+WFWSQnmJQvbZYW0k7mYa3x78/gQi
         AXym52flEw05UhUNxJJgEb05sHeMJ6fnTDWyRRm5Wrm47K5miVDRo7XwF2S9ITLnBz8V
         TGQwaXhxnO4yoWLQKqFS3nTRCwSl2sov3fMAcQJi2nch0gfzYdRbdj350YpZ/hsifHet
         cDeCGl6UWpm97kb5XU+I5Us+5Lf/NKD+KYl9nSdmbfvJ4zjhdbKs+SIlJ9i1EvPV4mmo
         3d6PtpPtEp5Qo31WG+hqa+URYpBP7u6jRIX7DeG+5+E7j856gRrCe0nqCpy2OIgiHmeX
         ELyg==
X-Forwarded-Encrypted: i=1; AJvYcCV15uNJK7+1EYkQ5XeCa89dtaPTGrM9Zd4kfkVc5VtLXDB0tlrviYubyTHP2szdUGpRMq4FJtvDW/I2z5RiE2CpYVVnO/1pY3/LU6ROoA==
X-Gm-Message-State: AOJu0Yz/qCp0Tkx//Ks/OOBXMrNSRBQi4PBORSa/E0Zo31Z9++Jyw4Hj
	RNqXYKllqWiQWnp8VBMhwOmRZFDUFkNXyCqDkBCC3/B/53LQiWcsi9aWnZ0DESk=
X-Google-Smtp-Source: AGHT+IH3Q4LItHoVsfFRoOPpaA/MlInIIiOmLI7h0LcRzWOpJobbqBDxrFPDKqYVKXMk7xV+XBWXqg==
X-Received: by 2002:a05:600c:1c8d:b0:411:c8a7:7b09 with SMTP id k13-20020a05600c1c8d00b00411c8a77b09mr11843898wms.10.1708370675773;
        Mon, 19 Feb 2024 11:24:35 -0800 (PST)
Received: from [192.168.232.100] (31-187-2-156.dynamic.upc.ie. [31.187.2.156])
        by smtp.gmail.com with ESMTPSA id l37-20020a05600c1d2500b004126afe04f6sm1388495wms.32.2024.02.19.11.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 11:24:35 -0800 (PST)
Message-ID: <81dc6452-4039-4eb4-92ba-df248215fca2@linaro.org>
Date: Mon, 19 Feb 2024 19:24:32 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, DT <devicetree@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>,
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAA8EJpq=G21h87W69_4U-BZ=Sa5VEs15Y-zE-G5x9VxVx4qjsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/02/2024 5:44 p.m., Dmitry Baryshkov wrote:
> On Mon, 19 Feb 2024 at 19:29, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 19.02.2024 18:18, Marc Gonzalez wrote:
>>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>>
>>> On our msm8998-based device, calling venus_sys_set_power_control()
>>> breaks playback. Since the vendor kernel never calls it, we assume
>>> it should not be called for this device/FW combo.
>>>
>>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>> ---
>>
>> FWIW, this is also broken on other SoCs.. 8280/8350 and 6115
>> to name a couple.
> 
> Then let's just disable it until it gets unbroken?

Its functional on most of our upstream stuff though, why switch if off 
unless necessary ?

Maybe it should be an opt-in instead of an opt-out, TBH my own feeling 
is its better to minimize the amount of work and opt as per the proposed 
patch.

Perhaps the qcom vidc team can give insights on 8280xp and 8350 when we 
come to tackling new HFI6XX and later SoCs ...

---
bod


