Return-Path: <linux-arm-msm+bounces-4921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B608147C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 13:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 990581F22D18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 12:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448752C68B;
	Fri, 15 Dec 2023 12:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBeBMfcv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55E624A07
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55276a725a1so692202a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 04:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702642481; x=1703247281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QsGNsrF8cVXU+JIQmnXKczEbibuzzO7GegprNh90Qgs=;
        b=sBeBMfcvVlqzpvn+Lmq+yWXKx6YrU9VNcfegEjarUDK2R9vljEZhuv31vXvUPjbTml
         XcDAIAp5Zux+4wJyhjQYgIepNHqYXp95XqMona+Vu8+jwp6dan+oacxW/lWjqxlhxuSj
         t5B57PoTcWI5oQeWS2uaXUsPKl9hT7Y8lfUhVP23ArDsv+UI+GD3WEjhxYkQ3r8uoYD6
         5IHXvdNUltAZaCFKK2OTFo5PGGEbqT6OtFHUasIFLV4FyoXdw9BDvJXFYj2Vc0ZVjO/f
         1oCOx1gw3RvUWquyYR3jHePSyzC6J7v0qW64diVfyd68DItsphpYo6Jsffs2aez4DSrL
         qnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702642481; x=1703247281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QsGNsrF8cVXU+JIQmnXKczEbibuzzO7GegprNh90Qgs=;
        b=Rn+n+KuwCkIEa0YBBoiY/hAkrk8sqz3JIiTKCD/IBmJpPpe2ccAoNR0CU5lBVwk1K3
         dNgr+Otvptfnk+E55OrgHb7T6xEsdf4fzpXTeSl2TZom9ZvVMmRdwmEDSyNkbsOg6gSP
         eyn5zNYma3lPLylVSv7G1LOPLbxJOYs6+fH6acsVW540cdLMmYsr/WxC1Iz9/+/37LbE
         APpaIHBzLKED9K/1JGIsJNPwLzfSSkvUcjnGpyWo7p7+S2xtpNFq3QW9mPoZbqaj5JeT
         6lw55Pfe1slsOgXb+OvF0RDmtL3IvTpegJDSJjyyknHPv51fVqpgeKgaDBn3X4PW+HR4
         p0PQ==
X-Gm-Message-State: AOJu0Yy/3F4WmOIiYsBTylOSWwuOCKP8qHarhtBa3j3ft7/UhfsuuGEv
	Ngjwo48YGfjAXgFydyEjmSZ9/Q==
X-Google-Smtp-Source: AGHT+IHzJdkW1d5xdmfJw6DaYo/3tReDG2eQrJggfy18B9flPGEmLJpeLgwD+qhK77kGWgmSpq889g==
X-Received: by 2002:a17:906:750:b0:a1d:f3aa:a4bc with SMTP id z16-20020a170906075000b00a1df3aaa4bcmr6621973ejb.60.1702642480968;
        Fri, 15 Dec 2023 04:14:40 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id un7-20020a170907cb8700b009fc42f37970sm10777653ejc.171.2023.12.15.04.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 04:14:40 -0800 (PST)
Message-ID: <6acecb29-2a6c-40af-a5a3-bec3e7286df7@linaro.org>
Date: Fri, 15 Dec 2023 13:14:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] dt-bindings: net: ipq4019-mdio: Document ipq5332
 platform
Content-Language: en-US
To: Jie Luo <quic_luoj@quicinc.com>, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, robert.marko@sartura.hr
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_srichara@quicinc.com
References: <20231214090304.16884-1-quic_luoj@quicinc.com>
 <20231214090304.16884-6-quic_luoj@quicinc.com>
 <1e4c55c8-8ed6-4f2e-8328-8a173f09b62f@linaro.org>
 <3c8e33b4-6ebc-476f-a00f-15cc8a1ad9e4@quicinc.com>
 <b89abf8c-57f8-46a6-a071-b1591340fbdf@linaro.org>
 <3de98516-9a28-4f58-8951-2a7752621fee@quicinc.com>
 <1fa2d219-63d7-45cf-9e05-b85dbce24076@linaro.org>
 <f16dfe78-2e31-45fb-b2fe-f72b7e6c51a5@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <f16dfe78-2e31-45fb-b2fe-f72b7e6c51a5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/12/2023 13:03, Jie Luo wrote:
>>> If i do not declare the property "reset-assert-us" and
>>> "reset-deassert-us", the warning will be reported by "make
>>> dt_binding_check" since i
>>> add a example in this file.
>>
>> This argument does not make sense, sorry. Obviously if property is not
>> allowed, it should be removed.
>>
>> Provide rationale, in terms of hardware, why this property must be added
>> and why it cannot be deduced from the compatible.
>>
>> Best regards,
>> Krzysztof
>>
> 
> So i can remove "reset-assert-us" and "reset-deassert-us" from the added
> example to avoid the dt check warning? even these two properties are
> needed to be defined in the device tree to make this driver working
> correctly.

Sorry, that does not answer my question at all. First, "Driver" is not
hardware. My second question was simply ignored. In the v2 thread you as
well respond with some short, unrelated sentences not answering to the
real questions. It's a waste of my time. Please reach internally in
Qualcomm for guidance how to upstream patches and how to write bindings.

Best regards,
Krzysztof


