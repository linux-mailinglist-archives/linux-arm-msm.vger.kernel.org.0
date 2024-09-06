Return-Path: <linux-arm-msm+bounces-31186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F9596FD84
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 23:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3803C1C23E46
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 21:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D240915957E;
	Fri,  6 Sep 2024 21:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUSSF14Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1A7158559
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 21:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725658984; cv=none; b=YD2NMANqLl9GjOnQqy3YdpkrCUNpqOUdAKkyZ/w9Oir7e7n6gbuz9r7iaMhkn/81YcLg3/OEqWONnMlSg57yK+0Hl+sXlk9P2IboM+bNEQu2zMqpS0ATONmznlR8zBGN6wp0XfZC/CS+4y3cJWJU8/RW8p7LqfcL7o8iQVtYMTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725658984; c=relaxed/simple;
	bh=VuX4Jn656SyN3lFhlYF+3sJWBSxZXV1d8YF9Qq7gn+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkOZ1sn6LWVXJHOBIY4cg6dKyXsMB9dzb8wWm2PvNwXeu9ceVE8GRekrOa+RrD+1c9e3JThi7CH16xHjBjWMH9FEf/C99DsDuWxHo049nIcRSeL8J4dkGgFRGq494wcpOiiIsOBro7cQa6+sBYi+t5AftaX5E7xlPwU7Ogml4pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUSSF14Q; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5356a0a56f4so382499e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 14:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725658981; x=1726263781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QMJVvz0JpBRvUB5FSNKq4yW1CoRz1HX38oGPUb4Dv+4=;
        b=bUSSF14QtEcolpbcFn7m+kNaM7cbgdqChLWVJL2WpLCebj0d0nJQH/vxgIcKpotPgZ
         qIYbcnPec1PWBOreNnLPZAtEOu4yPTFzHg3Y1FdwF0Xo5lKM8t4EcDsuJJXd6/xO8W+I
         phujWRFzzdud0ZPFsZoZATsqCFLzoV4LhbLVh6/YlZOkuFGcfP0Y0KDEgM4DlI+Gdtm8
         LoehIp0Ty8gg5+jw5Cx3U9mWe55LEJYLGaBnZapYWKXHMEbUGm/fT/YTEaJ0lWzTvLEI
         xfwhidB1oCJg71lfb3YxBg1oqQsoxcLHORtz1jX6N/gC+PYqfICCRUKwRiI4B67cd9Uz
         YjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725658981; x=1726263781;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMJVvz0JpBRvUB5FSNKq4yW1CoRz1HX38oGPUb4Dv+4=;
        b=YkqbpAzC7trqN5rt4IGvCKh6dbmomqq4CB8sAdTNJ+x859AsQDlyMniyVby1t38xYN
         DsJ2zmIQsyZoxgL2da8HUvfhvc+yOBMyBmhcEbPFdc8SGwHbDDoBN3DHPZwsZ5S+rlGY
         IJ3L+pIJpMdRVL0rLuflUpma4rsIWrWktJplHkq8iAEhBqfI6daQXzSFh/4oFmW2K2kq
         e3ZL4qjnr9ZmHWVfmrfAs495ApurWeI4WDOgnbSEzy/rqlrZiKXqBvbvcQ+/J2FwkIMe
         MBDiIwkCXkS3rhS3aQ6dCMAu+bDLY19u/F1qyMxqL3NlIzogbsYwPqThr3GAp7ZogmjT
         8e5g==
X-Forwarded-Encrypted: i=1; AJvYcCV5mgbzZpni8DZ627K3Yk1KQbgX8aYDhHfqpwnb/VxrJPlA0bK5MHjdtw4LOvI+VT9qgHEsISO+QiOWbw7f@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr57MVqszwALgapuwdOBD9bdlMOSpZHYtX0hrY3E+zdhR2txKQ
	17rD8kOG7P1Ignp4XCqPYo9V6r8yoaPGFF251kPntiZz5YwX61LMkv8/21o3eI8=
X-Google-Smtp-Source: AGHT+IE/D+5ba+1hDZr0V2IYH3UjMXEOuRVLlJRqu+mfaEn6EiITN40Eds9AruP0dsVxsMAjPuEB/w==
X-Received: by 2002:a05:6512:3b24:b0:535:3dfb:a51a with SMTP id 2adb3069b0e04-536587b818emr1498588e87.5.1725658981064;
        Fri, 06 Sep 2024 14:43:01 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53655aa72adsm384248e87.304.2024.09.06.14.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 14:43:00 -0700 (PDT)
Message-ID: <8d3e4ad1-82e3-42ad-80c2-dacd863e8e3e@linaro.org>
Date: Sat, 7 Sep 2024 00:42:59 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sc8280xp: Fix interrupt type of
 camss interrupts
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
 <20240905164142.3475873-5-vladimir.zapolskiy@linaro.org>
 <ZtsSTsSsOas0hVNg@hovoldconsulting.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ZtsSTsSsOas0hVNg@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johan,

On 9/6/24 17:31, Johan Hovold wrote:
> On Thu, Sep 05, 2024 at 07:41:40PM +0300, Vladimir Zapolskiy wrote:
>> The expected type of all CAMSS interrupts is edge rising, fix it in
>> the CAMSS device tree node for sc8280xp platform.
>>
>> Fixes: 5994dd60753e ("arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> Camera still works on the X13s. Didn't try to reproduce the probe
> deferral issue.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

thank you for testing!

One of the simplest ways to reproduce the fixed problem would be to
unbind/bind the camss device:

% echo -n ac5a000.camss > /sys/bus/platform/drivers/qcom-camss/unbind
% echo -n ac5a000.camss > /sys/bus/platform/drivers/qcom-camss/bind

I don't have access to the X13s, but I believe that it should display the issue.

--
Best wishes,
Vladimir

