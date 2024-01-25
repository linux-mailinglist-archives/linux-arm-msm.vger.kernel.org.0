Return-Path: <linux-arm-msm+bounces-8351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177783CF46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B55FC1C23F44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A373613B797;
	Thu, 25 Jan 2024 22:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OzAIjlk7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B872413AA44
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 22:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706221505; cv=none; b=tDHXKSd5W9G/Uyl1XCrCCMHlEEUKfak8O+n1zTVVxozrPLNIiJ+YIwa+mkymUbM7J3Kz0xjdEGIXFzMamGaQYwqgVXdVMSfH3EwV5jR3F5rH/QSVmQSwbtT0qGZclB7AcbxtIeed4YMBrHx0pzEW1EXtYfq92EF2hs6N8FpGCRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706221505; c=relaxed/simple;
	bh=ZG1tB5kx8b26egBLx0eNurCR3uXvicaFKUPIGtwPFFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OhvpnUCEPDazR32q7U3dQs7Z/Wfq3wXO16wVZjGO3Xj9JmhRA5eStu8dJxSWljNXTfaWpkk96GhNka4wB289vVrW9Yn2ZFnE0cM1ZsWZRTVB7g19u04MPKkhPkfYQXVsyTWyaGUmSVuC9sFnYDtUyU9pKmY8x1joBb5nXdKtVKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OzAIjlk7; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so8121838e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 14:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706221501; x=1706826301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PnHxRA6UeYz2yws2MprKM/M5YmL3to/A8lLiCFE7s+Q=;
        b=OzAIjlk7jfjD6FRi/YJ4ePwplGe/0TWSyYhMER5ux8oOt6G/fmlWk+0mVHQx1FAxOS
         P/sa91gCQYc88VGuvDMewTgcFWtLT4TZqyOAvZGo/1OOgQhVy94RHa9s2oxC4MYR8pLt
         IdPw3Qmnqh3ts3jWSKOV6fP3AqgVHTz0TGY4g6ZFoh9qLvBJBhcCV99xfUT7Hl5RiYxv
         1YALPrLfPnz5yr2vzlNTRnW16TYzYk4i9OL72KaGaLNIqS2+cIMUR0qCB8RYiZplGNTp
         7Y6NfyujYAM7c1MuUINZbVBWYbimTdZtKJrNjpZJmKE461uacss0gLtdhmKcLKsDIRKz
         eYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706221501; x=1706826301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PnHxRA6UeYz2yws2MprKM/M5YmL3to/A8lLiCFE7s+Q=;
        b=kEVsH1I6FftSeeKrEFmyR+LMkrLviE3nb0qXkSgEBuaDyQcgydhPu1IXxiOTWWlflO
         Ibc8kk6jAg8m9hLiJKFvGd0AS42ONCPUDjN2S86pgMiuwhyhFeXyDmoJojWCfNtunoIT
         B1yduxlNUU0td1yggnTGzBZpy9yXmf1lghavspJZ4HmI+2Yy4cveRuk3Bo7K5fxItenq
         fOmFbfv7IZFlIWiVllUGOgG9YOzEPpuQDxdAvNnFfEAAjRPFdP/vExd/2k5ZP3QR4YHp
         2U61bFb+pnjGMNcjiBrwU1QLmx2oTpplOhpWixsqQHEvT3tqbeVoAAKKN8oG7YcVRjfC
         cpUA==
X-Gm-Message-State: AOJu0Yy+W9U6WTpVcJKxOez36LN/mndrW17omSyWVjUA+2KNfgSx8Ugp
	q0XjL+txg/SNTlalc1ut3vbRUQ2VnTxmhnASs3HfXXBFUu4rCM7SnQdQLoNF0YpZlSljvOFYpYL
	7
X-Google-Smtp-Source: AGHT+IHFHx1hqcIW+TTLcRLrBkrqSvADlhOQQRVbxmAJZZ0FiUTvCtUwZug1+XEzJ3XZFOgWAvpNrQ==
X-Received: by 2002:ac2:5ded:0:b0:510:171a:40c4 with SMTP id z13-20020ac25ded000000b00510171a40c4mr306346lfq.6.1706221500675;
        Thu, 25 Jan 2024 14:25:00 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi28-20020a0565120e9c00b00510220e251csm111794lfb.47.2024.01.25.14.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 14:25:00 -0800 (PST)
Message-ID: <d576e655-5d00-44ff-9405-0fceaa2d3935@linaro.org>
Date: Fri, 26 Jan 2024 00:24:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] arm64: dts: qcom: msm8953: Add GPU IOMMU
Content-Language: en-GB
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240125-msm8953-gpu-v1-0-f6493a5951f3@z3ntu.xyz>
 <20240125-msm8953-gpu-v1-1-f6493a5951f3@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125-msm8953-gpu-v1-1-f6493a5951f3@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 23:56, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add the IOMMU used for the GPU on MSM8953.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/msm8953.dtsi | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index dcb5c98b793c..91d083871ab0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -1046,6 +1046,37 @@ mdss_dsi1_phy: phy@1a96400 {
>   			};
>   		};
>   
> +		gpu_iommu: iommu@1c48000 {

Nit: most of the platforms use the adreno_smmu label. But maybe the 
msm-iommu vs arm-smmu makes difference here.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +			compatible = "qcom,msm8953-iommu", "qcom,msm-iommu-v2";
> +			ranges = <0 0x01c48000 0x8000>;
> +
> +			clocks = <&gcc GCC_OXILI_AHB_CLK>,
> +				 <&gcc GCC_BIMC_GFX_CLK>;
> +			clock-names = "iface", "bus";
> +
> +			power-domains = <&gcc OXILI_CX_GDSC>;
> +
> +			qcom,iommu-secure-id = <18>;
> +
> +			#address-cells = <1>;
> +			#iommu-cells = <1>;
> +			#size-cells = <1>;
> +
> +			/* gfx3d_user */
> +			iommu-ctx@0 {
> +				compatible = "qcom,msm-iommu-v2-ns";
> +				reg = <0x0000 0x1000>;
> +				interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			/* gfx3d_secure */
> +			iommu-ctx@2000 {
> +				compatible = "qcom,msm-iommu-v2-sec";
> +				reg = <0x2000 0x1000>;
> +				interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +
>   		apps_iommu: iommu@1e20000 {
>   			compatible = "qcom,msm8953-iommu", "qcom,msm-iommu-v1";
>   			ranges = <0 0x01e20000 0x20000>;
> 

-- 
With best wishes
Dmitry


