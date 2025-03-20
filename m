Return-Path: <linux-arm-msm+bounces-52095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 390AAA6A865
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 15:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 983BA486CFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 14:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE7822259C;
	Thu, 20 Mar 2025 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fb2xLXAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49680222560
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742480495; cv=none; b=MQG0lcsuRXWpQT9VxoEYP8G5jkXVzyJUyNDbG1a0J8T0JiKK2C/iSZQH6ZKVCPQZXiUhcllFiZ1En50TlgnnGMl0I1MCnl7A/70LmsAlore1Xz/yBCs7hICwdBspkFkTQWRfS51qyo/OlZBLIqfhR4lKrJpD6rlIdP3hJ9Rg24s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742480495; c=relaxed/simple;
	bh=KM4ZCMaCLFfkTKaneHhDJ+FlPOOBtprvWKZvUFRSOko=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=besQvpxUMexKimeVhhdUFMCIcm/0UefIrUBe5TC9RhVY8rq0ratnX8KRvKB8MCYqKze4ebOQoj1WDL/flhJVjo42DIncMLmfoK1sypWH9x03n2LK9X4IIA17f2Ug/sA1JtZ1zWFFd7nDtTgVz3uUVvReW+14mox7CCbK7IFWY/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fb2xLXAr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so5688055e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 07:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742480491; x=1743085291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZbg94QK7tAjZ4eqQ8xaJAIEHJ1PEfH8AojbdclcFGM=;
        b=fb2xLXArsFgmWyCE/nONlc1OHxH2mimygwuFvOqkfuAW6gq7uLAN1Lqi0Tc3vfF4Pm
         uYak3CDFRnZCLS+eXxZJIqZ2pn8TcX8kIfdbaXheLA+TE5POblR6NkdUYpdD4jX0xvdu
         g+O7qM3OWN3TqM+c7lWBp9mZ17HhI3QFsjVlXqd3V5P20S2wIH7X3L5GODYEU5Ovf7CY
         JjDrIHsP6o1I7uBnvbKBE1Ii84xgzodvbwHNybjeAgIPtQVtPBM73uyETVDLfL4Tdh8u
         AbyBd+s8dMvS+LlM98MXBVXYWmkLE1lUGOfCrVSh4XXkze2k+6L6sQUonSiSLGjLCyXt
         c36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742480491; x=1743085291;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NZbg94QK7tAjZ4eqQ8xaJAIEHJ1PEfH8AojbdclcFGM=;
        b=A+ldi6FNiDhaLrRbKCmDXJaNX9yyDYaqgFh6ZWOPM8B3OPwjE4sFk++LpaTpiHy4ID
         fEgzTddbKJqfZIkicr4gVn3/8N6tAVEutA9B2bXHyC8eYvfMzmn1cY5Dih7QyCdJlh68
         q2istvgzIAdPbbJCtk/Dcslkqu1ef0ELkniyXT1kQVRf7RF7/dchDibENO3Miw5eMxxc
         yywmmAjP9WhULpSWohsuQ/PWjEYlCocjbsBpnU9Dfc/fmT3SZrgSdt41a9dBYsf7QvF4
         mWC9xRZ/8gcscYSTakeSaRgPKLWZzWKTRB3YPguO1Q69qHW6fGPLFci1XCvARN3Jbw8C
         Rd4g==
X-Gm-Message-State: AOJu0YwZiLVNa3JPHnVs8ee7sNPaL3wIzHW4Z/9/NPbo7nnt1KMlZZr0
	+hnjW5pBZGAnluX41JYdGDjbZyK+l+En5QI7lNMjwMrxrTN1sWpsnwmuayE3qsQ=
X-Gm-Gg: ASbGncssiTM90sQlSI5R1UwQMdEPG2LsjFxfXT7AE+ilgEx6DqMfa46uNy0J2WiodKf
	87Cn6JyDb/WODF4q/YM3vNKHFVCNX5kynrj92PvJDGSxHtdB2Nv1eRaCPwmiYMO5a+QlN6tWtu1
	FWhkfocqzydb2c+TP7LvbLJvMlpe1OFAprYIe/LO+5csCSwkgjpjaFpw/oZgM9YMbN3CIRYnh/b
	6Yp6A3WkJM92WQX450Fe2CActxedA/cCzh9wpYRV4Hv9I75AgfViKEtFz3D00NUBHlVzmFsTsi8
	MqC03yimh6cCmIhbLxEL1BaPQV/YxOAthczS4EAqeMUCswbnP0m5nxG+27peipSvwEHPNJN3r2v
	kWmKAs1BqtUy31qBQ
X-Google-Smtp-Source: AGHT+IHwKg3G7PLtrFm8wWRV8MxbX7wu9hl+TgEb8GtAYHTVjykg6cpeFV88/xcw1UY02BI2wxLzKw==
X-Received: by 2002:a7b:c314:0:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-43d43793107mr56231295e9.15.1742480491447;
        Thu, 20 Mar 2025 07:21:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3bd:568:f697:d1a2? ([2a01:e0a:3d9:2080:3bd:568:f697:d1a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40fab8sm24634233f8f.63.2025.03.20.07.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 07:21:31 -0700 (PDT)
Message-ID: <9cdd8ed8-082f-4b17-94a0-e8ee61b9da9c@linaro.org>
Date: Thu, 20 Mar 2025 15:21:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 2/7] dt-bindings: usb: Introduce qcom,snps-dwc3
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Saravana Kannan <saravanak@google.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com>
 <20250318-dwc3-refactor-v5-2-90ea6e5b3ba4@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250318-dwc3-refactor-v5-2-90ea6e5b3ba4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/03/2025 20:05, Bjorn Andersson wrote:
> The Qualcomm USB glue is not separate of the Synopsys DWC3 core and
> several of the snps,dwc3 properties (such as clocks and reset) conflicts
> in expectation with the Qualcomm integration.
> 
> Using the newly split out Synopsys DWC3 core properties, describe the
> Qualcomm USB block in a single block. The new binding is a copy of
> qcom,dwc3 with the needed modifications.
> 
> It would have been convenient to retain the two structures with the same
> compatibles, but as there exist no way to select a binding based on the
> absence of a subnode/patternProperty, a new generic compatible is
> introduced to describe this binding.
> 
> To avoid redefining all the platform-specific compatibles, "select" is
> used to tell the DeviceTree validator which binding to use solely on the
> generic compatible. (Otherwise if the specific compatible matches during
> validation, the generic one must match as well)
> 
> Mark qcom,dwc3 deprecated, to favor expressing future platforms using
> the new combined binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
>   .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 620 +++++++++++++++++++++
>   2 files changed, 632 insertions(+), 1 deletion(-)
> 

When converting sm8550 and sm8650, I get:
usb@a600000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
         from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#

So I guess it should be added.

Neil

