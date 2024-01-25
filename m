Return-Path: <linux-arm-msm+bounces-8275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC4F83C82E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 17:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 353EAB22ABA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 16:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4389512FF7B;
	Thu, 25 Jan 2024 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M+kSoDQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8707B7CF13
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 16:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706200573; cv=none; b=GWUegRTN4/T+mPqJ26Hsfq6IFd+snAOVDLMXCujp/3hRWi+MnW7Pxyvia8gvfWGodqclVXBfYZBxAP9GdVdZ3Bdv7vm5VfOPjcg7418t87pgXbRi75GfcLP7doeVfV3HpJa+N8nMrlplQ3LZCrYwuyAY2SpoJz0zvXe+3PuqvAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706200573; c=relaxed/simple;
	bh=lt40wahOJSZn/bRu/spTVg3+z5XWb676wGctXtgvtfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kiCXntxBv0N98y39PO7vj1dAvhZpY/vS0QY2jpaRMMft2TlZtHCnjMZ5pg/524LiJ55+TjUkLue9TR29XQX1proJfFJxabyba8a3MT3uOKpAwBdOXeojhMqUGyBORMN/xrntO9GjZefIgVxVTVqLAtdOq5nuLUDidUCq3lxMKjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M+kSoDQ2; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5102188d2aeso482077e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 08:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706200569; x=1706805369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOhc9njMffkxNYdD1egZdDRcjEt1wn9p6obVt9P775E=;
        b=M+kSoDQ282YgxrHH4Vz1Qd+BmfDqAAf05avIFKL8CF+oE7vLHFKSde+NEuV7Cz126U
         HsWqWTd7aj0H/mfQKbMaGyglxzv2a7qSsjxYkvflNZR9NHsS64Zgz7sIOF8wRvOty0vR
         d84i056q3+ieFZDTcf4wFdqwlIPLgOQ9Y2B0xdns85bd4vTsHLaMf5GznNjhHbmg9D/p
         gZXCJKUh6CzAXPWVQlomHv/9E2q3k6gSIuQDGesvCZihX3GvXfXf/+SxeV0VeJQv4jWV
         dDNoIH5Or2sEcAbqUpAk8yrIHRZ6H+IZWj4tRU0PIqOn5zrlrRj4brJJ4OshvYr1m8JW
         AMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706200569; x=1706805369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOhc9njMffkxNYdD1egZdDRcjEt1wn9p6obVt9P775E=;
        b=FKAnyhq0vZzf5C5IBphgzmO+7XlQQEotajjYfrkHrw391clj7Yer+yR3L+sCUcmTtI
         7JpJH5ZhRQMwqBXFmyHUOTu1OUp0djmZA0/HOkmcGM4gZLs8yKOYVqOvY+g8J/KFdGUm
         FwXgw4+AcvDQUXu9BDyXqfRzRzkHOL5frX/eqldAoo2QX/Skrn8iYyDYvkBgrCgyx9KI
         5whOd2STnuPjj1yHKtqs/JP9bZOWIqtS7xpSOaVOSUjVygcJn9urCp7ETw+ayoV3HY0o
         NIGSz9414YrYdgOqopk30ebWNe18DRjfkgy4RbV6l9ZwC+bP+1zl6DaW8x8yZ7GFmjCo
         7Law==
X-Gm-Message-State: AOJu0Yw7ncJbH6ngUwGWOeQhyG9NodrU9rPCW97VHLCjD13Je72HxSqm
	pIfFInr7ejqr+3y62Scn/bMCMOVlrhTO8E+jiCr5USlqzrtjdzsG2PxZ8LtI5Ts=
X-Google-Smtp-Source: AGHT+IFMO+xoeC65I4slZOzO2IxFMLHMXEpO8c2Ds1GdTTlBycdyA02BYh1cW1xcPHtk0iX3z7de2g==
X-Received: by 2002:a05:6512:ba5:b0:510:135c:c060 with SMTP id b37-20020a0565120ba500b00510135cc060mr38059lfv.76.1706200569551;
        Thu, 25 Jan 2024 08:36:09 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id b30-20020a056512025e00b0050e7f5cffa6sm2904066lfo.273.2024.01.25.08.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 08:36:09 -0800 (PST)
Message-ID: <0ba94f0f-3df5-4eaf-a88c-c63aebff4232@linaro.org>
Date: Thu, 25 Jan 2024 17:36:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] phy: qcom: edp: Add support for DT phy mode
 configuration
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20231219-x1e80100-phy-edp-compatible-refactor-v1-0-f9e77752953d@linaro.org>
 <CAA8EJpr8rKMBzcm-=HGu7-C5hPkNMrnG1cA78O00UjgJVT7p6Q@mail.gmail.com>
 <6179e3c7-f399-4b0f-abb0-aaf5e549d8d9@linaro.org>
 <ZaUASV+0gc/Bufmw@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZaUASV+0gc/Bufmw@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/15/24 10:52, Abel Vesa wrote:
> On 24-01-03 14:42:49, Konrad Dybcio wrote:
>> On 21.12.2023 17:27, Dmitry Baryshkov wrote:
>>> On Tue, 19 Dec 2023 at 22:55, Abel Vesa <abel.vesa@linaro.org> wrote:
>>>>
>>>> Until now, all platform that supported both eDP and DP had different
>>>> compatibles for each mode. Using different compatibles for basically
>>>> the same IP block but for a different configuration is bad way all
>>>> around. There is a new compute platform from Qualcomm that supports
>>>> both eDP and DP with the same PHY. So instead of following the old
>>>> method, we should allow the mode to be configured from devicetree.
>>>>
>>>> There has been an off-list discussion on what would be the right way
>>>> to pass on the PHY mode information to the driver and it has been
>>>> concluded that phy-cells is the way to go. This means that basically
>>>> the controller will pass another value (that is, the PHY type) to
>>>> its 'phys' DT property.
>>>>
>>>> For this, we need both the bindings value and the PHY mode value to be
>>>> added as well.
>>>>
>>>> The controller part will follow shortly. But for now, lets see where
>>>> this is going.
>>>>
>>>> There has been another attempt at this here:
>>>> https://lore.kernel.org/all/20231122-phy-qualcomm-edp-x1e80100-v3-3-576fc4e9559d@linaro.org/
>>>>
>>>> Compared to that version, this one uses the phy-cells method and drops
>>>> the X1E80100 support. The X1E80100 support will be a separate patchset.
>>>
>>> After several back and forth discussions, I think that this approach
>>> is not correct and not that easy to extend. Instead I'd like to
>>> suggest adding a property to the DP controller, which enables eDP
>>> behaviour (and thus makes DP driver call phy_set_mode()). Something
>>> like this:
>>> dp: displayport-controller@ae0000 {
>>>      compatible = "qcom,sm8000-dp";
>>>      /* reg, interrupts, etc */
>>>     edp-interface;
>>>     /* or simpler */
>>>     is-edp;
>>> };
>>>
>>> What do you think?
>>
>> Please excuse my alzheimer, but why did we not go with phy-type after
>> the last discussion?
> 
> phy-type would be a property of the phy. That way we would need pass
> the mode to the controller. So it was concluded that passing that
> information from the controller via phy_set_mode is more straightforward.

Eeh, reluctantly, I'm gonna say yes. It's not the prettiest solution,
but none of the ones I can think of seem much better.

Konrad

