Return-Path: <linux-arm-msm+bounces-4579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D58811D84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 19:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3DFC1F21990
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 18:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27465EE7C;
	Wed, 13 Dec 2023 18:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xWszgZu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE08B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 10:53:20 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bf4f97752so9440126e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 10:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702493598; x=1703098398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Ku/fxQddbUsXkZWqNsVN6BsYEZ9IGNwS0N2UBJzX60=;
        b=xWszgZu+Vm/C9K/hBngjvPCRxwLc0rJaz4zwxi2wOVarZKtt446oQrjru+LR3w5ynb
         R8kmoZRdYPtzk9sBnJWJgqy/RwXFz+Wuj5x94R+z67Zwf4THcoV+KeAhNp3TKgCVKqiL
         tyD0644N3IeI33VGtLS55cZ+Mbw5832PWzkOmplZ8ZUGlpvIIEt6ENRpDfgCbWVu3Ueq
         NIsoK9qlsWjoEP3vGBL6o/dZZ99u2YkNoviM+zMohYF1IbHeHpr7FhtQhtlU2DZTWzlG
         db24Z4O5v7pahatAGE4kbCgThjJO02faI0BTTl4Leb7K7MI3Xs9MUobkjSEslHmo0GOf
         cyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493598; x=1703098398;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ku/fxQddbUsXkZWqNsVN6BsYEZ9IGNwS0N2UBJzX60=;
        b=XHUisa7PFruSO+l/re3gKSwy6RqUl2u/hlWH0sEioiAaxs33oTkDlzlvTefaj6i7KF
         F5wcw5bqFBHIZlBprM96UixEbZ+Cf06BVou2dm8wZNhCBLRTqFW7GahsXpPvUaHWM4st
         Eun77uq0y1rpepsTdrp/ROjukvCIeerK3n3w2cvQr0+REGTlG9t32cgf3T/8LLkIOqUq
         y7vn771+WDGHqpDkFH/fAIN89Ekup5fM0OSKz3L4yYkNh4GwyN25K/UzVURufLBtygW3
         6dija44xfe56qosUKzYHVcPfXGbiEYkO4irVj6GhNbWDqGecEjhtXRNj+d/8XtB9taJX
         ys8g==
X-Gm-Message-State: AOJu0YwKloX4kNLZvLkV/qScLQE0pQobguM7LITvkLu2LWwlKa9/u44J
	Vf29YJ4JapbB6qs85Q7r6hE42Q==
X-Google-Smtp-Source: AGHT+IH0bW4AvMCjtk+XJm9PdTEIKUL3n1iUt8XkWJ1rYOdghnW2zZH3zuCvd8eROOa1wcRaHZ77xA==
X-Received: by 2002:a05:6512:104d:b0:50b:f380:5fad with SMTP id c13-20020a056512104d00b0050bf3805fadmr5430181lfb.87.1702493598296;
        Wed, 13 Dec 2023 10:53:18 -0800 (PST)
Received: from [172.30.204.126] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p12-20020ac246cc000000b0050bfe926aa0sm1684135lfo.253.2023.12.13.10.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 10:53:18 -0800 (PST)
Message-ID: <a1ba5894-89d3-49a2-bb52-6599274c00c5@linaro.org>
Date: Wed, 13 Dec 2023 19:53:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sm8450: move Soundwire pinctrl to
 its nodes
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231213162536.171475-1-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231213162536.171475-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/13/23 17:25, Krzysztof Kozlowski wrote:
> Pin configuration for Soundwire bus should be set in Soundwire
> controller nodes, not in the associated macro codec node.  This
> placement change should not have big impact in general,
It did ensure correct timing for rb2 so YMMV :D

> because macro
> codec is a clock provider for Soundwire controller, thus its devices is
> probed first.  However it will have impact for disabled Soundwire buses,
> e.g. WSA2, because after this change the pins will be left in default
> state.
> 
> We also follow similar approach in newer SoCs, like Qualcomm SM8650.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

