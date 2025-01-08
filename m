Return-Path: <linux-arm-msm+bounces-44426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AE3A05F62
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 15:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2BF23A56BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5553C1FCFFB;
	Wed,  8 Jan 2025 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gTQ9OZV5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737631FCF78
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736348137; cv=none; b=JFZ1NK284K7lL+ZPMr2xQ2J5oPc4sMd3TI7mmoPIVgaPYWnyiTESAEGa7M2XDyG7sZyS6+S9CYi4hbxCRFLNtPcwtDervk2lNsPye71r0kvH3bCagwXpnLWpOEX4cRI4jc4mPmhwpDF/FM7To6eqyIqzZrfus9VeAqvt/lnLuXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736348137; c=relaxed/simple;
	bh=67JK1rlmJtGcesXL4SPQSN/FDXqiuAIio1r2G9KnuLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uy9XXaqF2KV3eQh6g6Z5h5lBRipPNDuKusUnbQ30X1NGLqcr/+cyn3WFx8QAfbPn2xRf4u29iawwyihNCc2Ld6/b7Fn4P/XLV4jlc3v/GxVpPwjC4tdX681wGsD+I0GlTk19AGiNdWjrwkm097PGxHXc8Tgz6xp52nyRWL78lTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gTQ9OZV5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaec61d0f65so280989766b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 06:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736348134; x=1736952934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+O0NMpY6QzRmleywGIkKRE2USypKZLsxBppr3RZn6U=;
        b=gTQ9OZV5Glt4NgQCChHsIO7gTRCxfCNANjgUeGdow3pdDXjJlUQZQBvV2GMGuoKe2t
         30Q6zBXDekFd8Z1h6nI+uFXANA+Zzi/GIfciF7uBIyEbRaRlcH63KbR689EvLKqcp6uw
         BJvCzjcPEfDXPz3JGS2qflBzoNOKc4CkOCfGJPeMJZs8jhNwAhr1Xzm04PEozucDQTCL
         F3xRm6gzgIguPb1W2CASAOe7WNeiwqVwr9aSNQNSX9jCgYNd74b5xV5424lGqu7DzGg0
         BAPqOwsCKGq/O2+3PUO9Gbw/jGolEvG5LUO1I7Zxg7KnWRHT1GtvLlCJHU1Z60T5VqfX
         +mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736348134; x=1736952934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+O0NMpY6QzRmleywGIkKRE2USypKZLsxBppr3RZn6U=;
        b=ptzDkSuUWQWwifwx+FkMNFPny+sZFF9eJQ+wfE58RJUPZzaXI+Cja4KxupBN/rOlQq
         yUi8ZRSKDnyInmnX8yLurrlAePI4O37eBNkaBVsBAfzDO1xT8Nj9Hk4RRzXCNwiMkbxz
         J97FPpE85RMyjQR9zeInezWbwmReWX1JqSxvBbLbvvc7JZHwLhfwDG3Gtx/g0hbrYvVJ
         gp/Ikxe8boMF9WMpAkeJq1/YyehMrvEjyQnZOV+4f5s+rhveQJlig/HcxUOlOSivukS9
         0x1I0OIWxpj0Yb4ae1gp5ZnzQ5gU6uJBqairmMIEwv5ptjdZuBjf5W4wwhQWnd1seWyC
         b1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaixX80aIz4v15c2fxFXB5Jvn1CMhrJ3BdXHzcvCYLxor+0ZqCViD8gKL39VMIsHSZ9SbP4jVBMf1WTsXz@vger.kernel.org
X-Gm-Message-State: AOJu0YwUd9KhsWZp1FGdYLwCR7S/t/mLmPmtd0SPTs/wCG7+33pduiQE
	Eq/9gOY9vRTHnKwZZPL27M5kPI5CmwaunlPkiJh4p9kSZdVIJKptwjGMP/JI08Y=
X-Gm-Gg: ASbGnct7UD0+ZCNpa91iUwkfts16VrKj1Cw1c2PxoP9tv86jQkONHg9dKqKD5jWo75S
	IzdEtAOkzUy0xxkWRFiw6kY8+37wrJC35rvZenL26an6+Sv6CM9aed1gTAMgEav2wW68v2ZcKg/
	3FaKbaEdWREMy9t62GW+AkT4gcIk7bTvHYtmRKFtMeTjiLCnoQRK8h46/crfhw8zwxQFIk7GogP
	c+kN4eCltdvlklx9qD1YicIa431MvWUo08xbSuV6xnf8sBSWqjs6J7xA/K6yqL8jt+z4liGSeu+
	FoHNVvCtaSIR3mo1kXHsOBogOqIiUExZc4sBZOw=
X-Google-Smtp-Source: AGHT+IFnWVoDQuHcKTyFxi4kBSfHYu1d60lV+zwr2XqYC5cBIMfaq1XRcTiYwNflIFjII+AZubU8Uw==
X-Received: by 2002:a17:907:7e91:b0:aa6:4a5b:b729 with SMTP id a640c23a62f3a-ab2ab6f3447mr256057366b.33.1736348133620;
        Wed, 08 Jan 2025 06:55:33 -0800 (PST)
Received: from ?IPV6:2a02:8109:888d:ff00:ca7f:54ff:fe52:4519? ([2a02:8109:888d:ff00:ca7f:54ff:fe52:4519])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d983a172d9sm73309a12.57.2025.01.08.06.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:55:31 -0800 (PST)
Message-ID: <fff03f10-7e87-48db-8e8f-b06a47d4545f@linaro.org>
Date: Wed, 8 Jan 2025 15:55:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qcs9100: Add support for the
 QCS9100 Ride and Ride Rev3 boards
Content-Language: en-US
To: Konrad Dybcio <konradybcio@kernel.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
 <20240911-add_qcs9100_support-v2-4-e43a71ceb017@quicinc.com>
 <dc1216db-128f-4cb4-9df9-ba095dfe713d@kernel.org>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <dc1216db-128f-4cb4-9df9-ba095dfe713d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/09/2024 01:32, Konrad Dybcio wrote:
> On 11.09.2024 1:10 PM, Tengfei Fan wrote:
>> Add device tree support for the QCS9100 Ride and Ride Rev3 boards. The
>> QCS9100 is a variant of the SA8775p, and they are fully compatible with
>> each other. The QCS9100 Ride/Ride Rev3 board is essentially the same as
>> the SA8775p Ride/Ride Rev3 board, with the QCS9100 SoC mounted instead
>> of the SA8775p.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

I don't understand this, if both boards are identical except for the
name of the SoC then why do we have two devicetree files?

You can surely detect which SoC is in use at runtime if necessary, and
maybe pick a name which doesn't have the SoC in it if you really want to
avoid confusion.

If there are differentiating features which will be added later, then I
think this at least deserves a comment stating as such.

Additionally, the files should be shuffled around to better represent
that there's two very similar boards with just some minor differences,
this is a common case already and there is a standard way to handle it
(see e.g. sdm845-oneplus-common.dtsi and
sdm845-oneplus-enchilada/fajita.dts)

#include'ing a .dts file just seems like a mess here.

Kind regards,

> 
> Konrad

-- 
// Caleb (they/them)


