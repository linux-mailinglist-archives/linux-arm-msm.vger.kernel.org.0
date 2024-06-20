Return-Path: <linux-arm-msm+bounces-23346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7AF91031F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 13:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D496288FCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 11:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC0A1ABCCB;
	Thu, 20 Jun 2024 11:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N4kQOhP0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE581ABCB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883375; cv=none; b=CZKZuwQLnyuI/zTSiXDSaozdvVXEnb5yGRfLjrV6QclUSPRF3pW2GR+TZWoPjHzJCHM8Nprtycj/gxTTNTGOeVoaREUfGzmUC6kU8qpPm87AY5p8S4g6rfk0LfIa2CFWa6gfr7SghzalPXSIiVJB8BY/pNZyJ8bYzXzpYJGp1iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883375; c=relaxed/simple;
	bh=nRqBsJEd7RdEPsUP+bJKqZO8XDoFjfw/gysnZYaptek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Op0BpfQCrs/JZCKAHz412JhetsXNsjDQ2Alb/gqNJ9VpUZiCSsNot0TEHRfOZdm8uUjylAh1PAAgixEIgsNcLWpORxPRrrLi6As27R9tQeInPikC0K44FMLf670bNugjev7mGyhLummmdkG1rVOorIkH5TrePkR4vx/k+RYsz7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N4kQOhP0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-421cd1e5f93so6179475e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 04:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718883372; x=1719488172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w8FnN41Mf6n4gEfUCVc2oe2k2VzbxXyQD8y1pxiDK2U=;
        b=N4kQOhP0Uur1obSL5ddNWjEpnWFoUq6VVH/g/v5xQJ0+oXsaXPmiD+NYbnbHCaiI0u
         lnrkgshxutugNLYl9NZmzce6O45k8ki0pKOfLbGZGoWpjxtLt7X2L4w4fDWI92851rEG
         EXCZBPkqiE7ZXzPmmhBwphPD90PhWwoJP+wPmEudLSo8OfIhegUcdSwf09RsP/bHCkGx
         nBqr+yEoCy8py2G0yMJqyPT+2AIE6efdSffs0u6GZSYrCkztvgsyt2o6vAbuRuE8Z4KX
         jMqcHSF/erH9EZPZ6ejbfRcmDMKeUijDaWjIU5WTQRem2FsqxSbpEdtTO8HehqZcCJ73
         y+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718883372; x=1719488172;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8FnN41Mf6n4gEfUCVc2oe2k2VzbxXyQD8y1pxiDK2U=;
        b=HjrmtEbjDhw73Ys2VG6Ea8NKVieCjs7Ux8uG/5hIjT38cyLRXdVMRlXJKePTg8RSDJ
         L84zaWYRy4Vb3xb6VktDNIMmPcUtF5joeHlCdcZn9h6gRvSANKfzfWCSoh4lEPI16Mv2
         C58I5h8rEUuk3dYI/P+sSW5oxqtX1FbpXqPxsk8/fJs7ReFqAymbmFfXmK9WUpCOFiuE
         1OpEAzocI/gW6DIIGIwfyr+hvo+eXJDXVoB2tz3YiohUWTTsLM0lw7OYXIg4TnP/ceSf
         5P32bhPjMT3jdZjNHcgLB70d/awRU4pQUZVUylUbtSWOlaMduKLqYTCDP0d8hyEcV1g+
         pbTg==
X-Forwarded-Encrypted: i=1; AJvYcCWH/OIs+NHmMnIgCDnYkpQUgwUhhWRcVsIcUcY9HtVeW/y+X1j/ewpk2rQk14moq6o98IW+XXg0ZOztZvv5Dntmt4BC2VnJ2cO65GMWzw==
X-Gm-Message-State: AOJu0YxmFnkOAnAh5L3GwrT6hHhVrVHG7L9zKqq9H7Vs09DVwxyAxkkU
	4hTng2z76mLFiFJMJzvSGN0yDvc3d0RPtAf6anMe2YtLXhFtKnwgG3SfntIgOEE=
X-Google-Smtp-Source: AGHT+IH50KgcfrgSYme63QXez/BHyme9PJ/ahReUqXgmSBV4WXobw4/hiTWBCi07LMPF2DhqS+8qUw==
X-Received: by 2002:a05:600c:428b:b0:423:57f:fc7a with SMTP id 5b1f17b1804b1-42475298d39mr39189745e9.32.1718883372068;
        Thu, 20 Jun 2024 04:36:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c5492sm22807375e9.24.2024.06.20.04.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 04:36:11 -0700 (PDT)
Message-ID: <2704a3c7-7024-47bf-9c10-6453856551be@linaro.org>
Date: Thu, 20 Jun 2024 13:36:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: Enable secure QFPROM driver
To: Komal Bajaj <quic_kbajaj@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_mojha@quicinc.com
References: <20240620112716.1339-1-quic_kbajaj@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240620112716.1339-1-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/06/2024 13:27, Komal Bajaj wrote:
> Enable the secure QFPROM driver used by Qualcomm QDU1000
> platform to read the secure qfprom region allowing LLCC driver
> to get the DDR channel configuration.
> 
> Currently, LLCC is the only user of secure QFPROM, and hence
> setting CONFIG_NVMEM_QCOM_SEC_QFPROM as module to the convenience
> of LLCC module.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


