Return-Path: <linux-arm-msm+bounces-55404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5207A9AFD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 15:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D279F1B807FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 13:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91476171092;
	Thu, 24 Apr 2025 13:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Udgb1KSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1CF1A725A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502738; cv=none; b=FTVU4sle3TMx/ljDXufsaYYPo/AFe7k+1pB4EKk/+dhOoy23fWqMqgLE9sRrdWeLOTt4vPtIYVBvdHrdTls6dpnK4q2wnjZ9n7s+/uWc9nR4Y1Ont3B1A7s1Xf+1fb7NKjEzbBh++ZbFEXV72zeoqdvdn9ZUZj1YsuDH1kh+Kx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502738; c=relaxed/simple;
	bh=rhbP5XkQ6X097qPz7EVXCKsH39vG5Wdg9pzdYO/O0W8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=POt1ywMzLa8Dqrd5376ieUhsjIjvmaevw1oFRb1xlu/GOTWKwxz8XO+OBsuB/x+DGp9WwM4xRd9HlGGJ/hv2l/0OmlnkjzytQUoNWT0N6KNFx02s+FplQNigL+7bmKt7zFKCjtexgon5gWhm+D+38jR9WdiVimLN2svLR+bH/mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Udgb1KSZ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so728266f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745502735; x=1746107535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94knGJ71ZirGM0g1BU+o9ybsSO6EkD/aLUYDflsXGA0=;
        b=Udgb1KSZsgsKRnxIDXsift0+s/fWbsEJz6kXOJKl3gCWVIFJYqdyOzg9up/k7qw5vS
         rXnAG5ysnZCfuH2YrRBXbzsACEcAA3bgi9ojf98MhPyoFXLODnwJCy13yvpLYg03MXpw
         mO0aswRWyCdvTjNJ7p7Ubx3UKUvWjD6SI5q1fQq3/VxGuwtkup316ikSlSs2HywFXo7f
         ijiouTqFJl4fiMh83wGOnZ1I0+Hdk/JibUhgJRSx0Hdjhe+nzk8S14CAL044Fzh6U/90
         cWZSe+CI62l9O2/JriZzPS9AnVMSEvSgRRDF0xgmmiREIVXneW8t5C6fXKZzOjf5cdPi
         nuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745502735; x=1746107535;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=94knGJ71ZirGM0g1BU+o9ybsSO6EkD/aLUYDflsXGA0=;
        b=KZscjEhy0jjedh7Dgqx4xsG0UOwfd9ftihq566nXdVrt4u4qVSgYqmBLzTBlm6D3dl
         fGlrlDp8nDoCd/2NqdnhZEc2KvzIS25cMH4tr/Dx4TmmovF2YJDbrubXOQmETwV61QFG
         UxM/N4GUUI/OuiXI4zlrYHLBIdIz32EOu7NVJkTPIW7LImLNJaQ9jAX7EQMtVwb+4Zra
         mCw6prrKyldv5PTxYaW8mxQh1+NKmyu8qh+0uUMxMQXOAIpYXeWUvMzb2kjFHxKbZTrG
         Edw86b6riw1NbbxlLe0uvStAg+KbGwdCLaCHI8RZX0m1EOpiGU+UkUR6h39LuvNVasF8
         Mf9A==
X-Forwarded-Encrypted: i=1; AJvYcCXbA9GKT7Hg+GDYnutjo09GncZ8uoooxIwlDVA+5zcllJt3YzNuiRkBe+1cSGkvsfMe8Y4/BOOpWNp0cfie@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7DuJS5l/+Nsx6WHj8PY/Rhg7C9gs6rixfwC+QmpQD/Tw4z3S2
	ys8Ox/nhqeFvDRVypBB2hYncD1YGP2bUgafDiyq6W0kNuy3gft5rOG34Z+M2Des=
X-Gm-Gg: ASbGncsNTwxlMlj2TjjY/4GpHxzm+zZbIosdRwiXx8BZ/1SFwlPW3hIvkq/fx4oyUHX
	kVt1OOc9Tt3FFDhqiab9RlOWLTH7dBNHnv006y2s4NEsoBtrlbtY/myoatWTabevd6VTSVymwe7
	oDSG6aLdfJHbWLy1tehFCwoExmR33o03VUel8dUDDVVMTsCkR9WtaHcyc8ZFxmfuy0YGrrQ0G/R
	CjvuU5V4FdLT59XpcQP7fhnpr7s3+MQHV+ewjZoqmZ6w4QTidfG40nAxNNT4nPdWScdmuQbBnY7
	Fb+2NjmRlIrSp90P8nXkD/Su7AhpERDDa0KXeDBMps0kM563wHwtsTayF6ukYaZcWTnUwMwwl1u
	f5oOgEbUBx4lokH8trw==
X-Google-Smtp-Source: AGHT+IE8bCi/1gtJ/3UiylMOikIwlsDkRI0Npi+UN1WfULrYkQGHsvlTutYB0ZzB44iY6EWcuAgz4w==
X-Received: by 2002:a05:6000:4013:b0:391:1222:b444 with SMTP id ffacd0b85a97d-3a06cf56420mr2551913f8f.20.1745502734803;
        Thu, 24 Apr 2025 06:52:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d? ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4be673sm2140220f8f.23.2025.04.24.06.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 06:52:14 -0700 (PDT)
Message-ID: <e7aa786d-26aa-4a3d-92bf-7f14dcb79b8c@linaro.org>
Date: Thu, 24 Apr 2025 15:52:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC/WIP 4/4] arm64: dts: qcom: sm8750-mtp: Enable
 DisplayPort over USB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>, Abhinav Kumar
 <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-4-6fb22ca95f38@linaro.org>
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
In-Reply-To: <20250424-sm8750-display-dts-v1-4-6fb22ca95f38@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 15:04, Krzysztof Kozlowski wrote:
> Hook up DisplayPort parts over Type-C USB on MTP8750.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 8 ++++++++
>   arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index c3470e1daa6b7f31196645759be23fb168ce8eb7..69a54ac0f85d5ae20d005a09fbf8da7d769a9c2e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -910,6 +910,14 @@ &mdss {
>   	status = "okay";
>   };
>   
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes = <0 1>;
> +};
> +
>   &mdss_dsi0 {
>   	vdda-supply = <&vreg_l3g_1p2>;
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 753b069cab1de636a3b1108747f300bec0f33980..b20fc5b5bdfab598fc7b9be53eef96cc16bc5985 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2965,6 +2965,7 @@ port@1 {
>   						reg = <1>;
>   
>   						mdss_dp0_out: endpoint {
> +							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>   						};
>   					};
>   				};
> @@ -3064,6 +3065,7 @@ port@2 {
>   					reg = <2>;
>   
>   					usb_dp_qmpphy_dp_in: endpoint {
> +						remote-endpoint = <&mdss_dp0_out>;
>   					};
>   				};
>   			};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

