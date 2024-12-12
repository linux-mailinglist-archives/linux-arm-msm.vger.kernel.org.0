Return-Path: <linux-arm-msm+bounces-41854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 258D09EFE60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 22:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50520188D727
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 21:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB7B1D63F9;
	Thu, 12 Dec 2024 21:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cX7qwcCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE4E1BDA97
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 21:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734039401; cv=none; b=D9mVcdrSr5RYaO5eQAxkP9cTM/zm464CeLe9YvbncR7zkBgnv/AEPRsw7u5vKtArUK6C7WojREnVMnqF6wHXTEK4/yBByoNMQUogQtJYEalUcZJxkBQUc4Tq1ECu7h8ZEilu1KUe7k12fO6xJDBXFosvljQtxYXHnHDpThSCU3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734039401; c=relaxed/simple;
	bh=PLtI68SMrlmIfIEWTHP035ZGtqOceO2C3crjewNOrUI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fDPzcagYv3FCaRU/Zn22nOjBjUtW1atWqGotneP5dlyFo1sTBgUOSD7B2EzI80NBcAyl3AA/nDtL3d35Bb0m+w1d03PuYoBG6a7Bwz1ZeYQVASzVGMwvF/7u5qeZp8ZsDmOHC5viWcI2jLBMPV9hAl4IpONv7hkmyvoV2mM41kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cX7qwcCH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862d161947so507916f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 13:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734039398; x=1734644198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrqCs7YMF6CRcL8FZmtgSzX0pK8+d3Z/bKsneCeFTBk=;
        b=cX7qwcCHJUj+xo71xwb46NqL5Je7LEtpHW7XBeG3budiGjbD0x3KnVC/lfvZzvrg4v
         dP530wrkml5JNq7EmXj2X9mi8VRdB9kw4BpMW8yMcyJLU5jLGdIrfjkyzLtSS3DPW3Mn
         r01zAH63CRv+hAIpfQYOF9Y6lD2zsD2XII8Z1R5h81eezuY3mlkQ5PbbZjuUbe3eS4Ve
         EpkJnvBWzSTtd9kWpEuAxcSjHWkzrPAAj+aSnbX7Tlvomdt2vAZpftHvvewiAcKVt8eo
         O2WyZu6EcT2d+vuV8LQ2qmpD8dgx00MrZqxzTFt1OpqsJGF9CWILzORnLhsuPOISAKVe
         aHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734039398; x=1734644198;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IrqCs7YMF6CRcL8FZmtgSzX0pK8+d3Z/bKsneCeFTBk=;
        b=KJauJ7OPG6GqF8Bobj0hviy/tn48aueTGzWbmznpmWZMcXLVXKIDTh0CN9DSMg+9NN
         Ld9q6aCSxdVr80kueRAL3vzKwyZ0QKytnpxxAS7bb7odzbRtKK2bawLjjvneQVPx70ZO
         L5oxTghNYruPN65MgAVOAAKM0nLOxXXlgtIF4kWZxbjVg+MaAH1HpVegiJ/A59zAVC1z
         tewqHYR4zeKlmxsd7Xim+Rlrii+3VS+5Z02wLOIGoQPoF2rrUaMvxabFG1l6vcNpIw8O
         BQhlSqNJ4/aTkz1PDy+sBD1kbrJbLF7DVH2SLZHK+mixWgvxf7CQzzC/BRIABJeIWSgl
         SLKQ==
X-Gm-Message-State: AOJu0YydszHxU3uU7UcbaBPtFGw4SUSr1YPhzdT0bGBA1/PV3Bco4oUP
	xpnNhCZ/8J3ThlHvcjTashYIuTrQchkIo6m0Z1+S4V05C6RNIO82K2fJTU9PhDE=
X-Gm-Gg: ASbGnctVwNEH++nVcrY1/901dFdbSO8kaaq6cVCgIvzKjtc4shcr18MZZT0gBCzyE3p
	AuqRZAx0xLdjbSCimpKWqvv+tUVH4BPfSf1m6jdcy9yQulYNt8aaM+UkPZTK8FAEAOoNYrkY5YN
	Abn0ALdNjHT+vyF+UXSVAotDf7G33ZjLqQj5fTBKbLnPvu4zxIapOHQo12Kh67qotUUYTL25/Aw
	sS/7M5zCNHMyobRz5SH1V6g/Y0JHF8klD/eTKHBLNTN8mPM4DTruDLAW9KUHyyOfKe8fIbm+FBH
	oJsESPQLswSJeZB72/SM7GRUxkZIW7mR5w==
X-Google-Smtp-Source: AGHT+IECUqq7Q7DBGVoL+Ae1+IU3B5T8MwH58zhnUQtU+qylUsnSU+xpVY+rpOswBvcmGDpakaht2g==
X-Received: by 2002:a05:6000:2ae:b0:386:1cd3:89fa with SMTP id ffacd0b85a97d-38880adb156mr144936f8f.33.1734039397929;
        Thu, 12 Dec 2024 13:36:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a? ([2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625706c82sm27973335e9.35.2024.12.12.13.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 13:36:36 -0800 (PST)
Message-ID: <76592f0b-85f4-4c84-b45b-859d55c4e87d@linaro.org>
Date: Thu, 12 Dec 2024 22:36:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-5-6112f9f785ec@linaro.org>
 <31264e68-2cdc-41b2-8d84-459dc257f0f5@oss.qualcomm.com>
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
In-Reply-To: <31264e68-2cdc-41b2-8d84-459dc257f0f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2024 21:32, Konrad Dybcio wrote:
> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
>> is in place, declare the Bus Control Modules (BCMs) and the
>> corresponding parameters in the GPU info struct.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>   			.gmu_chipid = 0x7020100,
>>   			.gmu_cgc_mode = 0x00020202,
>> +			.bcms = (const struct a6xx_bcm[]) {
>> +				{ .name = "SH0", .buswidth = 16 },
> 
> All a7xx targets use the same BCMs with the only difference being
> the ACV voting mask. You may want to make these non-anonymous structs.

it can be done in a second step

> 
>> +				{ .name = "MC0", .buswidth = 4 },
>> +				{
>> +					.name = "ACV",
>> +					.fixed = true,
>> +					.perfmode = BIT(3),
>> +					.perfmode_bw = 16500000,
> 
> I think perfmode is simply supposed to be set when bw == max_bw

Not for a750

> 
> Konrad


