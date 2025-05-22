Return-Path: <linux-arm-msm+bounces-59088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C99E7AC1298
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC7E7A40F85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93272191484;
	Thu, 22 May 2025 17:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KLnb4rtV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D627E18FC86
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 17:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936082; cv=none; b=YTF6gAh2QAs8WyfVnoZo9VzDSj5F5kJoXiNqGO4FwJSd99roHVX2QWjnkn+7p/xVyJR9Boq15QfOzaFCEo/spYI4KKoCCbeHhiKX4AbV/e99F2HvLgDuli3tsc+eN18P4fACM2GqRe87ekPG4ROIy3rNNgpZBeYsQaVKG/RlQ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936082; c=relaxed/simple;
	bh=GM9EsMbmAbClMnZO5mNCSbC/ozmms6eMZj0STnzBsRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Srr8RQvQSjaouh+T1UfBtZsuQosQuIY8tg+mEUaOI5RDcDmxQBMhX5wEQVNrlvI/pLYvD9FYINkRD58t1X9hhx0XlnUp8nlBu2+NrXOZ6ZJX8NsGQWS/MtJy9fE3Y+GG4/J2uXc9R0VCGoOfnJoABOB+et+tX00g1RqhrWerocE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KLnb4rtV; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a36977f261so854577f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 10:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747936079; x=1748540879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FI3yfrnKDwGbYegks2vQUUxNO3r1jrxUpuIbQf2sNko=;
        b=KLnb4rtVZMJwots8omJI8Z1cYffwNSyptnYNi23HWHGD8B2sdV7t+IHC1kUqQ6llfD
         OH5tFaunqyENK+WXKft+ckc99EgFb3BgT7kTK5RcKE0ghG7+yDawvp+UUwBHg03Hs2nw
         XOhPoh1TePUMdrJrCv+S+aU4vhGBeZ+eBm2EcKTtirRb6iogHxwEyWbZDnUQbsLnRmOx
         EvFLZjYlFIMynfRbTGS+7lgArf46O8/s8oCleD//g+T1m3Yycl59QHzi9ibzfdqe+BfT
         JPxoXOyuwuRxWPSJhr5bC5A5r/SHhLlQsIj9Lqwi9gj+gworZGtX3+WyQllV4iYVZH/P
         E4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936079; x=1748540879;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FI3yfrnKDwGbYegks2vQUUxNO3r1jrxUpuIbQf2sNko=;
        b=xR1CXx57qndmavR5urYFxEVkD/xsiVcrHZVXiCboA5sw9ODuFnMbZB+oCZqKVE5nP0
         pMf8MpIbE4AUTkSdnR9/3rlXmsiE0qtVPTati45m4yukqjW93fL5b6Pa3xOFZHTJSnzs
         Guqjlv/w1VTJ5cLFWak7Km1u1h0rQkZ/YAzC2u0bH4Ng8PVm8oxJyvG/ezzcUxBlPwZV
         R3kknmiaWK0x9UHMDv4QzxcqimlGBmNYa0tvppKI0UTXdwlX4+SQH466JmI0GlgKG2b1
         rToHxxiDFlDaMD0M9Pz9HQQLlZzPdBx6J+y2GeXj6Cxte6ZA5GQCvsRq4Oy9nNligpdt
         DbLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrXXI1CK56wZ0nnqgZieCBgIGK/dIU6j5b3UNhe5WfbMsrBtZ9CopulBu3i+3fW06d20lIlpHF73THZiZh@vger.kernel.org
X-Gm-Message-State: AOJu0YxgvOpL2Sge4YwPau10cgFsGAd6EdX1/IA3rE5tgpgrFCGL2Xfd
	0ny7eqhvKeDD3q6PgILGlrQoGiekP5h77n9CfpUmT0XOXw0YbSaODNfbbTnsrRmfZ3w=
X-Gm-Gg: ASbGncvBZ/jdZu8i6BGCk+qDFFY9LSfaYRcXVMQYpeYT6PeKzNLnyG+bYYQN9nqYXfb
	65gNoXk4dPGKehH/QBrgdPov4WTx7TW8Hb98Od0c02H37Uc4Sj6V6dYWyhCEEosggYoRmMQSAIC
	YQT4wISlwMOjQ8RoWd3Wxh8EiZr8ZAmX3XFYezhQ6N8iNigmqCSladVpXcU3g4EAYIQew39tSeC
	ALlNZgKvlI95b4vcQjf1uDNLfHMpTHJT1zlxplkNEupule+2o6wbnfb4beuMazZDtC/vRk4cP9B
	F8ZHRtPff8ZcXDNUj76O6gcSWYWxUnGNw2q58NwMGdUnexURMAIiUEuT97qNSPEt9HQOwi8=
X-Google-Smtp-Source: AGHT+IEZs7x3L5naJ16CKBdcYa6ztLamzUbH9kEsc4+k76NpQZj1EiyCGzpfgrulZfqhvMjbKSUbIA==
X-Received: by 2002:a5d:5f46:0:b0:3a0:b807:742c with SMTP id ffacd0b85a97d-3a35c826936mr9327551f8f.6.1747936079173;
        Thu, 22 May 2025 10:47:59 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a841sm24210906f8f.34.2025.05.22.10.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 10:47:57 -0700 (PDT)
Message-ID: <1225a93d-e298-4477-81a6-e871b9d771f3@linaro.org>
Date: Thu, 22 May 2025 19:47:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] qrb4210-rb2: add wsa audio playback and capture
 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2025 19:40, Alexey Klimov wrote:
> Rebased, updated, re-tested. This implements the playback support via the
> following path: RX1 from DSP is connected to rxmacro which communicates
> with wcd codec using soundwire. This goes into AUX input of wcd. Wcd codec
> outputs analog audio into wsa8815 amplifier. Capturing works through vamacro
> using one onboard DMIC which is directly connected to vamacro codec.
> 
> Changes since v2:
> -- dropped [PATCH v2 08/14] dt-bindings: arm: qcom-soc: extend pattern matching
> to support qcom,wsa881x and replaced with new one;
> -- dropped [PATCH v2 14/14] ASoC: qcom: sm8250: force single channel via RX_1 output for qrb4210
> -- reordered as suggested by Krzysztof;
> -- updates to wsa881x-common.h registers descriptions and corresponding updates
> to wsa881x-common.c (Konrad);
> -- sorted subnodes in DT alphabetically as suggested by Konrad;
> -- wsa881x bindings updates (as suggested by Krzysztof);

What exactly changed? This is way too vague.

> -- ASoC: dt-bindings: qcom: Add SM6115 LPASS rxmacro and vamacro codecs
> is still present;

What does it mean "still present"? You never responded to my comment. I
never asked to remove it, so I do not get why you mention it is still
present.

Best regards,
Krzysztof

