Return-Path: <linux-arm-msm+bounces-85294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C6CC06BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 02:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FE143012BF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 01:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE04204F8B;
	Tue, 16 Dec 2025 01:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VT0cj1O2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D26158538
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 01:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765847420; cv=none; b=NjOsRiw/BNrT+ta6qvn+9OglnP5xoLBxnHPhAR1k5VOkoQf7pl50Ovir1SNOaRlxHFyxN0ExsoMmfneP2Nx1o5uzYqB5WI7Olj+VkxTangLDcZSaAVrxFyPNcmsKQacNS44wsfHqWaUWtNVt4O+lxfNvOsyl9q6EYa3Kv5V+xEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765847420; c=relaxed/simple;
	bh=WIZ9jyFswOPNqTgsmJJ76iM6G7nvLeuDuP7DQJ6BNqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVrXhIslyimNyk+LP5AtefYe8kqOreCEZ8hFujnk8/9+EX+v39gTeqwVCh+UNu2ISY7/IQFu6Ja9MZdLJzNXD9Hr7qBVuGrWK6/nMpXZs+3Ze7cN9BS568PogFtsYHmT17OVgKyzQqOZsByBaAhd5MB1CA0CxQSE7uICxBcQ7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VT0cj1O2; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37fcd0704d5so4011591fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 17:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765847416; x=1766452216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mi8Xm0zurhbSPDMlN1uc/lNI9yNMPSviozpqbJTiEDg=;
        b=VT0cj1O2UIktLIzkUNpdWYDS3SfInrhRY5mNJcIKLeUAXCKRnfwbUflVWjr+5L2m2h
         8+WWCWRbStWVXcptD5tJdnwvuPsKkW2Zv/oNskRQqBqrVJcIZCJykx7PPQtFsuRcpYTC
         XlwVQvCvmiX4uFLJe9LYi6QIQP17gPaVn5nij71NEtk3tU8dPxKwX7ywJKMmeq7vX2c5
         an1OKKnE4LnMcyB7y2AS0t17BU4sGHiS3J86NELr8jdlU8bP/slS1Uf6EhzZd7YfUNjf
         btpfWx78MnxCnndLDhszNUTO+JqoG0mtIRqBu2tD+pydRZ9BaEoC/JnMoDgLv/61iISN
         W/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765847416; x=1766452216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mi8Xm0zurhbSPDMlN1uc/lNI9yNMPSviozpqbJTiEDg=;
        b=LSi8ltxlcc8Sktk6MIGqr7YfddLl6IKxG/CyT7/YFNc4lRdPGWMEofUhwJp2gEKk4X
         dUC7DcOUdLMdA4uQna5Wg/N3I7zTP0fNyH5AQo3zTgNmHfe/IWi54Ou5wsZ7ff7MbDGl
         ylw7KndxtX/8CYh3R8EZJI8bwAMBoD+FrywGBmlZ+U4QRIH8DfZ6EaDcJiQ65WSspb7K
         tEsN5mWu4mXFMsS2KiPMILylB9g9qTuVAhFezKf/uyU5SCDRTz5wjE4H4nPHW9x2yeNQ
         RCJ9o+sBpV7nhYliAHbJOPwM1YohtJ6iEPOfe6/BEqLWrGOfJfCt0IYz2f7+no13WFp/
         csPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1nWETE9kJC19M0KpdyhFAzlywLwho3ezzKMtu8vNwLIxuZx7+Kih2S+lL3+JhnzanYjAK8Zqh+fsTWPXb@vger.kernel.org
X-Gm-Message-State: AOJu0YzvCoK/tK31hjIwSPnIWLBHb2z8c2UGbCn7vCtcJBInFMfHkGNR
	s7kgFphXLeD6I7RFP15eqniMgeLcLdc/p0zYMy+D6+Wue6m1mvWYBe0jyPngea5eSLQ=
X-Gm-Gg: AY/fxX7OZoaNW3qLODd5GUMPP+ABYe4P6J4TiDganW0czmQxAaVLNInDpd+jMVnmoOD
	0yaVgxmN+ppuj0a3i90g/IieIY1OtxgdcOjubdlU7Q7QsdpGQGhoNMdR6xFnvgYwdTofIYVMM85
	v3kem8SozXo7LEts0ttKD2oHPs2PRUO17LAo4cG6QAWLqX+fxTLGVygFgbn5pvc6Zol+ulrct19
	BU21NWDSyQ3nmuJ7uNHHZHJ7dcaK0oCSmhy74koQwD+gJ8ShXkBjQV5kqUWnWX578lBaLbSExHc
	bQ3ZttgdDD+7Hb4p1zaqwqa3oAraeyy2VbS/b8+q4p3rMe0M4BRIzxnIk61qmzO8hHRqK0kXQ1p
	J9odK0E0WM/rzIufy6rnr3nDM23mCgjSn2nzgjSFl12BqQStTRHrhSvUj3Y5m4wgGaxX4AGq6yw
	+eKbfwVsdP+9ktz2/0D/qi9L2Rwe7zxcIVPUhJ3a61LPPjKUxajOKFDPbhplDUxfDaRA==
X-Google-Smtp-Source: AGHT+IH7lvZQh/tJdyvFMjmv5Z9sx5r76i24YJXdpQwBw46WC2pR2Mr05q/RbbpGbzcBzScS/lkVsA==
X-Received: by 2002:a05:651c:2223:b0:37a:8acb:a053 with SMTP id 38308e7fff4ca-37fd088227dmr17398471fa.8.1765847416234;
        Mon, 15 Dec 2025 17:10:16 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdebe61e2sm33946831fa.7.2025.12.15.17.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 17:10:14 -0800 (PST)
Message-ID: <9d78a741-2cc4-4622-8c4d-a096521ca08a@linaro.org>
Date: Tue, 16 Dec 2025 03:10:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct camss VDDA PLL supply
 description
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz>
 <1e09a93a-d42f-4a23-b346-9f158a60d8aa@linaro.org>
 <b9b84317-a392-4f1e-aa8f-351e92c678a1@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <b9b84317-a392-4f1e-aa8f-351e92c678a1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/14/25 11:35, David Heidelberg wrote:
> On 14/12/2025 01:04, Vladimir Zapolskiy wrote:
>> On 12/13/25 00:55, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Usually, the supply is around 1.2 V, not 1.8 V. Rather remove mention of
>>> voltage from the description.
>>>
>>> Fixes: 849139d46d09 ("media: dt-bindings: media: camss: Fixup vdda
>>> regulator descriptions sdm845")
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>> Added only Fixes tag for the initial commit, not all the copy-paste
>>> propagated ones.
>>
>> Generally it should be possible to specify a list of Fixes: tags.
>>
>> However, despite the change is the proper one, there is an opinion that
>> Fixes
>> tags are not applicable to dt bindings with a given reason that only
>> executed
>> code can be fixed. So you may be asked to remove even a single Fixes tag.
>>
>>>    Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
>>>    Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
>>>    Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
>>>    Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
>>>    Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
>>>    Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
>>>    6 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-
>>> camss.yaml
>>> index 019caa2b09c32..9009cfe993d75 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>>> @@ -130,7 +130,7 @@ properties:
>>>      vdda-pll-supply:
>>>        description:
>>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>> +      Phandle to regulator supply to PHY refclk pll block.
>>>      ports:
>>>        $ref: /schemas/graph.yaml#/properties/ports
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-
>>> camss.yaml
>>> index ee35e3bc97ffd..cb922f90fe900 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
>>> @@ -129,7 +129,7 @@ properties:
>>>      vdda-pll-supply:
>>>        description:
>>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>> +      Phandle to regulator supply to PHY refclk pll block.
>>>      ports:
>>>        $ref: /schemas/graph.yaml#/properties/ports
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-
>>> camss.yaml
>>> index c99fe4106eee9..2231d7216f62a 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
>>> @@ -268,7 +268,7 @@ properties:
>>>      vdda-pll-supply:
>>>        description:
>>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>> +      Phandle to regulator supply to PHY refclk pll block.
>>>    required:
>>>      - clock-names
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-
>>> camss.yaml
>>> index 35c40fe223767..8e6ca94c88695 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
>>> @@ -95,7 +95,7 @@ properties:
>>>      vdda-pll-supply:
>>>        description:
>>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>> +      Phandle to regulator supply to PHY refclk pll block.
>>>      ports:
>>>        $ref: /schemas/graph.yaml#/properties/ports
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-
>>> camss.yaml
>>> index 82bf4689d3300..d50e096b900db 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
>>> @@ -211,7 +211,7 @@ properties:
>>>      vdda-pll-supply:
>>>        description:
>>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>> +      Phandle to regulator supply to PHY refclk pll block.
>>>    required:
>>>      - clock-names
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-
>>> camss.yaml
>>> index ebf68ff4ab961..ccd2d024bfd10 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>>> @@ -300,7 +300,7 @@ properties:
>>>      vdda-pll-supply:
>>>        description:
>>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>> +      Phandle to regulator supply to PHY refclk pll block.
>>>    required:
>>>      - clock-names
>>>
>>
>> As for the change itself it is good, I'd prefer to get a correction
>> to 1.2V in the documentation rather than a complete removal though.
> 
> What I'm seeing, while the vdda-pll is usually close to 1.2V, it seems
> to me that's not everytime the case.
> 
> Can you confirm it should be exactly 1.2V, if yes, I'll clarify it in
> next version.
> 

This info can be obtained by checking "vdda-pll-supply" supplies of CAMSS,
which are set in upstream device tree nodes right at the moment across
various Qualcomm SoCs, as well it can be verified against downstream.

The naming (and the descriptions above also) "vdda-pll-supply" itself
is non-informative, I hope that in future there will be only clear supply
names like found in qcom,x1e80100-camss.yaml, qcom,qcm2290-camss.yaml and
qcom,sm8650-camss.yaml

>> In any case,
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>
> 

-- 
Best wishes,
Vladimir

