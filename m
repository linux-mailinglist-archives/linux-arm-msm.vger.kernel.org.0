Return-Path: <linux-arm-msm+bounces-1557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D92377F4E2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 18:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E049B21309
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 17:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305FE5B5CD;
	Wed, 22 Nov 2023 17:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9t4hjh0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D591A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 09:18:49 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5094cb3a036so10022683e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 09:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700673527; x=1701278327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBb7uvDdpiPhPtfYhGAJokE68U5HdEwFTqReQh4emMQ=;
        b=S9t4hjh0IGkvOECUN5WpW86UWyFg2iOL1PRLQZRAmsEGyRsDTjPQWlesYlhoxHKzml
         BLyPCxoOGb00HQ+eQP6gxFNjEWph6CZurjyjZngR0Q8v84mQPzuiHxz4Ff1EOAcVI4yt
         cvJ+NExGeOI9+tJNvvrO/GryWx8OVq0KSHTPuW17eSgFcRKixMr6tx917dI/pUuHFSwM
         FE+ZMW7e4j6kV5Ky43Tegug2H6F6x1G+w7UARods5EwRPu7R+7/39CuZ/bFRMkbVhNNN
         ttC//uNeXdLZbY0BHDg4QK/NifL+1bcn6LlNKsGVGdxqlu4MYEly+1Ca1WOaqoGfSXNb
         YsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700673527; x=1701278327;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBb7uvDdpiPhPtfYhGAJokE68U5HdEwFTqReQh4emMQ=;
        b=uROsN5A4UsYlFd+1BKg6oZPWkF6ybLpQMQwrBa5xjTyWd157OaLSKt4ZQfJz0aZJMH
         5tIffzFOEZHh9RHpglxxh8NwGm4V4xG+m0Tn8JrjkjlnwLiRCHX3NzyN6b94OzRJwSXG
         uP+4CqwYIFXzbxoibATgkwYrhWb+cYbdW41tjAbWf2jKvL2lmc5ut98exbzUJpZIh/XU
         X/F/HQZS4rM35RzVXDoZTmZI+DXqoap/TupZU9Uhi71GbhvgpEjJngPhaNgexcqLSi/z
         EgDabipG9aRpZnEufYcru6pdoaMRLOVYe2AlVo9ByHLBe3SyU2IbHlyKR4HyTdA1DT7F
         b0lQ==
X-Gm-Message-State: AOJu0YzOSWlKayMIAixoa/EGwTuKN8amHNGcVSA8Pt/XttE3foBLWXmW
	/vuKn7oM3zdf9Avfjno0u16e1A==
X-Google-Smtp-Source: AGHT+IE7Lpl8F22WVyua+nXBTNkuJNuj346aRbY/a56nH2yZhpl0Y/3GTRWDi4MXCF7jUctLK5UgqA==
X-Received: by 2002:a19:4359:0:b0:508:11f5:8953 with SMTP id m25-20020a194359000000b0050811f58953mr2099727lfj.26.1700673527381;
        Wed, 22 Nov 2023 09:18:47 -0800 (PST)
Received: from [172.30.204.227] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a1-20020a19ca01000000b005091492ac3fsm1922005lfg.175.2023.11.22.09.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 09:18:46 -0800 (PST)
Message-ID: <ebed123a-f952-4269-bf2c-0c0cd7d6e049@linaro.org>
Date: Wed, 22 Nov 2023 18:18:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm6115: align mem timer size cells
 with bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231111164229.63803-1-krzysztof.kozlowski@linaro.org>
 <20231111164229.63803-4-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231111164229.63803-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/11/23 17:42, Krzysztof Kozlowski wrote:
> Commit 70d1e09ebf19 ("arm64: dts: qcom: sm6115: Use 64 bit addressing")
> converted all addresses to 64-bit addressing, but the ARMv7 memory
> mapped architected timer bindings expect sizes up to 32-bit.  Keep
> 64-bit addressing but change size of memory mapping to 32-bit
> (size-cells=1) and adjust the ranges to match this.
> 
> This fixes dtbs_check warnings like:
> 
>    sm6115p-lenovo-j606f.dtb: timer@f120000: #size-cells:0:0: 1 was expected
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I hope I got the ranges right. Not tested on hardware.
> ---
Tested-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

