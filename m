Return-Path: <linux-arm-msm+bounces-1015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0665D7EFC32
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 00:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A42EF1F22A5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 23:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD3D47765;
	Fri, 17 Nov 2023 23:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iqFv1s5b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5B510E5
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 15:40:18 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso7042175a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 15:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700264417; x=1700869217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OlqVaq6D41QiTKqXp+cP559TOMOF0nz23L1kNSeWPn4=;
        b=iqFv1s5berimbDCqL3GM2It6vnp5LMLhb1UJWyHfazF0ULJ+xakbq+YE65trFt7LrK
         4CieDymQWjHMfh50k07tCR0vycJkSd2oShIAWj/I8/IQhHjGeIVw6aEtcXC9Czbd36MH
         oJjH77awIrgKebNhX2YFyPOfiFDawx2/iU/AZnulsTFM/NWXOKJnlh/F9ISaKTOC1Sm+
         tktVmByWFzvKMKRsRVL26U7JUoqGNgffJA+IVYM9YgN7b5RoPgnStnzkIunctdZUsWmy
         vXVvgGcx3jSHaIx/eWJGKxZkDH4fw4nubPK/Lodd4nU3Ojc0A9+xOBuyFJFrMQ5pg5Z+
         9wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700264417; x=1700869217;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OlqVaq6D41QiTKqXp+cP559TOMOF0nz23L1kNSeWPn4=;
        b=DpAFEmecCCJ2fOn/hDMsUqMCH0bH8oZRiihTnqzSqoJp9TFYlSlGduDiKBtZS25+bg
         v39MDDqQkZ1pBvECVZtRS2oMtq3sRJ0Og5ZeHkSRpPSOPXRHMbEJVtZdxYe/TIn8fJiw
         Ytvk19QC9bPT0DpKp9FgkWrcUUPsbE8fg8jJchE2nk4oV2SbOskuw0TJqPDo5GzWuSIE
         4WSRnYWi+06ssFjRYeLHfvnSXX+IjN+DhLgCS2YSJq0kBlhuWmMk2l7+ksnlavlnDqRf
         GRSPC1I8UdrUbYxjpvQxfYOOfR4lznDwJUnxbPRxlhYdK1QBIJFiKP6vyPTukyNMzCqv
         F9Qw==
X-Gm-Message-State: AOJu0Ywuk/+GpjMbulYq343ofa81Ti7AGH6VL32199/Aca1y8BlBMRTI
	K4GhrK6Pj6RGRYNfs0KNJHMXsg==
X-Google-Smtp-Source: AGHT+IGE5JB/nYaBzZXWXm85KHIOGc2UA6YFUsCTrsBvUGlcytqCP9PDGe4vWuZPvrJe3cpJJOwG6Q==
X-Received: by 2002:a17:906:6810:b0:9c7:6523:407b with SMTP id k16-20020a170906681000b009c76523407bmr5633991ejr.17.1700264416891;
        Fri, 17 Nov 2023 15:40:16 -0800 (PST)
Received: from [192.168.201.100] (178235187040.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.40])
        by smtp.gmail.com with ESMTPSA id lt16-20020a170906fa9000b009e71efcce28sm1269357ejb.210.2023.11.17.15.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 15:40:16 -0800 (PST)
Message-ID: <796fd7be-2008-460e-acf7-e335de780104@linaro.org>
Date: Sat, 18 Nov 2023 00:40:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: power: rpmpd: Update part number to
 X1E80100
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 ulf.hansson@linaro.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: agross@kernel.org, conor+dt@kernel.org, quic_rjendra@quicinc.com,
 abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, quic_tsoni@quicinc.com, neil.armstrong@linaro.org
References: <20231117104254.28862-1-quic_sibis@quicinc.com>
 <20231117104254.28862-2-quic_sibis@quicinc.com>
 <8fafbba6-86de-4ddc-966e-48e2152f6b1a@linaro.org>
 <97216704-a102-532d-1039-c9342a19e2fd@quicinc.com>
 <81a1bfee-851c-4f05-b816-47abcebed99c@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <81a1bfee-851c-4f05-b816-47abcebed99c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.11.2023 13:39, Krzysztof Kozlowski wrote:
> On 17/11/2023 12:46, Sibi Sankar wrote:
>> Hey Krzysztof,
>>
>> Thanks for taking time to review the series.
>>
>> On 11/17/23 16:35, Krzysztof Kozlowski wrote:
>>> On 17/11/2023 11:42, Sibi Sankar wrote:
>>>> Replace SC8380xp with the updated part number (X1E80100).
>>>>
>>>
>>> You need to explain why. We don't update compatibles based on marketing
>>> wishes.
>>
>> What we imply is that X1E80100 is the part number you would get when you
>> read out from a Snapdragon X Elite device in the wild, when it is
>> available and we didn't have this information when we posted out v1.
> 
> The commit msg must explain why.
(what Krzysztof meant is that your explanation is ok but it needs to be
part of the commit message and not just a reply here)

Moreover, it would also be good to say something like "this binding has
no users and has been erroneusly introduced very recently, so it was
decided that changing it is okay", as this is a rather special case.

Konrad

