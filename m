Return-Path: <linux-arm-msm+bounces-66443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D916DB10359
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 10:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C0437BC7D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 08:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB13A2749D6;
	Thu, 24 Jul 2025 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YGl/Eee1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9D21D5CD4
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753345259; cv=none; b=R03JqQ9LvE+/gMd7td10r4tXs6mS6aEBFwVDWcBbCa/nbbT6Yz0k+5cIZe8oD5+FM9SxqVpV/f7z5sUCyK9WP8YfEpMv4GPFAdRximB7Whf3KI2FiH2re9a4jciNoxBQ90mEE/GaIRP+eLedP265xXK3Vb7ZPf9qe1+thQc14L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753345259; c=relaxed/simple;
	bh=gEpeomgBJz7dPXlwhD8ZqTisu/lE6eJjZrvqZUUAtck=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ab1mYbJhsDRZrKXYd/vREMVYHSuv7yhiBfGsUqktc35llJr/1pzmKlOYbRwKz4XPxpYvj/g9oet79JtXzmPj3C/5KnB4utIr3cKqMz89Txrvhe87/HR121ihSuV/Tm0tcR4pAd50r7UQX+Le2E9Vq436EQMzPdxvhMYBdCjgZiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YGl/Eee1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a575a988f9so386535f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 01:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753345256; x=1753950056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llqwfCBH/rOpSuEI1LSG4OQG1ctPOqLKtO/RbPasBQw=;
        b=YGl/Eee1spnaFvBub77bmbbFIrYSzqVwE8Q7FhJ9IbAr/CEZhaf5D9sSWVXmNrXUKa
         fB/J6NBodVeTT8AJl+sl5kjGR6JHyKvagDrQ/5EYoPjM6zDIJLCxzgEh/tUwKyawuvFQ
         NyFhYnn87CICGGYrPR7oKIk7xn/bDLr2T+y98Pl14/JCOd8qEuwgvM3GNOvRhthAYngc
         bX4qUllHWxzAhx1AxzUJHgpwYADMSRYoNs2PSV8DjMqa28ODqUveb8kwzlq8w/MUb6ll
         H61hUCqpz0/XZ5y/qWPraqQN/hhhcIOseWI8f2GeFn7qiLfnp5t79m692Te5V65c6hWY
         HKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753345256; x=1753950056;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=llqwfCBH/rOpSuEI1LSG4OQG1ctPOqLKtO/RbPasBQw=;
        b=VgkYuO2ygBav6VyKVPip+3w0TYjbawG4BSPlNVtmcrhlGXe1Xyx1k5h/OEGn0pdnWO
         oMdV4LeEYgYXHr3+KUbiqtq7EG2Iw4wTgZy6Bk0OoQWzauwIq+baEZXcG9nzGT1aYd/8
         rKHcZtNUb0l/sgz1NlkgVpnBSWdF7ctoUp0iD4cDXAVu1YIemN1tu4aTYQpwKrnCdVV4
         mOYhmrKpTp+60OqLCO9bVX9O/aZBEFaysFLyn24JZxdxU9sjQJoPU6lR1T163pu5r/cS
         UXJLpbpMktVx9kppI3BM+DyC7Dzi8J7WRt7ZyhxGb/IUemNH8KD9wNNZnkrCNvG8mTNy
         67sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkLtJTLYtV2C3VSyd4bO8B2k+j/XmoS1gBvg8/i0iEt02sQnfkwMEfS2knR/dmmUNWVrJNTC1lnshKJIVP@vger.kernel.org
X-Gm-Message-State: AOJu0YzkY7Kqj/cfRlWAJcr5W1V8I2ZQvQJROu27A8RT9SX6JUn3LvgT
	vMi+Btf51t2+nJDOAhUmHSQBvZ71qo3/wDcUKeqgPTpQdNkAiSkeZ0H1Vgnz+RYnC9Q=
X-Gm-Gg: ASbGncvWhADGrkT3e0VK8pdjHdNOeEC/x3OUTf6M90uio0ryT/IBfFkmjTHHFzTTtuV
	W7rwH/lTa+6gZ6t2bXVQjdxa83lOFbyGGIieodiSF1sf78EsA3uvSIoHnMKrxF+ucVuDtixxZDl
	mS2L3KLNCeBqE+ea4Jj5QZKU0Y9pvyglW/m8cqWu0+frDksjQns30WEw43ZdL0KlUr2cWxPm3JG
	2XKgcnhjFzcVSjvLGWl5DDc529H0d9yumSkIjTaugaH0e+44jhm3tBn3HNXowjYssBKbSls1af/
	IoKog+BhJMFoKGuuMaUXJG7BFvnyLJVnK33pKR/JDsDoRcbbAqNpBxQoi5AcGosI8HsBWIya3zt
	KC/qDIX8RAb6Mwe2n2KOdfIszBnGPStQp
X-Google-Smtp-Source: AGHT+IH5+0vhACN4BLyT/2/N2LzEwkUNdrpvA250ZFmSyIiC12TjUMW4rdL6PBFGZFpbMyKBwN81zg==
X-Received: by 2002:a05:6000:1a8c:b0:3b5:f168:5e60 with SMTP id ffacd0b85a97d-3b768ee098emr4827297f8f.19.1753345256311;
        Thu, 24 Jul 2025 01:20:56 -0700 (PDT)
Received: from [172.20.10.3] ([78.246.240.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b77078e537sm1141636f8f.12.2025.07.24.01.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 01:20:56 -0700 (PDT)
Message-ID: <cc8a805a-2bb7-4fb5-8e53-59b44caf8438@linaro.org>
Date: Thu, 24 Jul 2025 10:20:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 23/23] arm64: dts: qcom: sm8650: add sound prefix for wsa2
To: srinivas.kandagatla@oss.qualcomm.com, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250723222737.35561-24-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20250723222737.35561-24-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/07/2025 00:27, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> WSA and WSA2 are two instances of WSA codec macro, this can lead
> dupicate dapm widgets and mixers resulting in failing to probe

duplicate

> soundcard if both of these instances are part of the dai-link.
> 
> Correct way to address this is to add sound-name-prefix to WSA2
> instances to avoid such confilcting mixers and dapm widgets.

conflicting

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 5212000bf34c..8b43ded297c8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4526,6 +4526,7 @@ lpass_wsa2macro: codec@6aa0000 {
>   			#clock-cells = <0>;
>   			clock-output-names = "wsa2-mclk";
>   			#sound-dai-cells = <1>;
> +			sound-name-prefix = "WSA2";
>   		};
>   
>   		swr3: soundwire@6ab0000 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

