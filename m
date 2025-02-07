Return-Path: <linux-arm-msm+bounces-47146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6729BA2C465
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 15:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69FD23A9724
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 14:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553CA2236E8;
	Fri,  7 Feb 2025 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GUDzYYsV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F121FDE2D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 13:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936773; cv=none; b=e+2uP95PzDEM6QQj6hON6V/Ew26tk73sXzWl4hha1IOlB69sXrLaH4w4CT6oOvzUJsxnux4oygw06olBNRNFvS/zVwWAdv8682WrZsYhy5AlLHyHny9z1BZweX/wiihVUhUk1KKFxgmtA6x6z953OLfvhj33PcL40rrVBd6IE7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936773; c=relaxed/simple;
	bh=p8G/aUYuUCjMyJNrkYWYOuNMl6ZI+6nvf9k5rhYzVoc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z7kTH8+RGnrP1qTEzXKDp3TCsssGFtQOmX2+jdT/gQJFVN0RnekTFVx7uAy6oDi5K7zfL2JFGIMfGKfGe5IwSsK/S6A9wbChDiDmEaRwB0+jhei46rXzvaZ7Z0yQg6J1h1teoGi+H0EN4BJPXwb6/MCNLvldDFi8cu7DBa0YyWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GUDzYYsV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso19471965e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 05:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738936769; x=1739541569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkR9wNKJuVrn2xXLtp0xWMIVzcU5W5qY2aQJeG+PYo0=;
        b=GUDzYYsVz3c14Mj32SeSkILpPa+u39at/Vfqfp+roaR74XiYG8peNdtqIfDJ+AbMRQ
         VilT/62QxFdBRlKZ7e4tsTvyePvXbtwPdNUTonpY0X47rtx8Gjq0T8v9ABX9zA6jrZZw
         6yP/VuSZ/upLhPuvB0P/1fC6KFO2oRfyZj8TMGJJk6hRvYFRkmGmrcVTwA5VJXKZwHa7
         ISmWKTAPxtjoCBHNjK9ZW1vnmLk+73qZ2E0bjKbFsZiiwdSFU0vq+ztTl33JZ2U15Fl7
         QIkpU9Cu+q3bPQRNctC3nkNL0Ona9ASdpr/MsGVzAHz0oK7kLqBl696E7QVqXyBA+iSi
         frzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738936769; x=1739541569;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hkR9wNKJuVrn2xXLtp0xWMIVzcU5W5qY2aQJeG+PYo0=;
        b=jN6HSlTQTeB6fkfnF1vKUo2d/N1HZkenfwWDE1tLrPJVemg3o6ZHPn4KwITZxA7Vt8
         KTsvn9C5UEPd4mQGjH97Jqm51vamZMwsQ9lHJ4/MmXS7t2LYTw80OrThzQLq95LKZmCG
         iE5WS2jniLABdXspb4+zISADttVC1Qr+CBZaSqFMBQ6AfDuNq8rxENOKwR5m/5rSeBy/
         I2gcUWK4Dpx/D8JsYUKDLQramVs2AR1UR5k5CeqTyRnARalrt864TcxKV8F+Ks2l6ziR
         nmISxzBEI1xG9eFIEU2xaBPHW8uaVR7nAIpqVQjY3OsmHVD7E+ATH3gYu4neX4GRQjTe
         8Mwg==
X-Forwarded-Encrypted: i=1; AJvYcCXKEkgbZp4NDqWgAqLToXvxyrase3l0tYKPG2yMEawvHcGKKmT4tEk1+libuk8cNiPrdnmpBrfT3FuXhK8G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+T485SWNWuGuS/DddSfg1cMVko+Kaa7WF8vDC/hrBczgYxYKD
	E+IBnx2uOqSzs1LxOwBD5i7hmux2w3+Un4yuEEjIMX3nqrwrOw+uOReUbt4nXIU=
X-Gm-Gg: ASbGnctLZDEJf4BuN5pS77Z9lZzkhHEMvzHxFj4pLGXDuUiveJt9GmdXMx1IV6T4NYU
	uci1aGSo42HMuVCBlz2wuogun5VHzlGBPe6wSRb92mP83W4HwQpReL1/A63qa8GLPLRqgfddJDj
	2JQynzOPlgO3juzn2xYb1vlh3S6JRlaVYCKr8h7YeNTC9B8oGsAdtSZhWcWQOVJCvcTepbLp215
	98xlFr5bTVzWVOKHYk0/8k2eQOPoiwzZkw2YOUSbUBhJrYGo9Y0txrAaZC54cP8D666Fl4AadUA
	PTeEdOpkSzjSjYS1a/XdlXTB+vPWCkhSoNBlnyY6ZFdbWN0d7lcDirnOYHU17exq05Kx
X-Google-Smtp-Source: AGHT+IFaHTGIHzKLUvnWz9+Y5u7+raJr/5Kf7pvr1qGvrp3QDa8oLg2Fjp7WNSzvc3RsTpW1NE2RGg==
X-Received: by 2002:adf:e60b:0:b0:38d:b52d:e11c with SMTP id ffacd0b85a97d-38dc994edbfmr1754061f8f.15.1738936769612;
        Fri, 07 Feb 2025 05:59:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5b26:96be:712e:30cd? ([2a01:e0a:982:cbb0:5b26:96be:712e:30cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd1af07sm4646491f8f.15.2025.02.07.05.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 05:59:29 -0800 (PST)
Message-ID: <ec30d033-f53b-4d71-8c36-b6448879b691@linaro.org>
Date: Fri, 7 Feb 2025 14:59:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] dt-bindings: display: qcom,sm8550-mdss: only document
 the mdp0-mem interconnect path
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
 <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-1-852b1d6aee46@linaro.org>
 <173893208278.4072473.6097194764742914829.robh@kernel.org>
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
In-Reply-To: <173893208278.4072473.6097194764742914829.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2025 13:41, Rob Herring (Arm) wrote:
> 
> On Fri, 07 Feb 2025 11:50:37 +0100, Neil Armstrong wrote:
>> The mdp1-mem is not supported on the SM8550 SoCs, so only support a single
>> mdp0-mem interconnect entry.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dtb: display-subsystem@ae00000: interconnects: [[4294967295, 3, 0, 4294967295, 13, 0], [4294967295, 0, 0, 4294967295, 1, 0]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.example.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-1-852b1d6aee46@linaro.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Damn example, went too fast...

Thanks,
Neil

