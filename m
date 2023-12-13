Return-Path: <linux-arm-msm+bounces-4591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3E6811F10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 20:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D88C1F2182D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 19:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27516828A;
	Wed, 13 Dec 2023 19:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mSdTmJxQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 575B9AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 11:39:03 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c31f18274so69630305e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 11:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702496342; x=1703101142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbxf/n1JYPWU0JCbaKzfpPEQ9Z3iTVDLH9PGOSTQg68=;
        b=mSdTmJxQM4qtcYvrue340rwahDIuaO0BPUEmCbbyAs5R29psePF/rmlyogcksAxSGD
         +g0NGwjx0tvRaOmLsoY0EI+swzfJaeyqho1cH6XNkJaL1mytKQArpszYdhxQIcRNPJII
         cei8Z4G8W/qo6i9Q1KbSnLH3Rmwu2hyS1Blo6NUEv7Rd+uspySEngTIfqPdNdV9PeYfI
         BheXmLtv8KXg9jg4Ue7vS/h05sPEVR3j51dQrlJDBR+W6VOqdE/kU27FIAqGwT29s1cB
         xE3932gDkqNMpWuq4joZKAlR2Zl+LttI38ogl+FfJeU+qgQAzpdwpt1BGhg/v55qtFma
         B8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702496342; x=1703101142;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbxf/n1JYPWU0JCbaKzfpPEQ9Z3iTVDLH9PGOSTQg68=;
        b=YFQa+DHJ0YlX1+P0m8qxIwbO/oE/FFhPJbXr7i8ATn6ZBzySI5F0MvY6z3YxrvqnmL
         UMFAR6vW78JSegPUfK0z5rN06WEnweR+jA1ofPFjvM9D2+6kVw+O+1MTHYy+QMo6I5nW
         LxEY0JHywO/3YxHn+AA6SkzCD+rXjwfZUVt3X/5NfenhOFzuqNY4txxvqJOuN4j3lCzz
         7Ag13RCugxmvJrPPmMdCemMMABMTqvZ7nhrnkewYOUQ41gaq7k0fhLlLQiBZGzlbJZpw
         R7KCVUNTt5leBTFWEoCai0spJDM+71rsF9AfxnelEw22leqlyN0w57Rb7wLaGq4X85fa
         zDjw==
X-Gm-Message-State: AOJu0YymGZTHLu434dISruw3CsmQlc9JCBCRkvdlNXB5/LI06qW0Hp+Y
	e3Chhr9DSMBAxB25yRVULSa2Hg==
X-Google-Smtp-Source: AGHT+IHWzwoPcW8Z5MFSpN2Gr/X3vdABbVjW7aD5xUeNiltIoUTuZ0GHTP+D9qINzvk/IQ4T9M3v0A==
X-Received: by 2002:a05:600c:45d1:b0:40b:5e21:bdc2 with SMTP id s17-20020a05600c45d100b0040b5e21bdc2mr3068441wmo.81.1702496341815;
        Wed, 13 Dec 2023 11:39:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600c354100b0040c411da99csm16159537wmq.48.2023.12.13.11.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 11:39:01 -0800 (PST)
Message-ID: <ad65341e-2d84-4fe1-bd04-c788d4c6eecc@linaro.org>
Date: Wed, 13 Dec 2023 20:38:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: aim300: add AIM300 AIoT
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa
 <abel.vesa@linaro.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Qiang Yu <quic_qianyu@quicinc.com>, Ziyue Zhang <quic_ziyuzhan@quicinc.com>
References: <20231207092801.7506-1-quic_tengfan@quicinc.com>
 <20231207092801.7506-8-quic_tengfan@quicinc.com>
 <02be9f46-2187-45d0-9929-31f6a2c18b35@linaro.org>
 <11257e57-693f-46db-8f97-09e5d4c20238@linaro.org>
 <e2c5d7ba-15c0-45ea-ae45-2a6deffde04e@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <e2c5d7ba-15c0-45ea-ae45-2a6deffde04e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/12/2023 20:01, Konrad Dybcio wrote:
> 
> 
> On 12/13/23 15:04, Krzysztof Kozlowski wrote:
>> On 11/12/2023 11:33, Krzysztof Kozlowski wrote:
>>>> @@ -0,0 +1,579 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +
>>>> +#include <dt-bindings/leds/common.h>
>>>> +#include "qcs8550-aim300.dtsi"
>>>
>>> Which includes sm8550.dtsi thus I think this is compatible with sm8550.
>>> You even use sm8550 compatibles here, which is one more hint for that
>>> compatibility.
>>>
>>> We followed this convention for RB5, although not for QRU/QDU1000 boards.
>>>
>>> Anyway, if you add here new SoC compatible, I would expect to see new
>>> SoC DTSI.
>>>
>>> I don't have in my notes any previous consensus or decision in these
>>> matters, so let's discuss now.
>>> +CC few Linaro folks
>>
>> After some talks, the idea is to create qcs8550.dtsi, which will include
>> sm8550.dtsi, and add top level compatible for qcs8550 using sm8550 fallback.
> To the board device tree? Otherwise it'll get overwritten.

Could be both, to serve as a guideline for future DTS, but in general
yes, to the board DTS.

Best regards,
Krzysztof


