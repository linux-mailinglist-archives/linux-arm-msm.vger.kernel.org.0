Return-Path: <linux-arm-msm+bounces-43693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A1C9FEB73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 23:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B228A18831F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 22:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85BB19ABB6;
	Mon, 30 Dec 2024 22:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i6p7slpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABE719ADA6
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 22:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735598089; cv=none; b=JjAXMXKkyQu423OQefp7YVv1zCk2rpG3BoYrVe7FuXJoD9KbvFYQrmKfMrluc6Nhz/avAUoYzaNwVNYyJ+SsDmihNqy8TjItIj0+uQ8O1WshZC/JJWWqRuaFgkcipSuuWUPbiSOCDIQPB8H3p3DiDxw6CXkzidugSZcu+72IAlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735598089; c=relaxed/simple;
	bh=LOO1Rh2481JcNYNndqVuMRmZHFmkQrOk9y9yQ01ttTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIG7udEe4Safs2LrNl90Mb0VSDGBE4Mctqr3ojIQ9AQRCQ8JSBkq/URIl4B7lTzFZdNQcCqFonXw+a7IHE4ehFi1i/b//moacL/fzoaxDKVhjVDCgin8lLj6GHn9pdOr67hsv/p3ZRNM5svUsZdUmyUYGJFyhCl/13aJs+O84V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i6p7slpV; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53f22fd6832so10891834e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735598086; x=1736202886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qf+6YUKEAK6RmW0Zawgag6y0Zk8iAO/X5OAFkTK3r3s=;
        b=i6p7slpV5fTlSuBA4Fa/+WgcsmLLGMVZJnjhG1X3qLsYG8dyLMouHS4Tf1sP27peXf
         VyiArQxwq9kPmwJhnFwzSprGl5mQdAUoUsApVAHrhopHU7kFgR+acRqqXYuYHBPlyZPe
         KtpRJCDA70T8iv1Lg3f6r1JY2IXo0XBy/T4MY4s2yBak0mBlrL+RpUkEsZUSVYO+FC4W
         SC5V+K2Osjd79iPPkDguH3JtEkWgWMysgttolyQcuK6jUdeUPG5y3Ahr7MNPqMNKCpdW
         IQtP9DglJTuDbnjv3ugfEDkUs27Y6SLqOAjCY8UxhpYd8Rpn0h1UaM+f/8tuzu8vtAFG
         ONVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735598086; x=1736202886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qf+6YUKEAK6RmW0Zawgag6y0Zk8iAO/X5OAFkTK3r3s=;
        b=YA9ema/MDHqWQYGGqerjQFs/4ihI2thakRSG07LP5ubY3SFYDvgYF34XM1kxgbp/NN
         gZ7/UVROwaTXODP+LXpn1Ka55JOGszu67WBOkIqzARpgwLFJ1zu5/vlWTvbqIECppbGf
         SFOpLnjy9KH6doVEVmFqd7/toW+a7ji6bmOMsfyITpcB6K1+oj7fk6Asc3hgki70rIWS
         jjXz4iNHs5NrQ6hwpsLqsQc49UD2u2HYxFkgf2rNIXm8mAApOwxUAc9acUEAkd+yoXjf
         9eVFh9KwQexBt7JK2rWxpMBvbvfQf3jw/XuU0cjT15n/hEme/YDhXJrdoA0MURtthNTL
         QDdg==
X-Forwarded-Encrypted: i=1; AJvYcCWwzc6SPGOLFF1+Rnl7vbLuZCwGHkJTUUQF8W8z3HnLWZXJ+kKSXL5PCd3N0rKhe4MrRZzUkzKYfbFt+yPa@vger.kernel.org
X-Gm-Message-State: AOJu0YwODNoUytnYYka6oYVwnilBOIDuVBLaccM/OyhwDCqiEqmRxRjs
	Bc4HyHDVJZYmsVsfGXvs81XG38cXlSU6+ZBZ2TNLKuc3DuyKtIOcgV6CYyUrVzxPwyk1mX2v9ek
	a
X-Gm-Gg: ASbGnctmkl5WQw1t4SJNHKZnxc3kkT3K+wVBZIdhTQVQ5hvSJCKLrxFZCuO4tPAafdJ
	+RIgOjbry/pHX2gxbwVecqlzPfpzGOE3HWYYmzA+69RT9mh3AJArnqTGH4raZoHGMAEcpFtmc8Z
	BeieXeEE0OzsyXyz08MgDqFVGc7K5WsI7RXr41hZbFyWbFnSs+Jmoz3ZaxR+yej/xv+Ls0fAJ72
	XufzHG9HT4P8fKwbL1Nu5+YhC/GsfPvH34RiHnll1PuzwjsWJungFk/3yjykwNwJ0CpjA==
X-Google-Smtp-Source: AGHT+IEkGNe23vunsFVznIzhni6Rd6kVfbzGRe+omgR6DEZtQKbekPwmqGHbmW4xitobE7MNowwCkQ==
X-Received: by 2002:a05:600c:3b23:b0:436:4708:9fb6 with SMTP id 5b1f17b1804b1-43668b5e02dmr275300155e9.20.1735598075131;
        Mon, 30 Dec 2024 14:34:35 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43665cd9c29sm349733625e9.14.2024.12.30.14.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 14:34:34 -0800 (PST)
Message-ID: <c9d97c40-d3bf-486f-b348-91ffedeece5a@linaro.org>
Date: Mon, 30 Dec 2024 22:34:33 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
 <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-4-06fdd5a7d5bb@linaro.org>
 <aaead9e5-a978-4b3b-8635-bd8be647ae35@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aaead9e5-a978-4b3b-8635-bd8be647ae35@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/12/2024 19:45, Vladimir Zapolskiy wrote:
>> +            status = "disabled";
> 
> Please do not disable the clock controller, it was discussed in the 
> past, that
> all clock controllers should be enabled by default.

Looks true but, news to me.

Do you have a link to the discussion?

---
bod

