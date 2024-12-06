Return-Path: <linux-arm-msm+bounces-40820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 021269E74C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B196F287473
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 15:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E8A20CCE2;
	Fri,  6 Dec 2024 15:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XOjfCx9T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD4720D51F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499824; cv=none; b=Pztst7R79QePEnJtlwoaQ4UslMuVeCNXA3HKt9V6wEX26w1bDoWAWknRZh6Bx9XPH5X/YxZObods4NIiA5ei+HjB+LLg2jkMOISmby5bMTfe/GxPlXDcBpTx4BDXAb4Gl0p9rBRDBpD3PEKI9/fkp43QTuJsnHKiMvPTGUI/G7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499824; c=relaxed/simple;
	bh=T2tKosjtPmCk/I0/ZdE6fw2TToDqKY59GGNFbXRnbTE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=p/Vdbk3PT5it1w7DGhSK60mHchdfHQtUOYLmIIRjHxiGPGu90jaLmZMSPd7/7fw4DIv+5qjdmIHMi1vRwBrKtSNtLLFjYGYLJSodss1pOPEOsMbmqCHaBppI4sNrCAyfGl3Vh/r3HeY9SKIv/G1E+eZP3TyZCioQhVj9oryEUzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XOjfCx9T; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so15132455e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 07:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733499820; x=1734104620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHanLFaPZhX2tyVWNNPkqAahSlLc8BfJ4ow890r5CG8=;
        b=XOjfCx9TUEkyMXv1SnBu9F7CMVDMCyA4uDwZfLvu3CiRgh/Ke3MK/Ci98jybZtu0yn
         sJGmba4x/VbfPpaILHyNCaNNiqPb2x5p6Kzupm+MFdOgu7Vd/OX8M/PpO9w+cOZAGzDl
         OJ+SRTm0m1ZtmlPuae4Nobz2kdf3RPraUL8iX6QvB/l3hKX25iU1fx+pj1wfWizXZnGv
         bfQtF9L85hQ8UApCL76lLEsv8xzkPbYFRS6APSnbvixpQ7BrrKFV6T1ggpkjRS5gyuyF
         EKb4TaoxI7YgcFLBmRkkiZWDdoyAYEecP601JS2CXzy3L4VbjlxkQAUrOpJHZkukD+2z
         RZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499820; x=1734104620;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YHanLFaPZhX2tyVWNNPkqAahSlLc8BfJ4ow890r5CG8=;
        b=Ucn0YEsFBd9ig/Nl3BN0EBfaNVNKJFLneNTzhMkkKiBtI5fZpvNewtvBplB+HEVTfV
         TOLepXVKQ9oKvkezPdv+3ITR58vptl38C9eGT0rgA2Jbzi+gwGbJr+y+tPp5CFHY1vaU
         dZJtsuPAhQiiizxLxCCpeUnhyQ+scaBL1ZGxQCJsUh4hzpsntOTfLK26OlqX5MRGWomn
         tbdeke46QNAcB8ksxXSx8zp8EKp84Yh23+wbcA8U/6Lwq4krt53NQ6U5NdAVFoviINVr
         kIY6gjkpuzLfX8aVjgj3rXftoyU31X16vuiwUeYLPO99JHaKBLI6HVY83h3uqJPoBbr3
         c+lg==
X-Gm-Message-State: AOJu0Yxfxw0XBwuYEoqxIYdHqPCn96JOd3EOtTxa8aacBmu8nDwWeqQ4
	BQ+bZGO9cEoaAmLgFInlfX68R4ZLCwKJ542u/BRe/VlMfv3/3DZw5D4ggiaXWow=
X-Gm-Gg: ASbGncuyzcP4QaxEGulq73+5spIWyuZXLvuSY/+VwoYfNJb9KclWljE68a6fyUIrTcS
	prxA0gxrq+gAqidbgj6B6eO7J8ZAg2vOw4eCiuVBnuHRGFwcPND2Sr1x14iuZQz19Sou4vbM1jN
	X0zCGIaZzGGJwwmBcx+p2QxqOuAM+tbf8Wi9QFXmdKMe9yNZz4lTkmL0rn9kSrPAIpSi6FLlUV1
	GDq1a8RyTzWbpQWzgFYPTye8NP69xmYBVMdfNJsfc7vAml1FbbF27C0W5i/uhuFEVxxDbs7WwG9
	S3XPe04IXbvOIEIA1Kq4LswyaSI=
X-Google-Smtp-Source: AGHT+IEfjsGo14TZJENTSCxh80wEmajgqtUqbhtQLEHClPdscsU703qIgNmNF1c+wvmZc7YGL7KSAw==
X-Received: by 2002:a05:6000:1a86:b0:386:2aba:a7f6 with SMTP id ffacd0b85a97d-3862b3e752fmr1962741f8f.49.1733499819716;
        Fri, 06 Dec 2024 07:43:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf3a:f04c:5b99:c889? ([2a01:e0a:982:cbb0:bf3a:f04c:5b99:c889])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf4119sm4791560f8f.14.2024.12.06.07.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 07:43:39 -0800 (PST)
Message-ID: <37d31800-894c-4af3-9307-f7e5f5ac9276@linaro.org>
Date: Fri, 6 Dec 2024 16:43:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 04/19] arm64: dts: qcom: sm8450: Fix ADSP memory base and
 length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org>
 <20241206-dts-qcom-cdsp-mpss-base-address-v1-4-2f349e4d5a63@linaro.org>
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
In-Reply-To: <20241206-dts-qcom-cdsp-mpss-base-address-v1-4-2f349e4d5a63@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2024 16:32, Krzysztof Kozlowski wrote:
> The address space in ADSP PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB): 0x0300_0000 with length of 0x10000, which also matches
> downstream DTS.  0x3000_0000, value used so far, was in datasheet is the
> region of CDSP.
> 
> Correct the base address and length, which also moves the node to
> different place to keep things sorted by unit address.  The diff looks
> big, but only the unit address and "reg" property were changed.  This
> should have no functional impact on Linux users, because PAS loader does
> not use this address space at all.
> 
> Fixes: 1172729576fb ("arm64: dts: qcom: sm8450: Add remoteproc enablers and instances")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 212 +++++++++++++++++------------------
>   1 file changed, 106 insertions(+), 106 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 53147aa6f7e4acb102dd5dee51f0aec164b971c7..d028079c11bdc2dd2b254f7f7d85e315a86f79bc 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2496,6 +2496,112 @@ compute-cb@3 {
>   			};
>   		};
>   
> +		remoteproc_adsp: remoteproc@3000000 {
> +			compatible = "qcom,sm8450-adsp-pas";
> +			reg = <0x0 0x03000000 0x0 0x10000>;
> +
> +			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd RPMHPD_LCX>,
> +					<&rpmhpd RPMHPD_LMX>;
> +			power-domain-names = "lcx", "lmx";
> +
> +			memory-region = <&adsp_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&smp2p_adsp_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			remoteproc_adsp_glink: glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_LPASS
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "lpass";
> +				qcom,remote-pid = <2>;
> +
> +				gpr {
> +					compatible = "qcom,gpr";
> +					qcom,glink-channels = "adsp_apps";
> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +					qcom,intents = <512 20>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					q6apm: service@1 {
> +						compatible = "qcom,q6apm";
> +						reg = <GPR_APM_MODULE_IID>;
> +						#sound-dai-cells = <0>;
> +						qcom,protection-domain = "avs/audio",
> +									 "msm/adsp/audio_pd";
> +
> +						q6apmdai: dais {
> +							compatible = "qcom,q6apm-dais";
> +							iommus = <&apps_smmu 0x1801 0x0>;
> +						};
> +
> +						q6apmbedai: bedais {
> +							compatible = "qcom,q6apm-lpass-dais";
> +							#sound-dai-cells = <1>;
> +						};
> +					};
> +
> +					q6prm: service@2 {
> +						compatible = "qcom,q6prm";
> +						reg = <GPR_PRM_MODULE_IID>;
> +						qcom,protection-domain = "avs/audio",
> +									 "msm/adsp/audio_pd";
> +
> +						q6prmcc: clock-controller {
> +							compatible = "qcom,q6prm-lpass-clocks";
> +							#clock-cells = <2>;
> +						};
> +					};
> +				};
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					qcom,non-secure-domain;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x1803 0x0>;
> +					};
> +
> +					compute-cb@4 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <4>;
> +						iommus = <&apps_smmu 0x1804 0x0>;
> +					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu 0x1805 0x0>;
> +					};
> +				};
> +			};
> +		};
> +
>   		wsa2macro: codec@31e0000 {
>   			compatible = "qcom,sm8450-lpass-wsa-macro";
>   			reg = <0 0x031e0000 0 0x1000>;
> @@ -2692,112 +2798,6 @@ vamacro: codec@33f0000 {
>   			status = "disabled";
>   		};
>   
> -		remoteproc_adsp: remoteproc@30000000 {
> -			compatible = "qcom,sm8450-adsp-pas";
> -			reg = <0 0x30000000 0 0x100>;
> -
> -			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
> -					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
> -			interrupt-names = "wdog", "fatal", "ready",
> -					  "handover", "stop-ack";
> -
> -			clocks = <&rpmhcc RPMH_CXO_CLK>;
> -			clock-names = "xo";
> -
> -			power-domains = <&rpmhpd RPMHPD_LCX>,
> -					<&rpmhpd RPMHPD_LMX>;
> -			power-domain-names = "lcx", "lmx";
> -
> -			memory-region = <&adsp_mem>;
> -
> -			qcom,qmp = <&aoss_qmp>;
> -
> -			qcom,smem-states = <&smp2p_adsp_out 0>;
> -			qcom,smem-state-names = "stop";
> -
> -			status = "disabled";
> -
> -			remoteproc_adsp_glink: glink-edge {
> -				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
> -							     IPCC_MPROC_SIGNAL_GLINK_QMP
> -							     IRQ_TYPE_EDGE_RISING>;
> -				mboxes = <&ipcc IPCC_CLIENT_LPASS
> -						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> -
> -				label = "lpass";
> -				qcom,remote-pid = <2>;
> -
> -				gpr {
> -					compatible = "qcom,gpr";
> -					qcom,glink-channels = "adsp_apps";
> -					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> -					qcom,intents = <512 20>;
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> -
> -					q6apm: service@1 {
> -						compatible = "qcom,q6apm";
> -						reg = <GPR_APM_MODULE_IID>;
> -						#sound-dai-cells = <0>;
> -						qcom,protection-domain = "avs/audio",
> -									 "msm/adsp/audio_pd";
> -
> -						q6apmdai: dais {
> -							compatible = "qcom,q6apm-dais";
> -							iommus = <&apps_smmu 0x1801 0x0>;
> -						};
> -
> -						q6apmbedai: bedais {
> -							compatible = "qcom,q6apm-lpass-dais";
> -							#sound-dai-cells = <1>;
> -						};
> -					};
> -
> -					q6prm: service@2 {
> -						compatible = "qcom,q6prm";
> -						reg = <GPR_PRM_MODULE_IID>;
> -						qcom,protection-domain = "avs/audio",
> -									 "msm/adsp/audio_pd";
> -
> -						q6prmcc: clock-controller {
> -							compatible = "qcom,q6prm-lpass-clocks";
> -							#clock-cells = <2>;
> -						};
> -					};
> -				};
> -
> -				fastrpc {
> -					compatible = "qcom,fastrpc";
> -					qcom,glink-channels = "fastrpcglink-apps-dsp";
> -					label = "adsp";
> -					qcom,non-secure-domain;
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> -
> -					compute-cb@3 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <3>;
> -						iommus = <&apps_smmu 0x1803 0x0>;
> -					};
> -
> -					compute-cb@4 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <4>;
> -						iommus = <&apps_smmu 0x1804 0x0>;
> -					};
> -
> -					compute-cb@5 {
> -						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <5>;
> -						iommus = <&apps_smmu 0x1805 0x0>;
> -					};
> -				};
> -			};
> -		};
> -
>   		remoteproc_cdsp: remoteproc@32300000 {
>   			compatible = "qcom,sm8450-cdsp-pas";
>   			reg = <0 0x32300000 0 0x1400000>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

