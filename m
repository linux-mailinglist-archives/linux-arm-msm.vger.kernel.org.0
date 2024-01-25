Return-Path: <linux-arm-msm+bounces-8379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E342D83D0EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 948041F23438
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDE8134AE;
	Thu, 25 Jan 2024 23:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIsiumNM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2DF134A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706226602; cv=none; b=S+fhAT4eMOHGwkEHFLLILdHNOWA+xCA2Yt4TjW2sPo2LUh3StdKgADNOOGO8rUw5ucFm6vAiKMl2IB01z62RSAZ7+PIicrz9vrw22OsrVNjqJwB0DwYiLrxCzYSMuuQBipM4L106DYZdWZ0W7PX60BwjP9tVjePMYwhRiqhZtpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706226602; c=relaxed/simple;
	bh=zuALxgKBNdz+cz2IZmkcUCnj/b8C1xkO0iZjdzgUinY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0CXEBB42aQ0ruwCAXBQDSw6UwDfOlKmWueG/+ISS3p6Y87oTEdd8OrKTdfqGqGOtE+zvsP4TtOBpYKgf1l/Zk6Clf3AJiebV34v4MkBA4pczOKu99xneWcLUrLMJfg6gYw6MqQowySLB+ODn3W0d3PLFGZFHllN1fNc2QHs82M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIsiumNM; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51025cafb51so133924e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706226598; x=1706831398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84suYuoX3RAYz2xiQa2wUmKN0Xu6H16i6mQrUX9bctU=;
        b=tIsiumNMfL0iUN8MvtCecFqU5qtshFGq0vlfx7W/OQ1xSpR/SYygjYTngiITZ5I7Vt
         Uokmv0T4uNOACKHf433uGzWy8k49sQB1avUmrJCmEBnadsrc/rmxPiUGJEwZw5d5v2c5
         Zlda83u4cRSXOx14AsXz5V5CZWTVZyziN9WsYV7Abn1Dy4zsoLAqeEgAlz9uFw6TXbu9
         V2OOHv0Hc0d6tcPTjhT3b2isGqBAdd1VZBYVUHjYtw/Tsf9Vq7Y4frJ7lwGBngV79ByW
         nWq97FBai64sQxiA0XMCss7I9sWikDtQmbv6TTMS1ygfjyqyXimtLOAVbgC78YHZhwkl
         Q66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706226598; x=1706831398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84suYuoX3RAYz2xiQa2wUmKN0Xu6H16i6mQrUX9bctU=;
        b=dV3lPv4C74Tzzo4AiASZXp182FhSSEMTLGJa5/OGpPDVKheSAO7TKfuc+DEfv/Ylvd
         1p9pLgMVxOOZbVEUCh5u+xhaHhovGRjcJ9OEoqJ2+bCioEnFaigEzFqiuPJCcSuy78Nk
         HsDC0YFzxMlGfHWscXnyaXNXBHOOgfC2UzE0IssPNzNA39vCtrX5918xM7n4mUDmoVB1
         irCFY/OQW7MB5sKwgR9yCSGWn2tu62dFA2KdxGdxihxmMW7UCgRlxxwtr9oKz3prAW2n
         XALg3czGO57UoAH5+1N6ODwbqAxcNb1GIm/58qrnCeCpE+5h+XwTzXooTUl9agAHGFmT
         DWaA==
X-Gm-Message-State: AOJu0Yz9+KrcnGxvOYAP2XaAaozk42ofbAXiApWMqttld1fgzlOwI+j7
	Wb9pRxAhuHqewz+DdZQrXcVSHEdaAKJni4p1crowmudRO8mAvQVZkeWnHigPV24=
X-Google-Smtp-Source: AGHT+IGlZCfDWZKPWMU55TCy+VJ2zTqmY3SNUSR/poAl1Jl1Szh+xGqeR9Bx7VhdXjmN9sTmz8nYAg==
X-Received: by 2002:a05:6512:70:b0:50e:74e2:af58 with SMTP id i16-20020a056512007000b0050e74e2af58mr288823lfo.52.1706226598453;
        Thu, 25 Jan 2024 15:49:58 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a21-20020a195f55000000b005100af37fbcsm10614lfj.166.2024.01.25.15.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 15:49:57 -0800 (PST)
Message-ID: <a75d8b2f-a55a-4087-b039-60769678a480@linaro.org>
Date: Fri, 26 Jan 2024 00:49:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] arm64: dts: qcom: msm8953: Add GPU IOMMU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240125-msm8953-gpu-v1-0-f6493a5951f3@z3ntu.xyz>
 <20240125-msm8953-gpu-v1-1-f6493a5951f3@z3ntu.xyz>
 <d576e655-5d00-44ff-9405-0fceaa2d3935@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <d576e655-5d00-44ff-9405-0fceaa2d3935@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/25/24 23:24, Dmitry Baryshkov wrote:
> On 25/01/2024 23:56, Luca Weiss wrote:
>> From: Vladimir Lypak <vladimir.lypak@gmail.com>
>>
>> Add the IOMMU used for the GPU on MSM8953.
>>
>> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8953.dtsi | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> index dcb5c98b793c..91d083871ab0 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
>> @@ -1046,6 +1046,37 @@ mdss_dsi1_phy: phy@1a96400 {
>>               };
>>           };
>> +        gpu_iommu: iommu@1c48000 {
> 
> Nit: most of the platforms use the adreno_smmu label. But maybe the msm-iommu vs arm-smmu makes difference here.

Not really :)

Please keep the labels unified
> 
> Nevertheless:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>> +            compatible = "qcom,msm8953-iommu", "qcom,msm-iommu-v2";
>> +            ranges = <0 0x01c48000 0x8000>;
>> +
>> +            clocks = <&gcc GCC_OXILI_AHB_CLK>,
>> +                 <&gcc GCC_BIMC_GFX_CLK>;

And align these

Konrad

