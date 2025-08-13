Return-Path: <linux-arm-msm+bounces-68903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0066DB242C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 09:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A15E563B7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 07:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4050D2E541F;
	Wed, 13 Aug 2025 07:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dBz0QzYC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4459F2D8DC5
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 07:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755070121; cv=none; b=O56beLTXHhAhBEEevwIRNsjHm1c+KGZy6DZ+t94NXSWJP7zk4PidXngZE+5aAh1a+UYRkx8f7maLe2OR3SLcbJYY94Cu0vHJ2G0rwpSoxHQe6fH8NCT/pJUXuJUYZyPFWyCguaz1B5Q9B0R0TLvTIwIOTq5+ea/jVeqzINFQ7XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755070121; c=relaxed/simple;
	bh=3dTpD+QYfARqgui04LznNHegUi3+WIdxyLeFvtWS9XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPpjGa1NpLoleQRuIlNsirjgok3z+S840oMxMAuNnJhULAfZdZpTZWWt2QLoYOJ2Dy89FBQmCKRDBNY4qPyg7LBQZ/NMLCXpv+V0vOx64D9HaTgXXWgkhVm9mmK2Gqz+i1cEUZ2wMXzB2uLT8B/ohguaRAd+Igq/58WtuzyPpTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dBz0QzYC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-459e1338565so58226315e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755070115; x=1755674915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xoUqUxNajMdJpp9NpgGZ+X40EVMdAmJr3CW3+M0wpo=;
        b=dBz0QzYCS7VJhQ+WaU6OqpwpvSCg0R4U+VJMn+K4e027a0nSzUqvhdwhyES3Fax2a1
         JK9VHg5V1cBFSKHQXvkwmyQScpNOTpTHMahuwBKfhDvyx+tBaUnLOfZLnW6+PITD30or
         r8Qtu4XtRArFcJFkgRMnmWQu9Qks7J0OGfxsvMmZCdvh4d4Ic71Y9OHJ+Cy3AIr1I0HT
         AD5Ps6GMhy8BEH7tYD6+Ykk9+GcNNIeqrpHNfNiDdV2Nzzh343qLbSCK26WiqS/Hh4yz
         VRr40yQwhsBSEJ0ng3wKYNYntxgktj7ogEEFwdjLbUqT9e7IAu0Kl6r8wrjMRLheF003
         UH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755070115; x=1755674915;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2xoUqUxNajMdJpp9NpgGZ+X40EVMdAmJr3CW3+M0wpo=;
        b=KtOd/ForqPzEFdKQ6QT2xgDwepAAPje8Az8P825GucCbjJCX/l1cK0sxDL4JBnhJIY
         yCseWiBaBMzuykpPa/+JFkyqHHxQUwOxH1WBGtSd2LKCyin9n3ylsnHAIMLBu7468F8i
         YAGgUV0AQwZsfu4mrtx8SDekiY8JWrQ//jTTFR/nVkw7ZXWz+uCOIv1/smh5ENcXuwFR
         Lm4+/XsNzN1JKFxXibKGHDtfjHlBVo5lbYtOFRFbYe6VECm60+UFgjXBvqDVwcscJA6Z
         kstNM73HgAVxx+YnsG1xORp0RGS+H2FStZ6y7X+UAAjoc/4/ToT/ZIfXc7qh9wxbvdaE
         YWhg==
X-Gm-Message-State: AOJu0Ywb972c0aYmVM4zBSxoaQ5VTPL4uz2v0POeAHgN1+tTP7QYbcKR
	6uIQ0hz1+hyhcPntD5asC6XRIJYegExE7yrMs2qCIctMXUm3m6lpVUU7iJ3tBAN61us=
X-Gm-Gg: ASbGncu3LmSCYGNzJmD0L6BHQI4eogLHOCvN3OX1Hbgg2YSL1pdXmnlX6qvml2h9oO4
	kZ3cw4lI7byI4Q4rw9dMd2/9yGjdQgAPliu4QI6Y5tT09rmXCLUFInSwNe6IJHs1FM8FCPDJvYH
	egDEIRVtJF6nAVrRvndDHLGIbQUTr4d6KMnZjBU8JcVHf+8jnYbDufxg8IoBYlTry/SbE1qYttJ
	y07tocIqx9FYUiaOyikemhkzilmmH0obJtwUsqt6vIcHy0tziq+b/fO5ao3TUklGJrDuPMFAavP
	haDtYuvgPhoBDzmAgOvPckG9ryivZCtsFYOXtnsMA8GbVEEF55f7gQstp8uiRAJszDyWYg4YpuS
	8BlBiLQ7aBcAaQkXU3i4iAsBW2O4GtYzvAgmUZzbrY/PRnxJsIGzLY2TA9Bt6VCpuj+S0lgB7Lj
	I=
X-Google-Smtp-Source: AGHT+IGhyGw5sWS4YaYWNtfgUO+k5XMMhYMVBS3uMJMofzMil1epG4rBzcgefuGHwCqiUIIJ+EM7Kg==
X-Received: by 2002:a05:600c:19c7:b0:459:d3ce:2cbd with SMTP id 5b1f17b1804b1-45a165a9779mr16658705e9.13.1755070115468;
        Wed, 13 Aug 2025 00:28:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3e43:d171:89d1:18e8? ([2a01:e0a:3d9:2080:3e43:d171:89d1:18e8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16d3e4c3sm18766355e9.0.2025.08.13.00.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 00:28:35 -0700 (PDT)
Message-ID: <1fc94c92-276e-4435-aaff-630cace7ec42@linaro.org>
Date: Wed, 13 Aug 2025 09:28:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: Fix address for usb controller
 node
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250813063840.2158792-1-krishna.kurapati@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250813063840.2158792-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 08:38, Krishna Kurapati wrote:
> Correct the address in usb controller node to fix the following warning:
> 
> Warning (simple_bus_reg): /soc@0/usb@a6f8800: simple-bus unit address
> format error, expected "a600000"
> 
> Fixes: c015f76c23ac ("arm64: dts: qcom: sm8450: Fix address for usb controller node")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508121834.953Mvah2-lkp@intel.com/
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 2baef6869ed7..38c91c3ec787 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -5417,7 +5417,7 @@ opp-202000000 {
>   			};
>   		};
>   
> -		usb_1: usb@a6f8800 {
> +		usb_1: usb@a600000 {
>   			compatible = "qcom,sm8450-dwc3", "qcom,snps-dwc3";
>   			reg = <0 0x0a600000 0 0xfc100>;
>   			status = "disabled";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

