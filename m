Return-Path: <linux-arm-msm+bounces-69539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1A7B2A0D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 764883B95C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7634831AF2A;
	Mon, 18 Aug 2025 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wjeMQP+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9604A26F2A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518197; cv=none; b=f6vkBx1RuHWuK82r60Tew4qd9x6opK8BOlzjGTBR9Ehm8qrCUv1ckD50mrN25onZ3+yk1t8ZRZhv7M6amuJ6FPN8Xj746WBPeVU6CsKQ0hcEbi5qTJcY59ItsjgBC7gJ7HV75UZ/BGU+fZWIrej5qxKarFmGW3TOFwgkSpbFpg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518197; c=relaxed/simple;
	bh=zHUIyD9i1dIpDh5ToFeRxtFa0fLcAGef6Bi3FgK2bdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qnJ9LxthT3B4KlwhAZobz+ctNtK4b2P7B8fYEm/biUcJpHKEsyVRYM/Tp4vH2HNbthi2BAWqLuN827c4mSLHDymnh0kBoa8Tv018VDj6U2XMJWQvtJxaeYa4ygsDZcR/2MTuI+vPFjyOD0T3u0j/WdjmjgSgoyG4zLGTaMEKFCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wjeMQP+7; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7a96309so50090966b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755518193; x=1756122993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DSDzX8xx4xO49Rge1ySd3C4pdDbYOnshDbn4jcpcRSE=;
        b=wjeMQP+7s0qRUNcfVD9glsoCL1emvqInRKmxyqFWLhdEhPXpS+45M2q6VaHzx7DfAv
         aYBU63ZkCpMaCKWEanS4XAHE0AxPf+KQchARXbucLybzzIRdGYwZPVFwI8tosB0m/BcV
         kcX/iFLfEzRC5Ve23bM3i/TMc87VcXN6u0wmumS1hiRcAthr4shNrMFOCtk2KZfgDKJL
         m7F+rp8Jtfh5Za0bNz56Zc8rD7OxxHZK2cDnSuc1PO/RnMeQmmnKjEg7V9JAVR7t4WBT
         CQr97E0b8QSblJ3pw9iLEgOU9B4WRw/g/5jgynnWR0wcYlsMBrxb+HrwqVRvJfoXl9an
         RM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755518193; x=1756122993;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSDzX8xx4xO49Rge1ySd3C4pdDbYOnshDbn4jcpcRSE=;
        b=tdm+aybq6e293xTL0cTlIBOE2A/CdD8rADy2dYPwWXX3/9nX4UGJBpX8YuYvYhq8mq
         nYYsbuLgLU0/VGhqC2BcHFLP/niTn6K5gEFI0fY6+AGMMOudU3uYMPv0AsFJQbdSWOLe
         pGo5SwdA9FF1B3nBSEr21NUJEBIHUG92ZL2yrYkNzhtpqwA8NBvNZJLaOwcDjKv1NHBK
         WKwVdquu/0whhf1kyvADXlRdj7WMIss0HIEY0oeU4oQVWr5g888fEYFTMS6M3Khq+gKX
         1KAioDeKYnCHgifw7gkPLrH2wwzry91GpX+nEKrS2Nxbqb/Zaj7RUE0ifkWa37aAwLxo
         WSpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfuZrZjCh4Y7IYtXMAqqhaSeNQyS1FA2duIlvdDN4MI/CCeZGLaHaWGZ1EwbsqTI3W4sdlAxJOc+Yvia3E@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+dDq8UDf3mt/1nhsOcc5/i4TO6tclnz5pwCGrQrRCXv2QTZfN
	Vqk/kKOizY5EmO3zd3WH/WG1qRgIkTLf86aHSbjlKdDxuR6MGN02b7LyFgIRj53qPqQ=
X-Gm-Gg: ASbGncv1nhvSk7kvVdJBFIuaWUdFAxdpkPnI8e4xS4vKFTd/wTKjcNuo0ia+XQhUBn1
	pq3aCVYtlsWt9JBPVgeFsLSarkmgp05G8j3C2vFuKdztiIme/mesEPywS5hsCrwZ/rXKTjTCwpr
	S8o1TWj+wxkb4wjzL/YXjYG+KsFzntB6cF4Y9PgSpzBYMDmIG3dhgNcNHhbpcTqsB32HX3KmZ95
	JlEUqqkjWbgaqev+J8NxwNpPGMsdGlvRPYFkD3vFc48Xs4VDex1Re20yGleQF708CJ8aYO8U+wQ
	gje7AOI5BRRUJ6V8sH31rpEP3mQznOIg4R6j7HcOuuOuZ26kXyTX92H9PA2QoEuAahi7TY03tbB
	yN4RExC76PjeEMFRpq8TXPxSXiB2O8KJx9vAJcSLvdk8=
X-Google-Smtp-Source: AGHT+IF4MlVQ6IUXVi5p0rqp8M7eIgowsz8liVnBENT5pk7qyAD/CwZu2g/8FM+J04a+roZlK8xpiA==
X-Received: by 2002:a17:907:7214:b0:af9:8748:2bb0 with SMTP id a640c23a62f3a-afcdc2965fcmr517802366b.10.1755518192854;
        Mon, 18 Aug 2025 04:56:32 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53f19sm791008566b.26.2025.08.18.04.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 04:56:32 -0700 (PDT)
Message-ID: <9f050ccd-0fc1-4fb2-94f5-36ed1f2f4f01@linaro.org>
Date: Mon, 18 Aug 2025 13:56:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: qcom: audioreach: add documentation for i2s
 interface type
To: srinivas.kandagatla@oss.qualcomm.com, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818112810.1207033-3-srinivas.kandagatla@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250818112810.1207033-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2025 13:28, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> Add documentation of possible values for I2S interface types,
> currently this is only documented for DMA module.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  include/uapi/sound/snd_ar_tokens.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
> index bc0b1bede00c..3aa5f4928a2b 100644
> --- a/include/uapi/sound/snd_ar_tokens.h
> +++ b/include/uapi/sound/snd_ar_tokens.h
> @@ -118,6 +118,12 @@ enum ar_event_types {
>   *						LPAIF_WSA = 2,
>   *						LPAIF_VA = 3,
>   *						LPAIF_AXI = 4
> + * Possible values for MI2S
> + *						I2S_INTF_TYPE_PRIMARY = 0,
> + *						I2S_INTF_TYPE_SECOINDARY = 1,

Typo: SECONDARY

> + *						I2S_INTF_TYPE_TERTINARY = 2,

And TERTIARY?

Although, they come from audioreach.h so, well, eh...

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

