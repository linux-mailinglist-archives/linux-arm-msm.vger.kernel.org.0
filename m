Return-Path: <linux-arm-msm+bounces-33409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE5B992FDD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29BF1B227CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F8C1D79B7;
	Mon,  7 Oct 2024 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="yEQmbG4C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0F415D5A1
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728312604; cv=none; b=RUaOHMycKOahbqolMrAgTx+aYDCrojRz1Q8UlCAjcei7TXk4gOFqsSVYZYdr4xYAaRCqTgydYEEuIvZeiZHqghW6oUdlaU/cvwmg+zEl5c+w12o3xz2ggTA67QMfelpTYGL1hmcpLJKfh+s7oImPOzAeaRzv2tiMai0kYO0zWlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728312604; c=relaxed/simple;
	bh=qkGG/OKn4iUpw5Z2371kFS/L/UqvVa71JTiyYLX+/tI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRI+T52HjRX/B3CLdtdUpV4JiYxxWegJtMrxZlkVdEPicAWTbT/Rxsy6l6yr8n3RiPDBjGf3Qj8BEGlJcX7FRNeXWT8lSSJdUjpfej6t6DYL6PrWvlVXSRRZkJzXDWdNuyeIms2ylOvd/vezshXZ6zVEzZUXEn8guovFaRldZsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=yEQmbG4C; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso41613305e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 07:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1728312601; x=1728917401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1NyQRssNX2H+PouQCuQZFpVJ+OYp8Hk88kmYRkHCtA4=;
        b=yEQmbG4CmuvxsI+p8xxHdh3YBzJ4rM915A0hxd+av9HZkCEaPQM/TWZuYFG8rrlcPI
         8sbTZo88+SDFgPLfXPqRfyhGG7eVPfj+f/VbBRcvN5FHRJ6RF7VXBBWa/bbZpVO8WSUU
         rnaW8V60RaK4MaW+8np1mFCA4Sn/pxvRROOW/rukjXog5qOwkd6eLG5QT4L/mqiRkiKZ
         vdBpE2cIKl2+v9GVaR/2xIlLzLSTxn55qKQdRIWcydoeWLoDfrebJXG/QpH8PhjgIkTf
         WMUAAWY8qzb6PnVD7oEQ247yL0ZvWarXFnmiKsbzMtyCVz361FBkR9kXtyd/rI+1qPYO
         0eSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728312601; x=1728917401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1NyQRssNX2H+PouQCuQZFpVJ+OYp8Hk88kmYRkHCtA4=;
        b=aZLGETlsbpW6gG2bOUe8PY1yAOzFv9z+/7QRl+HH0NXZgL64x1gRKyEboSHwbv/vcf
         sTd+ORn+0FcYc/gzP9AoG2Q8XGmhgWinHG5T3a1/IO9e3SqXTKfHMGamR/JMrOg0pCmO
         IQ31Uio1HXQ378LQMnkoEcihi9z3FWzh2QeRxZ+SOYRmwwQ+EAlzKXgRbIDaYsA15aLv
         vtqBpszXRpqRjOQ/FPqYaKli+U2bLkzUxOKW87NClQZN7gWALZWH6TBxw7ypa3UkPWpo
         nnYfnh4ufyeE1TIId5XoW4rRKZAOdC58eeGogqhCe6oZEahSdTVuCkQkfsNA/ksl+66K
         +fsw==
X-Forwarded-Encrypted: i=1; AJvYcCVoUhFjZTbfYdHn+CbB57b+TcedZlftqzzqmx7x8aaJKLkaKMAk0F7EDuYEFgdI6TNZ6QYp3ugYgP/g1DtL@vger.kernel.org
X-Gm-Message-State: AOJu0YzNuP0LISZI+77BMjFjdpPnspuEDV1roHs+vRCj7rnbY8GNrTaX
	khIAj1tn9hoqmP8V5S48y6bp/E+oTu6qMSPTxlUYHn5YdO3JeNoNtMhOB8K+rOg=
X-Google-Smtp-Source: AGHT+IEME010xJ6NSIv9wR7Z/93/BFWW/x3u0WJ5DnL0ywdklukEZv0FJeErGQxlLa2wTRRInxBsmA==
X-Received: by 2002:a05:600c:3107:b0:426:6710:223c with SMTP id 5b1f17b1804b1-42f85ab64b4mr98834965e9.9.1728312601201;
        Mon, 07 Oct 2024 07:50:01 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1698e885sm5877536f8f.114.2024.10.07.07.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 07:50:01 -0700 (PDT)
Message-ID: <c48b54d2-6903-490e-a80f-ce3e04354470@freebox.fr>
Date: Mon, 7 Oct 2024 16:50:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Basic support for TI TDP158
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
 <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
 <40ffacc2-fa04-4e6d-b817-c547aa75a21c@freebox.fr>
 <CAA8EJpqYp8uBNVdNSAmSbeev=itxNKS_scb2xAwe63aS5bdhkg@mail.gmail.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <CAA8EJpqYp8uBNVdNSAmSbeev=itxNKS_scb2xAwe63aS5bdhkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/10/2024 16:42, Dmitry Baryshkov wrote:

> On Mon, 7 Oct 2024 at 16:33, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>>
>> On 03/09/2024 14:40, Robert Foss wrote:
>>
>>> On Mon, 12 Aug 2024 16:51:00 +0200, Marc Gonzalez wrote:
>>>
>>>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>>>>
>>>> Like the TFP410, the TDP158 can be set up in 2 different ways:
>>>> 1) hard-coding its configuration settings using pin-strapping resistors
>>>> 2) placing it on an I2C bus, and defer set-up until run-time
>>>>
>>>> The mode is selected by pin 8 = I2C_EN
>>>> I2C_EN = 1 ==> I2C Control Mode
>>>> I2C_EN = 0 ==> Pin Strap Mode
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/2] dt-bindings: display: bridge: add TI TDP158
>>>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/887665792b99
>>> [2/2] drm/bridge: add support for TI TDP158
>>>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a15710027afb
>>
>> Hello Robert,
>>
>> I expected this series to be included in v6.12-rc1, since you applied it
>> before the v6.12 merge window opened. Did I misunderstand the process?
> 
> drm-misc-next stops propagating new changes to drm-next one or two
> weeks before the release.

Oh right, the "stop at rc6" rule of thumb that Krzysztof mentioned.

Regards


