Return-Path: <linux-arm-msm+bounces-27588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 171B394393D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 01:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48DC01C2192E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 23:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B59A16DC27;
	Wed, 31 Jul 2024 23:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jmjsm7LS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9089216E864
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 23:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722467557; cv=none; b=JQv+eCZXiFXqrsrtoxK1UttrbM34u5tFPRPAMaP8MyocT5CQ1Cun2IBxGDVSp4g8l89a9lEgsXVkg1/fj0FhLaFIWnWOHhMqQ3xM8Vrplm9QAJ24se9LCpj5368q3PITZVyOJSGRS677Vt87+/8JXgmkyhqwjNuqqhUGZvh0S74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722467557; c=relaxed/simple;
	bh=POSv4ihxBb0Obca530vynvy7d8gZlc4PFHsId7FQDZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ADFlZCWpWrl5RH6pytwUZLg3lHy9y7uJ6LSd4XopfeUqk9YDodEb+fbo+i4sRRPUnEv2CLHCjfoVPpB75ocwLQnloR/DfhXu/R2japcsY+fGC7dEZcTkbb/W7k1yql6Jc/nfDvEEcoX7Nuv5TW1bCP2w657eojDBIc0UL6rI9us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jmjsm7LS; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52efd2221efso558042e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 16:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722467554; x=1723072354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hyHP6tHqa7ubkYpRyv3ZvH3jJj0lSTMgse6k+aChAtM=;
        b=jmjsm7LS2RGnqg87x+m9HouMJoJj+imjiNsSn0DQfL86aUt/l4/m2GppmN3/uGbM/G
         7sd0APpLM92ZM9/OcqpKnhUQzJ5bTv+ReL29ctoHFHRn6BxVCziIDsdGGuX0Q3ykVZKe
         /zaF7RfADNhEkbfh7EY1bk0nnt7wb0QEa/BgCFeU1Sunb+CrlpSOHJCMzqTCHaVr2Qww
         Y0YUV+RhfBlndyYAj0rShbfCD7B3kSv06n1ABeFsr7bogO4SRCOb4zpajFfluy/iF+e6
         gTpvblQ+OMVH+B04XtGuoRZV96l3MBX+4O3YHGA1LDpTQRdHOUSA56VyoBxcCGrra+CP
         iMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722467554; x=1723072354;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyHP6tHqa7ubkYpRyv3ZvH3jJj0lSTMgse6k+aChAtM=;
        b=JwvKms4t0Rb4xhIVvJKTjcgCzKoB+LjxN+ng7UA11B8NIZ/59/TuyMf/P1KLF7PS3P
         2gVjwgsZyZ0KkmkEGSsX0zyJv+fQuwxce6mUoxWesVRPDSEuBRHxkjtMCTT/PLHqBE9N
         cBJzqwdirh0yn9ZhOuczOHohbeYzlvm0i9UvHwSNn7Iu58ZmQS5sdXKEjk1LNycoGRa4
         TjCQQW69rNZKpkfy0N7esjMdIPNolMDB8l1LoGd43VYpYNTWOdhvg3s5AhCdTkk9t6LW
         KAvxkgDEDkZLlnK31VUGRio4gOQw27sPGto8FcDGLxkMSePXOPw4UOtw+P7bvGzOEOJ9
         Q56A==
X-Gm-Message-State: AOJu0Yy/v2AZzfOFNtnaL5GDCaqlOeN1ZWG5kuT3asuFEgWmQTCukLSC
	LZZUNT6UyBvzDV3W7+R9CdUeBpRj5On8xmYx5PnRUfGxgv2RgC9gHwTp8+rPaB4=
X-Google-Smtp-Source: AGHT+IH84HGzXPBSEaAQTdQqM0Mt6cjjb+kg+ySp7HlVzAOaHTrPTsoT0ZoE+Fo8WL54KqX2ZmFmMQ==
X-Received: by 2002:a05:6512:3b1e:b0:52e:ccf5:7c3e with SMTP id 2adb3069b0e04-530b62151c0mr133165e87.7.1722467553510;
        Wed, 31 Jul 2024 16:12:33 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530abeefd04sm671995e87.121.2024.07.31.16.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 16:12:33 -0700 (PDT)
Message-ID: <07a64faf-f97e-4a9e-87a2-598ff73817f4@linaro.org>
Date: Thu, 1 Aug 2024 02:12:32 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] dt-bindings: clock: qcom,sm8450-dispcc: Add SM8475
 DISPCC bindings
Content-Language: en-US
To: Danila Tikhonov <danila@jiaxyga.com>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 vkoul@kernel.org, quic_jkona@quicinc.com, dmitry.baryshkov@linaro.org,
 konradybcio@kernel.org, quic_tdas@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@mainlining.org
References: <20240731175919.20333-1-danila@jiaxyga.com>
 <20240731175919.20333-4-danila@jiaxyga.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240731175919.20333-4-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Danila.

On 7/31/24 20:59, Danila Tikhonov wrote:
> Add SM8475 DISPCC bindings, which are simply a symlink to the SM8450
> bindings. Update the documentation with the new compatible.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>   .../devicetree/bindings/clock/qcom,sm8450-dispcc.yaml        | 5 ++++-
>   include/dt-bindings/clock/qcom,sm8475-dispcc.h               | 1 +
>   2 files changed, 5 insertions(+), 1 deletion(-)
>   create mode 120000 include/dt-bindings/clock/qcom,sm8475-dispcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
> index 4794c53793a8..76f5a8cc42cc 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
> @@ -13,12 +13,15 @@ description: |
>     Qualcomm display clock control module provides the clocks, resets and power
>     domains on SM8450.
>   
> -  See also:: include/dt-bindings/clock/qcom,sm8450-dispcc.h
> +  See also::
> +    include/dt-bindings/clock/qcom,sm8450-dispcc.h
> +    include/dt-bindings/clock/qcom,sm8475-dispcc.h

Here a new header file is not needed.

>   properties:
>     compatible:
>       enum:
>         - qcom,sm8450-dispcc
> +      - qcom,sm8475-dispcc

This added line shall be kept though.

>     clocks:
>       minItems: 3
> diff --git a/include/dt-bindings/clock/qcom,sm8475-dispcc.h b/include/dt-bindings/clock/qcom,sm8475-dispcc.h
> new file mode 120000
> index 000000000000..21a9db2d0f09
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8475-dispcc.h
> @@ -0,0 +1 @@
> +qcom,sm8450-dispcc.h
> \ No newline at end of file

Please remove the symlink, it will not be used.

--
Best wishes,
Vladimir

