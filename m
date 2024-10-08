Return-Path: <linux-arm-msm+bounces-33582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDCA99537D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 17:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93E191F258AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 15:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03791E04AA;
	Tue,  8 Oct 2024 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LFfa8Ucr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111FF1DFE2A
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728401896; cv=none; b=uUr/rkajNy8HqDZbetIYwFt1mCNatsuEjN5o0NwKZq9GUhf/x4eY2mZ6xegzynHzC5QDnuxVHdPpOFQ7e40apUGEN1H7hiC2v+HFui8r3i44Xt4ajzFJmV+ZEGMMn6Jha4gpRnyOciDKNOfNwJCfTP4oB7m+De0Li4tKnk1rJSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728401896; c=relaxed/simple;
	bh=2LPShg8VRJoKRFQsFzYqZlEBS8ZifB8HZIsaGYJrQ30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrlWgMUSbe3B+I3kxCJfp4yj2uo4/g3Tt6gV3fmz6XuZ9u4ACzNK6AdQiXIhBv2l8yuYb8W+zju/oAHX1fChpVBnqAxCDaa6QopQAICpc5qAdbXCMc0zVF1IWWFrMrwyBtgQYya2AZUeaPeFa08n6c/aY9QRMflXGj/JxdRxNnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LFfa8Ucr; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398f62723eso694393e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 08:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728401893; x=1729006693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UoRN5BOpyq09bKiwsRX93G/EHrFOXJ8H3ojopNU3L+8=;
        b=LFfa8UcrktEVkEjQXzbTDdvc9RPxtzA1I/fR/1BOIj3X44StQhCNe6ZN+YVbiJJUaZ
         eJXwaV6nKbOF5XMWI967TMC3Y8WwZUIUye9QtMtwNpldrJ7ptnTzw0KHtbRlAQUT/ffg
         kRqikmjbUS9DfAWl/KxxITfB7BJdFba21bjWrJ6am0x6pqyt2wkSYGwPgKhC/Rlx4er3
         2Ai2/5Z7CNL8zOJkRHzzN5nPGLFFWVCgpRpBbT1sUdrfvotlN2brEyWiogzOyNCnM6zK
         dUaWxc6SM8kZTyFxAf3lAdPIturGBtj5WjGz92BqboumN2JsaQ5O5DjB3nAQ0pG6X8k3
         ecNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728401893; x=1729006693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UoRN5BOpyq09bKiwsRX93G/EHrFOXJ8H3ojopNU3L+8=;
        b=HkWeGZD+Js2dBvnGA6QIBhL4GztLwhD3WMTyKvS6mChcVGRbMZqp5vtRHWaF3BgHo1
         YNgpvL4yriRBfyjYdMHM65IdzPEOI2qD0gJ5Pp3IhypTdZ7UHubG3bmbctrDvx4a/sNq
         VgbxvBJIMqXxxvNlNg3lOC9sj8oVeJ0uOGFCA5Ql7uEmlvC/Fk5WjoreENg/vRde7RUz
         jOLA/wyYz6piTFNgGS8Xm7HO5+/jdf3i4q0ucLZ9Ner7vsr+JsmDk0eZU7mOAFm0tR9A
         Pqp4ArSK2M8EbdYdc/ee+zD/06OBIeqxMyEsTsDHV5B8OEZLLqeZMWsPXHfyDBIGq3tt
         Fijw==
X-Forwarded-Encrypted: i=1; AJvYcCVFCRs/VpmE/+ONlhhjQqpLeSBT1Cf2/9+EBMIJFTe4RBkCBflzqGEjYM0GH9AzWQe1BZOBdnqoy43pr+kg@vger.kernel.org
X-Gm-Message-State: AOJu0YxGTC5J+074ZFxDL89xb8JR37UnuOsWiA/s5uwsEtfyv6qZadjo
	iai1t+a0nNHhPiRPoNidKtGW+4J6KqqI9cdx1g+bxbPEfGmNnHFdnapquAZ/ghA=
X-Google-Smtp-Source: AGHT+IGgVp8SZ4TnRl4aPQ9xaSBD+p9jXHiTZe+JvzacP/2VY4ScsaT+9EaSaVnhiXPLYoecqG7KJg==
X-Received: by 2002:a05:6512:a92:b0:539:8ad0:1e7c with SMTP id 2adb3069b0e04-539ab9f9a5bmr2266654e87.11.1728401892965;
        Tue, 08 Oct 2024 08:38:12 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec85bfsm1252094e87.103.2024.10.08.08.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 08:38:11 -0700 (PDT)
Message-ID: <86d95099-4053-4c3f-a36c-cfb4b63e627d@linaro.org>
Date: Tue, 8 Oct 2024 18:38:09 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
 <20240923072827.3772504-2-vladimir.zapolskiy@linaro.org>
 <datahu33nmsser2p4fb2hyncsujtkwaca377ivwmpc6yj2naut@2sjsbebfm3gf>
 <3f87e855-8779-4df3-8f26-e3d2b611d3e9@linaro.org>
 <313667a6-afcd-44cb-a6f6-0d550e8f68a0@linaro.org>
 <4bf490cb-228d-4f01-a956-cacbafa94e2a@linaro.org>
 <27f39cda-932c-4b79-84d4-be78d266ebdf@linaro.org>
 <c18a92f0-5824-417c-94b2-ed10f4580cfd@linaro.org>
 <bb138ed9-2abe-43ec-80af-2d77b7349b37@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bb138ed9-2abe-43ec-80af-2d77b7349b37@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 10/8/24 16:24, Bryan O'Donoghue wrote:
> On 08/10/2024 13:00, Vladimir Zapolskiy wrote:
>>> Rising or High can both be justified, its really down to how your
>>> interrupt controller latches the state change. However I personally am
>>> fine with the change you've provided because I trust it fixes an error
>>> for you.
>>
>> Please share the change to the driver, which you've used to test
>> high level type of interrupts, shall it be send for upstream inclusion?
>>
>> Such a change has never been a subject of discussion.
> 
> I tried running libcamera "cam" application to capture a data stream
> before and after your change - from memory at least on the sc8280xp and
> I think on 8250 too.

it does not test high level type of CAMSS interrupts, I hope this is closed.

Nobody has ever tested high level type of CAMSS interrupts, and there is no
reason why they are specified in the platform dtsi file, but I repeat myself.

> What I haven't tested is unloading and reloading the kernel module. My
> understanding of your bug report is your change fixes an error on reload.
> 

Since you have access to the hardware, you are always welcome to make a simple
test, which was given in the recent past, but I do accept that quite many
things has to be repeated a few times in a row before people, me included,
grasp them:

https://lore.kernel.org/all/8d3e4ad1-82e3-42ad-80c2-dacd863e8e3e@linaro.org/

% echo -n ac5a000.camss > /sys/bus/platform/drivers/qcom-camss/unbind
% echo -n ac5a000.camss > /sys/bus/platform/drivers/qcom-camss/bind

--
Best wishes,
Vladimir

