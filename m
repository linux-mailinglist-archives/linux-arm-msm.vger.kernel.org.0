Return-Path: <linux-arm-msm+bounces-75631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E00BAF5AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 09:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C47C318978EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 07:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381F02343B6;
	Wed,  1 Oct 2025 07:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dmxYv+BK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490E91D90DD
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759302448; cv=none; b=BjJQIEAowE/5Eklovw3gJZpkc9OXtEi4moivdd1YzGTYWtCoZQVtwyym1yjnOR8wTVaWsnsXRARcc0Vfjon+9zNzUGekq6rFlJPESqEvBzLox6pIZ5sJaxvMbKAfIo0N41o0N1s7XeKFh8fvrUtEdhAgcswWqfUHrQK8eJGfKwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759302448; c=relaxed/simple;
	bh=TXavt5GUo/dW2X4D6klTWaoIUqB5VD85VTgMFo07NnU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rpkfJqEGxkX8F+ECF8Co/OYWRcg+8xlSdaIu79krgURXoz6mpomGL7+7iUrjgBASyg+osCnIOAn2DfTD7NO+QC7subXoVGUKZpaXBREzeftDjpI/4Ka5r+i2CWkcrE/oGNzWrnVbFRrDDV18dQz0hGjOBlGpKMy5HNGIvhoezr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dmxYv+BK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e4ad36541so44705605e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 00:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759302444; x=1759907244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6903O+T5kzlWuzZHa7QhKxp3lHsZbgO6JKoHA8UWXyk=;
        b=dmxYv+BKiVFZnX/Rccrm76jXUTd0jV6FweHrtRloTLYJQz1xj0KuEVB6Gmar+VvTcC
         OpWHh9eJIvLHBkzpxRXyTVMjkxqWrFQ1pxnudvizOWxBncvvisZRw2TSLjpTL2BoWGXk
         Cxx/G6ekAR+4DJC6DxAJwGHw7UxvsCDObUW/AA+LIqkrCeq3o4J1Lf7HCpZRZpwYAxw0
         PT+StQRUQ6gjk1Lna8WA8hkeW/bf7anO8dhvWfoEPz9IIV+fZ0AZKDkKblrP51r2KyqJ
         /CZrGZvNV3bYr/vdmbRytRA8trqbbleAgSkGX9FlWqdre7zdeujCGTH91NcEddgVr0bw
         9jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759302444; x=1759907244;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6903O+T5kzlWuzZHa7QhKxp3lHsZbgO6JKoHA8UWXyk=;
        b=TphYANNwCSe73CKxh+paOJ5xweakh0YNYjSaOARfzYVsTOB6r5rNY4v76jXOgvEbJz
         6YKgydmLqVRkLT3ZDgMNtSmN2j5utr5WH3qogAq+mMCm1KOv4RAR7rkpxHmekgE07KBj
         /CPPi5DElpNVL0vUP1if7EycQwLCXDOxRsW/p9Tt2+gIcMgwtBNrp96fuUqo+sEBIot2
         kxDx6mtSmO3+qLV3x1sdpDn8JejvJGSpniUmLvnG+5Kue54/wCJ0A16zyhHBFqyoa+BV
         vSwS043McjBM+7KIavKt1K/hOhneTtY0tUo5Cex0GNBkapFYvSdI0LuHrqwKQvlMkcGq
         q/mg==
X-Forwarded-Encrypted: i=1; AJvYcCXfjkpGrjHcYO5/ETfEhGez84FcI0qnqIjCoASAfgmOJ9qeklIgOUjSfbGD651ftkUXIvV28jqw+Pirwa0P@vger.kernel.org
X-Gm-Message-State: AOJu0Yx22owjGGs2wEFSBMuOAoShhvgzrzIIwGo0JsqPiSQeIHHKO+4n
	4VVfu1WQ4sLrj6SrydYaWF143Jsf1brJp0c9Rkss0nBByhj0IQELGd8AD3X1iz8YIm4=
X-Gm-Gg: ASbGncsEB1K4wbbEGXoVwLzmblbSUaT4dGaxog6T3QYcz3Pg7/ER3fbEyUa3DtLf5l4
	bX6H9iyLHazqeOIRBm28xoJrCH8j5aq7i0s9P8oGYQ5yocZgm1Q599QoDNFbQRcRmjUff6yWe1C
	oymsLMeBcTHB6jzloOLQe6BnJkmjpwUDg8n7vdN/b87NtuJcspeySo+DBiZk1uKDxK8L3AzHNsR
	S7sDK590FVdnRkMma7yGO5G71HOc6V66hv2/8aNc2BcNCtDTqWKFiZP6uRJQv5A89dK/xVzwanQ
	PAfVhMV4nj/qcoILsda7CsGLeE3+ZhuMoL8lt4gLAsbgP/H+W3jqCpASr+qAAnLX7sKCjn0LDcn
	/uQK36YmGA0l6iaBFMZZ/oMctMsrOxUFZBD27OZMm7yEaMvT9K/5fQghWPvto3d0lG9UH6tDTX7
	iXRXniolLybcIOjyQHS8lp1Gw=
X-Google-Smtp-Source: AGHT+IGBw7CxJ7qDcqycnbC3TnzJ/BlwqGMYHQoYN72vdTSBaOUGSkrrJvxGgqOYBs6co2ci25rVDw==
X-Received: by 2002:a05:600c:3b13:b0:46e:448a:1235 with SMTP id 5b1f17b1804b1-46e612861fcmr23527745e9.16.1759302444501;
        Wed, 01 Oct 2025 00:07:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f45f:c590:9006:d394? ([2a01:e0a:3d9:2080:f45f:c590:9006:d394])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e6199193dsm25464495e9.1.2025.10.01.00.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 00:07:24 -0700 (PDT)
Message-ID: <99eae1be-3067-4698-aa3f-a0ff565cb62e@linaro.org>
Date: Wed, 1 Oct 2025 09:07:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: do not
 reference whole usb-switch.yaml
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250902-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-5b4a51c8c5a8@linaro.org>
 <20250905175533.GA1000951-robh@kernel.org>
 <nwtt76n4t7tlf26ex47wrot7g7nldtmavbzgwmluls3egamjsi@mkomopb6fjh6>
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
In-Reply-To: <nwtt76n4t7tlf26ex47wrot7g7nldtmavbzgwmluls3egamjsi@mkomopb6fjh6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/25 21:10, Dmitry Baryshkov wrote:
> On Fri, Sep 05, 2025 at 12:55:33PM -0500, Rob Herring wrote:
>> On Tue, Sep 02, 2025 at 06:10:05PM +0200, Neil Armstrong wrote:
>>> Both bindings describe a different layout of the ports properties,
>>> leading to errors when validating DT using this PHY bindings as
>>> reported by Rob Herring.
>>>
>>> Reported-by: Rob Herring <robh@kernel.org>
>>> Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
>>> Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 8 +++++---
>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>> index c8bc512df08b5694c8599f475de78679a4438449..5005514d7c3a1e4a8893883497fd204bc04e12be 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>> @@ -73,8 +73,11 @@ properties:
>>>       description:
>>>         See include/dt-bindings/phy/phy-qcom-qmp.h
>>>   
>>> -  mode-switch: true
>>> -  orientation-switch: true
>>> +  mode-switch:
>>> +    $ref: /schemas/usb/usb-switch.yaml#properties/mode-switch
>>> +
>>> +  orientation-switch:
>>> +    $ref: /schemas/usb/usb-switch.yaml#properties/orientation-switch
>>
>> This is a pattern we try to avoid with references at a property level. I
>> prefer you make port and ports not required in usb-switch.yaml.
> 
> But this solution is also not perfect. E.g.
> Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml should
> only allow the orienttion-switch property, while using
> allOf:$ref:usb-switch.yaml allows all three (orientation-switch,
> mode-switch, retimer-switch).
> 

I agree, but I'm not the original author of this change.

Neil

