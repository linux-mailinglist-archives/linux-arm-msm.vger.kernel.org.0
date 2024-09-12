Return-Path: <linux-arm-msm+bounces-31609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C0B976B15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 15:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44E28281FFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 13:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0BA1A4E9F;
	Thu, 12 Sep 2024 13:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JyvWCATG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51E51A4F1F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148914; cv=none; b=badyc9y2+BrJr2QlpYr5GplB087wjIdCMtiEsae0BR7ktR2WdMqwdvCYOl7CSAZzdwpeSsnZNTWb/IZcE0yAAME5yEIoIgmA4iOKk1uxropghIjqG6jNcrnmickWIlesYmywVth3LfSJVY+XpfGIFPhfcNsRWBKAbdXCbOZ3MZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148914; c=relaxed/simple;
	bh=xGmSZvJPMA6/WDsG5Nu532RgUOS4u5eT+NtzLeebeXs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MCDHPwyQV7+wsKy6MXyTDu3iJjPgTwyCyUNWjULWmAyOFeBI6bBa+JGhSerh6s/oeCVbUzGmsHUkvo608GUu6DNcfsJrWl1oZfArmpUyoOkHv/ccIZSTqaK4cQGamTwwf6wFhmvth8O55swlW1HI53jp73lWECu3btA8mvXPW8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JyvWCATG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cd74c0d16so9414365e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726148910; x=1726753710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rbwy09Mt6M+UVIdl4w21jxB17U9+FB7plRA5s10UoaA=;
        b=JyvWCATGXwMjfqeHMrbzZmUbE3EL/yHBo44lcSE5SdJ/+Pot/lsPmFJpRG61lMpj3r
         8YhTPKl3Tzc5hWctV6JiDb1PS2EcXrwXUcqrY9BfsKSlHjfd2rdpgvjN3t0ZzPL1Pz92
         4YL4xmchuRrp+CcBtPscignireNljpTh0w+T/LQJ+xUwto3eUMqqcSgZyXQUTRS9GlrK
         RMKuD7j1VwK2kNPQ1+85r8D0OrxFlMSjR0jnuJS0DsapJ91zRDXUNq+NvWiJ7abzajlQ
         EYzCC2MJA1QXyBx8/r9YA5RHUp63gNs3LtA2WEUFIhaalUqR6tAoT0bNsUyWWhp7pYJM
         BFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726148910; x=1726753710;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rbwy09Mt6M+UVIdl4w21jxB17U9+FB7plRA5s10UoaA=;
        b=KNo+PKHvFx78WguL9I43ttcMSNJBeNjImnpDPtMAEmq0tyaNqeAlyt9ocSzdft0Fnt
         ZR7Al4F+ZtlwG7cpds1EiFXCkeNKx3FiXx4uPbtg5HEId+h50JaZ+Fa94TknyVnfRvXB
         IDltlYH6S1SwX4QgxCizX1Zjt+SB0oN8y2YW//gBbqXsnY1BITo04A43PL0Z+QNDJwbH
         tO/p3SSitkIYDZJlJ1z2RQ77P+5WJGKWRPw6NPk9QXicICfgDRqbghd+X89ofjL1wCrR
         //euv0nGHdRvbcWwsbeFRrHP4fhtg8biiDNkroqGt1+LNN1fN4Jg2zEVSX6TlPt0RGhR
         GYLA==
X-Gm-Message-State: AOJu0Yz5cZJOgelNLICIuBiVG2Uc4DT5plzg121yqjI3OzrkOGBGN2wv
	rYLUlgItagAs83Y4PR9zBgKircenE52NmR5+Jwq1ufylVUtiVhG4JLdtCd1cBVE=
X-Google-Smtp-Source: AGHT+IEjEDquT/aJgXoom8sDLR++VADiuZhuI/LJsjJSdWAMIa+jxBJ8AUa1I3E93mENrXnqOyJi6A==
X-Received: by 2002:a05:600c:5127:b0:42c:a574:6360 with SMTP id 5b1f17b1804b1-42cdb5790c1mr24484905e9.29.1726148909401;
        Thu, 12 Sep 2024 06:48:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ab97:5a37:ff38:488e? ([2a01:e0a:982:cbb0:ab97:5a37:ff38:488e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956ddbbbsm14253237f8f.93.2024.09.12.06.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 06:48:28 -0700 (PDT)
Message-ID: <6d78c1de-00bf-4aea-b0c6-a147faa40a8f@linaro.org>
Date: Thu, 12 Sep 2024 15:48:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <b1b4a866-fa64-4844-a49b-dfdcfca536df@linaro.org>
 <82dd61ab-83c0-4f9c-a2ee-e00473f4ff23@linaro.org>
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
In-Reply-To: <82dd61ab-83c0-4f9c-a2ee-e00473f4ff23@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/09/2024 13:41, Bryan O'Donoghue wrote:
> On 12/09/2024 09:22, Vladimir Zapolskiy wrote:
>>> +
>>> +  vdda-phy-supply:
>>> +    description:
>>> +      Phandle to a regulator supply to PHY core block.
>>> +
>>> +  vdda-pll-supply:
>>> +    description:
>>> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
>>> +
>>
>> Here the supplies should be split into ones, which are specific to CSI blocks,
>> and I believe they shall be set as optional.
> 
> In principle I agree with that, each CSIPHY should have its own vdda-phy and vdda-pll regulator specified.
> 
> In practice though I don't believe its necessary, below.
> 
>> The proposed names are:
>>
>> vdda-phy-01-supply
>> vdda-pll-01-supply
>> vdda-phy-23-supply
>> vdda-pll-23-supply
>> vdda-phy-46-supply
>> vdda-pll-46-supply
>> vdda-phy-57-supply
>> vdda-pll-57-supply
> 
> In principle, you're right, we need to expand the name set here.
> 
>> I understand that what I ask is much more clumsy, and it could be seen even as
>> unneeded, however it'll be the right set of properties to describe the CAMSS IP
>> in this respect
> I think the following naming would be better as it matches the power-grid naming in the docs.
> 
> csiphyX-vdda-phy-supply
> csiphyX-vdda-pll-supply
> 
> =>
> 
> // voltage domain = vdd_a_csi_01_09 = regulator l1e
> csiphy0-vdda-phy-supply = <&vreg_l1e_0p9>;
> 
> // voltage domain = vdd_a_csi_01_1p2 = regulator l3e
> csiphy0-vdda-pll-supply = <&vreg_l3e_1p2>;
> 
> //
> csiphy1-vdda-phy-supply = <&vreg_l1e_0p9>;
> csiphy1-vdda-pll-supply = <&vreg_l3e_1p2>;
> 
> Where X indicates the CSIPHY number.
> 
> So in fact, in practice we don't need to differentiate these entries.
> 
> Checking x1e80100 ...
> 
> csiphy0
> 
> vdda-phy-supply = <&vreg_l2c_0p9>;
> vdda-pll-supply = <&vreg_l1c_1p2>;
> 
> This is also the case for csiphy 1/2/4
> 
> So, I _don't_ believe this is work we need to do, since its the same regulator for each PHY.

Except when it's not the case, like on the SM8650 HDK:
VDD_A_CSI_01_0P9	=> VREG_L2I_0P88
VDD_A_CSI_01_1P2	=> VREG_L3I_1P2
VDD_A_CSI_24_0P9	=> VREG_L1I_0P88
VDD_A_CSI_24_1P2	=> VREG_L3I_1P2
VDD_A_CSI_35_0P9	=> VREG_L2I_0P88
VDD_A_CSI_35_1P2	=> VREG_L3I_1P2

the 1P2 all uses VREG_L3I_1P2, while the 0P9 are using VREG_L2I_0P88 or VREG_L1I_0P88

Not declaring the exact supplies is pure lazyness, it will bounce back at our faces at some point.

Neil

> 
> ---
> bod


