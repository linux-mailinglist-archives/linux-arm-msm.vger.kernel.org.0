Return-Path: <linux-arm-msm+bounces-66186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B00B9B0EB39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 09:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C49804E51FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 07:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFF626CE37;
	Wed, 23 Jul 2025 07:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QsvCMDFH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB4B1E1C3F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753254226; cv=none; b=Cm632o6d+YNBjNf16r3SYNDYnnx7po1a5kdTMbV2lhDV6p5A5KV2w92Teq439w4N3RY+HzF4kK0CGyk/F+GpaPe045tNVGgBPniUKyc6PWzAZBuJqmoLfr1vGS9YIoh5yT6uE+uUkUxdM2WGbe79xNL+7mw/5xBvMYlBC34vhsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753254226; c=relaxed/simple;
	bh=xcFUVVpNCBzMypdo6a0Agk2cgD1dPOWvoVB/3YhwBIM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fNByPJ3bw0a18o1WmBUOi7fav5qToxVYRkzNymlxoAciBscQ3n+9SGAc/RoElQgzKGByFrhKbxdhIgxAyUStyykQz6anaegUuC7O0QjBBc4Sfqu47OILZvD5Q+oEsSyaawcHZjMU+VTDjaH7SeJN9xUXCibl5kCa9nV+BtUukDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QsvCMDFH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4555f89b236so62521475e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 00:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753254222; x=1753859022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/Mv9hJ7CADfZdG1vjDLpd9cy/jj2sy/v75wb10UpHw=;
        b=QsvCMDFHxaPsc4NONtSWNpXEegGBOjXBMm/BT1o6oewNvIVFG3ZYGC26EStATTsWTm
         1afqiF5X+2bQyOQIiDInefloufMq1mcQsazmt2YLMaKFlVj2A4eo4HFl7a3zbdd5Ll7y
         WJC14mHfDBqu/nYoG+IJ1FNxb3XamURFdo6WapiBsx0QjIht+j15fQY3nlRcXLA6qn56
         b8wVVnMviICL788yhPXpvf+7/5j5Sne+3eocsJXpKjYfKehEfwkDPXID8O8DmGxpoBVw
         d9nHr2y0dnB+8UCei/2GhCAYzPyksbX6NYUBfzLSJfVZWm0g2Kc3rqhtiwemKnPxIOHH
         21WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753254222; x=1753859022;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O/Mv9hJ7CADfZdG1vjDLpd9cy/jj2sy/v75wb10UpHw=;
        b=UNOB9lXJqesSqB7B58fkjNwz+A+03pLtG8ZFzBAGuKjZ/40ImzbTwhs7mg35+DxFfZ
         6Hu+sLZXfOX9CEAwY+KIpwCjPDyj3nPy6p0MjjrfTTdy4BqU3awCZEEC1hpJPsU3wgub
         BCbmfSTUDjymLiVIwSlSOD1ezPQAq7a/lXlpAZlGOE24hVJ6wGw61IKRzA79iju5Q2dT
         ss/mmCrWgDzpfHIwGZfEmkh7bmT/04tC6hW8OJNbRtMhp8VCBCJLHdXHrM2cqpEmT8UQ
         P9ksqyTUnnYjrNO8lbm4M1XfF0ZRCs6gLUi7qA1SpVtRWEx1RZqX1I3qgGbWXGb6zJ0+
         ik+A==
X-Forwarded-Encrypted: i=1; AJvYcCUgd2FZEyE2hMrVBydosJ55J8UCmjq5K5FY8MNCpGgkWSvjG9vsYk60/eW9WphyIBT7dNozfG0huA12JvPL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf6UVHnSK5CFziJQ9k6773grjaGzNHUpgA7TrPHfqYHyBIXjbT
	GBHALIyJzfhxIyzl+G7dKHEmFtBm+eLZusk2BpgzosquHxd/rYnnDx/asdjNeKot1Zs=
X-Gm-Gg: ASbGncvDbkKb11OToT9PA40RadUSPXOk1NWyuUAzgbQedVaC2q8qkUDyqneTGL3NC2U
	8dEHbNdMVib0/fZfPwC1T4WNWjIINZGUNUvtXcEO8eDQJkHFCocCATgcy+WS1g6paNopgmu2NAi
	k8n35l97XypE7HazqeHGQGlYut05LLO+YKW8DgVizHiujbAMlBqdEj5LvYoi0Fheg4Dl78LnLQY
	MuENCZBm/YR0B9681rK1/iNmboiXjVWDtvGytrdJlgF8ow2qILm2a/TJ7xWwxU/YIY5hYhZe6dD
	l6zJLHXVGwUnW4B6rjMG6WeIdf/nP4lR+frkOwrmI9BR2RIQ9c7HBiERNwhAc19YHhSb1beFl6m
	ONIVd6SkmDjYsJte5WhNzVT6wyeT5VB4iAOeBucQ+OCkyGEPzhwHUCk1Gg+nJQ7I31hDYL+7f6k
	+s1Euty8lE5w==
X-Google-Smtp-Source: AGHT+IGS53ymu9qWaAuGjwDNEKZnmHcq4dCaL9RMrzf74MJb80sfF+LLy2tGg+h9gGlfS5OVufoOcw==
X-Received: by 2002:a05:600c:5185:b0:454:ab1a:8c39 with SMTP id 5b1f17b1804b1-45868d2dfddmr11464645e9.26.1753254221959;
        Wed, 23 Jul 2025 00:03:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8813:2f0d:f9e0:5294? ([2a01:e0a:3d9:2080:8813:2f0d:f9e0:5294])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458691993d3sm13152435e9.10.2025.07.23.00.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 00:03:41 -0700 (PDT)
Message-ID: <bc65cf3e-22ca-4383-bf7a-24a3d343eb26@linaro.org>
Date: Wed, 23 Jul 2025 09:03:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: x1e80100: add epd hpd pinctrl
To: Johan Hovold <johan@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
 <Z_kB3jOH04-zFnym@hovoldconsulting.com>
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
In-Reply-To: <Z_kB3jOH04-zFnym@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2025 13:49, Johan Hovold wrote:
> On Wed, Apr 02, 2025 at 03:36:32PM +0100, Christopher Obbard wrote:
>> Add edp_hpd_active pinctrl to the X1E80100 device tree.
> 
> Please squash this one with the patch adding the user.
>   
>> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> index 46b79fce92c90d969e3de48bc88e27915d1592bb..5b1b80c445404fd02e9f6e5dab207610b03ff9c5 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> @@ -6389,6 +6389,11 @@ data-pins {
>>   					bias-pull-up;
>>   				};
>>   			};
>> +
>> +			edp_hpd_active: edp-hpd-active-state {
> 
> Please keep the nodes sorted by name.
> 
>> +				pins = "gpio119";
>> +				function = "edp_hot";
> 
> There is no "edp_hot" function on x1e so I wonder how this has been
> tested.
> 
> As I mentioned in a comment to an earlier revision this pin has been
> configured by the firmware as "edp0_hot".

With edp_hot, screen stays black with UI comes up, with edp0_hot it works again.

> 
> Since there is also an "edp1_hot" pin, this needs to be reflected in the
> node name and label.
> 
> Pin configurations really do belong in board files, but unfortunately
> this was not followed for x1e. You should still include the bias
> configuration (somewhere).

Which bias ? do this pin config needs an additional bias config ?

Neil

> 
>> +			};
>>   		};
>>   
>>   		stm@10002000 {
> 
> Johan


