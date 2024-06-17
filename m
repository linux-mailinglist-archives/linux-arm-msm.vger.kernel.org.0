Return-Path: <linux-arm-msm+bounces-22904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABED90B43D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 17:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B815B3D8A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 15:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A615D13B288;
	Mon, 17 Jun 2024 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0Lz19i7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E3F13AD3D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718633326; cv=none; b=sy+2KLureBAzixRm9v5uGdMHxdE9fSPvDQUNNhk4v74lMiQ2dAXXW43/+4RZ5DnmxpaZAHetbzzWH/hPcjMYvO0DBxmtX9YmxahyX+cFHAq2GsGTwc2G5P5ePaC7kimndA7Jncs9mM450oDNOCa7L1s30dAS6TFbilC21juxt40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718633326; c=relaxed/simple;
	bh=6mBQ9sxPm1+L1muWwT/oZLH3YefinaTlBp76n9Qq3EY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pOFRKmbSMNdZOd/6WibML8OJKLJ9pROFee6hVyvn4HxJuGSpDnGyhcEbTYfl7ucVbQ74GnI9ivqyFVCK2qyIZPoD5jVtWDG88FdCRlepUm/KzRHhIuXKooOPAyrGfiJnIc2ERIgf+xcdQFvESAVLF4qcxCIxjve2G1/72qoSmb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g0Lz19i7; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c525257feso5710918e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 07:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718633323; x=1719238123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ut1uDZxGaHU7Y1Co+4s4ECfaXa9r8CDK31+uMSSSBQA=;
        b=g0Lz19i7JNUpp+a+M+0n38TfdaU+hj+eO0Xky1W1Hsm+yC80uOnD5Bf8NGY/NweFZ1
         O0IxT2SMPmKUTxFFgPWxACCjtm7vjq8ew+TOL4wes5HbV2oQcYaKWZFHnax28UtwweU2
         JFCkka1X8600fTY/63SVBWZDypm43H24/rJssLtczhAG1jq025a4vH5w4wcwx8zMI+7m
         HGB2UC0lpcLAsY3h3w/vz7K+T+8VOFGgXBAJpF6FWsopk7k4JBIEnI1pm57U3AXrzrq0
         dJQq6gcU1ezoUeXf14K1gG2WjF7uvsiY0n7g4LBH/Adtfa79h9fmWydb2LWIi+TdD2WY
         zmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718633323; x=1719238123;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ut1uDZxGaHU7Y1Co+4s4ECfaXa9r8CDK31+uMSSSBQA=;
        b=goY55RoFDP2Ir1hsTn83nAjf3dOBi+sKPYFkkoA+da+npSvYYCfhen0ao59JlYBcnT
         pq17kI3D25WPsfelHX+yOWpB65XAiAv3AQQWqueyvZzyILzddeaqz2vFfnmyo79Pw4+M
         ajH0/h+H4NDnpLuoAABSKKjQZs5Uh6ehLw2kLCAzhsrnneZuE7PoVifXliYFYQbJ6U1u
         T0Q2S0Xh3KBuVmiaD0UwzBdCCdh4b1EPuzY6MlSPkTooWACNwqJvIRCAV/XvQb+E1+Ni
         bQqsf8z5q5jAgKDdGgHOouWgVsYC431gCvB7IDKuKbmHSAMsMxZXZq/ijZSiOcApR9o/
         V5Eg==
X-Gm-Message-State: AOJu0YxNW819rfjXGw/lQUr57675uZMfbLbMgL68Y+0/u36NE+7Yzf5i
	Gw83FfhJ2GFZlKmb5WgKR1C3AJ5UWKBwOIohlSQUTwQhRjLpy+U6G7kb9ifibA0=
X-Google-Smtp-Source: AGHT+IGf9az8bnelhhdQwXy6LIcfqWaXA9MCm6Bpzt1+j6XVLA3GxRhXjKny8rZdplSvoN+HlphXCw==
X-Received: by 2002:ac2:46e3:0:b0:52b:7d16:2c7a with SMTP id 2adb3069b0e04-52ca6e55d4bmr6687102e87.3.1718633322602;
        Mon, 17 Jun 2024 07:08:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7f86:d83c:9278:7757? ([2a01:e0a:982:cbb0:7f86:d83c:9278:7757])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm11893173f8f.107.2024.06.17.07.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 07:08:42 -0700 (PDT)
Message-ID: <11999928-b536-4257-980d-f98ca55285d6@linaro.org>
Date: Mon, 17 Jun 2024 16:08:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] dt-bindings: iommu: qcom,iommu: Add MSM8953 GPU IOMMU
 to SMMUv2 compatibles
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240606-topic-sm8953-upstream-smmu-gpu-v2-1-67be88007d87@linaro.org>
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
In-Reply-To: <20240606-topic-sm8953-upstream-smmu-gpu-v2-1-67be88007d87@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/06/2024 15:15, Neil Armstrong wrote:
> Add MSM8953 compatible string with "qcom,msm-iommu-v2" as fallback
> for the MSM8953 GPU IOMMU which is compatible with Qualcomm's secure
> fw "SMMU v2" implementation.

Gentle ping !

Thanks,
Neil

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> [1] https://lore.kernel.org/all/20240523-topic-sdm450-upstream-tbx605f-v1-0-e52b89133226@linaro.org/
> ---
>   Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
> index a74eb899c381..571e5746d177 100644
> --- a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
> @@ -25,6 +25,7 @@ properties:
>             - const: qcom,msm-iommu-v1
>         - items:
>             - enum:
> +              - qcom,msm8953-iommu
>                 - qcom,msm8976-iommu
>             - const: qcom,msm-iommu-v2
>   
> 
> ---
> base-commit: ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
> change-id: 20240606-topic-sm8953-upstream-smmu-gpu-2b582c34bcb6
> 
> Best regards,


