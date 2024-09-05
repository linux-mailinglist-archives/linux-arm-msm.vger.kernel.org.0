Return-Path: <linux-arm-msm+bounces-31023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F98C96E479
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 22:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3D801F235B1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 20:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895BB1A4F13;
	Thu,  5 Sep 2024 20:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BjNVh2mr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0B4188915
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 20:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569628; cv=none; b=pzyvX55spqNPrn0nfX5mogGW3A/ig9LDBpECU2H2QzDjnRIIdFpiFa3k8RQoIoEuO0+s+y5eIp2JbqtjmFlf/lushzZuE2iVPoboVtkz1kypiDKCOfN/iCDQbs6HwM2kUV+Mdq5iGNsL7WMH0DB2ybA9c6LggIfHPMxFcUCTUBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569628; c=relaxed/simple;
	bh=okpSZJ457TOGrWQFhXOsHpza1OncvzJlnkagzXGr9sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bK8qJ1nWxZm1BPtdM9Fs1JQA1w16zthg9sa7xVXhqJZRCzUTZcCTlj8cuu289XP8/YR/+v8cCwkv8NE4d0BQJYIhkNWGXdDfJNH54Q65nfEAB+4aMAflkoZLTNsyL7J9z2V/yac+kzHi9nEiguUUOyRB1jbnvpEJ4BapS4bC5EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BjNVh2mr; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53654d716d1so122099e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 13:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725569625; x=1726174425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nsgr1R8IvjXIPpmmwD+8IYKOWPeLr0RTzjyAwlJwjxI=;
        b=BjNVh2mrTM4kWiFl9gRX6+hdIguxhEvLYiuJjo+e7nw+BtYtpF2dHdHAVHA8GoVqee
         MbJQz1brO6A/hzZ7+evFBKX7zReY6dcO0TzxKQRtOlezMe8xe+6dt+r2xZ3PgVO9ohwR
         Fi9wZvl2WksybE4E05cxoaa4zNNLqsb2CSHP2nD1sCBUH6zkqGVe0iUSONMmk45FxC0r
         PeeSQsjzNdozzU138fpckLWnXxYLDvP59wYWbwMzzf3Xw5WefwjlsWiwxKy0lbPOFqAY
         203YG/xkODmJuuqYxNV1V2Xg2/6l2oMis6oOB99rO9kU/3Gabe3q6bVVv6mIf19g6iTF
         voIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725569625; x=1726174425;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nsgr1R8IvjXIPpmmwD+8IYKOWPeLr0RTzjyAwlJwjxI=;
        b=W2dxFBpehgrDM83lU6KSKk+XJt6gzsEW8UYIG18VRtGMymTSrO3T0C1cW+okIX11Ga
         hRPTRzGhWd1UQOSRkTN0Y38v5nzmQMZ6CnbBK0HS8N6x1NlDxhHywwfVc5WFomkGoeT4
         ybt3cCpsD9A3OvL53jQT4YmFB2TtPeF+8H+d5s2cAagtgM5YbUjKYpOVnSh0VnC28uAC
         upWO9kTm/1kbGsjLmLQpmIINHV5VB0fpHkbiwDiAstkhz1A/eGRA68bf8LQQOZ16KeZI
         RvGDymO5hfG42qr34oVOVTKP2Mj149qZbAKwkeXk8CA/Vj7fjEz51dNn0LNfWycVRi6p
         QYlA==
X-Forwarded-Encrypted: i=1; AJvYcCX5ZExthjNiloXD1XCKAUOb5PPPUpHQlwWLGdeJN8kJpJ3TlhYNn0y8lySFbpnDmKnadFB4XlFlsOoGenE3@vger.kernel.org
X-Gm-Message-State: AOJu0YwPJUCPkmR6EWvWlzZbmnYNuRD7o+3n0BNYDJrQQd+qlUcWp30A
	/OiNTWIhowvL/2zCzqUNRHuQUbfPDMoek16BOWPCJxWK3pX+dyvMCNuQ12ebZ64=
X-Google-Smtp-Source: AGHT+IEO4KLXvOMoYHGx7cz+dmpyOoozAeB+4C+XIlp9W2jhjsnqyJ3FcfgbBB1A5mVd/UC9qlSOvw==
X-Received: by 2002:a2e:b8c7:0:b0:2f0:198e:cf8b with SMTP id 38308e7fff4ca-2f751f3ca74mr1464501fa.4.1725569624887;
        Thu, 05 Sep 2024 13:53:44 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f7504801fcsm660731fa.121.2024.09.05.13.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 13:53:44 -0700 (PDT)
Message-ID: <1d04e38d-23fd-4646-acee-0d306efaa756@linaro.org>
Date: Thu, 5 Sep 2024 23:53:43 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add SDM670 camera subsystem
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
References: <20240904020448.52035-9-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240904020448.52035-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/24 05:04, Richard Acayan wrote:
> This adds support for the camera subsystem on the Snapdragon 670.
> 
> As of next-20240902, camss seems to be a bit broken, but the same series
> works on stable (although it is much less reliable now that the CCI clock
> frequency is not being assigned).
> 

Second that, please elaborate on "a bit broken" camss.

Regarding the CCI clock frequency, it's a supply clock and it is kind of
unconnected to the CAMSS driver, here I would expect that some particular
clock frequency setting either works always or does not work at all without
anything in the middle.

--
Best wishes,
Vladimir

