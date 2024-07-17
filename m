Return-Path: <linux-arm-msm+bounces-26450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E33ED933AFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 12:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11E7A1C214EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 10:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B2F17E8E6;
	Wed, 17 Jul 2024 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="po4X0/RP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132317DA39
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721211190; cv=none; b=FEe/P2mUrTKUx5wD2g1MWVE14oRbOSue/v9q6cqBIw/tI9t27VBlrrXvDU8OJTXi3cy/7KQlLxjnyUE2J3SrvfA+s7LGzPCOJ+bC773v79apFB3rrt4tRZzcFMp4vHcSaianNhJVUFx3mw2kstTi9/O53w/w0glvqZnYVp6a5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721211190; c=relaxed/simple;
	bh=sbQDYx3IqFNIFf+NpVv6jXo2CfZEyQqsXpShIzWzBwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXOdALNMp3G62osNqlLWfQkhOUwz2lLAOy6QoDyo7EPto3zy8aF67a5/L+DQ3TQYErgDesl1GFsZNctJ0ZF6lKCmSomeIb4Pxp24IeGReImNmHTX/KTB12J379hQ7QTFJRGqQbNzyJrthjrFkAM0oz/ih/+HWrRrKE70bF3lD8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=po4X0/RP; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-59f9f59b88cso1896132a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 03:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721211187; x=1721815987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6EuwjtZgTYYxWf9tgyLgCliudozyDttF0JWvGaYQXew=;
        b=po4X0/RPYBCzMrGL3V+Uh5lttLgCljvuRwvF53k9+R6YFhWucvDusvGVkGLpj2TvPx
         auYZKuA6zdC4aOo1CQsg7mYClYwCYSM+XVmDWP9O87Is6+NJQlG8zwXSXxzJPdSV8ApA
         2LKuld7hWUUwP3I+KJ2OPff0Bx2s48Ig+GCdNuU8o3hFizSqYvqdiMG3RAoLRuf9oCQu
         E51L4OAsXGUrkAuZTyVzk4M9nrNIIwCmHNCtE/KKEjNV8U3IgKd8xWd5hBBaxpGsdnPG
         qfGPBdfXjKd+E0J1c7zr3aCNaSJQUqXgVwRC+5uwaEBDUQMp2YHCwsiaS44w5OoodMw3
         uLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721211187; x=1721815987;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EuwjtZgTYYxWf9tgyLgCliudozyDttF0JWvGaYQXew=;
        b=VhrTyOztPgPHKe/3YyX89hjA7rdY5Gj0byb+792v6LX/jUX7UgCVtGsiqylC1D/Vun
         qZ3F2kN6xuRd/uF2+f5Inf21lmQ600OgltUrGLPYf1Ls1rXL0y97qhvAkYHBWFN9c5jd
         e4y+PgtguOMlZEb9BSRupV2hwog8u0ypjbOGLuMxRwSbHt8/RKaeGcqX9i1HbnsaheBh
         KQ6elO0DnYZfkTHkawu5UjVMHk+X3rvKoJEg0abaNlELx5CX/SubD5CYVEqJQeJ4hJmR
         CgZHXPpvXg7mw6QEdiv1xF1ZVZ54HkttEbfLwsYynjmTmUgxyqLoTp4yc9uIh0mWbsYz
         thKg==
X-Forwarded-Encrypted: i=1; AJvYcCUGuwoDoUgbs5ocLgYkIVUP55gD6es2q9T1RhX1e8KQR7+/SL9YkAhud9izv9s0jy/D323FIgL+Q5NLJmLQxwyDhjDp+FvNoaPl7sllmw==
X-Gm-Message-State: AOJu0YzAVUmcF3DICgo3IPABShH8Ni2ZRlYyhwXZzZTsrBFajTkNjeaw
	8GZktTcO0PHgE0wfGTBvWQPZUQscCr7GAZD0tJr2AL6aNHLgueVOxB0h7Q7aFM8=
X-Google-Smtp-Source: AGHT+IHGVigwNWZsXfiJpPBSxOgTAk//9+YS8l68xkjuM4MvQe9ZV1oJcXCgjoPTNlaTVEDxjhHY4Q==
X-Received: by 2002:a50:bb02:0:b0:57c:7486:3f7d with SMTP id 4fb4d7f45d1cf-5a05bdc0ff8mr876522a12.19.1721211186703;
        Wed, 17 Jul 2024 03:13:06 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b255253absm6690218a12.42.2024.07.17.03.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 03:13:06 -0700 (PDT)
Message-ID: <a6407abf-b13d-41db-b1ff-0c70796c8af5@linaro.org>
Date: Wed, 17 Jul 2024 12:13:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>
 <dccttz5b44bl3lwmcaqz6wjx3n4sv3eq4yh6276vzwrtkcvqcw@qxhbo7bylnsg>
 <9ad10d92-d755-4fae-b206-6e8648be6d48@linaro.org>
 <CAA8EJpr9L+AKDhuHfQa=Nco7fvG9vLH3a+gxVhENrhz12b3n=Q@mail.gmail.com>
 <278354ec-532b-48de-8ee1-5477ddb4a285@linaro.org>
 <kxrhhb3vdojbnqfbwks2qmob55fwm3onleood73qfk6esl7g2c@q66kw5am4emc>
 <94e48e19-781e-4de3-a4e6-da8e923a1294@linaro.org>
 <CAA8EJpomVKiVrRxSEJmjvNXLGGKVvcr2wGWtE129eUoUfgYC4g@mail.gmail.com>
 <43d6523e-d6b7-4fda-92bb-a52fcad2fdba@linaro.org>
 <CAA8EJpoCCCAUv8PSDOEFoHhZZoEjCAOBGkhjpmrrYum=ejOvDQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAA8EJpoCCCAUv8PSDOEFoHhZZoEjCAOBGkhjpmrrYum=ejOvDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2024 11:57 AM, Dmitry Baryshkov wrote:
> On Wed, 17 Jul 2024 at 12:53, <neil.armstrong@linaro.org> wrote:
>>
>> On 17/07/2024 11:49, Dmitry Baryshkov wrote:
>>> On Wed, 17 Jul 2024 at 12:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>> On 16.07.2024 6:46 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jul 16, 2024 at 03:46:24PM GMT, neil.armstrong@linaro.org wrote:
>>>>>> On 16/07/2024 15:44, Dmitry Baryshkov wrote:
>>>>>>> On Tue, 16 Jul 2024 at 15:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>>>>>
>>>>>>>> On 16/07/2024 13:20, Dmitry Baryshkov wrote:
>>>>>>>>> On Tue, Jul 16, 2024 at 11:05:22AM GMT, Neil Armstrong wrote:
>>>>>>>>>> Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
>>>>>>>>>> and byte1_div_clk_src, the clock rate should propagate to
>>>>>>>>>> the corresponding _clk_src.
>>>>>>>>>>
>>>>>>>>>> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
>>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>>>> ---
>>>>>>>>>>     drivers/clk/qcom/dispcc-sm8650.c | 2 ++
>>>>>>>>>>     1 file changed, 2 insertions(+)
>>>>>>>>>
>>>>>>>>> This doesn't seem correct, the byte1_div_clk_src is a divisor, so the
>>>>>>>>> rate should not be propagated. Other platforms don't set this flag.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Why not ? the disp_cc_mdss_byte1_clk_src has CLK_SET_RATE_PARENT and a div_table,
>>>>>>>> and we only pass DISP_CC_MDSS_BYTE1_CLK to the dsi controller.
>>>>>>>
>>>>>>> Yes, the driver sets byte_clk with the proper rate, then it sets
>>>>>>> byte_intf_clk, which results in a proper divisor.
>>>>>>> If we have CLK_SET_RATE_PARENT for byte1_div_clk_src, then setting
>>>>>>> byte_intf_clk rate will also result in a rate change for the byte_clk
>>>>>>> rate.
>>>>>>>
>>>>>>> Note, all other platforms don't set that flag for this reason (I think
>>>>>>> I had to remove it during sm8450 development for this reason).
>>>>>>>
>>>>>>
>>>>>> Ack, I think this deserves a comment explaining this, I'll add it.
>>>>>
>>>>> But where to place it? This applies to _all_ dispcc controllers.
>>>>
>>>> Commit message
>>>
>>> It is already committed.
>>>
>>
>> The thing we keep adding new clock drivers based on previous ones that uses
>> specific ops and flags with no documented reasons except in commit messages,
>> but it's often buried into multiple cleanup changes.
>>
>> So at some point we should add simple comments before each special clock
>> explaining what we're doing here, a good example is the clk_regmap_phy_mux_ops,
>> where I had to dig into commit logs and understand why we handle it differently
>> from downstream.
> 
> Yeah, regmap_phy_mux_ops is a nasty one.
> 
> Or the whole story about converting flags from vendor DT to upstream
> driver code.
> 
> Probably it's worth specifying everything somewhere under
> Documentation/. Or in drivers/clk/qcom/common.h  Or a wiki page
> somewhere (though my preference is towards the in-kernel docs).

drivers/clk/qcom/docs.rst.. Half-joking, half not.. there is some hw
docs in Documentation/ but I'm not sure if more than 3 people know
about it.

Konrad
> 

