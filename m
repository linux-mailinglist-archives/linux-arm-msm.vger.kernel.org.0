Return-Path: <linux-arm-msm+bounces-24505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FE391AB9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 17:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8829728724C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 15:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69651991A5;
	Thu, 27 Jun 2024 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CCmXA9At"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2051990BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 15:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719502829; cv=none; b=XCZZrbKSQQRurhzW7REOf5LuAZhVi7vX3ZTKfUYN7/lZmwcTsk/OaICl1gZMafr2F7Zv//ZxnjcauRfgceL65akXawSSIM9gjWDwUTzUf3jGyeSlqbt7H/pldXju0tsZPC4Vzgf9dTMvxELt2OlEykzTN0B5f/Lg7fy/Q9NOT0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719502829; c=relaxed/simple;
	bh=lHbeknsk/AtZkJcJkKNcSrP1o/ibCob0V2JnFNWEmR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNp8TeJIJQMzRwq3gb71SrQd2HL+9mKS/kThoz1pz2rZhTm2qF5jxlUg5BlM1WVEaA2KL9A9QGtBb22oJ5xuW8d7a+5F7P5u2AIm5PD/KiehXfMRzzEZEUZZJRpt7DuZYrr8T8ZGb4R4fxXVWOjkQlkvtIUObALyZfVKQpLM8W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CCmXA9At; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-366edce6493so3315989f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 08:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719502827; x=1720107627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M//oCRkOjcE/cm0/TJO4zvrkYG5iR1NNF7GP7xwS6pI=;
        b=CCmXA9AtI6dF2sPgJv3LCaLKpbCsUlEcaCAWhJoyT5++R3xqPKnO2NhCENfG+Ur2kD
         vb8mRqrWixHtEneVC5ATFtbivilRc7BuRitCUC5GX/CGxHHGjb4Tn1XgAvl7hAEjZeBh
         m+5QtosDAxhzbHQRyvGeCBIi9sIA3nGXLbGkpXeZ/oD5PBqky99rQa4Dvx40bUpUivgB
         TLh/jX075Kh0DWEPwXhyVD7xEnPVTwaxRS1ZtbIxanYKGP7MnyfZ9cgmCwYOSu3c1en4
         amkYRiLqqNwYEtEzRQYzuUC87KBzIU/Ie4RS8ypWxcDkiGmciph9EMkMzPTPJvZW/aXg
         y/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719502827; x=1720107627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M//oCRkOjcE/cm0/TJO4zvrkYG5iR1NNF7GP7xwS6pI=;
        b=E1Nt8txI29Suym+nxHNBNopmNdrMFFQtR3ayKNj8oayszS0EfKWvVp8cZlIH48fddm
         JVNj+bLZK+EcFhv2X45L/8VSs/b7OIC9GjHFbVcTh9NovW5QjK31CO6PjgDwH+zE2iQ/
         nF96AlbdoQH8sP4Q+kESXVHgywatgnt7MpWzNEX9b/0J8M9v5KcCEWUWpLEGaT6ehj8w
         z7qh0j2LxUIk0T1YcmlyN/zOsyqrD8KX6EyocNSIihTmc17uklw+F4PVS5kcaUicgMkM
         nLzo53PvS01yMFXCZ0yonWKPmwoWj/d+cEnp1mA5JpsS6zkyfsKT+UZujioLAJalLQLg
         69TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQmGqOOGK9WZ7k2Gqr2YYXYyrKyKhzQ68Q1RJDppEMvOYDzubS2bYiuI5Sc+dUYnieAH+0hpIHR+cxmZcAYQWhh4jW8bbGujaDVNsCNA==
X-Gm-Message-State: AOJu0Yy5bF0+RjfI30y4uCAepvzKTDkkM5okLqAkLLfznEeFlobPMNt3
	/nIzoXOINb/T6jArrQHYh2VX4tUBOeeZrC85u7EZ2YJix1MR9XYbVfi3//A5nGI=
X-Google-Smtp-Source: AGHT+IF2Wv34A+wK39TJbi5KABfsyjk15f088Qkbe7kjp7UKxS7jYKRmHLxGe+TCukAeElAkjB3rHA==
X-Received: by 2002:a5d:5f90:0:b0:35f:fb4:fc7d with SMTP id ffacd0b85a97d-366fb8dd6e1mr8917504f8f.31.1719502826657;
        Thu, 27 Jun 2024 08:40:26 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674357c207sm2253742f8f.1.2024.06.27.08.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 08:40:26 -0700 (PDT)
Message-ID: <7ea5890e-5c74-447c-903c-9d3e9aabb7e4@linaro.org>
Date: Thu, 27 Jun 2024 16:40:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 1/5] dt-bindings: media: camss: Add
 qcom,sc7180-camss
To: george chan <gchan9527@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-1-89ece6471431@gmail.com>
 <c33dde93-2c3a-4a00-93ee-e4de303c9057@kernel.org>
 <CADgMGSvN=uAW7z1dpETGVRewzDG=K2MAtzOkhK7xAcskU_oeZg@mail.gmail.com>
 <0a35f0bd-ceec-487f-b9fd-ae9698b74048@kernel.org>
 <CADgMGSt9Hu5Ciq=ndMTaVK23Y_ixTVtTuSfy4hJkJooFH2uv9Q@mail.gmail.com>
 <CADgMGSv+x2Z9FsWTHW0auttvpdfNDnOPxiJhXnUaW3yQczN_Ag@mail.gmail.com>
 <a7306019-9f19-4619-875f-e6b71add5607@kernel.org>
 <CADgMGStvxkaj_LxXLuwEUtm5dPT-MCr6aKp_DKZngHsRPTjmng@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CADgMGStvxkaj_LxXLuwEUtm5dPT-MCr6aKp_DKZngHsRPTjmng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/06/2024 10:04, george chan wrote:
> On Wed, Jun 26, 2024 at 4:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 26/06/2024 10:38, george chan wrote:
>>> On Wed, Jun 26, 2024 at 4:17 PM george chan <gchan9527@gmail.com> wrote:
>>>>
>>>> On Wed, Jun 26, 2024 at 3:15 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>> Keep the list in "required:" in the same order as the list in "properties:".
>>>>
>>>> ok gotcha
>>> btw, i checked  "required:" and "properties:" are aligned, both of
>>
>> No, they are not.
>>
>> Which is the first entry in "properties"?
>>
>> Which is the first entry in "required"?
>>
>> Please stop wasting reviewers time by disagreeing on every little piece
>> of this. The feedback was quite clear but somehow you do not read it and
>> respond with some inaccurate statements.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Then my apology. I might take a break here. Appreciated if some
> developer is willing to take over it too.

George are you resending this with Krzysztof's comments addressed ?

I'm trying to figure out what we are targeting for merge.

---
bod

