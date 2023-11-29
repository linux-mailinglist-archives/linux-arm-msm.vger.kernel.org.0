Return-Path: <linux-arm-msm+bounces-2477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 514917FD8DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 15:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC368B21444
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 14:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445BC208AB;
	Wed, 29 Nov 2023 14:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FKcaGS6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D4C10CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 06:01:03 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bc743c7f7so614274e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 06:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701266462; x=1701871262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HFdKEVTW61V1xHyYtbiBsO5/c4EsvUDRepVmlWcXtHE=;
        b=FKcaGS6dI4FXUUTe1fF3/tSQTgJ9APHPqyA5hZJYGvufxyp8lzKeraM51NNkPXIY4S
         4TVE+xuz/E+as705ZmTFyk7Z1qQgHBqO2GrA+mp/w+whGDRlHVFqYZ0yY5mS2L18bDkS
         qy1V4Zlpk8x7vlG9vXakEEQ068OktUAFo2Uz2xBVLVsW+UDWzSm9YeyOaiXz6dI+Fw4G
         CDgA/sfCscxF1JbSIPLglVLFEgOu2fOVCabyj93luvUf7JlZ8tu1Rsw/ZTTZr1AyVkTi
         cGac6fx67S36jUFmuvfFNB67JB1uw6vhb5q5sETnWwcYO3GJgh3BVIxrXHLWFCXkbpwV
         T5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701266462; x=1701871262;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HFdKEVTW61V1xHyYtbiBsO5/c4EsvUDRepVmlWcXtHE=;
        b=EA1/wYqT70+WRMXUnt2oJ7xjakDUsh9ydqCaihmHoZjnGg5cJPw73n6x/fbYzbk2Wz
         aARXc49W+EmyniJ/hcezfpc+jA18QO9jmYqOZd8OrXOrpOBiSn1893iSfUVJrbiQG/Kd
         Ae5iVyt9WglT6rjzeM6JRgPODui2r/yUe7fycZ+9nYHAQBpv4jlxb8EhEsrnKm14sINI
         Yftxs8UlLufrD2NAy1+XKrfdcRWKpGcsIKiiBTvxMMbEHT9E7pi+l25j+u/KVWrihNBO
         UGyD8WtvYaNOG5nl/FXD7wUWiSEf0GRCp6VJXlKKet42ZE9cGVDhmWGvLtMembqDNWRo
         tacQ==
X-Gm-Message-State: AOJu0YznxHVrgO8eEJJLxwG0ZDySOKlRob2e/uEHL85dvTLQGZ6yo6Hf
	x1Yc5ITwiKEffVFqCkHTCTDzFQ==
X-Google-Smtp-Source: AGHT+IHviG4Z2hXt1LHxLsvc3bZ7a1BErojOSze3hz/kajM1AYS7CCxQR3Bhgrh58eTm6pB20cB+hQ==
X-Received: by 2002:a05:6512:1d1:b0:50b:bd3f:9118 with SMTP id f17-20020a05651201d100b0050bbd3f9118mr2774050lfp.36.1701266461633;
        Wed, 29 Nov 2023 06:01:01 -0800 (PST)
Received: from [192.168.209.173] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id ck7-20020a0564021c0700b0054b1360dd03sm5520697edb.58.2023.11.29.06.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 06:01:01 -0800 (PST)
Message-ID: <2ca148cc-564c-499a-8fdf-487391c9024c@linaro.org>
Date: Wed, 29 Nov 2023 15:00:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/4] Add runtime PM support for videocc on SM8150
Content-Language: en-US
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20231118123944.2202630-1-quic_skakitap@quicinc.com>
 <47925f9e-32aa-4762-a4ec-aa559e18ff12@kernel.org>
 <26b69814-201b-8d07-d844-27e804aa3016@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <26b69814-201b-8d07-d844-27e804aa3016@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.11.2023 17:11, Satya Priya Kakitapalli (Temp) wrote:
> 
> On 11/20/2023 5:18 PM, Konrad Dybcio wrote:
>> On 18.11.2023 13:39, Satya Priya Kakitapalli wrote:
>>> Add runtime support for videocc on SM8150 and update the resets
>>> and video_pll0_config configuration.
>>>
>>> Satya Priya Kakitapalli (4):
>>>    dt-bindings: clock: Update the videocc resets for sm8150
>>>    clk: qcom: videocc-sm8150: Update the videocc resets
>>>    clk: qcom: videocc-sm8150: Add missing PLL config properties
>>>    clk: qcom: videocc-sm8150: Add runtime PM support
>> Hi, it's good practive to include a link to the previous revision
>> and a summary of changes.
>>
>> The b4 tool [1] does that for you, please consider using it.
> 
> 
> Hi, I have installed b4 and followed all the steps, but it doesn't populate my cover letter with change log and previous series link, do i need to use some option for that?
You probably did something like this:

b4 prep -n 8150vidcc --from-thread 26b69814-201b-8d07-d844-27e804aa3016@quicinc.com

Then if you do:

b4 prep --edit-cover

you'll see a note like

EDITME: Imported from f26b69814-201b-8d07-d844-27e804aa3016@quicinc.com
        Please review before sending.

so you need to do it manually.


Generally, when the series has been sent at least once with b4 already,
you'll notice that `b4 send` appends something like this to the cover
letter:

Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20230830-topic-refgenphy-v1-0-892db196a1c0@linaro.org


This should be only necessary to do by hand once, since as mentioned it's
the first time b4 sees this series


Konrad

