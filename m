Return-Path: <linux-arm-msm+bounces-41105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 994BE9E9861
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 15:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9730A167F01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 14:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A02A1ACED6;
	Mon,  9 Dec 2024 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="heTHj11I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5041ACED5
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 14:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753190; cv=none; b=CkBmuXr8HKpO2kEO+ot/+v4OrosNTiZZLxWcf32oRiEuConNUHY9z8sQtiABd5aYmL8p75o20CqgmAKOXV3Om3mzbBkk9dUxkkMeTwV7PL0BP6dMAvfK3fViZ4VMpUtZpfnmR35s13ZGurieBXyew11JYZdtn5t5vGJYJaJ9Bl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753190; c=relaxed/simple;
	bh=pwKaXeN1OlBCPG7iDLxXUSmq0zJ6XRLES9rHugMsHEE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GgrhOyLgjgK4iRY1lfV67k0dKe+uuX5QrCMhapMX8aAUBINGmmWE5Zd9C9b28t0WqlTCx2zSNVs1sMOKmNkY9bEuH8gaTcvbj+XbK0BS+hTcXlazA6/pAL2KfHVe1NAL87BcyCVzKLwzAb0fJbJQxwynXk4FoT4y185FuSottso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=heTHj11I; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38634c35129so1582509f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 06:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733753185; x=1734357985; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//R8xUNwl611axD8q7sOD2Oi6OV6JAsc3ZQmBEFC26I=;
        b=heTHj11IMa0OkPukz/1qNa8mdPwq3GqyYSWUnYri5ToqLw+CegZ5epk/Dv1NQNwEEc
         lLi/VA3aV5SIw/jlB0tXx4hq2tP9VCvimf0/ydJGBW2OJ0YwLCnfxMYaZkj30LiM4lD6
         8JvGiz4harjte9NG8UqmIuqBifYPh5kstEprWaTHQroigXMRx76gn12N//cGkUrs7axC
         V6pfXyTacvgOqeFWBxJBQttjtM/sMauda2dI8mgj+tSaHoxGWJ7omaglFbfFesSOddQU
         B/0wC036kYglOsQquqR7aoTPE27NpWQYGM4wzr1FOhadz8RKMeEUy2nfaqLVeS/DvVwx
         UMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733753185; x=1734357985;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=//R8xUNwl611axD8q7sOD2Oi6OV6JAsc3ZQmBEFC26I=;
        b=QdCZvy7QAedahj6rkozOQwBo6Fdq3EwRWeMSuCnEhhuVQQzwUCEntciPKm61CPRhIl
         Cj+rVkZ745tWjNEfBBV0nbUBwSwLQ1IfW6qk/33BLPLvo97lAftPn5/6LfmHWLEJiuSK
         b4rVFuDqijpyv/0a7/WEI21CwyB31MrliepLdg3BOUmvqDfnhml5+l4UxjKNe6xNQ6ts
         gWinS/Eq5mq3hMHO/nTfN06D8hdvQ3n6q+US12RSuCCm1d15ioha+43Fk8W0WmzEf0/C
         rA3vVyGQ7VU4KWlojuyofRbwc3z6BlaHNAmYS+wSEFJGIKZy2heDRNJKDkNS5vwSE5Zm
         vBQA==
X-Gm-Message-State: AOJu0YyUmCUhBk/YT25v3xE9OypS2plUx0osCworHQ4MBa2YjycqZEI0
	K/QhzD3qR0G3rbm5TvxZAxjH5dGjH147/enHACJDwYGkRdKHDIrsAMF3I3iCmEU=
X-Gm-Gg: ASbGnctTc4a6ZeeWDLQDkwTRyV6m6kPnFghcf7bPQZOWl9kmMrESHbuL8b+SWj85rnH
	YxfC2EYxt8lgNY5l6p/RgKLxArySXvBvSfneIyZPl5n07owERSt0FFZaOPNqkz7KD1g/rBfBBDO
	dbwAy9vYY798FnJ+rTMqTWBIvpLX05eedJNvbFzaEpEYlc/M1Y8vu3NDTstIz1aL577uKFw5SH+
	o8b3hr+kDoO+0evXboy0Wfj19q7FGGbuX8JPi1L/ZR9i0syZGyIvRFwM4e9EhN7WqGNzSe8oqs0
	kb0pZXgKkeTOPjCJzajhPUIbFnI=
X-Google-Smtp-Source: AGHT+IGuc3kl0BPq1T0cBMQtdVQ6O1SOWF+l7YeZdVn0jR38h6Ps6U9v6wBjWn9jE3WgTd6CBA9q0Q==
X-Received: by 2002:a05:6000:2d81:b0:385:df73:2f18 with SMTP id ffacd0b85a97d-386453fff14mr278848f8f.51.1733753184744;
        Mon, 09 Dec 2024 06:06:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7546:6147:f006:709b? ([2a01:e0a:982:cbb0:7546:6147:f006:709b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434faba810csm28873865e9.18.2024.12.09.06.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:06:24 -0800 (PST)
Message-ID: <d2ce1009-15ba-44bc-9dbb-4d606fb25739@linaro.org>
Date: Mon, 9 Dec 2024 15:06:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
 <20241205-topic-sm8x50-gpu-bw-vote-v4-6-9650d15dd435@linaro.org>
 <e56cd9bf-8fa7-44b0-b00f-45cedb73e194@quicinc.com>
 <1af37251-3cdf-47da-8228-2cd5622e1770@quicinc.com>
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
In-Reply-To: <1af37251-3cdf-47da-8228-2cd5622e1770@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2024 14:10, Akhil P Oommen wrote:
> On 12/9/2024 6:32 PM, Akhil P Oommen wrote:
>> On 12/5/2024 8:31 PM, Neil Armstrong wrote:
>>> Each GPU OPP requires a specific peak DDR bandwidth, let's add
>>> those to each OPP and also the related interconnect path.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> I haven't checked each bw value, still
>>
>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>
>> -Akhil
>>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> index e7774d32fb6d2288748ecec00bf525b2b3c40fbb..955f58b2cb4e4ca3fd33f1555e36a15cfc82d642 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> @@ -14,6 +14,7 @@
>>>   #include <dt-bindings/firmware/qcom,scm.h>
>>>   #include <dt-bindings/gpio/gpio.h>
>>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +#include <dt-bindings/interconnect/qcom,icc.h>
>>>   #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
>>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>> @@ -2114,6 +2115,10 @@ gpu: gpu@3d00000 {
>>>   			qcom,gmu = <&gmu>;
>>>   			#cooling-cells = <2>;
>>>   
>>> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>> +			interconnect-names = "gfx-mem";
>>> +
>>>   			status = "disabled";
>>>   
>>>   			zap-shader {
>>> @@ -2127,41 +2132,49 @@ gpu_opp_table: opp-table {
>>>   				opp-680000000 {
>>>   					opp-hz = /bits/ 64 <680000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>>> +					opp-peak-kBps = <16500000>;
>>>   				};
>>>   
>>>   				opp-615000000 {
>>>   					opp-hz = /bits/ 64 <615000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
>>> +					opp-peak-kBps = <16500000>;
> 
> Seems like you are using value from "qcom,bus-max" node for each opp in
> downstream devicetree. Except for the highest OPP, we should use the
> value from "qcom,bus-freq" node. That is supposed to give the best perf
> per watt.

Ack, I'll switch to the qcom,bus-freq value,

Thanks,
Neil
> 
> -Akhil.
> 
>>>   				};
>>>   
>>>   				opp-550000000 {
>>>   					opp-hz = /bits/ 64 <550000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>>> +					opp-peak-kBps = <12449218>;
>>>   				};
>>>   
>>>   				opp-475000000 {
>>>   					opp-hz = /bits/ 64 <475000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
>>> +					opp-peak-kBps = <8171875>;
>>>   				};
>>>   
>>>   				opp-401000000 {
>>>   					opp-hz = /bits/ 64 <401000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>>> +					opp-peak-kBps = <6671875>;
>>>   				};
>>>   
>>>   				opp-348000000 {
>>>   					opp-hz = /bits/ 64 <348000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>>> +					opp-peak-kBps = <6074218>;
>>>   				};
>>>   
>>>   				opp-295000000 {
>>>   					opp-hz = /bits/ 64 <295000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>>> +					opp-peak-kBps = <6074218>;
>>>   				};
>>>   
>>>   				opp-220000000 {
>>>   					opp-hz = /bits/ 64 <220000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>>> +					opp-peak-kBps = <6074218>;
>>>   				};
>>>   			};
>>>   		};
>>>
>>
> 


