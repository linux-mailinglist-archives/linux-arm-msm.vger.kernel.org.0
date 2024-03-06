Return-Path: <linux-arm-msm+bounces-13517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D648873BFD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 17:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2507B218E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 16:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A362137904;
	Wed,  6 Mar 2024 16:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LHekgeMm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C55136650
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709742016; cv=none; b=eC2xx6h847q1pPZkSBlDQo3lJ5XLDxHvpJgiCjBavfxMxQItGKOCQWmTkew7NE+o7D48pMt58x0dQpydAA7xDmNd00/v9wPxoowGPnr09l2F3blPaSubtNOaGTl3GTy+HdUAczss5+KjJ2VFryM3u/gHF16ytJRk/Wf+H2d7mzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709742016; c=relaxed/simple;
	bh=U61Ij+6yIHoX0sWkGhtCLeCXXM4Gtkmuv90V6iCUpQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ea2W0CVhZ51jW2HAFDT3Yl17PliW2rd92VgL2Pgl0RbZktjF7aAp8XK/QiaAl+MRUi27BsufZjN7B2U1eVWD7YRBAWjjnTRlyCpiiFMGu2+wa9RA18e+iW2I+soX0InmkJ597HDJ56F/p8bYLTYUXYGNaNmkiuuSQcKumlGjTSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LHekgeMm; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-512bde3d197so1140003e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 08:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709742013; x=1710346813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+9BGaaVGAGFWOR1PbxLVisEHKQDTc6S5yLurq1hQUM=;
        b=LHekgeMmcQPvbSQkcFvFj6V6c4ARizvJIn7qHkrXkmj3UO3AdgEVHTcfOW3GL1qYFf
         fF5135vrIj7TyqiwcKOMMkbcfY9uMyl2v/n7+DzZGw4PVc/lHrVyxV8HwkqQR1dkS53Z
         Nzvx77TMrhrWbD91Zys9Qo6QA3j1F+prNQeaAIEpkQJgOnL5b0/Hp8wo+81Bv71jKl7v
         vslVB0XN3mcKgB0mhsJC5ISrs+ghp67M88weoDBXxwd2KJAu03HrnpGFDVGyDoxacjJc
         04sQuEilX7l3r0vLF9F7Eb27z5EcUfTFWlLi6EQlxCmFIj6I5m8lD+74lpLrjHKS9rnS
         +rIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742013; x=1710346813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+9BGaaVGAGFWOR1PbxLVisEHKQDTc6S5yLurq1hQUM=;
        b=IF4pjgYSy3mbBVS0MPCcaes32eoApMAuGB8zEAE3ARSJ/Riz74DzsXBLiNqqA0HQwi
         wxwOOW+03dhBxS0qCGAE+pAzGDrgJUj8l7+IxFqOBILFT+UjGJB+/ZrWsnE7d3TTH1iX
         6MAmnADn/RaDqH2hvpUO/UGX5UfNcsHeWCqvJk0OQ+C9LBSHgIhvSXFwE6HkCZHa5upE
         pHpDZSkZdeQyhsOdqyhKm5iMzgOQQeo/EIxxLOxjf9aUan6RVxcMsIRt+c2cTsF+DLoc
         ni5UavUtM1Gc1QtsRWcL/bu17aX6+WH1+J4A8/cI2vb/BAA3UC94DSibQNHdPcEcSonS
         oA+A==
X-Forwarded-Encrypted: i=1; AJvYcCXpBJnTug95AO1S0IzDaOYShLiC3AMI28EJ858f5eRzLc3gWrT+BFaMjqTZ1UAJFC6nbsixTg/JkD9j1DKE6ZkTVKWBRNdndz/8RqON8A==
X-Gm-Message-State: AOJu0YzT4ejCX/7XOrkR/AFgvLsca0bSJ1apPd2fnx6nA+E9/v+Iw80z
	+HclK2Y7ZsgxryerG52k3W694eNUKHOkIHm5e2VSibtPg8Ls8pxo5h2ZU+1zKaM=
X-Google-Smtp-Source: AGHT+IFnD63DLYuxsyRw6MDwHM55KllMc0o5AiDbBG9xpEzbdjGc42Pf9Yc21OU1cgkt/hEWU7kElg==
X-Received: by 2002:a19:f011:0:b0:512:fe3d:a991 with SMTP id p17-20020a19f011000000b00512fe3da991mr3543283lfc.61.1709742012940;
        Wed, 06 Mar 2024 08:20:12 -0800 (PST)
Received: from [87.246.221.128] (netpanel-87-246-221-128.pol.akademiki.lublin.pl. [87.246.221.128])
        by smtp.gmail.com with ESMTPSA id u12-20020ac258cc000000b005131941f7e9sm2668396lfo.5.2024.03.06.08.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 08:20:12 -0800 (PST)
Message-ID: <21a53796-c4d4-44d0-b62b-52d327784a90@linaro.org>
Date: Wed, 6 Mar 2024 17:20:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: ipq6018: add 1.2GHz CPU
 Frequency
Content-Language: en-US
To: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240306140306.876188-1-amadeus@jmu.edu.cn>
 <20240306140306.876188-2-amadeus@jmu.edu.cn>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240306140306.876188-2-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/6/24 15:03, Chukun Pan wrote:
> Some IPQ6000 SoCs have CPU frequencies up to 1.2GHz,

(which ones specifically?)

Konrad
> so add this frequency.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 4e29adea570a..7fdb119083a2 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -119,6 +119,13 @@ opp-1056000000 {
>   			clock-latency-ns = <200000>;
>   		};
>   
> +		opp-1200000000 {
> +			opp-hz = /bits/ 64 <1200000000>;
> +			opp-microvolt = <850000>;
> +			opp-supported-hw = <0x4>;
> +			clock-latency-ns = <200000>;
> +		};

Looks like said SoC can *only* run the CPUs at 1.2 GHz?

Konrad

