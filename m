Return-Path: <linux-arm-msm+bounces-8127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 189CF83A9E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 13:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BDE21C21470
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 12:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BAF763128;
	Wed, 24 Jan 2024 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vnOffR6i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CC9604B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099726; cv=none; b=M9o8cEFY9jJ2DYXt28wlIrtTo1Nlsg8I46Wrx763xYUGMwaC2s5MG2c03i46LhyF7ephn+6gbO2Rrfehal6JaLtM7XcgLMZIaNj0/CsOjERCRA4nXVfMOPfLL0Qol23QFJFibLlWTVCmXDmiWxHpQAO7Sy2lRmGHSjhKjR0oJB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099726; c=relaxed/simple;
	bh=c/wbv776yHXlcIjGaa1CUq07U8UdLr6hbZt1Z8dRt+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9pmryeo/Ynh0o8uVlc3zsc6NAMODqoxl3fs6HpUzBQi8s8B7CfEITiqQpKLMXNz9aLPDlFzrCieafZ9oaL+Kr/4rdBDgmZS06Nbx8qGPIFp6/19dbJv1k0LhWPQU50JJ4IN9gH4vHT8Vc8AAx7/YXfBLFcZuDij9Zjb8Zp03QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vnOffR6i; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51013a784easo480146e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706099723; x=1706704523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJmAdCvO6+tFmNrPTtHuSYeZGmOUYLVSRqizHwM/BN8=;
        b=vnOffR6i0VHWTT9Xi3kz3p5WXGJ5U0oRyGZgqbB6mQ9oZoyzJ5lE5UjjUp2miOK4jU
         Vvjg6jQY0aK56xs/K+mVFBvKE30I29jiEcVZt18VroWqcLbxmbVjF2OE8HJ0HZdr65vN
         6qrL/tURLCX6XpLiVXnAc6zYzf8avBHh19ENKPy05/CO+g7fSlcT2C1wtPoOp3t+GD/T
         vK3IBoJUEZOoYlAjeHEO+7WWK8S1y1JMwwCGKj3Gxz4y4NMTfx/hidWq3gm0giqDxPJo
         py55VGJFPRWm4SyW2Y22nKUkhBVkrHAcfHI2LIsW+QCUfrnm512SWGCmFdQf26PQwprG
         gicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706099723; x=1706704523;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJmAdCvO6+tFmNrPTtHuSYeZGmOUYLVSRqizHwM/BN8=;
        b=SHtEZmAW3EnjzHcNlxxyB5udFUR7Jkl5k5iVUXh4DsxW2tLYIveyLtqCG72Yyl8MKH
         /e3VEOeCq0ztOdpvDaS5xOIn5zArFpZ8Cvem/gS19RMuXunzM+Fnq1V8H369Pi9ocWi+
         fcb5iwqCBnlCQFxQHIAM/Gf9A3+qA+zPEO3qE9+juk8MX5Q/dO2tS1FUDr8SBQPKZDMl
         FwfoVdOGqyPxay4dcmS2i3y+LqLWgmGG7Nb1jm/wOqFfSrnWDdttLlT0gGrDyjFkqfKp
         +l9aAximt+YlY+C/kcYvB3AOMYW1RtWiZKs0BfvbMqZCDvDWNj6LoFw7VR5qFTQIl6ey
         Lfyw==
X-Gm-Message-State: AOJu0YzrgZoiI6j8slxEwedusWiSYM6ndQncWhRVn9oiyKrtX0I9pV8R
	jZkasKqm40IgiX6cVnhwzkmwuQ5+V7N6SnMcZnKWFLanFbcr5DojS7S7S5+zDqk=
X-Google-Smtp-Source: AGHT+IG/RAqUc+nQAB0NUWmj2/eeOO3TTTYg07Lqf04FmywtcbDbjvXf27Zz9Ub6B0SlPtqeFVlS9g==
X-Received: by 2002:ac2:55bb:0:b0:50e:76b8:e754 with SMTP id y27-20020ac255bb000000b0050e76b8e754mr1401740lfg.141.1706099722880;
        Wed, 24 Jan 2024 04:35:22 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p26-20020a19f01a000000b005100ed58b76sm207756lfc.308.2024.01.24.04.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 04:35:22 -0800 (PST)
Message-ID: <b52017c5-683e-404e-8165-c393f6224095@linaro.org>
Date: Wed, 24 Jan 2024 13:35:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: sa8295p-adp: add max20411
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240123-sa8295p-gpu-v3-0-d5b4474c8f33@quicinc.com>
 <20240123-sa8295p-gpu-v3-6-d5b4474c8f33@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-sa8295p-gpu-v3-6-d5b4474c8f33@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/24/24 05:25, Bjorn Andersson wrote:
> From: Bjorn Andersson <andersson@kernel.org>
> 
> The SA8295P ADP has a MAX20411 LDO regulator on I2C 12, supplying the
> VDD_GFX pads. Enable the bus and add the maxim,max20411 device on the
> bus.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Missing submitter signoff, but I'll trust you're the same Bjorn
Andersson!

> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

