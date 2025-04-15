Return-Path: <linux-arm-msm+bounces-54415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BD4A89CE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 13:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E6FD16FC57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 11:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DE629344E;
	Tue, 15 Apr 2025 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W+dB13UZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1177291151
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 11:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717977; cv=none; b=ebn/HQ3WlNNgnUN4cMNBbYmR+tXRD2AiXafwOMJrCBRUR7eJBDS0At2R+af+2KZM7Avf82hLn4fqUCZCVcWYjMkloRGvB3PrKYytluQzDsEVbZntG3g7luDjiVEXEOcFHSuyqsxit0JBfA5mZeqeVRel/JahTcZQ6+ML+ny77Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717977; c=relaxed/simple;
	bh=R3KMat6dpKT9P5kR2aCefHM9mxZLRXgE/GXM8IoI4sU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Pwf4GDOuW/O/5zWiYNInz6KlFjbVlKpNwCFWB7KMCbdSxUf8xROmyfGQBoMVOOwExXX4/qbLcyE6gpBgdEdcbE7GXCVcUvjARF999TufEfXuTTglB7U7E1VhbGam/kaTvlbgwGFxWf+NqJeTGcxWWFvndGyIYIUy7+32+GVd9BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W+dB13UZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d0618746bso42117405e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 04:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744717973; x=1745322773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0q6CvIAOqvdoFuFnFaI55m1HCBtuutJvTP70+YwinaI=;
        b=W+dB13UZ3El4Akd3Us2uE9TCU/H2ANma/Nl+FhXEhfbvzG3BV9d95/e4mGiX90uj79
         hniSZoZ3BKEmPHFefh+so9kr9BqfF/okfWqu4a85fJeCFnma1XU+c8xoGWJp4hQIMwaC
         5LYiml7ISxSBkflxe4gxFj8Xa9Yij/EIn3X/oVO9w4cZ0cWVvTGsMVvC0fTHothK8XAC
         xTUItyQ6GUXKZt8ptv/vx8p65bHoYgDmeQduFhX37ELhjgPr+QJwugYszYuwab5dfWzR
         vOc0ROZYRUCpOVjgAlm6nk465LHGnvEs5GzgTgl0TFTpw0bP3C6bGwV2iN0xPLyr5dD0
         ZWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744717973; x=1745322773;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0q6CvIAOqvdoFuFnFaI55m1HCBtuutJvTP70+YwinaI=;
        b=QTr8IMR7J1hZY33OeiPCVsv1d/d4PpHYxn5tPWmfg75gm8KUz4+hlZ3PqkiQijdhzx
         ZOfNMNNN9e+fV6cxpBnnUSSo2m95+Gqwop9joGhQ50XbvTPFYUrEVJNai1G5LSPRUUfh
         rsc6OgccrsJybAfSQV1muvsc48s1vKSqHn6LaRM89pni6yHI92u0BEI4TZFA+0bkrFwS
         u6icdDlBR7ljiwGlGXvwn9x0JpCAq7Pjr2qUHXCAwu0GBhsj0qMPTL4Yv4am+XSAW2rV
         bPfn7HJHFhy9gaaXAIyTzkO0nk7LUeoA1areGMryJg/8YIJ/BEJe31VZlrqxs+2PR6Nt
         i+5A==
X-Gm-Message-State: AOJu0YzpYLdRJxYYOE62lTg4+GYJgbb839JRd9dCWCYrEUhTQEmWtiag
	tSCs0O7ulEUx4qTDWrZ0NW3mp84QKJVTiv+g7moGLkhx7C8Zq5QcUXSzzTlCYd0=
X-Gm-Gg: ASbGncsTB4e96UlM02XUalDDZw/NVeoEj1f8fRVXL5DQyRU5/h0WGrPwGy2mMeFPafh
	KU7KZB46ALTDkUUFqpiZ3Fc4QfJxSywtN2XM/9w3AmtpDPVH0nBnAU1K+Ce85UC3b7PmKqgxiyW
	3Xztb5SZK+FrSN1sFepbErwiS8Gz123AMsM3wTVx1cYBfcN7iXp8BtkLlqlpXdpPUWIswRWNDAv
	/qH9F/AreEgAVd39oEFhJIa5oMJju0bLcpd6YZte/0Z11IZtgbwyq7XFDiYjw+XYPXCOXzYryme
	bqd0k189Ongl2FgCLAGr0WTKfXEb5zDVX1817AKUp3WdhADYyUIzXbGMFqXjhTSTkW+xMX+wmHz
	vYJNRLQmxZ3vfBLPrdA==
X-Google-Smtp-Source: AGHT+IE5nwejIgvC2Ltw6gUj8FCuwb3YjBXFaTOX+Dz9gTa5ZqYd0rDdubWjKg3rjaStCA3lp98AdQ==
X-Received: by 2002:a05:600c:1e14:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-43f3a93f681mr142360485e9.14.1744717973191;
        Tue, 15 Apr 2025 04:52:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ac71:de35:af4b:b8fb? ([2a01:e0a:3d9:2080:ac71:de35:af4b:b8fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5d31sm206454475e9.35.2025.04.15.04.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 04:52:52 -0700 (PDT)
Message-ID: <5e023e72-7c02-49c7-82bf-09dd549ef00f@linaro.org>
Date: Tue, 15 Apr 2025 13:52:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 19/20] arm64: dts: qcom: sm8550: use correct size for VBIF
 regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-19-90cd91bdd138@oss.qualcomm.com>
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
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-19-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2025 12:26, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index a2732e04896e2f6dcdcd019d90d23731ad0d15a7..82cabf777cd2c1dc87457aeede913873e7322ec2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3374,7 +3374,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			mdss_mdp: display-controller@ae01000 {
>   				compatible = "qcom,sm8550-dpu";
>   				reg = <0 0x0ae01000 0 0x8f000>,
> -				      <0 0x0aeb0000 0 0x2008>;
> +				      <0 0x0aeb0000 0 0x3000>;
>   				reg-names = "mdp", "vbif";
>   
>   				interrupt-parent = <&mdss>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

