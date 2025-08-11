Return-Path: <linux-arm-msm+bounces-68264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFFBB200CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 09:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A4FA18914C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 07:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6D2299A9E;
	Mon, 11 Aug 2025 07:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jR4thrEb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A751B20102C
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754898667; cv=none; b=Jr6rRjDEvWmrmk6FcRseWx3yjrsPxONFX7/qq9IoBaLrncBEVE71FeiuDuUmUqbIiYACSyqso58YEq9mtK0T0Czsy+zZjUgJCUNx29KZbjrSdfHj7dDPn+yH2z7yqDPWpGEYPALpqKBV0WX0SF85lf20vXa8S/7DG7RUj2pRCgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754898667; c=relaxed/simple;
	bh=v625ymQxFS+YCBJDvagQuBLz+d89QJreJSRQKzXaYps=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AieBnTli1ntA6v3agab3O4XYG6+iXB77lc0urdseVeYzsncIeMoQVRqHPa5vOJ4nWAfofov6HXcKzftFIs1vwebsHgPZic3d90d8K0UCCjLkgp34WlFyvdpnC95fAJVcx/1G+UlnUU1R5Grraj9EcH1ppcMG9KVUTgLBxbrFV+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jR4thrEb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-458ba079338so31335875e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 00:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754898663; x=1755503463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCxvGReB/YdPK1TB+jaxnIWUKnSdJ0qulaewLmYALDA=;
        b=jR4thrEbD1wq0fBAcWnhk/RnP4klbCJUBUA8JSiWwrp3txhbQwbnTzSGLgE8PCYFsK
         C42DzOTEGfNpMEJGTJoc9+UyZ9ObyH1dzhGTt58Gudl0SBwNkf/o/CvbKsQgXp14Mx4M
         QMe8NoqvSA5zDVTgjZCIL60oUkowxZ2tjfZH8aW1r2ihcZUSga3M/2vPnGxHRL+MgQwq
         x/ZHcG9/kT4OyEMJol5oGK5esTIKVA5+7aWF96rkjz2EArQ+de6NpPO91VM2nkdS0kJm
         m0ZFjqPRKVxOfz9MWwFzjmDw719L1iiKi+gKaUMbPwq9CRtPP3l+0/uLxrvt5dZmPGEk
         DsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754898663; x=1755503463;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SCxvGReB/YdPK1TB+jaxnIWUKnSdJ0qulaewLmYALDA=;
        b=qeprv5YEKYwR4qFZg60mgMSoHQ5zsTZfykIw63osH+5A2NoOFfay1P/qrtFzCtgb6B
         LwgTOcjd0JA+DyZDEWdaoIOcpWpiUFaeDGUhTj/YhxYk2uVl45OBe39lqmJXjABG7A6+
         0eQmtvQnQ6mf7lKELBerp3Do5fDQTPV9ZkuZI3YXuew81AA+AwEAQTE528ihRyJoiJ0w
         PQXyodO3rmq4ukNtwscIZIJ0X6CUmWDiRCWPILf95Ajcs9fme9UX+gJpKXp5qdBRoEiF
         QfmNwWGUVKndZ51aXZGsAmIDimOJoqv+tPqBISzASpg0vxkVO0w9dQ+DPsyCh5N5cTLc
         BSsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6i7ESbzV9IBO62JU+nXLRkmAnSJ/QCCDBjmCY3EmrBXG2pdAscnoKhJzYr98PcEjS+oDaIyb2InhPpG+U@vger.kernel.org
X-Gm-Message-State: AOJu0YyPb0dANObl2G1NL0JMd5vnI8s6nXVvpQOOPHDzq1JC0IZXARP3
	itAPjk8qvSb4rQFhnT7AuMwWeZ6RcCbLnISTICUVDl46rBeRHoeJwiM2EfT23P5+fmE=
X-Gm-Gg: ASbGncu/LNGsNSWlX/26OlbJGenCBLFvmISh4UZBk4U+KiFEMsthEotnIQMHCT2TaZV
	HWmjwNjnUydslE0e3PFmqsxGNxenVsUAicM5APuPxW2Uy8HE6ZnD45C2kCOH/EHMaQmTlKPHn/N
	+s7NmBiGVrZWp0J345RTN7l3pSYekeXn6F9S1e6lMrIYQD7sHqXX98AOr5T2JkBX+I2DoyFCLBJ
	cCfFGH08Zm3iaz6Qbzcje282U4jih9hdVCHYjTlb0QKzADbXQ+fVFu5HpDWwN4sXd89Yjb/60H1
	jSjFBZv5ea6xyLOE8W3RkNdz7uDsrFaA8OuTNIPqW5KN6U6WUkviRnJsTMf/msq2HW/rcQ02vix
	FF4ML4ZBcIItV8xMEic6kAXPE58MFbHH2bOWQS3FsFW9UgNLtNqSonxYpkMDBPbYTB3UfLLkdOu
	k=
X-Google-Smtp-Source: AGHT+IHVV30FoowHptAlEajvZgXMFWrsREGbOySyGN+RbPFO0235lfTNd4xbMnBALGm7ACcJo6UbZQ==
X-Received: by 2002:a05:600c:c089:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-459f3a7ee89mr89086075e9.10.1754898662994;
        Mon, 11 Aug 2025 00:51:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b0fa:b045:4b82:de09? ([2a01:e0a:3d9:2080:b0fa:b045:4b82:de09])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5c40eb1sm121405305e9.6.2025.08.11.00.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 00:51:02 -0700 (PDT)
Message-ID: <37c6a22e-e47a-4559-a765-a7779575d6df@linaro.org>
Date: Mon, 11 Aug 2025 09:51:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: sm8650: Add missing properties for
 cryptobam
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
 Anusha Rao <quic_anusha@quicinc.com>, Md Sadre Alam
 <quic_mdalam@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
References: <20250212-bam-dma-fixes-v1-0-f560889e65d8@linaro.org>
 <20250212-bam-dma-fixes-v1-4-f560889e65d8@linaro.org>
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
In-Reply-To: <20250212-bam-dma-fixes-v1-4-f560889e65d8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/2025 18:03, Stephan Gerhold wrote:
> num-channels and qcom,num-ees are required for BAM nodes without clock,
> because the driver cannot ensure the hardware is powered on when trying to
> obtain the information from the hardware registers. Specifying the node
> without these properties is unsafe and has caused early boot crashes for
> other SoCs before [1, 2].
> 
> Add the missing information from the hardware registers to ensure the
> driver can probe successfully without causing crashes.
> 
> [1]: https://lore.kernel.org/r/CY01EKQVWE36.B9X5TDXAREPF@fairphone.com/
> [2]: https://lore.kernel.org/r/20230626145959.646747-1-krzysztof.kozlowski@linaro.org/
> 
> Cc: stable@vger.kernel.org
> Fixes: 10e024671295 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..c8a2a76a98f000610f33cd1ada82eebd6ae95343 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2533,6 +2533,8 @@ cryptobam: dma-controller@1dc4000 {
>   				 <&apps_smmu 0x481 0>;
>   
>   			qcom,ee = <0>;
> +			qcom,num-ees = <4>;
> +			num-channels = <20>;
>   			qcom,controlled-remotely;
>   		};
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

