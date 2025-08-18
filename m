Return-Path: <linux-arm-msm+bounces-69541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 103F0B2A0F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE36C5E40A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0871F322778;
	Mon, 18 Aug 2025 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O06XW56E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F55320CCD
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518293; cv=none; b=eDHtKBgtp9NmDinx/3RTOK9NuBpxa0rZqUExQs+72uRTpJCOTRWhL7zj55pV9dFoSvOHmEKPzA/XDjqhOkHMB0JHXQSaciJp1NygX+1z70ldzFF6m2KpkH4YnJrR0M96wBsZdtIG9Brbg7E7U09enHGrPxKjdx/T1Ps7qi9bWDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518293; c=relaxed/simple;
	bh=eVnxYFgsrwlFejdfvYALEB3jokW78kjV7uhC2rL7Kgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6XYDwPkz7Xd0vBxPNWDw69b4xv4H6VHv1mwURvbHSt8m1mt64x0tEgINuCX6DZAPtjdh/l5RLsSN3ao4YXprvegiKQVMeesxfBZK1ApbvTSzACKTSAUrKsODY5/8GTcyKVAhaE6Swe0ZOJbYhGVaxSUAt2nsBHki3s5BsavJLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O06XW56E; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6188b668b52so487551a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755518290; x=1756123090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qpp+rNHm8hVKoYycc52XEufdtZA0T7sp3KTBpgEYztM=;
        b=O06XW56EWIsNdhGpgJ6r34e8gWdcj9wONfFe+yGC4OtGlevq1dOb9yeNafisBRViBH
         BsyApaIz3UX0ovecWFa6pswuhHNe/R/tBXYlgnTsJGUm10hGiXZNmfBjbRnTPBcK4CA4
         OJuD8iY/bXjVxgBRXxcQkeoPtx0Qja02QIJi/UQYUm1LuP+ngWgXzeIdzkJmkiOQ5m3K
         ERjQOI4ljEsI3J1xBmcvue1UK7Eg+PC9Aj72lcHmXdODQso5YJVERnCK/DaKnHXqmRxi
         4q+EpgMaj5VmE8QI2JWzTChl8BgxxzTKvgWulX/UzOVLiBOWuq/qhvpKjkC6Eo8+3V5C
         1hOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755518290; x=1756123090;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpp+rNHm8hVKoYycc52XEufdtZA0T7sp3KTBpgEYztM=;
        b=g1dqs1fAD007z26awTggZrvWQfy3TpKs2cmEyCkegIjFpTgy+MwF2I0EfjoZYcx8aA
         rDMncGBC0ejm7do18RsIOG1UzLD0GNdqqTGVxA3TShL+kWxWWAenha3LfPh8I//ng6zg
         hlFBxMbXwHfTTw2QOqNj6GSEacL6FLtZJ8DKm5/KZrjBYJmxsPSjvnUIpPl4vMrM/roP
         v4uRdpcR9gSSb9gTtWRl+hTwsNte9RXZYMGpUZhVS1tYCeAMXKgwiT9ph3zU2vQ2yfb9
         R2ohlLRRMnaDntirnK1Ka6WYAUzBtTcRj4PAZR8xzTfMQqcu35X7rSR+zTyFCeB6Y5ix
         0MPA==
X-Forwarded-Encrypted: i=1; AJvYcCW1sH6+nVRItXhNvobklU3oY1ymM7a+54zacnG0tqOIZRA1dJljB7Dn5lLdJ1DHB/LQJTWGtOkTVPAhV51i@vger.kernel.org
X-Gm-Message-State: AOJu0YxSo1UK1/o15e5GaR28hacMX9zaSaebam0yMzkKHpcJviOH5MPV
	AHFWxQYtWmjcqc0XT21xeJE45i++nzqvu0ePayD1lWVbT/tdtsXaoRRSWyj+7+qjcOM=
X-Gm-Gg: ASbGnctdbVrmOiSbAbUV1NrKwNVHKCcIj7SCcIKbJXoFJOWIunM+HGz03wwREL6/jmU
	HM5NrI1LAfYqlOMdbIQh1EIwz7OGIkaZexBGjGOsWlQJBiMmJL8abWGlJGVllF5DhthkzBU0xd5
	B/d0J+UBfO1g/3hQkw7cGD5waW31mgKVhUaXStx82bmCOk8EFy+HkuVqfg3oHTCOvTnMSO2UGHy
	3YW+AkdPlh6RpxIhvGn0V8KsfNYW98R3tk0CY737RauKQgVXayKsQc4FV8iz8+1DBa9Cc5ZmvuU
	KulZo3YzXgWzZazXLOKuTewXWYUnhh/3+avy2RZ3Ar8pZshkVKX1xfvzsozRRAnYNZqfL7tbMcD
	LsEYwc9JMoDVyeHpHtQzjNEGz54OyAZFzEfc9Mw08myE=
X-Google-Smtp-Source: AGHT+IEc8CQAA5PwmSJg5Km8EHNJwZRZwwLTTZxkAh4wWLcDQj82PjoTVlrCSP+rRP4A+/cguAZPKQ==
X-Received: by 2002:a17:907:7b8c:b0:afc:d540:add4 with SMTP id a640c23a62f3a-afcdc29e348mr445639466b.8.1755518289866;
        Mon, 18 Aug 2025 04:58:09 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfccd75sm789843466b.61.2025.08.18.04.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 04:58:09 -0700 (PDT)
Message-ID: <8405b263-08a9-4b8f-ad20-73c8f5865b39@linaro.org>
Date: Mon, 18 Aug 2025 13:58:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ASoC: qcom: audioreach: add support for SMECNS module
To: srinivas.kandagatla@oss.qualcomm.com, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818112810.1207033-5-srinivas.kandagatla@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250818112810.1207033-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2025 13:28, srinivas.kandagatla@oss.qualcomm.com wrote:
>  		rc = audioreach_i2s_set_media_format(graph, module, cfg);
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> index 617bda051cf8..2ae6420f4b6a 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -30,6 +30,7 @@ struct q6apm_graph;
>  #define MODULE_ID_MP3_DECODE		0x0700103B
>  #define MODULE_ID_GAPLESS		0x0700104D
>  #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
> +#define MODULE_ID_SMECNS_V2		0x07001031

Can we keep these sorted by hex?

Best regards,
Krzysztof

