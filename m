Return-Path: <linux-arm-msm+bounces-25409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE01929386
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 14:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D9401C20FC2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 12:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAD78174E;
	Sat,  6 Jul 2024 12:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IIbfvqXf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCD87D3FB
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jul 2024 12:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720268745; cv=none; b=e4Z3YNvpKjzaEzLaTQkNLsZeGdrfnfpR5GjT2Md5EyQ0hoJDwrrObb981cPGUqao3t6V4LnU09xVQK2yBykzgOqOusZBbpUJrAPW81qJkMxOivDmRMlqEujFG1/Mdqbky5zfuja4zRuk591a5GiXPS6PG4qSCh+fQfXWYqRehOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720268745; c=relaxed/simple;
	bh=DFZp1w3U1zLZ9mYRVJJhPbbkzweHlhuPmDJD27v2LZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZo0tuGuWtvUHovNjdgxJD5uqMz0pW2rdEhWl7uExyS8AEnfMJ4dciolEFSWXurRWsJlzaeu/Gai6bSH0aStRHOEgqi+xOV7IG8F3rWBX8CzxZcu7Jfg1QZ0ayhbgphOp0r328DS5c6GvA5WDS9fmWyhOt5IYHQZXMKzk6fdYQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IIbfvqXf; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a77e5929033so32883166b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jul 2024 05:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720268742; x=1720873542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GzVcGfV+V/qu8k2Xj2lgZCFxGBSRmb7rl1SXjaVtCD8=;
        b=IIbfvqXfUlPCVyHb+vb3Lrwh1pgXHI0EMD5FC4NXGiT4wrej0cTo9GAGYsBNNXI2Ax
         EVIyxQ4O5Z+cDJ3tbbMO8cgD6dLNepBr/fub21ZybbJuGEXYyXIj6xmsJuef0Akxq1LX
         MLhH1yGlD+HBZT1BImApEO+N5UeurOz8C97HzQ9gRqG66/N1jXXIyXHnJWkIn+ow/xrx
         iobHWe6RSHRNHZ9IhJHsnoiDlHuNTu4XRzN5vLvNj+zQaKNkj1q6e+W5hiVatKRGGTxV
         R1P/vITlryhwe0SquRC0Fmg8D6mCs6OVt0D0K0z1+HfP7kXjtVN+txb01zY4bqZlA8vI
         sOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720268742; x=1720873542;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzVcGfV+V/qu8k2Xj2lgZCFxGBSRmb7rl1SXjaVtCD8=;
        b=ozQiVx+HYvrwAiB5EODI28drClitPnTq6u//yCI1ZqulC45NwShR1Uy3mr5mYgnoS7
         ANvAOVt/ZbbBmf6Oieke5qo4ah4lT1AU0NL7nAFrV4XHVdyMc05i697pi/E/VLDu/d9C
         SLtZVMBylZPtsof5um3uRnABQ279hP4OwH2alxjkp/+RiMMi2VKoSeSw11+sRlW9ZlJP
         V6hY1fkzzsBEgrRHxxqzYMbRVySWF5RmcxNdRLWY6GgPXozjTblMQiabvFKQ2oF4rvQA
         gdx39Ct5CoXrCI37SjZvSeeBgQ6uGLdiA0hrav6oHIhB6jMzNdvtp3nzZ+j20BlamS+f
         CqTA==
X-Forwarded-Encrypted: i=1; AJvYcCURCO9pbxbN6Yn0EDoOEK46SxPLKIgBYKxZ09vWy8CLCQ6FKpV+304iSeYkLPwdPHlpJI/7w+YAab4hX1O6GOZaFWT7uZqoygQcPdphww==
X-Gm-Message-State: AOJu0YzU/uZxpIOVe7GbZoB+Sg8eH7BOKP37XjgsjxwY7yT05tsfzAiU
	4UkJIF7PzMvliwLOX4EVBuGB2Z0bi/JRfiJt3BeFGrfORilTKT5Lbs6KT39Px1c/sixeMd0eQrD
	9
X-Google-Smtp-Source: AGHT+IFesui1g3h3kXHDuok+m5oigNedPmIZKPMtcnYCh6HpEOC2GIsFKqa6U0WqyvXH/75yivsacA==
X-Received: by 2002:a17:906:6b19:b0:a77:c9cc:f96f with SMTP id a640c23a62f3a-a77c9ccfaaamr310088666b.7.1720268741610;
        Sat, 06 Jul 2024 05:25:41 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77c25b6b47sm186760066b.199.2024.07.06.05.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jul 2024 05:25:40 -0700 (PDT)
Message-ID: <1d8e3779-aebf-4f27-bd54-58007b80192a@linaro.org>
Date: Sat, 6 Jul 2024 14:25:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] clk: qcom: Add support for Display clock Controllers
 on SA8775P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_jkona@quicinc.com, quic_imrashai@quicinc.com
References: <20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com>
 <20240612-sa8775p-mm-clock-controllers-v1-6-db295a846ee7@quicinc.com>
 <37bbd466-742a-4a23-b3f7-97f8da109608@linaro.org>
 <053e047b-7594-48bc-ac1b-2368c0c8f1cc@quicinc.com>
 <8b19c43e-6b13-4b09-9498-ee0b24749d3f@quicinc.com>
 <ucgeexs6impgapot4a55cwzqy5kv374jkyhylojvpmstm7cf42@r4i5toizchn2>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <ucgeexs6impgapot4a55cwzqy5kv374jkyhylojvpmstm7cf42@r4i5toizchn2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.07.2024 5:04 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 03, 2024 at 11:17:01PM GMT, Taniya Das wrote:
>>
>>
>> On 6/21/2024 10:03 AM, Taniya Das wrote:
>>>> Please merge this into one to save on boilerplate, take a look
>>>> at dispcc-sc8280xp.c
>>>>
>>>
>>> I did take a look at the dispcc for SC8280XP before posting the series,
>>> but it kind of looked tricky to add fixes for a particular dispcc.
>>> Debugging could also be difficult in my opinion.
>>> Though I understand that we are trying to optimize by re-using few
>>> common structures/probe but from clocks side they are all redefined.
>>> That was the reason to keep them separate.
>>
>> Konrad, are you good with the proposal to keep the two instance of display
>> clock controllers as separate drivers? As I looking to post
>> the next patch series, please let me know your comments.
> 
> I'd say, continue with the separate drivers.

+1

Konrad

