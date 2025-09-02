Return-Path: <linux-arm-msm+bounces-71561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F458B3FF4C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BBE23B3740
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB31E2877F2;
	Tue,  2 Sep 2025 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D2cy1lX+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946F428850D
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814349; cv=none; b=vFUtm1WNe83d37L56SUS7ju6kgQcZRXTvh/VOsY8b73yV8c7BdsMyXDzpXQHrv0wfB2F+D/JT8w7m/XUdiEYdZDy5MXLClL3akHzHSyeqUxIMI+ItP//jMRbncTU0SErUbQSYpvNhpjhQAhvCzcGhCozq6H2Bd+Upav5IbW2oQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814349; c=relaxed/simple;
	bh=qgO3eydU+wK9TfHPkeIxyv5wj68lehy6hm1tWz3wFf0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AStZo9AOwpgMtU5drNxlADQS0hJmL+cjPKXYjeZcfrnPBSXBcpCkYoFDjTysgp4m7hr/ckTyb4NO+9Ot9uYgqioNbadfdz+tHO7aPwVkY/+vqKtu0fSybsoCR8GpJxddoHhV+4+kna4e+yJxY9j79SjG8viaQrNLPSGNiVFO/As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D2cy1lX+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b84367affso28068205e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756814346; x=1757419146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfozmRqc5klIxa3RyN85ghWY3Zq4Ji3LuVvxL8BJlR8=;
        b=D2cy1lX+s74YnbnrqSlIizB/75gY+3WUxoh2Vaf6z/rssY7DhNzmFQXCq/uUScX6CA
         6U0S/wx2/qlsMsN1vwrIDIR6OKnm1uKnDWfZd/VFMg8CNYOGBVBy+VHkUOcgdFl+gx5q
         /aYBw2HIqsR6m4LJGSjNQx2W2Rfg7Itq7yDRKPI/DTvKBQwSc+4CW1tSJUFcJvSKBJcw
         tHw2Ac9Qbpd35eUZP4uJFd3EGAk7n8og27ydP/l5H2URhMz9ytFJmZsqwlMvUjAHCwha
         S5cxQv74DBSKpFVxMF6RY61uutk0quI6V1mCWcupFZ7a1QWw1WUacPGpPmYGk1z1ml+m
         bQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814346; x=1757419146;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cfozmRqc5klIxa3RyN85ghWY3Zq4Ji3LuVvxL8BJlR8=;
        b=G062DInjNfDmEhwKMOFH/+bWp06XxxkSftXL/wdpnWGmA2ZqaOvL9V2syLy1D0Ku0G
         e8hkh+5ySkfc2jBanDUi+cIVyGe+3TBWvj4t9mK9N1oh3s6GmNypTWcKQ13Ly1BJhprS
         ITju4PjBCZUb1nhLIsDHQ5am60BHAaUMKACcK55FC1x75CX+WLKg5U+teeOEuyPl4u1E
         mOIose46WfdqOa8d8a2Z3tNcxup1OUIVjAfqRhwCsSZtDbA8CWncicFXOE7wKsTXqoo9
         l6QXw2ybvNObnfglE+d5s1DmlF1iT1OlAOV99ktN4SjkLUGhZB7LeMyuMAgJbWXGnvc4
         urrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSZ6Lb2Cw3XzjqxaBnomZ+FaDDOoHdKm9bBu1aWKnOWHltBIEioE6aRj4pNBDwrp9pDLlaqOvFH++b1nS1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8L9wk3AcxBx4JRrqskzvNshExgRy2sW0Bw/ITlTkdHmHqVy8O
	J3LYOcHCwxQOzqZb/YLTXTd0jBRbPsk9vLv4LboFeROxInYI3BmVldfqxwE7vQlLRPg=
X-Gm-Gg: ASbGncuYMB51MzEgyzHQMzwPlhSFmwHaLTHoNdUgvaNMA0sI+DPogDQT7ycTctRhAwY
	ibgF31fbv8SIvfm1I0T6gg0GtUenv/CHu/Js/j+DJL5fkf4y5fKTh5YoPhqtKuv+r8OuV+T9JHC
	poPSSIjqNj9efNQJ18ShvaGGQdUStSOcd1BW9LfSKzhpNuLMJ0SD3unJmnji+HFSAG+gBpsF3q0
	Ga3966y3SEftQe4RkRzL7wk6z0gfOnscskn4OAQM6CtCPWJR2Vw2nwSHE8DGdXmCR6nr7tZP6ZF
	I0Ly8N1d7q9H+BB223lSrMgDWQxsajQI+y0Ua/zyLQQpVdUvNPkDcRZ5gieg+at5hQ2G/zh24ve
	KdnQv/I/MFOcU5MuAH58JUhWiKGFmdovpmxNuV8elcG2NB2Ay1IZoGDvw+Yk0uiC0jL5vqqktZG
	8=
X-Google-Smtp-Source: AGHT+IHfEjTcncJJziF6tVTU1GKIoXvzo/P7QV8DF5yvdpb8f9/w5wQ4b+oMozpd1P6m48QaIn2vYA==
X-Received: by 2002:a05:600c:1d07:b0:45b:6b57:5308 with SMTP id 5b1f17b1804b1-45b855508e0mr98283745e9.7.1756814345771;
        Tue, 02 Sep 2025 04:59:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939? ([2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm194388675e9.12.2025.09.02.04.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 04:59:05 -0700 (PDT)
Message-ID: <455375d4-c558-4d0e-9284-23905c8d0bac@linaro.org>
Date: Tue, 2 Sep 2025 13:59:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document static lanes mapping
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
 <4dff9cc2-2152-48a0-b8ab-eea57ce2ace2@oss.qualcomm.com>
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
In-Reply-To: <4dff9cc2-2152-48a0-b8ab-eea57ce2ace2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2025 13:50, Konrad Dybcio wrote:
> On 9/2/25 11:00 AM, Neil Armstrong wrote:
>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
>> of a combo glue to route either lanes to the 4 shared physical lanes.
>>
>> The routing of the lanes can be:
>> - 2 DP + 2 USB3
>> - 4 DP
>> - 2 USB3
>>
>> The layout of the lanes was designed to be mapped and swapped
>> related to the USB-C Power Delivery negociation, so it supports
>> a finite set of mappings inherited by the USB-C Altmode layouts.
>>
>> Nevertheless those QMP Comby PHY can be statically used to
>> drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector,
>> etc... without an USB-C connector and no PD events.
>>
>> Add a property that documents the static lanes mapping to
>> each underlying PHY to allow supporting boards directly
>> connecting USB3 and DisplayPort lanes to the QMP Combo
>> lanes.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 29 ++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> index c8bc512df08b5694c8599f475de78679a4438449..12511a462bc6245e0b82726d053d8605148c5047 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> @@ -76,6 +76,35 @@ properties:
>>     mode-switch: true
>>     orientation-switch: true
>>   
>> +  qcom,static-lanes-mapping:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 4
>> +    items:
>> +      enum:
>> +        - 0 # Unconnected (PHY_NONE)
>> +        - 4 # USB3 (PHY_TYPE_USB3)
>> +        - 6 # DisplayPort (PHY_TYPE_DP)
>> +    description:
>> +      Describes the static mapping of the Combo PHY lanes, when not used
>> +      a in a Type-C dynamic setup using USB-C PD Events to change the mapping.
>> +      The 4 lanes can either routed to the underlying DP PHY or the USB3 PHY.
>> +      Only 2 of the lanes can be connected to the USB3 PHY, but the 4 lanes can
>> +      be connected to the DP PHY.
>> +      The numbers corresponds to the PHY Type the lanes are connected to.
>> +      The possible combinations are
>> +        <0 0 0 0> when none are connected
>> +        <4 4 0 6> USB3 and DP single lane
>> +        <4 4 6 6> USB3 and DP
>> +        <6 6 4 4> DP and USB3
>> +        <6 0 4 4> DP and USB3 single lane
>> +        <4 4 0 0> USB3 Only
>> +        <0 0 4 4> USB3 Only
>> +        <6 0 0 0> DP single lane
>> +        <0 0 0 6> DP single lane
>> +        <6 6 0 0> DP 2 lanes
>> +        <0 0 6 6> DP 2 lanes
>> +        <6 6 6 6> DP 4 lanes
> 
> Would
> 
> oneOf:
>    - [0, 0, 0, 0]
>    - ...
> 
> or something similar work here?

I need to check, but I may need to do that instead:
oneOf:
   - items:
       - 0
       - 0
       - 0
       - 0
   - items:
       - 4
       - 4
       - 6
       - 6
...

But I want to be extra sure this is the right path before

Neil

> 
> Konrad


