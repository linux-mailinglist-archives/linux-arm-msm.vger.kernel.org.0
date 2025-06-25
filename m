Return-Path: <linux-arm-msm+bounces-62339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C7FAE7BF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C55FF7A35CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D472BF015;
	Wed, 25 Jun 2025 09:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nn6ZUaW4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F36229ACE0
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842767; cv=none; b=J+f1EjOAEhas4HE6eWOyIO40xuKC1RmcEkRWsBWgTq9hZidUCZVIpRfxEZ7zwXPhaP8TFKm8v1F1rw0NkwpikXO0IsNu3C5hM6ZKeIvks300AplAAT3eOmt07qI8sUldXMLqrlu3ywNISVTKh1oo+FIfYJYIE/2YJXKz9QjJ4RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842767; c=relaxed/simple;
	bh=SGa/qh4yqBk9YT7vZT4NgomOg8NyvkoWxPRjILGTgcA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=t6TGwWjMBWp4koviN0PdprCNXGfCmsUl3jroflvxuEGFoH2hhYm9cIvc7nNQJRkZaEGkI0glb3e8gpifE18chdCCwxacBDn+NwRo3WpacgTpMgrqpzJ1/2LarcX9VRtjnHLWzXCpajesK2bNtSGAqEIo599Nfv/p4EQ4fLergaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nn6ZUaW4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a522224582so707501f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750842758; x=1751447558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2H8SuiQEJ7WkLp5yCfudYKtOnP9Y7N1G4LI/FEVL04=;
        b=Nn6ZUaW4cBGupWi7NO/CphA0HwSWdqVxGGwdQHaV9XSqLrYAGwz+YGncIZgKEEiwRR
         mR74lZksxPoVGcmE37mo+/v+qY/7O7Ys3ux5SMVD95rotxNtzFBDTVu9vx+yt7a03KQ2
         JdHFf5t2f+DJE87hdJVA2baO7rmTmNFLRPCJmyK5QD0FrQ+ph7+zK4UatYvO6cMaOY0E
         SLOGn0JIboXUe9PM4Nf/A5nJc/h2CeBd46S3OsvMvjcoG2WMx/OYTq3NLoU8ArQPdYm7
         Aizkp0V+0m9izHApjGTUxcCDduRjrduIeGvbdR0rcsEyNEGNf1CdyzSaIvJYsbcfya+0
         MT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842758; x=1751447558;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d2H8SuiQEJ7WkLp5yCfudYKtOnP9Y7N1G4LI/FEVL04=;
        b=tvvjTe44kCXS3YFy6pL3yVD12Eyhbcg6mIP+CzoB+UM7vgGK2kI/BHjArWcq6sawsg
         m+td5DTSrGEGlgwWgSJk6Tt7glAFRscDEup9XdyTLTnmW5ejrYpKgK1mDj3z9H9W5bhd
         +eF2xXpF0bTjL5VuupWFVHfa0+ua2aIUKrTeDYbdN1zJbVmL086vXgKJm59WbfbpSTii
         nz6VBzf6dk48+AhMYg0zZZz0+QvKUfblUUuJyPJV+2dmsypIAxnZWZiP+An90dC7JYA9
         Y0j3fRLP7TRSkt+9lj8UuL63dWrR3g0sUU8N/G3YTuguTG479o5ySuAgxi7icQ5p8Yal
         2BOA==
X-Forwarded-Encrypted: i=1; AJvYcCVXQaeEUcETK+XJErSNeWCy9geUiraM4FTeB3kpH+73/9UtN0m/ZqVfhqe1WR7e+Qv1C02b/DEwCiYJ01v5@vger.kernel.org
X-Gm-Message-State: AOJu0YxKvuEJPQAuFFzp10o191sT1KjweAySvD9EHopbo5v1wiTeVXD6
	wP1RWBHXFra6kenY5CZY8F17SU9S03jiywp8z+1lnzlbn3Hh8VJa8iJqbD1oj++XOx8=
X-Gm-Gg: ASbGncv8/mBLytvtvUxCjinwmoBjaSDArm6FyTc843hXrrNyk39R7Kvgr9GkG/glcqN
	MivkB2QgiffDQPr6jCVBzmiqiDa5BrLRWylXtZRXGVVWCZ5eOA7IEIiybDrghw2T5wba2L9YN4Q
	rTYUcSN1CE9VbAz/MZ6W2zXpRAO1Szx4j8r1hNq6gVf4CxJkBWMX0f4+nMV1VzdJZTwaOC5a2zR
	VKoVq35xUpFcUkjUYzcwfBJAGfXlE/AnFjB0zLQb1MdpcmwwI4Y5LncpIKkRNqvXlffqL6W3INv
	kPw46ATM7rnKqVA9meXnftV58VAt4cIbloVlAXZ8p/0iUBj2jOBQv180mqfZyUKnntpyBcBgW3q
	BdA/aX+SgCmyZWS2jF2s5PkX0XPUR5f2xzmQ3
X-Google-Smtp-Source: AGHT+IHuOLH1/60wIoa8V0u6vvKa/s0mo8C3945entGfnua63X1EflGYum3E/5TURPbYBrq1UMJvGw==
X-Received: by 2002:a05:6000:2b10:b0:3a5:8a68:b815 with SMTP id ffacd0b85a97d-3a6ed660d0emr1180144f8f.46.1750842758503;
        Wed, 25 Jun 2025 02:12:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3df:bee7:215:e1a4? ([2a01:e0a:3d9:2080:b3df:bee7:215:e1a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b6fa2sm13686285e9.27.2025.06.25.02.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:12:38 -0700 (PDT)
Message-ID: <13745cf1-10ca-4014-939d-2bb4224ecfee@linaro.org>
Date: Wed, 25 Jun 2025 11:12:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: pmk8550: Correct gpio node name
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250625-pmk8550-gpio-name-v1-1-58402849f365@fairphone.com>
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
In-Reply-To: <20250625-pmk8550-gpio-name-v1-1-58402849f365@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2025 11:11, Luca Weiss wrote:
> The reg for the GPIOs is 0xb800 and not 0x8800, so fix this copy-paste
> mistake.
> 
> Fixes: e9c0a4e48489 ("arm64: dts: qcom: Add PMK8550 pmic dtsi")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/pmk8550.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8550.dtsi b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> index c7ac9b2eaacfe6e8363448d9d2ffb4ac8f5f4dd2..583f61fc16ad570972ac166aef12183382ebb4c5 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8550.dtsi
> @@ -64,7 +64,7 @@ reboot_reason: reboot-reason@48 {
>   			};
>   		};
>   
> -		pmk8550_gpios: gpio@8800 {
> +		pmk8550_gpios: gpio@b800 {
>   			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
>   			reg = <0xb800>;
>   			gpio-controller;
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250623-pmk8550-gpio-name-3fa2e349d567
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

