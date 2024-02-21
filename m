Return-Path: <linux-arm-msm+bounces-12039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4B085D84A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 13:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DBFF1F23485
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 12:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF5C6930F;
	Wed, 21 Feb 2024 12:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gUarKIc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A996931B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 12:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708519936; cv=none; b=GoB86XzvjpyDiCBJO44XyFIb9MEmXrykOxw0vX/fEh089Fp08YUVDcpvL6KVw3asjL2x5tYnrpWhHrX8fH3An0oUNibJO4LvBQRlmWNYACUdCwvzhCUwpIh0T3dgS5iT9B1ZQAmcprg6TF7k0PPWtegpj3/XpzErSaanQ3WJWBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708519936; c=relaxed/simple;
	bh=VqjZ5zeQGNnxEH9jifmtI1lbx+BDCZmrirnr29wFjNk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XhehrDQjAB8u/BT7JnoS2U88bEsWUHVjLnaY8vZclWXcSUx90shcxjPdAISybPZ3gSV6+bfhrDTrG3aCcGAFyblWbePaF2fe44cWCdqpAYKWxbXKn0r6NJzvBiWGnD5LZpw/ANzXZqm8KQ5yQjAraAEA5C+O3sni829zkOmCAfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gUarKIc5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4126f486429so12943575e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 04:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708519934; x=1709124734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUqvIBVamMldJ8EFrGScLylunQb47vA3f0Xl+APiwIw=;
        b=gUarKIc5Cc1Cupsjau1vRgRuZgpGVZ84lQU3EH+WxzGXsvVzVNknzcQT+MTTLmq95O
         HP22cLsSFaviRPk7byW1ntlXJ/ac1SsbmwcyVUOVXRyulX4BQeqobzgtnWEHWV3Y+JjR
         kF8d2lc6uN5g/AZj3Q4ZS1dqaE3fSeQXIlT1X/zs7/38qiAs/wdtL2jUW4GlMt9I/Qz3
         E4cBmMhTFTZXlMPIXaoZ8l3T8kSuBLsJFIhXG4uFtsNj1AuM1VRgqfkAYnS0c2MSskwV
         YhsBCEhgHmp+0VmITaQN6X2Eoi0YcDY6keMS3ZTh1TFFC2bHtKqhjjW79cRVpVOecK5a
         A3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708519934; x=1709124734;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FUqvIBVamMldJ8EFrGScLylunQb47vA3f0Xl+APiwIw=;
        b=V9nH7EPDuce0iJW6lC/bExEtwlgos0P2pTWAtoLgp2q4JVTGHv4f3CZ6VsvTYq0xGh
         IfJ24l1sBi/RgFlUBDvswNb0CxsoBLRvRjC5oElp0R+E00/3CJdlTBib8q0toRynPjh7
         oCqQ03QShpRIEK8CBKO0ZKMyAmA2d8ozqnzT27IORs348qn5FaEI13zQo3lDzd+JEqqc
         0oz9B+aMiUb9GaGDN54WB2G2UsiRrx6hxROPndT/7tvQ5xVih4GKP2meea60KEnAo6Aj
         LH5bDSlUbSkK3hVpJ67t5JeZUZcEUS2vAH/yhcIJbLEIpyC4u6r9pL3crhNW7IrbKZJX
         Jtww==
X-Gm-Message-State: AOJu0YxTKmPFr4PxoYveW3CC9b27XIegO9gxGy3oU08tr5uUsmv1z22o
	hQACYPFyurR6vdBYUwRilkz35CYdUdHrXtXM8qQeF1t9NFC4MKDQhKDldYxW+9U=
X-Google-Smtp-Source: AGHT+IHKc+Ru5iNcaPCFQf055RWQ1RFfTq3MzdYBQD7aOnZ3nzqbhF0nUW0kvvkLvW9n5111F5GaAQ==
X-Received: by 2002:a05:600c:3507:b0:412:5df4:914e with SMTP id h7-20020a05600c350700b004125df4914emr8639602wmq.0.1708519933729;
        Wed, 21 Feb 2024 04:52:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:83fc:439c:6f36:ce5c? ([2a01:e0a:982:cbb0:83fc:439c:6f36:ce5c])
        by smtp.gmail.com with ESMTPSA id s7-20020a7bc387000000b004107dfa6aebsm2401296wmj.28.2024.02.21.04.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 04:52:13 -0800 (PST)
Message-ID: <2585d866-8451-492e-9f8b-95210ac52a81@linaro.org>
Date: Wed, 21 Feb 2024 13:52:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8[56]50: Fix SPMI channels size
Content-Language: en-US, fr
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240220-dts-qcom-sm8550-fix-spmi-chnls-size-v1-1-24e22107a6ac@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20240220-dts-qcom-sm8550-fix-spmi-chnls-size-v1-1-24e22107a6ac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/02/2024 18:04, Abel Vesa wrote:
> The actual size of the channels registers region is 4MB, according to the
> documentation. This issue was not caught until now because the driver was
> supposed to allow same regions being mapped multiple times for supporting
> multiple buses. Thie driver is using platform_get_resource_byname() and
> devm_ioremap() towards that purpose, which intentionally avoids
> devm_request_mem_region() altogether.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 7474cddf7ad3..3904348075f6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3318,7 +3318,7 @@ sram@c3f0000 {
>   		spmi_bus: spmi@c400000 {
>   			compatible = "qcom,spmi-pmic-arb";
>   			reg = <0 0x0c400000 0 0x3000>,
> -			      <0 0x0c500000 0 0x4000000>,
> +			      <0 0x0c500000 0 0x400000>,
>   			      <0 0x0c440000 0 0x80000>,
>   			      <0 0x0c4c0000 0 0x20000>,
>   			      <0 0x0c42d000 0 0x4000>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index d488b3b3265e..260eda81b743 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3747,7 +3747,7 @@ sram@c3f0000 {
>   		spmi_bus: spmi@c400000 {
>   			compatible = "qcom,spmi-pmic-arb";
>   			reg = <0 0x0c400000 0 0x3000>,
> -			      <0 0x0c500000 0 0x4000000>,
> +			      <0 0x0c500000 0 0x400000>,
>   			      <0 0x0c440000 0 0x80000>,
>   			      <0 0x0c4c0000 0 0x20000>,
>   			      <0 0x0c42d000 0 0x4000>;
> 
> ---
> base-commit: 2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
> change-id: 20240220-dts-qcom-sm8550-fix-spmi-chnls-size-b8e6323fecc0
> 
> Best regards,

I confirm the value, but I think you should split it in 2 and add Fixes tags

Take my:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
if you re-spin.

Neil

