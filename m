Return-Path: <linux-arm-msm+bounces-23683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 166C7913322
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 13:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C720B2100C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 11:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D096D14D70B;
	Sat, 22 Jun 2024 11:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVGUvsSb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B94714D280
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719054297; cv=none; b=QOT6ufbNlJdhA0QLVEQLfBEBqbOZW5GUK8r83oVGHW57nQklIpl5A2/Kinj7wJj5xNe+Zg/PRMv2wYOJ2NOjdPOpvTPJzrag13fmnn+17enaQ5szzI3vkwvFjlghjqNlhwzjBqamkn3Zt6Ep0tVybTXSmVs/ZVnbNllF0aNdoK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719054297; c=relaxed/simple;
	bh=I+mRjMWttkiuYPW+SQSOHOwhv6K+AN5Sep1rk7YplaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=heZ21t3qlfJRQIsj+nHV8mEUfVTE7575y4VYnoh7U72K2+ZE4tJ7BN0CMGojgpoGgrV3hfxnBf1050im4FRwwXWdciZ3qG3oPUdWar69HiJWOcnXbHQB8+vDv5FeoDjgqzcJ6l29I15QiPV3r6rfzLy6ut8HoihpgJT8gXpV6YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVGUvsSb; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6f11a2d18aso321775866b.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 04:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719054294; x=1719659094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s1I90TQbEvc+2WC5x6IbJlb3i9xpMTyN7+tGPOnmPaU=;
        b=lVGUvsSbLo9wJZiEm+r5BbCFpki7Lc/1sScnfPatwPKdv8UDm7Cqc6GDTrWpHP12bs
         UkIhzMnyXT9y/Y/V2tqRE6Tptrfi5spVsAJ9B59ZzmwtIlZcc7kshPRUczGQyqHSE0TR
         ktnc0olfZzbQ+7hq78/K4M+eGQrspPcyzimgcQRLXwbz5uY5g8zinC1AOOOZvqHJ+Ppq
         Cu8XsH36OtVYba8uxaf/KB3Jb9fbl8J1ujzrDtIJo5sxyexL6ijryeU9xQpEuaqQa5rk
         88wD7McWkdT5PsoROi5MTzQQZhsQxPX1xCjhTP4k5MS+Wo1whTemDhqQfjk+R1cTlSSo
         LpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719054294; x=1719659094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1I90TQbEvc+2WC5x6IbJlb3i9xpMTyN7+tGPOnmPaU=;
        b=PslqjSwZTZUU9Pu+g8OtSUUYSgwSmJZHRc6PCVKVeD38RxjVmOn+4t1e9A3T2vn/oG
         rshimMKwl+syFPSKcq3f8MdXVLQSP6rqFs5zavep6zEa4LcnJT9zFTvHwycr95PSp0xx
         ZCgsHbjeA+qh8cm4BNP2+hbhZz3UvFaVeYxRP7kvRskXmdT4a/A+zFePXeQwOMiFTL/+
         vSP2LZkqC530XUw9w8Egnv31g9laNMkz1qyXyy17YYAq/wTlv+gevV0vJg0y8F/m0nCf
         rYyUHGRwvpkvD2zJlWdMJSH8NnZtE/R3XTtHaz+LY8uRfz/hdF66kzM89sfKPwxQkQlU
         QOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTznwLEGs1HbWFExO4mI6/EzdYsOtjaxo5poO4eSBcPyQudyzYkipAVA97RUGco7v0mGBnPX4Wl7cqtWDw8gfehxE25pW0KdGxAh0t+w==
X-Gm-Message-State: AOJu0Yxt82IBOB5GmYiDMVs2OzIho/f/VL755OEbnYeslbI6nK/ng0Pr
	iWcyqAgu3kZ8y0RQjVoBKwPctFE4SgSdDLX7Mv83JZvGPhSyq+A0uzlgG+ddCso=
X-Google-Smtp-Source: AGHT+IF+s3rXBAyDALz1gMTQaPWO072y2LorckG8YTUHRh9+/61CB1f1hOEfD4Ak00RcFEYxdubRLQ==
X-Received: by 2002:a17:907:1603:b0:a6f:af31:6f5 with SMTP id a640c23a62f3a-a7242c9c10dmr9013466b.22.1719054294256;
        Sat, 22 Jun 2024 04:04:54 -0700 (PDT)
Received: from [192.168.128.35] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560977sm183559566b.183.2024.06.22.04.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 04:04:53 -0700 (PDT)
Message-ID: <abf727db-f338-4295-8d02-18ab0d04697a@linaro.org>
Date: Sat, 22 Jun 2024 13:04:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sa8775p-ride: support both board
 variants
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240619183255.34107-1-brgl@bgdev.pl>
 <4df2a52c-c21e-4da0-9ca0-13f28e81018c@linaro.org>
 <CAMRc=Mf4dZHMyexj1Xaw1dMVw0OT3=1t8OMfpHCB0xGJ9JdvSw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAMRc=Mf4dZHMyexj1Xaw1dMVw0OT3=1t8OMfpHCB0xGJ9JdvSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.06.2024 9:07 AM, Bartosz Golaszewski wrote:
> On Wed, Jun 19, 2024 at 8:50 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 6/19/24 20:32, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Split the current .dts into two: the existing one keeps the name and
>>> supports revision 2 of the board while patch 2 adds a .dts for revision 3.
>>
>> Are both gonna be actively used?
>>
> 
> Yes! This is the reason for the split. I initially wanted to just
> change the PHY in the original .dts but then I learned there are a lot
> of r2 boards in the wild at QCom so we need to support both.

Ok, thanks for confirming

Konrad

