Return-Path: <linux-arm-msm+bounces-72483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4D3B48558
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 09:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1627A17BE9E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 07:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30EE2E8DFE;
	Mon,  8 Sep 2025 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oLxLaYxc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FC32E5437
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 07:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316836; cv=none; b=LtW/vG6OkgXkFk7+R+RiKhWRo7577Cd1dLz7sw4OzfCAtGTJS1GLzIBanQ/VGWGEaAYjljp66g/SsHn+V1PEVUCrEgIXQ5pQkR8ozOZCdOc8uyfaiu+N287kyyLukA9W0ucqN+ZGb3VPbMHakk8MLSN3Zp/2ww7Z8VO6TIM+FjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316836; c=relaxed/simple;
	bh=qkrr/3KjH0nMlkfQ/HTHp/rRG/CMo/yex/Wso3Rjknk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JECmWmjuCaG4LbmMjgKBY/v1+aby7Fv/XAc1uCW/ItNrssMsY4cfYjiLwQoBUBq8sXMYVig84BMCrOGjqSonxnYMmlpi7jGB74mG+L/X2e2F7YUIpX8D4Kw3k9WYuJ14rZGSwQiJEVgghGIYPkvjvpoF78pPyuGlBBLiEvMsCSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oLxLaYxc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so23506695e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 00:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757316833; x=1757921633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wzhuAr515M3es/yTa+tgBrjx2bN9YMcAhfZwdb940k=;
        b=oLxLaYxc9e3vRiEYRn/t4wPDFe3m9w/uilrI9hjqRkfgUI7PFHrdfDFrl3LDJZN+ll
         4narpMQGkRv/9BAK34cbSk/4103C60NFh0A+xtNPDiQ5Jl7lFk5jIhIGG8IAZ2vWojVV
         E9tBw7p0tM/xrhWCGZ06Q+heBjeSqD59aH36i5RX1SyncgpYxNy/mvOCLFU4xcyDE+qU
         Aw9qifdrNNJzwoL9ir0pp2lxtpClKo9yNh89VCPqbn7kffGlgh8Ro36IFNhFt2q3h16A
         0qSFtIhNTWi+ZESVDWd2l3VtVJnn1DUW3DkEDxbp6NTqfIttFG7Ahwucwl8DVl5Rw/wY
         ZZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757316833; x=1757921633;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/wzhuAr515M3es/yTa+tgBrjx2bN9YMcAhfZwdb940k=;
        b=pxg3fskvdTy7dX9JkwD8/A78Qrp3PeprmALjD89BhK7QXeyK0x3uwEkgcwsIdANWh5
         AkOiJmEKZfpLrDIGsc8xY/FAabDiTK/7iSSNELTB3bhlCioMHEd/K6SIh4cP+sj3On3m
         HHVgwNM6SlRYCUM6lB3fIFkraF5TPEQL0IPCOKNh05OiPM37WYGu+aIA5qrmwZSDb1b3
         CG0l4W0ZDq5PY2PUtNvGMADeoZ8yUuihhP8kX1xoXT4Ipf2p19ZoK4DRSGlA+AvwEoBY
         6CZ49uqUrL7L+00QBv92YCyQ4co2FM6y1jFoXzt3phlQ/uXTMveh6T7LEIEwg47dLsqM
         YgvA==
X-Forwarded-Encrypted: i=1; AJvYcCX1+cCbVe9apIfKecJGrY8xDBKNzD3L1fUz7GyIyzKZcG/R4DptUxw6ywDUZ1W2ssYfDiryVGRuloPLthtY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyc1rqchybH5ly1IdUXgwYfKWz/u7BIkTF0vOWVBRDOsP9b8C+
	rwaUV6heqVWCfRwlsdfo1UVtR9+X/ESD5zFKjxWOVcULs6yNhcYxCcof5V1LW/ZjUuc=
X-Gm-Gg: ASbGnct05YQxx7iQE6Se2Z7sxu8PMqw5ik9veDtL7cZR5u3VqYqJ+syomfsjMrjn9bn
	ldSvn965UH08nYKFcQnKFxQCVx+mwg0FO09GJu5NnR2q7m4a7iQjVlLd1rnBstYK+szWeKFBL6l
	PK8S/bl7u+VVoZ4uSOTc/oLeHb2GxCIewky2grHC3dIwXTTlbVSW9KyvhYpxvW7D3RsABhKJCV4
	8vhO6s1mu8hwrosrAb91fthvbnr6eiJYzpOZXJO4pNPoce3QcUq8sgV9O8ZuXq5OvQPs4WrG1gT
	PEZkqtci7SalDmoZV8caNPxVpIjIqM0H/Ktz+GJorZ1BcoKZWbaMH5wdkmaqoV9C19AGZLCBJTT
	XjTU7VJEVTtrrDiETJs7TS3vjWmtpM4nrsSReqm/Vt+pRebRijtzXfz98KY2IvNPdD6uJjofr/T
	XuTF+ZA2535A==
X-Google-Smtp-Source: AGHT+IGnJ9Ah5Vieu6yoONFgRqheTLNEwWp9eUzr7Tdph5UUqwGE/vs91RFKVfejOeDbOG14b3x9Bw==
X-Received: by 2002:a05:600c:4114:b0:45b:8b95:7119 with SMTP id 5b1f17b1804b1-45dd5b32a2cmr69628315e9.8.1757316832562;
        Mon, 08 Sep 2025 00:33:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:61c1:5d31:4427:381b? ([2a01:e0a:3d9:2080:61c1:5d31:4427:381b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dcfcc2f54sm85132325e9.2.2025.09.08.00.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:33:52 -0700 (PDT)
Message-ID: <56ddc607-f30b-410b-af54-e2d9afc06540@linaro.org>
Date: Mon, 8 Sep 2025 09:33:51 +0200
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
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250902-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-5b4a51c8c5a8@linaro.org>
 <20250905175533.GA1000951-robh@kernel.org>
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
In-Reply-To: <20250905175533.GA1000951-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2025 19:55, Rob Herring wrote:
> On Tue, Sep 02, 2025 at 06:10:05PM +0200, Neil Armstrong wrote:
>> Both bindings describe a different layout of the ports properties,
>> leading to errors when validating DT using this PHY bindings as
>> reported by Rob Herring.
>>
>> Reported-by: Rob Herring <robh@kernel.org>
>> Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
>> Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> index c8bc512df08b5694c8599f475de78679a4438449..5005514d7c3a1e4a8893883497fd204bc04e12be 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> @@ -73,8 +73,11 @@ properties:
>>       description:
>>         See include/dt-bindings/phy/phy-qcom-qmp.h
>>   
>> -  mode-switch: true
>> -  orientation-switch: true
>> +  mode-switch:
>> +    $ref: /schemas/usb/usb-switch.yaml#properties/mode-switch
>> +
>> +  orientation-switch:
>> +    $ref: /schemas/usb/usb-switch.yaml#properties/orientation-switch
> 
> This is a pattern we try to avoid with references at a property level. I
> prefer you make port and ports not required in usb-switch.yaml.

Sure but the ports definitions will still collide in this case.

The other problem here is the difference in ports definition,
port@0 and port@1 are not the same.

qcom,sc8280xp-qmp-usb43dp-phy.yaml:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
         description: Output endpoint of the PHY

       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: Incoming endpoint from the USB controller

       port@2:
         $ref: /schemas/graph.yaml#/properties/port
         description: Incoming endpoint from the DisplayPort controller

usb-switch.yaml:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
         description:
           Super Speed (SS) Output endpoint to the Type-C connector

       port@1:
         $ref: /schemas/graph.yaml#/$defs/port-base
         description:
           Super Speed (SS) Input endpoint from the Super-Speed PHY

Neil

> 
> Rob


