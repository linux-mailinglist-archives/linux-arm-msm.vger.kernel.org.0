Return-Path: <linux-arm-msm+bounces-35421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 592DE9AA2A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04EBB1F2345D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 13:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A673E19C543;
	Tue, 22 Oct 2024 13:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KILpdxhx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CB81E495;
	Tue, 22 Oct 2024 13:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729602123; cv=none; b=CA3skcOkwK1j++I0x4epU/Vf0IzfdX7zlZ7uWFdM88ET737wswk6/N78tWRK6djSIVxBu1RoQGqZ7aw18zXyStRaBcNZ/I6n9hyd3X92E+VqUnH/HwNZaqMEG2wp1DzM16p7LVPoeLX7DqSbQl8RpPpVE+x3CQcCUeZt2TruwcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729602123; c=relaxed/simple;
	bh=RM1Iagv7/+ihEj/00nA7D03DRcyAyMZcoLX4kHiEl0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRpudAsZkZvmqhH2X/wIv4iulcqR/JJzok3KCa/fJtF+6Rp+19bNAc4Ng0uWzHvgrDGa9Q0nvHiHlwD9LNN2MNxa9mzF3qyMnuI2iI4C6y/52+lQCaVTdZpWzx1pHij0xkYe9gkj+MPw8uC7Yhw4MEKxiKTJHv+JTTilL9j7cw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KILpdxhx; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a156513a1so776470866b.0;
        Tue, 22 Oct 2024 06:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729602120; x=1730206920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pWtU539HclzlpXbphjo1lka7lQnsT/2C0cPK3L1Ws4=;
        b=KILpdxhxsaSGlkXpdXKKrMRGqhcdXAwkbs61CCVUPLx72zN7AQLg2RzRKh+adrEmCA
         RnTDrLSp08qGEICbFiCa5/xAqN+NlDAlWgxAymYsaSfa5IxEP8Hse5PiDWRUR0DCLt1o
         spQ37iHnfWUbeFcAcDgjlkJvxVwTvRGSnmw9+Y9uvnRYluVtGhETEFj2agcGbAcnozqe
         GsBzpw0B0xx5hzY4sjlBKsoQ+og3wkksBhWULm/QHK7G6HIEHRox97CSm9ldk8UuGweg
         0NA4ZpX/S7mjjoz8ZM+BhXTag/g3vzrdkbBZsiemkUL6W1L2Jp83UPC6oLEpX+6aLUfX
         9u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729602120; x=1730206920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6pWtU539HclzlpXbphjo1lka7lQnsT/2C0cPK3L1Ws4=;
        b=r1tWHfjXRlz8S0phff7DS5qeYWULQaeax15FxsG+gkJ3U+Fa7my7LHrUZ2anRlTnYP
         Al081TZe+NGBEVc7O1JxSHcfmyw+g4Veq98jCycf+x51F+i1kBZQIT470c8d3t9iJvXg
         /Nl+j9WNXPOx4FosoOi9ksv2LZHxWVKezzupRUtB+Gwykkot8fVgYe60Afe9egs2OroY
         YZ1uma4F40cggeM3yiiYXFpCaXCXdqkzIL8ZuBl9kM3oqu4kZAH2b9HkeD9MAZCk293/
         LrbQUi3rGnyzfYFGDDIJISveeOu3Vn38JSVPt54zSXLcXXaUtS94tYL5zOZarXAqsvSM
         deCg==
X-Forwarded-Encrypted: i=1; AJvYcCUDLoHVVMSUzsVjF/tfOsJnrIDnJQmQ4CWewYss4Zez06PxdYBE1Rg7uVy1sCdltxLoTjIwPP2ma2CG@vger.kernel.org, AJvYcCWZhW73ogUCmQL6NHfgUWmSiy1UZK+oKJwcRrJOWNe/1r4HHk4n8gIOgZ8smRe5sY0qykbvKugb5ul9EgVZ@vger.kernel.org, AJvYcCX6uJ+HpqLlOsE1hbUzXrcBBSYooDVuOoPc9g6p0wNYoxx/Xskhb3gkvCpSOliozLR1AHV4X4XD@vger.kernel.org, AJvYcCXqmioUnkQTN32Qpk2yaNlR9x2D7OW3qMbf5nn/T8EHCzbJtPw+NVW6WqkUeSAJAGCNwonyc+nJmdPWL/9P@vger.kernel.org
X-Gm-Message-State: AOJu0YxyK78g2wE3lbXdb/j8U2aM8isfoQl+mgV2IFH4POx5wjBqPHvn
	vE8zRztBqLO2z+Qeocq49bkcjFB1gDXpBSijoX/XEdFPCvrEUiJX
X-Google-Smtp-Source: AGHT+IHXUyC1ucZ/7ROlomRD6RpENKJHXAb9NYyC6eICFKGRYARGSJ2mzgvjwP3wzwn1DBoCLy827w==
X-Received: by 2002:a17:907:1c24:b0:a9a:55dd:bc23 with SMTP id a640c23a62f3a-a9a6995d035mr1379304066b.8.1729602118125;
        Tue, 22 Oct 2024 06:01:58 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91370e6asm337429366b.126.2024.10.22.06.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 06:01:57 -0700 (PDT)
Message-ID: <4c129bca-017c-4123-b9e8-547881b246c8@gmail.com>
Date: Tue, 22 Oct 2024 15:01:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs404: fix initial rate of GPLL3
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241022-fix-gcc-qcs404-gpll3-v1-1-c4d30d634d19@gmail.com>
 <8ec5512b-a8ea-432c-84aa-f920470c056d@nexus-software.ie>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <8ec5512b-a8ea-432c-84aa-f920470c056d@nexus-software.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bryan,

2024. 10. 22. 11:53 keltezéssel, Bryan O'Donoghue írta:
> On 22/10/2024 10:45, Gabor Juhos wrote:
>> The comment before the config of the GPLL3 PLL says that the
>> PLL should run at 930 MHz. In contrary to this, calculating
>> the frequency from the current configuration values by using
>> 19.2 MHz as input frequency defined in 'qcs404.dtsi', it gives
>> 921.6 MHz:
>>
>>    $ xo=19200000; l=48; alpha=0x0; alpha_hi=0x0
>>    $ echo "$xo * ($((l)) + $(((alpha_hi << 32 | alpha) >> 8)) / 2^32)" | bc -l
>>    921600000.00000000000000000000
>>
>> Set 'alpha_hi' in the configuration to a value used in downstream
>> kernels [1][2] in order to get the correct output rate:
>>
>>    $ xo=19200000; l=48; alpha=0x0; alpha_hi=0x70
>>    $ echo "$xo * ($((l)) + $(((alpha_hi << 32 | alpha) >> 8)) / 2^32)" | bc -l
>>    930000000.00000000000000000000
>>
>> The change is based on static code analysis, compile tested only.
>>
>> [1] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/
>> kernel.lnx.5.4.r56-rel/drivers/clk/qcom/gcc-qcs404.c?ref_type=heads#L335
>> [2} https://git.codelinaro.org/clo/la/kernel/msm-5.15/-/blob/
>> kernel.lnx.5.15.r49-rel/drivers/clk/qcom/gcc-qcs404.c?ref_type=heads#L127
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller driver for
>> QCS404")
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> It should be possible to test / verify this change with debugcc on qcs404
> 
> https://github.com/linux-msm/debugcc/blob/master/qcs404.c

Thank you for the suggestion. Unfortunately, I have no suitable hardware to test
that.

-Gabor

