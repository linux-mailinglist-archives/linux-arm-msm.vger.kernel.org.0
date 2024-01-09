Return-Path: <linux-arm-msm+bounces-6730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2B78283B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 11:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 345D41C241E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 10:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F74F360B1;
	Tue,  9 Jan 2024 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sKTj27SB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E9836094
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e7af5f618so2931337e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jan 2024 02:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704794984; x=1705399784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vrSBay0Xit0RBIWL7ygXxBZNSKXups8cFyOtms9TolI=;
        b=sKTj27SB35IptV5vzoPsRaNo9dx+Qy+tbuqgXkXk3WW9ESk9HZ6NzQuapEBk6X/aym
         mDBZAop+d2sG8rhUjzF8TePmzdKOkVl62IOJGaK7MtzGGRiW3w6a8QZ4OJRTsHTAAPug
         EWeCdOlTma6ks3jU7R6YvMKUlTDOTaiVllJXtDVnRRk/A0NzLjGEb5xxFv6r6BZlbEdT
         KSrnHHiNRVJJBDPiRozWmREVOCDbBfw+C9XAxmgAP3V1/hGduqAv4FR2YvEam55+zs29
         AHYFhAKtp83+mScTps1oOXGB2l78fTdcFioSpVfJn6FKTvr6b3UdI0oSRWV79gFwCgcU
         SVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704794984; x=1705399784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrSBay0Xit0RBIWL7ygXxBZNSKXups8cFyOtms9TolI=;
        b=nLmm+3I2gc39X0726gAR0ac7gqEzlkPIwcrx85bcKCxuhfeZuC+LWUE6AXGtsMOwcO
         s5GoPFpiYaGBeMjlnRnjMya7dS3zs03y7nR2CTNvH8CAAvqz7+Sa6b4ocGqYnj0NgnCR
         cYFCtmr7tM66AoQySFf0Y0dCzPOs+WyCICw/z8h20DHyQ+oORfng6JvMWsztdPuJHwuL
         Uj3il0LX128F7Uh4T2RYsKD6Y3aoePSE/1VZ/4QMTuJshDSs/fkhZMQxJEvuJXYqInx2
         TfQ4hEI5TjxR/p9XbR5S2uoi+bGCM45N78rNlICtU4iNpCj82IQrA+dh3+YE+nVwyMJz
         sS1w==
X-Gm-Message-State: AOJu0YybAQ4vMknd6HD8nDHd7/Mrfy+WlLDk0HqLk5AwbIilC3MCI/rh
	TwN43uY2/80lMJ9BBAbgS9Thz+yCr9UPyA==
X-Google-Smtp-Source: AGHT+IGshVVbd90za93mKT7jUyObm7s+VHYZngj6eFDEebwOncx2yihx0l0bIbFxJhGXDhoVN+uSHg==
X-Received: by 2002:a05:6512:398b:b0:50e:69e9:373e with SMTP id j11-20020a056512398b00b0050e69e9373emr2597112lfu.4.1704794983770;
        Tue, 09 Jan 2024 02:09:43 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u18-20020a196a12000000b0050e7e409500sm268070lfu.244.2024.01.09.02.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 02:09:43 -0800 (PST)
Message-ID: <18dc5f88-6590-4e2d-948f-fd77f4713f8b@linaro.org>
Date: Tue, 9 Jan 2024 11:09:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: Add PM6150L
 thermals
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240105-fp4-thermals-v1-0-f95875a536b7@fairphone.com>
 <20240105-fp4-thermals-v1-2-f95875a536b7@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240105-fp4-thermals-v1-2-f95875a536b7@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/5/24 15:54, Luca Weiss wrote:
> Configure the thermals for the PA_THERM1, MSM_THERM, PA_THERM0,
> RFC_CAM_THERM, CAM_FLASH_THERM and QUIET_THERM thermistors connected to
> PM6150L.
> 
> Due to hardware constraints we can only register 4 zones with
> pm6150l_adc_tm, the other 2 we can register via generic-adc-thermal.

Ugh.. so the ADC can support more inputs than the ADC_TM that was
designed to ship alongside it can?

And that's why the "generic-adc-thermal"-provided zones need to
be polled?

> 
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
[...]

I've read the sentence above, but..
> +		sdm-skin-thermal {
> +			polling-delay-passive = <1000>;
> +			polling-delay = <5000>;
> +			thermal-sensors = <&msm_therm_sensor>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";

I don't fancy burnt fingers for dinner!

Konrad

