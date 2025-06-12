Return-Path: <linux-arm-msm+bounces-61073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 396EBAD69AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 09:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF5616CE00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 07:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2105F21CC6D;
	Thu, 12 Jun 2025 07:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eBktUalm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4785586342
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715044; cv=none; b=dfOxhzKqG0Sb5EtAp5BNK+khc1jKP9ToPtqYaIp7RfBW1cfs+/2xnhmN1rsstPWr0eqZ8PZCclAf6T1BM9FDxxA/L+UKvf6RX6wrw5ulAabEm4oGMKyTJg7Oc2QM4S/+JQ9q2wMa5k+UlLqD789WMSjwPH8S/yG1Re571UOwdPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715044; c=relaxed/simple;
	bh=B3iRgb3/okZTBArjeqbZVw5ekxMbcSQohTZ/71If6do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BI/ffZLjKULcpAV7cZw7lsKbyR67pWZAtlueeF75qDECWFxIw8/G3zHWyy9nuFy3dKZpmc6r32ZlJTBDQ52fISEuwkLRpnUi8onWL6+IFQGrKWae2b6wKPIqViVgd9vC1Y0uAepN7lefQQpdPmy4XGygk1VhpGrPmuoWnX0eIOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eBktUalm; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55342f0a688so36781e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 00:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749715040; x=1750319840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Njxe4VDeQqskl8RbbDG5OxTyzSOM+gRWrkOl+amVxQ=;
        b=eBktUalmwexAvppsCdFpQRWjEMfwgwjuLNzVqW2lH2eZFA9z1Rw993iHcpcfRGxXdO
         2kdX6UjeqpiHYoET9Ka2oCJ5NvGV1pXa0DPvpr9sM209jmpZZDryK5IDotQ5D8YL128n
         ZmTlfn1z57kEBlw8mooGX3ONedqYipN+UMEDzxaIicQ4QA5hJEVHdiRgfmNjteY2mo+A
         9PH1JHBKylcrlGzkSiNXL75D/V+78YGU8aDf7FH4z00McVUO+OoLu7LTcn+JroOHKuQX
         TT3OOqD9Iylylq2OmKGH9eg+je0h9Ubhx8umzlPGcNRJ1s5tFCZQtmYnMt2/1rY0Qd8B
         ih9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715040; x=1750319840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Njxe4VDeQqskl8RbbDG5OxTyzSOM+gRWrkOl+amVxQ=;
        b=BjlD2JT45ln5ID1rBGhrTu1ggags8pOLuNfZzQUlzc5w4GrIXjJIjVXePwU+o/1f4p
         CBkSy1pGGjXG8fkq+vav92NRHrUxwsBxF2Wb/v9ZNBVJbutcH87B0pS1iCPIovqLyHZj
         XvQEPVSZQf/syxaXXxRcliVcTZFnIbPw5g++XS+DO4D7pofRKPChFmWinIxfp02kpoTm
         OCffglLpE+NXIT+djQVvSxTxbQtMGotglRoCa6VzYEx5tUDWndWJAVjsrnvFWdU3MGoe
         LtChmpcX06g3UwXHjEfJeYQjz7I9kwxBUenatT+P/Ccur9HVbLFSwcR7GjM6q1ytOpFQ
         lc0g==
X-Forwarded-Encrypted: i=1; AJvYcCVP3L7BI+yq5HbXHX0Lx0BRIEizGpHT9XptODQks8mFaoevFLjp7K12Vbb35QtMfsnRLBqvNqzniMH/hf/B@vger.kernel.org
X-Gm-Message-State: AOJu0Yxeo48Ur7QdQ+4Mr6W1EeYjU8kap3EhQP+ZhGHKZWIhjoNlWYjW
	UmPrKPygbRPIBSPD1ve0JztWH/jvc8SXxBYcgAtFD6GE0UoadASaw9Hplj6uRpx99io=
X-Gm-Gg: ASbGncsGVuC9LHso++TFOUktr+XpXrm7WdTXjfNAAm3R4uiNsItKDkvSFTpEfZHiljT
	R8xvr4EshllmcSEbfignyiTlLhZgpI8qPyqb8kn5DXk1+avX6dmcofEvf0FFi3CsQyfl7m7hlTn
	eZ8C0YZn1M7sZVTrE2YRVBjMFnTDsMwW763XFRrmNUyhuDXkNFLU4Bc+OihSzC6/BSfmrw80YkZ
	U/HdnrfDuzGbNJ6MolmjeV57zYHb0WTmn2QGmz7lF93+4RtTW4iIlroX25x1EA5y3zVjX2wluX9
	DHh+1jC63V++y9PjAe661PBqnIlEZqKlZonuNEu6MMDidkWLv71yJtidHGg0haXBmyCMk+9HCRC
	kxncDhBHOUsKQexuzRM0nxmfY/KIU1Xoq8M5CZP4k
X-Google-Smtp-Source: AGHT+IFHU/lXepzUTc3oxGGH3lT2WQ6xjtIivg7J8n5iJaf2/KrDDzxT+FW1Te4zVmqO5ogpYbzlzg==
X-Received: by 2002:a2e:b8c9:0:b0:32a:bdc6:a741 with SMTP id 38308e7fff4ca-32b21cbc160mr7056691fa.3.1749715040347;
        Thu, 12 Jun 2025 00:57:20 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3304f2e9sm1360191fa.11.2025.06.12.00.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 00:57:19 -0700 (PDT)
Message-ID: <9e38a09b-1521-4196-b179-d29c62e143bc@linaro.org>
Date: Thu, 12 Jun 2025 10:57:18 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI
 C-/D-PHY schema for CSIPHY IPs
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
 <6e411e89-ce1e-4d6a-8d48-b800554f830e@kernel.org>
 <e02cead0-665d-443a-a884-c3a307409c66@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e02cead0-665d-443a-a884-c3a307409c66@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 10:39, Krzysztof Kozlowski wrote:
> On 12/06/2025 09:38, Krzysztof Kozlowski wrote:
>> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>>> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
>>> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>> RFC verion of the change:
>>> * https://lore.kernel.org/all/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org/
>>>
>>> Changes from RFC to v1:
>>> * moved from phy/qcom,csiphy.yaml to media/qcom,csiphy.yaml,
>>> * added 'clock-names' property,
>>> * removed SM8250 CSIPHY specifics, a generic binding is good enough for now,
> 
> 
> Now I noticed this... weird change and clearly a no-go.
> 
> Device binding cannot be generic, so it is not good enough for now.
> Please write specific bindings for specific hardware.
> 

Can I add platform specific changes on top of the displayed generic one
like in Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
etc?

The generic compatible is sufficienlty good for adding the enhanced
CSIPHY support to any currently present in the upstream platform CAMSS.

Obviously I can rename it to something SoC-specific, but then a question
arises, if a selected platform has to be a totally new one in the upstream,
or it could be among any of platforms with a ready CAMSS, and a backward
compatibility is preserved by these series and the new CSIPHY dt bindings.

--
Best wishes,
Vladimir

