Return-Path: <linux-arm-msm+bounces-75779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30CBB2AFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 09:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8D77322D18
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 07:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F262C08C5;
	Thu,  2 Oct 2025 07:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQtsbTz/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48F2224AF0
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 07:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759390014; cv=none; b=HhzWMTg/zEAtwGWbwCo0PZ7CBLlR47UEZ/XoH1PfrVawfFWxZ+wd35QyJl0/NOQB/GkiRJ0QaMx2kfwBirCUsR/9yweYv+mJJQnxfTzN64FCtkhscSq6UO7PERi2hOT8/fgzbW5bthg+0/rDmEmAho2pHfRbZA+X6VTDH5aHLR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759390014; c=relaxed/simple;
	bh=sG9fmz4Dxc0mqGKBEzFBPKIgWUeLcb/MhceTWoMOVg0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ERQhgkk7jx5UYHSZtOMW/iNJQeX4ObXTtPYEdFUoDOS/ZztHlNGRY5qHDPEDo2Ih9ASfLSbTuZcYT3el/VWKMDvfnACHHa4WfuuCMP/55CWq5GcS6K+H13xvPQ0pvImUeOCeYfpBPFHKVNlGn8eQ3j+RmJVGnvIaefbJviA7riQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQtsbTz/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so1412294f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 00:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759390009; x=1759994809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgFAvhDVaoxAtr2iADn6RVzu91lOh6v/w6Asw54CiCk=;
        b=ZQtsbTz/XZUc1Qodd+GnhoF35FEumJbJZCSc9MlqQsn/crv7sDumY6qTvZp8sSpUMN
         b2KyankVWtUlgkEmzY/aRPP9W7cmfc2tGZwGN2OaMdup9I21sYa8UAFyPTRxjHjF1e2K
         GW1K9m0EdFzPXRsIaImFhx7FLNpVUR7vHsqddLE7DQoMXGk+lgDyYUhB9yYb27uxrjTy
         cxEpHIW+p5MP2+uG03x/f3a61crKLhCb9RmQbQBYD3jPSLSpLcsRKMDivRWX+gNBZCPF
         rZxZ5YmW9Yxh5s3bX0u3e+qKm53V1zQpWJsiAcI/PMOnO7/6l8UdqGa5MRIrlwGrgETw
         gbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759390009; x=1759994809;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OgFAvhDVaoxAtr2iADn6RVzu91lOh6v/w6Asw54CiCk=;
        b=hA1rbv4Ll4E/Evtn7TD8TDxRPW/MgM0j76sDDndsTFLRcYxoVsWU/wOqWIwdFIc8Tw
         aR0oUrzZgpj2hQ/cwrWngHVYQ2e4F7TUvJJSSh254gS50dDIXW9tHCU3NZA9Y3fVFiRZ
         5cbiILA7QDaik70exkBgi0U/rmKz30IicskXuGUrkKO23YNfkZfAAnsgNLUIkvNL9/S8
         VgU0oe3ELCIRdKtKibXW9AjhszosjgbPyRomLsxLIw9++4UwhS9Nn8fAw8mmZTBCSQWN
         +r3yZBhqwvRgqv4wZkPwaRAWZC6NZ5x14x8GIjeEcbbEGOtjI/Ri5AnQA27V0KDVs3rh
         tYQg==
X-Forwarded-Encrypted: i=1; AJvYcCXUkRXtYdjsNXZkjxfDawj7QE8Djzdrt8xlsRkL5L1TnA3sfdjmqfkPmprEej5y78KOf6umWkGsiAJxe49X@vger.kernel.org
X-Gm-Message-State: AOJu0Yw33Q77JQ1xFIEBi2svnAIfre0OdCMVCYqfkXN597dhUQtSBlax
	Dr/0WtYYxsqDqBk+hBsXX6BZls0yldaS1vsmtPI7qoASpjrieb+rWu3gsFT5ivbbLfU=
X-Gm-Gg: ASbGncuE89rGD4iTStyBpT6p7hI3dFWgYcH4Ap6z+/39KfNSqC2FrJKLmCB0rgN16Qm
	wlOg0f1Xa1BnGJqCDlFZCDLHfG+9/+BbqGa26bhyNVnva5U5WU1mssKZU/NVXhCi7QMIrXgidNK
	7Rv8hZ6oIz7u8JTjV28I9EpT0ifq4XWCiRnTeWZChTWzISImyuDUDpfVWIQZjuSaw4v6FETzKbf
	QEz2cr5lrpIZxPUhcL5uHGDq+mI0JzvuaOMwgnDro/ioruBcnFk0QTnN+ygw1a8ytznpmR2GDRt
	md1usBhoWvWjFnpZnESfDvaKGXbh3QBoOsiA0LdFfAPoKKY7Eit++u1ipZMqTljwmZeYZDY4hfB
	P3RfNfPldLexrRXSR1F1J9wzRDAoCjNbFlTYMtqwYa9Vc8cujLeaOiKTNcMYr5olvM/7JCEtCBo
	rQkW6lYdOW5gwnnA6FDbwRPx7wYxBb4UAwxp+ruQ==
X-Google-Smtp-Source: AGHT+IFteDch3BVt0bDc3AgrulJS8q/xxMOCOQx7fQ+JlPLxSOHm9OmUPhVp7LLdzvzStKCXdc/FyA==
X-Received: by 2002:a05:6000:144f:b0:403:8633:b7e3 with SMTP id ffacd0b85a97d-4255d2b744cmr1489346f8f.30.1759390008988;
        Thu, 02 Oct 2025 00:26:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:9092:34c0:f6b9:8584? ([2a01:e0a:3d9:2080:9092:34c0:f6b9:8584])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab8fdsm2374781f8f.15.2025.10.02.00.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 00:26:48 -0700 (PDT)
Message-ID: <58d5f774-f0a5-419b-bea6-118cb98c944e@linaro.org>
Date: Thu, 2 Oct 2025 09:26:47 +0200
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
To: Rob Herring <robh@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <20251001163139.GA1877961-robh@kernel.org>
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
In-Reply-To: <20251001163139.GA1877961-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/25 18:31, Rob Herring wrote:
> On Tue, Sep 30, 2025 at 10:10:25PM +0300, Dmitry Baryshkov wrote:
>> On Fri, Sep 05, 2025 at 12:55:33PM -0500, Rob Herring wrote:
>>> On Tue, Sep 02, 2025 at 06:10:05PM +0200, Neil Armstrong wrote:
>>>> Both bindings describe a different layout of the ports properties,
>>>> leading to errors when validating DT using this PHY bindings as
>>>> reported by Rob Herring.
>>>>
>>>> Reported-by: Rob Herring <robh@kernel.org>
>>>> Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
>>>> Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 8 +++++---
>>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>>> index c8bc512df08b5694c8599f475de78679a4438449..5005514d7c3a1e4a8893883497fd204bc04e12be 100644
>>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>>> @@ -73,8 +73,11 @@ properties:
>>>>       description:
>>>>         See include/dt-bindings/phy/phy-qcom-qmp.h
>>>>   
>>>> -  mode-switch: true
>>>> -  orientation-switch: true
>>>> +  mode-switch:
>>>> +    $ref: /schemas/usb/usb-switch.yaml#properties/mode-switch
>>>> +
>>>> +  orientation-switch:
>>>> +    $ref: /schemas/usb/usb-switch.yaml#properties/orientation-switch
> 
> Looking at this again, this isn't even correct and I don't think it
> works. It's missing a '/' and  should be ...#/properties/... to be a
> valid json pointer.
> 
> I thought we checked this...
> 
>>>
>>> This is a pattern we try to avoid with references at a property level. I
>>> prefer you make port and ports not required in usb-switch.yaml.
>>
>> But this solution is also not perfect. E.g.
>> Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml should
>> only allow the orienttion-switch property, while using
>> allOf:$ref:usb-switch.yaml allows all three (orientation-switch,
>> mode-switch, retimer-switch).
> 
> That can be handled like this:
> 
> $ref: usb-switch.yaml
> properties:
>    orientation-switch: true
> additionalProperties: false
> 
> Though if you need unevaluatedProperties for some other reason, then
> that won't enforce it and it's just documentation. In that case, then
> perhaps usb-switch.yaml is not the right granularity and should be split
> up.

I did a split up at:
https://lore.kernel.org/all/20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org/

> 
> I put this into the category of "this is the least of our problems". I'm
> not that interested in enforcing what common properties a device uses or
> not. It's undocumented properties I'm worried about or lack of
> constraints (on reg, clocks, interrupts, etc.).

Thanks for the comment, I'll have a look if this would work.

Thanks,
Neil

> 
> Rob


