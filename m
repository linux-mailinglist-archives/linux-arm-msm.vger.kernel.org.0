Return-Path: <linux-arm-msm+bounces-16832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC5E89CAC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 19:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D529E1F27746
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 17:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3846914389F;
	Mon,  8 Apr 2024 17:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V0Owr5Gd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED5143C52
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712597215; cv=none; b=OhhQseQI/decgais3ois8fTF+xkeEs8XwtByISfZkkhBvDeyI2OmT0bHo1wNztP5FVZ+BkPD/m3r8Vjtcy5T60BdqyCh1zv4R4JKje7aib5SqxkjX/87JuwgQ0xAHgZiWgSbW5XWocrOyyzFGKTR1SFYZ/ip3Jc6ESdnpG/hMIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712597215; c=relaxed/simple;
	bh=di1fZE/NdPgQEly4hs4vKPLsKw0xKFpHQOpERMLkIqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNqYGNA2aulH1fZ//NAuYDoNBJn2bmrXhKmm4ZKMuElvjQcvEh6h19ck1P86Zrh+WpZtgIbvoFl8/4R7apDhni1durZmJXkzFoJjiORjBDeGB8s1CpGblLZ5lIbm1akbc3YL2p9ax18n1LWb3auNLGCp55fiBOXQLqss8zZd//o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V0Owr5Gd; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516db2214e6so2903652e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 10:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712597211; x=1713202011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YnWxjGpHsquU6yu3iiYYdxaEux1iqzEpGys5Zu0Xiy4=;
        b=V0Owr5GdYDgKciyt+03vDpMucyvb9nGRXNJGDeKX99C4Mr2pajPzGWvh+1aH1huDFc
         Sehj8/3rgW66T9hIruGPDaKZtVXLJiFYDCEtSdKCEW+7JGDK1WN1VeCYB634SQ8tpgAi
         EBRxL4/RFA0CTgK4+wfDGQqx9E+Sw7XGDf0mdTT2FEvOE6+GBAzC9T48tZknpymfmXin
         eTNPS9/eJAHBfKEH2Ocq4jfPMYXT7KVT+4q8l6Ex4vy10I2paChTTP14KN1Vw0Fg34HT
         sXIlBnsT30SEGV1SttOga/kSVRexBVUi7oSWNP7N56CoCtQcvn6uRg3hPXgDFjisKXdf
         eX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712597211; x=1713202011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YnWxjGpHsquU6yu3iiYYdxaEux1iqzEpGys5Zu0Xiy4=;
        b=v0KRcqr9M44eDWuBnX4uzit81xfJQTkpBJRDZjNd1DQMNiuTk3JXs7GKlrssZgXb7v
         d56uvJlxpnxtjdZ/T2fArgHnvAuLR5riYe4rBkox9p/Gv/su+S9SNkRMyPANMvwf/83a
         Y78wq/2e1XizmNCESPrOoWEqnw70MHdoW4FwCXdL4FvAQLRVy4dWT6wvX5H2+jU25yMU
         pD4ppKBCkSC29xvyAsrj976RO5/RwsivtQM+qi5CZCxABFxHXm6mPBKVRpdrIGlEksxj
         Xv5YSz5Gwib2cNVR8z46QLW5kHAq6xddwx/nS5G+b22z+1o8EiQJiKGl6MUvfoXg/pjH
         9fhQ==
X-Gm-Message-State: AOJu0Yy39bQL8FigFkTDagSksqad26VSx+CraE/dlf61X+vzUHXHZiXL
	0jLaNxF1IDl4rj38KBG9BQNoukIclwTvUxD/yiZ4ZEN9WdRdT0Appz04FwIGlns=
X-Google-Smtp-Source: AGHT+IEnJUAo3DBmpf41CIoTlZWQyHmNHUulRSi6MOsB78hKpauHf1ARPbItv9kKkKMQ0/XCs5RmLA==
X-Received: by 2002:ac2:545b:0:b0:516:c3e1:15c5 with SMTP id d27-20020ac2545b000000b00516c3e115c5mr5703479lfn.69.1712597211312;
        Mon, 08 Apr 2024 10:26:51 -0700 (PDT)
Received: from [172.30.204.25] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id v22-20020a056512349600b00515cbf19fe2sm1247477lfr.142.2024.04.08.10.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 10:26:50 -0700 (PDT)
Message-ID: <794f7e3c-6467-4da1-bc9f-3853459bbd78@linaro.org>
Date: Mon, 8 Apr 2024 19:26:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Allow gpio-hog
 nodes
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240408-qcom-pmic-gpio-hog-v1-0-f61fc5323110@z3ntu.xyz>
 <20240408-qcom-pmic-gpio-hog-v1-1-f61fc5323110@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240408-qcom-pmic-gpio-hog-v1-1-f61fc5323110@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/8/24 18:39, Luca Weiss wrote:
> Allow specifying a GPIO hog, as already used on
> qcom-msm8974-lge-nexus5-hammerhead.dts.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml          | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> index a786357ed1af..510a05369dbb 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -424,6 +424,10 @@ patternProperties:
>               $ref: "#/$defs/qcom-pmic-gpio-state"
>           additionalProperties: false
>   
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":

I see a couple bindings do this, but I'm not sure if we want two
allow two styles for no reason.. Rob?

Konrad

