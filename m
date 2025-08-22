Return-Path: <linux-arm-msm+bounces-70379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3734B3160C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 287F35E2DC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695052E0410;
	Fri, 22 Aug 2025 11:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qaoPbcnf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810002BEC30
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755860547; cv=none; b=gzUMawQmnNF8oS4tIxXRIfZJue2pB1qgMAh9puFna5py1luZPFYiUur9PaMYQOK2Ap5fhWnJ/PrSWYjFbuUBsWO7sYAPFf7sgnZLGxdj5NwR+JakAao5rqN3u6FzD7y1w7yuptnJZio140TUvYkHh5+jA6B/IqC3/j/z1qBxyw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755860547; c=relaxed/simple;
	bh=xrZ3luu81h2Z0rZiK3yNp8vHc4we/Obi3qCTnsHSsxk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=V1E01SDez0UOP5cbAhNypzXNkFLO5IDaDbooiVPkSO9Y3dTtntNNcrWAvZg8pHp/f5gKHSFUsvsXigeoqWaUYBF7NyURSCrGeKOxEB7ZDYCeZ1dofS3YJmQ5ZKTcKJ1lqdDsS3KG002kTvH+TxS5HxKmrWmrbEsvgxjGjSlj2/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qaoPbcnf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b55ed86b9so1216805e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755860543; x=1756465343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EURP07SdmZQW2KWbnKhFoZWKzJWus82bAXE5Cr6kqT8=;
        b=qaoPbcnf6EGgCELKM8Chzqpcb8SombjWuDFdSXERs4F8RvIjfy/BrYgYDGKmX4Hete
         3E5/bosiWRIynEImEKGS6YVdBOMSOhke4ipU6aI6gbzUGk496UIikEJhYmpls86jGtK0
         XK6V7IgctW7kDmH+dYPNTFPveq4vPLMFlqoRC5W8zsH7tpFH5CRaUl0romTDPepncDgv
         LlgaBhogtyt8V3ztC/BBREbF6uVh7+yh1dn1GvfQ1OeW8Hdtl0/ZvgVINSbeuz9Tv/lM
         MRQQxQkg0FBfK+rsW90TeX5MuKvktYkAoa6ZZyRbgiAG5WBXxVKNd+sJEBqtpTJ8kNxb
         cX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755860543; x=1756465343;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EURP07SdmZQW2KWbnKhFoZWKzJWus82bAXE5Cr6kqT8=;
        b=LSJ07XSyMQEmFYhJBtlyX59c9fo5mkzGM1NfoF0HET04Jal0vFVdcaBSP93xl5ccS1
         cAOO0napzaYl60fHHb51VSxvlWbyunknUaARVe0Bw2o97wF/wfSWun7tdJztbUHDRN5G
         LezvqDvSUpi/ob2/BCkjySOjBNPkFWWWPG9NxD7hHvByj471zPUJEDO0N/NlpODpoDaW
         WtxrxJFvY1dUy/75XFb/0z4tlvB3q5Sv9lmUt6zFOidxyhIzhL4qZpYEQlsk5t5XFk0Z
         gplIa164PmH4/Qu1Cvhymks/ruJ3ncagMGLhifN4q3aAzGy5liiiwT6rhQvOAPTQMzMF
         jkKA==
X-Forwarded-Encrypted: i=1; AJvYcCV2BdP6BB/FqsMNnamwt2ktlxe4RZ5ohssOJjT0UGbNhCh9Mh4b8CYe29SGWWRM5GtWSkUSmJCkcBz2Ghw0@vger.kernel.org
X-Gm-Message-State: AOJu0YwYmVBSzwT+jSshVaItiTK4clDT959B29Yfy/aKU6cdS0pV3Mce
	5U+4SBWAJd/MCskciEqFlT8iNItqC7F2NtcfgxbpgXGv3Z0NB59LSk96ddNGe6kHqdo=
X-Gm-Gg: ASbGncvSl8su4ukE5jK6aY1HHJD1YagAS8AwouIt0TaP542D2/k+LdFoXbjx0UDez5C
	DvdU2MxgPvvDj8DcSisnZPj0Ny5nzl+Z7QbsPyQpDE2dhcqWpSI8NJvX/JXdJXHh1pxX9SdhIq1
	aTZNo/2UkvrQ9GC+6Ricc1fJZyu11VQif1FEX7qlhvKp+T2B1PHMru0KuLG3oIv+CK4XwzzTmNz
	nZFlCLZGqiUtnKO8N2LVf8ojIcQ6b++xc8nBCbqiJZUUG4amrKCRoW4A8IzRRlOQzvp8ohMfTOd
	65aOPuIhz+gJ8GTC0MOAj24MMYON1VDQW8ftfRrkLLdT0leiBPGwtkRoJ6OzSZIVKUzqV/DdlJN
	B9id5ItjHhQ57SvWF3yu09n0soXQCFbvjjM9X86zXZ9XkVoYOt0cemaWEahOBgfgeCV5aQfVYeO
	Q=
X-Google-Smtp-Source: AGHT+IE0Dex+3o6InK/YXUiV3XUtariytJViHjAa7y8QjqFdVq4V1b34qxJ2Y7CfjNPPeV8UpIYoYQ==
X-Received: by 2002:a05:600c:4fcd:b0:455:f187:6203 with SMTP id 5b1f17b1804b1-45b517d861fmr18589245e9.27.1755860542716;
        Fri, 22 Aug 2025 04:02:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3dd7:7361:c101:6a77? ([2a01:e0a:3d9:2080:3dd7:7361:c101:6a77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50dd02ebsm33068145e9.9.2025.08.22.04.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 04:02:22 -0700 (PDT)
Message-ID: <018751b8-8b9c-4966-94e2-f3ec8625f87d@linaro.org>
Date: Fri, 22 Aug 2025 13:02:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document default phy mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-1-f14ad9430e88@linaro.org>
 <yc7ceoq3bn3lkxdwkrk64ecubej64vblpwlwzyj5cuep2wmjui@nln2t2yicu7o>
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
In-Reply-To: <yc7ceoq3bn3lkxdwkrk64ecubej64vblpwlwzyj5cuep2wmjui@nln2t2yicu7o>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/08/2025 12:57, Dmitry Baryshkov wrote:
> On Thu, Aug 21, 2025 at 03:53:26PM +0200, Neil Armstrong wrote:
>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
>> of a combo glue to route either lanes to the 4 shared physical lanes.
>>
>> The routing of the lanes can be:
>> - 2 DP + 2 USB3
>> - 4 DP
>> - 2 USB3
>>
>> And the layout of the lanes can be swpped depending of an
>> eventual USB-C connector orientation.
>>
>> Nevertheless those QMP Comby PHY can be statically used to
>> drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector...
>>
>> But if a 4lanes DP->HDMI bridge is directly connected to the
>> QMP Comby PHY lanes, in the default routing 2 or the 4 lanes would
>> probbaly be USB3, making the DP->HDMI bridge non functional.
>>
>> Add a property to hint in which layout mode the QMP Comby PHY
>> should be as startup.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> index c8bc512df08b5694c8599f475de78679a4438449..129475a1d9527733e43ded5a38aad766f9810fe7 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> @@ -76,6 +76,19 @@ properties:
>>     mode-switch: true
>>     orientation-switch: true
>>   
>> +  qcom,combo-initial-mode:
>> +    description:
>> +      Describe the initial mode of the Combo PHY configuration.
>> +      The Combo PHY is a wrapper on top of a DP PHY and an USB3 PHY,
>> +      sharing the same SuperSpeed lanes with either DisplayPort over
>> +      the 4 lanes (dp), USB3 on a pair of lanes (usb3) or both
>> +      technologies in a 2+2 configuration (usb3+dp) as default.
> 
> SPecifying this as an initial mode means that it can be switched later.
> Should we generalize this and desribe it as bus-type (from
> video-interfaces.yaml) and allow it to be present only if there is no
> mode-switch property?

I was not sure about that, and yes we should do that instead but I'm not
sure about how.

bus-type sounds great, but the numbering doesn't match so I was thinking instead
something like phy-type with a string or use the numbers from include/dt-bindings/phy/phy.h

The thing is, do we want to keep the dual dp+usb3 as static ? I think it's very possible
a board would connect the combo phy to an USB3 A connector and a 2lanes DisplayPort connector.

Neil

> 
> 
>> +    default: usb3+dp
>> +    enum:
>> +      - usb3+dp
>> +      - usb3
>> +      - dp
>> +
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>       properties:
>>
>> -- 
>> 2.34.1
>>
> 


