Return-Path: <linux-arm-msm+bounces-84218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9FCC9EE77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 12:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4F86D3432E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 11:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25002F3C0E;
	Wed,  3 Dec 2025 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rzTUaD/x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B730A2F39DA
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 11:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764762817; cv=none; b=ko+GSxEmzdX+dviuTzNNgL51GE+MfH/YTwIYKamqqr76Nix5gcNP5Vg/CxiGxoXK1qx195zC72Z9R68Lr/i72ma1dfep+kvPY97X8oIjOwQI+rq7DQ4sgbVrbGliNZEvZ7IDRSNUlk0yGa0yiT3HkST95WAN6+ziFqXy3sxD95E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764762817; c=relaxed/simple;
	bh=507B+B9WXoYANTS0ahrX+Qe14RdOpDY2weWI1yop9EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkTMUCE8dRmR3O3PwRukAEj9w9wUfUFyfXmAl54mXsrEBqg1KHHeXQMThCnerdIqZ9M+HIX36IRnMtkB3LuWrvB7dNDuAu1GdF6saK1SJ8evCtgOETbG1fKnwVa42N4IgquyZD9RuVGaqipwN6M1bAKjbkXi3siV2TNNrWDJ6lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rzTUaD/x; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59426dc96f2so553437e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764762814; x=1765367614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLSfduDvIMtxBr/FllCfWDI20xqIyxuL49iYC6vyl1E=;
        b=rzTUaD/xl82gayHcOIOStzde9uoQHYlaj3F0qeQiQJLVNNd5MJTRaaXVJFIDmdiacG
         RTzoY/xy3IHjz1m4A1nkNsjxdq3l+lopqEm8q7k/VUnL9jGGJJFo+T9t7k1RREFVdRga
         DqS2ig+xiV5gAgdjfAgSx6xTU/+5odhQNzWDIg0rRhh30PjNlP37xdLMO8dHOT54CMu0
         Zn3cJFv4THQpwbBQVaEd2XXsLWHn7wMnGSM5HQRJiaU0R1rJ2Etg+vmJiC9zEvtZP683
         p2xLdatpTu7DGK/YA1cvesK13T+L5rgXakDx36X/X8FxayELbObORHYDgEAi8LVL3umy
         +mtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764762814; x=1765367614;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLSfduDvIMtxBr/FllCfWDI20xqIyxuL49iYC6vyl1E=;
        b=KDL8RpHBkh1kONbc6OcZAsV1Fcvs/PG33mXYXTisoP11X+e72AY/ot/SAbieiGbInK
         aubYCbHMJeNYTIefVNE9gvAHL5KEfpLSN0msPiIzaQ+mbyYctQ9I0F8/laMoWbW1h1rV
         fsTnoSlceL5186BUCgBUaOMDCk5Gq3E7zUJgz+N08vo7X8xMo4jFYRMdng64j6Qfg5VA
         EYrXPg8TvUc9vqyTSnDIKjNjKsrFh9K1/bd+OgAUjCPPBA97qpo/ZAiUm6tLiEBCT3db
         ZBDzswO5YViUKZbpWanV3C9DpEn6k59EHNZt2s70zxqtZT5n/al7JmCmq2uSoUk7Omo+
         ah0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFbxNejbm1AAZ0D129Khp8DIa+sYOHwVjQ+GXL06AY0ikVYvAcu8SSjQLjwbdcfNN0Vnsd5e4nyZryS7Zg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfn7HORBwIZe6uBT0AzxN1K/eOafERXWZGoaUziBXQtKPHXkTE
	JJCuA6ypPE0hA4/LTJzD3n0Mkxq3+1N7Ofr0tl6aFEgARdF1xJdhmqkb3iekW/Ch2BI=
X-Gm-Gg: ASbGncuvzx5FzGOXG5PgLLzJw0nlnLGGXlfirV/vkMfjRnRtUJGratY7xJBaUK+Xm2k
	H6HzEXsbSvhV6s5dS2NR5/lx+v9h9ODjTpV8/X7VXMh9hc413sADw3AZttsm5B0sGyNrMWbjDRB
	beqx2OLXQs8jSPsgx2d2XPlfA1xPHyqC1Or1zcM4FtxhcmmbuXzzKlNEJEP9TEl+64i68qLZ5fW
	CsR9mU22q+L3LMmyiP2NZnkXehiENRCOGmy8geBMsI+aCb4lTxAkGjnuPhvMlq4m5MVUmUMJQtY
	f/ZToV9GTevksxLmhuI7du71vP/QuDcoHKNobtu0ZqTdwEka7OHTMbtuVcpBNWzcgDiCE6oNaRk
	3kSmwOKUNN2PY2s0NsmX6QALOCmE8IhBpyKqrbwSma6k/6d0rqjCi56jMe8a/K2m9FRUn9QYv9l
	Pbt50Sb/WnqUKGo/Exx3sTPRggDE0nZLTJDOgQ5O3o8dATfwtOYfsuR8EI21uoTTTUiA==
X-Google-Smtp-Source: AGHT+IF+BxD58dug8k9kIEX+VDZ8eK8yGZDoOi3c682xLhrZRW5uMS2yoSke44pZijRRO5+w07eqaA==
X-Received: by 2002:a05:6512:3d18:b0:592:f7b4:e5fb with SMTP id 2adb3069b0e04-597d4b40ff7mr305526e87.3.1764762813737;
        Wed, 03 Dec 2025 03:53:33 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d24099022sm41772011fa.27.2025.12.03.03.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:53:33 -0800 (PST)
Message-ID: <828b0012-f9c1-49af-a3ae-2797a6256a6b@linaro.org>
Date: Wed, 3 Dec 2025 13:53:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8550-qrd: move camss status
 property to the end
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
 <20251203040538.71119-4-vladimir.zapolskiy@linaro.org>
 <3f8e8e3d-fb38-4e17-8a55-a22ed9329a9a@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <3f8e8e3d-fb38-4e17-8a55-a22ed9329a9a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/25 10:32, Krzysztof Kozlowski wrote:
> On 03/12/2025 05:05, Vladimir Zapolskiy wrote:
>> Conventionally status property is the last one in the list, move it there.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> index 48af6d114161..b3eb0836c408 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> @@ -717,10 +717,9 @@ vreg_l7n_2p96: ldo7 {
>>   };
>>   
>>   &camss {
>> -	status = "okay";
>> -
>>   	vdda-phy-supply = <&vreg_l1e_0p88>;
>>   	vdda-pll-supply = <&vreg_l3e_1p2>;
>> +	status = "okay";
> 
> Please do not do such changes node by node. Fix many or all devices here
> or none. But actually even fixing all should be postponed - we discussed
> this many times, first proper linter is needed.

For historical reference the corrected here issue has been spotted by Konrad,
and since the requested improvement could be done instantly I added these
changes to the series:

https://lore.kernel.org/linux-arm-msm/21430004-b186-4f28-be59-bcb3851237b8@oss.qualcomm.com/

Patches 3/6 and 6/6 can be dropped now while waiting for the linter or
be squashed together, or just included as is, whatever is preferred here.

-- 
Best wishes,
Vladimir

