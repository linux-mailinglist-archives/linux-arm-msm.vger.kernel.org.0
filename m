Return-Path: <linux-arm-msm+bounces-77698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C69A1BE6E85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 09:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A51C5E1940
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 07:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2797A1519A6;
	Fri, 17 Oct 2025 07:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mYkY7Jjh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6205A10F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760685410; cv=none; b=Vk674+ISWPZME3hCjxJ/uV8WcQMhNtNT7VrknJUrLow2mSHGDSzDhDGLN3WxEXikDW2ObuoX1p1Sm7dEeOwnqCIAQ/aSlefNMvfPNlAVNPfCqtuY6ur3Jewq4o7Ol3E+n3qS+X3aqyxOGYQStemAftkjFFwNtoBP09gzUiVPqR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760685410; c=relaxed/simple;
	bh=WkjCDe1iZN7RtpJMQ0j2jTJpcuy68lAreT7PSN3xNOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SUV0fiLxDvxAMRBQ24k1mR3xNxbQdqJNUBKlYKplUguNtQKbRvCZx0jFvJ4mPmm881NHqlbSypR1ABan44e7B63amReiHefWySRd/imdWgxM9saNAypazrRoCH242USSUk+Q35fkzNL7BUIJB8pGAk+QkEX/Wbwa7TahavF7HUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mYkY7Jjh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-426ff694c1fso1042130f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760685406; x=1761290206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/84w58qQZ+rLVnC175uQ717jpwJwUQ31K6AtMEodINU=;
        b=mYkY7Jjh0swz3Zj6BJOWspvwg0dD8okkrHJ8uylfSslXXXFKWY3BqH59ypHo8F3vAf
         IHTVeoF2vootjHbLaYQLNJmE8+9fVPZ5Acs6KYg7YGk3CO+mKuwtQGHQmhnV16xUZLfL
         BpiyufWjMllKeBb99yFmWS/8CMrLbeh5IXX1MjNgHqHE/GT9mapsjprErNMsSEx6DKBi
         zoJsF+mamn5iXzpaMKbrOYIy0YvEOutPOdSCc0iOtqI9R/vtz8coorpMIcmEMUjq54B2
         FNIpfSNQBK1sY5tNEYGk6eHCBFMhZE4Km+iZToGonRLmYfo0rbhN3yzqdHwx6A538m0b
         opKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760685406; x=1761290206;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/84w58qQZ+rLVnC175uQ717jpwJwUQ31K6AtMEodINU=;
        b=bU3mZtH5B3oBSczTnaa8xLoXYy3D6Mg7IqnafnLki6lpF+2v2F/ptmfYeToFuCYxqs
         aNJJFIrnN9OViQqUxcddSsM3ISyh4JRFAjOUdBE/vtPTeOFlP6gUwqR4w9zde5MLfBp7
         hPTCJd8D1OyZHGLKsY0zyZ5F8+EucbvDsKgBxW7xRdHnQHeLY7CxBq99IUpq7rdrUPNY
         c86MTI1jY8xIHSrZjICpw6ES1os4+K1KL4AdPloKD6/Py98cFBK9gKKQE0y+NsDIudEJ
         snq9m+Z7aFaVFneCU0NDoZIgtFeU4aprarAHrXONF59wb/nJjBWAuLhRN7Wz0UspIgKH
         9acg==
X-Forwarded-Encrypted: i=1; AJvYcCUBBDBye99Eq2mXO/rcvpB47sVtEYrGYDOAsNX7k8YyURbvdQwlwZi6TXRVgY3CbXS4BItzlxECphtCoBKd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/nlOoRPVIbYVNGkWuzewJ39ksTYO5suJZMBVlusayjMPnq3EK
	M9kvUuWlYKVuGsohXuPZC+Q8qigtfhXx7ai7i+hvT9mYxVa6wPIUa5fnJ98ddPlG67M=
X-Gm-Gg: ASbGnctd7ODwqbS0fRcX4G1z7i5wxhEIxPk6xzyokbcL/ytMjX/lb9oMCPoqBkueN0L
	dZf47mY5/v4C4FclGd7SrCv2kmEPLUmQXysQ5Fl+S3SCSdiCvt/Jwr6aRghBfotm6r9nEGsOmBb
	iawlKLZukinWw0qH5+hdqUojSO73TJ3FIMbU57okv6T2YYIXWFARvFNXr5qWkxsxigDM593pfuP
	ex08w24hogT+FAF1/zwrjjlEKVgs53kI8vy0sM8d0iyfgwYQEX13tTQmaals8gR7Pu0PULeQyWh
	/I1Ccon8mvsQGQGao1JS9XNVjxM4sGedul1EBo5AYPPVjiSrXzyeq8J8BPplFFZI2re9gn2ni0p
	nRCNoVg/3EyhoXSCYANkcESmhgpU86Ya6dm6W+eUwpkYEd8/M0r/6XHJWmlYL6Io8vuYd3scsOs
	ArVhqoCtkSxsBYva52CczqodCYz/gTDX4EHznasV14mDdsjsN9oMTa
X-Google-Smtp-Source: AGHT+IF7LOY71VQuEzuxisA/iTxejx1ayZfDkhvVP5vzlYMYI0gvSKqUuuYoYZZ8O0skgjsMBVRidA==
X-Received: by 2002:a5d:5f82:0:b0:3e8:9e32:38f8 with SMTP id ffacd0b85a97d-42704d8d596mr1854422f8f.14.1760685405562;
        Fri, 17 Oct 2025 00:16:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5849:4623:6b2a:2be9? ([2a01:e0a:3d9:2080:5849:4623:6b2a:2be9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42704141cdfsm5819512f8f.4.2025.10.17.00.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 00:16:44 -0700 (PDT)
Message-ID: <2c04870d-960e-4978-b51b-2d8e41f8c452@linaro.org>
Date: Fri, 17 Oct 2025 09:16:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: enable camera clock controller
 by default
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250909235547.787396-1-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20250909235547.787396-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/25 01:55, Vladimir Zapolskiy wrote:
> Enable camera clock controller on Qualcomm SM8450 boards by default
> due to a reasonable agreement of having all clock controllers enabled.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> The change is based on Bjorn's qcom/arm64-for-6.18 branch.
> 
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 9ebf2b8700d2..e9ffa0af3cb3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3300,7 +3300,6 @@ camcc: clock-controller@ade0000 {
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
>   			#power-domain-cells = <1>;
> -			status = "disabled";
>   		};
>   
>   		mdss: display-subsystem@ae00000 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

