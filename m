Return-Path: <linux-arm-msm+bounces-1786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE4A7F6D32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 08:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91D7B281B3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 07:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA198F57;
	Fri, 24 Nov 2023 07:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LLLUza2m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0FCD64
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 23:50:54 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54af61f2a40so341306a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 23:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700812252; x=1701417052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t72f4wPL/KQKtbypIvo76yycy/dSaAM33evdOmYUjh8=;
        b=LLLUza2mP3dr986i9/QUFzxT0Jfof+0DXPbY3p8t47XB4S94UdXhSF+H0Xo09lXKoY
         jaddfP8eWJPXMrsloOaZVoA0yZlLyBqTmQHYLnX9hNNuuPtljpkYi6TNiYbQwLNAIt81
         Av8RxEnIRWfmvbRbTDlc/7uhxLJ0EOxdfOGBW2G9IrJWjbK+TvIDF12DdGLdNytujpUI
         y8FtdKTfNSNI8k2wd1CVjTizSOXTrMpSqRt7xpggzAUjzXZCqqqsgmlMJA+zc9NveX1n
         +IHDeVV77bKVffMxr+sTuPNiR8reUcbQoN8mCU+Y3hAkV8WMu/vquwI4JL07IZU78dEh
         gO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700812252; x=1701417052;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t72f4wPL/KQKtbypIvo76yycy/dSaAM33evdOmYUjh8=;
        b=JmPK4FbqIhTj9TwXxeoZL7i23KL/IcfgDEqVshsBtrN3f7WC7wMd164APbDut20Jgm
         AxTTq2nDDljvW4j3qJL1hI72jNalOVQC2UdIS1pDrC7CseAEFUaFiv3lD2rnpQj06fhH
         FZaLZyeVIjBWALBkJF1K8zB8Tjsa+Oe5N6zgmwRRLgymmVJRkDoQv/pVaudDpzNgO2iF
         aELnOCrra6NomxkE4MWjKPPOfkXFRZ5kvHW1hiEwLqw/DJxsSWV0s0qtQo+TKMByQ58o
         xTJh7wqDeLQAdaxT4wq28pV6ZlDg1TIqkBYsfZ9THgeOo5YraqOAJCaPR9ODXRSZjO2h
         n+9A==
X-Gm-Message-State: AOJu0YwFzVMwpekiqEXrrD+1Vfbff3HoAFhe2XDHb7IhSUxtto8mJW+j
	AEoeJpItT9H5/+MRgSEk+FslzA==
X-Google-Smtp-Source: AGHT+IFTS3GA2nqCP5ApuCMI7aWQTy4ZEQZBx6Y0ZVQJDa4emFpcGOdRBVkg08GRDVlg+VnubJJbrw==
X-Received: by 2002:aa7:da57:0:b0:54a:f72d:38bc with SMTP id w23-20020aa7da57000000b0054af72d38bcmr816993eds.1.1700812252445;
        Thu, 23 Nov 2023 23:50:52 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id i1-20020aa7dd01000000b00548657c5efdsm1483540edv.10.2023.11.23.23.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 23:50:52 -0800 (PST)
Message-ID: <47406b19-811f-47ab-8c08-dd8c4cc5d8bd@linaro.org>
Date: Fri, 24 Nov 2023 08:50:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Fix the warnings from coresight
 bindings
Content-Language: en-US
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>
References: <20231124061739.2816-1-quic_jinlmao@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231124061739.2816-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2023 07:17, Mao Jinlong wrote:
> Fix all warnings in Qualcomm boards coming from Coresight bindings.

One logical thing, one patch. That applies not only to Linux kernel, but
to all software projects.

> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 26 ----------------------
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 32 +++++++++++++++++----------
>  arch/arm64/boot/dts/qcom/sdm845.dtsi  |  5 +----
>  arch/arm64/boot/dts/qcom/sm8150.dtsi  |  5 +----
>  arch/arm64/boot/dts/qcom/sm8250.dtsi  | 24 ++++----------------
>  5 files changed, 26 insertions(+), 66 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 6ba9da9e6a8b..e42c22b26adc 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -2637,24 +2637,6 @@ funnel1_out: endpoint {
>  			};
>  		};
>  
> -		funnel@3023000 {
> -			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> -			reg = <0x3023000 0x1000>;
> -
> -			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> -			clock-names = "apb_pclk", "atclk";
> -
> -
> -			out-ports {
> -				port {
> -					funnel2_out: endpoint {
> -						remote-endpoint =
> -						  <&merge_funnel_in2>;
> -					};
> -				};
> -			};
> -		};

Why do you remove nodes? How is this anyhow related to commit msg?
Nothing here is explained.

> -
>  		funnel@3025000 {
>  			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>  			reg = <0x3025000 0x1000>;
> @@ -2681,14 +2663,6 @@ merge_funnel_in1: endpoint {
>  						  <&funnel1_out>;
>  					};
>  				};
> -
> -				port@2 {
> -					reg = <2>;
> -					merge_funnel_in2: endpoint {
> -						remote-endpoint =
> -						  <&funnel2_out>;
> -					};

Why?

> -				};
>  			};
>  
>  			out-ports {
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index b485bf925ce6..ebc5ba1b369e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -2031,9 +2031,11 @@ etm5: etm@7c40000 {
>  
>  			cpu = <&CPU4>;
>  
> -			port {
> -				etm4_out: endpoint {
> -					remote-endpoint = <&apss_funnel_in4>;
> +			out-ports {
> +				port {

So you want to say out-ports is missing? Commit msg is really not
explaining anything.

> +					etm4_out: endpoint {
> +						remote-endpoint = <&apss_funnel_in4>;
> +					};
>  				};


Best regards,
Krzysztof


