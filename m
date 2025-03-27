Return-Path: <linux-arm-msm+bounces-52662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05525A735CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 16:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2953E189D1EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88981925BF;
	Thu, 27 Mar 2025 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fiNAEZ/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DB112C7FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089953; cv=none; b=JKwZsMHt5YCzLNYmxCmc2DnbBX+FyX9gc/VD1QnXiGarZCLTcl95fyO1MEyHJJnF5lnKYkczJui/GJgQs0+A2fwDqqH9sdG/RCTuVzP6WJJqat+9YNZ0Q9rIbF7gd72i+KE3MUAh2yn+eCXuOoKATGrAqfh7f4TObU74MNB2FT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089953; c=relaxed/simple;
	bh=iAOo3qQbFdHRPvpiwQ6URvgLoftj9WyyrxLOyXzy7dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=asuRYsB/tumGoJecpnra5apU3vAe+tkwsXhx2p9Hq8keFAloUfO7TaQam4q9iZfywrQezqnZa2auLOxw5Qgs6ZMHMO3nGBGWPfWKRiuzWwAuI+ksuFF2HarxizVS5F1XS+kOhT869KWkbzI5WP7eoUWmlcRtiF3HXyreq/Ps6hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fiNAEZ/d; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so940683f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743089950; x=1743694750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ymoLsASUKMBlyvnyVSwfPY6l90pScenHxGprvSvqScE=;
        b=fiNAEZ/d9tALL/K9+gx5dOddzfLq5Ka6+AHb1oYBXgOqvuO+GmvaI5suqkj0y6nhWA
         rlPePQSuOl4Mgm3bIO8kWfEH1OhRa1SHZ9ZfyFveQeqo6XXylGeHbgLgkTafHw5f3sny
         QPUll3C09sHHs0p8HsKSZ5SlIMu4Ih76lzUMb6uAFTmZAAGyCRixOXoPD3PSHekIWqQX
         d4fRPi6GOaRiUWBIhhfPrTDZQ6Gyzmzrz8O/m7aA2ihMkEqM27raNKJYIcmkhv3oNrEg
         oeWQ6rY7ritNZzpPCQadUgqB42Ha3OyZaSRdhiTZ4vqtHsXQS24+Q+d0IG+bXr0wCnlv
         UdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743089950; x=1743694750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymoLsASUKMBlyvnyVSwfPY6l90pScenHxGprvSvqScE=;
        b=rI0ujuykue2PgrGzIEUZpiZgvmLwEbt7QraMW05ruptd7gYXjCnzw2UYADIEQ09J8t
         DI0YDdHQeDTSnKSNdm58fbEUSNen4T7qb0Loe74Wop2j/Qf5jvwBVaMlfcCo8FRiYAGy
         ZLr0RWnys6MzyHqrBhQMKy2zr+NY8pfaYq8a8vQive91qHsRimW/oESWclZT6LoPMfjg
         6yXfrTNznJRIbvACuy6yW85qb3i6jIx3oJNOWKs4Qfl8jIWiNwdmka21DW4yWpb37CwR
         eCiq5IKJ9yvCF+wnVQIr1zENXf7M1KStm2HAm18M700KHBnzITSYA0IJU7wKhTaH2lP2
         t6rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH1HSgZqA5Kd6XPOD459bg/B/hk/8N9PzmkIG6cKUYOPnix5v5d2b7/YUHeo3MaDGZyuIrx2oGnMIsZ9Hi@vger.kernel.org
X-Gm-Message-State: AOJu0YxCysjHlhKUbAhHjlrYIFYlPr3dG5EF+qK1mYrDvYDFlvN+UD4b
	qIEQ+c7yxTzMbk4daszC3jxBhpkGKarS9gz+6iNl8sRHtBwe6fUHEJ3ETTWpbWs=
X-Gm-Gg: ASbGncs7fwgSkhjrXFbTqlaZMw55sUgJg8oN6DEuaA1WDkMn1o4IX0GwI79BZI4vTWc
	i/QPFoC/r35LMJOtB23QRnlCynFXFn+zTA7T6VUjzL3p8xeTDxCcUjsVPKYKNBhaUnntSumEQ5u
	B3/Tt9s9g9vmk01qXu03KXxZELPdMd1aMatugmHc/MBzZgbfGpMDxwjJGKg07g8DrROB4sfanls
	lrb/e8H9P6YRzkqdBQ7lKBzBfcXgM+kkP2BSl8/G5KmR7NHOY3FS4pvHJXIqmULIQfgCHbo5BK5
	cHLzbOyt4NZAs6lcdYxbIYFOVOQCzbOsrnq7vEWucFP4u7xFQ0C+502F4DvIqH41eiAtuQ0qvw0
	aaVGtIbqYj9WvhNkfYHhu
X-Google-Smtp-Source: AGHT+IGyrq8BLj3GNTEbMeK2aMER+K+7T12e75iuTsRmZkET3cjw7uq2dfr/7idg5JtEdGKRe48sdg==
X-Received: by 2002:a05:6000:2a1:b0:391:466f:314e with SMTP id ffacd0b85a97d-39ad1741a73mr3848575f8f.16.1743089950131;
        Thu, 27 Mar 2025 08:39:10 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef16csm20195844f8f.86.2025.03.27.08.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:39:09 -0700 (PDT)
Message-ID: <8721c38b-3414-4635-871d-2bd142fd23ab@linaro.org>
Date: Thu, 27 Mar 2025 15:39:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-2-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-2-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 09:52, Jagadeesh Kona wrote:
> Move SC8280XP camcc bindings from SM8450 to SA8775P camcc.
> SC8280XP camcc only requires the MMCX power domain, unlike
> SM8450 camcc which will now support both MMCX and MXC power
> domains.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml | 2 ++
>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml  | 2 --
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> index 81623f59d11d73839e5c551411a52427e2f28415..127c369dd452608e5e7a52c7297b6b343d1c1bf8 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> @@ -17,12 +17,14 @@ description: |
>     See also:
>       include/dt-bindings/clock/qcom,qcs8300-camcc.h
>       include/dt-bindings/clock/qcom,sa8775p-camcc.h
> +    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>   
>   properties:
>     compatible:
>       enum:
>         - qcom,qcs8300-camcc
>         - qcom,sa8775p-camcc
> +      - qcom,sc8280xp-camcc
>   
>     clocks:
>       items:
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index 9e79f8fec437b9aecb5103092f6ff2ad1cd42626..883f12e3d11fa16384108434f6de120162226a28 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -15,7 +15,6 @@ description: |
>     domains on SM8450.
>   
>     See also:
> -    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>       include/dt-bindings/clock/qcom,sm8650-camcc.h
> @@ -23,7 +22,6 @@ description: |
>   properties:
>     compatible:
>       enum:
> -      - qcom,sc8280xp-camcc
>         - qcom,sm8450-camcc
>         - qcom,sm8475-camcc
>         - qcom,sm8550-camcc
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

