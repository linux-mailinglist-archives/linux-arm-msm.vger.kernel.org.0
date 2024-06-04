Return-Path: <linux-arm-msm+bounces-21587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C96248FB192
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 13:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AD761F237F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D73145B25;
	Tue,  4 Jun 2024 11:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltt3rWqP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17FA145B0D
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 11:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717502281; cv=none; b=UQ4X1wsfc3DPVYuxga5kV4G0XT3dFYXh1phGp1RI0jrOCgMg9+saGivIHbGHLh5aAlmSkANmw01Y/Bd4zskfUvyDl8Z/seesMCcYwQNYWcf4jesx7hoLT9Q8sBkDmuIYDKhW8RoXPpQ3zJ6v7egNjfWK3GTVqP6XycnO+spZCCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717502281; c=relaxed/simple;
	bh=LuwgEB5a3kXQNdLEh/pE8qVHaYw/nNGMKFNOSKLHroc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DmnIglut76p4ysQiU1Zw7puI7chGnMz0uwn2H4PwZlJWvjNKLl9K0K9+/x1vi/PKDhYK6GuLGaWmD5j7KA1CZ2ofYtLpd5IhPwSJ+NuQ68+9ZSOEiwoCC/vDbkE47r2KK1Hyu+dqkgz73efQriboMBMk8X6Rl4VOYp5Ub0Hsul8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ltt3rWqP; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57a2f032007so5539935a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 04:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717502278; x=1718107078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQkcalWFB/tO1n36hfQeFTDEbW22ReDZ8opgR36JZAk=;
        b=ltt3rWqPxJsl7EQ9qPMphtffZpvZDCX6py/oCC+FnOjDXZYffrbxvfXfLA1iZ/Mh/V
         rCIk+gYDVY2s9GoGwnIRJXGRaKfFtA2VL1DTNLAkqXKR69ONxpGTqN1s6rCKQdaLZCXN
         ga6NDHXKTlzN1S99gopp7jV5/+cyYdv9wSCwqOY2U1D/W9KiOoUm71xRsA8mRXksh3zC
         TABDGtfSviq0XauItLXtEgO2/81P0QRyBSa1BwrXM2wE30rFBsL4ygxRDnLqIJpXmbhp
         QzZPstRcx25xeIQ1CtcFJlw9QfNQYNebbyb/jdeto+fmP2oaDVVxH7EIdlyWcr8hYmfH
         m1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717502278; x=1718107078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQkcalWFB/tO1n36hfQeFTDEbW22ReDZ8opgR36JZAk=;
        b=xDoj+aXJMjTjeUdSc5GnTsUIefb8Qn5ATvaSitYwiVhrSKiOFcYqpb3t30XyVrA1cy
         Qa0rYwH1sfZ4T90VEFdko7A4FAZGzPo4IpJjO8d2y/hFTPL2tBN0kDli+mtoWD9gkyBJ
         CekmANAJTtZz0946mGbfWqe6XSv32mxdh7M/Run5J7swtKojaF2zAMEdp6zcblf1j89p
         jeQSwjfDXtq9W0BrZv64lp8n3FkT80Iu82+7U0t9dKp8kBZzPT7Zs7joLWbhAUWNczJL
         KG9HV9a7f44YfxQlWLn7TPsZZie/Wgk5t+OIjL+QxAXpH3P7VvUCS4krZqA3ilZ0Kzo/
         /UFQ==
X-Gm-Message-State: AOJu0YwkW/4HRpGxoL5jfjWLybPplG37cj5ywaDrTMPmUzHaF53NgYzK
	aOuLOG5Gs8XxxNqjoTsrWjFXSemVugHcFJVP/YWPDQF8A4wteGDUCHiR0fsJbc0=
X-Google-Smtp-Source: AGHT+IFAVJky5swX6mJN/qK/exrK+BQ+9UDGMdrBsNovaqAZWpEAU+TBu0YcDuQGHG37JOyW5PVX6g==
X-Received: by 2002:a50:cd59:0:b0:578:5e09:98f5 with SMTP id 4fb4d7f45d1cf-57a364abc46mr8067367a12.41.1717502278225;
        Tue, 04 Jun 2024 04:57:58 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:a035:2af2:8d85:1f72? ([2a00:f41:909a:a11e:a035:2af2:8d85:1f72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a7f1a4d7esm1384634a12.68.2024.06.04.04.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 04:57:57 -0700 (PDT)
Message-ID: <4064c207-bf98-4bb9-b3bb-e291f2e95f8d@linaro.org>
Date: Tue, 4 Jun 2024 13:57:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Correct IRQ number of EL2
 non-secure physical timer
To: Cong Zhang <quic_congzhan@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240604085929.49227-1-quic_congzhan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240604085929.49227-1-quic_congzhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/4/24 10:59, Cong Zhang wrote:
> The INTID of EL2 non-secure physical timer is 26. In linux, the IRQ
> number has a fixed 16 offset for PPIs. Therefore, the linux IRQ number
> of EL2 non-secure physical timer should be 10 (26 - 16).
> 
> Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
> Signed-off-by: Cong Zhang <quic_congzhan@quicinc.com>
> ---

Seems to match other qcom platforms of the timeframe too..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

