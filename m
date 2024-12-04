Return-Path: <linux-arm-msm+bounces-40242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0F9E3A13
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 13:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B762A16601C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1361B652B;
	Wed,  4 Dec 2024 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PQ7+584v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883281B415A
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733315854; cv=none; b=pyxkR0+Hhn+OhoxA6ZksW8sIc3O7OERlHfR6ch6gmg0mv+eQfVLmA1x/rTLVB+3X0HInmr8BdwusIvkBi3gje8tLjnqApBpsh5aeryL8WJC1sV3rHPi8+MG7AyNmk9vmhilNVdU8inbrpWvJQQqQDjWQze7QpMpGtBo4jiTTk1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733315854; c=relaxed/simple;
	bh=f4JdU7Rzzmj+R1/OxrSn7f29PwCd20slBxMMB9kdPKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kZR6SJemz5rWKpQx9eiIl27p/KVrlz3yGHt2ZquqffZlkovcP0EL5/S6vwFuFqNSC+CZZ0AxDzf2WmddqplbcJGzmhJlU77vbdpc4F9baaRNrxtBjVcVt5tksX8HGGzNNMLf8xCo+nmcCs8N88OhEZvoQQMLaHdLzN0sp9LzSnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PQ7+584v; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a7cef2e3so6828225e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 04:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733315851; x=1733920651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qn3ZnxaGnMmpvUaH/GWWsPm6fs0ctmSrJSJyOBSwzM=;
        b=PQ7+584vap2efqAj383P/ocERXP5pUqCVX37ySM/5PH4LNUSQIB5LGPFlCgDfTLMj4
         UGSJ5IcAsCxarP0dv78ry1H6KOR2MtcYA93RKAk2CCIuxJl0xLXe3f9DFEsTMQMUfEiE
         xCnsASuTe7PCCcaw59WSNEFCj9EDX87IdYgFxpZLo5LBsRzBZzAIGMoe7QjcAbcQrYDu
         N9v2k1fVZ0LmxX1DPgWbO12NTbqpjbcvrAo3YUN47GOr6VTj5Q1kUNkau52BTk7W7gAS
         jJ68aG4SK3bPW7TvZSNRcJ6BTu2wB+qFWCO4i17t/M4dKaYrEvz/7ecTQLO34HV/OlEU
         ygBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733315851; x=1733920651;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qn3ZnxaGnMmpvUaH/GWWsPm6fs0ctmSrJSJyOBSwzM=;
        b=FcaINWNBSieb5GlVjvICc98n34j2hRlcC5ZsOo8Mo32ZdtFrcPL9ChAZLS6HJCoklQ
         wjiLgn7ft6EXTjyNhETyjnes6yDSts9CFkAdB+zlLk+XRkQ9TH1We+/la11LeDpwcfr6
         zrHe9kMVZhMV5BpE88xfLT3GGRYy1G2WLjflw+Sj1aCrskEl0uuphPemAPN9MpsF7wzt
         4jGlXxj/3tEUHFa+mX8ntUXxQpW5jLoXVxyk/q4WKnCTNmIgIGkDoK09yxFdrOvD8UXC
         wzb83RyhRITar0nBZmNJDbEzkEO49NZasyGdefXOCRUOWsV1J20IYRvIoRvM1Gboa4j0
         86OA==
X-Forwarded-Encrypted: i=1; AJvYcCW2N3gK8i72XuJ3fIR5vZFfW2PRpAamiY6Hcw7nhQKM5leTWolsjB7dh9NOlfgcAmVhCawJTSoGaJaxxRxa@vger.kernel.org
X-Gm-Message-State: AOJu0YyzibjLAYl/agsQPJKpNl1XgvYglyleycYyqKNTw/tuUplr7gCf
	75eF/18yK/f1XlcoOBaEvysT57OFfGg4cmYi5uX43zBL9nKeEAVq9SGWJQB+W/Y=
X-Gm-Gg: ASbGncsDeX6/G2BklFSUr+S3+6eM8tOZVoxdx/v5/JPFgaHbdolfkE+TsRpmTRa3SRW
	VKMBz7T1g2XxogCS17DXhqffbOKEeV/zDNOw13kQjBhwGV3maNpFgtX22LttBMJjtmd4aZGomCE
	BMc1W1LPqKoHe9xv9cxAfaEHcDU5cjCfRZeZ979DvGoJrJ1q2C1yCwgIbXxmfopuAFXLCSKj1fO
	TncFaGwpfX9/aEf39p60NxCOsdoi9iy0uBu8CQhJpYs3nN8btzLJ9/R1/qDMSlJ+9lmLQ==
X-Google-Smtp-Source: AGHT+IEeTkgOdeZUpGGaxGsdrx0QZvZ/CXigi7dcaDUgno+cC1CWkj77HFnwYP7ok2mKArIY6+M5Qw==
X-Received: by 2002:a05:600c:46cf:b0:42c:aeee:e603 with SMTP id 5b1f17b1804b1-434d0a1f397mr20263365e9.7.1733315850582;
        Wed, 04 Dec 2024 04:37:30 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cbd72sm23817815e9.44.2024.12.04.04.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 04:37:30 -0800 (PST)
Message-ID: <03631258-545f-4f31-a849-9450a1a50ae7@linaro.org>
Date: Wed, 4 Dec 2024 13:37:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Drop unused header includes
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241204110348.100841-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241204110348.100841-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/12/2024 12:03, Krzysztof Kozlowski wrote:
> Drivers should include only headers they use so drop:
> 1. of.h and of_address.h: When no OF call is used (of_device_id is
>    coming from mod_devicetable.h).
> 2. clk.h, property.h and reset-controller.h: No calls to clock consumer
>    or reset framework, no fwnode/property calls.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sa8775p.c      | 1 -
>  drivers/clk/qcom/camcc-sc7180.c       | 1 -
>  drivers/clk/qcom/camcc-sc7280.c       | 1 -
>  drivers/clk/qcom/camcc-sm4450.c       | 1 -
>  drivers/clk/qcom/camcc-sm7150.c       | 1 -
>  drivers/clk/qcom/camcc-sm8150.c       | 1 -
>  drivers/clk/qcom/camcc-sm8250.c       | 1 -
>  drivers/clk/qcom/dispcc-qcm2290.c     | 1 -
>  drivers/clk/qcom/dispcc-sc8280xp.c    | 2 --
>  drivers/clk/qcom/dispcc-sdm845.c      | 1 -
>  drivers/clk/qcom/dispcc-sm4450.c      | 1 -
>  drivers/clk/qcom/dispcc-sm6115.c      | 1 -
>  drivers/clk/qcom/dispcc-sm7150.c      | 1 -
>  drivers/clk/qcom/dispcc-sm8250.c      | 1 -
>  drivers/clk/qcom/dispcc-sm8450.c      | 2 --
>  drivers/clk/qcom/dispcc-sm8550.c      | 2 --
>  drivers/clk/qcom/dispcc-sm8750.c      | 2 --
This file should not be part of this patchset. I'll wait for review and
send a v2 tomorrow.

Best regards,
Krzysztof

