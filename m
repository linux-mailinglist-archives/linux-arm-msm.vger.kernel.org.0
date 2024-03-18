Return-Path: <linux-arm-msm+bounces-14354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D564087E541
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 09:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F7F4B20C95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 08:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B272D28DCA;
	Mon, 18 Mar 2024 08:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nSe6UA7H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FA428DAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710751951; cv=none; b=WROS7ggWj8h3RhDvmdeokgms29GjXCfHp19cAydCfDlGrj6XykAjK38gcmZT4O+J0Q4XSj793ciLaeYMhPkIbY/x20Lt4sCx8h52fvHNcKXqihTWK7Mj/7okKyQxGv41MukTnEI6oX1qMI/oA0ANCMzlo1NyA1a2ZPZ4MiS1YHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710751951; c=relaxed/simple;
	bh=GUiZOljZZCQ6KLDONbeZl1yR9+RFtSZ/NilXA1E2+dU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tzyzySby8XsY0qrXFBAq110JuNXpPeKh7KzO0pRTI/8P7lHdcQxQMYpesmYAeh6oqJ82GAQBWbKHEqHOaL/TEP8ZvRSCJEGNpNYt+4TE+huMeJyzpya7rTdvhNnqry/o9T0+xkL5mu5LE8It+9smUCLenNGyjIsrneYMOxdMe9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nSe6UA7H; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-341730bfc46so428362f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 01:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710751947; x=1711356747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6UMWdi6YpiZ/NlXwld8jB4DogbMlixTU7wdJd6oBLQ=;
        b=nSe6UA7HonLd0Ooze21vZUWD6BFM9+Px/rSvG9Zye9v4VLSaPB6txhtxE0P2uW8Ve0
         ouTAFPvDK+MviBH0fzo8RzzGTe156JkZaF967uSQ0A92WCjTdlMpq3PeAGpZ/B86cCiN
         Cw+rZGGutBY/O1NU6RpWwKsli1TZUiUDy/1+IZ5sG8pQOuchXPVD7amv8OHK0XSIvOLu
         E7YPorWjE51GuTSPmWSPlQ2q9sClUViX82s4+ivAIeUf2qjiUvu5hQqINGuUYy5sGCaY
         aWng1j+8t9MBkW5O4SUtTkEHyZ6qiGSxi5taaQEcteDsFXLP1SyEZ+50VzdWtllZCNIW
         Am9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710751947; x=1711356747;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i6UMWdi6YpiZ/NlXwld8jB4DogbMlixTU7wdJd6oBLQ=;
        b=mEjYOeLeOWj9XF6TsQqGInkFGWNJ3b2aQXOcqVmmDemOY+qXQPFfc4l8FvJcaWMgeB
         r054K1CojN7ps3NAaDmoRrGQqGCTeYUef+zknk+eCs2hzHHQL8vE/7rKh1PpdvOfVH6L
         5taPRe4+T03yJDfiD4F5Xlc1Fb1uRa1wTIssssOabvIsVdva/u5apcBLB0ZqVUCuIyBo
         hs2gUdPIe4sdDjrGrXDLmX0Rs1Bxb5EKJ8p1G+TVa9Cqm6d0pS6sfjnX3Rq7wfcLkxsV
         S3WLHFz0xXptS/5b0wA/WPVcTptRGbxtPP3gm1FkhwRT3QtffWKQcBOOEknepk/rTrwC
         sCSw==
X-Gm-Message-State: AOJu0YxE5FMfV+4pi5p2y2IuvH/B+AqO3LMAsw811TAf7RfRQXwsQ8WE
	vNP8zuBTdGBTAchP24jtcBW6pTPG6kdjWud4WEXTDB81J/ZyWrSdZoSjxujdkHQ=
X-Google-Smtp-Source: AGHT+IHRvjid4hGA5bSp2QT33q7Uk/lS6mc/wJi4SYdJbLsVnz9me859Z6q5uU7ai/HgxCiOEJ82Dg==
X-Received: by 2002:adf:fa4d:0:b0:33e:c5fd:662b with SMTP id y13-20020adffa4d000000b0033ec5fd662bmr7996520wrr.4.1710751947023;
        Mon, 18 Mar 2024 01:52:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc? ([2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc])
        by smtp.gmail.com with ESMTPSA id i7-20020a5d5587000000b0033ec68dd3c3sm9289562wrv.96.2024.03.18.01.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 01:52:26 -0700 (PDT)
Message-ID: <869e106f-b953-4615-8dc2-bf200af6f3d9@linaro.org>
Date: Mon, 18 Mar 2024 09:52:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550: Fix the msi-map entries
Content-Language: en-US, fr
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240318-pci-bdf-sid-fix-v1-0-acca6c5d9cf1@linaro.org>
 <20240318-pci-bdf-sid-fix-v1-2-acca6c5d9cf1@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20240318-pci-bdf-sid-fix-v1-2-acca6c5d9cf1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2024 08:19, Manivannan Sadhasivam wrote:
> While adding the GIC ITS MSI support, it was found that the msi-map entries
> needed to be swapped to receive MSIs from the endpoint.
> 
> But later it was identified that the swapping was needed due to a bug in
> the Qualcomm PCIe controller driver. And since the bug is now fixed with
> commit bf79e33cdd89 ("PCI: qcom: Enable BDF to SID translation properly"),
> let's fix the msi-map entries also to reflect the actual mapping in the
> hardware.
> 
> Fixes: 114990ce3edf ("arm64: dts: qcom: sm8550: Use GIC-ITS for PCIe0 and PCIe1")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 3904348075f6..3348bc06db48 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1755,9 +1755,8 @@ pcie0: pcie@1c00000 {
>   					<&gem_noc MASTER_APPSS_PROC 0 &cnoc_main SLAVE_PCIE_0 0>;
>   			interconnect-names = "pcie-mem", "cpu-pcie";
>   
> -			/* Entries are reversed due to the unusual ITS DeviceID encoding */
> -			msi-map = <0x0 &gic_its 0x1401 0x1>,
> -				  <0x100 &gic_its 0x1400 0x1>;
> +			msi-map = <0x0 &gic_its 0x1400 0x1>,
> +				  <0x100 &gic_its 0x1401 0x1>;
>   			iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
>   				    <0x100 &apps_smmu 0x1401 0x1>;
>   
> @@ -1867,9 +1866,8 @@ pcie1: pcie@1c08000 {
>   					<&gem_noc MASTER_APPSS_PROC 0 &cnoc_main SLAVE_PCIE_1 0>;
>   			interconnect-names = "pcie-mem", "cpu-pcie";
>   
> -			/* Entries are reversed due to the unusual ITS DeviceID encoding */
> -			msi-map = <0x0 &gic_its 0x1481 0x1>,
> -				  <0x100 &gic_its 0x1480 0x1>;
> +			msi-map = <0x0 &gic_its 0x1480 0x1>,
> +				  <0x100 &gic_its 0x1481 0x1>;
>   			iommu-map = <0x0   &apps_smmu 0x1480 0x1>,
>   				    <0x100 &apps_smmu 0x1481 0x1>;
>   
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD

