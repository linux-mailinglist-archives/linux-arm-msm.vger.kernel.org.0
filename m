Return-Path: <linux-arm-msm+bounces-23201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD4890E900
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 13:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C0D01C2121B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 11:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC11F85626;
	Wed, 19 Jun 2024 11:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vsMScft1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE6D75817
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718795335; cv=none; b=eJHqG1obqVOoirPUEG62C4RWa/QQj29TYs9IT1qN24AnB5n4at0u4WRUT5AnJ3KECSU3feLsL5mZQB1nv/TdeqixQLQ0U+Ax2ufO9KlheLPK7iIPCyEh8WADnKUL1t1sH77NbOMsgwIHyu7PaTo1EQsJydSMr2HxY/XY5cEi7JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718795335; c=relaxed/simple;
	bh=Wa9liY7UYT1W4mthRgUm7kBXDmsIy3Uwq8VbteeX8FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5/V9V8ql8x3lUpx56JMZse5FVOliNpTSL2TKeQ6J26kNqwCw1gqom+jBg5CAGa63WrBhGVEAenhABv6D8jmwnbCMHdK1mzBtDlG7bV2hYTPYjJZmNnLb0Xln3rL7jPBsq+P+CoHD1jBauI+RgCox2c45awfAaRJcoywDvAFbLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vsMScft1; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52c8342af5eso6732284e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 04:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718795332; x=1719400132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F5ly1HC/fbJsWu6eak7uii+X1EeTcnEn2a9gVs9okUI=;
        b=vsMScft16QGxgDRU6u/zBbItVRVR/+l3NncSmkpOHdqF41pACzwInmjv134RLynK8X
         GLmtsg8zByxbdyhhOHpbkhxGxRCXchJ3ZdplSZIYfAyNpWLOqMIhDAyfqa9gBfKM926v
         6vJdLt6tutwBpqzjQiedbkak7U34iQbb5lsC4OWZefvQteU+PeVBbB2oJ8I4JTxZ7llp
         ytVNImpsYUjOCSDWLdEBnBpcIIAb5Sfu3uWyiXcoUQ+Fs0CifiaGUxnXpODtaZF7vP2E
         /WzTTt0C47CuAY2hQNEBCjUamg7B3kU8KCoafh5vyVFaB536u/FqXetXDWcf5WMjCk71
         UpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718795332; x=1719400132;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5ly1HC/fbJsWu6eak7uii+X1EeTcnEn2a9gVs9okUI=;
        b=eV0mla9qWlLyfZPqvD+N1MjcY0JCJTCLZNy3KdYRntvEOxkwLZcbMAZg/KhVP17MI3
         gTzoXxMfHmNuXm2GsIa5EnKQ1Dh57Xxg6uT3FmjjK1TJaRpFqp8Qktj6g5gZQ+TZqbc6
         s13MFVG9d9dQyygeZSIEfCXpbSCagJD1+EdGg4/62Sia5LIvlobW/736i+1SXGQjVkeI
         C1qkK0iwzScAJ9HuSgl9YNHjtDPUWiAFw+5Fsy1OebbzCM0kYrqzbUVqk3wFLcmz4pbk
         sGOziAQ9wPbVNHdNEs+kNYB15oi0raj9k2w5DYEQ7ft0bcI84c02XpoVPqZc810KQKP8
         RMXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS7dRTF4tKrHha3r9EA7N1jAtcp5EC+ZLyaAoRBI0yvGaytaQu8oPbGNm0vdK7dmJTmJVkAQX2d8OF/bwjHLPWK6ndougnHLS48/V25w==
X-Gm-Message-State: AOJu0YzcOYzjWJ1vAdvHdc8fIAq/IwojIJNJe5iD5afD8SWO2vi4AyLf
	J27ScNOqO38aUdQC6gakk4OfhTjJsiNGFhtyH14QTCVSz54Oqmmsd0XZoRC0024=
X-Google-Smtp-Source: AGHT+IHD0/h6L3YGVj9VPM6Yr1X3VpwlZgnL8Kv5bkfcP4PuPFdC9pD5cb5DrpBTdYMeiuZKqLK1qw==
X-Received: by 2002:a05:6512:3102:b0:52c:7fc9:954e with SMTP id 2adb3069b0e04-52ccaa375admr1178633e87.41.1718795330142;
        Wed, 19 Jun 2024 04:08:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104a3dsm16910407f8f.112.2024.06.19.04.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 04:08:49 -0700 (PDT)
Message-ID: <5582a2a0-c772-4573-9d55-2f963cb87df1@linaro.org>
Date: Wed, 19 Jun 2024 13:08:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable secure QFPROM driver
To: Komal Bajaj <quic_kbajaj@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_mojha@quicinc.com
References: <20240619105642.18947-1-quic_kbajaj@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240619105642.18947-1-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/06/2024 12:56, Komal Bajaj wrote:
> Enable the secure QFPROM driver which is used by QDU1000

Qualcomm QDU1000. You are changing kernel-wide defconfig, not some
Qualcomm downstream stuff.

> platform for reading the secure qfprom region to get the
> DDR channel configuration.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 838b4466d6f6..c940437ae1b3 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1575,6 +1575,7 @@ CONFIG_NVMEM_LAYERSCAPE_SFP=m
>  CONFIG_NVMEM_MESON_EFUSE=m
>  CONFIG_NVMEM_MTK_EFUSE=y
>  CONFIG_NVMEM_QCOM_QFPROM=y
> +CONFIG_NVMEM_QCOM_SEC_QFPROM=y

Module

>  CONFIG_NVMEM_RMEM=m
>  CONFIG_NVMEM_ROCKCHIP_EFUSE=y
>  CONFIG_NVMEM_ROCKCHIP_OTP=y
> --
> 2.42.0
> 

Best regards,
Krzysztof


