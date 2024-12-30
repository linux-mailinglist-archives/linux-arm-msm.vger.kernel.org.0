Return-Path: <linux-arm-msm+bounces-43611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 166599FE4F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 10:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60AB33A1A30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 09:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469D813A88A;
	Mon, 30 Dec 2024 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqm3Nasu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D831A238D
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735551727; cv=none; b=OfIlUTkGiecGKUN/BKpHYLL40AmQPC3ggzsHhXXAun9YF38FawgucqyNn8ilIdJIEvgrq6TQxrmRAuKj7ToKb/+NavT3mBStN+j5H61d1safpBQ32p2b6qgkxBoidJkK0HI3CuW/+eQQxWIDst5KGqf4xv/jNKuGyASIICRU6k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735551727; c=relaxed/simple;
	bh=q4Bi/DK4f9rPwTXQyZoH6miWtZlHbm7p0nHl4NmkjpU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sSCVdAzZgGDwWi0u2cNnM/GRouVpTXOT4E/tTVFoY6bhZR0ZTHtcds2/XEGQnU4DXbNJzATTz8UAqk5NzZKqvM5VVN06Fx/aJLJsgwfzBiSTAfWH6yB9Nh//Au8q1OHxuDfy0nV77oF/AxTkdDgXwVYOXLN11QhaWAKXgjETRqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oqm3Nasu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436345cc17bso65463675e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 01:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735551724; x=1736156524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZVPsGT6sGm4wbZwtsYOd5IIMM1dkI3s4LrtjpZusVM=;
        b=oqm3NasuStalGLHE2odsYuqCvxOvRsI22/iPvTIbDz7uU8pAmm3LM7raV64JzH6lNG
         Kpwf8EejznHAbk2ZgHP9vFU9Lugikvf0rA//dt3Z9GIRzhwmLJ8ZZrHnUKhASHOiBDH0
         y/uKJLSOKL/FXdPCvHWrYMUc8mqmI994T3+HeD0GBPz9hNE4qHzTGX8xs2t4KPHYiGY9
         IFww1ZXyTSp7n7Ccw3c71Nam9nu3GVXW27ICoE6+D19+aJTR/VQ8+7vrG3nt755XKnkA
         +NeJF6mEil8/AU0DkCh+V5Cv2CmvsiB4dCZQI0cMmhEfqmPamTLgUOV+saX7PA2zQtDM
         WsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735551724; x=1736156524;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ZVPsGT6sGm4wbZwtsYOd5IIMM1dkI3s4LrtjpZusVM=;
        b=GtLb60gaCpTjHuq3BDIPM7cD2fYDQ+8mCm/ocTy3FY1bi1T+ToZPd/u+Jv+0fL4ai+
         u1Ve4EQyVLqrGRP3XOItH0lOPZIo1pLBsw39CS6zaVAls/O+lIWtIXl8ySEmfX1KEq9S
         T+jAFuvx8p87Y3BFWWDrrf1/G81RRz3+g2oDzFiGwEPdy08anIdYzRd7q6fYjb2r/2KT
         K1Kue5NozNuOL8e/Xt8b6yZdA5Zp02uUQQulUNwgYzD5O0OaLzBdpRCEbp8Yjj1UfFIU
         uBdptSpHL/f0SDr6+yUo4yxq048AWkiaEqL+y8WsKvZ+HIkK3lb5HGovyqh8k6msU3N6
         yKwg==
X-Forwarded-Encrypted: i=1; AJvYcCVISvP1UoLeWg8VVrDsqmf2Aza0610WJT+eCgJuQeP8coUdRSvH2quL5EQOV/RNKly+ozA8dU8fb24IUSNP@vger.kernel.org
X-Gm-Message-State: AOJu0YyEedKZmRTcL3YxfEWJc0GiLZBeTS2ZLTdQ+YnkhV8UIR09gr2+
	yAn4f51Ee7JEdy31I2caegFHorD/VBGpSWTUXatAKXQt2bY3LhN8EL1Aajq2Mjc=
X-Gm-Gg: ASbGncsfNmKIkzDoaUq7fENcFfH7lm20bH5eytZFNKE/FXVBypKtCOi7h1nsA8Bj3oT
	VcOR5UxsK3SgRRZgrsKNqMWVg8xkVS3hmVn8F0onqpZaob8kAHQ8WSFuZsGM7mrPMEe34/jA5GI
	X1kai3rkhL9XG9eU76nESEmK2A+zRP6FEbAWNMfxoyBtcFSsHAkSgsMtQWdp0+iNTv7+GV/bk+Z
	YDPBGOHH0kpl+49yN+YztZt9t1WCSbgPe2HyTv1hwu6P3nwudL70PNK25eTUhQHP52+YT7Ve0x6
	t/yzOZiVT/x55lfv9XtIUdBmc2deY1As8Q==
X-Google-Smtp-Source: AGHT+IGX7PafjbYuzY138Djqzj8xa3fmRQFFVZDsgB/bpDkSlBlW6u365Zj1l0NdH66bQBCv25ds4Q==
X-Received: by 2002:a05:600c:3ca1:b0:434:a350:207c with SMTP id 5b1f17b1804b1-43668b5e22fmr265731125e9.23.1735551723808;
        Mon, 30 Dec 2024 01:42:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:883b:3c16:2465:ad55? ([2a01:e0a:982:cbb0:883b:3c16:2465:ad55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436604e9c2csm351355895e9.43.2024.12.30.01.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 01:42:03 -0800 (PST)
Message-ID: <b3417a8f-d1a0-412a-8c00-9a002b908446@linaro.org>
Date: Mon, 30 Dec 2024 10:42:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 17/21] arm64: dts: qcom: sm8650: correct sleep clock
 frequency
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Georgi Djakov <djakov@kernel.org>,
 Shawn Guo <shawn.guo@linaro.org>, Stephan Gerhold <stephan@gerhold.net>,
 Zac Crosby <zac@squareup.com>, =?UTF-8?Q?Bastian_K=C3=B6cher?=
 <git@kchr.de>, Jeremy McNicoll <jeremymc@redhat.com>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Melody Olvera <quic_molvera@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Stephen Boyd <swboyd@chromium.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Fenglin Wu <quic_fenglinw@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Sibi Sankar <quic_sibis@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jun Nie <jun.nie@linaro.org>,
 Max Chen <mchen@squareup.com>, Vincent Knecht <vincent.knecht@mailoo.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
 <20241224-fix-board-clocks-v3-17-e9b08fbeadd3@linaro.org>
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
In-Reply-To: <20241224-fix-board-clocks-v3-17-e9b08fbeadd3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/12/2024 11:17, Dmitry Baryshkov wrote:
> The SM8650 platform uses PMK8550 to provide sleep clock. According to the
> documentation, that clock has 32.7645 kHz frequency. Correct the sleep
> clock definition.
> 
> Fixes: 6fbdb3c1fac7 ("arm64: dts: qcom: sm8650: add initial SM8650 MTP dts")
> Fixes: a834911d50c1 ("arm64: dts: qcom: sm8650: add initial SM8650 QRD dts")
> Fixes: 01061441029e ("arm64: dts: qcom: sm8650: add support for the SM8650-HDK board")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 2 +-
>   arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 2 +-
>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> index f00bdff4280af22f6f8b23e33238f53c602bc169..d0912735b54e5090f9f213c2c9341e03effbbbff 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> @@ -1113,7 +1113,7 @@ &sdhc_2 {
>   };
>   
>   &sleep_clk {
> -	clock-frequency = <32000>;
> +	clock-frequency = <32764>;
>   };
>   
>   &swr0 {
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> index 0db2cb03f252d19a1f8b171a562a8e06290c8a21..76ef43c10f77d8329ccf0a05c9d590a46372315f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> @@ -730,7 +730,7 @@ &sdhc_2 {
>   };
>   
>   &sleep_clk {
> -	clock-frequency = <32000>;
> +	clock-frequency = <32764>;
>   };
>   
>   &swr0 {
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> index c5e8c3c2df91a49476f49832c0bd6418f4dfae3d..71033fba21b56bc63620dca3e453c14191739675 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> @@ -1041,7 +1041,7 @@ &remoteproc_mpss {
>   };
>   
>   &sleep_clk {
> -	clock-frequency = <32000>;
> +	clock-frequency = <32764>;
>   };
>   
>   &spi4 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

