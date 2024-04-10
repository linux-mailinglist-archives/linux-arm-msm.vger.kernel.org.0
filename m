Return-Path: <linux-arm-msm+bounces-17005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 863D489ED8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 10:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A97081C20C9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 08:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B6913D529;
	Wed, 10 Apr 2024 08:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDxtNBdL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C3113D53B
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 08:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712737620; cv=none; b=QMuYaAd1ia3ubGcoWKP+nOezEhXMYdr6NW82VI7j8rAg/ZvK0wJxKmRsW0huZYvOvyi84oIXWoS48v0bPSBElY7fFCYznzk8zzZXq9RDm0yKUbNPzMkKQ5qarpJsBbv7HLpzOAbc8eUXwCM2lOlLJlvMQYc8s+CmsEEz6p/iYMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712737620; c=relaxed/simple;
	bh=+ySoNLYAb0OmC00C6xnQBfyWu5Khf41/oV21QlsHOk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zl/SG8+NZuSLl609N5+OtuzDUDXXC24mb2WSt13Uzpn6VbLfhzr8cs9cTuMsk79TOXQBmptLmmDWkshhNh8VXLDNX5iYtDwqy0GSD73p0gnhsUJ0WZmcrwRJHZPFnh5ZiVkLrR+sEV3FvxUsHC0itZl8oRG8VQPawo5Im8K/eP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sDxtNBdL; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d700beb60bso104750421fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 01:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712737617; x=1713342417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bm7UxuqoJvIIipcWHzaYnh2r+UzAv7oGOAT76pDRbBQ=;
        b=sDxtNBdLHZxoyPGdYsrAkuvokmbuEaHY9oo7hm5hd2kjnc3HNL5ufbsl1cgDtgVe3S
         AFc3imXZJ0C28P7Z2hkrx7d43xxauQcDjRtbWISJ/u2iB0769uD1UEAsOhmQAV2v2Iqx
         hDYqvh2znTiTw7qYrv4+KSF4Gc7qMlyKb//p4XTvBcfLi4colFLqPX6943iC6PwlvKLT
         +N8R+s1QOjDJYF0dYzyplXUq30dJQs4n5GepH/It4H7K0xCKrqwLWQNtC3QKa4DLmmqi
         TH+iKwsqI6cLC9r+dkfoJc6nRp4vlyuZ4Uf1OMi079QY46WkbtzqSrpRfWiIiTJuIj4N
         csUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712737617; x=1713342417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bm7UxuqoJvIIipcWHzaYnh2r+UzAv7oGOAT76pDRbBQ=;
        b=tdKVyiS54OnPghJFWZA99UwEwvLK2wl+XjkgRvrxqrdl/w+aQx3j2iR5NAwagj4spg
         SFrMLMayovv3CTw2b6WNUBGQ8vUs9A8WUI9I+43VcZAsB1mxbtaKxeF2+Ur/1udgZzc2
         VmLaYjhN7in7ozAYLq0XJopNf16zd1xK6vmF2mpm3nc8xaFgOSV3zkUXtY29dJDxBR8t
         oHOClnZ3CkgHlXRU9gevHldq+O+d2WFa6yyCuKieM2yhaXYpaiLtY7+hbhMEQXQf5Hs7
         KLIPgjY2aScKikYptqtaO1XKMK3rmjHNFlkooM43nUz7/Cc4ltj3CCA1Y/vKcPxUN6ql
         MPug==
X-Forwarded-Encrypted: i=1; AJvYcCWRADnU2t9/qQ5n9jgQI/gx93XUtBYx/xP8JaHqskrTDfj78AUJPT4hf78wVZ00td/vWZf9kyG2It0kzBeCccebdYnq01cgfwHZkgejLw==
X-Gm-Message-State: AOJu0YxEYQtHRwy287NjZCMXU/57fS1LqjDfBzgGvqMrZofPnHhaFyPG
	O/DSrQ/sRxn4cSkZeMWfbdsBesyS2d1XVzhNrcfRIHeZD+3cDQGxb/vj0t9a93ekkhCiDW9a+Jj
	+
X-Google-Smtp-Source: AGHT+IHpx+ZlH0CcdhbdgqYAD4RIwZmGsa9/fN2Ex4V8ch2BDJU6R3H1LwOgynHIyWFZVPuIMXmAgg==
X-Received: by 2002:a05:651c:454:b0:2d3:8c1f:c0ff with SMTP id g20-20020a05651c045400b002d38c1fc0ffmr1868862ljg.16.1712737613013;
        Wed, 10 Apr 2024 01:26:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d4c91000000b00343cc702c56sm13253349wrs.47.2024.04.10.01.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 01:26:52 -0700 (PDT)
Message-ID: <d47ce3e8-8ce7-416f-be0f-2283575f24b2@linaro.org>
Date: Wed, 10 Apr 2024 10:26:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add description of CCI
 controllers
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240410074951.447898-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240410074951.447898-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2024 09:49, Vladimir Zapolskiy wrote:
> Qualcomm SM8650 SoC has three CCI controllers with two I2C busses
> connected to each of them.
> 
> The CCI controllers on SM8650 are compatible with the ones found on
> many other older generations of Qualcomm SoCs.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> The change is based and depends on a patch series from Jagadeesh Kona:
> 
>   https://lore.kernel.org/linux-arm-msm/20240321092529.13362-1-quic_jkona@quicinc.com/
> 
> It might be an option to add this change right to the series,
> since it anyway requires a respin.
> 
> A new compatible value "qcom,sm8650-cci" is NOT added to
> Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml , because
> the controller IP description and selection is covered by a generic
> compatible value "qcom,msm8996-cci".

I do not understand this reasoning. So you introduce known errors
because errors are ok?

How does it pass dtbs_check validation?

Best regards,
Krzysztof


