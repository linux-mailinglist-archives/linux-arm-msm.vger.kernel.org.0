Return-Path: <linux-arm-msm+bounces-54578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8322A90FB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 01:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E89B6446D3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 23:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0486424A045;
	Wed, 16 Apr 2025 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XjRW7+dq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3870024887F
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744846698; cv=none; b=kt5gNDlQYWP9SwDSV8WnsBGkvrpI9lRrFYnFhvkPz+ieyFY+7UDXCAwGDdDg/mVQ3ZSAzISzFZTJ5lDsR9Htkhm7PJuIfWInsPeDsxkArta87Y9ky8+5dxLzWdoI2UziC31grwPE0R+U+intEJIjiVTyQ+ab5EoeNcystcDrLis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744846698; c=relaxed/simple;
	bh=g2QVmNXl5Ww36gdjvP7omDNKUjJYLG1PI+JsXbS41KY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dK89W/P15aD4R3tWmed80RAZAKLLwDmaqPCq/4s+kjVr2HVXv7Iw6UJtQPMFNwZoe+bYt/MVgno1vqzP+BryMGM3ZEKGSlPbTD+OxHP1nGvCqPYKx1QD4xkMnwMCgd5hl0I+YDeFLvKTnujgXUIipkfiQRAecsgC9x/7oqCT488=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XjRW7+dq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913b539aabso101570f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 16:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744846695; x=1745451495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2QVmNXl5Ww36gdjvP7omDNKUjJYLG1PI+JsXbS41KY=;
        b=XjRW7+dqsrRZDwudHxlHPFTL8IHBjtpqdRlYHHHlTUNZVmfG8cS7zrRUQ/MlsQhyV8
         MvKRLKfIflGU+LqJA3g1olm2iKqYVx8qyMUkK/K5nLR18urm8aEaouSEKZcUgQXemDAa
         MIcmkKfZOumhO9zZ2X84hBNjfW7PeKbURTuucGKtt3MVVT4Q2ApyA0A8DXy3Kuac+YdJ
         w20vtotm70rXZjslAzwCiN2zuGXd0yvETGf5bkWMoczt9P8P7VJu6piYdjEC5ePZCxN/
         fECmeouAew+T5FEKwn4ke0N6pP2fYJ/KST/X8QL7BEwJZ2E2YrQzGiVF+0YQVQWb/XGp
         fbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744846695; x=1745451495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2QVmNXl5Ww36gdjvP7omDNKUjJYLG1PI+JsXbS41KY=;
        b=or4fE+MXagNgOUFVRYxRA2c1Pkz2lP6PooNYulHIBeaxVSPvgHzU2zl6o8ctGi1DTc
         5ICNYz930+OhCLikk7gExZsd57/p4WOn3U+EolNVKTNjdoGDzDRo72ZT68g21t2GmrbQ
         xwd25FYs3JHnxzLPzMbQSAtt+EgIVTo4CZRX/kzixMSfRrQ2AwbHVP8Lk1hbqVPYdLrc
         2nQDzGJbo+CnafrVyYqzgKnLC/jeXGV8x8mkkjvrdkQVetgkBSP34TeJGp0/ZCscTzrj
         ENN2SN9cqkbmf4uDedq6JkoowMKgXD0g00ZAyrACpp7+vEsVFy/1Ipix6X8wJlsraf5G
         g3nA==
X-Forwarded-Encrypted: i=1; AJvYcCVo5BPvH9ItEpMv83yGwDa30Lfg/IXaEr+p6FmXFPHZG9McGsUSF9M0IaxpNbkdlJ/U8hhEjfpcyQBOnOWr@vger.kernel.org
X-Gm-Message-State: AOJu0YwC8y3nw572VGv1tOZFFDnbJetsxFSpR4iuJibbQCQprLvjLRPT
	wMqhJPbmlpg0Db7ixnoDFuzwy9J+02roQ6BJFyIOB3FoEhbpDM4C8eUOjYzJPanDDC2M5CBa2h7
	eVH0=
X-Gm-Gg: ASbGnct6QlZoREFCF2q2CMfNKKZVHZ7bwasvNqSYY6FodWmtmfcDU3XJe7vAuErNH7k
	GWoUSKRPIaqJG9WXfjNygMP63AOX9VMUyThdPQmQOhYvJd4rmq8kIF63pnvAKcxaOHluMd8UTDi
	0uMFe9Siz6A1y7iYqqYmxpPJoe5b/IQBAg+DDx+xF3RcHiQ6qN8A4qPW1wGnfZJEpWIzpKdxlC+
	grAd6IGP+KDkhuGYPhQXNfZIhaNzGAZjGFxx0chdWEGibPUPXjaAnmzBD2JKHtWVefZz0/CIFEx
	STqHSD3a3/nuekXxls9TZfgOMEeuDvHdStBu7FOr5j9eXnA2ufcAxotaUTbO/GNqUM0n/h7c3d1
	DFldsjA/E52iVB1e/
X-Google-Smtp-Source: AGHT+IEsUGhnZeo6N9qyRuGOXeA4IIrbhFbh4yfkkwI9r1JHh3TkDWmK/o+1wvxvOJUt+CJZWV6UZA==
X-Received: by 2002:a05:6000:2287:b0:39c:2688:6edd with SMTP id ffacd0b85a97d-39ee5b16f7emr3483954f8f.15.1744846695474;
        Wed, 16 Apr 2025 16:38:15 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9640fdsm18172312f8f.7.2025.04.16.16.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 16:38:15 -0700 (PDT)
Message-ID: <65051936-2b8f-477b-89b8-2c14872c31f8@linaro.org>
Date: Thu, 17 Apr 2025 00:38:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
 <20250416120908.206873-6-loic.poulain@oss.qualcomm.com>
 <c57084c4-189a-484f-af2f-8e4181f547fb@oss.qualcomm.com>
 <CAFEp6-1iUapOg3DU2+NG7q9E5EPgwBuNUvpgLJL2jWKT=0SOkw@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFEp6-1iUapOg3DU2+NG7q9E5EPgwBuNUvpgLJL2jWKT=0SOkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 17:16, Loic Poulain wrote:
>> we also have a pair of TPGs at 0x5c6[68]000 - I think it would be good to
>> describe them from the get-go
> If we want to be ready for TPG, we may also want a camss 'top' reg
> (0x05C11000), since it seems to be required for configuring CSID input
> mux (TPG vs CSIPHY).

There's no harm in including the TPG in the reg list.

---
bod

