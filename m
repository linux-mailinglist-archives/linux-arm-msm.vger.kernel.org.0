Return-Path: <linux-arm-msm+bounces-34142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF799A874
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 17:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C08AA1F248DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A746A197A8B;
	Fri, 11 Oct 2024 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvIJ+h4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E9E196C7B
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728662166; cv=none; b=YR7aIexPysueJm0dAfNZFy7cJ+cP8Eg4dB3jFJyIV+9T3tVwNRh8c7Av4nv0sdYGvmzeLTdlY/TZqoWU/UjnbgUhm26ly9M5z5ihH3EsMLFAx+ZiOUa6ppdd4o3NCKv+OcEQpMuoMTlxSmnXEnHiDQiuObf1uR2nPnD3D690HyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728662166; c=relaxed/simple;
	bh=LsUiDqE70yqk0wdXE9vzO9KMm+m+jk5+g+imG3e20Tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nu53tSb0+bkeJz2Es8p0oKAjwQ8vEDAaQCFk/MR29qWjBeA68ZeYgbNw9kOefHUSy9zHxDiJ7B6S7c5BKAuzwEynwBvP5pTw6BE4GNmlQz6NCY5ctzMfuOEbluNzwJiGsYF17Tnn4lvlfiUbqNQpEObtBoPoHZiW4DET5+6QsvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dvIJ+h4k; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9952ea05c5so339974866b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728662163; x=1729266963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PfW3zLsODNqT+ZCd7YOmFJrDpIjLjC2uBGbBXhUbVQ=;
        b=dvIJ+h4kdtOecCVkAY+GosDDnCU4bYWL2vSj6C5Q5W+STl+plaQSW0LRqP3OvH5Qiy
         Sv4ylTftMivKObqpvMebxFvCr5AyKu4Y0+nTw67H8g2ttb1ikpJZf/gOMc67D3fU5Ete
         bwHN13PMTDksIac9QSqAHJ40KYsMB72/DYEOdpD/EPl1J6VCF6bJa4lXxGHoAXI8evhJ
         rZ8vuU+d1MhcSy4SBTnivSFZl50u4uVWpp240GUilmA66hMYp3hDZ9bMNBM565qvvhTT
         et1Lrs1gf0kUqSam2mXCJpzBTrpQQwgLHscLhpU75eOJtNs6r7Wuc5CG6JQRfqyGoE2S
         ewcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728662163; x=1729266963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PfW3zLsODNqT+ZCd7YOmFJrDpIjLjC2uBGbBXhUbVQ=;
        b=I0IF3eVKkKMrRpYsSKDLyZIwC6OYaLPP6WkBgoYnoj/3JkBz2NsqDXET9NtgbqvrvH
         fuQ1iQRpB26iWaDKHrDZWaVXmOP4w92Ad8wOtCf+JoTvMzEbHhgT9ApZynPkfqKdnW/8
         o2vr1moezJWv/sAa4LQCJuGFqntKI+E0dKDcXjEG5YIijU6Wny701NfYPC4N/aveHDh8
         KKvZ2Qpkbz7OdyN8gRw8wk2UtJka6BSWms8t+1EnCK+XoFw7nZjQekdEQqZQ2c0JtYZk
         l49EQJxR89bgBi+1/kdWK6YJI4rZ9VM/7mxAkJQXCxNqh8TV0/kqfuV2URFrjQdU5fxH
         /JQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8Bd+Pgz2Wj+g811xzZV6ySx7KLOq6/76a/ywJLlSUVbXPo2IYjnaHVUDbCH0PYWUFMoDrSOOeacBcxsR6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4+9Amm8WnVsngQTfCdz/DDoFbADx4fJaCHaL+RTjMX/8vBg8x
	t8XGmNEuXMBC8QqGl4tpfFVsEo2x1U0r1buqLzbpAtMZjvhH4vwMiK0uEgwrZ1g=
X-Google-Smtp-Source: AGHT+IFQS1m801d5g03nI5rdOrNbnaMx/maIW2bSzuFKOe+q9KSROKeUZyTkJ940EzDY635ITI12nw==
X-Received: by 2002:a17:907:c7e1:b0:a99:5a40:e6b3 with SMTP id a640c23a62f3a-a99b9416b43mr268365666b.10.1728662163310;
        Fri, 11 Oct 2024 08:56:03 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80f2726sm222412566b.200.2024.10.11.08.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 08:56:02 -0700 (PDT)
Message-ID: <a796e8ac-4a58-4b14-94ef-cb1d5a8775b0@linaro.org>
Date: Fri, 11 Oct 2024 16:56:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Rob Herring <robh@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com>
 <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
 <a230de8f-a11d-41c1-9bc6-7e06e850b51d@linaro.org>
 <20241011144129.GA2295617-robh@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241011144129.GA2295617-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2024 15:41, Rob Herring wrote:
> But when a block is changed, any rule on sorting may go out
> the window since we add new regions on the end.

Ah I see, I didn't TBH know that.

> This one in particular I have to wonder why csiphy is not a separate
> node.

Hmm, to be honest with you Rob, even though I realise I'm digging myself 
into a hole of yet more work, yes - we should probably structure camss 
along the lines of mdss which has separate nodes for DSI phys.

-> mdss: display-subsystem@ae00000{}

We have 4 SoCs "in flight" at the moment.

sdm670 and sc7280 don't require any real driver update to facilitate.

sm8550 and x1e80100 do require new VFE, CSID etc.

We've been debating how to model the regulators for the CSIPHYs too 
which are on rails supplied by PMICs external to the SoC.

I'm congniscient of the fact 670, 7280 and to an extent sm8550 have been 
on the list for quite some time, so I'd rather not push 670 and 7280 to 
have to wait for a whole new way of doing CSIPHYs - especially because 
these are old hardware with little to no driver change required to support.

OTOH x1e80100 and sm8550 already need development work so we can do the 
CSIPHY transition there.

---
bod


