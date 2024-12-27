Return-Path: <linux-arm-msm+bounces-43468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 459719FD0E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 08:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA11D3A0595
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 07:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0D6140E34;
	Fri, 27 Dec 2024 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SamE1l6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156AC5FEED
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Dec 2024 07:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735283652; cv=none; b=kQ+/eSHxwgwG8sV6H1DFgw+MS2jBoRK8XJZ2Ws8Q5cHedVgMB9HhLQ0hZ36n/blj5WFXWfNUOe9Y45xzUU5kOeKIXuU+JqE8/dXQRto0Ga4CZ4yK5nvUwE4kOp+MOr6Kemu57jFkAhCXysFlPNgZgWxvU4OXU8iy1NQNYKrEMv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735283652; c=relaxed/simple;
	bh=JKqfkUfIWpafkL6AT6E9qFIgjz+nVnyw4kMqoRdyx6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNTmlBlLEe5DInzyoXqUQAawWdwchup18j8iNZh/7ZZbLGRQiE4lxfsKDBd9mTVqn9mvo9TwAZUFKcNg5ix/mptvotHfd9Yk49dTAO2iYB8bSGr/pfJ8CntFEMj793xj+IzFJCJW4kUzyYdYECdVb2eICwygIcjQWccm5Af/maY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SamE1l6/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so10982505e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 23:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735283649; x=1735888449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=frArfcOpIQD2D9bW2N7xZXNPJ/+lIcxv0oBptC1BH5c=;
        b=SamE1l6/DafUTMlRq6i31SeL1oc5462YyRrPvszm3SuUUHr8eoiTdJeRkQQ76qRDy4
         yXRnGhjHksYZxvb/tO/HzbSDw8lQX7WJ85IPFxNNHh13uVpkVGxukLx2L2T7VS64bufu
         wKVP2PMTMSzavy1DRHwTYbKuvhiZd44tVNdcBsaLymd8DLioGC8d+hvTHUFjx3laNuOv
         66+vTCnzoQYPIJNaFp7E05ktt08r8GN6DG2kLHXGXCdqFYAIDXb37quye1is1IriM0+W
         xWxMd79NLCQ1Ua7E4zO4UXNiUN2n8iJ/79zIOpDaaRHVdKvse1sVafxMW+0GPl9Bfg3h
         lWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735283649; x=1735888449;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frArfcOpIQD2D9bW2N7xZXNPJ/+lIcxv0oBptC1BH5c=;
        b=pUsYhBsDyUYyHX0ZLezpaEVJZeWDF0tJGDBfeJacHXeOJ+HQThmSNc2aBLmoc7dGNI
         sjfGJyXzZcK+UW09rSDlSn63/CVHQxSQ4wqemwL7TDHQXFupqDtBkXyuKiKq5HZlbOlN
         VNhBfAF18ajABSjMeSUEVlcG2cYTbehD239a6SSs5mKAzS7Cg0jkfxRlDnuQwPXmP8w+
         ipUN8dKq6IY4v52pw7IIS9Fb1/2fjI280X53qDxBoZiAYEL02+rRNC1+9MlnYHcXHSsa
         8OPsKbbPl1PNiBBdehRJ9iwXlMPD6sxngAe9I7yhsTaBMCbIFRBopfyeOS56rOqkpjso
         QZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFlbfD+ikN0Vmsu9xSxG8/OoWUx/O0FWQsuvFtusfRUBOCcWtPQtHhNHt1GgDecxfc30obm+OcqvGvSKL1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq4xgwooJirHDWfpvAdsZF5DFbWufXQfQyIUPq1iPxtmojyu7y
	KXNieNz0lZQ/RPX9+4RtubPlo1fQmhc3x4woPE1wiLdxaIhz2LXuucejEaeyXL8=
X-Gm-Gg: ASbGncu6UD7gmV9IjfHPQNDefJaWfWgwY6hyX1dD3KiyAyiartvSpnikVB1AW1hqfUy
	AcRq/Karxr35jLRtkT8WwdsGa2bQ+OdDeNNCQgNV9Hct3pNVr6c4IffnUhXMICYoRPGJNjytfZ2
	O24cbEJZi726qWsvACG934aXUQ+SElamqzX/Cn5fjc7wUzqM3qL72GoMo8iiTwA2j6XZeN1FPKU
	gvDgoiUYpU0yBpvChJqoWfptrjqlICScKoBCNxvDDBlhvJ7iF2sE8bc3dmmjyxhGBHz1mLGMVsq
X-Google-Smtp-Source: AGHT+IHGMnT9N8ZGhTsEAeR6OgbzNDuNXlwmbApK6j1in2vEtqAFfCzp8m3GGvL0hwmYp3IwlXUEKA==
X-Received: by 2002:a05:600c:a0a:b0:42c:aeee:e604 with SMTP id 5b1f17b1804b1-43668b93b4fmr87670215e9.8.1735283649122;
        Thu, 26 Dec 2024 23:14:09 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4d7sm255443905e9.34.2024.12.26.23.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 23:14:08 -0800 (PST)
Message-ID: <b1e6e480-750c-4abd-9e13-6138c5e18284@linaro.org>
Date: Fri, 27 Dec 2024 08:14:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: qcom,ethqos: Drop fallback
 compatible for qcom,qcs615-ethqos
To: Yijie Yang <quic_yijiyang@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-1-000ea9044c49@quicinc.com>
 <7813f2b0-e76a-463c-91f9-c0bd50da1f0a@linaro.org>
 <f68524de-7a56-4cc6-a9ab-13dbae0ee0e5@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <f68524de-7a56-4cc6-a9ab-13dbae0ee0e5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/12/2024 09:58, Yijie Yang wrote:
> 
> 
> On 2024-12-24 17:02, Krzysztof Kozlowski wrote:
>> On 24/12/2024 04:07, Yijie Yang wrote:
>>> The core version of EMAC on qcs615 has minor differences compared to that
>>> on sm8150. During the bring-up routine, the loopback bit needs to be set,
>>> and the Power-On Reset (POR) status of the registers isn't entirely
>>> consistent with sm8150 either.
>>> Therefore, it should be treated as a separate entity rather than a
>>> fallback option.
>>
>> ... and explanation of ABI impact? You were asked about this last time,
>> so this is supposed to end up here.
> 
> I actually replied to this query last time, but maybe it wasn't clear. 
> Firstly, no one is using Ethernet on this platform yet. Secondly, the 
> previous fallback to sm8150 is incorrect and causes packet loss. 
> Instead, it should fall back to qcs404.
> 
And if you send v3 with same commit msg, I will ask the same. Your
commit msg must answer to this.

Best regards,
Krzysztof

