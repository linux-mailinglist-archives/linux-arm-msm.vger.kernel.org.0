Return-Path: <linux-arm-msm+bounces-64712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB70B03065
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 11:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D236C17BC5A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 09:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE852777FD;
	Sun, 13 Jul 2025 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hRg1H883"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A021C6FE9
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 09:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752397972; cv=none; b=fnmx1hwnU3G1ySLkweO8QyCDmK9T3jIC8pTzz2JGpXwfpcvED8+/nE02H2gF9lydURtg5XArvZ+lA/PdP8ZTMXaacvSg/OhoEWhhP6+zub95cGEaRlB3kYS65ot+KNtNeestrTd5j0Zx0zrzPt3lFBjRKbv3zp230jTkIVd5knk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752397972; c=relaxed/simple;
	bh=ttP2+H/bej+IM7hX8rbyBToQUHpPpcZy6rtLIIOb6c0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rT0k/Vwhmm9B4yOku10TqU0q8yJYWIcfI6jgv711X6bg+qadRcxjmI08s/O0Ygsbzp25CkX7bYVz5I1AmxDjaLvoXuoIg8WVUNL6d06MtLqyfWWfPjyBwVhOaVi0qEtSmf2B3n2tGvSsA6Cx0e9WfCIAwC0gays45sdtSZrMeg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hRg1H883; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-455b00283a5so10909795e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 02:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752397967; x=1753002767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2bZfg9DF5nDVKhJoydkljHjxo8IZW88WiR/LfC60k7Y=;
        b=hRg1H883qwLMSTjeEigBOEFhVD6QoGYt4zn8ehVVliF72zunVAlKF6WNNtBtgsOkjo
         yeWypeD88AfwA0risdqQDYOTXkWQtUEI9wgSRcPWRTTeC1BDJzzxqhGjuU9Z6nnO12Th
         JO0qvtjoh9undSE6DPYmGfRWpxzu1IdfljeRwn2if4+TgwT1cD8tPGYIGCSebmwD5r/d
         3+oEqg0jYBrlmBwBR5I2hK4Pqr1ynD5FfMPE7/ElU5olYtwPe7GE2og0ReNSy//+d5/N
         p9Hum00PCC1Sso5SS0NksWNep0lqBFuCcdpvC4NT8J51UWaugcDVmKOIBPdj/VdWsR50
         CdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752397967; x=1753002767;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bZfg9DF5nDVKhJoydkljHjxo8IZW88WiR/LfC60k7Y=;
        b=R1U0XlIVgsVKGQgGenIlkYJuFaSFBqwZh5IHvoJ0EpH94vgMryzvDqUIzUr6hZqtsO
         Ly5tt4vRwCAWA1lkumBgx7D4gLltnNhmWoPg1eoWRL39aROJKPnswmuKP4AHomwTdDBV
         luk+C8IiDhEzfAC2TKr7TnuijGMpjeyQIUeys13PUHq4GW/v14etfZi86CZSAigW8fVc
         UOzHO3SStRScE7Cll9B9aKbi9FO81YY6W97yrm6hpQb/sFp/w96x7ibKqWP/H4ePLgMN
         5Ou7D53/KEZhKa/pDfuTVJ8QWLSzlI9Yq+GL9kmnEY6vvrIL910fG76abdxEGRLh0MSj
         5YjA==
X-Gm-Message-State: AOJu0Ywpo2SGA5N7AJARoOtWHXiMaWtnvO5ni/uRmBJkcOD7AuOmWblJ
	L/ioSXNOiQ32uJE6xtDLJdJEGFgOSWVeMIA27GluAoj0dQnpfNxgUeC7e2i4gP9gUlQ=
X-Gm-Gg: ASbGncu7WoK2HqLrsO+difWSe2KU3ANkuuPeo0wtXMOgbsYO1fXZ3Uv3O6n8r1C+VsW
	I5ZqHxwxJL2Yek1AdBmDKWNwuyz5PHEDgC7PDqA0dbDWFQIiyoCYCEnuzBLhv2bBHG1KfuQYBw8
	nYF9r6MZOxn0VIPnQiOiVZ5/exxGXROulXeZPHnjxFOArKUwAmz6xlQ3KFnBoGm9drJReFe0WFw
	gG2qLnANbTjkzMzd4+lZDgVvSHeMaKQayZFYtx4D+ol/myM497f6M7K6rSOcDaw+kQtRIe5A/ie
	ih0zwFy2CbKbnRQGh1ZRTGYZ1OW0JYTRjxG7J2tcnEDt0vUMWFMumzV1pwbxMTL5Woq9DYahB8B
	Qab9Yt817AsrEgCjzCnWT7qiSOQOVYnlMhc9teNhMZTVVBN6rxy+FOsr4QYdp4SA=
X-Google-Smtp-Source: AGHT+IFYMtWgYdOmndlZ3GtfdgwsQKMDhvhnsOVqQJrHIBGY5YzlakXukB0kQt0B+MV4iFsnSxY0lA==
X-Received: by 2002:a05:600c:1f8d:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-454f42692d9mr74678445e9.24.1752397967443;
        Sun, 13 Jul 2025 02:12:47 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc9268sm9235312f8f.41.2025.07.13.02.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 02:12:46 -0700 (PDT)
Message-ID: <6ca1b24b-5f9d-48e7-9afd-7dac47b486b1@linaro.org>
Date: Sun, 13 Jul 2025 10:12:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/15] dt-bindings: media: qcom,x1e80100-camss: Assign
 correct main register bank to first address
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-1-0bc5da82f526@linaro.org>
 <f4fd544b-bd5e-49eb-83d9-290f77e503ef@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f4fd544b-bd5e-49eb-83d9-290f77e503ef@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/07/2025 09:15, Krzysztof Kozlowski wrote:
> On 11/07/2025 14:57, Bryan O'Donoghue wrote:
>> The first register bank should be the 'main' register bank, in this case
>> the CSID wrapper register is responsible for muxing PHY/TPG inputs directly
>> to CSID or to other blocks such as the Sensor Front End.
>>
>> commit f4792eeaa971 ("dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address")
> 
> I have next from few days ago and I don't have this commit.

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/1da245b6b73436be0d9936bb472f8a55900193cb

>> assigned the address to the first register bank "csid0" whereas what we
>> should have done is retained the unit address and moved csid_wrapper to be
>> the first listed bank.
> 
> This is confusing. Did that commit change entries in the binding?
Fixed the unit address.

What we _should_ have done is put csid_wrapper as the first entry.


> 
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> index b075341caafc1612e4faa3b7c1d0766e16646f7b..2438e08b894f4a3dc577cee4ab85184a3d7232b0 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> @@ -21,12 +21,12 @@ properties:
>>   
>>     reg-names:
>>       items:
>> +      - const: csid_wrapper
> 
> Anyway, this is ABI break, so needs some sort of explanation in the
> commit msg. We don't break ABI for cleanup reasons, unless it wasn't
> released yet etc.
So I since we haven't added the node to a dts yet which to my 
understanding means no ABI break.

---
bod

