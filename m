Return-Path: <linux-arm-msm+bounces-55123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 169D0A98909
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 14:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36BC53A825D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 12:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D471F8BC7;
	Wed, 23 Apr 2025 12:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2aOr6uN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CF51C5D59
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745409667; cv=none; b=KpdUuAz/SAJ83iNaaDVJWXONYTNLyskQjaEZAbZAi0+4DpZae4A4zo5wi6CIHlT7xF6JcWsUeFAX4zKd8QCYRP0KT2Jf4TrD2m/zHI5UbF5PL2BDjiLnUCiWUhTKPfGlQE1cOBQolCTj05JW7kv8QJLibyfmBZwftRJ/Ko+F9Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745409667; c=relaxed/simple;
	bh=v/okh2uK9db6XGoYeKy4qfBc5/ALnGtlhgKKSff6lk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dPeD4jouHhlMKL0jzF1gwgSRM2UmtwNCVr74tlWtIl46gkdifw27AmpgUY3/yV1p+9IDAp4iDsHy7Uef64n7wLOMCTIuQ2MEUujLIyOl0RtN21K7P6kPKTDL6uHif2r8eG+dvSmdrQUTxE+OA5kIp8bdNQHANGJejeGpO7hB8Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u2aOr6uN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso7139385e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745409663; x=1746014463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y81CZwpFg9ie+5P81GkFfG9Mtt+/NjlSJj14vXvrx80=;
        b=u2aOr6uNEwC62RKyRu+XWCOxi8425nzu138vAB74u4kk0C1AolMHSi5Z4bnalrIYwD
         /oiEbQzBmkpqfRTniQ/n6Ea+RZT+6t7VTf9s/pNqUKGcxXAOzucfAbysLYuEVLYz7FXw
         ieO81r1tV6Pu70+5JoBqd2BrszIW/JqGlcf3rToGaBYX7gmLtnWi/iu8uFKFKosTU1Pt
         L7B0jO62rXM9OwrdZ4Dlx81GzXHfRRhEHJVGmGnaATYi8ggCux6b38rWyUYgQe3fJw9Q
         RZIhbVniSn1GVMFEEKkYfPrigiKMZVWAe0pO06TSr8lZmXJA5F4/urCoVK9M/E2W4F10
         e73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745409663; x=1746014463;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y81CZwpFg9ie+5P81GkFfG9Mtt+/NjlSJj14vXvrx80=;
        b=TR8IQAd509Hzf3wk3WaAfvCR6peC9QqB0RfR9koAGWml6DhN6xd9+qcrZWWkZvWvRE
         a7Nj2o1TpaIG37ikY7po3gBCQRUU9CpfFpxSOdl2dAvl+e4qeK/d9wjIDvRilOmoEncO
         YaVFfwRWxUO75ymCu3R1GeFsBO59lEF+Pye8yZWSm+AjWB5336BemJAtHnpQVu7pdtUq
         IA6smOb9G731B/3gvUzvPJfpnNESsPZV+2rq9pJhzXVB5HH4lOsi9uhiypdmgtYLEqFl
         HA3KtVvELMfFxcN/7ZBDS3DK4h0Dw+zpIgW1Dw5zO/rqcgzlBkfUrr5WnnP1xU6Fhky8
         gzJA==
X-Gm-Message-State: AOJu0Yz43yKwO3cs5tzup1h62v1evaIJr6uZJ+Pcl7q+L96kp+LUxabA
	rdKinyembkEVNtLgotCuEYCbHZpLOSJJ5A+xsDvrI7I9sMWN3O6VipdMKp3yAI0=
X-Gm-Gg: ASbGncut4E0woOGMKJLvSel1lkmF51ClhWrUOjdifc+p31552DgnKWjIZre0KuxTWPr
	QIE85/PV2gQwFh7g0j17uKPZjSHI/kQoIXxXi1b6JVG2pECYQINvNq5yIU8Hx0FOnY9uyxl896C
	a+foT0tQA42mc7tj1r+vcbyARBPrwRc5SeYFrYijtMsdZD3JBl6Er4b2qi74E4d1nVYMp7IyJhS
	HxRsyuDr0U57l0/LGO+ABJx0EX3ZpvB/AePqa9lIDKAa+PkeaMYzt569FOSUCNivXqYTLFaNv1p
	thHfn4JhWiXS0Z/tnnQQ3qnDDQlR2JzSt6/IPnduIMgkEkKuE24W0ubtiuA=
X-Google-Smtp-Source: AGHT+IFkNpS+m9hBoAcVWPsQ+C2Qhq/pvGp6FhIJiQKGlG/tVJfm2X3Kvad2zSlhOC8APsCG+arKYg==
X-Received: by 2002:a05:600c:1c12:b0:439:9a1f:d73d with SMTP id 5b1f17b1804b1-4406aca6d18mr64322055e9.8.1745409663505;
        Wed, 23 Apr 2025 05:01:03 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d18daaesm24345165e9.1.2025.04.23.05.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 05:01:01 -0700 (PDT)
Message-ID: <1d75a955-409a-409e-8708-754e89d6f046@linaro.org>
Date: Wed, 23 Apr 2025 14:00:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: arm: qcom: add SA8255p Ride board
To: Deepti Jaggi <quic_djaggi@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_ptalari@quicinc.com,
 quic_psodagud@quicinc.com, quic_shazhuss@quicinc.com
References: <20250423003845.3980330-1-quic_djaggi@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250423003845.3980330-1-quic_djaggi@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/04/2025 02:38, Deepti Jaggi wrote:
> From: Nikunj Kela <quic_nkela@quicinc.com>
> 
> Document the SA8255p SoC and its reference board: sa8255p-ride.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Signed-off-by: Deepti Jaggi <quic_djaggi@quicinc.com>
> ---
> Changes in v3:
> 	Removed the patches from original series[1]

Why? This makes no sense on its own. Binding goes with the user. No
user? No binding.

Best regards,
Krzysztof

