Return-Path: <linux-arm-msm+bounces-1574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4207F50AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 20:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D2E01C209F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 19:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C045E0CF;
	Wed, 22 Nov 2023 19:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bikKc5lU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B351A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 11:35:06 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c873cf9f74so2115641fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 11:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700681705; x=1701286505; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDmhoQHGOOALyVImUqGT+R0vogulb4Mds0pYOKaTAe0=;
        b=bikKc5lUw/LI4QjmZk3K8Ctg2TFU52ankJhgr1UMIKOabQI2HObJDHpG3mZ43Xojs3
         seWBM8H6/qPnGdHKJnH0OOAR89kqtNuyCWMeA/230v+4LJ0/BHvwZ28a7RVpikbNrTFo
         KzlhF1fhqaBOVsC3vdhaj9UOLerLBbpO7of4nAu+/WsBBytkPk5Hb0eHYUZEHC833hTa
         ryr3sTSHxKe0d6WLdR4mn3m51C6IKe6iqj7vnYYE5HXK9fyrUxuVZ1e/2S2KW42VWp8h
         7oQ/EGNKAlAZ2aY8pCvBRzHyNbnHt1VpzUp47OqYqtjHmI9SJJKbHN1n3TfE+CApa/Si
         lNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700681705; x=1701286505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDmhoQHGOOALyVImUqGT+R0vogulb4Mds0pYOKaTAe0=;
        b=WiK2Ys2o/gkTXyPSoS7rP4/aFOMYI8AlgzsPmH9Wtt9VQUmNmTg3p2G1HVwP+4QGyV
         et5Fh53YNeivATH50ica2V3eBNNRurI1tXoyEjBddhigqyyny4mjig87xsK0eWexltMh
         C6/M5Oc1My+BSitPDpOdk/yqENiV6QNHtldYtT0UlxGZeDjQ0u6FjaG+IknjCa587xZz
         u/OPYdhKf6KiC/yuAjjeZpncnyXJIw79AyuLLhgHX6071a/MBIAwqJlj44UioNDs5xZ3
         XmaJ/zPL1hf1mF0oZfDa25VTaMIjwQUs+JeI7VVlZZs0E0abD9s3xpuLso+zainqetJ/
         2+ow==
X-Gm-Message-State: AOJu0Yz0+eYDDbSA9O26lwnR+2a3UKuwLWWc1s47tO2dPKpvqVGd6Bk3
	89eenTQjSNhDzPlAAUzkX+sHUA==
X-Google-Smtp-Source: AGHT+IE6aS0LAuHAvH9t9v/SYT2pY0NL/sN0lO5YQ5D7kje63sItMPR3QHt65q3O5k6KurxZCAhxWA==
X-Received: by 2002:a2e:920b:0:b0:2c5:23e3:ed11 with SMTP id k11-20020a2e920b000000b002c523e3ed11mr2640611ljg.30.1700681704688;
        Wed, 22 Nov 2023 11:35:04 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f6-20020a2e9186000000b002c505a6a398sm29408ljg.89.2023.11.22.11.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 11:35:03 -0800 (PST)
Message-ID: <6e399854-40a2-412b-8c41-4f9e6b17e38b@linaro.org>
Date: Wed, 22 Nov 2023 20:35:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] dt-bindings: arm: qcom: add SM8550 AIM300
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, tglx@linutronix.de
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, -cc=kernel@quicinc.com
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-2-quic_tengfan@quicinc.com>
 <519b89a2-550e-44a2-bff0-a6a86c50d073@linaro.org>
 <54b68923-f670-482b-b4a2-ff5f5c867a91@linaro.org>
 <7bf18b1e-463d-4030-99cd-4fcf2126fda2@quicinc.com>
 <4eb76d38-93b5-424b-adce-3cc296fa03fb@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <4eb76d38-93b5-424b-adce-3cc296fa03fb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *



On 11/21/23 08:18, Krzysztof Kozlowski wrote:
> On 21/11/2023 01:30, Tengfei Fan wrote:
>>
>>
>> 在 11/20/2023 4:53 PM, Krzysztof Kozlowski 写道:
>>> On 17/11/2023 11:22, Krzysztof Kozlowski wrote:
>>>> On 17/11/2023 11:18, Tengfei Fan wrote:
>>>>> Add board compatible for SM8550 AIM300.
>>>>
>>>> Subject, commit msg and compatible tell basically the same... and none
>>>> of them tell me what is AIM300.
>>>
>>> Due to lack of explanation it is difficult to judge what's this. However
>>> based on pieces of information I got, it looks like it is not a board,
>>> so it is not suitable to be DTS, but DTSI. You still need a board...
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> Hi Krzysztof,
>> AIM (Artificial Intelligence Module). This hardware platform can be used
>> to develop AI related software based on Qualcomm chipset. I also will
>> update this message to patch commit message.
> 
> Does "Module" means it is physical module?
Moreover, does it have anything specific that makes it different from
a MTP/QRD/regular 8550 SoM?
In general, you can develop AI software on any computer, there are no
runtime checks for "AI" presence in the naming ;)

Or is it perhaps like QRB5165N [1], a base soc with what seems to
be a fat AI accelerator connected to it?

Konrad

[1] https://www.thundercomm.com/product/qualcomm-robotics-rb6-development-kit/#specifications

